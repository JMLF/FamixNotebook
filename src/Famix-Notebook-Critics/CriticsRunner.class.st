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

| criticBrowser violations exportBrowserModel violationAsDict jsonArray infos |
criticBrowser := MiCriticBrowser on: MiCriticBrowser newModel.
rulesFile asFileReference readStreamDo: [ :stream | criticBrowser importRulesFromStream: stream ].
criticBrowser model setEntities: notebookModel.
criticBrowser model run.
violations := criticBrowser model getAllViolations.

violationAsDict := [ :violation |
    Dictionary newFromPairs: {
        'Rule name' . violation violatedCondition name.
        'Rule summary' . violation violatedCondition summary.
        'Rule ID' . violation violatedCondition rulesId.
        'Violating Entity' . violation violatingEntity mooseName.
        'Source text' . violation violatingEntity sourceText.
        'Violating position' . ('cell : ', violation violatingEntity cellId asString).
    }
].

jsonArray := (violations collect: violationAsDict) asCollection . 

infos := Dictionary newFromPairs: {
        'Nb code cells' . (notebookModel select: [ :p | p class = FamixNotebookCodeCell ]) size.
        'Nb markdown cells' . (notebookModel select: [ :p | p class = FamixNotebookTextCell ]) size.
		  "Ad total loc and loc per cells"
    }.
jsonArray add: infos.
1halt.
exportFile asFileReference writeStreamDo: [ :stream |
	|writer|
    (NeoJSONWriter on: stream)
     nextPutAll: jsonArray;
      close.
].


]
