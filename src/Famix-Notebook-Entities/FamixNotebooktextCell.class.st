"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `sourceAnchor` | `FamixTSourceEntity` | `element` | `FamixTSourceAnchor` | SourceAnchor entity linking to the original source code for this entity|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `content` | `String` | nil | |
| `isMarkdown` | `Boolean` | nil | |

"
Class {
	#name : 'FamixNotebookTextCell',
	#superclass : 'FamixNotebookCell',
	#traits : 'FamixTSourceEntity',
	#classTraits : 'FamixTSourceEntity classTrait',
	#instVars : [
		'#content => FMProperty',
		'#isMarkdown => FMProperty'
	],
	#category : 'Famix-Notebook-Entities-Entities',
	#package : 'Famix-Notebook-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixNotebookTextCell class >> annotation [

	<FMClass: #TextCell super: #FamixNotebookCell>
	<package: #'Famix-Notebook-Entities'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FamixNotebookTextCell >> content [

	<FMProperty: #content type: #String>
	<generated>
	^ content
]

{ #category : 'accessing' }
FamixNotebookTextCell >> content: anObject [
	<generated>
	content := anObject
]

{ #category : 'accessing' }
FamixNotebookTextCell >> isMarkdown [

	<FMProperty: #isMarkdown type: #Boolean>
	<generated>
	^ isMarkdown
]

{ #category : 'accessing' }
FamixNotebookTextCell >> isMarkdown: anObject [
	<generated>
	isMarkdown := anObject
]

{ #category : 'printing' }
FamixNotebookTextCell >> mooseNameOn: aStream [

aStream nextPutAll: (content asString contractTo: 30). 
]
