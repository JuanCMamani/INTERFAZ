Class {
	#name : #Especial,
	#superclass : #Viaje,
	#instVars : [
		'ciudad',
		'actividad',
		'fechaRegreso'
	],
	#category : #'TPPOO-class'
}

{ #category : #constructor }
Especial class >> crearCon: unNombre  precioBase: unPrecioBase valorImpuesto: unValorImpuesto valorDelPlus: unvalor fechasDisponibles: unaCol ciudad: unaCiudad actividad: unaActividad fechaRegreso: unaFechaRegreso [ 
	| unEspecial |
	unEspecial := self
		              crearCon: unNombre  precioBase: unPrecioBase valorImpuesto: unValorImpuesto valorDelPlus: unvalor fechasDisponibles: unaCol.
	unEspecial
		inicializarCon: unaCiudad
		actividad: unaActividad
		fechaRegreso: unaFechaRegreso.
	^ unEspecial
]

{ #category : #metodos }
Especial >> actualizarDisponibilidad:unNumero [
fechasDisponibles  agregarCupos:unNumero.
]

{ #category : #visualizadores }
Especial >> getFechaSalida [
^ (fechasDisponibles first) getFecha   .
]

{ #category : #visualizadores }
Especial >> getFechaSalidaYcupo [
^ fechasDisponibles  .
]

{ #category : #'verificación' }
Especial >> getInfo [ 
|var     x  |
var:= super getInfo.
	x := Array new: 3.
	x
		at: 1 put: ciudad;
		at: 2 put: actividad;
		at: 3 put: fechaRegreso.
	^(var,x).
]

{ #category : #printing }
Especial >> inicializarCon: unaCiudad actividad: unaActividad fechaRegreso: unaFechaRegreso [

	ciudad := unaCiudad.
	actividad := unaActividad.
	fechaRegreso := unaFechaRegreso
]

{ #category : #printing }
Especial >> mostrarFechas [ 
^fechasDisponibles toString.
]

{ #category : #visualizadores }
Especial >> obtenerFecha [
^fechasDisponibles  getFecha 
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
					
				ifTrue:[fechasDisponibles verificarFecha:  unIngreso.
					viajeModificado := self.]
				ifFalse:[(unaOpcion=7)
						
					ifTrue:[fechasDisponibles  setCupo: unIngreso]
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
fechasDisponibles  setFecha: unFecha.
]

{ #category : #printing }
Especial >> toString [ 
^ (super toString  )asString,',ciudad: ',ciudad asString ,',Fecha Regreso:',fechaRegreso asString,' Fecha Salida:',(fechasDisponibles first ) toString.
]

{ #category : #'verificación' }
Especial >> verificarViaje [
^false.
]
