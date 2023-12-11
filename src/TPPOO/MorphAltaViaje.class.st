Class {
	#name : #MorphAltaViaje,
	#superclass : #Morph,
	#instVars : [
		'nombre',
		'preciXper',
		'porcentaje',
		'valorImp',
		'crear',
		'empresa',
		'fechasDisponibles'
	],
	#category : #'TPPOO-componentes'
}

{ #category : #initialization }
MorphAltaViaje class >> crearMorphAltaViaje: emp [
|var|
var:= self new.
var iniciarMorphAltaViaje: emp.
^var .
]

{ #category : #initialize }
MorphAltaViaje >> alert [
|mensaje|
	mensaje := '¡Viaje creado con exito!'.
	mensaje := UIManager inform: mensaje.
]

{ #category : #initialize }
MorphAltaViaje >> imputFecha: wid [

	fechasDisponibles := MorphFechaInput crearFechaImput: wid.
	self addMorph: fechasDisponibles.
	fechasDisponibles position: valorImp position + (0 @ 40)
]

{ #category : #initialize }
MorphAltaViaje >> iniciarMorphAltaViaje:emp [

	| text wid |
	empresa := emp .
	self extent: (500 @200).
	self color: (Color r: 0.80 g: 0.8 b: 0.80).
	self cornerStyle: #rounded.
	text := TextMorph new.
	text contents: 'INGRESE LOS DATOS:'.
	self addMorph: text.
	wid := self width - 80.
	text position: self topCenter -(text width//2@(-4)). 
	nombre := RubTextFieldMorph new.
	nombre ghostText: '   Nombre del viaje'.
	nombre color: Color white.
	nombre extent: wid @0 .
	nombre cornerStyle: #rounded.
	preciXper := RubTextFieldMorph new.
	preciXper ghostText: '   Precio x persona'.
	preciXper color: Color white.
	preciXper extent: wid @0.
	preciXper cornerStyle: #rounded.
	porcentaje := RubTextFieldMorph new.
	porcentaje ghostText: '   Porcentaje Plus'.
	porcentaje color: Color white.
	porcentaje extent: wid @0 .
	porcentaje cornerStyle: #rounded.
	valorImp := RubTextFieldMorph new.
	valorImp ghostText: '   Valor impuesto'.
	valorImp color: Color white.
	valorImp extent: wid @0 .
	valorImp cornerStyle: #rounded.
	self addMorph: nombre.
	self addMorph: preciXper.
	self addMorph: porcentaje.
	self addMorph: valorImp.
	nombre position: self position + (40 @ 40).
	preciXper position: nombre position + (0 @ 40).
	porcentaje position: preciXper position + (0 @ 40).
	valorImp position: porcentaje position + (0 @ 40).
	self imputFecha: wid .
	crear := Button new.
	crear label: 'CREAR'.
	crear extent: 200 @ 40.
	crear color: (Color r: 0.40 g: 0.55 b: 0.95).
	crear cornerStyle: #rounded
]

{ #category : #initialize }
MorphAltaViaje >> verificaCondicion [
^ (nombre text asString ~='')&( preciXper  text asString ~='')&(porcentaje text  asString ~='') &(valorImp text  asString ~='')& (fechasDisponibles verificaCondicion ).
]
