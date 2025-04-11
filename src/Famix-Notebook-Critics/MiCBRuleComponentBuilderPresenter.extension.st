Extension { #name : 'MiCBRuleComponentBuilderPresenter' }

{ #category : '*Famix-Notebook-Critics' }
MiCBRuleComponentBuilderPresenter >> buildComponent: aComponent [

	aComponent name: titleField text.
	aComponent summary: summaryField text.
	
	"check if component is condition"
	aComponent isCBCondition ifTrue: [aComponent rulesId: rulesId text.  ].
	

	^ aComponent
]

{ #category : '*Famix-Notebook-Critics' }
MiCBRuleComponentBuilderPresenter >> fillWithRuleComponent: aRuleComponent [

	titleField text: (aRuleComponent name ifNil: [ '' ]).

	codeInputField text: aRuleComponent printAsBlock.
	
	aRuleComponent isCBContext ifFalse: [ rulesId text: (aRuleComponent rulesId ifNil: [ '' ]). ] .
	

	summaryField text: (aRuleComponent summary ifNil: [ '' ])
]

{ #category : '*Famix-Notebook-Critics' }
MiCBRuleComponentBuilderPresenter >> initializePresenters [

	titleField := self newTextInput.
	rulesId := self newTextInput.
	summaryField := self newText.

	codeInputField := self newCode
		                  text: self class defaultCodeInput;
		                  yourself.
	codeInputField eventHandler whenFocusReceivedDo: [ "Set cursor to the position where some code should be added or modified"
		| pipePosition |
		pipePosition := codeInputField text findString: ']'.
		codeInputField selectionInterval:
			(pipePosition - 1 to: pipePosition - 2) ]
]
