"
## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `cells` | `FamixNotebookNotebook` | `notebook` | `FamixNotebookcell` | |


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `metadata` | `Object` | nil | |

"
Class {
	#name : 'FamixNotebookNotebook',
	#superclass : 'FamixNotebookNamedEntity',
	#instVars : [
		'#cells => FMMany type: #FamixNotebookcell opposite: #notebook',
		'#metadata => FMProperty'
	],
	#category : 'Famix-Notebook-Entities-Entities',
	#package : 'Famix-Notebook-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixNotebookNotebook class >> annotation [

	<FMClass: #Notebook super: #FamixNotebookNamedEntity>
	<package: #'Famix-Notebook-Entities'>
	<generated>
	^ self
]

{ #category : 'adding' }
FamixNotebookNotebook >> addCell: anObject [
	<generated>
	^ self cells add: anObject
]

{ #category : 'accessing' }
FamixNotebookNotebook >> cells [
	"Relation named: #cells type: #FamixNotebookcell opposite: #notebook"

	<generated>
	<derived>
	^ cells
]

{ #category : 'accessing' }
FamixNotebookNotebook >> cells: anObject [

	<generated>
	cells value: anObject
]

{ #category : 'navigation' }
FamixNotebookNotebook >> cellsGroup [
	<generated>
	<navigation: 'Cells'>
	^ MooseSpecializedGroup withAll: self cells asSet
]

{ #category : 'accessing' }
FamixNotebookNotebook >> metadata [

	<FMProperty: #metadata type: #Object>
	<generated>
	^ metadata
]

{ #category : 'accessing' }
FamixNotebookNotebook >> metadata: anObject [
	<generated>
	metadata := anObject
]
