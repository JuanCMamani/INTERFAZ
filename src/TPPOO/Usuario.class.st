Class {
	#name : #Usuario,
	#superclass : #Object,
	#instVars : [
		'contraseña',
		'correo',
		'cuenta'
	],
	#category : #'TPPOO-class'
}

{ #category : #initialization }
Usuario class >> crear: gmail pasword: key [ 
|var|
var:= self new.
var initialize: gmail pasword: key.
^var 
]

{ #category : #initialization }
Usuario class >> crear: gmail pasword: key cuenta: cont [
|var|
var:= self new.
var initialize: gmail pasword: key cuenta: cont .
^var 
]

{ #category : #initialization }
Usuario >> addCliente: cliente [
cuenta := cliente .
]

{ #category : #initialization }
Usuario >> geContrato [
^ cuenta obtenerContratoARealizar .
]

{ #category : #initialization }
Usuario >> getCuenta [ 
^ cuenta .
]

{ #category : #initialization }
Usuario >> initialize: gmail pasword: key [
correo := gmail .
contraseña := key.
]

{ #category : #initialization }
Usuario >> initialize: gmail pasword: key cuenta: cont [ 
correo := gmail .
contraseña := key.
cuenta := cont .
]

{ #category : #initialization }
Usuario >> verificarIngreso: gmail pasword: key [
|var var2|
var:= (gmail =correo ).
var2:= (key=contraseña ).
^ (var & var2).
]
