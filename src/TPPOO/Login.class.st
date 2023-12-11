Class {
	#name : #Login,
	#superclass : #Morph,
	#instVars : [
		'text',
		'newUser',
		'admin',
		'ventUser',
		'sistema'
	],
	#category : #'TPPOO-componentes'
}

{ #category : #creating }
Login class >> crearLogin:padre [
|var|
var:= self new.
var  extent: (500@ (padre height) ).
var inicializar.
^var.
]

{ #category : #accessing }
Login >> ingresaAdmin [
|var|
self ocultarOpciones .
var := (VistaAdmin new )ingresaAdmin: self empresa: sistema getEmpresa  .
]

{ #category : #accessing }
Login >> ingresaNewUser [
|val|
self ocultarOpciones .
val  :=NewUser  crearNewUser: self sitema: sistema .
self addMorph: val    . 
]

{ #category : #initialization }
Login >> inicializar [

	self color: Color white.
	sistema := Sistema crearConDatos.
	admin := Button new.
	admin label: 'ADMINISTRADOR'.
	admin color: (Color r: 0.40 g: 0.55 b: 0.95).
	admin cornerStyle: #rounded.
	newUser := Button new.
	newUser label: 'NUEVO USUARIO'.
	newUser color: (Color r: 0.40 g: 0.55 b: 0.95).
	newUser cornerStyle: #rounded.
	text := TextMorph new.
	text contents: 'INGRESAR COMO:'.
	text extent: text extent + (self width - text width @ 10).
	text centered.
	newUser extent: self width - 60 @ 40.
	admin extent: self width - 60 @ 40.
	newUser position: self center - (newUser extent / 2) + (0 @ 45).
	admin position: newUser center - (admin extent / 2) + (0 @ 45).
	text position:
		newUser  center - (text width / 2 @ (text height / 2)) - (0 @ 45).
	self addMorph: admin.
	self addMorph: newUser.
	self addMorph: text.
	newUser mouseAction: [ self ingresaNewUser ].
	admin mouseAction: [ self ingresaAdmin ]
]

{ #category : #accessing }
Login >> ocultarOpciones [
self submorphs do: [ :each | each visible: false ].


]

{ #category : #accessing }
Login >> restaurarOpciones [
self submorphs do: [ :each | each visible:true ].



]
