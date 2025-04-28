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
        GenericUnivariateSelect
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
        RobustScaler
        MinMaxScaler
        MaxAbsScaler
        StandardScaler
        Normalizer
        Binarizer
        PolynomialFeatures
        OneHotEncoder
        OrdinalEncoder
        LabelEncoder
        MultiLabelBinarizer

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
