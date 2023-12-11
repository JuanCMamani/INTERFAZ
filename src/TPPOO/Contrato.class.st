Class {
	#name : #Contrato,
	#superclass : #Object,
	#instVars : [
		'id',
		'fecha',
		'precioTotal',
		'unViaje',
		'cantPersonas',
		'efectivizado',
		'fechaViaje',
		'cantCuotas',
		'colCuotas',
		'colExcursionesARealizar',
		'cantPagadas'
	],
	#classVars : [
		'nro'
	],
	#category : #'TPPOO-class'
}

{ #category : #constructor }
Contrato class >> crearCon: viaje cantPersonas: unaCantPersonas fechaViaje: unaFechaViaje cantCuotas: unaCantidad [ 
	| unContrato |
	unContrato := self new.
	unContrato inicializarCon:viaje  cantPersonas: unaCantPersonas fechaViaje:unaFechaViaje  cantCuotas: unaCantidad. 
	unContrato iniciarColcuotas: unaCantidad  plus:0 . 
	^ unContrato
]

{ #category : #constructor }
Contrato class >> nextId [
| id |
    nro := nro ifNil: [1].
    id := nro.
    nro := nro  + 1.
    ^id

]

{ #category : #initialization }
Contrato class >> resetNro [
nro:=nil.
]

{ #category : #modificadores }
Contrato >> agregarExcursion: unaExcursion [
colExcursionesARealizar add: unaExcursion
]

{ #category : #inicializador }
Contrato >> agregarExcursion: excursion cantClientes: cantClientes [
|rta|
rta := self agregarExcusionPosible: cantClientes .
	(rta)
	ifTrue:[(unViaje verificarViaje)
		ifTrue:[colExcursionesARealizar add: excursion ]
		ifFalse:[rta:=false]
		].
"(rta)ifTrue:[
(unViaje verificarViaje ) ifTrue: [ unViaje nuevaExcursion:excursion]]ifFalse:[rta:=false]. "
^rta.
]

{ #category : #visualizadores }
Contrato >> agregarExcusionPosible: cantClientes [
|rta|
rta := ((( 	Date today )addDays: 7) <= fechaViaje ) & (cantClientes < cantPersonas) .
	^rta
]

{ #category : #inicializador }
Contrato >> cargarCuota: unaCuota [
colCuotas add: unaCuota.
]

{ #category : #modificadores }
Contrato >> contratoPagado [

	Transcript
		show: 'pagadas:' , cantPagadas asString, ' cantCuotas: ' , cantCuotas asString;
		cr.
	^ cantPagadas asInteger = cantCuotas asInteger
]

{ #category : #visualizadores }
Contrato >> getCantPersonas [
^cantPersonas 
]

{ #category : #visualizadores }
Contrato >> getFechaViaje [ 
^ fechaViaje.
]

{ #category : #visualizadores }
Contrato >> getId [
^ id .

]

{ #category : #visualizadores }
Contrato >> getInfo [

	| iden fe precio viaje cantP  feV cantT  excursiones x pagadas|
	excursiones:='SI'.
	iden := id asString.
	viaje :=  unViaje getNombre  asString.
	feV:= fechaViaje asString.
	fe := fecha asString.
	precio := precioTotal  asString.
	cantP:= cantPersonas asString.
	cantT:= cantCuotas asString.
 (colExcursionesARealizar isEmpty)ifTrue:[excursiones:='NO'].
pagadas := cantPagadas asString.
	x := Array new: 9.
	x
		at: 1 put: iden;
		at: 2 put: viaje ;
		at: 3 put: feV ;
		at: 4 put: precio ;
		at: 5 put: fe ;
		at: 6 put: cantP  ;
		at: 7 put: cantT   ;
		at: 8 put: excursiones  ;
		at: 9 put: pagadas .
	^x

]

{ #category : #visualizadores }
Contrato >> getInfoColExcursiones [
|var|
var := OrderedCollection new.
colExcursionesARealizar do:[ :va| var add: va getInfo].
^var.
]

{ #category : #visualizadores }
Contrato >> getPrecioTotal [
^ precioTotal .

]

{ #category : #inicializador }
Contrato >> inicializarCon: viaje cantPersonas: unaCantPersonas fechaViaje: unaFechaViaje cantCuotas: uncant [
"se utiliza un metodo de clase nextId"
id:= self class  nextId  .
fecha :=Date today .
unViaje := viaje.
efectivizado :=false.
precioTotal := viaje obtenerPrecioTotal: unaCantPersonas .
cantPersonas := unaCantPersonas.
fechaViaje := unaFechaViaje.
colCuotas := nil .
cantCuotas := uncant  .
cantPagadas :=0.
colExcursionesARealizar := OrderedCollection new.
self changed .
]

{ #category : #inicializador }
Contrato >> iniciarColcuotas: unCant  plus: valor [
| precioPorcuota fechaC |
colCuotas:= OrderedCollection  new.
precioTotal := precioTotal+valor  .
 precioPorcuota := ( precioTotal  ) asInteger  // (unCant asInteger  ) .
fechaC := Date today .
(unCant asInteger  =1)ifTrue: [  fechaC:= fechaC subtractDays: 30.].
1 to:( unCant asInteger ) do: [:indice |
    | cuota |
    fechaC := fechaC addDays: 30.
    cuota := Cuota crearCon: (precioPorcuota asInteger  ) fechaProximoVencimiento: (fechaC  ).
    colCuotas  add: cuota. "Agrega el objeto a la colección"
].
self changed .

]

{ #category : #modificadores }
Contrato >> modificarFecha: unaFecha [
fechaViaje := unaFecha.

]

{ #category : #metodos }
Contrato >> montoReembolso [ 
^0.
]

{ #category : #visualizadores }
Contrato >> obtenerCantPersonas [
^cantPersonas 
]

{ #category : #visualizadores }
Contrato >> obtenerExcursion: unId [
|ex|
ex := colExcursionesARealizar detect:[:excur | excur equals: unId]ifNone:[nil].
^ex
]

{ #category : #visualizadores }
Contrato >> obtenerExcursiones [
^ colExcursionesARealizar 
]

{ #category : #visualizadores }
Contrato >> obtenerViaje [
^unViaje 
]

{ #category : #metodos }
Contrato >> opcionesModificacionContrato: unaOpcion modificacion: unaModi [
|rta|
rta:=false.
"Este metodo modifica un atributo del contrato"
(unaOpcion=1)
ifTrue:
[
(unViaje verificarViaje)
ifTrue:[
	(unViaje verificarFecha: unaModi cantPersonas:cantPersonas fechaVieja: fechaViaje )
	ifTrue:[
		fechaViaje := unaModi . rta := true] 
	].
].
^rta
]

{ #category : #metodos }
Contrato >> pagarCantCuotas: unCant [

	| cont val |
	val := false.
	cont := 1.
	((unCant asInteger + cantPagadas) <= (cantCuotas asInteger )) ifTrue: [ 
		colCuotas do: [ :cuota | 
			cuota obtenerEstaPago ifFalse: [ 
				(cont <= (unCant asInteger )) ifTrue: [ 
					cuota pagar.
					cantPagadas := cantPagadas + 1.
					cont := cont + 1 ] ] ].
		val := true .
		self changed .
		].
	^ val
]

{ #category : #metodos }
Contrato >> poseeCuotaAVencer [
|unaCuota aVencer|
aVencer:= false.
unaCuota := colCuotas detect:[:cuota | (cuota obtenerEstaPago) not. ] ifNone:[nil].
(unaCuota)ifNotNil:[aVencer:=true].
^aVencer

]

{ #category : #modificadores }
Contrato >> setFecha:unFecha [
fecha := unFecha.
]

{ #category : #printing }
Contrato >> toString [
| tx |
tx := 'Cuotas : ', String crlf.
colCuotas do: [ :ct | tx := tx, ct toString, String crlf ].
^ 'ID:', id asString, ',Fecha Contrato:', fecha asString,',Viaje:', unViaje getNombre asString , ',Fecha Viaje:', fechaViaje asString, ',cantCuotas :', cantCuotas asString, String crlf, tx.
]

{ #category : #printing }
Contrato >> toStringExcursiones [ 
|cadena|
cadena :='Excusiones del Contrato:',String crlf .
(colExcursionesARealizar isEmpty )ifTrue:  [ cadena:=cadena ,'No posee excursiones',String crlf . ] ifFalse:[ 
colExcursionesARealizar  do:[:ex | cadena:= cadena,'',ex toString ,String crlf  ].].
^cadena

]

{ #category : #verification }
Contrato >> verificarContrato [ 
^false.


]

{ #category : #verification }
Contrato >> verificarEfectivizacion [

	| rta laFecha |
	rta := false.
	laFecha := Date today subtractDays: 1.
	fechaViaje = laFecha ifTrue: [ 
		rta := cantCuotas asInteger = cantPagadas asInteger ].
	^ rta
]

{ #category : #verification }
Contrato >> verificarFechaViajeC [
|dias exito|
exito := false.
dias:= fechaViaje subtractDate: (Date today) .
(dias>=8)ifTrue:[exito := true].
^exito

]

{ #category : #verification }
Contrato >> verificarId:unID [
|val|
Transcript show: 'preimero:(',unID asString,')','segundo:(',id asStringWithCommas ,')'.
val:= (id asInteger=unID asInteger ).
Transcript show: 'El igual:(',val asString,')'.
^ val

]

{ #category : #verification }
Contrato >> verificarReferencia: viaje [

|rta|
rta := unViaje equals: viaje .
(rta)ifTrue: [ unViaje :=nil ].

^rta

]

{ #category : #verification }
Contrato >> verificarViaje: elViaje [ 
Transcript show:'se rompio'.
^ unViaje equals: elViaje  .
]
