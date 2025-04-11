Extension { #name : 'MiCBAddConditionCommand' }

{ #category : '*Famix-Notebook-Critics' }
MiCBAddConditionCommand >> execute [

	(MiCBConditionExtendedBuilderPresenter on: self context model) openDialog
]
