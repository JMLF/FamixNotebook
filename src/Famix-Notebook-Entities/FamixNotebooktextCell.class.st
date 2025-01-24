"
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
	#instVars : [
		'#isMarkdown => FMProperty',
		'#content => FMProperty'
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
