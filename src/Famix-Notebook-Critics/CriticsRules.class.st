Class {
	#name : 'CriticsRules',
	#superclass : 'Object',
	#category : 'Famix-Notebook-Critics',
	#package : 'Famix-Notebook-Critics'
}

{ #category : 'as yet unclassified' }
CriticsRules >> allCodeCells: aNotebookModel [

 ^ aNotebookModel select: [ :e | e class = FamixNotebookCodeCell ]
]

{ #category : 'as yet unclassified' }
CriticsRules >> topTopBottomExection: aNotebookModel [

	| allCodeCells index res |
	allCodeCells := self allCodeCells: aNotebookModel.

	index := 0.
	res := allCodeCells reject: [ :cc |
		       | test |
		       cc executionCount ifNil: [ true ] ifNotNil: [
			       test := cc executionCount >= index.
			       index := cc executionCount.
			       test ] ].

	"Peut etre renvoyer une collection des cellule en violation pour l'export"
	^ res isEmpty
]
