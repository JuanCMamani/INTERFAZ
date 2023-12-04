"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestTPPOO,
	#superclass : #PackageManifest,
	#category : #'TPPOO-Manifest'
}

{ #category : #'code-critics' }
ManifestTPPOO class >> ruleClassNotReferencedRuleV1FalsePositive [
	^ #(#(#(#RGClassDefinition #(#Usuario)) #'2023-12-03T17:41:57.761-03:00') )
]

{ #category : #'code-critics' }
ManifestTPPOO class >> ruleCodeCruftLeftInMethodsRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#'CargaSistema class' #realizarInicio #true)) #'2023-12-02T16:06:48.122-03:00') #(#(#RGMethodDefinition #(#'EmpresaTurismo class' #create #true)) #'2023-12-02T16:50:25.537-03:00') #(#(#RGMethodDefinition #(#VistaAdmin #generarTuplas: #false)) #'2023-12-02T19:57:14.465-03:00') #(#(#RGMethodDefinition #(#VistaAdmin #opcionBaja #false)) #'2023-12-02T20:56:08.419-03:00') #(#(#RGMethodDefinition #(#VistaAdmin #actionSech:panel:sech: #false)) #'2023-12-02T21:14:49.556-03:00') #(#(#RGMethodDefinition #(#SectionSeach #initialize:in: #false)) #'2023-12-03T09:28:47.085-03:00') #(#(#RGMethodDefinition #(#SectionSeach #actionSech:panel:sech: #false)) #'2023-12-03T09:36:04.584-03:00') )
]

{ #category : #'code-critics' }
ManifestTPPOO class >> ruleCollectionProtocolRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#SectionSeach #generarTuplas: #false)) #'2023-12-03T09:44:08.868-03:00') #(#(#RGMethodDefinition #(#Organizado #getInfoListaFechas #false)) #'2023-12-03T12:31:40.755-03:00') )
]

{ #category : #'code-critics' }
ManifestTPPOO class >> ruleInconsistentMethodClassificationRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#Organizado #mostrarFechas #false)) #'2023-12-03T12:16:15.573-03:00') #(#(#RGMethodDefinition #(#Organizado #getInfo #false)) #'2023-12-03T12:20:02.026-03:00') )
]

{ #category : #'code-critics' }
ManifestTPPOO class >> ruleLongMethodsRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#'CargaSistema class' #realizarInicio #true)) #'2023-12-02T16:06:54.26-03:00') #(#(#RGMethodDefinition #(#'EmpresaTurismo class' #create #true)) #'2023-12-02T16:50:20.931-03:00') #(#(#RGMethodDefinition #(#VistaAdmin #generarTuplas: #false)) #'2023-12-02T17:33:22.484-03:00') #(#(#RGMethodDefinition #(#VistaAdmin #opcionBaja #false)) #'2023-12-02T17:37:09.415-03:00') #(#(#RGMethodDefinition #(#VistaAdmin #updateView:panel: #false)) #'2023-12-02T21:31:06.931-03:00') #(#(#RGMethodDefinition #(#SectionSeach #initialize:in: #false)) #'2023-12-03T09:28:59.579-03:00') #(#(#RGMethodDefinition #(#SectionSeach #generarTuplas: #false)) #'2023-12-03T09:30:51.866-03:00') #(#(#RGMethodDefinition #(#SectionSeach #updateView:panel: #false)) #'2023-12-03T09:33:34.381-03:00') #(#(#RGMethodDefinition #(#SectionSeach #verInfo: #false)) #'2023-12-03T11:47:27.807-03:00') #(#(#RGMethodDefinition #(#VistaAdmin #ingresaAdmin #false)) #'2023-12-03T13:29:04.573-03:00') #(#(#RGMethodDefinition #(#VistaAdmin #opcionesViaje #false)) #'2023-12-03T13:29:23.337-03:00') #(#(#RGMethodDefinition #(#VistaAdmin #altaViajeOrganizado #false)) #'2023-12-03T13:52:46.607-03:00') #(#(#RGMethodDefinition #(#VistaUser #initialize #false)) #'2023-12-03T20:14:58.2-03:00') #(#(#RGMethodDefinition #(#NewUser #inicializar: #false)) #'2023-12-03T20:19:54.46-03:00') #(#(#RGMethodDefinition #(#VistaUser #iniciarVistaUser #false)) #'2023-12-03T21:35:45.89-03:00') #(#(#RGMethodDefinition #(#VistaUser #iniciarVistaUser: #false)) #'2023-12-03T21:49:51.302-03:00') )
]

{ #category : #'code-critics' }
ManifestTPPOO class >> ruleMissingSuperSendsRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#VistaUser #initialize #false)) #'2023-12-03T20:14:55.58-03:00') )
]

{ #category : #'code-critics' }
ManifestTPPOO class >> ruleMultiplePeriodsTerminatingStatementRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#VistaAdmin #opcionBaja #false)) #'2023-12-02T20:53:17.995-03:00') #(#(#RGMethodDefinition #(#SectionSeach #initialize:in: #false)) #'2023-12-03T09:28:44.91-03:00') )
]

{ #category : #'code-critics' }
ManifestTPPOO class >> ruleNoClassCommentRuleV1FalsePositive [
	^ #(#(#(#RGClassDefinition #(#SectionSeach)) #'2023-12-03T09:40:17.681-03:00') #(#(#RGClassDefinition #(#Usuario)) #'2023-12-03T17:41:55.166-03:00') #(#(#RGClassDefinition #(#Sistema)) #'2023-12-03T17:46:59.903-03:00') #(#(#RGClassDefinition #(#VistaUser)) #'2023-12-03T20:37:02.996-03:00') #(#(#RGClassDefinition #(#Login)) #'2023-12-03T21:57:58.205-03:00') )
]

{ #category : #'code-critics' }
ManifestTPPOO class >> ruleNoUnusedInstanceVariableRuleV1FalsePositive [
	^ #(#(#(#RGClassDefinition #(#SectionSeach)) #'2023-12-03T09:40:11.619-03:00') #(#(#RGClassDefinition #(#Usuario)) #'2023-12-03T17:41:51.379-03:00') #(#(#RGClassDefinition #(#Sistema)) #'2023-12-03T17:46:57.07-03:00') #(#(#RGClassDefinition #(#VistaUser)) #'2023-12-03T20:36:55.353-03:00') )
]

{ #category : #'code-critics' }
ManifestTPPOO class >> ruleReGuardClauseRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#SectionSeach #verInfo: #false)) #'2023-12-03T12:03:46.235-03:00') )
]

{ #category : #'code-critics' }
ManifestTPPOO class >> ruleReIvarNeitherReadNorWrittenRuleV1FalsePositive [
	^ #(#(#(#RGMetaclassDefinition #(#'Sistema class' #Sistema)) #'2023-12-02T16:09:22.637-03:00') #(#(#RGClassDefinition #(#SectionSeach)) #'2023-12-03T09:40:14.862-03:00') #(#(#RGClassDefinition #(#Usuario)) #'2023-12-03T17:41:48.283-03:00') #(#(#RGClassDefinition #(#Sistema)) #'2023-12-03T17:46:54.65-03:00') #(#(#RGClassDefinition #(#VistaUser)) #'2023-12-03T20:36:57.93-03:00') )
]

{ #category : #'code-critics' }
ManifestTPPOO class >> ruleReTemporaryNeitherReadNorWrittenRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#VistaAdmin #generarTuplas: #false)) #'2023-12-02T17:10:46.817-03:00') #(#(#RGMethodDefinition #(#SectionSeach #generarTuplas: #false)) #'2023-12-03T09:38:08.256-03:00') #(#(#RGMethodDefinition #(#SectionSeach #verInfo: #false)) #'2023-12-03T11:57:35.14-03:00') )
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
	^ #(#(#(#RGMethodDefinition #(#VistaAdmin #generarTuplas: #false)) #'2023-12-02T17:33:24.736-03:00') #(#(#RGMethodDefinition #(#SectionSeach #generarTuplas: #false)) #'2023-12-03T09:30:54.693-03:00') #(#(#RGMethodDefinition #(#Organizado #mostrarFechas #false)) #'2023-12-03T12:16:13.348-03:00') )
]

{ #category : #'code-critics' }
ManifestTPPOO class >> ruleTempsReadBeforeWrittenRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#VistaAdmin #generarTuplas: #false)) #'2023-12-03T09:10:36.909-03:00') #(#(#RGMethodDefinition #(#SectionSeach #generarTuplas: #false)) #'2023-12-03T09:30:57.955-03:00') #(#(#RGMethodDefinition #(#SectionSeach #verInfo: #false)) #'2023-12-03T11:39:47.314-03:00') )
]

{ #category : #'code-critics' }
ManifestTPPOO class >> ruleUnaryAccessingMethodWithoutReturnRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#VistaAdmin #generarTuplas #false)) #'2023-12-02T17:10:03.64-03:00') #(#(#RGMethodDefinition #(#VistaAdmin #opcionBaja #false)) #'2023-12-02T17:37:11.346-03:00') #(#(#RGMethodDefinition #(#VistaAdmin #opcionesViaje #false)) #'2023-12-03T13:29:19.695-03:00') #(#(#RGMethodDefinition #(#VistaAdmin #altaViajeOrganizado #false)) #'2023-12-03T13:40:04.474-03:00') #(#(#RGMethodDefinition #(#NewUser #ocultarMorph #false)) #'2023-12-03T21:48:33.056-03:00') #(#(#RGMethodDefinition #(#Login #ingresaNewUser #false)) #'2023-12-03T21:59:38.814-03:00') )
]

{ #category : #'code-critics' }
ManifestTPPOO class >> ruleUtilityMethodsRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#VistaAdmin #generarTuplas: #false)) #'2023-12-02T17:10:50.143-03:00') #(#(#RGMethodDefinition #(#VistaAdmin #updateView:panel: #false)) #'2023-12-02T21:13:40.548-03:00') #(#(#RGMethodDefinition #(#SectionSeach #generarTuplas: #false)) #'2023-12-03T09:30:49.848-03:00') #(#(#RGMethodDefinition #(#SectionSeach #updateView:panel: #false)) #'2023-12-03T09:33:36.603-03:00') )
]

{ #category : #'code-critics' }
ManifestTPPOO class >> ruleVariableReferencedOnceRuleV1FalsePositive [
	^ #(#(#(#RGClassDefinition #(#VistaUser)) #'2023-12-03T20:37:00.839-03:00') #(#(#RGClassDefinition #(#Login)) #'2023-12-03T21:58:01.605-03:00') )
]
