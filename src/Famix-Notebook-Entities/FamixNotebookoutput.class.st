"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `codeCell` | `FamixNotebookoutput` | `output` | `FamixNotebookcodeCell` | |


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `content` | `Object` | nil | |
| `metadata` | `Object` | nil | |

"
Class {
	#name : 'FamixNotebookoutput',
	#superclass : 'FamixNotebookEntity',
	#instVars : [
		'#codeCell => FMOne type: #FamixNotebookcodeCell opposite: #output',
		'#content => FMProperty',
		'#metadata => FMProperty'
	],
	#category : 'Famix-Notebook-Entities-Entities',
	#package : 'Famix-Notebook-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixNotebookoutput class >> annotation [

	<FMClass: #output super: #FamixNotebookEntity>
	<package: #'Famix-Notebook-Entities'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FamixNotebookoutput >> codeCell [
	"Relation named: #codeCell type: #FamixNotebookcodeCell opposite: #output"

	<generated>
	<derived>
	^ codeCell
]

{ #category : 'accessing' }
FamixNotebookoutput >> codeCell: anObject [

	<generated>
	codeCell := anObject
]

{ #category : 'accessing' }
FamixNotebookoutput >> content [

	<FMProperty: #content type: #Object>
	<generated>
	^ content
]

{ #category : 'accessing' }
FamixNotebookoutput >> content: anObject [
	<generated>
	content := anObject
]

{ #category : 'accessing' }
FamixNotebookoutput >> metadata [

	<FMProperty: #metadata type: #Object>
	<generated>
	^ metadata
]

{ #category : 'accessing' }
FamixNotebookoutput >> metadata: anObject [
	<generated>
	metadata := anObject
]
