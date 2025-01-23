Class {
	#name : 'FamixNotebookModel',
	#superclass : 'MooseModel',
	#traits : 'FamixNotebookTEntityCreator + FamixPythonTEntityCreator',
	#classTraits : 'FamixNotebookTEntityCreator classTrait + FamixPythonTEntityCreator classTrait',
	#category : 'Famix-Notebook-Entities-Model',
	#package : 'Famix-Notebook-Entities',
	#tag : 'Model'
}

{ #category : 'accessing' }
FamixNotebookModel class >> allSubmetamodelsPackagesNames [
	<generated>
	^ #(#'Moose-Query' #'Famix-Traits' #'Famix-Python-Entities')
]

{ #category : 'meta' }
FamixNotebookModel class >> annotation [
	<FMClass: #FamixNotebookModel super: #MooseModel>
	<package: #'Famix-Notebook-Entities'>
	<generated>
]
