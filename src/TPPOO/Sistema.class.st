Class {
	#name : #Sistema,
	#superclass : #Object,
	#instVars : [
		'empresa',
		'clientes',
		'contratos'
	],
	#classInstVars : [
		'empresaT',
		'contratos',
		'clientes'
	],
	#category : #'TPPOO-class'
}

{ #category : #initialization }
Sistema class >> create [
empresaT := CargaSistema realizarInicio.


]

{ #category : #initialization }
Sistema class >> getEmpresa [
^empresaT 


]
