Class {
	#name : 'NotebookJsonReader',
	#superclass : 'Object',
	#instVars : [
		'rows',
		'cells',
		'orient',
		'parseMap',
		'model',
		'filename'
	],
	#category : 'Famix-Notebook-Importer',
	#package : 'Famix-Notebook-Importer'
}

{ #category : 'instance creation' }
NotebookJsonReader >> createCodeCell: cell [

	| famixNBCell |
	famixNBCell := FamixNotebookCodeCell new
		               mooseModel: model;
		               executionCount: (cell at: 'execution_count');
		               id: (cell at: 'id');
		               metadata: (cell at: 'metadata');
							"sourceText: (cell at: 'source');" "Passer le source avec TSourceEntity"
							"ToDo ajouter la construction des pythonEntite a partir du source"
		               yourself "Le moose model permet de rassembler toutes les entite dans le model"
]

{ #category : 'instance creation' }
NotebookJsonReader >> createMarkdownCell: cell [

	| famixNBCell |
	famixNBCell := FamixNotebookTextCell new
		               mooseModel: model;
		               isMarkdown: true;
		               id: (cell at: 'id');
		               "ToDo ajouter l'id dans le MM"
							metadata:(cell at: 'metadata');
		               content: (cell at: 'source');
		               yourself
]

{ #category : 'instance creation' }
NotebookJsonReader >> parseFromcell: cell [
	((cell at: 'cell_type') = 'code') ifTrue: [ self createCodeCell: cell ] ifFalse: [ self createMarkdownCell: cell ]
]

{ #category : 'instance creation' }
NotebookJsonReader >> read: json [
	"Loads parsed json"

	json ifEmpty: [ cells := #(  ) ] ifNotEmpty: [
		model := FamixNotebookModel new name: filename; yourself. "ici on passe une entite qui englobante et on a plus besoin de l'entite Notebook"
		cells := json at: 'cells' .
		cells do: [:cell | self parseFromcell: cell]]
]

{ #category : 'instance creation' }
NotebookJsonReader >> readFrom: aFileReference [
	| reader |

	filename := aFileReference basename. 
	reader := NeoJSONReader on: aFileReference readStream.
	self read: reader next.
	reader close.

	^ model
	"^ self createDataFrame"
]
