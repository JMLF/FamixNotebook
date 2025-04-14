"
CriticsRunner onNotebook: '/Users/mignard/Documents/work/student_2.ipynb' applyRulesFrom: '/Users/mignard/Documents/work/rules.ston' andExportResultsTo: '/Users/mignard/Documents/work/export-table.csv'
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

| criticBrowser violations exportBrowserModel |
criticBrowser := MiCriticBrowser on: MiCriticBrowser newModel.
rulesFile asFileReference readStreamDo: [ :stream | criticBrowser importRulesFromStream: stream ].
criticBrowser model setEntities: notebookModel.
criticBrowser model run.
violations := criticBrowser model getAllViolations.

exportBrowserModel := MiExportModel new.
exportBrowserModel entitiesList: violations.

"Remove default column"
exportBrowserModel removeColumnForQueryNamed: #Name.
exportBrowserModel removeColumnForQueryNamed: #Type.

"export"
exportBrowserModel addColumnForQuery: [ :violation | violation violatedCondition name ] withName: #'Rule name'.
exportBrowserModel addColumnForQuery: [ :violation | violation violatedCondition summary ] withName: #'Rule summary'.
exportBrowserModel addColumnForQuery: [ :violation | violation violatedCondition rulesId.  ] withName: #'Rule ID'.

exportBrowserModel addColumnForQuery: [ :violation | violation violatingEntity mooseName ] withName: #'Violating Entity'.
exportBrowserModel addColumnForQuery: [ :violation | violation violatingEntity sourceText ] withName: #'Source text'.
exportBrowserModel addColumnForQuery: [ :violation | 'cell : ',(violation violatingEntity cellId asString) ] withName: #'Violating position'.


exportFile asFileReference writeStreamDo: [ :stream | exportBrowserModel writeCSVOn: stream ].


]
