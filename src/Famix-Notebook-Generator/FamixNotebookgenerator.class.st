Class {
	#name : 'FamixNotebookgenerator',
	#superclass : 'FamixBasicInfrastructureGenerator',
	#instVars : [
		'notebook'
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

	notebook := builder newClassNamed: #Notebook
]

{ #category : 'definition' }
FamixNotebookgenerator >> defineHierarchy [

	super defineHierarchy. 
]

{ #category : 'definition' }
FamixNotebookgenerator >> defineProperties [

	super defineProperties
]

{ #category : 'definition' }
FamixNotebookgenerator >> defineRelations [

	super defineRelations
]
