Class {
	#name : 'BaselineOfFamixNotebook',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfFamixNotebook',
	#package : 'BaselineOfFamixNotebook'
}

{ #category : 'baselines' }
BaselineOfFamixNotebook >> baseline: spec [  
    <baseline>
    spec
    for: #common
    do: [ 
        self defineDependencies: spec.
        self definePackages: spec.]
]

{ #category : 'dependencies' }
BaselineOfFamixNotebook >> defineDependencies: spec [ 
    spec
        baseline: 'MoosePy'
        with: [ spec
            repository: 'github://moosetechnology/MoosePy:master/src' ].
]

{ #category : 'packages' }
BaselineOfFamixNotebook >> definePackages: spec [

	spec
		package: 'Famix-Notebook-Importer'
		with: [ spec requires: #( 'MoosePy' ) ];
		package: 'Famix-Notebook-Generator'
		with: [ spec requires: #( 'Famix-Notebook-Importer' ) ];
		package: 'Famix-Notebook-Entities'
		with: [ spec requires: #( 'Famix-Notebook-Generator' ) ];
		package: 'PythonLintUtils'
		with: [ spec requires: #( 'Famix-Notebook-Entities' ) ];
		package: 'Famix-Notebook-Critics'
		with: [ spec requires: #( 'PythonLintUtils' ) ]
]
