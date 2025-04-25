Class {
	#name : 'CriticsRules',
	#superclass : 'Object',
	#classVars : [
		'PandasInplaceSet',
		'SkRandomAppi'
	],
	#category : 'Famix-Notebook-Critics',
	#package : 'Famix-Notebook-Critics'
}

{ #category : 'as yet unclassified' }
CriticsRules class >> pandasInplaceMethods [
    PandasInplaceSet ifNil: [ PandasInplaceSet := Set withAll: #(
        drop
        drop_duplicates
        dropna
        rename
		  rename_axis
        pop 
        sort_values
        sort_index
        reset_index
        set_index
        fillna
        replace
        update
        set_axis
        set_value
        set_flags 
        mask
        where
		  query
		  clip
		  eval
		  backfill
		  bfill
		  ffill
		  fillna
		  interpolate
		  pad
        "Attention: certaines méthodes in-place existent aussi sur Series"
        
    ) ].
    ^ PandasInplaceSet

]

{ #category : 'as yet unclassified' }
CriticsRules class >> sklearnApiWithRandomness [
    SkRandomAppi ifNil: [ SkRandomAppi := Set withAll: #(
        "Classifieurs"
        LogisticRegression
        DecisionTreeClassifier
        RandomForestClassifier
        GradientBoostingClassifier
        ExtraTreesClassifier
        AdaBoostClassifier
        BaggingClassifier
        MLPClassifier
        SGDClassifier
        KNeighborsClassifier
        SVC

        "Régression"
        DecisionTreeRegressor
        RandomForestRegressor
        GradientBoostingRegressor
        ExtraTreesRegressor
        AdaBoostRegressor
        BaggingRegressor
        MLPRegressor
        SGDRegressor

        "Clustering"
        KMeans
        MiniBatchKMeans
        Birch
        AffinityPropagation
        SpectralClustering

        "Model selection & autres"
        train_test_split
        ShuffleSplit
        StratifiedShuffleSplit
        KFold
        StratifiedKFold
        GroupKFold
        cross_val_score
        cross_validate

        "Decomposition"
        PCA
        TruncatedSVD
        FastICA
        NMF

        "Other"
        PermutationImportance
        SelectFromModel
    ) ].
    ^ SkRandomAppi
]

{ #category : 'as yet unclassified' }
CriticsRules >> allCodeCells: aNotebookModel [

 ^ aNotebookModel select: [ :e | e class = FamixNotebookCodeCell ]
]

{ #category : 'as yet unclassified' }
CriticsRules >> notebookNameRespectConventions: aNotebookModel [

	| nameWithoutExtension |
	nameWithoutExtension := (aNotebookModel name copyUpToLast: $.)
		                        ifNil: [ aNotebookModel name ].

	^ ((#( 'Untitled' ) includes: nameWithoutExtension) or: [
		   nameWithoutExtension size <= 2 ]) not
]

{ #category : 'as yet unclassified' }
CriticsRules >> topTopBottomExection: aNotebookModel [

	| allCodeCells index res |
	allCodeCells := self allCodeCells: aNotebookModel.

	index := 0.
	res := allCodeCells reject: [ :cc |
		       | test |
		       cc executionCount ifNil: [ true ] ifNotNil: [
			       test := cc executionCount >= index.
			       index := cc executionCount.
			       test ] ].

	"Peut etre renvoyer une collection des cellule en violation pour l'export"
	^ res isEmpty
]
