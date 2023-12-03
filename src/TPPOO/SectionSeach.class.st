Class {
	#name : #SectionSeach,
	#superclass : #Morph,
	#instVars : [
		'listaViajes',
		'collectionV',
		'sectionSech'
	],
	#category : #'TPPOO-componentes'
}

{ #category : #initialization }
SectionSeach class >> crear: size in: modal [
|var|
var:= self new.
var initialize: size in: modal.
^var.
	
]

{ #category : #accessing }
SectionSeach >> actionSech: search panel: pasteUpMorph sech: inputNombre [

	search mouseAction: [ 
		inputNombre text asString = '' ifFalse: [ 
			| input contenidoModel |
			input := inputNombre text asString.
			contenidoModel :=  self return: input .
			contenidoModel isNotNil ifTrue: [ 
				self updateView: contenidoModel panel: pasteUpMorph ]ifFalse: [ Transcript show: 'no encontrado' ]. ] ]
]

{ #category : #accessing }
SectionSeach >> generarTuplas: conteiner [

	| viajes wid eliminar|
	wid :=conteiner width-16 .
	viajes := EmpresaTurismo getViajes.
	viajes do: [ :viaje | 
		| nom precio ciudad box nombreV ciudadV precioV|
		box := Morph new.
		box extent: wid @ 64.
		box color: (Color  r:0.2 g:0.6  b:0.8 ) .
		box  cornerStyle: #rounded.
		nombreV := StringMorph new.
		precioV := StringMorph new.
		ciudadV := StringMorph new.
		nom := viaje getInfo at: 1.
		precio := viaje getInfo at: 2.
		ciudad := viaje getInfo at: 3.
		nombreV contents: '  Nombre: ' , nom asString.
		precioV contents: '  Precio: ' , precio asString.
		ciudadV contents: '  Ciudad: ' , ciudad asString.
		box addMorph: nombreV.
		box addMorph: precioV.
		box addMorph: ciudadV.
		nombreV position: box position+(0@4).
		precioV position: nombreV bottomLeft+(0@2).
		ciudadV position: precioV bottomLeft+(0@2).
		eliminar := Button new.
		eliminar label: 'ELIMINAR'.
		eliminar extent: (80@40).
		eliminar   cornerStyle: #rounded.
		box addMorph: eliminar .
		eliminar topRight:  box topRight +((-20)@10).
		eliminar mouseAction: [ box delete ].
		listaViajes add: (Tupla crear: nom asString segundo:box ).
		conteiner addMenuItem: box ].
]

{ #category : #initialization }
SectionSeach >> initialize: size in: modal [

	|  window busqueda  buscar scrollPane pasteUpMorph input|
	listaViajes :=OrderedCollection new.
	self color: (Color r: 0.0 g: 0.5 b: 0.8).
	self extent: size.
	modal submorphs do: [ :each | each delete ].
	modal addMorph: self.
	self position: modal position.


	window := Morph new.
	window color: Color black .
	window extent:650 @ (self height - 400).
	self addMorph: window.
	window position: self position + (25 @ 100).
	
	scrollPane := ScrollPane new.
	scrollPane borderColor: Color transparent  .
	scrollPane color:(Color r: 0.0 g: 0.5 b: 0.8)..
	scrollPane extent: window extent.
	window addMorph: scrollPane.
	scrollPane position: window position.
	pasteUpMorph := MenuMorph new.
	pasteUpMorph initialize.
	pasteUpMorph borderColor: Color transparent.
	pasteUpMorph extent: window extent.
	scrollPane scroller addMorph: pasteUpMorph.

	self generarTuplas: pasteUpMorph .
	
	busqueda := RubTextFieldMorph new.
	busqueda extent: 500 @ 50.
	busqueda ghostText: ' ingres el nombre de un viaje'.
	busqueda color: Color white.
	busqueda cornerStyle: #rounded.
	sectionSech := Morph new.
	sectionSech extent: 650 @ 50.
	sectionSech addMorph: busqueda.
	sectionSech color: (Color r: 0.0 g: 0.5 b: 0.8).
	busqueda position: sectionSech position + (0 @ 10).
	self addMorph: sectionSech.
	sectionSech position: scrollPane topLeft - (0 @ sectionSech height).
	buscar := Button new.
	buscar label: 'BUSCAR'.
	buscar extent: 130 @ 25.
	buscar cornerStyle: #rounded.
	sectionSech addMorph: buscar.
	input := (busqueda text) asString.
	Transcript show: input.
	buscar position: busqueda topRight + (20 @ 0).
	self actionSech:buscar panel:pasteUpMorph sech: busqueda .

]

{ #category : #'accessing - token' }
SectionSeach >> return: nombre [
|var|
var:= listaViajes detect: [ :tuplas | tuplas verificarId: nombre ].
^ var getSegundo .
]

{ #category : #accessing }
SectionSeach >> updateView: conten panel: panel [

	panel submorphs do: [ :each | each delete ].
	
	panel addMenuItem: conten 
]
