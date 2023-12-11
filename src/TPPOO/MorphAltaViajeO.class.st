Class {
	#name : #MorphAltaViajeO,
	#superclass : #MorphAltaViaje,
	#instVars : [
		'wid',
		'colParadas',
		'listaFechasSalida',
		'cantDias',
		'colExcursiones'
	],
	#category : #'TPPOO-componentes'
}

{ #category : #initialization }
MorphAltaViajeO class >> crearMorphAltaViaje [
|var|
var:= self new.
var iniciarMorphAltaViaje .
^var.
]

{ #category : #initialize }
MorphAltaViajeO >> crearViaje [

	| condicion mensaje |
	condicion := self verificaCondicion.
	condicion
		ifTrue: [ 
			| var cupo |
			cupo:= fechasDisponibles getColCupos.

			var := Organizado
				       crearCon: nombre text asString
				       precioBase: preciXper text asString
				       valorImpuesto: valorImp text asString
				       valorDelPlus: porcentaje text asString
				       fechasDisponibles: cupo
				       colParadas: colParadas getColParadas 
				       cantDias: cantDias text asString
				       excursiones: colExcursiones getColExcursiones .
			empresa cargarViaje: var.
			mensaje := '¡Viaje creado con exito!'.
			mensaje := UIManager inform: mensaje ]
		ifFalse: [ 
			mensaje := '¡Datos ingresados incorrectos!'.
			mensaje := UIManager inform: mensaje ]
]

{ #category : #initialize }
MorphAltaViajeO >> imputFecha: val [
 fechasDisponibles := MorphFechaImputList  crearFechaImputList: val.
	self addMorph: fechasDisponibles .
	fechasDisponibles position: valorImp  position + (0 @ 40).
]

{ #category : #initialization }
MorphAltaViajeO >> iniciarMorphAltaViaje: emp [
	super iniciarMorphAltaViaje: emp.
	self extent: self extent + (0 @ 700).
	wid := (self width - 80@0).
	cantDias := RubTextFieldMorph new.
	cantDias ghostText: '   Cantidad de Dias'.
	cantDias extent: wid.
	cantDias cornerStyle: #rounded.
	colParadas:=  MorphParadaListInput crearParadaListInput: wid .
	colExcursiones := MorphExcursioneList crearExcursionesList: wid.
	self addMorph: cantDias.
	self addMorph: colParadas.
	self addMorph: colExcursiones.
	cantDias position: fechasDisponibles bottomLeft  + (0 @ 15).
	colParadas position: cantDias position + (0 @ 40).
	colExcursiones position: colParadas bottomLeft  + (0 @ 15).
	self addMorph: crear.
	crear bottomLeft: self bottomCenter - (crear width // 2 @ 10).
	crear mouseAction: [ self crearViaje ]
]

{ #category : #initialize }
MorphAltaViajeO >> verificaCondicion [ 
|var|
var:= super verificaCondicion .
^ var& (cantDias ~='')&(colParadas ~='')&(colExcursiones ~='').
]
