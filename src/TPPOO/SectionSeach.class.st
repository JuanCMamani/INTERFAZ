Class {
	#name : #SectionSeach,
	#superclass : #Morph,
	#instVars : [
		'listaViajes',
		'collectionV',
		'sectionSech',
		'panelExtent',
		'info'
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

	| viajes wid eliminar verInfo |
	wid := conteiner width - 16.
	viajes := EmpresaTurismo getViajes.
	viajes do: [ :viaje | 
		| nom precio ciudad box nombreV ciudadV precioV |
		box := Morph new.
		box extent: wid @ 64.
		box color: (Color  r: 0.5 g:0.7 b:0.9).
		box cornerStyle: #rounded.
		nom := viaje getInfo at: 1.
		precio := viaje getInfo at: 2.
		ciudad := viaje getInfo at: 3.
		nombreV:= StringMorph  contents: '  Nombre: ' , nom asString.
		precioV := StringMorph contents: '  Precio: ' , precio asString.
		ciudadV:= StringMorph contents: '  Ciudad: ' , ciudad asString.
		box addMorph: nombreV.
		box addMorph: precioV.
		box addMorph: ciudadV.
		nombreV position: box position + (0 @ 4).
		precioV position: nombreV bottomLeft + (0 @ 2).
		ciudadV position: precioV bottomLeft + (0 @ 2).
		eliminar := Button new.
		eliminar label: 'ELIMINAR'.
		eliminar  color:( Color r:0.50 g:0.40 b:0.95).
		eliminar extent: 80 @ 40.
		eliminar cornerStyle: #rounded.
		verInfo := Button new.
		verInfo label: 'VER INFO'.
		verInfo extent: 80 @ 40.
		verInfo color:( Color r:0.50 g:0.40 b:0.95).
		verInfo cornerStyle: #rounded.
		box addMorph: eliminar.
		box addMorph: verInfo .
		eliminar topRight: box topRight + (-20 @ 10).
		verInfo  topRight: eliminar  topLeft  -(10 @ 0).
		listaViajes add: (Tupla crear: nom asString segundo: box).
		eliminar mouseAction: [ box delete ].
		verInfo mouseAction: [ self verInfo: nom asString ].
		conteiner addMenuItem: box ]
]

{ #category : #initialization }
SectionSeach >> initialize: size in: modal [

	|  window busqueda  buscar scrollPane pasteUpMorph input|
	listaViajes :=OrderedCollection new.
	self color: Color transparent .
	self extent: size.
	modal submorphs do: [ :each | each delete ].
	modal addMorph: self.
	self position: modal position.
	panelExtent := modal extent.
	window := Morph new.
	window color: Color white .
	window extent:650 @ (self height - 400).
	self addMorph: window.
	window position: self position + (25 @ 200).
	window  cornerStyle: #rounded.
	scrollPane := ScrollPane new.
	scrollPane borderColor: Color transparent  .
	scrollPane color: Color transparent .
	scrollPane extent: window extent.
	window addMorph: scrollPane.
	scrollPane position: window position.
	pasteUpMorph := MenuMorph new.
	pasteUpMorph initialize.
	pasteUpMorph borderColor: Color transparent .
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
	sectionSech color: Color transparent .
	busqueda position: sectionSech position + (0 @ 10).
	self addMorph: sectionSech.
	sectionSech position: scrollPane topLeft - (0 @ sectionSech height).
	buscar := Button new.
	buscar label: 'BUSCAR'.
	buscar extent: 130 @ 30.
	buscar  color: (Color  r: 0.80 g:0.8 b:0.80 ) .
	buscar cornerStyle: #rounded.
	sectionSech addMorph: buscar.
	input := (busqueda text) asString.
	Transcript show: input.
	buscar position: busqueda topRight + (20 @ (-3)).
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

{ #category : #accessing }
SectionSeach >> verInfo: nombreViaje [

	| viaje nombre preP porcPlus valImp array font |
	font := LogicalFont
		        familyName: StandardFonts defaultFont familyName
		        pointSize: 15.
	info := Morph new.
	info color: (Color r: 0.9 g: 0.9 b: 0.9).
	info extent: panelExtent - (self width + 500 @ 600).
	info cornerStyle: #rounded.
	self addMorph: info.
	info position: self topRight + (250 @ 200).

	viaje := EmpresaTurismo seachName: nombreViaje.
	array := viaje getInfo.
	nombre := StringMorph
		          contents: ' Nombre: ' , (array at: 1) asString
		          font: font
		          emphasis: TextEmphasis bold.
	preP := StringMorph
		        contents: ' Precio: ' , (array at: 2) asString
		        font: font emphasis: TextEmphasis bold.
	porcPlus := StringMorph
		            contents: ' Porcentaje Plus: ' , (array at: 3) asString
		            font: font
		            emphasis: TextEmphasis bold.
	valImp := StringMorph
		          contents: ' Valor Impuesto: ' , (array at: 4) asString
		          font: font
		          emphasis: TextEmphasis bold.
	info addMorph: nombre.
	info addMorph: preP.
	info addMorph: porcPlus.
	info addMorph: valImp.
	nombre position: info position + (15 @ 15).
	preP position: nombre bottomLeft+ (0 @ 10).
	porcPlus position: preP bottomLeft + (0 @ 10).
	valImp position: porcPlus bottomLeft+ (0 @ 10).
	viaje verificarViaje  ifTrue:[
		| cantP cantDias fechasSa excursion|
		
		cantP := StringMorph contents:' Paradas: ', (array at: 5) asString font: font emphasis: TextEmphasis bold.
		cantDias := StringMorph contents:' Dias: ', (array at: 6) asString font: font emphasis: TextEmphasis bold.
		fechasSa := StringMorph contents: ' Fechas de Salida: ',(array at: 7) asString font: font emphasis: TextEmphasis bold.
		excursion := StringMorph contents: ' Posee Excursiones: ',(array at: 8) asString font: font emphasis: TextEmphasis bold.
		info addMorph: cantP.
		info addMorph: cantDias.
		info addMorph: fechasSa .
		info addMorph: excursion.
		cantP position: valImp bottomLeft+ (0 @ 10).
		cantDias position: cantP bottomLeft+ (0 @ 10).
		fechasSa position: cantDias bottomLeft+ (0 @ 10).
		excursion position: fechasSa bottomLeft+ (0 @ 10).
		]ifFalse: [ 
		| ciudad actividad fechaRe fechaSa cant |
		ciudad := StringMorph contents:' Ciudad: ', (array at: 5) asString font: font emphasis: TextEmphasis bold.
		actividad := StringMorph contents:' Actividades: ', (array at: 6) asString font: font emphasis: TextEmphasis bold.
		fechaRe := StringMorph contents: ' Fecha Regreso: ',(array at: 7) asString font: font emphasis: TextEmphasis bold.
		fechaSa := StringMorph contents: ' Fecha Salida: ',(array at: 8) asString font: font emphasis: TextEmphasis bold.
		cant  := StringMorph contents: ' Disponibilidad:  ',(array at: 8) asString font: font emphasis: TextEmphasis bold.
		info addMorph: ciudad.
		info addMorph: actividad.
		info addMorph: fechaRe.
		info addMorph: fechaSa.
		info addMorph: cant .
		ciudad position: valImp bottomLeft+ (0 @ 10).
		actividad position: ciudad bottomLeft+ (0 @ 10).
		fechaRe position: actividad bottomLeft+ (0 @ 10).
		fechaSa position: fechaRe bottomLeft+ (0 @ 10).
		cant position: fechaSa bottomLeft+ (0 @ 10).
		]
	"ifTrue: [ 
			| paradas listFecha cantDias coloEx |
			 ]"
]
