"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `notebook` | `FamixNotebookcell` | `cells` | `FamixNotebookNotebook` | |


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `id` | `String` | nil | |
| `metadata` | `Object` | nil | |

"
Class {
	#name : 'FamixNotebookcell',
	#superclass : 'FamixNotebookEntity',
	#instVars : [
		'#id => FMProperty',
		'#metadata => FMProperty',
		'#notebook => FMOne type: #FamixNotebookNotebook opposite: #cells'
	],
	#category : 'Famix-Notebook-Entities-Entities',
	#package : 'Famix-Notebook-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixNotebookcell class >> annotation [

	<FMClass: #cell super: #FamixNotebookEntity>
	<package: #'Famix-Notebook-Entities'>
	<generated>
	<abstract>
	^ self
]

{ #category : 'testing' }
FamixNotebookcell class >> isAbstract [

	<generated>
	^ self == FamixNotebookcell
]

{ #category : 'accessing' }
FamixNotebookcell >> id [

	<FMProperty: #id type: #String>
	<generated>
	^ id
]

{ #category : 'accessing' }
FamixNotebookcell >> id: anObject [
	<generated>
	id := anObject
]

{ #category : 'accessing' }
FamixNotebookcell >> metadata [

	<FMProperty: #metadata type: #Object>
	<generated>
	^ metadata
]

{ #category : 'accessing' }
FamixNotebookcell >> metadata: anObject [
	<generated>
	metadata := anObject
]

{ #category : 'accessing' }
FamixNotebookcell >> notebook [
	"Relation named: #notebook type: #FamixNotebookNotebook opposite: #cells"

	<generated>
	<container>
	^ notebook
]

{ #category : 'accessing' }
FamixNotebookcell >> notebook: anObject [

	<generated>
	notebook := anObject
]

{ #category : 'navigation' }
FamixNotebookcell >> notebookGroup [
	<generated>
	<navigation: 'Notebook'>
	^ MooseSpecializedGroup with: self notebook
]
