Class {
	#name : #MorphExcursioneListInput,
	#superclass : #Morph,
	#instVars : [
		'scroll',
		'listaEx',
		'colEx',
		'inputId',
		'cantPersonas'
	],
	#category : #'TPPOO-componentes'
}

{ #category : #initialization }
MorphExcursioneListInput class >> crearExcursionesList: wid [
|var|
var:= self new.
var iniciarExcursionesList: wid.
^var
]

{ #category : #initialization }
MorphExcursioneListInput >> agregarCol [

	| condition varInfo varCosto mensaje |
	varInfo := inputId text asString.
	varCosto := cantPersonas text asString.
	condition := varInfo ~= '' & (varCosto ~= '').
	condition
		ifTrue: [ 
			| var valor |
			var := Excursion crearCon: varInfo costo: varCosto.
			valor := self generarItem: varInfo costo: varCosto.
			colEx add: var.
			listaEx addMenuItem: valor.
			mensaje := '¡Fecha aregada con exito!'.
			mensaje := UIManager inform: mensaje ]
		ifFalse: [ 
			mensaje := '¡Datos invalidos!'.
			mensaje := UIManager inform: mensaje ]
]

{ #category : #initialization }
MorphExcursioneListInput >> generarItem: varInfo costo: varCosto [

	| box infoVar  infoCosto    |
	box := Morph new.
	box extent: 400@ 50.
	box color: (Color r: 0.5 g: 0.7 b: 0.9).
	box cornerStyle: #rounded.
	infoVar := StringMorph
		           contents: '  Informacion Excursion: ' ,varInfo   asString .
	infoCosto := StringMorph
		           contents: '  Costo:' , varCosto     asString .
	box addMorph: infoVar .
	box addMorph: infoCosto .
	infoVar  position: box position+(5@5).
	infoCosto  position: infoVar  bottomLeft +(0@5)  .
	^ box
]

{ #category : #initialization }
MorphExcursioneListInput >> getColExcursiones [
^colEx .
]

{ #category : #initialization }
MorphExcursioneListInput >> iniciarExcursionesListInput: wid [
	| box  agregar |
	self extent: wid + (0 @ 165).	
	self color: (Color r: 0.80 g: 0.8 b: 0.80).
	colEx  := OrderedCollection new.
	inputId  := RubTextFieldMorph new.
	inputId ghostText: ' ID'.
	inputId extent: wid-(150@0).

	cantPersonas  := RubTextFieldMorph new.
	cantPersonas ghostText: ' Personas'.
	cantPersonas extent: (140@0).
	cantPersonas cornerStyle: #rounded.
	box:= Morph new.
	box extent: wid +(0@20).
	box addMorph: inputId .
	box addMorph: cantPersonas .
	inputId position: box position.
	cantPersonas position: inputId topRight+(10@0) .
	
	self addMorph: box.
	scroll:= MorphListExcursion crearListExcursion: colEx  size: wid  .
	
	scroll := ScrollPane new.
	scroll borderColor: Color black.
	scroll color: Color white.
	scroll cornerStyle: #rounded.
	scroll extent: self width @ 100.
	listaEx  := MenuMorph new.
	listaEx initialize.
	listaEx borderColor: Color transparent.
	listaEx extent: scroll width - 5 @ 200.
	scroll scroller addMorph: listaEx.
	self addMorph: scroll.
	scroll bottomLeft: self bottomLeft.


	agregar := Button newWithLabel: 'AGREGAR'.
	agregar extent: 100 @ 30.
	agregar cornerStyle: #rounded.
	self addMorph: agregar.
	agregar topLeft: box   
]
