Extension { #name : 'FamixPythonEntity' }

{ #category : '*Famix-Notebook-Entities-accessing' }
FamixPythonEntity >> codeCell [
	"Relation named: #codeCell type: #FamixNotebookCodeCell opposite: #entities"

	<generated>
	<FMProperty: #codeCell type: #FamixNotebookCodeCell opposite: #entities>
	<package: #'Famix-Notebook-Entities'>
	^ self attributeAt: #codeCell ifAbsent: [ nil ]
]

{ #category : '*Famix-Notebook-Entities-accessing' }
FamixPythonEntity >> codeCell: anObject [

	<generated>
	self attributeAt: #codeCell put: (FMMultivalueLink on: self update: #entities from: self codeCell to: anObject).
]
