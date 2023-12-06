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
		'alta',
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
VistaAdmin >> ingresaAdmin: padre [

	| text |
	super initialize.
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
	alta := Button new.
	alta label: 'ALTA VIAJE ESPECIAL'.
	alta color: (Color r: 0.40 g: 0.55 b: 0.95).
	alta cornerStyle: #rounded.
	baja := Button new.
	baja label: 'BAJA'.
	baja color: (Color r: 0.40 g: 0.55 b: 0.95).
	baja cornerStyle: #rounded.
	text := TextMorph new.
	text contents: 'SELECCIONE UNA OPCION:'.
	text centered.
	alta extent: 200 @ 40.
	baja extent: 200 @ 40.
	alta position: lateral center - (alta extent // 2).
	baja position: alta bottomLeft + (0 @ 45).
	text position: alta position - (0 @ 45).
	
	cerrar := Button new.
	cerrar label: 'CERRAR'.
	cerrar extent: 100 @ 30.
	cerrar color: (Color r: 0.40 g: 0.55 b: 0.95).
	cerrar position: baja bottomLeft + (0 @ 45).
	cerrar cornerStyle: #rounded.

	lateral addMorph: alta.
	lateral addMorph: baja.
	lateral addMorph: text.
	lateral addMorph: cerrar.

	altaViajeEs := MorphAltaViajeE crearMorphAltaViaje: empT .
	altaViajeEs visible: false.
	self addMorph: altaViajeEs.
	altaViajeEs position: modal position + (50 @ 100).

	sectionSeach := SeachViaje crear.
	sectionSeach visible: false.
	modal addMorph: sectionSeach.
	sectionSeach position: modal position + (50 @ 100).

	viajes := SeachViajeList crear.
	self addMorph: viajes.
	viajes position: modal topCenter + ((-50) @ 100).
	

	alta mouseAction: [ self altaViajeEspecial ].
	baja mouseAction: [ self opcionBaja ].
	cerrar mouseAction: [ self cerrarVentanaAdmin: padre ]
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
	alta := Button new.
	alta label: 'ALTA VIAJE ESPECIAL'.
	alta color: (Color r: 0.40 g: 0.55 b: 0.95).
	alta cornerStyle: #rounded.
	baja := Button new.
	baja label: 'BAJA'.
	baja color: (Color r: 0.40 g: 0.55 b: 0.95).
	baja cornerStyle: #rounded.
	text := TextMorph new.
	text contents: 'SELECCIONE UNA OPCION:'.
	text centered.
	alta extent: 200 @ 40.
	baja extent: 200 @ 40.
	alta position: lateral center - (alta extent // 2).
	baja position: alta bottomLeft + (0 @ 45).
	text position: alta position - (0 @ 45).
	
	cerrar := Button new.
	cerrar label: 'CERRAR'.
	cerrar extent: 100 @ 30.
	cerrar color: (Color r: 0.40 g: 0.55 b: 0.95).
	cerrar position: baja bottomLeft + (0 @ 45).
	cerrar cornerStyle: #rounded.

	lateral addMorph: alta.
	lateral addMorph: baja.
	lateral addMorph: text.
	lateral addMorph: cerrar.

	altaViajeEs := MorphAltaViajeE crearMorphAltaViaje: emp.
	altaViajeEs visible: false.
	modal addMorph: altaViajeEs.
	altaViajeEs position: modal position + (50 @ 100).

	sectionSeach := SeachViaje crear:emp.
	sectionSeach visible: false.
	modal addMorph: sectionSeach.
	sectionSeach position: modal position + (50 @ 100).

	viajes := SeachViajeList crear: emp.
	self addMorph: viajes.
	viajes position: modal topCenter + ((-50) @ 100).
	

	alta mouseAction: [ self altaViajeEspecial ].
	baja mouseAction: [ self opcionBaja ].
	cerrar mouseAction: [ self cerrarVentanaAdmin: padre ]
]

{ #category : #accessing }
VistaAdmin >> opcionBaja [
sectionSeach visible:true.
altaViajeEs visible: false.


 
]

{ #category : #accessing }
VistaAdmin >> restaurarOpciones [
modViaje   visible:true.
modCliente    visible:true.
cerrar   visible:true.
]
