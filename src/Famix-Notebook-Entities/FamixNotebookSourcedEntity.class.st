"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `sourceAnchor` | `FamixTSourceEntity` | `element` | `FamixTSourceAnchor` | SourceAnchor entity linking to the original source code for this entity|



"
Class {
	#name : 'FamixNotebookSourcedEntity',
	#superclass : 'FamixNotebookEntity',
	#traits : 'FamixTSourceEntity',
	#classTraits : 'FamixTSourceEntity classTrait',
	#category : 'Famix-Notebook-Entities-Entities',
	#package : 'Famix-Notebook-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixNotebookSourcedEntity class >> annotation [

	<FMClass: #SourcedEntity super: #FamixNotebookEntity>
	<package: #'Famix-Notebook-Entities'>
	<generated>
	<abstract>
	^ self
]

{ #category : 'testing' }
FamixNotebookSourcedEntity class >> isAbstract [

	<generated>
	^ self == FamixNotebookSourcedEntity
]
