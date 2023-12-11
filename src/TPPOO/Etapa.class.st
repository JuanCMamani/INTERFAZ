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

{ #category : #initialization }
Etapa class >> crearCon:info cantDias:unaCantDias lugar: unLugar tipoPension: unTipoPension hotel: unHotel listaActividades: unaListaActividades [ 
"contructor 1"
|unaEtapa |
unaEtapa := self new.
unaEtapa inicializarCon:info cantDias:unaCantDias lugar: unLugar tipoPension: unTipoPension hotel: unHotel actividades: unaListaActividades .
^ unaEtapa .
]

{ #category : #initialization }
Etapa >> cargarActividad: unaActividad [
listaActividades add: unaActividad.

]

{ #category : #printing }
Etapa >> getInfo [ 
| x |
x:= Array new:6.
x at: 1 put: infoDia .
x at: 2 put: cantDias  .
x at: 3 put: lugar  .
x at: 4 put: tipoPension  .
x at: 5 put: hotel  .
x at: 6 put: listaActividades  .
^ x.


]

{ #category : #initialization }
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

{ #category : #initialization }
Etapa >> verificarInfoDia: unaInfoDia [
^infoDia = unaInfoDia

]
