Class {
	#name : #Cuota,
	#superclass : #Object,
	#instVars : [
		'id',
		'pagado',
		'fechaProximoVencimiento',
		'monto'
	],
	#classVars : [
		'nro'
	],
	#category : #'TPPOO-class'
}

{ #category : #constructor }
Cuota class >> crearCon:unPrecio fechaProximoVencimiento: unaFechaProximoVencimiento [
|unaCuota|
unaCuota := self new.
unaCuota inicializarCon: unPrecio fechaVencimiento: unaFechaProximoVencimiento.
^unaCuota
]

{ #category : #constructor }
Cuota class >> nextId [

	| id |
	nro := nro ifNil: [ 1 ].
	id := nro.
	nro := nro + 1.
	^ id
]

{ #category : #constructor }
Cuota class >> resetNro [
nro:=nil.
]

{ #category : #visualizadores }
Cuota >> getNro [ 
^ id .
]

{ #category : #inicializador }
Cuota >> inicializarCon:unPrecio fechaVencimiento: unaFechaProximoVencimiento [
id := Cuota nextId .
monto := unPrecio .
pagado :=false.
fechaProximoVencimiento := unaFechaProximoVencimiento.
]

{ #category : #visualizadores }
Cuota >> obtenerEstaPago [
^pagado 

]

{ #category : #metodos }
Cuota >> pagar [
pagado := true.

]

{ #category : #printing }
Cuota >> toString [ 
^ 'Id: ',id asString,', monto:',monto asString ,', pagado: ',pagado asString ,', fecha Prox Vencimiento: ',(fechaProximoVencimiento )asString
]
