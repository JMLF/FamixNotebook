Extension { #name : 'MiCBConditionBuilderPresenter' }

{ #category : '*Famix-Notebook-Critics' }
MiCBConditionBuilderPresenter >> defaultLayout [

	^ self newBoxLayoutTopToBottom
		  spacing: 10;
		  add: self titleAndSeverityLayout height: 110;
		  add: self choiceLayout expand: false;
		  add: self conditionComputingLayout;
		  add: self summaryLayout;
		  yourself
]

{ #category : '*Famix-Notebook-Critics' }
MiCBConditionBuilderPresenter >> titleAndSeverityLayout [

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
				  add: rulesId;
				  nextRow ];
		  yourself
]
