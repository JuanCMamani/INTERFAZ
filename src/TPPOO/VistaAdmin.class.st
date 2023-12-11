Class {
	#name : #VistaAdmin,
	#superclass : #FullscreenMorph,
	#instVars : [
		'empT',
		'lateral',
		'modal',
		'modViaje',
		'modCliente',
		'cerrar',
		'sectionSeach',
		'altaE',
		'altaO',
		'baja',
		'volver',
		'altaViajeEs',
		'altaViajeOr',
		'viajes'
	],
	#category : #'TPPOO-componentes'
}

{ #category : #initialization }
VistaAdmin class >> crearVistaAdm:panel empresa:emp [
|var|
var:= self new.
var ingresaAdmin: panel empresa: emp.
^ var .
]

{ #category : #accessing }
VistaAdmin >> altaViajeEspecial [
sectionSeach visible: false.
altaViajeEs visible: true.
altaViajeOr  visible: false.

]

{ #category : #accessing }
VistaAdmin >> altaViajeOrganizado [
sectionSeach visible: false.
altaViajeEs visible: false.
altaViajeOr  visible: true.


]

{ #category : #accessing }
VistaAdmin >> cerrarVentanaAdmin: padre [
padre restaurarOpciones .
self delete.
]

{ #category : #accessing }
VistaAdmin >> eliminarViaje: tupla [ 
tupla delete.
]

{ #category : #initialization }
VistaAdmin >> ingresaAdmin: padre empresa: emp [

	| text |
	super initialize.
	empT := emp.
	padre addMorph: self.
	lateral := Morph new.
	lateral extent: 300 @ self height.
	lateral color: Color white.
	self addMorph: lateral.
	lateral position: self position.
	modal := Morph new.
	modal color: Color blue.
	modal extent: self extent - (lateral width @ 0).
	modal position: lateral topRight.
	self addMorph: modal.
	altaE := Button new.
	altaE label: 'ALTA VIAJE ESPECIAL'.
	altaE color: (Color r: 0.40 g: 0.55 b: 0.95).
	altaE cornerStyle: #rounded.
	altaO := Button new.
	altaO label: 'ALTA VIAJE ORGANIZADO'.
	altaO color: (Color r: 0.40 g: 0.55 b: 0.95).
	altaO cornerStyle: #rounded.
	baja := Button new.
	baja label: 'BAJA'.
	baja color: (Color r: 0.40 g: 0.55 b: 0.95).
	baja cornerStyle: #rounded.
	text := TextMorph new.
	text contents: 'SELECCIONE UNA OPCION:'.
	text centered.
	altaE extent: 200 @ 40.
	altaO extent: 200 @ 40.
	baja extent: 200 @ 40.
	altaE position: lateral center - (altaE extent // 2).
	altaO position: altaE bottomLeft + (0 @ 15).
	baja position: altaO bottomLeft + (0 @ 15).
	text bottomLeft: altaE position - (0 @ 15).

	cerrar := Button new.
	cerrar label: 'CERRAR'.
	cerrar extent: 100 @ 30.
	cerrar color: (Color r: 0.40 g: 0.55 b: 0.95).
	cerrar position: baja bottomLeft + (0 @ 45).
	cerrar cornerStyle: #rounded.

	lateral addMorph: altaE.
	lateral addMorph: altaO.
	lateral addMorph: baja.
	lateral addMorph: text.
	lateral addMorph: cerrar.

	altaViajeEs := MorphAltaViajeE crearMorphAltaViaje: emp.
	altaViajeEs visible: false.
	modal addMorph: altaViajeEs.
	altaViajeEs position: modal position + (50 @ 50).
	altaViajeOr := MorphAltaViajeO crearMorphAltaViaje: empT.
	altaViajeOr visible: false.
	modal addMorph: altaViajeOr.
	altaViajeOr position: modal position + (50 @ 50).

	sectionSeach := SeachViaje crear: emp.
	sectionSeach visible: false.
	modal addMorph: sectionSeach.
	sectionSeach position: modal position + (50 @ 100).

	viajes := SeachViajeList crear: emp.
	self addMorph: viajes.
	viajes position: modal topCenter + (-50 @ 100).


	altaE mouseAction: [ self altaViajeEspecial ].
	altaO mouseAction: [ self altaViajeOrganizado ].
	baja mouseAction: [ self opcionBaja ].
	cerrar mouseAction: [ self cerrarVentanaAdmin: padre ]
]

{ #category : #accessing }
VistaAdmin >> opcionBaja [
sectionSeach visible:true.
altaViajeEs visible: false.

altaViajeOr visible: false.

 
]

{ #category : #accessing }
VistaAdmin >> restaurarOpciones [
modViaje   visible:true.
modCliente    visible:true.
cerrar   visible:true.
]
