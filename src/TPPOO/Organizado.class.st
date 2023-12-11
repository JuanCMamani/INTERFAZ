Class {
	#name : #Organizado,
	#superclass : #Viaje,
	#instVars : [
		'colParadas',
		'cantDias',
		'colExcursiones'
	],
	#category : #'TPPOO-class'
}

{ #category : #constructor }
Organizado class >> crearCon: unNombre  precioBase: unPrecioBase valorImpuesto: unValorImpuesto valorDelPlus: unvalor fechasDisponibles: unaCol colParadas: unaColParadas cantDias: unaCantDias  excursiones: unaColExcursiones [
"Usar este metodo que tiene el atributo porcentaje"
|unOrganizado|
unOrganizado := self crearCon: unNombre  precioBase: unPrecioBase valorImpuesto: unValorImpuesto valorDelPlus: unvalor fechasDisponibles: unaCol .
unOrganizado inicializarCon: unaCantDias colParadas:unaColParadas excursiones: unaColExcursiones.
^unOrganizado
]

{ #category : #modificadores }
Organizado >> actualizarDisponibilidad: unCant fechaSalida: unaFecha [
|fechaCupo|
fechaCupo := fechasDisponibles   detect:[:fech | fech equals: unaFecha ].
fechaCupo ifNotNil: [  fechaCupo agregarCupos: unCant ]. 
]

{ #category : #inicializador }
Organizado >> cargarFechaSalida: unaFechaSalida [
fechasDisponibles  add: unaFechaSalida.
]

{ #category : #inicializador }
Organizado >> cargarParada: unaParada [
colParadas add: unaParada .
]

{ #category : #visualizadores }
Organizado >> getColExcursionInfo [

	|    colEx |
	colEx := OrderedCollection new.
	colExcursiones do: [ :va | colEx  add: va getInfo ].
	
	^  colEx 
]

{ #category : #visualizadores }
Organizado >> getInfo [

	| var colPa cantD  colEx x |
	var := super getInfo.
	colPa := OrderedCollection new.
	colEx := OrderedCollection new.
	colParadas do: [ :va | colPa add: va getInfo ].
	cantD := cantDias asString.
	colExcursiones do: [ :va | colEx  add: va getInfo ].
	x := Array new: 3.
	x
		at: 1 put: colPa;
		at: 2 put: cantD;
		at: 3 put: colEx.

	^ var , x
]

{ #category : #inicializador }
Organizado >> inicializarCon: unaCantDias [
colParadas := OrderedCollection new.
fechasDisponibles  :=OrderedCollection new .
cantDias := unaCantDias .
colExcursiones := OrderedCollection new.
]

{ #category : #inicializador }
Organizado >> inicializarCon: unaCantDias colParadas:unaColParada excursiones:  unaColExcursiones [
|var|
var:=unaColExcursiones.
(unaColExcursiones isNil)ifTrue: [ var:= OrderedCollection new. ] .
cantDias := unaCantDias .
colParadas:= unaColParada .
colExcursiones := var.
]

{ #category : #visualizadores }
Organizado >> mostrarFechas [ 
|unasFechas|
unasFechas := ''.
(self)
ifNotNil:[
fechasDisponibles  do:[:fec| unasFechas:=unasFechas,fec toString,String crlf . 
]]
ifNil:[''].
^unasFechas

]

{ #category : #metodos }
Organizado >> nuevaExcursion:excursion [
colExcursiones add: excursion .
]

{ #category : #visualizadores }
Organizado >> obtenerColExcursiones [
^colExcursiones 
]

{ #category : #visualizadores }
Organizado >> obtenerColParadas [
^colParadas 
]

{ #category : #visualizadores }
Organizado >> obtenerExcursion: unId [
|ex|
ex := colExcursiones  detect:[:excur | excur equals: unId]ifNone:[nil].
^ex
]

{ #category : #metodos }
Organizado >> opcionesModificar: unaOpcion ingreso: unIngreso [ 
|exito etapa|
exito := true.

"Aca nose si las 3 opciones de nombre precio y valor pueden ir en viaje pero nose como seria mejor porque se repiten el Viaje Organizado y Especial"
(unaOpcion = 1 or: unaOpcion = 2)

ifTrue:[super opcionesModificar: unaOpcion ingreso: unIngreso  ]
ifFalse:[(unaOpcion = 3)
	
	ifTrue:[cantDias := unIngreso]
	ifFalse: [(unaOpcion = 4)
		
		ifTrue:[colParadas add: unIngreso]
		ifFalse:[(unaOpcion = 5)
			
			ifTrue:[
				etapa:=colParadas detect:
				[:parada | parada verificarInfoDia: unIngreso]ifNone:[nil].
				(etapa)ifNotNil:[colParadas remove: etapa]]
			ifFalse:[(unaOpcion = 6)
				ifTrue:[colExcursiones add: unIngreso ]
				ifFalse:[(unaOpcion = 7)
					ifTrue:["eliminar excursion agregar un id a excursion"]
					ifFalse:[exito := false]]]
			]]].

^exito
]

{ #category : #visualizadores }
Organizado >> poseeExcursiones [
^ colExcursiones isEmpty .
]

{ #category : #modificadores }
Organizado >> setCantDias: unaCantDias [
cantDias := unaCantDias.
]

{ #category : #printing }
Organizado >> toString [  
|var |"no se agregan las etapas para no sobre cargar el trasncript con inforamcion descritiva"
(colExcursiones isEmpty )ifTrue: [ var:=false ] ifFalse:[var:=true.]. 
^(super toString ),', cantDias:',cantDias asString ,', excursiones: ',var asString,String crlf ,'Fechas de Salida:',String crlf ,self mostrarFechas  .
]

{ #category : #printing }
Organizado >> toStringExcursiones [ 
|cadena|
cadena:= 'Excusiones de viaje:',String crlf .
colExcursiones do:[:ex | cadena:= cadena,' ',ex toString ,String crlf  ].
^cadena
]

{ #category : #inicializador }
Organizado >> verificarFecha: unaFecha cantPersonas: unaCantPersonas fechaVieja: fechaVieja [
|fechaNu  fechaVi rta|
rta :=false.
""
fechaVi := fechasDisponibles  detect:[: fecha | fecha equals: fechaVieja]ifNone:[nil].
fechaNu := fechasDisponibles  detect:[: fecha | fecha equals: unaFecha]ifNone:[nil].

(fechaVi isNotNil  & fechaNu isNotNil)ifTrue:[
	(fechaNu verificarCupo: unaCantPersonas )ifTrue:[
		fechaNu agregarCupos: unaCantPersonas .
		self actualizarDisponibilidad: unaCantPersonas fechaSalida:unaFecha .
		rta:=true.
		].
	].

^rta
]

{ #category : #visualizadores }
Organizado >> verificarViaje [
^true.
]
