"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `entities` | `FamixNotebookcodeCell` | `codeCell` | `FamixPythonEntity` | |
| `output` | `FamixNotebookcodeCell` | `codeCell` | `FamixNotebookoutput` | |
| `sourceAnchor` | `FamixTSourceEntity` | `element` | `FamixTSourceAnchor` | SourceAnchor entity linking to the original source code for this entity|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `executionCount` | `Number` | nil | |

"
Class {
	#name : 'FamixNotebookcodeCell',
	#superclass : 'FamixNotebookcell',
	#traits : 'FamixTSourceEntity',
	#classTraits : 'FamixTSourceEntity classTrait',
	#instVars : [
		'#executionCount => FMProperty',
		'#output => FMOne type: #FamixNotebookoutput opposite: #codeCell'
	],
	#category : 'Famix-Notebook-Entities-Entities',
	#package : 'Famix-Notebook-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixNotebookcodeCell class >> annotation [

	<FMClass: #codeCell super: #FamixNotebookcell>
	<package: #'Famix-Notebook-Entities'>
	<generated>
	^ self
]

{ #category : 'adding' }
FamixNotebookcodeCell >> addEntity: anObject [
	<generated>
	^ self entities add: anObject
]

{ #category : 'accessing' }
FamixNotebookcodeCell >> entities [
	"Relation named: #entities type: #FamixPythonEntity opposite: #codeCell"

	<generated>
	<derived>
	<FMProperty: #entities type: #FamixPythonEntity opposite: #codeCell>
	^ self attributeAt: #entities ifAbsentPut: [ FMMultivalueLink on: self opposite: #codeCell: ]
]

{ #category : 'accessing' }
FamixNotebookcodeCell >> entities: anObject [

	<generated>
	self entities value: anObject
]

{ #category : 'accessing' }
FamixNotebookcodeCell >> executionCount [

	<FMProperty: #executionCount type: #Number>
	<generated>
	^ executionCount
]

{ #category : 'accessing' }
FamixNotebookcodeCell >> executionCount: anObject [
	<generated>
	executionCount := anObject
]

{ #category : 'accessing' }
FamixNotebookcodeCell >> output [
	"Relation named: #output type: #FamixNotebookoutput opposite: #codeCell"

	<generated>
	^ output
]

{ #category : 'accessing' }
FamixNotebookcodeCell >> output: anObject [

	<generated>
	output := anObject
]
