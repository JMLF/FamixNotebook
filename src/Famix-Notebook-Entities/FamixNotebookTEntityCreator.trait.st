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
FamixNotebookTEntityCreator >> newComment [

	<generated>
	^ self add: FamixNotebookComment new
]

{ #category : 'entity creation' }
FamixNotebookTEntityCreator >> newNotebook [

	<generated>
	^ self add: FamixNotebookNotebook new
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
FamixNotebookTEntityCreator >> newcodeCell [

	<generated>
	^ self add: FamixNotebookcodeCell new
]

{ #category : 'entity creation' }
FamixNotebookTEntityCreator >> newoutput [

	<generated>
	^ self add: FamixNotebookoutput new
]

{ #category : 'entity creation' }
FamixNotebookTEntityCreator >> newtextCell [

	<generated>
	^ self add: FamixNotebooktextCell new
]
