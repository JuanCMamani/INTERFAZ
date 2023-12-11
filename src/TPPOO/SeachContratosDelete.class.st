Class {
	#name : #SeachContratosDelete,
	#superclass : #Morph,
	#instVars : [
		'seachContainer',
		'input',
		'seach',
		'conten',
		'contenInfo',
		'cliente'
	],
	#category : #'TPPOO-componentes'
}

{ #category : #initialization }
SeachContratosDelete class >> crear: cliente [
|var|
var:= self new.
var iniciarSeachContratosDelete: cliente .
^ var.
]

{ #category : #initialize }
SeachContratosDelete >> actionSech [

	| mensaje |
	input text asString = ''
		ifFalse: [ 
			| inputSeach contenidoModel |
			inputSeach := input text asString.
			contenidoModel := self return: inputSeach.
			contenidoModel
				ifNotNil: [ 
					self updateView: contenidoModel.
					mensaje := '¡Contrato Encontrado Exitosamente!'.
					mensaje := UIManager inform: mensaje ]
				ifNil: [ 
					mensaje := '¡Ingrese un nombre VALIDO!'.
					mensaje := UIManager inform: mensaje ] ]
		ifTrue: [ 
			self contenDefault.
			mensaje := '¡Ingrese un nombre VALIDO!'.
			mensaje := UIManager inform: mensaje ]
]

{ #category : #accessing }
SeachContratosDelete >> cancelarContrato: idCOntrato [

	| mensaje |
	(cliente cancelarCoontratoDeunViaje: idCOntrato) ifTrue: [ 
		mensaje := '¡Contrato Cancelado!'.
		mensaje := UIManager inform: mensaje .
		contenInfo delete.
		self update: cliente .
		]
]

{ #category : #initialize }
SeachContratosDelete >> contenDefault [
	conten ifNotNil: [  conten delete].
	conten := Morph new.
	conten extent:(self width -30 @ 80).
	conten color: Color white.
	conten cornerStyle: #rounded.
	self addMorph: conten.
	conten position: seachContainer bottomLeft + (10 @ 0).
]

{ #category : #initialize }
SeachContratosDelete >> deleteViaje: idContrato [
"	contenInfo delete.
	cliente  deleteViaje:  idContrato ."
]

{ #category : #accessing }
SeachContratosDelete >> generarInfo: idContrato [

	| pagar  |
	contenInfo isNotNil ifTrue: [ contenInfo delete ].
	contenInfo := self verInfo: idContrato.
	pagar := Button new.
	pagar label: 'ELIMINAR'.
	pagar extent: 100 @ 30.
	pagar cornerStyle: #rounded.
	contenInfo addMorph: pagar.
	pagar bottomLeft: contenInfo bottomCenter - (pagar width // 2 @ 10).
	self addMorph: contenInfo.
	contenInfo position: self bottomLeft +(10@10).
	pagar mouseAction: [ 
		self cancelarContrato:  idContrato  ]
]

{ #category : #accessing }
SeachContratosDelete >> generarItem: contrato size: size [ 
| nom vi feV box  verInfo infoViaje font|
font := LogicalFont
		        familyName: StandardFonts defaultFont familyName
		        pointSize: 13.
		box := Morph new.
		box extent: size @ 80.
		box color: (Color  r: 0.5 g:0.7 b:0.9).
		box cornerStyle: #rounded.
		infoViaje:= contrato getInfo.
		nom:= StringMorph  contents: '  ID: ' , (infoViaje  at: 1) asString font: font
		          emphasis: TextEmphasis bold.
		vi := StringMorph contents: '  Viaje: ' ,(infoViaje  at: 2)  asString font: font
		          emphasis: TextEmphasis bold.
		feV:= StringMorph contents: '  FechaViaje: ' ,(infoViaje  at: 3) asString font: font
		          emphasis: TextEmphasis bold.
		box addMorph: nom.
		box addMorph: vi.
		box addMorph: feV.
		nom position: box position + (0 @ 4).
		vi position: nom bottomLeft + (0 @ 2).
		feV position: vi bottomLeft + (0 @ 2).
		verInfo := Button new.
		verInfo label: 'VER INFO'.
		verInfo extent: 80 @ 40.
		verInfo color:( Color r:0.50 g:0.40 b:0.95).
		verInfo cornerStyle: #rounded.
		box addMorph: verInfo .
		verInfo  topRight: box  topRight   + (-20 @ 10).
		verInfo mouseAction: [ self generarInfo: (infoViaje  at: 1) asString ].
	^ box

]

{ #category : #initialize }
SeachContratosDelete >> iniciarSeachContratos: cont [
	self color:  Color red.
	self extent: (500@ 150).
	self cornerStyle: #rounded.
	seachContainer  := Morph new.
	seachContainer extent: (self width  @ 50).
	seachContainer color: Color transparent .
	self addMorph: seachContainer.
	seachContainer position: self position +(5@5).
	
	input := RubTextFieldMorph new.
	input extent:   (seachContainer width -125) @ 50.
	input ghostText: ' Ingrese el ID del contrato'.
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
	cliente   := cont .
	cliente  addDependent: self.
	self contenDefault.
	self update: cliente .
	seach mouseAction: [ self actionSech ].
	
]

{ #category : #initialize }
SeachContratosDelete >> iniciarSeachContratosDelete: cont [
	self color:  Color red.
	self extent: (500@ 150).
	self cornerStyle: #rounded.
	seachContainer  := Morph new.
	seachContainer extent: (self width  @ 50).
	seachContainer color: Color transparent .
	self addMorph: seachContainer.
	seachContainer position: self position +(5@5).
	
	input := RubTextFieldMorph new.
	input extent:   (seachContainer width -125) @ 50.
	input ghostText: ' Ingrese el ID del contrato'.
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
	cliente   := cont .
	cliente  addDependent: self.
	self contenDefault.
	self update: cliente .
	seach mouseAction: [ self actionSech ].
	
]

{ #category : #initialize }
SeachContratosDelete >> newConten: newConten [

	conten := newConten.
	self addMorph: conten.
	conten position: seachContainer bottomLeft + (10 @ 0)
]

{ #category : #accessing }
SeachContratosDelete >> pagarCuota: idCOntrato cantCuotas: num [

	|  mensaje  condicion |
	condicion := num asString ~= ''.
	condicion
		ifTrue: [ 
				(cliente cancelarCoontratoDeunViaje:idCOntrato)
					ifTrue: [ 
						mensaje := '¡Contrato Cancelado!'.
						mensaje := UIManager inform: mensaje ]
					]
		ifFalse: [ 
			mensaje := '¡Ingrese un numero valido!'.
			mensaje := UIManager inform: mensaje ]
]

{ #category : #initialize }
SeachContratosDelete >> return: idContrato [
	| cont wid   item |
	item := nil.
	wid := conten   width.
	cont :=  cliente obtenerContratoARealizar: idContrato asString.
	cont ifNotNil:[
		item := self generarItem: cont size: wid .
		]ifNil:[
		].
^ item .
]

{ #category : #accessing }
SeachContratosDelete >> update: unObjeto [
unObjeto ifNotNil: [
	contenInfo ifNotNil: [ |var|
	var := self return: contenInfo  getNombre .
			var
				ifNotNil: [ 
					self updateView: var].
		 ].
	
	self contenDefault 
	].
]

{ #category : #accessing }
SeachContratosDelete >> updateView: val [
self newConten: val.
]

{ #category : #initialize }
SeachContratosDelete >> verInfo: idContrato [
|cont|
	cont := cliente obtenerContratoARealizar: idContrato asString.
	^ MorphInfoContrato crearInfoMorphContrato: cont .
]
