Class {
	#name : #MorphAltaViajeO,
	#superclass : #MorphAltaViaje,
	#category : #'TPPOO-componentes'
}

{ #category : #initialization }
MorphAltaViajeO class >> crearMorphAltaViaje [
|var|
var:= self new.
var iniciarMorphAltaViaje .
^var.
]
