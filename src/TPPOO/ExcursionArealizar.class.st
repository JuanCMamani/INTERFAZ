Class {
	#name : #ExcursionArealizar,
	#superclass : #Object,
	#instVars : [
		'canPersonas',
		'excursion'
	],
	#category : #'TPPOO-class'
}

{ #category : #initialization }
ExcursionArealizar class >> crear: pri excursion:seg [
|var|
var:= self new.
var initialize: pri excursion: seg.
^var.
]

{ #category : #initalize }
ExcursionArealizar >> getCantPersonas [ 
^canPersonas .
]

{ #category : #initalize }
ExcursionArealizar >> getExcursion [
^Excursion  .
]

{ #category : #initalize }
ExcursionArealizar >> getInfo [

|x|
x:= Array new: 2.
x at:1 put: canPersonas asString.
x at:2 put: excursion getInfo.
^x
]

{ #category : #initalize }
ExcursionArealizar >> getSegundo [
^Excursion  .
]

{ #category : #initalize }
ExcursionArealizar >> initialize: pri excursion: seg [ 
canPersonas := pri .
excursion := seg.
]

{ #category : #initalize }
ExcursionArealizar >> verificarId: id [
^  id= canPersonas .
]
