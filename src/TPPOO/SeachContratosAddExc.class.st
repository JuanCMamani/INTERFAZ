Class {
	#name : #SeachContratosAddExc,
	#superclass : #Morph,
	#instVars : [
		'seachContainer',
		'input',
		'seach',
		'conten',
		'contenInfo',
		'cliente',
		'inputId',
		'inputCant',
		'colEx',
		'excursiones',
		'excursionesVi'
	],
	#category : #'TPPOO-componentes'
}

{ #category : #initialization }
SeachContratosAddExc class >> crear: cliente [
|var|
var:= self new.
var iniciarSeachContratosAddExc: cliente.
^ var.
]

{ #category : #initialize }
SeachContratosAddExc >> actionSech [

	| mensaje |
	input text asString = ''
		ifFalse: [ 
			| inputSeach  cont |
			inputSeach := input text asString.
			cont := cliente obtenerContratoARealizar: inputSeach asString.
			cont ifNotNil: [ |var|
				var:= cont obtenerViaje .
				(var verificarViaje)ifTrue: [
					self generarInfo: inputSeach .
					mensaje := '¡Contrato encontrado!'.
				mensaje := UIManager inform: mensaje
					  ].]ifNil:[
				mensaje := '¡Ingrese un nombre VALIDO!'.
				mensaje := UIManager inform: mensaje
				].
				 ]
		ifTrue: [ 
			self contenDefault.
			mensaje := '¡Ingrese un nombre VALIDO!'.
			mensaje := UIManager inform: mensaje ]
]

{ #category : #initialize }
SeachContratosAddExc >> agregarExcursion: contrato [

	| varId varCant mensaje  |
	varId := inputId text asString.
	varCant := inputCant text asString.
	varId ~= '' & (varCant ~= '')
		ifTrue: [ 
			contrato
				ifNotNil: [ 
					(contrato agregarExcusionPosible: varCant)
						ifTrue: [ 
							| val ex vi |
							vi := contrato obtenerViaje.
							ex := vi obtenerExcursion: varId.
							
							val := ExcursionArealizar crear: varCant excursion: ex.
							contrato agregarExcursion: val.
							self update: cliente.
							mensaje := '¡Agregacion exitosa!'.
							mensaje := UIManager inform: mensaje ]
						ifFalse: [ 
							mensaje := '¡Exceso de personas!'.
							mensaje := UIManager inform: mensaje ] ]
				ifNil: [ 
					mensaje := '¡Contrato No existente!'.
					mensaje := UIManager inform: mensaje ] ]
		ifFalse: [ 
			mensaje := '¡Ingrese datos validos!'.
			mensaje := UIManager inform: mensaje ]
]

{ #category : #initialize }
SeachContratosAddExc >> contenDefault [
	conten ifNotNil: [  conten delete].
	conten := Morph new.
	conten extent:(self width -30 @ 650).
	conten color: Color white.
	conten cornerStyle: #rounded.
	self addMorph: conten.
	conten position: seachContainer bottomLeft + (10 @ 0).
]

{ #category : #initialize }
SeachContratosAddExc >> deleteViaje: idContrato [
"	contenInfo delete.
	cliente  deleteViaje:  idContrato ."
]

{ #category : #accessing }
SeachContratosAddExc >> generarInfo: idContrato [

	| agregar box ex expo font viaje  |
	font := LogicalFont
		        familyName: StandardFonts defaultFont familyName
		        pointSize: 13.

	contenInfo   isNotNil ifTrue: [ conten delete ].
	contenInfo := self verInfo: idContrato. 
		
	contenInfo extent: contenInfo extent + (0 @ 220).

	inputId := RubTextFieldMorph new.
	inputId ghostText: ' ID'.
	inputId cornerStyle: #rounded.
	inputId extent: 92 @ 20.

	inputCant := RubTextFieldMorph new.
	inputCant ghostText: ' Personas'.
	inputCant extent: 92 @ 20.
	inputCant cornerStyle: #rounded.


	agregar := Button new.
	agregar label: 'AGREGAR'.
	agregar extent: 92 @ 25.
	agregar cornerStyle: #rounded.

	box := Morph new.
	box extent: conten width - 25 @ 40.
	box color: Color transparent.
	box addMorph: inputId.
	box addMorph: inputCant.
	box addMorph: agregar.
	inputId position: box position.
	inputCant position: inputId topRight + (10 @ 0).
	agregar position: inputCant topRight + (10 @ 0).
	contenInfo addMorph: box.
	colEx := cliente obtenerContratoARealizar: idContrato.
	ex := StringMorph
		      contents: '  Excursiones Contrato: '
		      font: font
		      emphasis: TextEmphasis bold.
	ex extent: box width @ 20.
	
	excursiones := MorphListExcursionArealizar crearListExcursionArealizar: colEx getInfoColExcursiones    size:  box width.
	
	viaje := (cliente obtenerContratoARealizar: idContrato) obtenerViaje.
	excursionesVi := MorphListExcursion
		                 crearListExcursion: viaje getColExcursionInfo   
		                 size: box width.
	expo := StringMorph
		        contents: '  Excursiones Disponibles: '
		        font: font
		        emphasis: TextEmphasis bold.
	expo extent: box width @ 20.

	contenInfo addMorph: excursiones.
	contenInfo addMorph: expo.
	contenInfo addMorph: ex.
	contenInfo addMorph: excursionesVi.
	excursionesVi bottomLeft: contenInfo bottomLeft - (-15 @ 10).
	expo bottomLeft: excursionesVi topLeft - (0 @ 10).
	excursiones bottomLeft: expo topLeft - (0 @ 10).
	box position: excursiones topLeft - (0 @ 30).
	ex bottomLeft: box topLeft - (0 @ 10).

	conten addMorph: contenInfo .
	self addMorph: conten .
	conten position: seachContainer bottomLeft + (10 @ 0).
	contenInfo position: conten position.
	agregar mouseAction: [  self agregarExcursion: colEx ].
]

{ #category : #initialize }
SeachContratosAddExc >> iniciarSeachContratosAddExc: unCliente [
	self color:  Color red.
	self extent: (500@ 720).
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
	cliente   := unCliente .
	cliente  addDependent: self.
	self contenDefault.
	self update: cliente .
	seach mouseAction: [ self actionSech ].
	
]

{ #category : #initialize }
SeachContratosAddExc >> newConten: newConten [
	conten ifNotNil:[conten  delete].
	conten   := newConten.
	self addMorph: conten.
	conten  position: seachContainer  bottomLeft + (10 @ 0)
]

{ #category : #initialize }
SeachContratosAddExc >> return: idContrato [
	| cont wid   item |
	item := nil.
	wid := conten   width.
	cont :=  cliente obtenerContratoARealizar: idContrato asString.
	cont ifNotNil:[
		item := self generarItem: cont size: wid .
		].
^ item .
]

{ #category : #accessing }
SeachContratosAddExc >> update: unObjeto [
unObjeto ifNotNil: [
	contenInfo ifNotNil: [ 
		conten ifNotNil:[
			conten delete.
			self contenDefault .
			].
	self generarInfo: contenInfo   getId  .
		 ].
	].
]

{ #category : #accessing }
SeachContratosAddExc >> updateView: val [
self newConten: val.
]

{ #category : #initialize }
SeachContratosAddExc >> verInfo: idContrato [
|cont varE|
	cont := cliente obtenerContratoARealizar: idContrato asString.
	varE := MorphInfoContrato crearInfoMorphContrato: cont .
	varE extent: varE extent +(140@0) .
	^varE .
]
