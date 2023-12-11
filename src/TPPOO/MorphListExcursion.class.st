Class {
	#name : #MorphListExcursion,
	#superclass : #ScrollPane,
	#instVars : [
		'listaEx'
	],
	#category : #'TPPOO-componentes'
}

{ #category : #initialization }
MorphListExcursion class >> crearListExcursion: colEx size: wid [
|var|
var:= self new.
var iniciarListExcursion: colEx size: wid.
^var.
]

{ #category : #initialization }
MorphListExcursion >> generarItem: colExc size: wind [
"col de arrays"
	| font |
	font := LogicalFont
		        familyName: StandardFonts defaultFont familyName
		        pointSize: 13.
	colExc ifNotNil: [ 
		colExc do: [ :fe | 
				| box infoEx cost iden var2  |
				box := Morph new.
				box color: Color white.
				box cornerStyle: #rounded.
				box extent: wind + 100 @ 90.
				var2 := box width.
				iden := StringMorph
					        contents: ' ID: ' , (fe  at: 1) asString
					        font: font
					        emphasis: TextEmphasis bold.
				iden cornerStyle: #rounded.
				infoEx := StringMorph
					          contents: ' Info: ' , (fe at: 2) asString
					          font: font
					          emphasis: TextEmphasis bold.
				cost := StringMorph
					        contents: ' Costo: ' , (fe at: 3) asString
					        font: font
					        emphasis: TextEmphasis bold.

				iden extent: var2 @ 30.
				infoEx extent: var2 @ 30.
				cost extent: var2 @ 30.
				infoEx cornerStyle: #rounded.
				infoEx cornerStyle: #rounded.

				box addMorph: iden.
				box addMorph: infoEx.
				box addMorph: cost.

				iden position: box position + (0 @ 5).
				infoEx position: iden bottomLeft.
				cost position: infoEx bottomLeft.
				listaEx addMenuItem: box ] ] 
]

{ #category : #initialization }
MorphListExcursion >> iniciarListExcursion: colEx size: wid [

	self borderColor: Color black.
	self color: Color white.
	self cornerStyle: #rounded.
	self extent: wid @ 100.
	listaEx := MenuMorph new.
	listaEx initialize.
	listaEx borderColor: Color transparent.
	listaEx extent: self extent - (10 @ 10).
	self scroller addMorph: listaEx.
	self generarItem: colEx size: listaEx width - 5
]
