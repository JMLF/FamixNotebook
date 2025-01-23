Class {
	#name : 'ConnectMetamodelGenerator',
	#superclass : 'FamixMetamodelGenerator',
	#instVars : [
		'noteBookCodeCell',
		'pythonEntity'
	],
	#category : 'Famix-Notebook-Generator',
	#package : 'Famix-Notebook-Generator'
}

{ #category : 'accessing' }
ConnectMetamodelGenerator class >> packageName [

	^ #'Connect-Model'
]

{ #category : 'accessing' }
ConnectMetamodelGenerator class >> prefix [

	^ #'CM'
]

{ #category : 'accessing' }
ConnectMetamodelGenerator class >> submetamodels [

	^ {
		  FamixPythonGenerator.
		  FamixNotebookgenerator }
]

{ #category : 'definition' }
ConnectMetamodelGenerator >> defineClasses [ 

	super defineClasses. 
	
	noteBookCodeCell := self remoteEntity: #codeCell withPrefix: #FamixNotebook. 
	pythonEntity:= self remoteEntity: #Entity withPrefix: #FamixPython. 
]

{ #category : 'definition' }
ConnectMetamodelGenerator >> defineRelations [

	super defineRelations.

	noteBookCodeCell -* pythonEntity
]
