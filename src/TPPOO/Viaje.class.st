Class {
	#name : #Viaje,
	#superclass : #Object,
	#instVars : [
		'nombre',
		'precioBase',
		'valorImpuesto',
		'valorDelPlus',
		'fechasDisponibles'
	],
	#category : #'TPPOO-class'
}

{ #category : #constructor }
Viaje class >> crearCon: unNombre  precioBase: unPrecioBase valorImpuesto: unValorImpuesto valorDelPlus: unvalor fechasDisponibles: unaCol [
|unViaje|
unViaje := self new.

unViaje inicializarCon: unNombre  precioBase: unPrecioBase valorImpuesto:unValorImpuesto valorDelPlus: unvalor fechasDisponibles: unaCol.
^unViaje
]

{ #category : #metodos }
Viaje >> disponibleEntre:  fecha1 y: fecha2 [
|rta unaFecha|
rta := false.
"(fecha,boolean,cupo)"
unaFecha := fechasDisponibles  detect:[:fech | (fech verificarDisponibleEntre: fecha1  y: fecha2)]ifNone:[nil].
(unaFecha isNotNil )ifTrue: [ rta:=true.].
^rta
]

{ #category : #comparing }
Viaje >> equals: viaje [

^ self = viaje
]

{ #category : #printing }
Viaje >> getInfo [

	| nom pre imp plus  x arrayCupos  |
	nom := nombre asString.
	pre := precioBase asString.
	imp := valorImpuesto asString.
	plus := valorDelPlus asString.
	arrayCupos := OrderedCollection   new.
	"(fechasDisponibles size >1)ifTrue: [ 
		fir := fechasDisponibles first .
			fir do: [:va |
		 arrayCupos add: va getInfo    .].
		 ]ifFalse: [
		fechasDisponibles do: [:va |
		 arrayCupos add: va getInfo ]
		]. "
	fechasDisponibles do: [:va |
		 arrayCupos add: va getInfo ].
	x := Array new: 5.
	x
		at: 1 put: nom;
		at: 2 put: pre;
		at: 3 put: imp;
		at: 4 put: plus;
		at:5 put: arrayCupos .
	^x
]

{ #category : #visualizadores }
Viaje >> getNombre [
^ nombre .
]

{ #category : #modificadores }
Viaje >> getPlus [
^ valorDelPlus .
]

{ #category : #'verificación' }
Viaje >> getValorDelPlus [
^ valorDelPlus  .
]

{ #category : #inicializador }
Viaje >> inicializarCon: unNombre  precioBase: unPrecioBase valorImpuesto:unValorImpuesto valorDelPlus: unValor fechasDisponibles: unaCol [ 
"Cambio en el metodo inicializar vamos a tener que actualizarlo en todas partes 
ahora le ingresamos unValor que sirve para el calculo del valorPlus"
nombre := unNombre.
precioBase := unPrecioBase.
valorImpuesto := unValorImpuesto.
valorDelPlus  := unValor.
fechasDisponibles := (unaCol   )asSortedCollection:[ : a  : c  |  a  menor: c ] .
]

{ #category : #printing }
Viaje >> mostrarFechas [
^self subclassResponsibility 
]

{ #category : #visualizadores }
Viaje >> obtenerPrecioTotal: unCantPersona [

^((((precioBase +valorImpuesto ))asInteger )*unCantPersona asInteger  ) 
]

{ #category : #visualizadores }
Viaje >> obtenerPrecioTotalConPlus: unCantPersona [

^(((((precioBase +valorImpuesto ))asInteger )*unCantPersona  )+valorDelPlus )
]

{ #category : #metodos }
Viaje >> opcionesModificar: unaOpcion ingreso: unIngreso [ 
|exito|
exito := true.
(unaOpcion=1)
ifTrue:[precioBase := unIngreso]
ifFalse:[(unaOpcion=2)
	ifTrue:[valorImpuesto := unIngreso ]
	ifFalse:[exito := false]].
^exito 
]

{ #category : #modificadores }
Viaje >> setNombre: unNombre [
nombre := unNombre.
]

{ #category : #modificadores }
Viaje >> setPrecioBase: unPrecio [
precioBase := unPrecio .
]

{ #category : #modificadores }
Viaje >> setValorImpuesto: unValorImpuesto [
valorImpuesto := unValorImpuesto.
]

{ #category : #printing }
Viaje >> toString [ 
^ 'Nombre: ',nombre asString,',Precio Persona:',precioBase asString,',precio Impuesto:',valorImpuesto asString,'valorDelPlus:',valorDelPlus asString .
]

{ #category : #modificadores }
Viaje >> toStringFechas [
|var|

var:= fechasDisponibles first .

var do: [ :va | Transcript show: va toString;cr. ].
]

{ #category : #'verificación' }
Viaje >> verificarCupo: unaFecha cantPersonas: unaCantPersonas [

	"Verificar si esta disponible y si lo esta se modifica el cupo del viaje en la fecha"

	| unaFe rta |
	rta := false.
	unaFe:= nil.
	unaFe := fechasDisponibles
		         detect: [ :fec | 
			         (fec verificarFecha: unaFecha)  ].
	unaFe ifNotNil: [ 
		rta := unaFe verificarCupo: unaCantPersonas.
		rta ifTrue: [ 
			self changed.

			Transcript
				show: ' SE DESCONTO CON EXITO', unaFe toString;
				cr ] ].
	^ rta
]

{ #category : #'verificación' }
Viaje >> verificarNombre: unNombre [
^nombre=unNombre 
]

{ #category : #'verificación' }
Viaje >> verificarViaje [
^self subclassResponsibility .
]
