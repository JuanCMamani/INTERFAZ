Class {
	#name : #MorphSeachViajeEntre,
	#superclass : #Morph,
	#instVars : [
		'seachContainer',
		'input',
		'seach',
		'conten',
		'contenInfo',
		'empresa'
	],
	#category : #'TPPOO-componentes'
}

{ #category : #initialization }
MorphSeachViajeEntre class >> crear: emp [
|var|
var:= self new.
var iniciarSeachViaje: emp.
^ var.
]

{ #category : #initialize }
MorphSeachViajeEntre >> actionSech [

	| mensaje |
	input text asString = ''
		ifFalse: [ 
			| inputSeach contenidoModel |
			inputSeach := input text asString.
			contenidoModel := self return: inputSeach.
			contenidoModel isNotNil
				ifTrue: [ 
					self updateView: contenidoModel.
					mensaje := '¡Viaje encontrado con EXITO!'.
					mensaje := UIManager inform: mensaje ]
				ifFalse: [ 
					mensaje := '¡Ingrese un nombre VALIDO!'.
					mensaje := UIManager inform: mensaje ] 
				]
		ifTrue: [ 
			self contenDefault.
			mensaje := '¡Ingrese un nombre VALIDO!'.
			mensaje := UIManager inform: mensaje ]
]

{ #category : #initialize }
MorphSeachViajeEntre >> contenDefault [
	conten ifNotNil: [  conten delete].
	conten := Morph new.
	conten extent:(self width -30 @ 60).
	conten color: Color white.
	conten cornerStyle: #rounded.
	self addMorph: conten.
	conten position: seachContainer bottomLeft + (10 @ 10).
]

{ #category : #initialize }
MorphSeachViajeEntre >> deleteViaje: nombreViaje [
	contenInfo delete.
	empresa deleteViaje:  nombreViaje.
]

{ #category : #accessing }
MorphSeachViajeEntre >> generarInfo: nombreViaje [
|eliminar|
(contenInfo isNotNil)ifTrue:[contenInfo delete].
contenInfo := self verInfo: nombreViaje.
eliminar := Button new.
eliminar label:'ELIMINAR'.
eliminar extent: (100@30).
eliminar  cornerStyle: #rounded.
contenInfo extent: contenInfo extent+(0@40).
contenInfo addMorph:eliminar .
eliminar bottomLeft: ( contenInfo  bottomCenter -(eliminar  width//2 @ 10)).
self addMorph: contenInfo .
contenInfo position:  conten  bottomLeft +(0@20).
eliminar mouseAction: [self deleteViaje: nombreViaje  ].
]

{ #category : #accessing }
MorphSeachViajeEntre >> generarItem: viaje size: size [ 
| nom precio  box nombreV  precioV verInfo infoViaje font|
	font := LogicalFont
		        familyName: StandardFonts defaultFont familyName
		        pointSize: 13.
		box := Morph new.
		box extent: size @ 64.
		box color: (Color  r: 0.5 g:0.7 b:0.9).
		box cornerStyle: #rounded.
		infoViaje:= viaje getInfo.
		nom :=infoViaje  at: 1.
		precio :=infoViaje at: 2.
		nombreV:= StringMorph  contents: '  Nombre: ' , nom asString font: font
		          emphasis: TextEmphasis bold.
		precioV := StringMorph contents: '  Precio: ' , precio asString font: font
		          emphasis: TextEmphasis bold.
		box addMorph: nombreV.
		box addMorph: precioV.
		nombreV position: box position + (0 @ 7).
		precioV position: nombreV bottomLeft + (0 @ 2).
		verInfo := Button new.
		verInfo label: 'VER INFO'.
		verInfo extent: 80 @ 40.
		verInfo color:( Color r:0.50 g:0.40 b:0.95).
		verInfo cornerStyle: #rounded.
		box addMorph: verInfo .
		verInfo  topRight: box  topRight   + (-20 @ 10).
		verInfo mouseAction: [ self generarInfo:  nom asString  ].
	^ box

]

{ #category : #initialize }
MorphSeachViajeEntre >> iniciarSeachViaje: emp [
	self color:  Color red.
	self extent: (500@ 140).
	self cornerStyle: #rounded.
	seachContainer  := Morph new.
	seachContainer extent: (self width  @ 50).
	seachContainer color: Color transparent .
	self addMorph: seachContainer.
	seachContainer position: self position +(5@5).
	
	input := RubTextFieldMorph new.
	input extent:   (seachContainer width -125) @ 50.
	input ghostText: ' Ingrese el nombre de un viaje'.
	input cornerStyle: #rounded.
	seachContainer addMorph: input.
	input position: seachContainer position + (15@ 15).
	seach := Button new.
	seach  label: 'BUSCAR'.
	seach extent: 80 @ 30.
	seach  color: (Color r: 0.40 g: 0.55 b: 0.95).
	seach cornerStyle: #rounded.
	seachContainer addMorph: seach.
	seach position: input topRight + (10 @ (-3)).
	empresa := emp.
	empresa addDependent: self.
	self contenDefault.
	self update: empresa.
	seach mouseAction: [ self actionSech ].
	
]

{ #category : #initialize }
MorphSeachViajeEntre >> newConten: newConten [

	conten := newConten.
	self addMorph: conten.
	conten position: seachContainer bottomLeft + (10 @ 10)
]

{ #category : #initialize }
MorphSeachViajeEntre >> return: nombre [
	| vi wid   item |
	item := nil.
	wid := conten   width.
	vi := empresa  obtenerViajePorNombre:   nombre .
	vi ifNotNil:[
		item := self generarItem: vi size: wid .
		].
^ item .
]

{ #category : #accessing }
MorphSeachViajeEntre >> update: unObjeto [
unObjeto ifNotNil: [self contenDefault ].
]

{ #category : #accessing }
MorphSeachViajeEntre >> updateView: val [
self newConten: val.
]

{ #category : #initialize }
MorphSeachViajeEntre >> verInfo: nombreViaje [
|containerInfo viaje|
	
	viaje := empresa obtenerViajePorNombre: nombreViaje asString.
	
	containerInfo:= MorphInfoViaje crearInfoMorphViaje: viaje .
	^ containerInfo
]
