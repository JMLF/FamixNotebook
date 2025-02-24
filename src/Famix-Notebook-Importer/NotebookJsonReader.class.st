"
# Usage :

file := '/Users/mignard/Documents/work/mooseDemo/pythonvarusage/Split_with_train_override.ipynb' asFileReference.

NotebookJsonReader new readFrom: file.

"
Class {
	#name : 'NotebookJsonReader',
	#superclass : 'Object',
	#instVars : [
		'model',
		'cells',
		'filename',
		'fileReference',
		'pythonModel',
		'startLine',
		'current_cell'
	],
	#category : 'Famix-Notebook-Importer',
	#package : 'Famix-Notebook-Importer'
}

{ #category : 'as yet unclassified' }
NotebookJsonReader >> createCodeCell: cell [ 

	| famixNBCell outputs sourceAnchor pythonEntities startLine current_comment startPos |
	famixNBCell := FamixNotebookCodeCell new
		               mooseModel: model;
		               executionCount: (cell at: 'execution_count');
		               id: (cell at: 'id');
		               metadata: (cell at: 'metadata');
			               yourself.

	outputs := (cell at: 'outputs') ifNotNil: [ :outputs |
		           outputs collect: [ :output | self createOutput: output ] ].
	outputs ifNotEmpty: [
		outputs do: [ :famixNBOutput | famixNBCell output: famixNBOutput ] ].

	"Smacc renvoi les comment avec un cr, c'est pourquoi pas de = directement"
	current_comment := pythonModel allComments select: [ :c | (c content beginsWith: '#cell-') and: [ c content includesSubstring: (current_cell asString) ] ]. 
	"Il faudrait gerer le cas ou l'on a plus d'un resultat pour le current comment"
	startPos := current_comment first sourceAnchor startPos. 

	1halt.
	sourceAnchor := self createSourceAnchor: (cell at: 'source').
	famixNBCell sourceAnchor: sourceAnchor.


	pythonEntities := self createPythonEntities: sourceAnchor.
	"see if it work -> does not"
	self flag: #fixme.
	"link between python entities and code cell need some work"
	pythonEntities ifNotEmpty: [
		pythonEntities do: [ :entity | famixNBCell addEntity: entity ] ]
]

{ #category : 'as yet unclassified' }
NotebookJsonReader >> createMarkdownCell: cell [ 

	| famixNBCell |
	famixNBCell := FamixNotebookTextCell new
		               mooseModel: model;
		               isMarkdown: true;
		               id: (cell at: 'id');
		               "ToDo ajouter l'id dans le MM"
							metadata:(cell at: 'metadata');
		               content: (cell at: 'source');
		               yourself
]

{ #category : 'as yet unclassified' }
NotebookJsonReader >> createOutput: anOutput [ 

	| famixNBOutput |
	famixNBOutput := FamixNotebookOutput new
		               mooseModel: model;
							data: (anOutput at: 'data');
							metadata: (anOutput at: 'metadata');
							output_type: (anOutput at: 'output_type');
		               yourself.
	^famixNBOutput 	
]

{ #category : 'as yet unclassified' }
NotebookJsonReader >> createPythonEntities: sourceAnchor [ 

	| source  localfileReference pythonEntites |
	source := sourceAnchor sourceText. 
		
	"We havn't a file so we need to use pythonImporter on string directly"
	"model := FamixPythonImporter new importPythonString: source. "
	
	"Not great but we can also create a tmp file with our source to get a fileReference to parse"
	localfileReference := FileReference newTempFilePrefix: 'pythonCell-' suffix: '-entity.py'.

	localfileReference writeStreamDo: [ :stream | stream nextPutAll: source ].
	pythonEntites := FamixPythonImporter import: localfileReference.
	"1halt."
	^pythonEntites.
	
	self flag: #todo.
	"Update the python visitor to add a default module in the case we want to visit strings not files"
]

{ #category : 'as yet unclassified' }
NotebookJsonReader >> createSourceAnchor: aSourceArray [ 

	| sourceText sourceAnchor |
	sourceText := String streamContents: [ :stream |
		              aSourceArray do: [ :each | stream nextPutAll: each ] ].
	^ sourceAnchor := FamixNotebookSourceTextAnchor new
		                  source: sourceText;
		                  yourself
]

{ #category : 'initialization' }
NotebookJsonReader >> initialize [ 

	current_cell := 0
]

{ #category : 'accessing' }
NotebookJsonReader >> model [

	^ model
]

{ #category : 'accessing' }
NotebookJsonReader >> model: anObject [

	model := anObject
]

{ #category : 'parsing' }
NotebookJsonReader >> parseFromcell: cell [ 

	(cell at: 'cell_type') = 'code'
		ifTrue: [ self createCodeCell: cell ]
		ifFalse: [ self createMarkdownCell: cell ]
]

{ #category : 'accessing' }
NotebookJsonReader >> pythonModel [

	^ pythonModel
]

{ #category : 'accessing' }
NotebookJsonReader >> pythonModel: anObject [

	pythonModel := anObject
]

{ #category : 'meta-object-protocol' }
NotebookJsonReader >> read: json [ 
	"Loads parsed json"

	| i |
	json ifEmpty: [ cells := #(  ) ] ifNotEmpty: [
		model := FamixNotebookModel new
			         name: filename;
			         yourself.
		cells := json at: 'cells'.

		"tmp file to store the complete notebook"
		fileReference := FileReference
			                 newTempFilePrefix: 'pythonfullNB-'
			                 suffix: '-entity.py'.
			
		i := 0. "Find a better way to do that"	
		fileReference writeStreamDo: [ :stream |
			cells do: [ :cell |
				(cell at: 'cell_type') = 'code' ifTrue: [
					stream nextPutAll: '#cell-',(i asString); cr.
					(cell at: 'source') do: [ :line | 
						stream nextPutAll: line.].
					i := i + 1.
					stream cr. ] ] ].
		
		pythonModel := FamixPythonImporter import: fileReference.

		cells do: [ :cell | self parseFromcell: cell ] ]
]

{ #category : 'instance creation' }
NotebookJsonReader >> readFrom: aFileReference [ 
	| reader |

	filename := aFileReference basename. 
	reader := NeoJSONReader on: aFileReference readStream.
	self read: reader next.
	reader close.

	^ model
	"^ self createDataFrame"
]
