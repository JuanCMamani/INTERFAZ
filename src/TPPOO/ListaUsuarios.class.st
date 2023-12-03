Class {
	#name : #ListaUsuarios,
	#superclass : #Morph,
	#instVars : [
		'lista'
	],
	#category : #'TPPOO-componentes'
}

{ #category : #initialization }
ListaUsuarios >> inicializar:padre [
|seleccione u1 u2 u3 u4 origen cuadrado |
self color: Color white .
self extent: padre extent -(50@100) .
self position: padre center- (self extent /2).
origen := self innerBounds origin.
seleccione := StringMorph   new.
seleccione contents:'SELECCIONE UN USUARIO:'.
cuadrado := Morph new.
cuadrado color:Color green .
cuadrado extent:(self width@ seleccione height )+(0@10).
cuadrado addMorph: seleccione .
cuadrado position:origen.
seleccione position: (cuadrado  center) - (seleccione extent/2) . 
self addMorph: cuadrado  .
lista:=Morph new.
lista color:( Color r: 0.2 g:0.2  b:0.5 ) .
lista position:origen+(0@ cuadrado height).
lista extent: (self width@(self height -cuadrado height )).
self addMorph:lista.
u1:= Button new.
u1 label:'Nombre:Jose Tipo:ViajeroFrecuente contratos:3'.
u2:= Button new.
u2 label:'Nombre:Jose Tipo:ViajeroComun contratos:1'.
u3:= Button new.
u3 label:'Nombre:Jose Tipo:ViajeroFrecuente contratos:2'.
u4:= Button new.
u4 label:'Nombre:Jose Tipo:ViajeroComun contratos:0'.
u1 extent: (self width@40).
u2  extent: (self width@40).
u3 extent: (self width@40).
u4 extent: (self width@40).
u1 position: lista position .
u2 position: u1 position+(0@u1 height) .
u3 position: u2 position +(0@u2 height).
u4 position: u3 position +(0@u3 height).
lista addMorph:u1.
lista addMorph:u2.
lista addMorph:u3.
lista addMorph:u4.



]
