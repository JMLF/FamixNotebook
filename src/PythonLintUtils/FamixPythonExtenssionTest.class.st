Class {
	#name : 'FamixPythonExtenssionTest',
	#superclass : 'TestCase',
	#instVars : [
		'source',
		'notebookModel',
		'pythonModel'
	],
	#category : 'PythonLintUtils',
	#package : 'PythonLintUtils'
}

{ #category : 'running' }
FamixPythonExtenssionTest >> setUp [
	super setUp.

	source := '/Users/mignard/Documents/work/student_2.ipynb' asFileReference.
	notebookModel := NotebookJsonReader new readFrom: source; yourself. 
	pythonModel := notebookModel pythonModel. 
]

{ #category : 'tests' }
FamixPythonExtenssionTest >> testArguments [ 

	| invocations argments |
	invocations := pythonModel allInvocations. 
	
	self assert: (invocations isEmpty) not.
	
	argments := invocations collect: [ :i | i computeArgs ].

	self assert: (argments size) = (invocations size).
]
