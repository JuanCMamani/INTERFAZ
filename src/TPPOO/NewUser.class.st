Class {
	#name : #NewUser,
	#superclass : #Morph,
	#category : #'TPPOO-componentes'
}

{ #category : #initialization }
NewUser >> inicializar:padre [
|password correo  volverAtras login register|
self color:(Color r:0.9 g:0.9 b:0.9) .
self  cornerStyle: #rounded.
self extent: (padre width -70@ 150) .
self position: padre center- (self extent /2).
volverAtras := Button new.
volverAtras label:'VOLVER'.
volverAtras extent:(100@30).
volverAtras color:( Color r:0.40 g:0.55 b:0.95). 
volverAtras  cornerStyle: #rounded.
correo  := RubTextFieldMorph new.
correo ghostText: 'Ingrese un correo'.
correo  extent: (self width -20@0).
correo  cornerStyle: #rounded.
password := RubTextFieldMorph new.
password  ghostText: 'Ingrese una contraseña'.
password  extent: (self width-20@0).
password  cornerStyle: #rounded.
login := Button new.
login cornerStyle: #rounded.
login color:( Color r:0.40 g:0.55 b:0.95). 
login label:'INGRESAR'.
login extent: ((self width /2)-20 @30).
register := Button new.
register color:( Color r:0.40 g:0.55 b:0.95). 
register label:'REGISTRAR'.
register  extent: ((self width /2)-20 @30).
register  cornerStyle: #rounded.
self addMorph:	correo .
self addMorph:	password.
self addMorph:	login.
self addMorph:	register.	
self addMorph:	volverAtras .
correo position:self position+(10@20).
password position:self position+(10@65).
login bottomLeft: self bottomLeft+(10@(-10)) .
register  bottomRight: self bottomRight+((-10)@(-10)).
volverAtras  position:self bottomLeft +(10@20).
volverAtras  mouseAction: [ self volverLogin: padre ].

]

{ #category : #accessing }
NewUser >> volverLogin:padre [
self delete .
padre restaurarOpciones .
]
