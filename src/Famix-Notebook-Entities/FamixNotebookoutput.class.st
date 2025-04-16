"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `codeCell` | `FamixNotebookOutput` | `output` | `FamixNotebookCodeCell` | |


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `data` | `Object` | nil | |
| `metadata` | `Object` | nil | |
| `output_type` | `String` | nil | |

"
Class {
	#name : 'FamixNotebookOutput',
	#superclass : 'FamixNotebookEntity',
	#instVars : [
		'#metadata => FMProperty',
		'#data => FMProperty',
		'#output_type => FMProperty',
		'#codeCell => FMOne type: #FamixNotebookCodeCell opposite: #output'
	],
	#category : 'Famix-Notebook-Entities-Entities',
	#package : 'Famix-Notebook-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixNotebookOutput class >> annotation [

	<FMClass: #Output super: #FamixNotebookEntity>
	<package: #'Famix-Notebook-Entities'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FamixNotebookOutput >> codeCell [
	"Relation named: #codeCell type: #FamixNotebookCodeCell opposite: #output"

	<generated>
	<derived>
	^ codeCell
]

{ #category : 'accessing' }
FamixNotebookOutput >> codeCell: anObject [

	<generated>
	codeCell := anObject
]

{ #category : 'accessing' }
FamixNotebookOutput >> data [

	<FMProperty: #data type: #Object>
	<generated>
	^ data
]

{ #category : 'accessing' }
FamixNotebookOutput >> data: anObject [
	<generated>
	data := anObject
]

{ #category : 'accessing' }
FamixNotebookOutput >> metadata [

	<FMProperty: #metadata type: #Object>
	<generated>
	^ metadata
]

{ #category : 'accessing' }
FamixNotebookOutput >> metadata: anObject [
	<generated>
	metadata := anObject
]

{ #category : 'printing' }
FamixNotebookOutput >> mooseNameOn: aStream [

aStream nextPutAll: (output_type asString). 
]

{ #category : 'accessing' }
FamixNotebookOutput >> output_type [

	<FMProperty: #output_type type: #String>
	<generated>
	^ output_type
]

{ #category : 'accessing' }
FamixNotebookOutput >> output_type: anObject [
	<generated>
	output_type := anObject
]
