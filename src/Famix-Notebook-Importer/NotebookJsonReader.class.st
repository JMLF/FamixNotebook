"
# Usage :

file := '/Users/mignard/Documents/work/mooseDemo/pythonvarusage/Split_with_train_override.ipynb' asFileReference.

nbJsonReader := NotebookJsonReader new.
nbJsonReader readFrom: file.

""To get the build python model :""
nbJsonReader pythonModel 
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
NotebookJsonReader >> allModelEntitiesFrom: startPos to: endPos [

	| sA entities |
	sA := pythonModel allWithType: FamixPythonIndexedFileAnchor.
	entities := sA select: [ :e |
		            e startPos > startPos and: [ e startPos < endPos ] ].
	^ entities collect: [ :e | e element ]
]

{ #category : 'as yet unclassified' }
NotebookJsonReader >> createCodeCell: cell [

	| famixNBCell outputs startPos endPos entities sourceAnchor |
	famixNBCell := FamixNotebookCodeCell new
		               mooseModel: model;
		               executionCount: (cell at: 'execution_count');
		               id: (cell at: 'id' ifAbsent: [ 'null' ]);
		               cellId: current_cell;
		               metadata: (cell at: 'metadata');
		               yourself.

	outputs := (cell at: 'outputs') ifNotNil: [ :outputs |
		           outputs collect: [ :output | self createOutput: output ] ].
	outputs ifNotEmpty: [
		outputs do: [ :famixNBOutput | famixNBCell output: famixNBOutput ] ].


	startPos := self currentCellStartPos.
	endPos := self nextCellStartPos.
	current_cell := current_cell + 1.

	entities := self allModelEntitiesFrom: startPos to: endPos.
	entities do: [ :entity | famixNBCell addEntity: entity ].
"	1halt."
	sourceAnchor := self createSourceAnchor: (cell at: 'source').
	famixNBCell sourceAnchor: sourceAnchor
]

{ #category : 'as yet unclassified' }
NotebookJsonReader >> createMarkdownCell: cell [ 

	| famixNBCell sourceAnchor |
	famixNBCell := FamixNotebookTextCell new
		               mooseModel: model;
		               isMarkdown: true;
		               id: (cell at: 'id' ifAbsent: [ 'null' ]);
		               "ToDo ajouter l'id dans le MM"
							metadata:(cell at: 'metadata');
		               content: (cell at: 'source');
		               yourself.
	
	sourceAnchor := self createSourceAnchor: (cell at: 'source').
	famixNBCell sourceAnchor: sourceAnchor
]

{ #category : 'as yet unclassified' }
NotebookJsonReader >> createOutput: anOutput [ 

	| famixNBOutput |
	famixNBOutput := FamixNotebookOutput new
		               mooseModel: model;
							data: (anOutput at: 'data' ifAbsent: ['null']);
							metadata: (anOutput at: 'metadata' ifAbsent: ['null']);
							output_type: (anOutput at: 'output_type' ifAbsent: ['null']);
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
NotebookJsonReader >> createSourceAnchor: aSource [
	"Sould refacto this to merge logic from writeCodeCells and this"

	| sourceText sourceAnchor |
	self flag: #TODO. "Regler cette affaire de choix par class, suivant certain notebook on est sur des sting different "
	sourceText := (aSource class = ByteString or: [
		               aSource class = WideString ])
		              ifTrue: [ aSource asString ]
		              ifFalse: [
			              String streamContents: [ :stream |
				              aSource do: [ :each | stream nextPutAll: each ] ] ].

	^ sourceAnchor := FamixNotebookSourceTextAnchor new
		                  source: sourceText;
		                  yourself
]

{ #category : 'as yet unclassified' }
NotebookJsonReader >> currentCellStartPos [

	| current_comment startPos |
	"Smacc renvoi les comment avec un cr, c'est pourquoi pas de = directement"
	current_comment := pythonModel allComments select: [ :c |
		                   c sourceText includesSubstring:
			                   '#cell-' , current_cell asString ].
	self flag: #todo.
	"Il faudrait gerer le cas ou l'on a plus d'un resultat pour le current comment"
	^ startPos := current_comment first sourceAnchor startPos
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

{ #category : 'as yet unclassified' }
NotebookJsonReader >> nextCellStartPos [

	| current_comment startPos |
	"Smacc renvoi les comment avec un cr, c'est pourquoi pas de = directement"
	current_comment := pythonModel allComments select: [ :c |
		                   c sourceText includesSubstring:
			                   '#cell-' , (current_cell + 1) asString ].
	self flag: #todo.
	"Il faudrait gerer le cas ou l'on a plus d'un resultat pour le current comment"
	current_comment ifEmpty: [
		^ pythonModel allModules first sourceAnchor endPos ].
	^ startPos := current_comment first sourceAnchor startPos
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

	| nbformat nbminor |
	json ifEmpty: [ cells := #(  ) ] ifNotEmpty: [
		model := FamixNotebookModel new
			         name: filename;
			         yourself.

		nbformat := json at: 'nbformat' ifAbsent: [ 4 ].
		nbminor := json at: 'nbformat_minor' ifAbsent: [ 1 ].

		cells := json at: 'cells'.

		"tmp file to store the complete notebook"
		fileReference := FileReference
			                 newTempFilePrefix: 'pythonfullNB-'
			                 suffix: '-entity.py'.

		self writeCodeCells: fileReference.

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

{ #category : 'writing' }
NotebookJsonReader >> writeCodeCells: fileReference [
	"From code cells, this will add all the sources in fileReference with comments separators"

	| i |
	i := 0.
	fileReference writeStreamDo: [ :stream |
		cells do: [ :cell |
			(cell at: 'cell_type') = 'code' ifTrue: [
				stream
					nextPutAll: '#cell-' , i asString;
					cr.
				"Sometimes the source code is a single String and sometimes a List[String]"
				self flag: #TODO. "Same as sourceAnchor and others class check is not so great"
				((cell at: 'source') class = ByteString or: [
					 (cell at: 'source') class = WideString ])
					ifTrue: [ stream nextPutAll: (cell at: 'source') ]
					ifFalse: [
					(cell at: 'source') do: [ :line | stream nextPutAll: line ] ].
				i := i + 1.
				stream cr ] ] ]
]

{ #category : 'writing' }
NotebookJsonReader >> writeCodeCellsAsLinesTo: fileReference [
	"From code cells, this will add all the sources in fileReference with comments separators"

	| i |
	self
		deprecated: 'Use writeCodeCells: instead of current one'
		on: '16 April 2025'
		in:
		'Pharo-12.0.0+SNAPSHOT.build.1570.sha.3dafb8a476dfe88afa5aa6bf7b148beb9c11003f (64 Bit)'.
	i := 0.
	fileReference writeStreamDo: [ :stream |
		cells do: [ :cell |
			(cell at: 'cell_type') = 'code' ifTrue: [
				stream
					nextPutAll: '#cell-' , i asString;
					cr.

				(cell at: 'source') class = ByteString
					ifTrue: [ stream nextPutAll: (cell at: 'source') ]
					ifFalse: [
					(cell at: 'source') do: [ :line | stream nextPutAll: line ] ].
				i := i + 1.
				stream cr ] ] ]
]

{ #category : 'writing' }
NotebookJsonReader >> writeCodeCellsAsSingleStringTo: fileReference [
	"From code cells, this will add all the sources in fileReference with comments separators (works on old versions of notebooks where the source code was stored as a single string in each cells)"

	| i |
	self
		deprecated: 'Use writeCodeCells: instead of current one'
		on: '16 April 2025'
		in:
		'Pharo-12.0.0+SNAPSHOT.build.1570.sha.3dafb8a476dfe88afa5aa6bf7b148beb9c11003f (64 Bit)'.
	i := 0.
	fileReference writeStreamDo: [ :stream |
		cells do: [ :cell |
			(cell at: 'cell_type') = 'code' ifTrue: [
				stream
					nextPutAll: '#cell-' , i asString;
					cr.
				stream nextPutAll: (cell at: 'source').
				i := i + 1.
				stream cr ] ] ]
]
