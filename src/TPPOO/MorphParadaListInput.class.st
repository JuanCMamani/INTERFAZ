Class {
	#name : #MorphParadaListInput,
	#superclass : #Morph,
	#instVars : [
		'infoDia',
		'catD',
		'lugar',
		'tipoPension',
		'hotel',
		'listAct',
		'scroll',
		'listaParadas',
		'colParadas'
	],
	#category : #'TPPOO-componentes'
}

{ #category : #initialization }
MorphParadaListInput class >> crearParadaListInput: wid [
|var|
var:= self new.
var iniciarParadaListInput: wid.
^var.
]

{ #category : #initialization }
MorphParadaListInput >> agregarCol [

	| condition varInfo varDias varLu varHo varTipo varAct mensaje |
	varInfo  := infoDia  text asString.
	varDias  :=  catD  text asString.
		varLu  := lugar   text asString.
	varHo := hotel  text asString.
		varTipo  := tipoPension   text asString.
	varAct  := listAct  text asString.
	condition :=  (varInfo  ~= '')&(varDias  ~= '')&(varLu  ~= '')&(varHo  ~= '')&(varTipo  ~= '')&(varAct  ~= '').
	condition
		ifTrue: [ |var valor|
			var:=(Etapa crearCon: varInfo  cantDias: varDias   lugar: varLu   tipoPension: varTipo   hotel: varHo   listaActividades: varAct  ).
				valor:=  self generarItem: varInfo  lugar: varLu  hotel: varHo  .
				colParadas add: var .
					listaParadas   addMenuItem: valor.
			mensaje := '¡Fecha aregada con exito!'.
			mensaje := UIManager inform: mensaje. ]
		ifFalse: [ 
			mensaje := '¡Datos invalidos!'.
			mensaje := UIManager inform: mensaje ]
]

{ #category : #initialization }
MorphParadaListInput >> generarItem: info lugar: lu hotel: ho [

	| box infoLu  infoD hot   |
	box := Morph new.
	box extent: 400@ 70.
	box color: (Color r: 0.5 g: 0.7 b: 0.9).
	box cornerStyle: #rounded.
	infoD := StringMorph
		           contents: '  Info dia: ' ,info  asString .
	infoLu := StringMorph
		           contents: '  Lugar:' , lu    asString .
	hot := StringMorph
		           contents: '  Hotel:' , ho    asString .
	box addMorph: infoD.
	box addMorph: infoLu.
		box addMorph: hot.
	infoD position: box position+(5@5).
	infoLu position: infoD bottomLeft +(0@5)  .
		hot position: infoLu  bottomLeft +(0@5)  .
	^ box
]

{ #category : #initialization }
MorphParadaListInput >> getColParadas [
^ colParadas 
]

{ #category : #initialization }
MorphParadaListInput >> iniciarParadaListInput: wid [

	| box box2 agregar |
	self extent: wid + (0 @ 270).
	self color: Color transparent .
	colParadas := OrderedCollection new.
	infoDia := RubTextFieldMorph new.
	infoDia ghostText: ' Info dia'.
	infoDia extent: wid.
	infoDia cornerStyle: #rounded.

	catD := RubTextFieldMorph new.
	catD ghostText: ' Dias'.
	catD extent: wid // 2 - (10 @ 0).
	catD cornerStyle: #rounded.

	lugar := RubTextFieldMorph new.
	lugar ghostText: ' Lugar'.
	lugar extent: wid // 2.
	lugar cornerStyle: #rounded.

	hotel := RubTextFieldMorph new.
	hotel ghostText: ' Hotel'.
	hotel extent: wid // 2 - (10 @ 0).
	hotel cornerStyle: #rounded.

	tipoPension := RubTextFieldMorph new.
	tipoPension ghostText: ' Tipo pension'.
	tipoPension extent: wid // 2.
	tipoPension cornerStyle: #rounded.

	listAct := RubTextFieldMorph new.
	listAct ghostText: ' Actividades'.
	listAct extent: wid.
	listAct cornerStyle: #rounded.

	self addMorph: infoDia.
	box := Morph new.
	box color: Color transparent.
	box extent: wid + (0 @ 20).
	box2 := Morph new.
	box2 color: Color transparent.
	box2 extent: wid + (0 @ 20).

	box addMorph: catD.
	box addMorph: lugar.
	box2 addMorph: hotel.
	box2 addMorph: tipoPension.
	self addMorph: box.
	self addMorph: box2.
	self addMorph: listAct.
	infoDia position: self position.
	catD position: box position.
	lugar position: catD topRight + (10 @ 0).
	hotel position: box2 position.
	tipoPension position: hotel topRight + (10 @ 0).
	box position: infoDia bottomLeft + (0 @ 15).
	box2 position: box bottomLeft + (0 @ 15).
	listAct position: box2 bottomLeft + (0 @ 15).

	scroll := ScrollPane new.
	scroll borderColor: Color black.
	scroll color: Color white.
	scroll cornerStyle: #rounded.
	scroll extent: self width @ 100.
	listaParadas := MenuMorph new.
	listaParadas initialize.
	listaParadas borderColor: Color transparent.
	listaParadas extent: scroll width - 5 @ 200.
	scroll scroller addMorph: listaParadas.
	self addMorph: scroll.
	scroll bottomLeft: self bottomLeft.


	agregar := Button newWithLabel: 'AGREGAR'.
	agregar extent: 100 @ 30.
	agregar cornerStyle: #rounded.
	self addMorph: agregar.
	agregar topLeft: listAct bottomCenter - (agregar width // 2 @ -10).
	agregar mouseAction: [ self agregarCol ]
]
