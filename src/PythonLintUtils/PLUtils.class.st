"
Some methods to gather insights on FamixPython models
"
Class {
	#name : 'PLUtils',
	#superclass : 'Object',
	#instVars : [
		'model'
	],
	#category : 'PythonLintUtils',
	#package : 'PythonLintUtils'
}

{ #category : 'actions api' }
PLUtils class >> load: aFilereference [

	^ self new
	  model: (FamixPythonImporter import: aFilereference);
		yourself.
	  
]

{ #category : 'invocation' }
PLUtils >> allFuncOrMethodsInvocationWithArgName: anArgName [

	| invocations func |
	invocations := model allInvocations.
	invocations := invocations select: [ :i | i isArgNameInInvocation: anArgName ].
	func := invocations flatCollect: [ :i |
		  i candidates reject: [ :c | c isShadowed ] ].
	^func "Voir pour renvoyer l'objet directment si size = 1"
]

{ #category : 'as yet unclassified' }
PLUtils >> allImportedEntitiesName [

	| imports res |
	imports := model allImports.
	
	res := imports flatCollect: [ :i | 
		{ i importedEntity name. (i alias ifNil: [ nil ]) } select: [ :e | e notNil ] 
	].
	^ res

]

{ #category : 'invocation' }
PLUtils >> allInvocationsWithArgName: anArgName [

	| invocations |
	invocations := model allInvocations.
	^ invocations select: [ :i | i isArgNameInInvocation: anArgName ]
]

{ #category : 'import' }
PLUtils >> checkFromImportUsage [

	| imports unusedImport |
	imports := self getFromImport collect: [ :i | i importedEntity name ].
	imports isEmpty ifTrue: [ self halt: 'Pas de from import' ].


	unusedImport := imports select: [ :i |
		                 (self getSpecificInvocation: i) isNil ].

	^ unusedImport isEmpty
		  ifTrue: [ 'All from imports used' ]
		  ifFalse: [ unusedImport ]
]

{ #category : 'import' }
PLUtils >> getFromImport [

	^ model allImports select: [ :i | i isFromImport ]
]

{ #category : 'function' }
PLUtils >> getFunctionWithStarParams [
"Should check all star params"

	^ model allFunctions select: [ :m |
		  m isStub not and: [ m signature includesSubstring: '*_' ] ]
]

{ #category : 'function' }
PLUtils >> getFunctionsWithName: aFunctionName [

	^ model allFunctions select: [ :i | i name = aFunctionName ]
]

{ #category : 'method' }
PLUtils >> getMethodsWithStarParams [

	^ model allMethods select: [ :m |
		  m signature includesSubstring: '*_' ] "A voir pour le backslash"
]

{ #category : 'access' }
PLUtils >> getMultipleAccessedVars [

	^ (self getVarAccessesOccurence valuesAndCounts reject: [ :assoc |
		   assoc value = 1 ]) keys
]

{ #category : 'invocation' }
PLUtils >> getSpecificInvocation: aFunctionName [

	^ model allInvocations detect: [ :i | i invokedEntity name = aFunctionName ] ifNone: [ nil ]
]

{ #category : 'function' }
PLUtils >> getTTSFunction [

	^ self getFunctionsWithName: 'train_test_split'
]

{ #category : 'invocation' }
PLUtils >> getTTSInvocationPos [

	| ttsFunction |
	ttsFunction := self getTTSFunction.
	^ ttsFunction collect: [ :f |
		  (f incomingInvocations at: 1) sourceAnchor endPos ]
]

{ #category : 'access' }
PLUtils >> getTestVarAccess [

	^ model allAccesses select: [ :a |
		  a isWrite and: [
			  a variable name endsWithAnyOf: { 'test'. 'TEST'. 'Test' } ] ]
]

{ #category : 'access' }
PLUtils >> getTestVarAccessPos [

	| access |
	access := self getTestVarAccess.	
	^ access collect: [ :a | a sourceAnchor endPos ]
]

{ #category : 'access' }
PLUtils >> getVarAccessesOccurence [

	^ (model allAccesses collect: #variable) asBag
]

{ #category : 'testing' }
PLUtils >> isEntityAssignedInVar: anEntity [

	| source line samePosVariables res |

	source := anEntity sourceAnchor sourceText.
	line := anEntity sourceAnchor startLine.


	samePosVariables := model allAccesses select: [ :i |
		                      i sourceAnchor startLine = line ].

	samePosVariables ifEmpty: [ ^ false ].

	res := samePosVariables select: [ :a | a isWrite and: [ a sourceAnchor sourceText includesSubstring: source ] ].
	
	res ifEmpty: [ ^ false ]. 

	^ true
]

{ #category : 'testing' }
PLUtils >> isEntityImportedOrParentOfAnImport: anEntityName [

	^ model allImports anySatisfy: [ :import |
		  | entity match |
		  entity := import importedEntity.
		  entity notNil and: [
			  entity name = anEntityName or: [
				  | parent found |
				  found := false.
				  parent := entity.
				  [ parent parentPackage notNil and: [ found not ] ] whileTrue: [
					  parent := parent parentPackage.
					  parent name = anEntityName ifTrue: [ found := true ] ].

				  found ] ] ]
]

{ #category : 'testing' }
PLUtils >> isEntityInAnInvocation: anEntity [

	| source line samePosInvocations otherInvocations |
	self flag: #TODO.
	"Pour des cas plus complexe, plusieurs invocation de l'entite sur la meme ligne en arguent de differentes fonction => ne fonctionne probablement pas"
	source := anEntity sourceAnchor sourceText.
	line := anEntity sourceAnchor startLine.



	samePosInvocations := model allInvocations select: [ :i |
		                      i sourceAnchor startLine = line ].

	samePosInvocations size = 1 ifTrue: [ ^ false ].

	otherInvocations := samePosInvocations reject: [ :i | i = anEntity ].

	otherInvocations do: [ :i |
		(i computeArgs anySatisfy: [ :a | a includesSubstring: source ])
			ifTrue: [ ^ true ] ].

	^ false
]

{ #category : 'invocation' }
PLUtils >> isEntityNameAPackageInvoked: anEntityName [

	^ model allInvocations 
		anySatisfy: [ :i | 
			i candidates 
				anySatisfy: [ :c | 
					| parent |
					(c respondsTo: #parentPackage) 
						and: [ 
							parent := c parentPackage.
							parent notNil 
								and: [ parent name = anEntityName ]
						]
				]
		]

]

{ #category : 'invocation' }
PLUtils >> isEntityNameInvoked: aFunctionName [

	^ model allInvocations anySatisfy: [ :i | i invokedEntity name = aFunctionName ]
]

{ #category : 'invocation' }
PLUtils >> isStringUsedIsInArgs: aString [
	^ model allInvocations 
		anySatisfy: [ :i | 
			i computeArgs 
				anySatisfy: [ :arg | arg includesSubstring: aString ]
		]
]

{ #category : 'access' }
PLUtils >> isTestSetOverwrite [
	"Utiliser isEmpty plutot que > "
	| testVarPos ttsPos overwrite |
	testVarPos := self getTestVarAccessPos.
	testVarPos isEmpty ifTrue: [ self halt ].
	
	ttsPos := self getTTSInvocationPos.
	ttsPos isEmpty ifTrue: [ self halt ].
	
	overwrite := testVarPos reject: [ :w | ttsPos includes: w  ].
	
	^ overwrite isNotEmpty. 
	
	
	 
]

{ #category : 'accessing' }
PLUtils >> model [

	^model 
]

{ #category : 'accessing' }
PLUtils >> model: aModel [

	model := aModel
]
