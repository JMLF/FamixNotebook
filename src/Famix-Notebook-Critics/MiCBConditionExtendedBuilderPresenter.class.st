Class {
	#name : 'MiCBConditionExtendedBuilderPresenter',
	#superclass : 'MiCBConditionBuilderPresenter',
	#instVars : [
		'ruleId'
	],
	#category : 'Famix-Notebook-Critics',
	#package : 'Famix-Notebook-Critics'
}

{ #category : 'action' }
MiCBConditionExtendedBuilderPresenter >> buildComponent: aCondition [

	super buildComponent: aCondition.

	aCondition rulesId: (ruleId text). 

	^ aCondition
]

{ #category : 'layout' }
MiCBConditionExtendedBuilderPresenter >> defaultLayout [

	^ self newBoxLayoutTopToBottom
		  spacing: 10;
		  add: self titleAndSeverityLayout height: 110;
		  add: self choiceLayout expand: false;
		  add: self conditionComputingLayout;
		  add: self summaryLayout;
		  yourself
]

{ #category : 'initialization' }
MiCBConditionExtendedBuilderPresenter >> fillWithRuleComponent: aCondition [

	super fillWithRuleComponent: aCondition.

	ruleId text: ((aCondition rulesId ) ifNil: [ '' ]). 
]

{ #category : 'initialization' }
MiCBConditionExtendedBuilderPresenter >> initializePresenters [

	super initializePresenters.
	
	ruleId := self newTextInput.

]

{ #category : 'as yet unclassified' }
MiCBConditionExtendedBuilderPresenter >> titleAndSeverityLayout [

	^ self newGridLayout
		  beColumnNotHomogeneous;
		  column: 2 expand: true;
		  build: [ :builder |
			  builder
				  add: 'Condition name:';
				  add: titleField;
				  nextRow;
				  add: 'Severity:';
				  add: severityDroplist;
				  nextRow;
				  add: 'Id:';
				  add: ruleId;
				  nextRow ];
		  yourself
]
