Class {
	#name : #SeachViajeListContEntre,
	#superclass : #SeachViajeLstCont,
	#instVars : [
		'input2'
	],
	#category : #'TPPOO-componentes'
}

{ #category : #initializacion }
SeachViajeListContEntre class >> iniciarSeachViaje: emp cuenta: cont [
|var|
var:= self new.
var iniciarSeachViaje:emp.
^var.
	
]

{ #category : #initialize }
SeachViajeListContEntre >> actionSech [

	| mensaje fecha1 fecha2  |
	fecha1 := input text asString.
	fecha2 := input2 text asString.
	fecha1 ~= '' & (fecha2 ~= '')
		ifTrue: [ 
			| colBuscado |
			colBuscado := empresa
				              viajesDisponibles:
				              (Date readFrom: fecha1 readStream)
				              otraDFecha: (Date readFrom: fecha2 readStream).
			colBuscado
				ifNotEmpty: [ 
					listItem submorphs do: [ :each | each delete ].
					colBuscado do: [ :vi | 
						| itemMenu |
						itemMenu := self generarItem: vi size: 445.
						listItem addMenuItem: itemMenu ].
					mensaje := '¡Viajes encontrados con EXITO!'.
					mensaje := UIManager inform: mensaje .
					]
				ifEmpty: [ 
					mensaje := '¡Ingrese Fechas validas!'.
					mensaje := UIManager inform: mensaje ] ]
		ifFalse: [ 
			self contenDefault.
			mensaje := '¡Ingrese un nombre VALIDO!'.
			mensaje := UIManager inform: mensaje ]
]

{ #category : #initialization }
SeachViajeListContEntre >> iniciarSeachViaje: emp cuenta: cont [

	super iniciarSeachViaje: emp cuenta: cont.
	input ifNotNil:[input delete]. 
	input := RubTextFieldMorph new.
	input extent:   (180) @ 50.
	input ghostText: ' Fecha 1'.
	input cornerStyle: #rounded.
	seachContainer addMorph: input.
	input position: seachContainer position + (15@ 15).
	
	input2 := RubTextFieldMorph new.
	input2 extent: (180 @ 50) .
	input2 ghostText: ' Fecha 2'.
	input2 cornerStyle: #rounded.
	seachContainer addMorph: input2.
	input2 position: input topRight +(10@0).
]

{ #category : #initialization }
SeachViajeListContEntre >> newConten [
|scrollPanel|
   scrollPanel := ScrollPane new.
	scrollPanel borderColor: Color black.
	scrollPanel color: Color white.
	scrollPanel cornerStyle: #rounded.
	scrollPanel extent:(self width -30 ) @ (self height - 100).
	listItem := MenuMorph new.
	listItem initialize.
	listItem borderColor: Color transparent.
	listItem extent: scrollPanel extent-(3@0).
	scrollPanel scroller addMorph: listItem.
	self newConten: scrollPanel .
]
