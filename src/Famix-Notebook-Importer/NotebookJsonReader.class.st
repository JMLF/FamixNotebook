Class {
	#name : 'NotebookJsonReader',
	#superclass : 'Object',
	#instVars : [
		'rows',
		'cells',
		'orient',
		'parseMap',
		'model',
		'filename'
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

	| source  fileReference |
	source := sourceAnchor sourceText. 
		
	"We havn't a file so we need to use pythonImporter on string directly"
	model := FamixPythonImporter new importPythonString: source. 
	1halt
	
	self flag: #todo.
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
		model := FamixNotebookModel new name: filename; yourself. "ici on passe une entite qui englobante et on a plus besoin de l'entite Notebook"
		cells := json at: 'cells' .
		cells do: [:cell | self parseFromcell: cell]]
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
