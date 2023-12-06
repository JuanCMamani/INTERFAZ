Class {
	#name : #VistaUser,
	#superclass : #FullscreenMorph,
	#instVars : [
		'lateral',
		'modal',
		'seachViaje',
		'viajesP',
		'viajesF',
		'infoUser',
		'contratos',
		'empresa',
		'cuenta',
		'seachContrato'
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
VistaUser >> buscarViaje [

	seachViaje visible: true.
	seachContrato visible:false.
]

{ #category : #initialization }
VistaUser >> iniciarVistaUser: container cuenta: cont empresa: emp [

	| buscarViaje pagarCont cerrar |
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
	pagarCont := Button new.
	pagarCont label: 'PAGAR CONTRATO'.
	pagarCont color: (Color r: 0.40 g: 0.55 b: 0.95).
	pagarCont cornerStyle: #rounded.
	buscarViaje position: lateral leftCenter + (20 @ 40).
	pagarCont position: lateral leftCenter - (-20 @ 40).
	pagarCont extent: lateral width - 40 @ 50.
	buscarViaje extent: lateral width - 40 @ 50.
	lateral addMorph: buscarViaje.
	lateral addMorph: pagarCont.
	
	seachContrato := SeachContratos crear: cuenta.
	seachContrato visible: false.
	modal addMorph: seachContrato.
	seachContrato position: modal position + (50 @ 100).

	seachViaje := SeachViajeLstCont crear: empresa cuenta: cuenta .
	seachViaje  visible: false.
	modal addMorph: seachViaje.
	seachViaje position: modal position + (50 @ 100).
	
	contratos  := SeachContratoList  crear: cuenta .
	modal addMorph: contratos.
	contratos position: (modal topCenter) +(150@100).
	
	cerrar := Button new.
	cerrar label: 'CERRAR'.
	cerrar extent: 100 @ 30.
	cerrar color: (Color r: 0.40 g: 0.55 b: 0.95).
	cerrar position: buscarViaje bottomLeft + (0 @ 40).
	cerrar cornerStyle: #rounded.
	lateral addMorph: cerrar.
	self addMorph: lateral.
	self addMorph: modal.
	cerrar mouseAction: [ self volverNewUser: container ].
	buscarViaje mouseAction: [ self buscarViaje ].
	pagarCont mouseAction: [ self pagarContrato ]
]

{ #category : #initialization }
VistaUser >> pagarContrato [
	seachViaje visible: false.
	seachContrato visible: true.
]

{ #category : #initialization }
VistaUser >> volverNewUser:container [
container restaurarMoph .
self delete 
]
