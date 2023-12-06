Class {
	#name : #SeachViajeLstCont,
	#superclass : #SeachViajeList,
	#instVars : [
		'cuenta'
	],
	#category : #'TPPOO-componentes'
}

{ #category : #initialization }
SeachViajeLstCont class >> crear: emp cuenta: cont [
|var|
var:= self new.
var iniciarSeachViaje:emp  cuenta: cont.
^var.
]

{ #category : #'accessing - token' }
SeachViajeLstCont >> contratar: nom fecha: fe cant: text cuotas: num plus: paga [

	| var mensaje exito plus posible condicion condicion2 |
	posible := false.
	condicion := fe ~= '' & (text ~= '') & (num ~= '') & (paga ~= '').
	condicion
		ifTrue: [ 
			condicion2 := text asInteger > 0 & (num asInteger > 0).
			condicion2
				ifTrue: [ 
					var := empresa obtenerViajePorNombre: nom.
					var ifNotNil: [ 
						paga = 'S'
							ifTrue: [ 
								plus := true.
								posible := true ]
							ifFalse: [ 
								paga = 'N'
									ifTrue: [ 
										plus := false.
										posible := true ]
									ifFalse: [ 
										mensaje := '¡Verifique los datos ingresados!'.
										mensaje := UIManager inform: mensaje ] ] ].
					posible ifTrue: [ 
						exito := cuenta
							         contratarPaquete: var
							         fechaViaje: (Date readFrom: fe asString readStream)
							         cantPersonas: text
							         cantCuotas: num
							         pagaPlus: plus.
						exito
							ifTrue: [ 
								contenInfo  delete.
								mensaje := '¡Contrato realizado con exito!'.
								mensaje := UIManager inform: mensaje ]
							ifFalse: [ 
								mensaje := '¡Disponibilidad insuficiente!'.
								mensaje := UIManager inform: mensaje ] ] ]
				ifFalse: [ 
					mensaje := '¡Ingrese datos Validos numeros>0!'.
					mensaje := UIManager inform: mensaje ] ]
		ifFalse: [ 
			mensaje := '¡Ingrese datos Validos!'.
			mensaje := UIManager inform: mensaje ]
]

{ #category : #'accessing - token' }
SeachViajeLstCont >> generarInfo: nombreViaje [

	| contratar cantPersonas fechaSalida cantCuotas plus |
	contenInfo isNotNil ifTrue: [ contenInfo delete ].
	contenInfo := self verInfo: nombreViaje.
	contenInfo extent: contenInfo extent +(0@80).
	contratar := Button new.
	contratar label: 'CONTRATAR'.
	contratar extent: 100 @ 30.
	contratar cornerStyle: #rounded.
	contenInfo extent: contenInfo extent + (0 @ 40).
	contenInfo addMorph: contratar.
	contratar bottomLeft: contenInfo bottomLeft - (-20 @ 10).


	cantPersonas := RubTextFieldMorph new.
	cantPersonas ghostText: 'Cantidad de personas'.
	cantPersonas extent: 250 @ 5.
	cantPersonas cornerStyle: #rounded.
	contenInfo addMorph: cantPersonas.
	cantPersonas bottomLeft: contratar topLeft - (0 @ 10).

	fechaSalida := RubTextFieldMorph new.
	fechaSalida ghostText: 'Fecha de Salida'.
	fechaSalida extent: 250 @ 5.
	fechaSalida cornerStyle: #rounded.
	contenInfo addMorph: fechaSalida.
	fechaSalida bottomLeft: cantPersonas topLeft - (0 @ 10).

	cantCuotas := RubTextFieldMorph new.
	cantCuotas ghostText: 'Cantidad de cuotas'.
	cantCuotas extent: 250 @ 5.
	cantCuotas cornerStyle: #rounded.
	contenInfo addMorph: cantCuotas.
	cantCuotas bottomLeft: fechaSalida topLeft - (0 @ 10).

	plus := RubTextFieldMorph new.
	plus ghostText: 'Paga Plus S=si N=no'.
	plus extent: 250 @ 5.
	plus cornerStyle: #rounded.
	contenInfo addMorph: plus.
	plus bottomLeft: cantCuotas topLeft - (0 @ 10).
	
	self addMorph: contenInfo.
	contenInfo position: conten topRight + (40 @ 0).
	contratar mouseAction: [ 
		self contratar: (nombreViaje  asString) fecha: (fechaSalida text asString)  cant: (cantPersonas  text asString) cuotas: (cantCuotas text asString) plus: (plus text asString) ]
]

{ #category : #'accessing - token' }
SeachViajeLstCont >> iniciarSeachViaje: emp cuenta: cont [

	super iniciarSeachViaje: emp.
	cuenta := cont
]
