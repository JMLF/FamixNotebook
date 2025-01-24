"
## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `id` | `String` | nil | |
| `metadata` | `Object` | nil | |

"
Class {
	#name : 'FamixNotebookCell',
	#superclass : 'FamixNotebookEntity',
	#instVars : [
		'#id => FMProperty',
		'#metadata => FMProperty'
	],
	#category : 'Famix-Notebook-Entities-Entities',
	#package : 'Famix-Notebook-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixNotebookCell class >> annotation [

	<FMClass: #Cell super: #FamixNotebookEntity>
	<package: #'Famix-Notebook-Entities'>
	<generated>
	<abstract>
	^ self
]

{ #category : 'testing' }
FamixNotebookCell class >> isAbstract [

	<generated>
	^ self == FamixNotebookCell
]

{ #category : 'accessing' }
FamixNotebookCell >> id [

	<FMProperty: #id type: #String>
	<generated>
	^ id
]

{ #category : 'accessing' }
FamixNotebookCell >> id: anObject [
	<generated>
	id := anObject
]

{ #category : 'accessing' }
FamixNotebookCell >> metadata [

	<FMProperty: #metadata type: #Object>
	<generated>
	^ metadata
]

{ #category : 'accessing' }
FamixNotebookCell >> metadata: anObject [
	<generated>
	metadata := anObject
]
