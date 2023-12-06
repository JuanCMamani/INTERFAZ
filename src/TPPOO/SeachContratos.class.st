Class {
	#name : #SeachContratos,
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
SeachContratos class >> crear [
|var|
var:= self new.
var iniciarSeachViaje.
^ var.
]

{ #category : #initialization }
SeachContratos class >> crear: cliente [
|var|
var:= self new.
var iniciarSeachContratos:  cliente.
^ var.
]

{ #category : #initialize }
SeachContratos >> actionSech [

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

{ #category : #initialize }
SeachContratos >> contenDefault [
	conten ifNotNil: [  conten delete].
	conten := Morph new.
	conten extent:(self width -30 @ 60).
	conten color: Color white.
	conten cornerStyle: #rounded.
	self addMorph: conten.
	conten position: seachContainer bottomLeft + (10 @ 10).
]

{ #category : #initialize }
SeachContratos >> deleteViaje: idContrato [
"	contenInfo delete.
	cliente  deleteViaje:  idContrato ."
]

{ #category : #accessing }
SeachContratos >> generarInfo: idContrato [

	| pagar cantCuotas |
	contenInfo isNotNil ifTrue: [ contenInfo delete ].
	contenInfo := self verInfo: idContrato.
	pagar := Button new.
	pagar label: 'PAGAR CUOTA'.
	pagar extent: 100 @ 30.
	pagar cornerStyle: #rounded.
	contenInfo extent: contenInfo extent + (0 @ 40).
	contenInfo addMorph: pagar.
	pagar bottomLeft: contenInfo bottomCenter - (pagar width // 2 @ 10).
	cantCuotas := RubTextFieldMorph new.
	cantCuotas extent: 100 @ 50.
	cantCuotas ghostText: ' Cuotas'.
	cantCuotas cornerStyle: #rounded.
	contenInfo addMorph: cantCuotas.
	cantCuotas bottomLeft:
		pagar bottomCenter - (cantCuotas width // 2 @ 40).


	self addMorph: contenInfo.
	contenInfo position: conten bottomLeft + (0 @ 20).
	pagar mouseAction: [ self pagarCuota: idContrato cantCuotas: cantCuotas text asString ]
]

{ #category : #accessing }
SeachContratos >> generarItem: contrato size: size [ 
| nom vi feV box  verInfo infoViaje |
		box := Morph new.
		box extent: size @ 64.
		box color: (Color  r: 0.5 g:0.7 b:0.9).
		box cornerStyle: #rounded.
		infoViaje:= contrato getInfo.
		nom:= StringMorph  contents: '  ID: ' , (infoViaje  at: 1) asString.
		vi := StringMorph contents: '  Viaje: ' ,(infoViaje  at: 2)  asString.
		feV:= StringMorph contents: '  FechaViaje: ' ,(infoViaje  at: 3) asString.
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
SeachContratos >> iniciarSeachContratos: cont [
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
SeachContratos >> newConten: newConten [

	conten := newConten.
	self addMorph: conten.
	conten position: seachContainer bottomLeft + (10 @ 10)
]

{ #category : #accessing }
SeachContratos >> pagarCuota: idCOntrato cantCuotas: num [

	| elContrato mensaje exito condicion |
	condicion := num asString ~= ''.
	condicion
		ifTrue: [ 
			elContrato := cliente obtenerContratoARealizar: idCOntrato.
			elContrato ifNotNil: [ 
				elContrato contratoPagado
					ifTrue: [ 
						mensaje := '¡El contrato no posee cuotas impagas!'.
						mensaje := UIManager inform: mensaje ]
					ifFalse: [ 
						exito := elContrato pagarCantCuotas: num.
						exito
							ifTrue: [ 
								mensaje := '¡Cuotas pagadas con exito!'.
								mensaje := UIManager inform: mensaje.
								elContrato contratoPagado ifTrue: [ 
									mensaje := '¡Completo el pago del contrato!'.
									mensaje := UIManager inform: mensaje ] ]
							ifFalse: [ 
								mensaje := '¡Ingrese una cantidad correcta!'.
								mensaje := UIManager inform: mensaje ] ] ] ]
		ifFalse: [ 
			mensaje := '¡Ingrese un numero valido!'.
			mensaje := UIManager inform: mensaje ]
]

{ #category : #initialize }
SeachContratos >> return: idContrato [
	| cont wid   item |
	item := nil.
	wid := conten   width.
	cont :=  cliente obtenerContratoARealizar: idContrato asString.
	cont ifNotNil:[
		item := self generarItem: cont size: wid .
		]ifNil:[
		Transcript show: 'Es nulo'.
		].
^ item .
]

{ #category : #accessing }
SeachContratos >> update: unObjeto [
unObjeto ifNotNil: [
	contenInfo ifNotNil: [ |var|
		Transcript show: 'LLEGO AL '.
	var := self return: contenInfo  getNombre .
			var
				ifNotNil: [ 
					self updateView: var].
		
		 ].
	
	self contenDefault 
	].
]

{ #category : #accessing }
SeachContratos >> updateView: val [
self newConten: val.
]

{ #category : #initialize }
SeachContratos >> verInfo: idContrato [
|cont|
	cont := cliente obtenerContratoARealizar: idContrato asString.
	^ MorphInfoContrato crearInfoMorphContrato: cont .
]
