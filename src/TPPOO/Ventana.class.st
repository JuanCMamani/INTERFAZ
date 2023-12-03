Class {
	#name : #Ventana,
	#superclass : #FullscreenMorph,
	#instVars : [
		'principal',
		'fondo',
		'login',
		'datos'
	],
	#category : #'TPPOO-componentes'
}

{ #category : #creating }
Ventana class >> crear [
|vent|
vent := self new .
vent  iniciar.
Sistema create.
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
datos := CargaSistema realizarInicio.
self addMorph:fondo .
self addMorph:login.

]

{ #category : #initialization }
Ventana >> manejarClik:event [
Transcript show: 'Hiciste clic en el botón. ¡Evento capturado!'.

]

{ #category : #initialization }
Ventana >> setFondo: numLRB [ 

fondo width: self  width-(numLRB*2).
fondo height: self  height-(numLRB*10+20) .
fondo right: self right-numLRB.
fondo left: self left+numLRB.
fondo top: self top+(numLRB*5+10).
]
