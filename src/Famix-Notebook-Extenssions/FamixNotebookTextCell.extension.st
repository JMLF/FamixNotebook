Extension { #name : 'FamixNotebookTextCell' }

{ #category : '*Famix-Notebook-Extenssions' }
FamixNotebookTextCell >> mooseNameOn: aStream [

aStream nextPutAll: (content asString contractTo: 30). 
]
