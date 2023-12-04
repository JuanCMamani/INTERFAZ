Class {
	#name : #Sistema,
	#superclass : #Object,
	#instVars : [
		'empresa',
		'clientes',
		'contratos',
		'usuarios'
	],
	#classInstVars : [
		'usuarios'
	],
	#category : #'TPPOO-class'
}

{ #category : #initialization }
Sistema class >> addUsuario: usuario [ 
usuarios add: usuario .

]

{ #category : #initialization }
Sistema class >> create [
usuarios := OrderedCollection new.
EmpresaTurismo reiniciar.
EmpresaTurismo create .


]

{ #category : #initialization }
Sistema class >> obtenerUsuario: gmail pasword: key [
|var|
var:= usuarios detect:[:user | user verificarIngreso: gmail pasword: key]ifNone:[nil].
^var.

]
