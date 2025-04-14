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

{ #category : '*Famix-Notebook-Critics' }
FamixCBCondition >> stonOn: stonWriter [

	stonWriter writeObject: self streamMap: [ :dictionary | 
		self class stonAllInstVarNames do: [ :each | 
			(self instVarNamed: each) ifNotNil: [ :value | 
				dictionary
					at: each asSymbol
					put: ((value isKindOf: FamixCBQueryHandler)
							 ifTrue: [ value convertToSTONString ]
							 ifFalse: [ value ]) ] ] .
			dictionary
					at: #rulesId
					put:	self rulesId. 	
					]
]
