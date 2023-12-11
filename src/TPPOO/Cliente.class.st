Class {
	#name : #Cliente,
	#superclass : #Object,
	#instVars : [
		'dni',
		'apellido',
		'correo',
		'telefono',
		'ciudad',
		'colContratosEfectivizados',
		'colContratosCancelados',
		'colContratosARealizar',
		'preferencias'
	],
	#category : #'TPPOO-class'
}

{ #category : #constructor }
Cliente class >> crearCon: unDni apellido: unApellido correo: unCorreo telefono: unTelefono ciudad: unaCiudad [ 
|unCliente|
 unCliente := self new.
 unCliente inicializarCon: unDni apellido: unApellido correo: unCorreo telefono: unTelefono ciudad: unaCiudad.
^unCliente
]

{ #category : #inicializador }
Cliente >> agregarContratoCancelado:unContrato [
colContratosCancelados add: unContrato .
]

{ #category : #inicializador }
Cliente >> agregarContratoEfectivizado:unContrato [
colContratosEfectivizados  add: unContrato .
]

{ #category : #inicializador }
Cliente >> agregarPreferencia: nuevaPreferencia [
^ preferencias add: nuevaPreferencia .

]

{ #category : #metodos }
Cliente >> buscarReferencia: viaje [

|contrato exito |
exito := false.
contrato:=colContratosARealizar  detect:[:unContrato | unContrato verificarReferencia: viaje ]ifNone:[nil].
(contrato)ifNotNil: [ colContratosARealizar  remove: contrato.exito := true.].
^exito
]

{ #category : #metodos }
Cliente >> buscarViajeModificado: viaje fecha: unaFecha [

|contrato exito |
exito := false.
contrato:=colContratosARealizar  detect:[:unContrato | unContrato verificarReferencia: viaje ]ifNone:[nil].
(contrato)ifNotNil: [ contrato modificarFecha: unaFecha.exito := true.].
^exito
]

{ #category : #metodos }
Cliente >> cancelarContrato: idContato [
|elContrato exito elViaje |
exito :=true.
elContrato:= self obtenerContratoARealizar: idContato asInteger .
(elContrato isNotNil )
ifTrue: [ elViaje:=(elContrato obtenerViaje).
	Transcript show: 'SE ENCONTRO COntrato'.
	(elViaje verificarViaje)
	ifTrue: [ elViaje actualizarDisponibilidad: elContrato getCantPersonas  fechaSalida: elContrato getFechaViaje.
		  ] 
	ifFalse:[elViaje actualizarDisponibilidad: elContrato getCantPersonas.
		 ]]
ifFalse: [ exito :=false. ].
(exito )ifTrue: [  
	self agregarContratoCancelado: elContrato.
	 colContratosARealizar remove: elContrato.
	self obtenerReembolso: elContrato  .
	 ].
self changed .
^exito.
	 


]

{ #category : #metodos }
Cliente >> cancelarCoontratoDeunViaje: unViaje [

	| contrato exito valor|
	exito := true.
	contrato := colContratosARealizar detect: [ :unContrato |unContrato verificarViaje: unViaje  ] ifNone: [ nil ].
	contrato isNotNil
		ifTrue: [
			Transcript show: contrato toString ;cr;cr.
			(unViaje verificarViaje) 
			ifTrue: [
				 unViaje actualizarDisponibilidad: contrato getCantPersonas fechaSalida: contrato getFechaViaje ]
		ifFalse: [ 
					unViaje actualizarDisponibilidad: contrato getCantPersonas ] ]
		ifFalse: [ exito := false ].
	exito ifTrue: [
		self agregarContratoCancelado: contrato.
		colContratosARealizar remove: contrato.
		valor := contrato montoReembolso.
		self obtenerReembolso: valor ].
	^ exito
]

{ #category : #inicializador }
Cliente >> cargarContrato: unContrato [
colContratosARealizar add:unContrato.
]

{ #category : #metodos }
Cliente >> contratarPaquete: unViaje fechaViaje: unaFecha cantPersonas: unaCantPersonas cantCuotas: unaCantidad pagaPlus: unVoF [
	| exito |
	exito := true.
	((unViaje verificarCupo: unaFecha cantPersonas: unaCantPersonas)  )
		ifTrue: [
			(unVoF  )
			ifTrue: [
		   colContratosARealizar add: (Flexible crearCon:unViaje  cantPersonas:unaCantPersonas  fechaViaje:unaFecha  cantCuotas:unaCantidad )]   
			ifFalse: [ 
				 colContratosARealizar add: (Contrato  crearCon:unViaje  cantPersonas:unaCantPersonas  fechaViaje:unaFecha  cantCuotas:unaCantidad ) ].
			
			self changed . 
			] ifFalse:[exito:=false.]. 
	
	^ exito
]

{ #category : #metodos }
Cliente >> efectivizarContrato [
|rta |
rta := false.
colContratosARealizar do:[:unContrato |
	(unContrato verificarEfectivizacion)
	ifTrue:
	[colContratosARealizar  remove: unContrato  .	
	self agregarContratoEfectivizado: unContrato .
	 rta:= true]].
self changed .
	^rta
]

{ #category : #visualizadores }
Cliente >> getCorreo [
^correo 
]

{ #category : #metodos }
Cliente >> getInfo [
|array|
array := OrderedCollection new.
array at: dni asString .
array at: apellido asString .
array at: correo asString .
array at: telefono asString .
array at: ciudad asString .
array at: colContratosARealizar  .
array at: colContratosCancelados   .
array at: preferencias  asString ."8 elementos"
^ array 



]

{ #category : #inicializador }
Cliente >> inicializarCon: unDni apellido: unApellido correo: unCorreo telefono: unTelefono ciudad: unaCiudad [ 
dni :=unDni .
apellido := unApellido.
correo := unCorreo.
telefono:= unTelefono.
ciudad := unaCiudad.
colContratosARealizar := OrderedCollection new.
colContratosCancelados :=OrderedCollection new.
colContratosEfectivizados :=OrderedCollection new.
preferencias := OrderedCollection new.

]

{ #category : #'verificación' }
Cliente >> obtenerColContratos [
^colContratosARealizar 
]

{ #category : #visualizadores }
Cliente >> obtenerContratoARealizar [
^ colContratosARealizar .
]

{ #category : #visualizadores }
Cliente >> obtenerContratoARealizar:unID [
|cont|
cont := colContratosARealizar detect:[:cadCt | cadCt verificarId: unID ]ifNone:[nil].
^cont 
]

{ #category : #visualizadores }
Cliente >> obtenerContratoCancelado:unID [
|cont|
cont := colContratosCancelados  detect:[:cadCt | cadCt verificarId: unID ]ifNone:[^nil].
^cont 
]

{ #category : #visualizadores }
Cliente >> obtenerContratoDeViaje: viaje [

|contrato exito |
exito := false.
contrato:=colContratosARealizar  detect:[:unContrato | unContrato verificarReferencia: viaje ]ifNone:[nil].
(contrato)ifNotNil: [ colContratosARealizar  remove: contrato.exito := true.].
^exito
]

{ #category : #visualizadores }
Cliente >> obtenerReembolso: valor [
"el cliente normal no resibe ningun devolucion pero decidimos notificarlo"
	Transcript show: 'resivio un reembolso de monto:0';cr.
]

{ #category : #metodos }
Cliente >> realizarModificacionContrato:unaOpcion contrato: contrato modificacion: unaModificacion [
|rta opcion |

rta:=contrato opcionesModificacionContrato: unaOpcion modificacion: unaModificacion.
(rta)ifFalse:[
	"Damos la opcion de cancelar o no modificar nada"
	"
	1: cancelar contrato
	otro: no modificar
	"
	opcion:=1.
	(opcion=1)
	ifTrue:[
		self cancelarContrato: (contrato getId).	
	].
].

^rta
 







]

{ #category : #metodos }
Cliente >> realizarPagoCuota:unContrato cantCuotasApagar:cant [
|var|
var:= unContrato pagarCantCuotas: cant.
self changed .
^ var

]

{ #category : #printing }
Cliente >> toString [

	| var ninguno |
	ninguno := 'No posee nigun Contrato'.
	var := 'Contratos A Realizar: ' , String crlf.
	colContratosARealizar isEmpty
		ifTrue: [ var := var,ninguno, String crlf. ]
		ifFalse: [
			colContratosARealizar do: [ :cont |
				var := var , cont toString , String crlf ] ].
	var := var , 'Contratos Cancelados: ' , String crlf.
	colContratosCancelados isEmpty
		ifTrue: [ var := var,ninguno, String crlf. ]
		ifFalse: [
			colContratosCancelados do: [ :cont |
				var := var , cont toString , String crlf ] ].
	var := var , 'Contratos Realizados: ' , String crlf.
	colContratosEfectivizados isEmpty
		ifTrue: [ var := var,ninguno, String crlf. ]
		ifFalse: [
			colContratosEfectivizados do: [ :cont |
				var := var , cont toString , String crlf ] ].
	^ 'Dni: ' , dni asString , ', Apellido: ' , apellido , String crlf
	  , var
]

{ #category : #printing }
Cliente >> toStringContratos [
|var|
var:=''.
colContratosARealizar  do:[:cont | var:=var,cont toString ,String crlf].
^var
]

{ #category : #printing }
Cliente >> toStringContratosEfectivizado [
|var|
var:='Contratos Efectivizado:'.
colContratosEfectivizados  do:[:cont | var:=var,cont toString ,String crlf].
^var
]

{ #category : #'verificación' }
Cliente >> verificarCliente: unDni [
^ dni=unDni .
]

{ #category : #'verificación' }
Cliente >> verificarContratosAVencer [ 
| rta unContrato block|
rta:=false.
block:= [ :contrato | |aVencer|aVencer:=false. 
	(contrato verificarFechaViajeC)ifTrue:[aVencer :=contrato poseeCuotaAVencer ].].

unContrato:= colContratosARealizar detect:[:contrato |  block value:contrato. ]ifNone:[nil].

(unContrato)ifNotNil:[rta:=true].
^rta
]
