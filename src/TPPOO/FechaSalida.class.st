Class {
	#name : #FechaSalida,
	#superclass : #Object,
	#instVars : [
		'fecha',
		'cupo'
	],
	#category : #'TPPOO-class'
}

{ #category : #crear }
FechaSalida class >> crearCon: unaFecha cupo: unCupo [
|fechaCupo|
fechaCupo:= self new.
fechaCupo inicializarCon: unaFecha  cupo: unCupo .
^ fechaCupo . 
]

{ #category : #inicializador }
FechaSalida >> agregarCupos: unNumero [
cupo := cupo+unNumero .


]

{ #category : #inicializador }
FechaSalida >> cupoDisponible [
^(cupo>0)



]

{ #category : #inicializador }
FechaSalida >> descontarCupos: unNumero [
cupo := cupo-unNumero asInteger .


]

{ #category : #inicializador }
FechaSalida >> equals: unaFecha [
^ fecha =unaFecha. 


]

{ #category : #visualizadores }
FechaSalida >> fechaPosible: unCantPer [
^ cupo>=unCantPer .
]

{ #category : #inicializador }
FechaSalida >> getCupo [
^ cupo .


]

{ #category : #inicializador }
FechaSalida >> getFecha [
^fecha .


]

{ #category : #inicializador }
FechaSalida >> getInfo [

	| array |
	array := Array new: 2.
	array at: 1 put: fecha.
	array at: 2 put: cupo.
	^ array
]

{ #category : #inicializador }
FechaSalida >> getInfoFecha [

	| array |
	array := Array new: 2.
	array at: 1 put: fecha.
	array at: 2 put: cupo.
	^ array
]

{ #category : #inicializador }
FechaSalida >> inicializarCon: unaFecha cupo: unCupo [
fecha := unaFecha .
cupo := unCupo .


]

{ #category : #inicializador }
FechaSalida >> menor: unaFecha [
^fecha < unaFecha getFecha  .
]

{ #category : #inicializador }
FechaSalida >> setCupo: unNumero [
cupo :=unNumero .


]

{ #category : #inicializador }
FechaSalida >> setFecha: unaFecha [
fecha:= unaFecha.
]

{ #category : #inicializador }
FechaSalida >> setFechaSalida: unaFecha [
fecha:= unaFecha.
]

{ #category : #visualizadores }
FechaSalida >> toString [
^'Fecha Salida:',fecha asString ,',cupo:',cupo asString .
]

{ #category : #inicializador }
FechaSalida >> verificarCupo: cant [
|var|
var:=(cupo asInteger  -cant asInteger )>=0.
var ifTrue: [self descontarCupos: cant.].
^var.



]

{ #category : #inicializador }
FechaSalida >> verificarDisponibleEntre: fecha1 y:fecha2 [
^(fecha1 <= fecha   and: fecha <= fecha2 )&(cupo asInteger  >0)
]

{ #category : #inicializador }
FechaSalida >> verificarFecha: unaFecha [
^ fecha = unaFecha .
]

{ #category : #inicializador }
FechaSalida >> verificarFechaSalida: unaFecha [
^(fecha = unaFecha getFecha )&(cupo = unaFecha getCupo) .
]
