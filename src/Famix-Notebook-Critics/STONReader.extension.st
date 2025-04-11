Extension { #name : 'STONReader' }

{ #category : '*Famix-Notebook-Critics' }
STONReader >> parseNamedInstVarsFor: anObject [
	self parseMapDo: [ :instVarName :value |
		
		instVarName = #rulesId ifTrue: [ anObject rulesId: value  ] ifFalse: [ anObject instVarNamed: instVarName asString put: value ].
		1halt. 
		"anObject instVarNamed: instVarName asString put: value "]
]
