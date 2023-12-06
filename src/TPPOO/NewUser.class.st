Class {
	#name : #NewUser,
	#superclass : #Morph,
	#instVars : [
		'windowLogin',
		'windowRegister',
		'password',
		'correo',
		'volverAtras',
		'login',
		'register',
		'blockSesion',
		'sistema'
	],
	#category : #'TPPOO-componentes'
}

{ #category : #initialization }
NewUser class >> crearNewUser: padre sitema: sistem [
|var|
var := self new.
var inicializar:padre sitema: sistem.
^var.
]

{ #category : #initialization }
NewUser >> inicializar:padre [
blockSesion :=Morph new.
blockSesion color:(Color r:0.9 g:0.9 b:0.9) .
blockSesion  cornerStyle: #rounded.
blockSesion extent: (padre width -70@ 150) .
self color: Color transparent .
self addMorph: blockSesion .
self extent: (500@ (padre height) ).
blockSesion position: padre center- (blockSesion extent /2).
volverAtras := Button new.
volverAtras label:'VOLVER'.
volverAtras extent:(100@30).
volverAtras color:( Color r:0.40 g:0.55 b:0.95). 
volverAtras  cornerStyle: #rounded.
correo  := RubTextFieldMorph new.
correo ghostText: 'Ingrese un correo'.
correo  extent: (blockSesion width -20@0).
correo  cornerStyle: #rounded.
password := RubTextFieldMorph new.
password  ghostText: 'Ingrese una contraseña'.
password  extent: (blockSesion width-20@0).
password  cornerStyle: #rounded.
login := Button new.
login cornerStyle: #rounded.
login color:( Color r:0.40 g:0.55 b:0.95). 
login label:'INGRESAR'.
login extent: ((blockSesion width /2)-20 @30).
register := Button new.
register color:( Color r:0.40 g:0.55 b:0.95). 
register label:'REGISTRAR'.
register  extent: ((blockSesion width /2)-20 @30).
register  cornerStyle: #rounded.
blockSesion addMorph:	correo .
blockSesion addMorph:	password.
blockSesion addMorph:	login.
blockSesion addMorph:	register.	
blockSesion addMorph:	volverAtras .
correo position: blockSesion position+(10@20).
password position: blockSesion position+(10@65).
login bottomLeft: blockSesion bottomLeft+(10@(-10)) .
register  bottomRight: blockSesion bottomRight+((-10)@(-10)).
volverAtras  position: blockSesion bottomLeft +(10@20).
volverAtras  mouseAction: [ self volverLogin: padre ].
login mouseAction: [ self login: (correo  text asString) pasword:(password  text asString)].
]

{ #category : #initialization }
NewUser >> inicializar:padre sitema: sistem [
sistema := sistem .
blockSesion :=Morph new.
blockSesion color:(Color r:0.9 g:0.9 b:0.9) .
blockSesion  cornerStyle: #rounded.
blockSesion extent: (padre width -70@ 150) .
self color: Color transparent .
self addMorph: blockSesion .
self extent: (500@ (padre height) ).
blockSesion position: padre center- (blockSesion extent /2).
volverAtras := Button new.
volverAtras label:'VOLVER'.
volverAtras extent:(100@30).
volverAtras color:( Color r:0.40 g:0.55 b:0.95). 
volverAtras  cornerStyle: #rounded.
correo  := RubTextFieldMorph new.
correo ghostText: 'Ingrese un correo'.
correo  extent: (blockSesion width -20@0).
correo  cornerStyle: #rounded.
password := RubTextFieldMorph new.
password  ghostText: 'Ingrese una contraseña'.
password  extent: (blockSesion width-20@0).
password  cornerStyle: #rounded.
login := Button new.
login cornerStyle: #rounded.
login color:( Color r:0.40 g:0.55 b:0.95). 
login label:'INGRESAR'.
login extent: ((blockSesion width /2)-20 @30).
register := Button new.
register color:( Color r:0.40 g:0.55 b:0.95). 
register label:'REGISTRAR'.
register  extent: ((blockSesion width /2)-20 @30).
register  cornerStyle: #rounded.
blockSesion addMorph:	correo .
blockSesion addMorph:	password.
blockSesion addMorph:	login.
blockSesion addMorph:	register.	
blockSesion addMorph:	volverAtras .
correo position: blockSesion position+(10@20).
password position: blockSesion position+(10@65).
login bottomLeft: blockSesion bottomLeft+(10@(-10)) .
register  bottomRight: blockSesion bottomRight+((-10)@(-10)).
volverAtras  position: blockSesion bottomLeft +(10@20).
volverAtras  mouseAction: [ self volverLogin: padre ].
login mouseAction: [ self login: (correo  text asString) pasword:(password  text asString)].
]

{ #category : #accessing }
NewUser >> login: gmail pasword: key [ 

	| var |
	var := sistema  obtenerUsuario: gmail pasword: key.
	var isNotNil
		ifTrue: [ windowLogin :=  VistaUser crear: self cuenta: (var getCuenta ) empresa: sistema  getEmpresa  .
			self ocultarMorph .
				self addMorph: windowLogin .
			]
		ifFalse: [ 
			| mensaje |
			"Mensaje de alerta"
			mensaje := 'Incorrect mail or password.'.
			mensaje := UIManager inform: mensaje ]
]

{ #category : #accessing }
NewUser >> ocultarMorph [
blockSesion visible: false.
]

{ #category : #accessing }
NewUser >> restaurarMoph [
blockSesion visible:true.
]

{ #category : #accessing }
NewUser >> volverLogin:padre [
self delete .
padre restaurarOpciones .
]
