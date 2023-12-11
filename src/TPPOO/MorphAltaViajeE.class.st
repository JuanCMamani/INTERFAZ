Class {
	#name : #MorphAltaViajeE,
	#superclass : #MorphAltaViaje,
	#instVars : [
		'ciudad',
		'actividad',
		'fechaRegre'
	],
	#category : #'TPPOO-componentes'
}

{ #category : #initialization }
MorphAltaViajeE class >> crearMorphAltaViaje: emp [
|var|
var:= self new.
var iniciarMorphAltaViaje: emp .
^var.
]

{ #category : #actions }
MorphAltaViajeE >> crearViaje [

	| condicion mensaje |
	condicion := self verificaCondicion.
	condicion
		ifTrue: [ 
			| var cupo|
			cupo:= fechasDisponibles getColCupos .
			var := Especial crearCon: nombre text asString  precioBase: preciXper text asString valorImpuesto: valorImp text asString valorDelPlus:  porcentaje text asString fechasDisponibles: cupo ciudad: ciudad text asString actividad: actividad text asString fechaRegreso:   (Date readFrom: fechaRegre text asString readStream). 
			empresa cargarViaje:  var.
			mensaje := '¡Viaje creado con exito!'.
			mensaje := UIManager inform: mensaje ]
		ifFalse: [ 
			mensaje := '¡Datos ingresados incorrectos!'.
			mensaje := UIManager inform: mensaje ]
]

{ #category : #initialization }
MorphAltaViajeE >> iniciarMorphAltaViaje: emp [
| wid  |
	super iniciarMorphAltaViaje: emp.
	self extent: self extent + (0 @ 250).
	wid := self width - 80 @ 0.
	ciudad := RubTextFieldMorph new.
	ciudad ghostText: '   Nombre ciudad'.
	ciudad extent: wid.
	ciudad cornerStyle: #rounded.
	actividad := RubTextFieldMorph new.
	actividad ghostText: '   Actividades a realizar'.
	actividad extent: wid.
	actividad cornerStyle: #rounded.
	fechaRegre := RubTextFieldMorph new.
	fechaRegre ghostText: '   Fecha de regreso'.
	fechaRegre extent: wid.
	fechaRegre cornerStyle: #rounded.
	
	self addMorph: ciudad.
	self addMorph: actividad.
	self addMorph: fechaRegre.
	ciudad position: fechasDisponibles  position + (0 @ 40).
	actividad position: ciudad position + (0 @ 40).
	fechaRegre position: actividad  position + (0 @ 40).
	self addMorph: crear.
	crear bottomLeft: ( self bottomCenter -(crear width//2 @ 10)).
	crear mouseAction: [ self crearViaje ]
]

{ #category : #actions }
MorphAltaViajeE >> verificaCondicion [ 
|var|
var:= (super verificaCondicion ).
^ var &( ciudad text asString ~='')&(actividad  text asString ~='')&(fechaRegre text asString ~='')&(fechaRegre text asString ~='').
]
