Class {
	#name : #Fondo,
	#superclass : #Morph,
	#instVars : [
		'fondo',
		'inicio',
		'imagen'
	],
	#category : #'TPPOO-componentes'
}

{ #category : #creating }
Fondo class >> crear: padre [
|font|
font := self new.
font inicializar: padre.
^font.
]

{ #category : #initialization }
Fondo >> inicializar:padre [
|dir|
dir:='pharo-local\iceberg\JuanCMamaniA\INTERFAZ\src\img\img_despegar.jpg'.
imagen  := (ImageMorph    new ) form: (ImageReadWriter formFromFileNamed:dir).
self extent: (padre width -500)@ (padre height).
self color:(Color r: 0 g:0.6 b:0.85 ).
imagen resize: self extent .
imagen position: self center  -(imagen extent/2).
self addMorph: imagen .


]
