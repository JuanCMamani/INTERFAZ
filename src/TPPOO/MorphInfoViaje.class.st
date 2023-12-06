Class {
	#name : #MorphInfoViaje,
	#superclass : #Morph,
	#instVars : [
		'viaje',
		'nombre',
		'preP',
		'porcPlus',
		'valImp',
		'array',
		'font',
		'cerrar',
		'cantP',
		'cantDias',
		'fechasSa',
		'excursion',
		'ciudad',
		'actividad',
		'fechaRe',
		'fechaSa',
		'cant'
	],
	#category : #'TPPOO-componentes'
}

{ #category : #initialization }
MorphInfoViaje class >> crearInfoMorphViaje: vi [
|var|
var:= self new.
var inicializarInfoMorphViaje: vi.
^var 
]

{ #category : #initialization }
MorphInfoViaje >> inicializarInfoMorphViaje: vi [

	font := LogicalFont
		        familyName: StandardFonts defaultFont familyName
		        pointSize: 13.
	self color: (Color r: 0.9 g: 0.9 b: 0.9).
	self extent: 300 @ 400.
	self cornerStyle: #rounded.
	viaje := vi.
	viaje addDependent: self.
	array := vi getInfo.
	nombre := StringMorph
		          contents: ' Nombre: ' , (array at: 1) asString
		          font: font
		          emphasis: TextEmphasis bold.
	preP := StringMorph
		        contents: ' Precio: ' , (array at: 2) asString
		        font: font
		        emphasis: TextEmphasis bold.
	porcPlus := StringMorph
		            contents: ' Porcentaje Plus: ' , (array at: 3) asString
		            font: font
		            emphasis: TextEmphasis bold.
	valImp := StringMorph
		          contents: ' Valor Impuesto: ' , (array at: 4) asString
		          font: font
		          emphasis: TextEmphasis bold.
	self addMorph: nombre.
	self addMorph: preP.
	self addMorph: porcPlus.
	self addMorph: valImp.
	nombre position: self position + (15 @ 15).
	preP position: nombre bottomLeft + (0 @ 10).
	porcPlus position: preP bottomLeft + (0 @ 10).
	valImp position: porcPlus bottomLeft + (0 @ 10).
	viaje verificarViaje
		ifTrue: [ 
			cantP := StringMorph
				         contents: ' Paradas: ' , (array at: 5) asString
				         font: font
				         emphasis: TextEmphasis bold.
			cantDias := StringMorph
				            contents: ' Dias: ' , (array at: 6) asString
				            font: font
				            emphasis: TextEmphasis bold.
			fechasSa := StringMorph
				            contents:
				            ' Fechas de Salida: ' , (array at: 7) asString
				            font: font
				            emphasis: TextEmphasis bold.
			excursion := StringMorph
				             contents:
				             ' Posee Excursiones: ' , (array at: 8) asString
				             font: font
				             emphasis: TextEmphasis bold.
			self addMorph: cantP.
			self addMorph: cantDias.
			self addMorph: fechasSa.
			self addMorph: excursion.
			cantP position: valImp bottomLeft + (0 @ 10).
			cantDias position: cantP bottomLeft + (0 @ 10).
			fechasSa position: cantDias bottomLeft + (0 @ 10).
			excursion position: fechasSa bottomLeft + (0 @ 10) ]
		ifFalse: [ 
			ciudad := StringMorph
				          contents: ' Ciudad: ' , (array at: 5) asString
				          font: font
				          emphasis: TextEmphasis bold.
			actividad := StringMorph
				             contents: ' Actividades: ' , (array at: 6) asString
				             font: font
				             emphasis: TextEmphasis bold.
			fechaSa := StringMorph
				           contents: ' Fecha Salida ' , (array at: 7) asString
				           font: font
				           emphasis: TextEmphasis bold.
			fechaRe := StringMorph
				           contents: ' Fecha Regreso: ' , (array at: 8) asString
				           font: font
				           emphasis: TextEmphasis bold.
			cant := StringMorph
				        contents: ' Disponibilidad:  ' , (array at: 9) asString
				        font: font
				        emphasis: TextEmphasis bold.
			self addMorph: ciudad.
			self addMorph: actividad.
			self addMorph: fechaRe.
			self addMorph: fechaSa.
			self addMorph: cant.
			ciudad position: valImp bottomLeft + (0 @ 10).
			actividad position: ciudad bottomLeft + (0 @ 10).
			fechaSa position: actividad bottomLeft + (0 @ 10).
			fechaRe position: fechaSa bottomLeft + (0 @ 10).
			cant position: fechaRe bottomLeft + (0 @ 10) ].
	cerrar := Button new.
	cerrar label: 'X'.
	self addMorph: cerrar.
	cerrar topRight: self topRight.
	self update: viaje.
	cerrar mouseAction: [ self delete ]
]

{ #category : #updating }
MorphInfoViaje >> update: vi [
vi ifNotNil: [  
	array := vi getInfo.
	nombre contents: ' Nombre: ' , (array at: 1) asString.
	preP  contents: ' Precio: ' , (array at: 2)asString .
	porcPlus contents: ' Porcentaje Plus: ' , (array at: 3) asString.
	valImp contents: ' Valor Impuesto: ' , (array at: 4) asString.
	vi verificarViaje
		ifTrue: [ 
			cantP contents: ' Paradas: ' , (array at: 5) asString.
			cantDias  contents: ' Dias: ' , (array at: 6) asString.
			fechasSa contents:
				            ' Fechas de Salida: ' , (array at: 7) asString.
			excursion contents:
				             ' Posee Excursiones: ' , (array at: 8) asString. ]
		ifFalse: [ 
			ciudad contents: ' Ciudad: ' , (array at: 5) asString.
			actividad contents: ' Actividades: ' , (array at: 6) asString.
			fechaSa  contents: ' Fecha Salida ' , (array at: 7) asString.
			fechaRe  contents: ' Fecha Regreso: ' , (array at: 8) asString.
			cant contents: ' Disponibilidad:  ' , (array at: 9) asString.
	]]
]
