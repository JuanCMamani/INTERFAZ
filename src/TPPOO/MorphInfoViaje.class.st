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
		'listParadas',
		'cantDias',
		'fechasSa',
		'excursion',
		'ciudad',
		'actividad',
		'fechaRe',
		'fechaSa',
		'cant',
		'fechaDisponible',
		'listEx'
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
	self extent: 300 @ 225.
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
	fechaSa := StringMorph
		           contents: ' Fechas de Salida: '
		           font: font
		           emphasis: TextEmphasis bold.
	fechaDisponible := MorphListFechas
		                   crearListFechas: (array at: 5)
		                   size: self width - 25.
	self addMorph: nombre.
	self addMorph: preP.
	self addMorph: porcPlus.
	self addMorph: valImp.
	self addMorph: fechaSa.
	self addMorph: fechaDisponible.
	nombre position: self position + (15 @ 15).
	preP position: nombre bottomLeft + (0 @ 10).
	porcPlus position: preP bottomLeft + (0 @ 10).
	valImp position: porcPlus bottomLeft + (0 @ 10).
	fechaSa position: valImp bottomLeft + (0 @ 10).
	fechaDisponible position: fechaSa bottomLeft + (0 @ 10).
	viaje verificarViaje
		ifTrue: [ 
			self extent: self extent +(0 @ 415).
			cantP := StringMorph
				         contents: ' Paradas: '
				         font: font
				         emphasis: TextEmphasis bold.
			listParadas := MorphListParada
				               crearListParada: (array at: 6)
				               size: self width - 25.
			cantDias := StringMorph
				            contents: ' Dias: ' , (array at: 7) asString
				            font: font
				            emphasis: TextEmphasis bold.
			excursion := StringMorph
				             contents: ' Excursiones: '
				             font: font
				             emphasis: TextEmphasis bold.
			listEx := MorphListExcursion
				          crearListExcursion: (array at: 8)
				          size: self width - 25.
			self addMorph: cantP.
			self addMorph: listParadas.
			self addMorph: cantDias.
			self addMorph: excursion.
			self addMorph: listEx .
			cantP position: fechaDisponible bottomLeft + (0 @ 10).
			listParadas position: cantP bottomLeft + (0 @ 10).
			cantDias position: listParadas bottomLeft + (0 @ 10).
			excursion position: cantDias bottomLeft + (0 @ 10).
			listEx  position: excursion  bottomLeft + (0 @ 10).
			 ]
		ifFalse: [ 
			self extent: self extent +(0 @ 95).
						ciudad := StringMorph
				          contents: ' Ciudad: ' , (array at: 6) asString
				          font: font
				          emphasis: TextEmphasis bold.
			actividad := StringMorph
				             contents: ' Actividades: ' , (array at: 7) asString
				             font: font
				             emphasis: TextEmphasis bold.
			fechaRe := StringMorph
				           contents:
				           ' Fecha de Regreso: ' , (array at: 8) asString
				           font: font
				           emphasis: TextEmphasis bold.
			self addMorph: ciudad.
			self addMorph: actividad.
			self addMorph: fechaRe.
			ciudad position: fechaDisponible bottomLeft + (0 @ 10).
			actividad position: ciudad bottomLeft + (0 @ 10).
			fechaRe position: actividad bottomLeft + (0 @ 10) ].
	cerrar := Button new.
	cerrar label: 'X'.
	self addMorph: cerrar.
	cerrar topRight: self topRight.
	self update: viaje.
	cerrar mouseAction: [ self delete ]
]

{ #category : #updating }
MorphInfoViaje >> update: vi [

	| arrayCupo |
	vi ifNotNil: [ 
		array := vi getInfo.
		nombre contents: ' Nombre: ' , (array at: 1) asString.
		preP contents: ' Precio: ' , (array at: 2) asString.
		porcPlus contents: ' Porcentaje Plus: ' , (array at: 3) asString.
		valImp contents: ' Valor Impuesto: ' , (array at: 4) asString.
		arrayCupo := array at: 5.
		fechaDisponible := MorphListFechas
			                   crearListFechas: arrayCupo
			                   size: self width - 25.
		vi verificarViaje
			ifTrue: [ 
				listParadas := MorphListParada
					               crearListParada: (array at: 6)
					               size: self width - 25.
				cantDias contents: ' Dias: ' , (array at: 7) asString.
				listEx := MorphListExcursion
					          crearListExcursion: (array at: 8)
					          size: self width - 25 ]
			ifFalse: [ 
				ciudad contents: ' Ciudad: ' , (array at: 6) asString.
				actividad contents: ' Actividades: ' , (array at: 7) asString.
				fechaRe contents: ' Fecha de Regreso: ' , (array at: 8) asString ] ]
]
