Class {
	#name : #Button,
	#superclass : #SimpleButtonMorph,
	#instVars : [
		'bloque',
		'bloqueAccion'
	],
	#category : #'TPPOO-componentes'
}

{ #category : #initialization }
Button >> mouseAction: unBloque [
bloqueAccion := unBloque.
]

{ #category : #initialization }
Button >> mouseUp: unEvento [
super mouseUp: unEvento.
bloqueAccion value.

]
