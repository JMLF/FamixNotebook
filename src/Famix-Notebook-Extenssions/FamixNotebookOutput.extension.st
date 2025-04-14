Extension { #name : 'FamixNotebookOutput' }

{ #category : '*Famix-Notebook-Extenssions' }
FamixNotebookOutput >> mooseNameOn: aStream [

aStream nextPutAll: (output_type asString). 
]
