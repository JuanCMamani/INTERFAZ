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
		'colExcursionesARealizar'
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
rta := ((( 	Date today )addDays: 7) <= fechaViaje ) & (cantClientes < cantPersonas) .
	(rta)
	ifTrue:[(unViaje verificarViaje)
		ifTrue:[colExcursionesARealizar add: excursion ]
		ifFalse:[rta:=false]
		].
"(rta)ifTrue:[
(unViaje verificarViaje ) ifTrue: [ unViaje nuevaExcursion:excursion]]ifFalse:[rta:=false]. "
^rta.
]

{ #category : #inicializador }
Contrato >> cargarCuota: unaCuota [
colCuotas add: unaCuota.
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
Contrato >> getPrecioTotal [
^ precioTotal .

]

{ #category : #inicializador }
Contrato >> inicializarCon: viaje cantPersonas: unaCantPersonas fechaViaje: unaFechaViaje cantCuotas: uncant [
"se utiliza un metodo de clase nextId"
id:= Contrato nextId  .
fecha :=Date today .
unViaje := viaje.
efectivizado :=false.
precioTotal := viaje obtenerPrecioTotal: unaCantPersonas .
cantPersonas := unaCantPersonas.
fechaViaje := unaFechaViaje.
colCuotas := nil .
cantCuotas := uncant  .
colExcursionesARealizar := OrderedCollection new.
]

{ #category : #inicializador }
Contrato >> iniciarColcuotas:uncant  plus: valor [
|nuevCol precioPorcuota fechaC |
nuevCol := OrderedCollection  new.
 precioPorcuota := ( precioTotal+valor  )// (uncant ) .
fechaC := Date today .
(uncant=1)ifTrue: [  fechaC:= fechaC subtractDays: 30.].
1 to: uncant  do: [:indice |
    | cuota |
    cuota := Cuota crearCon: precioPorcuota  fechaProximoVencimiento: (fechaC:=fechaC addDays: 30)  .
nuevCol  add: cuota . "Agrega el objeto a la colección"
].
colCuotas:= nuevCol .

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

	| cont |
	cont := 1.
colCuotas do: [ :cuota |
		            cuota obtenerEstaPago ifFalse: [
			            cont <= unCant ifTrue: [
				            cuota pagar.
				            cont := cont + 1 ] ] ].
^ true.
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
|rta cuotaNoPaga laFecha|
rta:= false.
laFecha:=((Date today)subtractDays: 1).
((fechaViaje)=laFecha  )
ifTrue:
[
	cuotaNoPaga := colCuotas detect:[:unaCuota | ((unaCuota obtenerEstaPago) not) ]ifNone:[nil].
	(cuotaNoPaga)
	ifNil: [rta:=true]
].
^rta
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
^ id=unID 

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
