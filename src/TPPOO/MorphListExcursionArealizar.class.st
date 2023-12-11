Class {
	#name : #MorphListExcursionArealizar,
	#superclass : #ScrollPane,
	#instVars : [
		'listaEx'
	],
	#category : #'TPPOO-componentes'
}

{ #category : #initialization }
MorphListExcursionArealizar class >> crearListExcursionArealizar: colEx size: wid [
|var|
var:= self new.
var iniciarListExcursionArealizar: colEx size: wid.
^var.
]

{ #category : #initialization }
MorphListExcursionArealizar >> generarItem: colExc size: wind [

	| font |
	font := LogicalFont
		        familyName: StandardFonts defaultFont familyName
		        pointSize: 13.
	colExc ifNotNil: [ 
		colExc do: [ :fe | 
			| box infoEx cost iden var2 array arrayFirst cant|
			box := Morph new.
			box color: Color white.
			box cornerStyle: #rounded.
			box extent: wind + 100 @ 110.
				cant := StringMorph
				        contents: ' Cant Personas:' ,  (fe  at: 1)  asString
				        font: font
				        emphasis: TextEmphasis bold.
			
			array :=( fe at:2 ).
			var2 := box width.
			iden := StringMorph
				        contents: ' ID: ' , (array at: 1) asString
				        font: font
				        emphasis: TextEmphasis bold.
			iden cornerStyle: #rounded.
			infoEx := StringMorph
				          contents: ' Info: ' , (array at: 2) asString
				          font: font
				          emphasis: TextEmphasis bold.
			cost := StringMorph
				        contents: ' Costo: ' , (array at: 3) asString
				        font: font
				        emphasis: TextEmphasis bold.
 			cant extent: var2 @ 30.
			iden extent: var2 @ 30.
			infoEx extent: var2 @ 30.
			cost extent: var2 @ 30.
			infoEx cornerStyle: #rounded.
			infoEx cornerStyle: #rounded.
box addMorph: cant .
			box addMorph: iden.
			box addMorph: infoEx.
			box addMorph: cost.

			cant  position: box position + (0 @ 5).
			iden position: cant bottomLeft.
			infoEx position: iden bottomLeft.
			cost position: infoEx bottomLeft.
			listaEx addMenuItem: box ] ]
]

{ #category : #initialization }
MorphListExcursionArealizar >> iniciarListExcursionArealizar: colEx size: wid [

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
