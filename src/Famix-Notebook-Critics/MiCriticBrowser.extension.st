Extension { #name : 'MiCriticBrowser' }

{ #category : '*Famix-Notebook-Critics' }
MiCriticBrowser >> openEditRuleComponentDialog [
	^ rules selectedItem class = FamixCBCondition
		  ifTrue: [
			  (MiCBConditionExtendedBuilderPresenter on: specModel)
				  beForEdition;
				  openDialog ]
		  ifFalse: [
			  (MiCBContextBuilderPresenter on: specModel)
				  beForEdition;
				  openDialog ]
]
