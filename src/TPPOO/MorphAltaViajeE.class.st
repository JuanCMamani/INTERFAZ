Class {
	#name : #MorphAltaViajeE,
	#superclass : #MorphAltaViaje,
	#instVars : [
		'ciudad',
		'actividad',
		'fechaRegre',
		'fechaSalida',
		'disponibilidad'
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
			| var |
			var := Especial
				       crearCon: nombre text asString
				       precioBase: preciXper text asString
				       valorImpuesto: valorImp text asString
				       ciudad: ciudad text asString
				       actividad: actividad text asString
				       fechaRegreso:
				       (Date readFrom: fechaRegre text asString readStream)
				       fechaSalidaCupo:
				       (Date readFrom: fechaSalida text asString readStream)
				       valorDelPlus: porcentaje text asString.
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
	fechaSalida := RubTextFieldMorph new.
	fechaSalida ghostText: '   Fecha de salida'.
	fechaSalida extent: wid.
	fechaSalida cornerStyle: #rounded.
	fechaRegre := RubTextFieldMorph new.
	fechaRegre ghostText: '   Fecha de regreso'.
	fechaRegre extent: wid.
	fechaRegre cornerStyle: #rounded.
	
	disponibilidad  := RubTextFieldMorph new.
	disponibilidad ghostText: '  Disponibilidad'.
	disponibilidad extent: wid.
	disponibilidad cornerStyle: #rounded.
	
	self addMorph: ciudad.
	self addMorph: actividad.
	self addMorph: fechaSalida.
	self addMorph: fechaRegre.
	self addMorph: disponibilidad .
	ciudad position: valorImp position + (0 @ 40).
	actividad position: ciudad position + (0 @ 40).
	fechaSalida position: actividad position + (0 @ 40).
	fechaRegre position: fechaSalida position + (0 @ 40).
	disponibilidad  position: fechaRegre  position + (0 @ 40).
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
