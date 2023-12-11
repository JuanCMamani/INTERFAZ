Class {
	#name : #MorphItemFecha,
	#superclass : #Morph,
	#instVars : [
		'fechaSalida'
	],
	#category : #'TPPOO-componentes'
}

{ #category : #public }
MorphItemFecha >> delete: col [

	| var var2 |
	var2:= OrderedCollection new.
	var := col
		       detect: [ :fe | fe verificarFechaSalida: fechaSalida ]
		       ifNone: [ nil ].
	Transcript show: var asString.
	var2 = col remove: var ifAbsent: [  ].
	^ var2
]

{ #category : #initialization }
MorphItemFecha >> iniciarItemLista: fecha [
| box fe cu eliminar font var|
	fechaSalida := fecha.
	font:= font := LogicalFont
		        familyName: StandardFonts defaultFont familyName
		        pointSize: 13.
	box := Morph new.
	box extent: 475 @ 30.
	box color: (Color r: 0.5 g: 0.7 b: 0.9).
	box cornerStyle: #rounded.
	fe := StringMorph
		           contents: '  Fecha: ' , fecha getFecha  asString font: font
		       emphasis: TextEmphasis bold.
	cu := StringMorph
		           contents: '  Cupo:' , fecha getCupo  asString font: font
		       emphasis: TextEmphasis bold.
	box addMorph: fe.
	box addMorph: cu.
	fe position: box position+(5@5).
	cu position: fe topRight  .
	eliminar  := Button new.
	eliminar  label: 'ELIMINAR'.
	eliminar cornerStyle: #rounded.
	eliminar  extent: 80 @ 22.
	eliminar  color: (Color r: 0.50 g: 0.40 b: 0.95).
	box addMorph: eliminar .
	eliminar topRight: box topRight-(5@(-5)).
]
