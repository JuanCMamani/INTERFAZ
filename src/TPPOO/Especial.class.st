Class {
	#name : #Especial,
	#superclass : #Viaje,
	#instVars : [
		'ciudad',
		'actividad',
		'fechaRegreso',
		'fechaSalida'
	],
	#category : #'TPPOO-class'
}

{ #category : #constructor }
Especial class >> crearCon: unNombre precioBase: unPrecioBase valorImpuesto: unValorImpuesto ciudad: unaCiudad actividad: unaActividad fechaRegreso: unaFechaRegreso fechaSalidaCupo: unaFechaYcupo valorDelPlus: unvalor [
	| unEspecial |
	unEspecial := self
		              crearCon: unNombre
		              precioBase: unPrecioBase
		              valorImpuesto: unValorImpuesto
						  valorDelPlus: unvalor.
	unEspecial
		inicializarCon: unaCiudad
		actividad: unaActividad
		fechaRegreso: unaFechaRegreso
		fechaSalidaCupo: unaFechaYcupo.
	^ unEspecial
]

{ #category : #metodos }
Especial >> actualizarDisponibilidad:unNumero [
fechaSalida agregarCupos:unNumero.
]

{ #category : #metodos }
Especial >> disponibleEntre: fecha1 y: fecha2 [
|rta|
rta:= false.
(fechaSalida verificarDisponibleEntre: fecha1  y: fecha2  )
ifTrue: [  rta := true].
^rta
]

{ #category : #visualizadores }
Especial >> getFechaSalida [
^ fechaSalida getFecha  .
]

{ #category : #visualizadores }
Especial >> getFechaSalidaYcupo [
^ fechaSalida .
]

{ #category : #'verificación' }
Especial >> getInfo [ 
|var ciud act feS feR x |
var:= super getInfo.
	ciud := ciudad  asString.
	act := actividad  asString.
	feS := fechaSalida  asString.
	feR := fechaRegreso  asString.
	x := Array new: 4.
	x
		at: 1 put: ciud;
		at: 2 put: act;
		at: 3 put: feS;
		at: 4 put: feR.
		
	^(var,x).
]

{ #category : #printing }
Especial >> inicializarCon: unaCiudad actividad: unaActividad fechaRegreso: unaFechaRegreso fechaSalidaCupo: unaFechaYcupo [
ciudad := unaCiudad.
actividad := unaActividad.
fechaRegreso := unaFechaRegreso .
fechaSalida := unaFechaYcupo .
]

{ #category : #printing }
Especial >> inicializarCon: unaCiudad actividad: unaActividad fechaRegreso: unaFechaRegreso fechaSalidayCupo: unaFechaYcupo [
ciudad := unaCiudad.
actividad := unaActividad.
fechaRegreso := unaFechaRegreso .
fechaSalida := unaFechaYcupo .
]

{ #category : #printing }
Especial >> mostrarFechas [ 
^fechaSalida toString.
]

{ #category : #visualizadores }
Especial >> obtenerFecha [
^fechaSalida 
]

{ #category : #metodos }
Especial >> opcionesModificar: unaOpcion ingreso: unIngreso [ 
|exito viajeModificado|
exito := true.
"Aca nose si las 3 opciones de nombre precio y valor pueden ir en viaje pero nose como seria mejor porque se repiten el Viaje Organizado y Especial"
(unaOpcion = 1 or: unaOpcion = 2)
ifTrue:[super opcionesModificar: unaOpcion ingreso: unIngreso ]
ifFalse:[(unaOpcion=3)
	
	ifTrue:[ciudad := unIngreso]
	ifFalse:[(unaOpcion=4)
			
		ifTrue:[actividad := unIngreso]
		ifFalse:[(unaOpcion=5)
				
			ifTrue:[fechaRegreso setFechaSalida:unIngreso]
			ifFalse:[(unaOpcion=6)
					
				ifTrue:[fechaSalida  := unIngreso.
					viajeModificado := self.]
				ifFalse:[(unaOpcion=7)
						
					ifTrue:[fechaSalida setCupo: unIngreso]
					ifFalse:[exito:=false]]]]]].

^viajeModificado

]

{ #category : #modificadores }
Especial >> setActivida: unaActividad [
actividad := unaActividad.
]

{ #category : #modificadores }
Especial >> setCiudad: unaCiudad [
ciudad := unaCiudad.
]

{ #category : #modificadores }
Especial >> setFechaRegreso: unFecha [
fechaRegreso := unFecha.
]

{ #category : #modificadores }
Especial >> setFechaSalida: unFecha [
fechaSalida setFecha: unFecha.
]

{ #category : #printing }
Especial >> toString [ 
^ (super toString  )asString,',ciudad: ',ciudad asString ,',Fecha Regreso:',fechaRegreso asString,fechaSalida toString .
]

{ #category : #'verificación' }
Especial >> verificarCupo: unaFecha cantPersonas: unaCantPersonas [
|exito|
exito := false.
(fechaSalida cupoPosible: unaCantPersonas )
ifTrue:[exito := true.fechaSalida descontarCupos: unaCantPersonas ].
^exito
]

{ #category : #'verificación' }
Especial >> verificarViaje [
^false.
]
