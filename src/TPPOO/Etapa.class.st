Class {
	#name : #Etapa,
	#superclass : #Object,
	#instVars : [
		'infoDia',
		'cantDias',
		'lugar',
		'tipoPension',
		'hotel',
		'listaActividades'
	],
	#category : #'TPPOO-class'
}

{ #category : #constructor }
Etapa class >> crearCon:info cantDias:unaCantDias lugar: unLugar tipoPension: unTipoPension hotel: unHotel [ 
"constructor 2"
|unaEtapa|
unaEtapa := self new.
unaEtapa inicializarCon:info cantDias:unaCantDias lugar: unLugar tipoPension: unTipoPension hotel: unHotel  .
^unaEtapa
]

{ #category : #constructor }
Etapa class >> crearCon:info cantDias:unaCantDias lugar: unLugar tipoPension: unTipoPension hotel: unHotel listaActividades: unaListaActividades [ 
"contructor 1"
|unaEtapa |
unaEtapa := self new.
unaEtapa inicializarCon:info cantDias:unaCantDias lugar: unLugar tipoPension: unTipoPension hotel: unHotel actividades: unaListaActividades 
]

{ #category : #constructor }
Etapa class >> nextId [
| id |
    nro := nro ifNil: [1].
    id := nro.
    nro := nro  + 1.
    ^id
]

{ #category : #constructor }
Etapa class >> resetNro [
nro:=nil.
]

{ #category : #inicializador }
Etapa >> cargarActividad: unaActividad [
listaActividades add: unaActividad.
]

{ #category : #inicializador }
Etapa >> inicializarCon:info cantDias:unaCantDias lugar: unLugar tipoPension: unTipoPension hotel: unHotel [.
"se agrega un segundo contructor como posibilidad de inicializar"
infoDia :=info.
cantDias := unaCantDias .
lugar := unLugar .
tipoPension := unTipoPension .
hotel := unHotel .
listaActividades := OrderedCollection new .
]

{ #category : #inicializador }
Etapa >> inicializarCon:info cantDias:unaCantDias lugar: unLugar tipoPension: unTipoPension hotel: unHotel actividades: unaListaActividades [
infoDia :=info.
cantDias := unaCantDias .
lugar := unLugar .
tipoPension := unTipoPension .
hotel := unHotel .
listaActividades := unaListaActividades.
]

{ #category : #printing }
Etapa >> toString [
^ 'InfoDia:',infoDia asString ,'|'
]

{ #category : #'verificación' }
Etapa >> verificarInfoDia: unaInfoDia [
^infoDia = unaInfoDia

]
