"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `commentedEntity` | `FamixTComment` | `comments` | `FamixTWithComments` | Source code commented by the comment|

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `sourceAnchor` | `FamixTSourceEntity` | `element` | `FamixTSourceAnchor` | SourceAnchor entity linking to the original source code for this entity|



"
Class {
	#name : 'FamixNotebookComment',
	#superclass : 'FamixNotebookSourcedEntity',
	#traits : 'FamixTComment',
	#classTraits : 'FamixTComment classTrait',
	#category : 'Famix-Notebook-Entities-Entities',
	#package : 'Famix-Notebook-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixNotebookComment class >> annotation [

	<FMClass: #Comment super: #FamixNotebookSourcedEntity>
	<package: #'Famix-Notebook-Entities'>
	<generated>
	^ self
]
