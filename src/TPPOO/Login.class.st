Class {
	#name : #Login,
	#superclass : #Morph,
	#instVars : [
		'text',
		'users',
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
	users := Button new.
	users label: 'USUARIOS'.
	users color: (Color r: 0.40 g: 0.55 b: 0.95).
	users cornerStyle: #rounded.
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
	users extent: self width - 60 @ 40.
	newUser extent: self width - 60 @ 40.
	admin extent: self width - 60 @ 40.
	users position: self center - (users extent / 2).
	newUser position: users center - (newUser extent / 2) + (0 @ 45).
	admin position: newUser center - (admin extent / 2) + (0 @ 45).
	text position:
		users center - (text width / 2 @ (text height / 2)) - (0 @ 45).
	self addMorph: users.
	self addMorph: admin.
	self addMorph: newUser.
	self addMorph: text.
	users mouseAction: [ self mostrarListaUsers ].
	newUser mouseAction: [ self ingresaNewUser ].
	admin mouseAction: [ self ingresaAdmin ]
]

{ #category : #accessing }
Login >> mostrarListaUsers [
|lista|
self ocultarOpciones .
lista:= (ListaUsuarios new)inicializar: self.
self addMorph: lista  . 
]

{ #category : #accessing }
Login >> ocultarOpciones [
self submorphs do: [ :each | each visible: false ].


]

{ #category : #accessing }
Login >> restaurarOpciones [
self submorphs do: [ :each | each visible:true ].



]
