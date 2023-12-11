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
^ id  asInteger= unId asInteger .
]

{ #category : #printing }
Excursion >> getInfo [ 
|x|
x := Array new:3.
x at:1 put: id  .
x at:2 put: info  .
x at:3 put: costo   .
^x


]

{ #category : #inicializador }
Excursion >> inicializarCon:infoExcursion costo:unCosto [ 
id:= self class  nextId .
info :=infoExcursion .
costo := unCosto .
]

{ #category : #printing }
Excursion >> toString [
^ 'id:',id asString,',info:',info ,',costo:',costo asString

]
