Class {
	#name : #MorphInfoContrato,
	#superclass : #Morph,
	#instVars : [
		'nom',
		'vi',
		'feV',
		'fe',
		'precio',
		'cantP',
		'cantT',
		'excursiones',
		'cont',
		'cerrar',
		'font',
		'pagado',
		'contrato'
	],
	#category : #'TPPOO-componentes'
}

{ #category : #initialize }
MorphInfoContrato class >> crearInfoMorphContrato:contrato [
|var|
var:= self new.
var iniciarInfoMorphContrato: contrato  .
^var.

]

{ #category : #visualizadores }
MorphInfoContrato >> getNombre [ 
^ nom .
]

{ #category : #initialization }
MorphInfoContrato >> iniciarInfoMorphContrato: elCont [
|array|
	contrato := elCont.
	contrato addDependent: self.
	font := LogicalFont
		        familyName: StandardFonts defaultFont familyName
		        pointSize: 13.
	self extent: 330 @ 400.
	self color: (Color r: 0.5 g: 0.7 b: 0.9).
	self cornerStyle: #rounded.
	array := contrato   getInfo.
	nom := StringMorph
		       contents: '  ID: ' , (array at: 1) asString
		       font: font
		       emphasis: TextEmphasis bold.
	vi := StringMorph
		      contents: '  Viaje: ' , (array at: 2) asString
		      font: font
		      emphasis: TextEmphasis bold.
	feV := StringMorph
		       contents: '  FechaViaje: ' , (array at: 3) asString
		       font: font
		       emphasis: TextEmphasis bold.
	precio := StringMorph
		          contents: '  Precio Total: ' , (array at: 4) asString
		          font: font
		          emphasis: TextEmphasis bold.
	fe := StringMorph
		      contents: '  Fecha Contrato: ' , (array at: 5) asString
		      font: font
		      emphasis: TextEmphasis bold.
	cantP := StringMorph
		         contents:
		         '  Cantidad Personas: ' , (array at: 6) asString
		         font: font
		         emphasis: TextEmphasis bold.
	cantT := StringMorph
		         contents: '  Cantidad Cuotas: ' , (array at: 7) asString
		         font: font
		         emphasis: TextEmphasis bold.
	excursiones := StringMorph
		               contents:
		               '  Excursiones: ' , (array at: 8) asString
		               font: font
		               emphasis: TextEmphasis bold.
	pagado := StringMorph
		          contents:
		          '  Cantidad Cuotas Pagadas: ' , (array at: 9) asString
		          font: font
		          emphasis: TextEmphasis bold.
	self addMorph: nom.
	self addMorph: vi.
	self addMorph: feV.
	self addMorph: precio.
	self addMorph: fe.
	self addMorph: cantP.
	self addMorph: cantT.
	self addMorph: excursiones.
	self addMorph: pagado.
	nom position: self position + (15 @ 15).
	vi position: nom bottomLeft + (0 @ 10).
	feV position: vi bottomLeft + (0 @ 10).
	precio position: feV bottomLeft + (0 @ 10).
	fe position: precio bottomLeft + (0 @ 10).
	cantP position: fe bottomLeft + (0 @ 10).
	cantT position: cantP bottomLeft + (0 @ 10).
	excursiones position: cantT bottomLeft + (0 @ 10).
	pagado position: excursiones bottomLeft + (0 @ 10).
	cerrar := Button new.
	cerrar label: 'X'.
	self addMorph: cerrar.
	cerrar topRight: self topRight.
	self update: contrato .
	cerrar mouseAction: [ self delete ]
]

{ #category : #visualizadores }
MorphInfoContrato >> update: var [ 
var ifNotNil: [  
|array|
Transcript show: 'ingreso'.
	array := var   getInfo.
	nom contents: '  ID: ' , (array at: 1) asString.
	vi contents: '  Viaje: ' , (array at: 2) asString.
	feV contents: '  FechaViaje: ' , (array at: 3) asString.
	precio  contents: '  Precio Total: ' , (array at: 4) asString.
	fe contents: '  Fecha Contrato: ' , (array at: 5) asString.
	cantP contents:
		         '  Cantidad Personas: ' , (array at: 6) asString.
	cantT  contents: '  Cantidad Cuotas: ' , (array at: 7) asString.
	excursiones contents:
		               '  Excursiones: ' , (array at: 8) asString.
	pagado contents:
		          '  Cantidad Cuotas Pagadas: ' , (array at: 9) asString
		         
	].
]
