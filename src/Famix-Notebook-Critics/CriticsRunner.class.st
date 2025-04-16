"
CriticsRunner onNotebook: '/Users/mignard/Documents/work/notebooks/student_2.ipynb' applyRulesFrom: '/Users/mignard/Documents/work/rulesWithId.ston' andExportResultsTo: '/Users/mignard/Documents/work/export-table.json'
"
Class {
	#name : 'CriticsRunner',
	#superclass : 'Object',
	#instVars : [
		'rulesFile',
		'notebookModel',
		'exportFile',
		'notebookReader'
	],
	#category : 'Famix-Notebook-Critics',
	#package : 'Famix-Notebook-Critics'
}

{ #category : 'as yet unclassified' }
CriticsRunner class >> onNotebook: aNotebookFileReference applyRulesFrom: aRulesStonFileReference andExportResultsTo: aCSVFileReference [

	^ self new
		  buildNotebookModel: aNotebookFileReference;
		  rulesFile: aRulesStonFileReference;
		  exportFile: aCSVFileReference;
		  runAndExport
]

{ #category : 'as yet unclassified' }
CriticsRunner >> buildNotebookModel: aNotebookFileReference [

	notebookModel := notebookReader readFrom: aNotebookFileReference asFileReference. 
]

{ #category : 'accessing' }
CriticsRunner >> exportFile [

	^ exportFile
]

{ #category : 'accessing' }
CriticsRunner >> exportFile: anObject [

	exportFile := anObject
]

{ #category : 'initialization' }
CriticsRunner >> initialize [ 

	notebookReader := NotebookJsonReader new.
]

{ #category : 'accessing' }
CriticsRunner >> notebookModel [

	^ notebookModel
]

{ #category : 'accessing' }
CriticsRunner >> notebookModel: anObject [

	notebookModel := anObject
]

{ #category : 'accessing' }
CriticsRunner >> rulesFile [

	^ rulesFile
]

{ #category : 'accessing' }
CriticsRunner >> rulesFile: anObject [

	rulesFile := anObject
]

{ #category : 'as yet unclassified' }
CriticsRunner >> runAndExport [

	| criticBrowser violations violationAsDict jsonArray infos res |
	criticBrowser := MiCriticBrowser on: MiCriticBrowser newModel.
	rulesFile asFileReference readStreamDo: [ :stream |
		criticBrowser importRulesFromStream: stream ].
	criticBrowser model setEntities: notebookModel.
	criticBrowser model run.
	violations := criticBrowser model getAllViolations.
	"Construire des dict de dict pour un meilleur output json"
	violationAsDict := [ :violation |
	                   Dictionary newFromPairs: {
			                   'Rule ID'.
			                   violation violatedCondition rulesId.
			                   'Rule name'.
			                   violation violatedCondition name.
			                   'Rule summary'.
			                   violation violatedCondition summary.
			                   'Severity'.
			                   violation violatedCondition severity title.
			                   'Violating Entity'.
			                   violation violatingEntity mooseName.
			                   'Source text'.
			                   violation violatingEntity sourceText.
			                   'Violating position'.
			                   ('cell : '
			                    , violation violatingEntity cellId asString) } ].

	jsonArray := violations collect: violationAsDict.

	infos := Dictionary newFromPairs: {
			         'Nb code cells'.
			         (notebookModel select: [ :p |
				          p class = FamixNotebookCodeCell ]) size.
			         'Nb markdown cells'.
			         (notebookModel select: [ :p |
				          p class = FamixNotebookTextCell ]) size.
			         "Ne fonctionne que dans le cas ou l'on analyse un seule notebook et donc le premier module est le notebook"
			         'Total LOC'.
			         (notebookModel select: [ :p |
				          p class = FamixNotebookCodeCell ]) first entities first
				         mooseModel allModules first sourceAnchor endLine.
			         'number of violation'.
			         violations size }.


	res := Dictionary new
		       at: 'violations' put: jsonArray asOrderedCollection;
		       at: 'notebook_informations' put: infos;
		       "Add notebook name etc.."yourself.



	exportFile asFileReference writeStreamDo: [ :stream |
		(NeoJSONWriter on: stream)
			nextPut: res;
			close ]
]
