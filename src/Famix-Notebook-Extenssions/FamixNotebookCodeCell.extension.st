Extension { #name : 'FamixNotebookCodeCell' }

{ #category : '*Famix-Notebook-Extenssions' }
FamixNotebookCodeCell >> mooseNameOn: aStream [
1halt.
	aStream nextPutAll: 'cell-',(cellId asString). 
]
