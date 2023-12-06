Class {
	#name : #MorphParada,
	#superclass : #Morph,
	#instVars : [
		'infoDia',
		'catD',
		'lugar',
		'tipoPension',
		'hotel',
		'listAct',
		'etapa'
	],
	#category : #'TPPOO-componentes'
}

{ #category : #initialization }
MorphParada >> inicializarMorphParada: et [

	| font array cerrar |
	font := LogicalFont
		        familyName: StandardFonts defaultFont familyName
		        pointSize: 13.
	self extent: 100 @ 200.
	self color: (Color r: 0.9 g: 0.9 b: 0.9).
	self extent: 300 @ 400.
	self cornerStyle: #rounded.
	etapa := et.
	etapa addDependent: self.
	array := etapa getInfo.
	infoDia := StringMorph
		           contents: ' Info Dia: ' , (array at: 1) asString
		           font: font
		           emphasis: TextEmphasis bold.
	catD := StringMorph
		        contents: ' Cantidad Dias: ' , (array at: 2) asString
		        font: font
		        emphasis: TextEmphasis bold.
	lugar := StringMorph
		         contents: ' Lugar: ' , (array at: 3) asString
		         font: font
		         emphasis: TextEmphasis bold.
	tipoPension := StringMorph
		               contents:
		               ' Tipo de Pension: ' , (array at: 4) asString
		               font: font
		               emphasis: TextEmphasis bold.
	catD := StringMorph
		        contents: ' Hotel: ' , (array at: 5) asString
		        font: font
		        emphasis: TextEmphasis bold.
	listAct := StringMorph 
		           contents: ' Actividades: ' , (array at: 6) asString
		           font: font
		           emphasis: TextEmphasis bold.
	self addMorph: infoDia.
	self addMorph: catD.
	self addMorph: lugar.
	self addMorph: tipoPension.
	self addMorph: catD.
	self addMorph: listAct.
	infoDia position: self position + (15 @ 15).
	catD position: infoDia bottomLeft + (0 @ 10).
	lugar position: catD bottomLeft + (0 @ 10).
	tipoPension position: lugar bottomLeft + (0 @ 10).
	catD position: tipoPension bottomLeft + (0 @ 10).
	listAct position: catD bottomLeft + (0 @ 10).
	cerrar := Button new.
	cerrar label: 'X'.
	self addMorph: cerrar.
	cerrar topRight: self topRight.
	self update: etapa.
	cerrar mouseAction: [ self delete ]
]

{ #category : #updating }
MorphParada >> update: et [

	| array |
	et ifNotNil: [ 
		array := etapa getInfo.
		infoDia contents: ' Info Dia: ' , (array at: 1) asString.
		catD contents: ' Cantidad Dias: ' , (array at: 2) asString.
		lugar contents: ' Lugar: ' , (array at: 3) asString.
		tipoPension contents: ' Tipo de Pension: ' , (array at: 4) asString.
		catD contents: ' Hotel: ' , (array at: 5) asString.
		listAct contents: ' Actividades: ' , (array at: 6) asString ]
]
