"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `entities` | `FamixNotebookCodeCell` | `codeCell` | `FamixPythonEntity` | |
| `output` | `FamixNotebookCodeCell` | `codeCell` | `FamixNotebookOutput` | |
| `sourceAnchor` | `FamixTSourceEntity` | `element` | `FamixTSourceAnchor` | SourceAnchor entity linking to the original source code for this entity|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `cellId` | `Number` | nil | |
| `executionCount` | `Number` | nil | |

"
Class {
	#name : 'FamixNotebookCodeCell',
	#superclass : 'FamixNotebookCell',
	#traits : 'FamixTSourceEntity',
	#classTraits : 'FamixTSourceEntity classTrait',
	#instVars : [
		'#cellId => FMProperty',
		'#executionCount => FMProperty',
		'#output => FMOne type: #FamixNotebookOutput opposite: #codeCell'
	],
	#category : 'Famix-Notebook-Entities-Entities',
	#package : 'Famix-Notebook-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixNotebookCodeCell class >> annotation [

	<FMClass: #CodeCell super: #FamixNotebookCell>
	<package: #'Famix-Notebook-Entities'>
	<generated>
	^ self
]

{ #category : 'adding' }
FamixNotebookCodeCell >> addEntity: anObject [
	<generated>
	^ self entities add: anObject
]

{ #category : 'accessing' }
FamixNotebookCodeCell >> cellId [

	<FMProperty: #cellId type: #Number>
	<generated>
	^ cellId
]

{ #category : 'accessing' }
FamixNotebookCodeCell >> cellId: anObject [
	<generated>
	cellId := anObject
]

{ #category : 'accessing' }
FamixNotebookCodeCell >> entities [
	"Relation named: #entities type: #FamixPythonEntity opposite: #codeCell"

	<generated>
	<derived>
	<FMProperty: #entities type: #FamixPythonEntity opposite: #codeCell>
	^ self attributeAt: #entities ifAbsentPut: [ FMMultivalueLink on: self opposite: #codeCell: ]
]

{ #category : 'accessing' }
FamixNotebookCodeCell >> entities: anObject [

	<generated>
	self entities value: anObject
]

{ #category : 'accessing' }
FamixNotebookCodeCell >> executionCount [

	<FMProperty: #executionCount type: #Number>
	<generated>
	^ executionCount
]

{ #category : 'accessing' }
FamixNotebookCodeCell >> executionCount: anObject [
	<generated>
	executionCount := anObject
]

{ #category : 'accessing' }
FamixNotebookCodeCell >> output [
	"Relation named: #output type: #FamixNotebookOutput opposite: #codeCell"

	<generated>
	^ output
]

{ #category : 'accessing' }
FamixNotebookCodeCell >> output: anObject [

	<generated>
	output := anObject
]
