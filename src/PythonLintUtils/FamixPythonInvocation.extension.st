Extension { #name : 'FamixPythonInvocation' }

{ #category : '*PythonLintUtils' }
FamixPythonInvocation >> arguments [

	| text start end paramsAsString res |
	text := self sourceAnchor sourceText.
	start := text indexOf: $(.
	end := text indexOf: $).
	paramsAsString := text copyFrom: start + 1 to: end - 1.
	res := paramsAsString splitOn: $,.
	^ res collect: [ :each | each trim ]
]

{ #category : '*PythonLintUtils' }
FamixPythonInvocation >> computeArgs [ 

	| text start end paramsAsString level i char paramsList currentParam |
	text := self sourceAnchor sourceText.

	start := text indexOf: $(.

	level := 1.
	i := start + 1.
	[ i <= text size and: [ level > 0 ] ] whileTrue: [
		char := text at: i.
		char = $( ifTrue: [ level := level + 1 ].
		char = $) ifTrue: [ level := level - 1 ].
		i := i + 1 ].
	end := i - 1.

	(end - 1) >= 0 ifFalse: [ self error: 'Cannot create a string with size <0' ].
	paramsAsString := text copyFrom: start + 1 to: end - 1.

	paramsList := OrderedCollection new.
	currentParam := ''.
	level := 0.
	1 to: paramsAsString size do: [ :i |
		char := paramsAsString at: i.
		char = $( ifTrue: [ level := level + 1 ].
		char = $) ifTrue: [ level := level - 1 ].
		(char = $, and: [ level = 0 ])
			ifTrue: [
				paramsList add: currentParam trim.
				currentParam := '' ]
			ifFalse: [ currentParam := currentParam , char asString ] ].

	currentParam size > 0 ifTrue: [ paramsList add: currentParam trim ].
	^ paramsList
]

{ #category : '*PythonLintUtils' }
FamixPythonInvocation >> isArgNameInInvocation: anArgName [

	^ self arguments anySatisfy: [ :a | a = anArgName ]
]
