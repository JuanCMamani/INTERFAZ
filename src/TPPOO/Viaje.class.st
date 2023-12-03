Class {
	#name : #Viaje,
	#superclass : #Object,
	#instVars : [
		'nombre',
		'precioBase',
		'valorImpuesto',
		'valorDelPlus'
	],
	#category : #'TPPOO-class'
}

{ #category : #constructor }
Viaje class >> crearCon: unNombre  precioBase: unPrecioBase valorImpuesto: unValorImpuesto valorDelPlus: unvalor [
|unViaje|
unViaje := self new.

unViaje inicializarCon: unNombre  precioBase: unPrecioBase valorImpuesto:unValorImpuesto valorDelPlus: unvalor.
^unViaje
]

{ #category : #metodos }
Viaje >> disponibleEntre: fecha1 y: fecha2 [
^self subclassResponsibility  
]

{ #category : #comparing }
Viaje >> equals: viaje [

^ self = viaje
]

{ #category : #printing }
Viaje >> getInfo [

	| nom pre imp plus x |
	nom := nombre asString.
	pre := precioBase asString.
	imp := valorImpuesto asString.
	plus := valorDelPlus asString.
	x := Array new: 4.
	x
		at: 1 put: nom;
		at: 2 put: pre;
		at: 3 put: imp;
		at: 4 put: plus.
	^x
]

{ #category : #visualizadores }
Viaje >> getNombre [
^ nombre .
]

{ #category : #'verificación' }
Viaje >> getValorDelPlus [
^ valorDelPlus  .
]

{ #category : #inicializador }
Viaje >> inicializarCon: unNombre precioBase: unPrecioBase valorImpuesto: unValorImpuesto valorDelPlus: unValor [
"Cambio en el metodo inicializar vamos a tener que actualizarlo en todas partes 
ahora le ingresamos unValor que sirve para el calculo del valorPlus"
nombre := unNombre.
precioBase := unPrecioBase.
valorImpuesto := unValorImpuesto.
valorDelPlus  := unValor.
]

{ #category : #printing }
Viaje >> mostrarFechas [
^self subclassResponsibility 
]

{ #category : #visualizadores }
Viaje >> obtenerPrecioTotal: unCantPersona [

^((((precioBase +valorImpuesto ))asInteger )*unCantPersona  ) 
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

{ #category : #'verificación' }
Viaje >> verificarCupo:  unaFecha cantPersonas: unaCantPersonas [
^self subclassResponsibility 
]

{ #category : #'verificación' }
Viaje >> verificarNombre: unNombre [
^nombre=unNombre 
]

{ #category : #'verificación' }
Viaje >> verificarViaje [
^self subclassResponsibility .
]
