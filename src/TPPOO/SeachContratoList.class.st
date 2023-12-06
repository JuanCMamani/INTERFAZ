Class {
	#name : #SeachContratoList,
	#superclass : #SeachContratos,
	#instVars : [
		'panelExtent',
		'listItem',
		'info',
		'listaContratos'
	],
	#category : #'TPPOO-componentes'
}

{ #category : #initialization }
SeachContratoList class >> crear: cuenta [
|var|
var:= self new.
var iniciarSeachContratos:  cuenta.
^var
]

{ #category : #initialization }
SeachContratoList >> contenDefault [
listItem ifNotNil:[
	self newConten.
	]ifNil: [
	self extent: self extent + (0 @ 300).
	self newConten.
	  ]
]

{ #category : #initialization }
SeachContratoList >> generarInfo: idContrato [
contenInfo ifNotNil:[contenInfo delete].
contenInfo := self verInfo: idContrato.
self addMorph: contenInfo .
contenInfo position: self bottomLeft +(20@20).
]

{ #category : #initialization }
SeachContratoList >> generarTuplas [

	| cont wid |
	wid := listItem width - 16.
	listaContratos := OrderedCollection new.
	cont := cliente obtenerContratoARealizar .
	cont do: [ :contrato | 
		| itemMenu |
		itemMenu := self generarItem: contrato size: wid.
		listaContratos add:
			(Tupla crear: contrato getId  asString segundo: itemMenu).
		listItem addMenuItem: itemMenu ]
]

{ #category : #initialization }
SeachContratoList >> iniciarSeachContratos: cont [
	super iniciarSeachContratos: cont .
]

{ #category : #initialization }
SeachContratoList >> newConten [
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

{ #category : #initialization }
SeachContratoList >> return: nombre [
|var retorno|
retorno:= nil.
var:= listaContratos detect: [ :tuplas | tuplas verificarId: nombre ]ifNone:[nil].
var ifNotNil: [retorno:= var getSegundo .].
^retorno  .
]

{ #category : #initialization }
SeachContratoList >> update: sas [
listItem ifNotNil:[
	self newConten.
	]ifNil: [
	self extent: self extent + (0 @ 500).
	self newConten.
	  ]
]

{ #category : #initialization }
SeachContratoList >> updateView: val [
	listItem  submorphs do: [ :each | each delete ].
	listItem addMenuItem: val.
]
