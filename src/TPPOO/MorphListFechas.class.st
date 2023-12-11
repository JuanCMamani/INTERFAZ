Class {
	#name : #MorphListFechas,
	#superclass : #ScrollPane,
	#instVars : [
		'listaCupos'
	],
	#category : #'TPPOO-componentes'
}

{ #category : #initialization }
MorphListFechas class >> crearListFechas: colFech size:size [
|var|
var:= self new.
var iniciarListFechas: colFech size:size.
^var

]

{ #category : #accessing }
MorphListFechas >> generarItem: colFech size: size [
|font|
	font := LogicalFont
		        familyName: StandardFonts defaultFont familyName
		        pointSize: 13.
	colFech do: [ :fe | 
		| box fech cup |
		box := Morph new.
		box color: Color white  .
			box  cornerStyle: #rounded.
		box extent: (size-20 @ 22).
		fech := StringMorph contents: (fe at:1) asString
		          font: font
		          emphasis: TextEmphasis bold.
		fech extent: (size -110 @ 30).
		fech cornerStyle: #rounded.
		cup := StringMorph contents: ('Cupo:', (fe at:2)asString) font: font
		          emphasis: TextEmphasis bold.
		cup extent: (90 @ 30).
		cup cornerStyle: #rounded.
		box addMorph: fech.
		box addMorph: cup.
		fech position: box position+(5@0).
		cup position: fech topRight.
		listaCupos addMenuItem: box ]
]

{ #category : #initialization }
MorphListFechas >> iniciarListFechas: colFech size:size [
	self borderColor: Color black.
	self color: Color white.
	self cornerStyle: #rounded.
	self extent: (size@ 40).
	listaCupos := MenuMorph new.
	listaCupos initialize.
	listaCupos borderColor: Color transparent.
	listaCupos extent:self extent -(10@10).
	self scroller addMorph: listaCupos.
	self generarItem: colFech size: (listaCupos width -5) .
]
