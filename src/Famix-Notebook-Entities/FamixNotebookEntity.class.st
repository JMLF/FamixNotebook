Class {
	#name : 'FamixNotebookEntity',
	#superclass : 'MooseEntity',
	#category : 'Famix-Notebook-Entities-Entities',
	#package : 'Famix-Notebook-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixNotebookEntity class >> annotation [

	<FMClass: #Entity super: #MooseEntity>
	<package: #'Famix-Notebook-Entities'>
	<generated>
	<abstract>
	^ self
]

{ #category : 'testing' }
FamixNotebookEntity class >> isAbstract [

	<generated>
	^ self == FamixNotebookEntity
]

{ #category : 'meta' }
FamixNotebookEntity class >> metamodel [

	<generated>
	^ FamixNotebookModel metamodel
]

{ #category : 'testing' }
FamixNotebookEntity >> isNamedEntity [

	<generated>
	^ false
]

{ #category : 'testing' }
FamixNotebookEntity >> isQueryable [

	<generated>
	^ false
]
