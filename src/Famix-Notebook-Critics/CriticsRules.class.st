Class {
	#name : 'CriticsRules',
	#superclass : 'Object',
	#classVars : [
		'PandasInplaceSet',
		'SkHyperParamApi',
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
CriticsRules class >> sklearnApiWithHyperparameters [
    SkHyperParamApi ifNil: [ SkHyperParamApi := Set withAll: #(
        "Classification"
        LogisticRegression
        DecisionTreeClassifier
        RandomForestClassifier
        GradientBoostingClassifier
        HistGradientBoostingClassifier
        ExtraTreesClassifier
        AdaBoostClassifier
        BaggingClassifier
        MLPClassifier
        SGDClassifier
        Perceptron
        PassiveAggressiveClassifier
        QuadraticDiscriminantAnalysis
        GaussianProcessClassifier
        VotingClassifier
        StackingClassifier
        CalibratedClassifierCV
        KNeighborsClassifier
        RadiusNeighborsClassifier
        NearestCentroid
        ComplementNB
        MultinomialNB
        BernoulliNB
        CategoricalNB
        GaussianNB
        LinearDiscriminantAnalysis

        "Regression"
        LinearRegression
        Ridge
        RidgeCV
        Lasso
        LassoCV
        ElasticNet
        ElasticNetCV
        LassoLars
        LassoLarsCV
        LassoLarsIC
        OrthogonalMatchingPursuit
        OrthogonalMatchingPursuitCV
        BayesianRidge
        ARDRegression
        LogisticRegressionCV
        DecisionTreeRegressor
        RandomForestRegressor
        GradientBoostingRegressor
        HistGradientBoostingRegressor
        ExtraTreesRegressor
        AdaBoostRegressor
        BaggingRegressor
        MLPRegressor
        SGDRegressor
        HuberRegressor
        RANSACRegressor
        TheilSenRegressor
        PassiveAggressiveRegressor
        PoissonRegressor
        TweedieRegressor
        GammaRegressor
        QuantileRegressor
        StackingRegressor
        VotingRegressor

        "Clustering"
        KMeans
        MiniBatchKMeans
        Birch
        AffinityPropagation
        SpectralClustering
        GaussianMixture
        BayesianGaussianMixture
        MeanShift
        AgglomerativeClustering
        OPTICS
        FeatureAgglomeration
        DBSCAN

        "Decomposition / Dimensionality Reduction"
        PCA
        IncrementalPCA
        KernelPCA
        TruncatedSVD
        FastICA
        NMF
        FactorAnalysis
        DictionaryLearning
        MiniBatchDictionaryLearning
        SparsePCA
        MiniBatchSparsePCA
        LatentDirichletAllocation

        "Neighbors"
        NearestNeighbors
        KNeighborsRegressor
        KNeighborsTransformer
        RadiusNeighborsRegressor

        "Feature selection"
        SelectKBest
        SelectPercentile
        SelectFromModel
        RFE
        RFECV
        SequentialFeatureSelector
        mutual_info_classif
        mutual_info_regression

        "Embedding"
        Isomap
        LocallyLinearEmbedding
        SpectralEmbedding
        TSNE
        MDS
        GaussianRandomProjection
        SparseRandomProjection

        "Imputation / Preprocessing"
        SimpleImputer
        IterativeImputer
        KNNImputer
        PowerTransformer
        QuantileTransformer
        FunctionTransformer
        PolynomialFeatures
        OneHotEncoder
        OrdinalEncoder

        "Ensemble"
        BaggingClassifier
        BaggingRegressor
        RandomForestClassifier
        RandomForestRegressor
        ExtraTreesClassifier
        ExtraTreesRegressor
        AdaBoostClassifier
        AdaBoostRegressor
        GradientBoostingClassifier
        GradientBoostingRegressor
        HistGradientBoostingClassifier
        HistGradientBoostingRegressor
        VotingClassifier
        VotingRegressor
        StackingClassifier
        StackingRegressor

    ) ].
    ^ SkHyperParamApi

]

{ #category : 'as yet unclassified' }
CriticsRules class >> sklearnApiWithRandomness [
    SkRandomAppi ifNil: [ SkRandomAppi := Set withAll: #(
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
        DecisionTreeRegressor
        RandomForestRegressor
        GradientBoostingRegressor
        ExtraTreesRegressor
        AdaBoostRegressor
        BaggingRegressor
        MLPRegressor
        SGDRegressor
        KMeans
        MiniBatchKMeans
        Birch
        AffinityPropagation
        SpectralClustering
        train_test_split
        ShuffleSplit
        StratifiedShuffleSplit
        KFold
        StratifiedKFold
        GroupKFold
        cross_val_score
        cross_validate
        PCA
        TruncatedSVD
        FastICA
        NMF
        PermutationImportance
        SelectFromModel
        mutual_info_regression
        mutual_info_classif
        LatentDirichletAllocation
        MiniBatchSparsePCA
        SparsePCA
        MiniBatchDictionaryLearning
        DictionaryLearning
        FactorAnalysis
        NMF
        FastICA
        TruncatedSVD
        KernelPCA
        BayesianGaussianMixture
        GaussianMixture
        SpectralClustering
        AffinityPropagation
    ) ].
    ^ SkRandomAppi
]

{ #category : 'as yet unclassified' }
CriticsRules >> allCodeCells: aNotebookModel [

 ^ aNotebookModel select: [ :e | e class = FamixNotebookCodeCell ]
]

{ #category : 'as yet unclassified' }
CriticsRules >> allTextCells: aNotebookModel [

 ^ aNotebookModel select: [ :e | e class = FamixNotebookTextCell ]
]

{ #category : 'as yet unclassified' }
CriticsRules >> allUnknowAccessOrReference: aNotebookModel [

	| pythonModel |
	pythonModel := self pythonModelOfNotebookModel: aNotebookModel.
	^ pythonModel select: [ :e |
		  e class = FamixPythonUnknowAccessOrReference ]
]

{ #category : 'as yet unclassified' }
CriticsRules >> buildReport: aNotebookModel [

| manualViolations |

self flag: #todo. "Mettre cette methode et les autres dans le runner, dans cette classe on ne va laisser que les regles"

manualViolations := OrderedCollection new.

(self doesNotebookNamecontainUntitled: aNotebookModel) ifTrue: [
    manualViolations add: (self buildViolationDictionaryFrom: (
        Dictionary newFromPairs: {
            #rulesId. '20'.
            #name. 'Untitled notebook'.
            #summary. 'The notebook still has the default title: Untitled[<number>].ipynb'.
            #severityTitle. 'warning'.
            #mooseName. 'notebook'.
            #sourceText. aNotebookModel name.
            #pos. 'file'
        }
    ))
].

(self doesNotebookNameUseValidCharset: aNotebookModel) ifFalse: [
    manualViolations add: (self buildViolationDictionaryFrom: (
        Dictionary newFromPairs: {
            #rulesId. '21'.
            #name. 'Non portable chars in nb name'.
            #summary. 'The notebook filename contains non-portable characters (i.e., characters outside the [A-Za-z0-9_.-] charset). Rename your notebook by using characters contained in the following portable charset: [A-Za-z0-9_.-].'.
            #severityTitle. 'warning'.
            #mooseName. 'notebook'.
            #sourceText. aNotebookModel name.
            #pos. 'file'
        }
    ))
].

(self isNotebookNameLongEnought: aNotebookModel) ifFalse: [
    manualViolations add: (self buildViolationDictionaryFrom: (
        Dictionary newFromPairs: {
            #rulesId. '22'.
            #name. 'Notebook name too short'.
            #summary. 'Your notebook name name should be gratter than 2 characters'.
            #severityTitle. 'warning'.
            #mooseName. 'notebook'.
            #sourceText. aNotebookModel name.
            #pos. 'file'
        }
    ))
].

(self containTextCell: aNotebookModel) ifFalse: [
    manualViolations add: (self buildViolationDictionaryFrom: (
        Dictionary newFromPairs: {
            #rulesId. '23'.
            #name. 'Notebook should contain text cells'.
            #summary. 'Levrage the literate paradigm to explain your code using markdowns cells'.
            #severityTitle. 'warning'.
            #mooseName. 'notebook'.
            #sourceText. ''.
            #pos. 'notebook'
        }
    ))
].

(self isNotebookTooLong: aNotebookModel) ifTrue: [
    manualViolations add: (self buildViolationDictionaryFrom: (
        Dictionary newFromPairs: {
            #rulesId. '24'.
            #name. 'Notebook too long'.
            #summary. 'Your notebook should not exceed 50 code cells'.
            #severityTitle. 'warning'.
            #mooseName. 'notebook'.
            #sourceText. ''.
            #pos. 'notebook'
        }
    ))
].

(self isNotebookversionControlled: aNotebookModel) ifFalse: [
    manualViolations add: (self buildViolationDictionaryFrom: (
        Dictionary newFromPairs: {
            #rulesId. '25'.
            #name. 'No version control'.
            #summary. 'you should display the version of used librarie to ensure reproductibility'.
            #severityTitle. 'warning'.
            #mooseName. 'notebook'.
            #sourceText. ''.
            #pos. 'notebook'
        }
    ))
].

(self topTopBottomExection: aNotebookModel) ifFalse: [
    manualViolations add: (self buildViolationDictionaryFrom: (
        Dictionary newFromPairs: {
            #rulesId. '26'.
            #name. 'Non linear execution'.
            #summary. 'Notebook code cells not run in order'.
            #severityTitle. 'warning'.
            #mooseName. 'notebook'.
            #sourceText. ''.
            #pos. 'notebook'
        }
    ))
].

^manualViolations
]

{ #category : 'as yet unclassified' }
CriticsRules >> buildViolationDictionaryFrom: anObject [
    anObject isDictionary ifTrue: [
        ^ Dictionary newFromPairs: {
            'Rule ID'. anObject at: #rulesId.
            'Rule name'. anObject at: #name.
            'Rule summary'. anObject at: #summary.
            'Severity'. anObject at: #severityTitle.
            'Violating Entity'. anObject at: #mooseName.
            'Source text'. anObject at: #sourceText.
            'Violating position'. anObject at: #pos
        }
    ].

    "Sinon c'est un vrai Violation"
    ^ Dictionary newFromPairs: {
        'Rule ID'. anObject violatedCondition rulesId.
        'Rule name'. anObject violatedCondition name.
        'Rule summary'. anObject violatedCondition summary.
        'Severity'. anObject violatedCondition severity title.
        'Violating Entity'. anObject violatingEntity mooseName.
        'Source text'. anObject violatingEntity sourceText.
        'Violating position'. ('cell : ', anObject violatingEntity cellId asString)
    }.
]

{ #category : 'as yet unclassified' }
CriticsRules >> containTextCell: aNotebookModel [

	^ (self allTextCells: aNotebookModel) isNotEmpty 
]

{ #category : 'as yet unclassified' }
CriticsRules >> doesNotebookNameUseValidCharset: aNotebookModel [

	| nameWithoutExtension |
	nameWithoutExtension := (aNotebookModel name copyUpToLast: $.)
		                        ifNil: [ aNotebookModel name ].

	^ nameWithoutExtension matchesRegex: '^[A-Za-z0-9_.-]+$'
]

{ #category : 'as yet unclassified' }
CriticsRules >> doesNotebookNamecontainUntitled: aNotebookModel [

	| nameWithoutExtension |
	nameWithoutExtension := (aNotebookModel name copyUpToLast: $.)
		                        ifNil: [ aNotebookModel name ].

	^ nameWithoutExtension includesSubstring: 'Untitled'
]

{ #category : 'testing' }
CriticsRules >> isNotebookNameLongEnought: aNotebookModel [

	| nameWithoutExtension |
	nameWithoutExtension := (aNotebookModel name copyUpToLast: $.)
		                        ifNil: [ aNotebookModel name ].

	^ nameWithoutExtension size > 2
]

{ #category : 'as yet unclassified' }
CriticsRules >> isNotebookTooLong: aNotebookModel [

	| allCodeCells |
	allCodeCells := self allCodeCells: aNotebookModel.

	^ allCodeCells size > 50
]

{ #category : 'as yet unclassified' }
CriticsRules >> isNotebookversionControlled: aNotebookModel [

	| pythonModel version uAccessOrREf |
	pythonModel := self pythonModelOfNotebookModel: aNotebookModel.
	((pythonModel allInvocations anySatisfy: [ :i |
		  i invokedEntity name = #watermark ]) and: [
		 pythonModel allImports anySatisfy: [ :i |
			 i importedEntity name = #watermark ] ]) ifTrue: [ ^ true ].

	uAccessOrREf := self allUnknowAccessOrReference: aNotebookModel.
	version := uAccessOrREf select: [ :u |
		           u unknownEntity mooseName = #__version__ ].

	^ version isNotEmpty
]

{ #category : 'as yet unclassified' }
CriticsRules >> notebookNameRespectConventions: aNotebookModel [
"Faire evoluer pour s'assurer qu'il ne contient ni Untitled et est composer que de charactere portable"
	| nameWithoutExtension |
	nameWithoutExtension := (aNotebookModel name copyUpToLast: $.)
		                        ifNil: [ aNotebookModel name ].

	^ ((#( 'Untitled' ) includes: nameWithoutExtension) or: [
		   nameWithoutExtension size <= 2 ]) not
]

{ #category : 'as yet unclassified' }
CriticsRules >> pythonModelOfNotebookModel: aNotebookModel [ 

^(aNotebookModel select: [:e | e class = FamixNotebookCodeCell and: [ e entities isNotEmpty ] ]) first entities first mooseModel
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
