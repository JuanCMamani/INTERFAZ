Class {
	#name : #Ventana,
	#superclass : #FullscreenMorph,
	#instVars : [
		'principal',
		'fondo',
		'login'
	],
	#category : #'TPPOO-componentes'
}

{ #category : #creating }
Ventana class >> crear [
|vent|
vent := self new .
vent  iniciar.
^vent .

]

{ #category : #initialization }
Ventana >> getFondo [
^fondo .
]

{ #category : #initialization }
Ventana >> iniciar [
login:=Login crearLogin: self.
fondo := Fondo crear:self .
self addMorph:fondo .
self addMorph:login.
login position: self position.
fondo position: login topRight.
]

{ #category : #initialization }
Ventana >> setFondo: numLRB [ 

fondo width: self  width-(numLRB*2).
fondo height: self  height-(numLRB*10+20) .
fondo right: self right-numLRB.
fondo left: self left+numLRB.
fondo top: self top+(numLRB*5+10).
]
