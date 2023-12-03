Class {
	#name : #Excursion,
	#superclass : #Object,
	#instVars : [
		'id',
		'info',
		'costo'
	],
	#classVars : [
		'nro'
	],
	#category : #'TPPOO-class'
}

{ #category : #constructor }
Excursion class >> crearCon:info costo:unCosto [
|unaExcursion|
unaExcursion := self new.
unaExcursion inicializarCon:info  costo:unCosto.
^unaExcursion
]

{ #category : #constructor }
Excursion class >> nextId [
| id |
    nro := nro ifNil: [1].
    id := nro.
    nro := nro  + 1.
    ^id
]

{ #category : #constructor }
Excursion class >> resetNro [
nro:=nil.
]

{ #category : #comparing }
Excursion >> equals: unId [
^ id = unId 
]

{ #category : #inicializador }
Excursion >> inicializarCon:infoExcursion costo:unCosto [ 
id:= Excursion  nextId .
info :=infoExcursion .
costo := unCosto .
]

{ #category : #printing }
Excursion >> toString [
^ 'id:',id asString,',info:',info ,',costo:',costo asString

]
