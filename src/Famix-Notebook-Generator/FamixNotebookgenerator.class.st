Class {
	#name : 'FamixNotebookgenerator',
	#superclass : 'FamixBasicInfrastructureGenerator',
	#instVars : [
		'notebook',
		'cell',
		'textCell',
		'codeCell',
		'output',
		'pythonEntity',
		'pythonModel'
	],
	#category : 'Famix-Notebook-Generator',
	#package : 'Famix-Notebook-Generator'
}

{ #category : 'accessing' }
FamixNotebookgenerator class >> packageName [

	^ #'Famix-Notebook-Entities'
]

{ #category : 'accessing' }
FamixNotebookgenerator class >> prefix [

	^ #FamixNotebook
]

{ #category : 'accessing' }
FamixNotebookgenerator class >> submetamodels [

	^ { FamixPythonGenerator }
]

{ #category : 'definition' }
FamixNotebookgenerator >> defineClasses [

	super defineClasses.

	notebook := builder newClassNamed: #Notebook.
	cell := builder newAbstractClassNamed: #Cell.
	textCell := builder newClassNamed: #TextCell.
	codeCell := builder newClassNamed: #CodeCell.
	output := builder newClassNamed: #Output.

	"remote"
	pythonEntity := self remoteEntity: #Entity withPrefix: #FamixPython.
	pythonModel := self remoteEntity: #Entity withPrefix: #FamixPython
]

{ #category : 'definition' }
FamixNotebookgenerator >> defineHierarchy [

	super defineHierarchy.

	notebook --|> namedEntity. 

	codeCell --|> cell.
	codeCell --|> #TSourceEntity.
	"codeCell --|> sourcedEntity." "Code precedent ne casse pas mais le model semble ne pas etre bon => pas d'heritage multiple" 
	
	textCell --|> cell.
	"Devrait probablement utiliser TSourceEntity egalement"
]

{ #category : 'definition' }
FamixNotebookgenerator >> defineProperties [

	super defineProperties.
	
	notebook property: #metadata type: #Object.
	
	cell property: #id type: #String.
	cell property: #metadata type: #Object.
	
	textCell property: #isMarkdown type: #Boolean.
	textCell property: #content type: #String.
	
	codeCell property: #executionCount type: #Number.
	
	output property: #metadata type: #Object.
	output property: #data type: #Object.
	output property: #output_type type: #String.
	self flag: #todo. " output_type should probably moved in an entity"
	"We also have another execution count in output should check what it is"
	
	
]

{ #category : 'definition' }
FamixNotebookgenerator >> defineRelations [

	super defineRelations.
	
	notebook <>-* cell.
	notebook - pythonModel. 
	
	codeCell -* pythonEntity.
	codeCell - output. 
]
