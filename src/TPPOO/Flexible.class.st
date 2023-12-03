Class {
	#name : #Flexible,
	#superclass : #Contrato,
	#instVars : [
		'valorPlus'
	],
	#category : #'TPPOO-class'
}

{ #category : #constructor }
Flexible class >> crearCon:viaje cantPersonas: unCantPersonas  fechaViaje: unaFechaViaje cantCuotas: unCant [ 
	| unContrato  valor|
	unContrato := self new.
	unContrato inicializarCon:viaje  cantPersonas: unCantPersonas fechaViaje:unaFechaViaje  cantCuotas: unCant. 
	valor:= viaje getValorDelPlus.
	unContrato iniciarColcuotas: unCant  plus:valor . 
	unContrato setPlus:valor.
	^ unContrato
]

{ #category : #metodos }
Flexible >> montoReembolso [
|valor fechaHoy|
fechaHoy := Date today .
((fechaHoy addMonths:3)<=fechaViaje  )
ifTrue: [valor := (75*precioTotal)/100.]
ifFalse: [ ((fechaHoy addMonths:2)<=fechaViaje )
			ifTrue:[valor :=(50*precioTotal )/100.]
			ifFalse: [  valor :=(25*precioTotal )/100].
	].
^valor .
]

{ #category : #'verificación' }
Flexible >> setPlus: unvalor [
valorPlus := unvalor .


]

{ #category : #printing }
Flexible >> toString [ 
^ 'ValorPlus:',valorPlus asString ,', ',(super toString ) .
]

{ #category : #'verificación' }
Flexible >> verificarContrato [  
 ^ true.


]
