Extension { #name : 'FamixCBCondition' }

{ #category : '*Famix-Notebook-Critics' }
FamixCBCondition >> rulesId [

    <FMProperty: #rulesId type: #String>
	<FMComment: 'Unique id for each conditions'>
    ^ self attributeAt: #rulesId ifAbsent: [  ]
]

{ #category : '*Famix-Notebook-Critics' }
FamixCBCondition >> rulesId: anObject [

    self attributeAt: #rulesId  put: anObject .
]
