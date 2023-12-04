Class {
	#name : #ViajeroFrecuente,
	#superclass : #Cliente,
	#instVars : [
		'sumaMillas'
	],
	#classVars : [
		'cambioValorMilla'
	],
	#category : #'TPPOO-class'
}

{ #category : #constructor }
ViajeroFrecuente class >> crearCon: unDni apellido: unApellido correo: unCorreo telefono: unTelefono ciudad: unaCiudad cantMillas: unaCantMillas [
|vFrecuente |

vFrecuente := self crearCon: unDni apellido: unApellido correo: unCorreo telefono: unTelefono ciudad: unaCiudad.
vFrecuente inicializarCon: unaCantMillas.
^vFrecuente 
]

{ #category : #metodos }
ViajeroFrecuente class >> inicializarCambioMillas: unValor [
cambioValorMilla := 10000.
]

{ #category : #metodos }
ViajeroFrecuente class >> obtenerCambioValorMilla [
^cambioValorMilla 
]

{ #category : #metodos }
ViajeroFrecuente >> getInfo [ 
|var|
var:= super getInfo.
var at: sumaMillas asString.
^ var.

]

{ #category : #inicializador }
ViajeroFrecuente >> inicializarCon: cantMillas [
sumaMillas :=cantMillas.
]

{ #category : #visualizadores }
ViajeroFrecuente >> obtenerReembolso: elContrato [
sumaMillas := sumaMillas + ((elContrato montoReembolso asInteger )  //(ViajeroFrecuente  obtenerCambioValorMilla )). 
]

{ #category : #metodos }
ViajeroFrecuente >> precioDescuento: precioTotal [
|unvalor|
unvalor := (precioTotal*10)/100.
sumaMillas :=sumaMillas -(unvalor/100).
^ (precioTotal-unvalor ).

]

{ #category : #printing }
ViajeroFrecuente >> toString [ 
^'Millas:',sumaMillas asString ,' ,', (super toString ).
]
