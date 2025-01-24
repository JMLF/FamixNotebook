# Famix notebook model

## Usage :
Generate metamodel :
```smalltalk
FamixNotebookgenerator generate

"Example :"
codeCell := FamixNotebookcodeCell new id: 1; yourself.
codeCell addEntity: (FamixPythonMethod new).
codeCell addEntity: (FamixPythonGlobalVariable new name: 'maVar'; yourself ).
mdCell := FamixNotebooktextCell new isMarkdown: true; content: '#Test'; yourself. 
```

Create a model from a file :
```smalltalk
file := '/Users/mignard/Documents/work/mooseDemo/tmp/Split_with_train_override.ipynb' asFileReference.
NotebookJsonReader new readFrom: file.
```

Export metamodel to plantUML :
```smalltlk
documentor := FamixUMLDocumentor new.
documentor
    model: FamixNotebookEntity ;
    generate.
FamixUMLPlantUMLBackend new export: documentor umlEntities.
```
