Extension { #name : 'FamixPythonImport' }

{ #category : '*Famix-Notebook-Entities' }
FamixPythonImport >> mooseNameOn: aStream [ 

	aStream nextPutAll: (importedEntity name),'-import'.
]
