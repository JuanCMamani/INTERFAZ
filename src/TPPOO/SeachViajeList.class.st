Class {
	#name : #SeachViajeList,
	#superclass : #SeachViaje,
	#instVars : [
		'collectionV',
		'sectionSech',
		'panelExtent',
		'listItem',
		'info',
		'listaViajes'
	],
	#category : #'TPPOO-componentes'
}

{ #category : #initialization }
SeachViajeList class >> crear [
|var|
var:= self new.
var iniciarSeachViaje.
^var.
	
]

{ #category : #initialization }
SeachViajeList class >> crear: emp [
|var|
var:= self new.
var iniciarSeachViaje:emp.
^var.
	
]

{ #category : #'accessing - token' }
SeachViajeList >> contenDefault [
listItem ifNotNil:[
	self newConten.
	]ifNil: [
	self extent: self extent + (0 @ 500).
	self newConten.
	  ]

]

{ #category : #'accessing - token' }
SeachViajeList >> generarInfo: nombreViaje [
contenInfo ifNotNil:[contenInfo delete].
contenInfo := self verInfo: nombreViaje.
self addMorph: contenInfo .
contenInfo position: self topRight  +(20@0).
]

{ #category : #accessing }
SeachViajeList >> generarTuplas [

	| viajes wid |
	wid := listItem width - 16.
	listaViajes := OrderedCollection new.
	viajes := empresa obtenerViajes.
	viajes do: [ :vi | 
		| itemMenu |
		itemMenu := self generarItem: vi size: wid.
		listaViajes add:
			(Tupla crear: vi getNombre asString segundo: itemMenu).
		listItem addMenuItem: itemMenu ]
]

{ #category : #initialization }
SeachViajeList >> iniciarSeachViaje:emp [
	super iniciarSeachViaje: emp .
]

{ #category : #accessing }
SeachViajeList >> newConten [
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
	self generarTuplas.
	self newConten: scrollPanel .
]

{ #category : #'accessing - token' }
SeachViajeList >> return: nombre [
|var retorno|
retorno:= nil.
var:= listaViajes detect: [ :tuplas | tuplas verificarId: nombre ]ifNone:[nil].
var ifNotNil: [retorno:= var getSegundo .].
^retorno  .
]

{ #category : #'accessing - token' }
SeachViajeList >> update: sas [
contenInfo ifNotNil:[ contenInfo delete].
listItem ifNotNil:[
	self newConten.
	]ifNil: [
	self extent: self extent + (0 @ 500).
	self newConten.
	  ]

]

{ #category : #accessing }
SeachViajeList >> updateView: val [
	listItem  submorphs do: [ :each | each delete ].
	listItem addMenuItem: val.
]
