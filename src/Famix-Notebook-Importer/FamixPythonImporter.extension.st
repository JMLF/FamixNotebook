Extension { #name : 'FamixPythonImporter' }

{ #category : '*Famix-Notebook-Importer' }
FamixPythonImporter >> importPythonString: aString [
	"('Importing ' , aFileReference pathString) traceCr."

	"(aFileReference basename = #'moduleAtRoot.py') ifTrue: [ 1halt ]."

	visitor := FamixPythonImporterVisitor new.
	visitor rootFilePath: ''.
	visitor model name: 'python'.
	"rootFolder: aFileName asFileReference.
"
	(PythonParser parse: aString) acceptVisitor:
		visitor.
		
	visitor resolveUnresolvedSymbols.
	^ visitor model.
]

{ #category : '*Famix-Notebook-Importer' }
FamixPythonImporter >> importPythonString: aString from: aFileName [
	"('Importing ' , aFileReference pathString) traceCr."

	"(aFileReference basename = #'moduleAtRoot.py') ifTrue: [ 1halt ]."

	visitor := FamixPythonImporterVisitor new.
	visitor rootFilePath: aFileName.
	visitor model name: 'python'.
	
	"rootFolder: aFileName asFileReference.
"
	(PythonParser parse: aString) acceptVisitor:
		visitor.
		
	visitor resolveUnresolvedSymbols.
	^ visitor model.
]
