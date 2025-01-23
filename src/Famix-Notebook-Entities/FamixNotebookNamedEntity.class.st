"
## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `name` | `String` | nil | Basic name of the entity, not full reference.|

"
Class {
	#name : 'FamixNotebookNamedEntity',
	#superclass : 'FamixNotebookEntity',
	#traits : 'FamixTNamedEntity',
	#classTraits : 'FamixTNamedEntity classTrait',
	#category : 'Famix-Notebook-Entities-Entities',
	#package : 'Famix-Notebook-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixNotebookNamedEntity class >> annotation [

	<FMClass: #NamedEntity super: #FamixNotebookEntity>
	<package: #'Famix-Notebook-Entities'>
	<generated>
	<abstract>
	^ self
]

{ #category : 'testing' }
FamixNotebookNamedEntity class >> isAbstract [

	<generated>
	^ self == FamixNotebookNamedEntity
]

{ #category : 'testing' }
FamixNotebookNamedEntity >> isNamedEntity [

	<generated>
	^ true
]
