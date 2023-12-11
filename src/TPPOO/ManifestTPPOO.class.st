"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestTPPOO,
	#superclass : #PackageManifest,
	#category : #'TPPOO-Manifest'
}

{ #category : #'code-critics' }
ManifestTPPOO class >> ruleAddRemoveDependentsRuleV1FalsePositive [
	^ #(#(#(#RGClassDefinition #(#SeachViaje)) #'2023-12-05T14:01:06.718-03:00') #(#(#RGClassDefinition #(#SeachContratos)) #'2023-12-05T20:19:23.995-03:00') )
]

{ #category : #'code-critics' }
ManifestTPPOO class >> ruleAssignmentInIfTrueRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#Contrato #getInfo #false)) #'2023-12-05T20:43:11.559-03:00') )
]

{ #category : #'code-critics' }
ManifestTPPOO class >> ruleAssignmentWithoutEffectRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#VistaAdmin #ingresaAdmin:empresa: #false)) #'2023-12-05T10:47:09.509-03:00') )
]

{ #category : #'code-critics' }
ManifestTPPOO class >> ruleCascadedNextPutAllsRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#Contrato #verificarId: #false)) #'2023-12-05T21:57:55.133-03:00') #(#(#RGMethodDefinition #(#SeachViajeListContEntre #actionSech #false)) #'2023-12-10T15:47:44.488-03:00') #(#(#RGMethodDefinition #(#Viaje #verificarCupo:cantPersonas: #false)) #'2023-12-10T19:44:41.099-03:00') #(#(#RGMethodDefinition #(#Contrato #contratoPagado #false)) #'2023-12-10T20:16:45.855-03:00') )
]

{ #category : #'code-critics' }
ManifestTPPOO class >> ruleClassNameInSelectorRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#'MorphAltaViajeE class' #crearMorphAltaViajeEs #true)) #'2023-12-04T15:10:11.305-03:00') #(#(#RGMethodDefinition #(#'Login class' #crearLogin: #true)) #'2023-12-05T14:31:59.955-03:00') #(#(#RGMethodDefinition #(#'NewUser class' #crearNewUser:sitema: #true)) #'2023-12-05T16:21:54.45-03:00') )
]

{ #category : #'code-critics' }
ManifestTPPOO class >> ruleClassNotReferencedRuleV1FalsePositive [
	^ #(#(#(#RGClassDefinition #(#Usuario)) #'2023-12-03T17:41:57.761-03:00') #(#(#RGClassDefinition #(#MorphAltaViajeE)) #'2023-12-04T15:00:43.348-03:00') #(#(#RGClassDefinition #(#MorphViaje)) #'2023-12-04T15:27:36.07-03:00') #(#(#RGClassDefinition #(#SeachViaje)) #'2023-12-04T21:22:43.185-03:00') #(#(#RGClassDefinition #(#Ventana)) #'2023-12-05T15:20:50.952-03:00') #(#(#RGClassDefinition #(#SeachViajeLstCont)) #'2023-12-05T16:46:50.545-03:00') #(#(#RGClassDefinition #(#SeachContratos)) #'2023-12-05T20:19:28.425-03:00') #(#(#RGClassDefinition #(#MorphInfoViaje)) #'2023-12-06T12:04:52.265-03:00') #(#(#RGClassDefinition #(#MorphListParada)) #'2023-12-09T23:28:54.598-03:00') #(#(#RGClassDefinition #(#SeachViajeListContEntre)) #'2023-12-10T11:19:03.708-03:00') )
]

{ #category : #'code-critics' }
ManifestTPPOO class >> ruleCodeCruftLeftInMethodsRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#'CargaSistema class' #realizarInicio #true)) #'2023-12-02T16:06:48.122-03:00') #(#(#RGMethodDefinition #(#'EmpresaTurismo class' #create #true)) #'2023-12-02T16:50:25.537-03:00') #(#(#RGMethodDefinition #(#VistaAdmin #generarTuplas: #false)) #'2023-12-02T19:57:14.465-03:00') #(#(#RGMethodDefinition #(#VistaAdmin #opcionBaja #false)) #'2023-12-02T20:56:08.419-03:00') #(#(#RGMethodDefinition #(#VistaAdmin #actionSech:panel:sech: #false)) #'2023-12-02T21:14:49.556-03:00') #(#(#RGMethodDefinition #(#SeachViajeList #initialize:in: #false)) #'2023-12-03T09:28:47.085-03:00') #(#(#RGMethodDefinition #(#SeachViajeList #actionSech:panel:sech: #false)) #'2023-12-03T09:36:04.584-03:00') #(#(#RGMethodDefinition #(#SeachViajeList #iniciarSectionSeach #false)) #'2023-12-04T20:17:32.334-03:00') #(#(#RGMethodDefinition #(#SeachViaje #actionSech #false)) #'2023-12-04T23:37:05.048-03:00') #(#(#RGMethodDefinition #(#EmpresaTurismo #deleteViaje: #false)) #'2023-12-05T11:25:58.347-03:00') #(#(#RGMethodDefinition #(#SeachViaje #verInfo: #false)) #'2023-12-05T12:12:57.993-03:00') #(#(#RGMethodDefinition #(#SeachViaje #generarInfo: #false)) #'2023-12-05T12:14:29.213-03:00') #(#(#RGMethodDefinition #(#Sistema #inicializarSistemaConDatos #false)) #'2023-12-05T15:29:39.845-03:00') #(#(#RGMethodDefinition #(#SeachContratos #return: #false)) #'2023-12-05T21:55:41.045-03:00') #(#(#RGMethodDefinition #(#Contrato #verificarId: #false)) #'2023-12-05T21:57:50.539-03:00') #(#(#RGMethodDefinition #(#MorphInfoContrato #update: #false)) #'2023-12-06T11:37:19.498-03:00') #(#(#RGMethodDefinition #(#MorphFechaImputList #deleteFecha:item: #false)) #'2023-12-08T23:10:12.699-03:00') #(#(#RGMethodDefinition #(#MorphItemFecha #delete: #false)) #'2023-12-08T23:37:45.963-03:00') #(#(#RGMethodDefinition #(#MorphInfoViaje #inicializarInfoMorphViaje: #false)) #'2023-12-09T22:42:04.757-03:00') #(#(#RGMethodDefinition #(#SeachContratos #update: #false)) #'2023-12-10T10:52:54.636-03:00') #(#(#RGMethodDefinition #(#SeachViajeListContEntre #actionSech #false)) #'2023-12-10T15:58:04.785-03:00') )
]

{ #category : #'code-critics' }
ManifestTPPOO class >> ruleCollectionProtocolRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#SeachViajeList #generarTuplas: #false)) #'2023-12-03T09:44:08.868-03:00') #(#(#RGMethodDefinition #(#Organizado #getInfoListaFechas #false)) #'2023-12-03T12:31:40.755-03:00') #(#(#RGMethodDefinition #(#SeachViajeList #generarTuplas #false)) #'2023-12-04T23:01:37.15-03:00') #(#(#RGMethodDefinition #(#SeachContratoList #generarTuplas #false)) #'2023-12-05T23:33:33.376-03:00') #(#(#RGMethodDefinition #(#Viaje #getInfo #false)) #'2023-12-08T16:17:33.897-03:00') #(#(#RGMethodDefinition #(#Organizado #getInfo #false)) #'2023-12-09T23:39:26.155-03:00') #(#(#RGMethodDefinition #(#SeachViajeListContEntre #actionSech #false)) #'2023-12-10T15:15:35.962-03:00') #(#(#RGMethodDefinition #(#Organizado #getColExcursionInfo #false)) #'2023-12-11T01:42:19.249-03:00') #(#(#RGMethodDefinition #(#Contrato #getInfoColExcursiones #false)) #'2023-12-11T01:55:04.592-03:00') )
]

{ #category : #'code-critics' }
ManifestTPPOO class >> ruleEndTrueFalseRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#SeachViaje #actionSech #false)) #'2023-12-05T00:55:38.826-03:00') #(#(#RGMethodDefinition #(#MorphAltaViajeE #crearViaje #false)) #'2023-12-05T14:08:42.467-03:00') #(#(#RGMethodDefinition #(#SeachViajeLstCont #contratar:fecha:cant:cuotas:plus: #false)) #'2023-12-05T17:55:10.661-03:00') #(#(#RGMethodDefinition #(#SeachContratos #actionSech #false)) #'2023-12-05T21:40:44.725-03:00') #(#(#RGMethodDefinition #(#SeachContratos #pagarCuota:cantCuotas: #false)) #'2023-12-06T09:16:37.795-03:00') #(#(#RGMethodDefinition #(#MorphFechaImputList #agregarCol #false)) #'2023-12-08T21:29:14.96-03:00') #(#(#RGMethodDefinition #(#MorphAltaViajeO #crearViaje #false)) #'2023-12-09T09:19:18.377-03:00') #(#(#RGMethodDefinition #(#MorphParadaListInput #agregarCol #false)) #'2023-12-09T17:07:39.776-03:00') #(#(#RGMethodDefinition #(#MorphExcursioneList #agregarCol #false)) #'2023-12-09T20:29:17.348-03:00') #(#(#RGMethodDefinition #(#MorphInfoViaje #inicializarInfoMorphViaje: #false)) #'2023-12-10T09:53:39.387-03:00') #(#(#RGMethodDefinition #(#SeachViajeListContEntre #actionSech #false)) #'2023-12-10T15:07:57.165-03:00') #(#(#RGMethodDefinition #(#SeachContratoAddExc #agregarExcursion: #false)) #'2023-12-10T22:56:58.118-03:00') #(#(#RGMethodDefinition #(#SeachContratosAddExc #agregarExcursion: #false)) #'2023-12-11T07:17:32.178-03:00') )
]

{ #category : #'code-critics' }
ManifestTPPOO class >> ruleEquivalentSuperclassMethodsRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#'SeachViajeList class' #crear #true)) #'2023-12-04T23:10:56.22-03:00') #(#(#RGMethodDefinition #(#SeachViajeList #generarInfo: #false)) #'2023-12-05T09:00:26.422-03:00') #(#(#RGMethodDefinition #(#'SeachViajeListContEntre class' #crear: #true)) #'2023-12-10T15:22:36.344-03:00') )
]

{ #category : #'code-critics' }
ManifestTPPOO class >> ruleExcessiveArgumentsRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#'Especial class' #crearCon:precioBase:valorImpuesto:ciudad:actividad:fechaRegreso:fechaSalidaCupo:valorDelPlus: #true)) #'2023-12-05T09:33:15.946-03:00') #(#(#RGMethodDefinition #(#Cliente #contratarPaquete:fechaViaje:cantPersonas:cantCuotas:pagaPlus: #false)) #'2023-12-05T17:33:43.567-03:00') #(#(#RGMethodDefinition #(#SeachViajeLstCont #contratar:fecha:cant:cuotas:plus: #false)) #'2023-12-05T17:55:06.372-03:00') #(#(#RGMethodDefinition #(#Viaje #inicializarCon:precioBase:valorImpuesto:valorDelPlus:fechasDisponibles: #false)) #'2023-12-08T16:20:08.253-03:00') #(#(#RGMethodDefinition #(#Viaje #inicializarCon:precioBase:valorImpuesto:valorDelPlus:fechasDisponibleCol: #false)) #'2023-12-08T16:27:14.761-03:00') #(#(#RGMethodDefinition #(#Viaje #inicializarCon:precioBase:valorImpuesto:valorDelPlus:fechasDisponible: #false)) #'2023-12-08T17:04:21.092-03:00') #(#(#RGMethodDefinition #(#'Especial class' #crearCon:precioBase:valorImpuesto:valorDelPlus:fechasDisponibles:ciudad:actividad:fechaRegreso: #true)) #'2023-12-08T17:10:01.956-03:00') #(#(#RGMethodDefinition #(#'Organizado class' #crearCon:precioBase:valorImpuesto:valorDelPlus:fechasDisponibles:colParadas:cantDias:excursiones: #true)) #'2023-12-08T17:35:24.866-03:00') #(#(#RGMethodDefinition #(#Etapa #inicializarCon:cantDias:lugar:tipoPension:hotel:actividades: #false)) #'2023-12-10T07:20:33.069-03:00') #(#(#RGMethodDefinition #(#'Etapa class' #crearCon:cantDias:lugar:tipoPension:hotel:listaActividades: #true)) #'2023-12-10T07:20:51.255-03:00') )
]

{ #category : #'code-critics' }
ManifestTPPOO class >> ruleExcessiveVariablesRuleV1FalsePositive [
	^ #(#(#(#RGClassDefinition #(#VistaAdmin)) #'2023-12-05T10:52:18.84-03:00') #(#(#RGClassDefinition #(#Contrato)) #'2023-12-05T20:33:09.524-03:00') #(#(#RGClassDefinition #(#VistaUser)) #'2023-12-05T23:16:56.877-03:00') #(#(#RGClassDefinition #(#MorphInfoContrato)) #'2023-12-06T11:16:48.969-03:00') )
]

{ #category : #'code-critics' }
ManifestTPPOO class >> ruleGuardingClauseRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#SeachViaje #actionSech #false)) #'2023-12-04T23:43:02.629-03:00') #(#(#RGMethodDefinition #(#SeachViajeLstCont #contratar:fecha:cant:cuotas:plus: #false)) #'2023-12-06T00:09:52.553-03:00') #(#(#RGMethodDefinition #(#SeachContratoAddExc #generarInfo: #false)) #'2023-12-10T23:23:58.135-03:00') #(#(#RGMethodDefinition #(#SeachContratosDelete #cancelarContrato: #false)) #'2023-12-11T08:52:50.49-03:00') )
]

{ #category : #'code-critics' }
ManifestTPPOO class >> ruleInconsistentMethodClassificationRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#Organizado #mostrarFechas #false)) #'2023-12-03T12:16:15.573-03:00') #(#(#RGMethodDefinition #(#Organizado #getInfo #false)) #'2023-12-03T12:20:02.026-03:00') #(#(#RGMethodDefinition #(#MorphAltaViajeE #iniciarAltaViaje #false)) #'2023-12-04T15:04:59.839-03:00') #(#(#RGMethodDefinition #(#MorphAltaViajeE #iniciarMorphAltaViaje #false)) #'2023-12-04T15:08:37.103-03:00') #(#(#RGMethodDefinition #(#SeachViajeList #iniciarSeachViaje #false)) #'2023-12-04T22:53:05.911-03:00') #(#(#RGMethodDefinition #(#SeachViajeList #return: #false)) #'2023-12-05T00:35:06.711-03:00') #(#(#RGMethodDefinition #(#SeachViajeList #generarInfo: #false)) #'2023-12-05T08:58:19.021-03:00') #(#(#RGMethodDefinition #(#MorphAltaViajeE #verificaCondicion #false)) #'2023-12-05T09:23:59.608-03:00') #(#(#RGMethodDefinition #(#SeachViajeList #iniciarSeachViaje: #false)) #'2023-12-05T10:56:27.21-03:00') #(#(#RGMethodDefinition #(#SeachViaje #update: #false)) #'2023-12-05T11:04:50.907-03:00') #(#(#RGMethodDefinition #(#SeachViajeList #update: #false)) #'2023-12-05T12:55:15.515-03:00') #(#(#RGMethodDefinition #(#MorphAltaViajeE #iniciarMorphAltaViaje: #false)) #'2023-12-05T14:06:33.205-03:00') #(#(#RGMethodDefinition #(#SeachContratos #update: #false)) #'2023-12-05T20:29:02.473-03:00') #(#(#RGMethodDefinition #(#SeachContratoList #iniciarSeachContratos: #false)) #'2023-12-05T23:20:52.687-03:00') #(#(#RGMethodDefinition #(#SeachContratoList #return: #false)) #'2023-12-05T23:43:22.032-03:00') #(#(#RGMethodDefinition #(#SeachContratoList #generarInfo: #false)) #'2023-12-05T23:43:29.896-03:00') #(#(#RGMethodDefinition #(#SeachContratoList #updateView: #false)) #'2023-12-05T23:43:39.43-03:00') #(#(#RGMethodDefinition #(#SeachContratoList #contenDefault #false)) #'2023-12-05T23:45:28.038-03:00') #(#(#RGMethodDefinition #(#Especial #getInfo #false)) #'2023-12-06T09:29:36.704-03:00') #(#(#RGMethodDefinition #(#MorphInfoContrato #update: #false)) #'2023-12-06T11:30:15.39-03:00') #(#(#RGMethodDefinition #(#MorphAltaViajeO #iniciarMorphAltaViaje: #false)) #'2023-12-09T09:12:46.851-03:00') #(#(#RGMethodDefinition #(#SeachViajeListContEntre #iniciarSeachViaje:cuenta: #false)) #'2023-12-10T11:26:42.976-03:00') #(#(#RGMethodDefinition #(#'SeachViajeListContEntre class' #crear: #true)) #'2023-12-10T15:22:38.726-03:00') #(#(#RGMethodDefinition #(#SeachViajeList #contenDefault #false)) #'2023-12-10T17:58:17.984-03:00') #(#(#RGMethodDefinition #(#SeachViajeListContEntre #newConten #false)) #'2023-12-10T18:12:25.222-03:00') #(#(#RGMethodDefinition #(#SeachContratoAddExc #generarInfo: #false)) #'2023-12-10T21:59:36.45-03:00') #(#(#RGMethodDefinition #(#SeachContratoAddExc #return: #false)) #'2023-12-11T06:47:14.93-03:00') #(#(#RGMethodDefinition #(#SeachContratosAddExc #update: #false)) #'2023-12-11T07:20:21.184-03:00') )
]

{ #category : #'code-critics' }
ManifestTPPOO class >> ruleJustSendsSuperRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#SeachViajeList #iniciarSeachViaje: #false)) #'2023-12-05T14:38:25.498-03:00') #(#(#RGMethodDefinition #(#SeachContratoList #iniciarSeachContratos: #false)) #'2023-12-05T23:20:48.503-03:00') #(#(#RGMethodDefinition #(#SeachViajeLstCont #update: #false)) #'2023-12-06T09:52:06.156-03:00') )
]

{ #category : #'code-critics' }
ManifestTPPOO class >> ruleLongMethodsRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#'CargaSistema class' #realizarInicio #true)) #'2023-12-02T16:06:54.26-03:00') #(#(#RGMethodDefinition #(#'EmpresaTurismo class' #create #true)) #'2023-12-02T16:50:20.931-03:00') #(#(#RGMethodDefinition #(#VistaAdmin #generarTuplas: #false)) #'2023-12-02T17:33:22.484-03:00') #(#(#RGMethodDefinition #(#VistaAdmin #opcionBaja #false)) #'2023-12-02T17:37:09.415-03:00') #(#(#RGMethodDefinition #(#VistaAdmin #updateView:panel: #false)) #'2023-12-02T21:31:06.931-03:00') #(#(#RGMethodDefinition #(#SeachViajeList #initialize:in: #false)) #'2023-12-03T09:28:59.579-03:00') #(#(#RGMethodDefinition #(#SeachViajeList #generarTuplas: #false)) #'2023-12-03T09:30:51.866-03:00') #(#(#RGMethodDefinition #(#SeachViajeList #updateView:panel: #false)) #'2023-12-03T09:33:34.381-03:00') #(#(#RGMethodDefinition #(#SeachViajeList #verInfo: #false)) #'2023-12-03T11:47:27.807-03:00') #(#(#RGMethodDefinition #(#VistaAdmin #ingresaAdmin #false)) #'2023-12-03T13:29:04.573-03:00') #(#(#RGMethodDefinition #(#VistaAdmin #opcionesViaje #false)) #'2023-12-03T13:29:23.337-03:00') #(#(#RGMethodDefinition #(#VistaAdmin #altaViajeOrganizado #false)) #'2023-12-03T13:52:46.607-03:00') #(#(#RGMethodDefinition #(#VistaUser #initialize #false)) #'2023-12-03T20:14:58.2-03:00') #(#(#RGMethodDefinition #(#NewUser #inicializar: #false)) #'2023-12-03T20:19:54.46-03:00') #(#(#RGMethodDefinition #(#VistaUser #iniciarVistaUser #false)) #'2023-12-03T21:35:45.89-03:00') #(#(#RGMethodDefinition #(#VistaUser #iniciarVistaUser: #false)) #'2023-12-03T21:49:51.302-03:00') #(#(#RGMethodDefinition #(#MorphAltaViaje #iniciarAltaViaje #false)) #'2023-12-04T14:59:59.775-03:00') #(#(#RGMethodDefinition #(#MorphAltaViajeE #iniciarAltaViaje #false)) #'2023-12-04T15:05:02.461-03:00') #(#(#RGMethodDefinition #(#MorphAltaViaje #iniciarMorphAltaViaje #false)) #'2023-12-04T15:08:21.706-03:00') #(#(#RGMethodDefinition #(#MorphAltaViajeE #iniciarMorphAltaViaje #false)) #'2023-12-04T15:08:39.156-03:00') #(#(#RGMethodDefinition #(#Login #inicializar #false)) #'2023-12-04T15:35:51.528-03:00') #(#(#RGMethodDefinition #(#VistaAdmin #ingresaAdmin: #false)) #'2023-12-04T15:40:08.342-03:00') #(#(#RGMethodDefinition #(#SeachViajeList #iniciarSectionSeach #false)) #'2023-12-04T20:17:35.013-03:00') #(#(#RGMethodDefinition #(#SeachViaje #iniciarSeachViaje #false)) #'2023-12-04T21:28:39.265-03:00') #(#(#RGMethodDefinition #(#SeachViajeList #generarTuplas #false)) #'2023-12-04T23:00:45.224-03:00') #(#(#RGMethodDefinition #(#SeachViaje #generarItem:size: #false)) #'2023-12-05T00:12:14.162-03:00') #(#(#RGMethodDefinition #(#MorphInfoContrato #iniciarInfoMorph: #false)) #'2023-12-05T00:18:03.837-03:00') #(#(#RGMethodDefinition #(#SeachViaje #verInfo: #false)) #'2023-12-05T08:57:11.017-03:00') #(#(#RGMethodDefinition #(#ContenViajeSeach #iniciarContenViaje:size: #false)) #'2023-12-05T10:11:50.366-03:00') #(#(#RGMethodDefinition #(#VistaAdmin #ingresaAdmin:empresa: #false)) #'2023-12-05T10:47:06.788-03:00') #(#(#RGMethodDefinition #(#SeachViaje #iniciarSeachViaje: #false)) #'2023-12-05T10:55:47.163-03:00') #(#(#RGMethodDefinition #(#MorphAltaViaje #iniciarMorphAltaViaje: #false)) #'2023-12-05T14:05:45.671-03:00') #(#(#RGMethodDefinition #(#MorphAltaViajeE #iniciarMorphAltaViaje: #false)) #'2023-12-05T14:06:36.727-03:00') #(#(#RGMethodDefinition #(#Sistema #inicializarSistemaConDatos #false)) #'2023-12-05T15:29:41.614-03:00') #(#(#RGMethodDefinition #(#Login #inicializar: #false)) #'2023-12-05T15:39:12.067-03:00') #(#(#RGMethodDefinition #(#VistaUser #iniciarVistaUser:empresa:usuario: #false)) #'2023-12-05T16:06:08.38-03:00') #(#(#RGMethodDefinition #(#NewUser #inicializar:sitema: #false)) #'2023-12-05T16:08:43.317-03:00') #(#(#RGMethodDefinition #(#VistaUser #iniciarVistaUser:cuenta:empresa: #false)) #'2023-12-05T16:13:56.13-03:00') #(#(#RGMethodDefinition #(#SeachViajeLstCont #generarInfo: #false)) #'2023-12-05T16:58:18.301-03:00') #(#(#RGMethodDefinition #(#SeachViajeLstCont #contratar:fecha:cant:cuotas:plus: #false)) #'2023-12-05T20:08:13.432-03:00') #(#(#RGMethodDefinition #(#SeachContratos #iniciarSeachViaje: #false)) #'2023-12-05T20:24:23.92-03:00') #(#(#RGMethodDefinition #(#SeachContratos #iniciarSeachContratos: #false)) #'2023-12-05T20:24:30.279-03:00') #(#(#RGMethodDefinition #(#SeachContratos #generarItem:size: #false)) #'2023-12-05T21:09:30.497-03:00') #(#(#RGMethodDefinition #(#SeachContratos #verInfo: #false)) #'2023-12-05T21:27:33.098-03:00') #(#(#RGMethodDefinition #(#SeachContratos #generarInfo: #false)) #'2023-12-06T10:22:50.587-03:00') #(#(#RGMethodDefinition #(#MorphInfoContrato #iniciarInfoMorphContrato: #false)) #'2023-12-06T11:07:14.46-03:00') #(#(#RGMethodDefinition #(#MorphInfoViaje #inicializarInfoMorphViaje: #false)) #'2023-12-06T12:08:24.375-03:00') #(#(#RGMethodDefinition #(#MorphParadaList #inicializarMorphParada: #false)) #'2023-12-06T14:26:11.751-03:00') #(#(#RGMethodDefinition #(#MorphFechaImputList #iniciarFechaCupoMorph #false)) #'2023-12-08T21:30:21.711-03:00') #(#(#RGMethodDefinition #(#MorphFechaImputList #generarItem: #false)) #'2023-12-08T22:57:26.582-03:00') #(#(#RGMethodDefinition #(#MorphFechaImputList #iniciarFechaCupoMorph: #false)) #'2023-12-09T08:43:42.306-03:00') #(#(#RGMethodDefinition #(#MorphFechaImputList #iniciarFechaListMorph: #false)) #'2023-12-09T08:46:27.048-03:00') #(#(#RGMethodDefinition #(#MorphAltaViajeO #iniciarMorphAltaViaje: #false)) #'2023-12-09T09:12:59.086-03:00') #(#(#RGMethodDefinition #(#MorphParadaListInput #iniciarParadaListInput: #false)) #'2023-12-09T15:20:53.062-03:00') #(#(#RGMethodDefinition #(#MorphListParada #generarItem:size: #false)) #'2023-12-09T23:27:08.029-03:00') #(#(#RGMethodDefinition #(#MorphListExcursion #generarItem:size: #false)) #'2023-12-10T08:12:49.366-03:00') #(#(#RGMethodDefinition #(#SeachViajeListContEntre #actionSech #false)) #'2023-12-10T15:58:38.228-03:00') #(#(#RGMethodDefinition #(#MorphExcursioneListInput #iniciarExcursionesListInput: #false)) #'2023-12-10T21:09:57.337-03:00') #(#(#RGMethodDefinition #(#SeachContratoAddExc #generarInfo: #false)) #'2023-12-10T23:23:52.869-03:00') #(#(#RGMethodDefinition #(#SeachContratosAddExc #generarItem:size: #false)) #'2023-12-11T07:04:26.349-03:00') #(#(#RGMethodDefinition #(#SeachContratosAddExc #generarInfo: #false)) #'2023-12-11T07:18:26.394-03:00') )
]

{ #category : #'code-critics' }
ManifestTPPOO class >> ruleMissingSuperSendsRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#VistaUser #initialize #false)) #'2023-12-03T20:14:55.58-03:00') )
]

{ #category : #'code-critics' }
ManifestTPPOO class >> ruleModifiesCollectionRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#Cliente #efectivizarContrato #false)) #'2023-12-06T08:45:15.839-03:00') )
]

{ #category : #'code-critics' }
ManifestTPPOO class >> ruleMultiplePeriodsTerminatingStatementRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#VistaAdmin #opcionBaja #false)) #'2023-12-02T20:53:17.995-03:00') #(#(#RGMethodDefinition #(#SeachViajeList #initialize:in: #false)) #'2023-12-03T09:28:44.91-03:00') #(#(#RGMethodDefinition #(#MorphAltaViajeE #iniciarMorphAltaViaje #false)) #'2023-12-04T19:41:33.343-03:00') #(#(#RGMethodDefinition #(#MorphParadaListInput #iniciarParadaListInput: #false)) #'2023-12-09T16:39:29.265-03:00') )
]

{ #category : #'code-critics' }
ManifestTPPOO class >> ruleNoClassCommentRuleV1FalsePositive [
	^ #(#(#(#RGClassDefinition #(#SeachViajeList)) #'2023-12-03T09:40:17.681-03:00') #(#(#RGClassDefinition #(#Usuario)) #'2023-12-03T17:41:55.166-03:00') #(#(#RGClassDefinition #(#Sistema)) #'2023-12-03T17:46:59.903-03:00') #(#(#RGClassDefinition #(#VistaUser)) #'2023-12-03T20:37:02.996-03:00') #(#(#RGClassDefinition #(#Login)) #'2023-12-03T21:57:58.205-03:00') #(#(#RGClassDefinition #(#MorphAltaViaje)) #'2023-12-04T15:00:12.894-03:00') #(#(#RGClassDefinition #(#MorphAltaViajeE)) #'2023-12-04T15:00:47.074-03:00') #(#(#RGClassDefinition #(#MorphViaje)) #'2023-12-04T15:27:41.254-03:00') #(#(#RGClassDefinition #(#VistaAdmin)) #'2023-12-04T15:44:16.137-03:00') #(#(#RGClassDefinition #(#SeachViaje)) #'2023-12-04T21:22:45.675-03:00') #(#(#RGClassDefinition #(#EmpresaTurismo)) #'2023-12-05T11:23:46.964-03:00') #(#(#RGClassDefinition #(#Ventana)) #'2023-12-05T15:20:48.011-03:00') #(#(#RGClassDefinition #(#NewUser)) #'2023-12-05T16:07:14.102-03:00') #(#(#RGClassDefinition #(#SeachViajeLstCont)) #'2023-12-05T16:46:52.688-03:00') #(#(#RGClassDefinition #(#Contrato)) #'2023-12-05T20:33:06.524-03:00') #(#(#RGClassDefinition #(#MorphInfoContrato)) #'2023-12-06T11:16:51.419-03:00') #(#(#RGClassDefinition #(#MorphInfoViaje)) #'2023-12-06T12:04:54.375-03:00') #(#(#RGClassDefinition #(#Organizado)) #'2023-12-08T16:56:37.113-03:00') #(#(#RGClassDefinition #(#Button)) #'2023-12-08T22:14:12.018-03:00') #(#(#RGClassDefinition #(#MorphFechaImputList)) #'2023-12-09T14:46:14.446-03:00') #(#(#RGClassDefinition #(#MorphParadaListInput)) #'2023-12-09T15:26:06.911-03:00') #(#(#RGClassDefinition #(#MorphListFechas)) #'2023-12-09T21:20:28.6-03:00') #(#(#RGClassDefinition #(#Etapa)) #'2023-12-10T07:19:25.577-03:00') #(#(#RGClassDefinition #(#Cuota)) #'2023-12-10T07:30:05.993-03:00') )
]

{ #category : #'code-critics' }
ManifestTPPOO class >> ruleNoUnusedInstanceVariableRuleV1FalsePositive [
	^ #(#(#(#RGClassDefinition #(#SeachViajeList)) #'2023-12-03T09:40:11.619-03:00') #(#(#RGClassDefinition #(#Usuario)) #'2023-12-03T17:41:51.379-03:00') #(#(#RGClassDefinition #(#Sistema)) #'2023-12-03T17:46:57.07-03:00') #(#(#RGClassDefinition #(#VistaUser)) #'2023-12-03T20:36:55.353-03:00') #(#(#RGClassDefinition #(#MorphAltaViaje)) #'2023-12-04T15:00:07.077-03:00') #(#(#RGClassDefinition #(#MorphAltaViajeE)) #'2023-12-04T15:00:45.273-03:00') #(#(#RGClassDefinition #(#MorphViaje)) #'2023-12-04T15:27:37.921-03:00') #(#(#RGClassDefinition #(#VistaAdmin)) #'2023-12-04T15:44:11.631-03:00') #(#(#RGClassDefinition #(#SeachViaje)) #'2023-12-04T21:22:40.021-03:00') #(#(#RGClassDefinition #(#Login)) #'2023-12-05T10:47:53.771-03:00') #(#(#RGClassDefinition #(#EmpresaTurismo)) #'2023-12-05T11:23:44.067-03:00') #(#(#RGClassDefinition #(#Ventana)) #'2023-12-05T15:20:43.76-03:00') #(#(#RGClassDefinition #(#NewUser)) #'2023-12-05T16:07:16.492-03:00') #(#(#RGClassDefinition #(#SeachContratoList)) #'2023-12-05T23:42:45.991-03:00') #(#(#RGClassDefinition #(#MorphInfoContrato)) #'2023-12-06T11:16:42.906-03:00') #(#(#RGClassDefinition #(#MorphInfoViaje)) #'2023-12-06T12:04:49.35-03:00') #(#(#RGClassDefinition #(#Button)) #'2023-12-08T22:14:14.566-03:00') #(#(#RGClassDefinition #(#MorphParadaListInput)) #'2023-12-09T15:25:09.195-03:00') #(#(#RGClassDefinition #(#MorphListFechas)) #'2023-12-09T21:20:25.859-03:00') #(#(#RGClassDefinition #(#MorphListParada)) #'2023-12-09T23:28:49.804-03:00') #(#(#RGClassDefinition #(#Etapa)) #'2023-12-10T07:30:47.83-03:00') )
]

{ #category : #'code-critics' }
ManifestTPPOO class >> ruleReClassVariableCapitalizationRuleV1FalsePositive [
	^ #(#(#(#RGClassDefinition #(#Contrato)) #'2023-12-05T20:33:11.777-03:00') #(#(#RGClassDefinition #(#Cuota)) #'2023-12-10T07:30:08.931-03:00') )
]

{ #category : #'code-critics' }
ManifestTPPOO class >> ruleReGuardClauseRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#SeachViajeList #verInfo: #false)) #'2023-12-03T12:03:46.235-03:00') #(#(#RGMethodDefinition #(#SeachViaje #actionSech #false)) #'2023-12-04T23:42:57.205-03:00') #(#(#RGMethodDefinition #(#SeachViajeLstCont #contratar:fecha:cant:cuotas:plus: #false)) #'2023-12-06T00:09:55.584-03:00') #(#(#RGMethodDefinition #(#SeachContratoAddExc #generarInfo: #false)) #'2023-12-10T23:24:04.868-03:00') #(#(#RGMethodDefinition #(#SeachContratosDelete #cancelarContrato: #false)) #'2023-12-11T08:52:47.996-03:00') )
]

{ #category : #'code-critics' }
ManifestTPPOO class >> ruleReIsNilAndConditionalRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#Organizado #inicializarCon:colParadas:excursiones: #false)) #'2023-12-08T17:27:48.48-03:00') )
]

{ #category : #'code-critics' }
ManifestTPPOO class >> ruleReIvarNeitherReadNorWrittenRuleV1FalsePositive [
	^ #(#(#(#RGMetaclassDefinition #(#'Sistema class' #Sistema)) #'2023-12-02T16:09:22.637-03:00') #(#(#RGClassDefinition #(#SeachViajeList)) #'2023-12-03T09:40:14.862-03:00') #(#(#RGClassDefinition #(#Usuario)) #'2023-12-03T17:41:48.283-03:00') #(#(#RGClassDefinition #(#Sistema)) #'2023-12-03T17:46:54.65-03:00') #(#(#RGClassDefinition #(#VistaUser)) #'2023-12-03T20:36:57.93-03:00') #(#(#RGClassDefinition #(#MorphAltaViajeE)) #'2023-12-04T15:00:41.016-03:00') #(#(#RGClassDefinition #(#MorphViaje)) #'2023-12-04T15:27:34.115-03:00') #(#(#RGClassDefinition #(#VistaAdmin)) #'2023-12-04T15:44:13.62-03:00') #(#(#RGClassDefinition #(#SeachViaje)) #'2023-12-04T21:22:37.853-03:00') #(#(#RGClassDefinition #(#Login)) #'2023-12-05T10:47:56.21-03:00') #(#(#RGClassDefinition #(#EmpresaTurismo)) #'2023-12-05T11:23:41.727-03:00') #(#(#RGClassDefinition #(#Ventana)) #'2023-12-05T15:20:45.902-03:00') #(#(#RGClassDefinition #(#NewUser)) #'2023-12-05T16:07:19.187-03:00') #(#(#RGClassDefinition #(#SeachContratoList)) #'2023-12-05T23:42:49.647-03:00') #(#(#RGClassDefinition #(#MorphInfoContrato)) #'2023-12-06T11:16:53.669-03:00') #(#(#RGClassDefinition #(#MorphInfoViaje)) #'2023-12-06T12:04:46.841-03:00') #(#(#RGClassDefinition #(#Button)) #'2023-12-08T22:14:17.236-03:00') #(#(#RGClassDefinition #(#MorphParadaListInput)) #'2023-12-09T15:25:58.589-03:00') #(#(#RGClassDefinition #(#MorphListFechas)) #'2023-12-09T21:20:30.405-03:00') #(#(#RGClassDefinition #(#MorphListParada)) #'2023-12-09T23:28:52.382-03:00') )
]

{ #category : #'code-critics' }
ManifestTPPOO class >> ruleReTemporaryNeitherReadNorWrittenRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#VistaAdmin #generarTuplas: #false)) #'2023-12-02T17:10:46.817-03:00') #(#(#RGMethodDefinition #(#SeachViajeList #generarTuplas: #false)) #'2023-12-03T09:38:08.256-03:00') #(#(#RGMethodDefinition #(#SeachViajeList #verInfo: #false)) #'2023-12-03T11:57:35.14-03:00') #(#(#RGMethodDefinition #(#VistaAdmin #ingresaAdmin: #false)) #'2023-12-04T15:57:22.034-03:00') #(#(#RGMethodDefinition #(#SeachViajeList #iniciarSectionSeach #false)) #'2023-12-04T20:28:58.369-03:00') #(#(#RGMethodDefinition #(#SeachViaje #return: #false)) #'2023-12-05T00:32:48.838-03:00') #(#(#RGMethodDefinition #(#'EmpresaTurismo class' #create #true)) #'2023-12-05T15:25:40.983-03:00') #(#(#RGMethodDefinition #(#SeachViajeLstCont #generarInfo: #false)) #'2023-12-05T19:39:34.099-03:00') #(#(#RGMethodDefinition #(#Contrato #iniciarColcuotas:plus: #false)) #'2023-12-06T07:53:12.759-03:00') #(#(#RGClassDefinition #(#Viaje)) #'2023-12-08T16:27:17.051-03:00') #(#(#RGMethodDefinition #(#MorphItemFecha #iniciarItemLista: #false)) #'2023-12-08T23:39:21.724-03:00') #(#(#RGMethodDefinition #(#MorphFechaImputList #generarItem: #false)) #'2023-12-08T23:58:29.291-03:00') #(#(#RGMethodDefinition #(#MorphParadaListInput #iniciarParadaListInput: #false)) #'2023-12-09T16:53:47.07-03:00') #(#(#RGMethodDefinition #(#MorphParadaListInput #generarItem:lugar:hotel: #false)) #'2023-12-09T17:26:57.806-03:00') #(#(#RGMethodDefinition #(#Organizado #getInfo #false)) #'2023-12-10T07:58:43.928-03:00') #(#(#RGMethodDefinition #(#MorphInfoViaje #inicializarInfoMorphViaje: #false)) #'2023-12-10T09:32:17.252-03:00') #(#(#RGMethodDefinition #(#SeachContratoAddExc #generarInfo: #false)) #'2023-12-10T23:24:01.072-03:00') #(#(#RGMethodDefinition #(#SeachContratosAddExc #generarInfo: #false)) #'2023-12-11T07:33:05.9-03:00') )
]

{ #category : #'code-critics' }
ManifestTPPOO class >> ruleReUndeclaredVariableRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#SeachViajeList #newConten #false)) #'2023-12-05T12:59:48.376-03:00') #(#(#RGMethodDefinition #(#SeachContratos #iniciarSeachViaje: #false)) #'2023-12-05T20:24:20.995-03:00') #(#(#RGMethodDefinition #(#SeachContratos #verInfo: #false)) #'2023-12-05T21:27:35.936-03:00') #(#(#RGMethodDefinition #(#MorphListParada #iniciarListFechas:size: #false)) #'2023-12-09T23:05:52.431-03:00') #(#(#RGMethodDefinition #(#SeachViajeList #updateView: #false)) #'2023-12-10T11:32:39.388-03:00') )
]

{ #category : #'code-critics' }
ManifestTPPOO class >> ruleRefersToClassRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#'EmpresaTurismo class' #create #true)) #'2023-12-02T16:50:23.305-03:00') #(#(#RGMethodDefinition #(#Cuota #inicializarCon:fechaVencimiento: #false)) #'2023-12-06T07:11:16.12-03:00') )
]

{ #category : #'code-critics' }
ManifestTPPOO class >> ruleRemoveAssignmentWithoutEffectRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#VistaAdmin #ingresaAdmin:empresa: #false)) #'2023-12-05T10:46:50.957-03:00') )
]

{ #category : #'code-critics' }
ManifestTPPOO class >> ruleSelfSentNotImplementedRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#VistaAdmin #opcionBaja #false)) #'2023-12-02T20:52:43.108-03:00') #(#(#RGMethodDefinition #(#SeachViajeList #initialize:in: #false)) #'2023-12-03T09:28:42.905-03:00') #(#(#RGMethodDefinition #(#SeachViaje #generarItem:size: #false)) #'2023-12-05T00:23:00.571-03:00') #(#(#RGMethodDefinition #(#ContenViajeSeach #iniciarContenViaje:size: #false)) #'2023-12-05T10:11:52.606-03:00') #(#(#RGMethodDefinition #(#Login #inicializar #false)) #'2023-12-05T10:50:36.906-03:00') #(#(#RGMethodDefinition #(#SeachViajeLstCont #generarInfo: #false)) #'2023-12-05T17:04:34.661-03:00') #(#(#RGMethodDefinition #(#MorphAltaViajeO #iniciarMorphAltaViaje: #false)) #'2023-12-09T09:12:54.186-03:00') #(#(#RGMethodDefinition #(#VistaAdmin #ingresaAdmin: #false)) #'2023-12-09T09:41:28.913-03:00') #(#(#RGMethodDefinition #(#VistaAdmin #ingresaAdmin:empresa: #false)) #'2023-12-09T09:43:59.761-03:00') #(#(#RGMethodDefinition #(#MorphParadaListInput #iniciarParadaListInput: #false)) #'2023-12-09T15:20:50.476-03:00') #(#(#RGMethodDefinition #(#MorphParadaListInput #agregarCol #false)) #'2023-12-09T17:07:41.541-03:00') #(#(#RGMethodDefinition #(#MorphExcursioneList #iniciarExcursionesList: #false)) #'2023-12-09T20:23:59.956-03:00') #(#(#RGMethodDefinition #(#VistaUser #iniciarVistaUser:cuenta:empresa: #false)) #'2023-12-10T11:09:57.305-03:00') #(#(#RGMethodDefinition #(#SeachContratoAddExc #generarInfo: #false)) #'2023-12-10T21:59:38.661-03:00') )
]

{ #category : #'code-critics' }
ManifestTPPOO class >> ruleSendsDifferentSuperRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#VistaAdmin #ingresaAdmin: #false)) #'2023-12-04T16:04:01.938-03:00') #(#(#RGMethodDefinition #(#VistaAdmin #ingresaAdmin:empresa: #false)) #'2023-12-05T10:47:01.125-03:00') #(#(#RGMethodDefinition #(#SeachViajeLstCont #iniciarSeachViaje:cuenta: #false)) #'2023-12-05T18:00:47.762-03:00') #(#(#RGMethodDefinition #(#MorphFechaImputList #iniciarFechaCupoMorph: #false)) #'2023-12-09T08:43:44.545-03:00') #(#(#RGMethodDefinition #(#MorphFechaImputList #iniciarFechaListMorph: #false)) #'2023-12-09T08:45:48.915-03:00') )
]

{ #category : #'code-critics' }
ManifestTPPOO class >> ruleSendsUnknownMessageToGlobalRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#VistaAdmin #ingresaAdmin: #false)) #'2023-12-04T16:24:22.466-03:00') #(#(#RGMethodDefinition #(#'EmpresaTurismo class' #create #true)) #'2023-12-05T15:21:40.701-03:00') #(#(#RGMethodDefinition #(#NewUser #login:pasword: #false)) #'2023-12-05T16:09:09.798-03:00') #(#(#RGMethodDefinition #(#Login #ingresaNewUser #false)) #'2023-12-05T16:22:36.036-03:00') #(#(#RGMethodDefinition #(#MorphParadaList #inicializarMorphParada: #false)) #'2023-12-06T14:50:47.008-03:00') )
]

{ #category : #'code-critics' }
ManifestTPPOO class >> ruleSentNotImplementedRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#VistaAdmin #ingresaAdmin: #false)) #'2023-12-04T20:03:54.293-03:00') #(#(#RGMethodDefinition #(#SeachViajeLstCont #generarInfo: #false)) #'2023-12-05T17:04:31.822-03:00') #(#(#RGMethodDefinition #(#VistaUser #iniciarVistaUser:cuenta:empresa: #false)) #'2023-12-10T11:09:59.392-03:00') )
]

{ #category : #'code-critics' }
ManifestTPPOO class >> ruleStringConcatenationRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#VistaAdmin #generarTuplas: #false)) #'2023-12-02T17:33:24.736-03:00') #(#(#RGMethodDefinition #(#SeachViajeList #generarTuplas: #false)) #'2023-12-03T09:30:54.693-03:00') #(#(#RGMethodDefinition #(#Organizado #mostrarFechas #false)) #'2023-12-03T12:16:13.348-03:00') #(#(#RGMethodDefinition #(#SeachViajeList #generarTuplas #false)) #'2023-12-04T23:01:40.844-03:00') #(#(#RGMethodDefinition #(#MorphListFechas #generarItem:size: #false)) #'2023-12-09T22:15:14.859-03:00') #(#(#RGMethodDefinition #(#MorphListParada #generarItem:size: #false)) #'2023-12-09T23:06:04.074-03:00') #(#(#RGMethodDefinition #(#MorphListExcursion #generarItem:size: #false)) #'2023-12-10T08:07:44.645-03:00') #(#(#RGMethodDefinition #(#MorphListExcursionArealizar #generarItem:size: #false)) #'2023-12-11T00:31:08.332-03:00') )
]

{ #category : #'code-critics' }
ManifestTPPOO class >> ruleSuperSendsRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#VistaAdmin #ingresaAdmin: #false)) #'2023-12-04T16:03:59.323-03:00') #(#(#RGMethodDefinition #(#VistaAdmin #ingresaAdmin:empresa: #false)) #'2023-12-05T10:47:12.077-03:00') #(#(#RGMethodDefinition #(#SeachViajeLstCont #iniciarSeachViaje:cuenta: #false)) #'2023-12-05T18:00:50.08-03:00') #(#(#RGMethodDefinition #(#MorphFechaImputList #iniciarFechaCupoMorph: #false)) #'2023-12-09T08:43:38.972-03:00') #(#(#RGMethodDefinition #(#MorphFechaImputList #iniciarFechaListMorph: #false)) #'2023-12-09T08:46:14.816-03:00') )
]

{ #category : #'code-critics' }
ManifestTPPOO class >> ruleTempVarOverridesInstVarRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#MorphInfoContrato #iniciarInfoMorphContrato: #false)) #'2023-12-06T11:07:18.139-03:00') #(#(#RGMethodDefinition #(#MorphInfoContrato #iniciarInfoMorphContrato: #false)) #'2023-12-06T11:07:22.331-03:00') #(#(#RGMethodDefinition #(#MorphInfoContrato #iniciarInfoMorphContrato: #false)) #'2023-12-06T11:07:25.086-03:00') #(#(#RGMethodDefinition #(#MorphInfoContrato #iniciarInfoMorphContrato: #false)) #'2023-12-06T11:07:27.484-03:00') #(#(#RGMethodDefinition #(#MorphInfoContrato #iniciarInfoMorphContrato: #false)) #'2023-12-06T11:07:31.493-03:00') #(#(#RGMethodDefinition #(#MorphInfoContrato #iniciarInfoMorphContrato: #false)) #'2023-12-06T11:07:33.985-03:00') #(#(#RGMethodDefinition #(#MorphInfoContrato #iniciarInfoMorphContrato: #false)) #'2023-12-06T11:07:36.488-03:00') #(#(#RGMethodDefinition #(#MorphInfoContrato #iniciarInfoMorphContrato: #false)) #'2023-12-06T11:07:39.377-03:00') #(#(#RGMethodDefinition #(#MorphInfoViaje #inicializarInfoMorphViaje: #false)) #'2023-12-06T12:17:20.641-03:00') )
]

{ #category : #'code-critics' }
ManifestTPPOO class >> ruleTempsReadBeforeWrittenRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#VistaAdmin #generarTuplas: #false)) #'2023-12-03T09:10:36.909-03:00') #(#(#RGMethodDefinition #(#SeachViajeList #generarTuplas: #false)) #'2023-12-03T09:30:57.955-03:00') #(#(#RGMethodDefinition #(#SeachViajeList #verInfo: #false)) #'2023-12-03T11:39:47.314-03:00') #(#(#RGMethodDefinition #(#SeachViajeList #iniciarSectionSeach #false)) #'2023-12-04T20:28:56.302-03:00') #(#(#RGMethodDefinition #(#ContenViajeSeach #iniciarContenViaje:size: #false)) #'2023-12-05T10:11:48.168-03:00') #(#(#RGMethodDefinition #(#SeachViajeLstCont #contratar:fecha:cant:cuotas:plus: #false)) #'2023-12-05T20:08:04.242-03:00') #(#(#RGMethodDefinition #(#SeachContratos #generarItem:size: #false)) #'2023-12-05T21:10:29.966-03:00') #(#(#RGMethodDefinition #(#MorphInfoViaje #update: #false)) #'2023-12-06T12:14:30.571-03:00') #(#(#RGMethodDefinition #(#Especial #opcionesModificar:ingreso: #false)) #'2023-12-08T15:30:16.751-03:00') #(#(#RGMethodDefinition #(#MorphItemFecha #delete: #false)) #'2023-12-08T23:37:49.725-03:00') #(#(#RGMethodDefinition #(#Organizado #getInfo #false)) #'2023-12-10T09:39:00.297-03:00') #(#(#RGMethodDefinition #(#VistaUser #iniciarVistaUser:cuenta:empresa: #false)) #'2023-12-10T20:50:27.241-03:00') )
]

{ #category : #'code-critics' }
ManifestTPPOO class >> ruleThreeElementPointRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#MorphAltaViajeE #iniciarMorphAltaViaje #false)) #'2023-12-04T19:50:14.915-03:00') )
]

{ #category : #'code-critics' }
ManifestTPPOO class >> ruleUnaryAccessingMethodWithoutReturnRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#VistaAdmin #generarTuplas #false)) #'2023-12-02T17:10:03.64-03:00') #(#(#RGMethodDefinition #(#VistaAdmin #opcionBaja #false)) #'2023-12-02T17:37:11.346-03:00') #(#(#RGMethodDefinition #(#VistaAdmin #opcionesViaje #false)) #'2023-12-03T13:29:19.695-03:00') #(#(#RGMethodDefinition #(#VistaAdmin #altaViajeOrganizado #false)) #'2023-12-03T13:40:04.474-03:00') #(#(#RGMethodDefinition #(#NewUser #ocultarMorph #false)) #'2023-12-03T21:48:33.056-03:00') #(#(#RGMethodDefinition #(#Login #ingresaNewUser #false)) #'2023-12-03T21:59:38.814-03:00') #(#(#RGMethodDefinition #(#Login #ingresaAdmin #false)) #'2023-12-04T15:39:01.594-03:00') #(#(#RGMethodDefinition #(#VistaAdmin #altaViajeEspecial #false)) #'2023-12-04T22:41:30.547-03:00') #(#(#RGMethodDefinition #(#SeachViajeList #newConten #false)) #'2023-12-04T22:57:07.381-03:00') #(#(#RGMethodDefinition #(#SeachViajeList #generarTuplas #false)) #'2023-12-04T23:01:32.963-03:00') #(#(#RGMethodDefinition #(#SeachViajeList #defaultContent #false)) #'2023-12-05T14:41:12.35-03:00') #(#(#RGMethodDefinition #(#VistaAdmin #restaurarOpciones #false)) #'2023-12-09T09:45:43.487-03:00') #(#(#RGMethodDefinition #(#SeachViajeList #contenDefault #false)) #'2023-12-10T17:58:20.571-03:00') )
]

{ #category : #'code-critics' }
ManifestTPPOO class >> ruleUnclassifiedMethodsRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#MorphAltaViaje #alert #false)) #'2023-12-04T15:26:46.23-03:00') #(#(#RGMethodDefinition #(#SeachViaje #generarInfo: #false)) #'2023-12-05T11:48:31.446-03:00') #(#(#RGMethodDefinition #(#'VistaAdmin class' #crearVistaAdm:empresa: #true)) #'2023-12-05T15:47:39.683-03:00') #(#(#RGMethodDefinition #(#'SeachViajeLstCont class' #crear:cuenta: #true)) #'2023-12-05T18:03:20.5-03:00') #(#(#RGMethodDefinition #(#MorphInfoViaje #inicializarInfoMorphViaje: #false)) #'2023-12-06T12:08:11.899-03:00') #(#(#RGMethodDefinition #(#MorphFechaImputList #agregarCol #false)) #'2023-12-08T21:29:22.857-03:00') #(#(#RGMethodDefinition #(#MorphParadaListInput #generarItem:lugar:hotel: #false)) #'2023-12-09T17:12:44.977-03:00') #(#(#RGMethodDefinition #(#MorphExcursioneList #generarItem:costo: #false)) #'2023-12-09T20:29:03.491-03:00') )
]

{ #category : #'code-critics' }
ManifestTPPOO class >> ruleUtilityMethodsRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#VistaAdmin #generarTuplas: #false)) #'2023-12-02T17:10:50.143-03:00') #(#(#RGMethodDefinition #(#VistaAdmin #updateView:panel: #false)) #'2023-12-02T21:13:40.548-03:00') #(#(#RGMethodDefinition #(#SeachViajeList #generarTuplas: #false)) #'2023-12-03T09:30:49.848-03:00') #(#(#RGMethodDefinition #(#SeachViajeList #updateView:panel: #false)) #'2023-12-03T09:33:36.603-03:00') #(#(#RGMethodDefinition #(#SeachViajeList #return: #false)) #'2023-12-04T22:56:46.869-03:00') #(#(#RGMethodDefinition #(#SeachViaje #verInfo: #false)) #'2023-12-05T08:57:42.553-03:00') #(#(#RGMethodDefinition #(#SeachViajeLstCont #contratar:cant: #false)) #'2023-12-05T17:54:59.788-03:00') #(#(#RGMethodDefinition #(#SeachContratos #verInfo: #false)) #'2023-12-05T21:27:30.662-03:00') #(#(#RGMethodDefinition #(#Especial #setFechaSalida: #false)) #'2023-12-08T15:30:39.348-03:00') #(#(#RGMethodDefinition #(#Especial #disponibleEntre:y: #false)) #'2023-12-08T15:34:02.627-03:00') #(#(#RGMethodDefinition #(#Especial #actualizarDisponibilidad: #false)) #'2023-12-08T15:34:29.993-03:00') #(#(#RGMethodDefinition #(#MorphFechaImputList #generarItem: #false)) #'2023-12-08T23:58:34.002-03:00') #(#(#RGMethodDefinition #(#Organizado #disponibleEntre:y: #false)) #'2023-12-09T11:37:55.086-03:00') #(#(#RGMethodDefinition #(#Organizado #cargarFechaSalida: #false)) #'2023-12-09T11:38:04.494-03:00') #(#(#RGMethodDefinition #(#Organizado #actualizarDisponibilidad:fechaSalida: #false)) #'2023-12-09T11:38:54.011-03:00') #(#(#RGMethodDefinition #(#MorphParadaList #inicializarParadaListMorph: #false)) #'2023-12-09T14:50:02.892-03:00') #(#(#RGMethodDefinition #(#MorphParadaListInput #generarItem:lugar:hotel: #false)) #'2023-12-09T17:12:42.776-03:00') #(#(#RGMethodDefinition #(#MorphExcursioneList #generarItem:costo: #false)) #'2023-12-09T20:29:01.189-03:00') )
]

{ #category : #'code-critics' }
ManifestTPPOO class >> ruleVariableReferencedOnceRuleV1FalsePositive [
	^ #(#(#(#RGClassDefinition #(#VistaUser)) #'2023-12-03T20:37:00.839-03:00') #(#(#RGClassDefinition #(#Login)) #'2023-12-03T21:58:01.605-03:00') #(#(#RGClassDefinition #(#MorphAltaViaje)) #'2023-12-04T15:00:09.784-03:00') #(#(#RGClassDefinition #(#MorphAltaViajeE)) #'2023-12-04T15:13:35.151-03:00') #(#(#RGClassDefinition #(#VistaAdmin)) #'2023-12-05T10:44:39.294-03:00') #(#(#RGClassDefinition #(#Sistema)) #'2023-12-05T15:14:38.492-03:00') #(#(#RGClassDefinition #(#NewUser)) #'2023-12-05T16:07:21.159-03:00') #(#(#RGClassDefinition #(#MorphInfoContrato)) #'2023-12-06T11:16:46.06-03:00') #(#(#RGClassDefinition #(#MorphInfoViaje)) #'2023-12-06T12:15:40.801-03:00') #(#(#RGClassDefinition #(#MorphFechaImputList)) #'2023-12-09T14:46:16.556-03:00') #(#(#RGClassDefinition #(#MorphParadaListInput)) #'2023-12-09T15:26:03.269-03:00') #(#(#RGClassDefinition #(#Etapa)) #'2023-12-10T07:30:50.705-03:00') )
]
