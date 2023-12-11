Class {
	#name : #MorphFechaInput,
	#superclass : #Morph,
	#instVars : [
		'fecha',
		'cupo',
		'colCupos'
	],
	#category : #'TPPOO-componentes'
}

{ #category : #initialization }
MorphFechaInput class >> crearFechaImput: sizeWid [
|var|
var:= self new.
var iniciarFechaMorph: sizeWid.
^var.
]

{ #category : #initialization }
MorphFechaInput >> getColCupos [

	| condition varFe varCu mensaje |
	varFe := fecha text asString.
	varCu := cupo text asString.
	condition := varFe ~= '' & (varCu ~= '').
	condition
		ifTrue: [ 
			| var |
			var := FechaSalida
				       crearCon: (Date readFrom: varFe readStream)
				       cupo: varCu.
			colCupos add: var ]
		ifFalse: [ 
			mensaje := '¡Fecha y cupo invalido!'.
			mensaje := UIManager inform: mensaje.
			^ nil ].
	^ colCupos
]

{ #category : #initialization }
MorphFechaInput >> iniciarFechaMorph: widthL [

	colCupos := OrderedCollection new.
	self extent: (widthL asInteger  @ 20).
	self color: Color transparent   . 
	fecha := RubTextFieldMorph new.
	fecha ghostText: ' Fecha Salida'.
	fecha extent: self width - 130 @ 30.
	fecha cornerStyle: #rounded.
	self addMorph: fecha.
	fecha position: self position.
	cupo := RubTextFieldMorph new.
	cupo ghostText: ' Cupo'.
	cupo extent: self width - fecha width-(10)@ 30.
	cupo cornerStyle: #rounded.
	self addMorph: cupo.
	cupo position: fecha topRight + (7 @ 0).
	
]

{ #category : #initialization }
MorphFechaInput >> verificaCondicion [
^ (fecha text asString ~='')&(cupo text asString ~='').
]
