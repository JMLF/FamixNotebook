"
## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `content` | `String` | nil | |
| `isMarkdown` | `Boolean` | nil | |

"
Class {
	#name : 'FamixNotebooktextCell',
	#superclass : 'FamixNotebookcell',
	#instVars : [
		'#content => FMProperty',
		'#isMarkdown => FMProperty'
	],
	#category : 'Famix-Notebook-Entities-Entities',
	#package : 'Famix-Notebook-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixNotebooktextCell class >> annotation [

	<FMClass: #textCell super: #FamixNotebookcell>
	<package: #'Famix-Notebook-Entities'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FamixNotebooktextCell >> content [

	<FMProperty: #content type: #String>
	<generated>
	^ content
]

{ #category : 'accessing' }
FamixNotebooktextCell >> content: anObject [
	<generated>
	content := anObject
]

{ #category : 'accessing' }
FamixNotebooktextCell >> isMarkdown [

	<FMProperty: #isMarkdown type: #Boolean>
	<generated>
	^ isMarkdown
]

{ #category : 'accessing' }
FamixNotebooktextCell >> isMarkdown: anObject [
	<generated>
	isMarkdown := anObject
]
