Class {
	#name : #MorphFechaImputList,
	#superclass : #MorphFechaInput,
	#instVars : [
		'agregar',
		'listaCupos',
		'scroll'
	],
	#category : #'TPPOO-componentes'
}

{ #category : #initialization }
MorphFechaImputList class >> crearFechaImputList: wid [
|var|
var:= self new.
var iniciarFechaListMorph:wid.
^var.
]

{ #category : #initialization }
MorphFechaImputList >> agregarCol [

	| condition varFe varCu mensaje |
	varFe := fecha text asString.
	varCu := cupo text asString.
	condition := varFe ~= '' & (varCu ~= '').
	condition
		ifTrue: [ |var valor|
			var:=(FechaSalida
					 crearCon: (Date readFrom: varFe readStream)
					 cupo: varCu).
			colCupos add: var.
				valor:=  self generarItem:var.
					listaCupos addMenuItem: valor.
			mensaje := '¡Fecha aregada con exito!'.
			mensaje := UIManager inform: mensaje. ]
		ifFalse: [ 
			mensaje := '¡Datos invalidos!'.
			mensaje := UIManager inform: mensaje ]
]

{ #category : #initialization }
MorphFechaImputList >> deleteFecha: fech item: item [

	| var |
	var := colCupos
		       detect: [ :fe | fe verificarFechaSalida: fech ]
		       ifNone: [ nil ].
			Transcript show: var asString.
	colCupos := colCupos remove: var ifAbsent: [].
	Transcript show: colCupos toString.
	item delete
]

{ #category : #initialization }
MorphFechaImputList >> generarItem: fech [

	| box fe cu  font var|
	var:= fech.
	font:= font := LogicalFont
		        familyName: StandardFonts defaultFont familyName
		        pointSize: 13.
	box := Morph new.
	box extent: 405@ 30.
	box color: (Color r: 0.5 g: 0.7 b: 0.9).
	box cornerStyle: #rounded.
	fe := StringMorph
		           contents: '  Fecha: ' , fech getFecha  asString font: font
		       emphasis: TextEmphasis bold.
	cu := StringMorph
		           contents: '  Cupo:' , fech getCupo  asString font: font
		       emphasis: TextEmphasis bold.
	box addMorph: fe.
	box addMorph: cu.
	fe position: box position+(5@5).
	cu position: fe topRight  .
	^ box
]

{ #category : #initialization }
MorphFechaImputList >> getColCupos [
^ colCupos .
]

{ #category : #initialization }
MorphFechaImputList >> iniciarFechaListMorph:wid [

	| var |
	var := wid - 100.
	self iniciarFechaMorph: var.
	self extent: self extent + (100 @ 110).
	agregar := Button new.
	agregar label: 'AGREGAR'.
	agregar extent: 95 @ 23.
	agregar cornerStyle: #rounded.
	self addMorph: agregar.
	agregar position: cupo topRight + (7@ 0).
	scroll := ScrollPane new.
	scroll borderColor: Color black.
	scroll color: Color white.
	scroll cornerStyle: #rounded.
	scroll extent: self width @ 100.
	listaCupos := MenuMorph new.
	listaCupos initialize.
	listaCupos borderColor: Color transparent.
	listaCupos extent: scroll width -5@ 200.
	scroll scroller addMorph: listaCupos.
	self addMorph: scroll.
	scroll bottomLeft: self bottomLeft .
	agregar mouseAction: [ self agregarCol ]
]
