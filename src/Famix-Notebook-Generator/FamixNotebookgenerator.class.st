Class {
	#name : 'FamixNotebookgenerator',
	#superclass : 'FamixBasicInfrastructureGenerator',
	#instVars : [
		'notebook',
		'cell',
		'textCell',
		'codeCell',
		'output'
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

{ #category : 'definition' }
FamixNotebookgenerator >> defineClasses [

	super defineClasses.

	notebook := builder newClassNamed: #Notebook.
	cell := builder newAbstractClassNamed: #cell.
	textCell := builder newClassNamed: #textCell.
	codeCell := builder newClassNamed: #codeCell.
	output := builder newClassNamed: #output. 
]

{ #category : 'definition' }
FamixNotebookgenerator >> defineHierarchy [

	super defineHierarchy.

	codeCell --|> cell.
	textCell --|> cell.
	codeCell --|> #TSourceEntity.
	"codeCell --|> sourcedEntity." "Code precedent ne casse pas mais le model semble ne pas etre bon => pas d'heritage multiple" 
]

{ #category : 'definition' }
FamixNotebookgenerator >> defineProperties [

	super defineProperties.
	
	cell property: #id type: #String.
	
	textCell property: #isMarkdown type: #Boolean.
	textCell property: #content type: #String.
	
	codeCell property: #executionCount type: #Number.
	
	
]

{ #category : 'definition' }
FamixNotebookgenerator >> defineRelations [

	super defineRelations
]
