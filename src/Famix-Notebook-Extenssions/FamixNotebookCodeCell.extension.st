Extension { #name : 'FamixNotebookCodeCell' }

{ #category : '*Famix-Notebook-Extenssions' }
FamixNotebookCodeCell >> mooseNameOn: aStream [

	aStream nextPutAll: 'cell-',(cellId asString). 
]
