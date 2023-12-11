Class {
	#name : #VistaUser,
	#superclass : #FullscreenMorph,
	#instVars : [
		'lateral',
		'modal',
		'seachViaje',
		'seachViajeEntre',
		'viajesP',
		'viajesF',
		'infoUser',
		'contratos',
		'empresa',
		'cuenta',
		'seachContrato',
		'addExcursion',
		'seachDelete'
	],
	#category : #'TPPOO-componentes'
}

{ #category : #creating }
VistaUser class >> crear: container [
|var|
var := self new.
var iniciarVistaUser: container .
^var
]

{ #category : #creating }
VistaUser class >> crear: container cuenta: cont  empresa: emp [
|var|
var := self new.
var iniciarVistaUser: container cuenta: cont empresa: emp .
^var
]

{ #category : #initialization }
VistaUser >> agregarExcursion [
	seachViaje visible: false.
	seachContrato visible: false.
	seachViajeEntre visible: false.
		addExcursion  visible: true.
				seachDelete visible: false.
]

{ #category : #initialization }
VistaUser >> buscarEntreFechas [
	seachViaje visible: false.
	seachContrato visible: false.
	seachViajeEntre visible: true.
		addExcursion  visible: false.
]

{ #category : #initialization }
VistaUser >> buscarViaje [

	seachViaje visible: true.
	seachContrato visible:false.
	seachViajeEntre  visible:false.
		addExcursion  visible: false.
				seachDelete visible: false.
]

{ #category : #initialization }
VistaUser >> deleteContrato [
	seachViaje visible: false.
	seachContrato visible: false.
	seachViajeEntre visible: false.
		addExcursion  visible: false.
				seachDelete visible: true.
]

{ #category : #initialization }
VistaUser >> iniciarVistaUser: container cuenta: cont empresa: emp [

	| buscarViaje pagarCont cerrar buscarEntre agregarExc  dele|
	empresa := emp.
	cuenta := cont.
	lateral := Morph new.
	lateral extent: 300 @ self height.
	lateral color: Color white.
	lateral position: self topLeft.
	modal := Morph new.
	modal color: (Color r: 0.40 g: 0.55 b: 0.95).
	modal extent: self extent - (lateral width @ 0).
	modal position: lateral topRight.
	buscarViaje := Button new.
	buscarViaje label: 'BUSCAR VIAJE'.
	buscarViaje color: (Color r: 0.40 g: 0.55 b: 0.95).
	buscarViaje cornerStyle: #rounded.

	buscarEntre := Button new.
	buscarEntre label: 'BUSCAR ENTRE'.
	buscarEntre color: (Color r: 0.40 g: 0.55 b: 0.95).
	buscarEntre cornerStyle: #rounded.

	pagarCont := Button new.
	pagarCont label: 'PAGAR CONTRATO'.
	pagarCont color: (Color r: 0.40 g: 0.55 b: 0.95).
	pagarCont cornerStyle: #rounded.
	
	agregarExc := Button new.
	agregarExc label: 'AGREGAR EXCURSION'.
	agregarExc color: (Color r: 0.40 g: 0.55 b: 0.95).
	agregarExc cornerStyle: #rounded.
  
	dele := Button new.
	dele label: 'ELIMINAR CONTRATO'.
	dele color: (Color r: 0.40 g: 0.55 b: 0.95).
	dele cornerStyle: #rounded.
	
	buscarEntre position: lateral leftCenter + (20 @ 40).
	buscarViaje bottomLeft: buscarEntre position - (0 @ 40).
	pagarCont bottomLeft: buscarViaje position - (0 @ 40).
	agregarExc bottomLeft: pagarCont position - (0 @ 40).
	dele  bottomLeft: agregarExc position - (0 @ 40).


	pagarCont extent: lateral width - 40 @ 50.
	buscarViaje extent: pagarCont extent.
	buscarEntre extent: pagarCont extent.
	agregarExc extent: pagarCont extent.
		dele  extent: pagarCont extent.
	lateral addMorph: buscarViaje.
	lateral addMorph: pagarCont.
	lateral addMorph: buscarEntre.
	lateral addMorph: agregarExc.
	lateral addMorph: dele .


	seachContrato := SeachContratos crear: cuenta.
	seachContrato visible: false.
	modal addMorph: seachContrato.
	seachContrato position: modal position + (50 @ 100).

	seachViaje := SeachViajeLstCont crear: empresa cuenta: cuenta.
	seachViaje visible: false.
	modal addMorph: seachViaje.
	seachViaje position: modal position + (50 @ 100).

	seachViajeEntre := SeachViajeListContEntre
		                   crear: empresa
		                   cuenta: cuenta.
	seachViajeEntre visible: false.
	modal addMorph: seachViajeEntre.
	seachViajeEntre position: modal position + (50 @ 100).
	
	seachDelete  := SeachContratosDelete crear: cuenta .
	seachDelete visible: false.
	modal addMorph: seachDelete.
	seachDelete position: modal position + (50 @ 100).
	
	
	addExcursion := SeachContratosAddExc crear: cuenta  .
	addExcursion  visible: false. 
	modal addMorph: addExcursion .
	addExcursion position: modal position + (150 @ 100).
	
	contratos := SeachContratoList crear: cuenta.
	modal addMorph: contratos.
	contratos position: modal topCenter + (150 @ 100).
	cerrar := Button new.
	cerrar label: 'CERRAR'.
	cerrar extent: 100 @ 30.
	cerrar color: (Color r: 0.40 g: 0.55 b: 0.95).
	cerrar position: buscarEntre bottomLeft + (0 @ 40).
	cerrar cornerStyle: #rounded.
	lateral addMorph: cerrar.

	self addMorph: lateral.
	self addMorph: modal.
	cerrar mouseAction: [ self volverNewUser: container ].
	buscarViaje mouseAction: [ self buscarViaje ].
	buscarEntre mouseAction: [ self buscarEntreFechas ].
	pagarCont mouseAction: [ self pagarContrato ].
	agregarExc mouseAction: [ self agregarExcursion].
		dele mouseAction: [ self deleteContrato ]
]

{ #category : #initialization }
VistaUser >> pagarContrato [
	seachViaje visible: false.
	seachContrato visible: true.
	seachViajeEntre visible: false.
		addExcursion  visible: false.
				seachDelete visible: false.
]

{ #category : #initialization }
VistaUser >> volverNewUser:container [
container restaurarMoph .
self delete 
]
