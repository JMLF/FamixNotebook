"
This trait is used by Famix models.
It provides an API for creating entities and adding them to the model.


"
Trait {
	#name : 'FamixNotebookTEntityCreator',
	#category : 'Famix-Notebook-Entities-Model',
	#package : 'Famix-Notebook-Entities',
	#tag : 'Model'
}

{ #category : 'meta' }
FamixNotebookTEntityCreator classSide >> annotation [

	<FMClass: #TEntityCreator super: #Object>
	<package: #'Famix-Notebook-Entities'>
	<generated>
	^ self
]

{ #category : 'entity creation' }
FamixNotebookTEntityCreator >> newCodeCell [

	<generated>
	^ self add: FamixNotebookCodeCell new
]

{ #category : 'entity creation' }
FamixNotebookTEntityCreator >> newComment [

	<generated>
	^ self add: FamixNotebookComment new
]

{ #category : 'entity creation' }
FamixNotebookTEntityCreator >> newOutput [

	<generated>
	^ self add: FamixNotebookOutput new
]

{ #category : 'entity creation' }
FamixNotebookTEntityCreator >> newSourceLanguage [

	<generated>
	^ self add: FamixNotebookSourceLanguage new
]

{ #category : 'entity creation' }
FamixNotebookTEntityCreator >> newSourceTextAnchor [

	<generated>
	^ self add: FamixNotebookSourceTextAnchor new
]

{ #category : 'entity creation' }
FamixNotebookTEntityCreator >> newTextCell [

	<generated>
	^ self add: FamixNotebookTextCell new
]
