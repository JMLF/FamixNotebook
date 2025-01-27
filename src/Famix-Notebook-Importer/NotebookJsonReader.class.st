Class {
	#name : 'NotebookJsonReader',
	#superclass : 'Object',
	#instVars : [
		'rows',
		'cells',
		'orient',
		'parseMap',
		'model',
		'filename',
		'fileReference'
	],
	#category : 'Famix-Notebook-Importer',
	#package : 'Famix-Notebook-Importer'
}

{ #category : 'instance creation' }
NotebookJsonReader >> createCodeCell: cell [

	| famixNBCell outputs sourceAnchor pythonEntities |
	famixNBCell := FamixNotebookCodeCell new
		               mooseModel: model;
		               executionCount: (cell at: 'execution_count');
		               id: (cell at: 'id');
		               metadata: (cell at: 'metadata');
		               "ToDo ajouter la construction des pythonEntite a partir du source"
			               yourself.

	outputs := (cell at: 'outputs') ifNotNil: [ :outputs |
		           outputs collect: [ :output | self createOutput: output ] ].
	outputs ifNotEmpty: [
		outputs do: [ :famixNBOutput | famixNBCell output: famixNBOutput ] ].
	
	sourceAnchor := self createSourceAnchor: (cell at: 'source').
	famixNBCell sourceAnchor: sourceAnchor. 
	
	pythonEntities := self createPythonEntities: sourceAnchor. 
	"see if it work -> does not"
	self flag: #fixme.
	"link between python entities and code cell need some work"
	pythonEntities ifNotEmpty: [ pythonEntities do: [:entity | famixNBCell addEntity: entity] ].
	

]

{ #category : 'instance creation' }
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

	| source  fileReference pythonModel |
	source := sourceAnchor sourceText. 
		
	"We havn't a file so we need to use pythonImporter on string directly"
	"model := FamixPythonImporter new importPythonString: source. "
	
	"Not great but we can also create a tmp file with our source to get a fileReference to parse"
	fileReference := FileReference newTempFilePrefix: 'pythonNB-' suffix: '-entity.py'.

	fileReference writeStreamDo: [ :stream | stream nextPutAll: source ].
	pythonModel := FamixPythonImporter import: fileReference.
	"1halt."
	^pythonModel.
	
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

{ #category : 'instance creation' }
NotebookJsonReader >> parseFromcell: cell [

	(cell at: 'cell_type') = 'code'
		ifTrue: [ self createCodeCell: cell ]
		ifFalse: [ self createMarkdownCell: cell ]
]

{ #category : 'instance creation' }
NotebookJsonReader >> read: json [
	"Loads parsed json"

	json ifEmpty: [ cells := #(  ) ] ifNotEmpty: [
		model := FamixNotebookModel new
			         name: filename;
			         yourself. 
		cells := json at: 'cells'.

		"tmp file to store the complete notebook"
		fileReference := FileReference
			                 newTempFilePrefix: 'pythonfullNB-'
			                 suffix: '-entity.py'.
		fileReference writeStreamDo: [ :stream |
			cells do: [ :cell |
				(cell at: 'cell_type') = 'code' ifTrue: [
					(cell at: 'source') do: [ :line |
						stream
							nextPutAll: line; cr
							 "maybe not cr on each line but a cr after a cell" ] ] ] ].
		"1 halt."

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
