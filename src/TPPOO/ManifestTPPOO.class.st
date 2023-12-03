"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestTPPOO,
	#superclass : #PackageManifest,
	#category : #'TPPOO-Manifest'
}

{ #category : #'code-critics' }
ManifestTPPOO class >> ruleCodeCruftLeftInMethodsRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#'CargaSistema class' #realizarInicio #true)) #'2023-12-02T16:06:48.122-03:00') #(#(#RGMethodDefinition #(#'EmpresaTurismo class' #create #true)) #'2023-12-02T16:50:25.537-03:00') #(#(#RGMethodDefinition #(#VistaAdmin #generarTuplas: #false)) #'2023-12-02T19:57:14.465-03:00') #(#(#RGMethodDefinition #(#VistaAdmin #opcionBaja #false)) #'2023-12-02T20:56:08.419-03:00') #(#(#RGMethodDefinition #(#VistaAdmin #actionSech:panel:sech: #false)) #'2023-12-02T21:14:49.556-03:00') #(#(#RGMethodDefinition #(#SectionSeach #initialize:in: #false)) #'2023-12-03T09:28:47.085-03:00') #(#(#RGMethodDefinition #(#SectionSeach #actionSech:panel:sech: #false)) #'2023-12-03T09:36:04.584-03:00') )
]

{ #category : #'code-critics' }
ManifestTPPOO class >> ruleCollectionProtocolRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#SectionSeach #generarTuplas: #false)) #'2023-12-03T09:44:08.868-03:00') )
]

{ #category : #'code-critics' }
ManifestTPPOO class >> ruleLongMethodsRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#'CargaSistema class' #realizarInicio #true)) #'2023-12-02T16:06:54.26-03:00') #(#(#RGMethodDefinition #(#'EmpresaTurismo class' #create #true)) #'2023-12-02T16:50:20.931-03:00') #(#(#RGMethodDefinition #(#VistaAdmin #generarTuplas: #false)) #'2023-12-02T17:33:22.484-03:00') #(#(#RGMethodDefinition #(#VistaAdmin #opcionBaja #false)) #'2023-12-02T17:37:09.415-03:00') #(#(#RGMethodDefinition #(#VistaAdmin #updateView:panel: #false)) #'2023-12-02T21:31:06.931-03:00') #(#(#RGMethodDefinition #(#SectionSeach #initialize:in: #false)) #'2023-12-03T09:28:59.579-03:00') #(#(#RGMethodDefinition #(#SectionSeach #generarTuplas: #false)) #'2023-12-03T09:30:51.866-03:00') #(#(#RGMethodDefinition #(#SectionSeach #updateView:panel: #false)) #'2023-12-03T09:33:34.381-03:00') )
]

{ #category : #'code-critics' }
ManifestTPPOO class >> ruleMultiplePeriodsTerminatingStatementRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#VistaAdmin #opcionBaja #false)) #'2023-12-02T20:53:17.995-03:00') #(#(#RGMethodDefinition #(#SectionSeach #initialize:in: #false)) #'2023-12-03T09:28:44.91-03:00') )
]

{ #category : #'code-critics' }
ManifestTPPOO class >> ruleNoClassCommentRuleV1FalsePositive [
	^ #(#(#(#RGClassDefinition #(#SectionSeach)) #'2023-12-03T09:40:17.681-03:00') )
]

{ #category : #'code-critics' }
ManifestTPPOO class >> ruleNoUnusedInstanceVariableRuleV1FalsePositive [
	^ #(#(#(#RGClassDefinition #(#SectionSeach)) #'2023-12-03T09:40:11.619-03:00') )
]

{ #category : #'code-critics' }
ManifestTPPOO class >> ruleReIvarNeitherReadNorWrittenRuleV1FalsePositive [
	^ #(#(#(#RGMetaclassDefinition #(#'Sistema class' #Sistema)) #'2023-12-02T16:09:22.637-03:00') #(#(#RGClassDefinition #(#SectionSeach)) #'2023-12-03T09:40:14.862-03:00') )
]

{ #category : #'code-critics' }
ManifestTPPOO class >> ruleReTemporaryNeitherReadNorWrittenRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#VistaAdmin #generarTuplas: #false)) #'2023-12-02T17:10:46.817-03:00') #(#(#RGMethodDefinition #(#SectionSeach #generarTuplas: #false)) #'2023-12-03T09:38:08.256-03:00') )
]

{ #category : #'code-critics' }
ManifestTPPOO class >> ruleRefersToClassRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#'EmpresaTurismo class' #create #true)) #'2023-12-02T16:50:23.305-03:00') )
]

{ #category : #'code-critics' }
ManifestTPPOO class >> ruleSelfSentNotImplementedRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#VistaAdmin #opcionBaja #false)) #'2023-12-02T20:52:43.108-03:00') #(#(#RGMethodDefinition #(#SectionSeach #initialize:in: #false)) #'2023-12-03T09:28:42.905-03:00') )
]

{ #category : #'code-critics' }
ManifestTPPOO class >> ruleStringConcatenationRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#VistaAdmin #generarTuplas: #false)) #'2023-12-02T17:33:24.736-03:00') #(#(#RGMethodDefinition #(#SectionSeach #generarTuplas: #false)) #'2023-12-03T09:30:54.693-03:00') )
]

{ #category : #'code-critics' }
ManifestTPPOO class >> ruleTempsReadBeforeWrittenRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#VistaAdmin #generarTuplas: #false)) #'2023-12-03T09:10:36.909-03:00') #(#(#RGMethodDefinition #(#SectionSeach #generarTuplas: #false)) #'2023-12-03T09:30:57.955-03:00') )
]

{ #category : #'code-critics' }
ManifestTPPOO class >> ruleUnaryAccessingMethodWithoutReturnRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#VistaAdmin #generarTuplas #false)) #'2023-12-02T17:10:03.64-03:00') #(#(#RGMethodDefinition #(#VistaAdmin #opcionBaja #false)) #'2023-12-02T17:37:11.346-03:00') )
]

{ #category : #'code-critics' }
ManifestTPPOO class >> ruleUtilityMethodsRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#VistaAdmin #generarTuplas: #false)) #'2023-12-02T17:10:50.143-03:00') #(#(#RGMethodDefinition #(#VistaAdmin #updateView:panel: #false)) #'2023-12-02T21:13:40.548-03:00') #(#(#RGMethodDefinition #(#SectionSeach #generarTuplas: #false)) #'2023-12-03T09:30:49.848-03:00') #(#(#RGMethodDefinition #(#SectionSeach #updateView:panel: #false)) #'2023-12-03T09:33:36.603-03:00') )
]
