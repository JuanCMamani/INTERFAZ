Class {
	#name : #MorphListParada,
	#superclass : #ScrollPane,
	#instVars : [
		'listParadas'
	],
	#category : #'TPPOO-componentes'
}

{ #category : #initialization }
MorphListParada class >> crearListParada: colPar size:size [
|var|
var:= self new.
var iniciarListParada: colPar size:size.
^var

]

{ #category : #accessing }
MorphListParada >> generarItem: colPar size: size [

	| font |
	font := LogicalFont
		        familyName: StandardFonts defaultFont familyName
		        pointSize: 13.
	colPar do: [ :fe | 
		| box infoP cant lu tipo ho listA var2 |
		box := Morph new.
		box color: Color white.
		box cornerStyle: #rounded.
		box extent: size + 400 @ 180.
		var2 := box width.
		infoP := StringMorph
			         contents: ' Info: ' , (fe at: 1) asString
			         font: font
			         emphasis: TextEmphasis bold.
		infoP extent: size - 110 @ 30.
		infoP cornerStyle: #rounded.
		cant := StringMorph
			        contents: ' Dias: ' , (fe at: 2) asString
			        font: font
			        emphasis: TextEmphasis bold.
		lu := StringMorph
			      contents: ' Lugar: ' , (fe at: 3) asString
			      font: font
			      emphasis: TextEmphasis bold.

		tipo := StringMorph
			        contents: ' Tipo Hotel: ' , (fe at: 4) asString
			        font: font
			        emphasis: TextEmphasis bold.

		ho := StringMorph
			      contents: ' Hotel: ' , (fe at: 5) asString
			      font: font
			      emphasis: TextEmphasis bold.
		listA := StringMorph
			         contents: ' Actividades: ' , (fe at: 6) asString
			         font: font
			         emphasis: TextEmphasis bold.

		infoP extent: var2 @ 30.
		cant extent: var2 @ 30.
		lu extent: var2 @ 30.
		tipo extent: var2 @ 30.
		ho extent: var2 @ 30.
		listA extent: var2 @ 30.
		infoP cornerStyle: #rounded.
		cant cornerStyle: #rounded.
		lu cornerStyle: #rounded.
		tipo cornerStyle: #rounded.
		ho cornerStyle: #rounded.
		listA cornerStyle: #rounded.

		box addMorph: infoP.
		box addMorph: cant.
		box addMorph: lu.
		box addMorph: tipo.
		box addMorph: ho.
		box addMorph: listA.

		infoP position: box position + (5 @ 5).
		cant position: infoP bottomLeft.
		lu position: cant bottomLeft.
		tipo position: lu bottomLeft.
		ho position: tipo bottomLeft.
		listA position: ho bottomLeft.
		listParadas addMenuItem: box ]
]

{ #category : #initialization }
MorphListParada >> iniciarListParada: colPar size:size [
	self borderColor: Color black.
	self color: Color white.
	self cornerStyle: #rounded.
	self extent: (size@200).
	listParadas  := MenuMorph new.
	listParadas  initialize.
	listParadas  borderColor: Color transparent.
	listParadas extent:self extent -(10@10).
	self scroller addMorph: listParadas.
	self generarItem: colPar size: (listParadas width -5) .
]
