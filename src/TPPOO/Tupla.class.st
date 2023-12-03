Class {
	#name : #Tupla,
	#superclass : #Object,
	#instVars : [
		'primero',
		'segundo'
	],
	#category : #'TPPOO-class'
}

{ #category : #initialization }
Tupla class >> crear: pri segundo:seg [
|var|
var:= self new.
var initialize: pri segundo: seg .
^var.
]

{ #category : #initalize }
Tupla >> getPrimero [
^primero .
]

{ #category : #initalize }
Tupla >> getSegundo [
^segundo  .
]

{ #category : #initalize }
Tupla >> initialize: pri segundo: seg [ 
primero := pri .
segundo := seg.
]

{ #category : #initalize }
Tupla >> verificarId: id [
^  id= primero .
]
