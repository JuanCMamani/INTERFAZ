Class {
	#name : #VistaAdmin,
	#superclass : #FullscreenMorph,
	#instVars : [
		'lateral',
		'modal',
		'modViaje',
		'modCliente',
		'cerrar',
		'sectionSeach'
	],
	#category : #'TPPOO-componentes'
}

{ #category : #accessing }
VistaAdmin >> altaViajeOrganizado [

	| container nombre preciXper porcentaje valorImp ciudad actividad fechaRegre fechaSalida crear  |
	container := Morph new.
	container extent: modal extent - (800 @ 540).
	modal color:( Color r:0.40 g:0.55 b:0.95).
	container color: (Color  r: 0.80 g:0.8 b:0.80 ) .
	container cornerStyle: #rounded.
	modal submorphs do: [ :each | each delete ].
	modal addMorph: container.
	container position: modal center - (container extent / 2 - (0 @ 30)).
	nombre := RubTextFieldMorph new.
	nombre ghostText: '   Nombre del viaje'.
	nombre color: Color white.
	nombre extent: container width - 80 @ 0.
	nombre cornerStyle: #rounded.
	preciXper := RubTextFieldMorph new.
	preciXper ghostText: '   Precio x persona'.
	preciXper color: Color white.
	preciXper extent: container width - 80 @ 0.
	preciXper cornerStyle: #rounded.
	porcentaje := RubTextFieldMorph new.
	porcentaje ghostText: '   Porcentaje Plus'.
	porcentaje color: Color white.
	porcentaje extent: container width - 80 @ 0.
	porcentaje cornerStyle: #rounded.
	valorImp := RubTextFieldMorph new.
	valorImp ghostText: '   Valor impuesto'.
	valorImp color: Color white.
	valorImp extent: container width - 80 @ 0.
	valorImp cornerStyle: #rounded.
	ciudad := RubTextFieldMorph new.
	ciudad ghostText: '   Nombre ciudad'.
	ciudad color: Color white.
	ciudad extent: container width - 80 @ 0.
	ciudad cornerStyle: #rounded.
	actividad := RubTextFieldMorph new.
	actividad ghostText: '   Actividades a realizar'.
	actividad color: Color white.
	actividad extent: container width - 80 @ 0.
	actividad cornerStyle: #rounded.
	fechaSalida := RubTextFieldMorph new.
	fechaSalida ghostText: '   Fecha de salida'.
	fechaSalida color: Color white.
	fechaSalida extent: container width - 80 @ 0.
	fechaSalida cornerStyle: #rounded.
	fechaRegre := RubTextFieldMorph new.
	fechaRegre ghostText: '   Fecha de regreso'.
	fechaRegre color: Color white.
	fechaRegre extent: container width - 80 @ 0.
	fechaRegre cornerStyle: #rounded.
	container addMorph: nombre.
	container addMorph: preciXper.
	container addMorph: porcentaje.
	container addMorph: valorImp.
	container addMorph: ciudad.
	container addMorph: actividad.
	container addMorph: fechaSalida.
	container addMorph: fechaRegre.
	nombre position: container position + (40 @ 40).
	preciXper position: nombre position + (0 @ 40).
	porcentaje position: preciXper position + (0 @ 40).
	valorImp position: porcentaje position + (0 @ 40).
	ciudad position: valorImp position + (0 @ 40).
	actividad position: ciudad position + (0 @ 40).
	fechaSalida position: actividad position + (0 @ 40).
	fechaRegre position: fechaSalida position + (0 @ 40).
	crear := Button new.
	crear label: 'CREAR'.
	crear extent: 200 @ 40.
	crear color: ( Color r:0.40 g:0.55 b:0.95).
	crear cornerStyle: #rounded.
	container addMorph: crear.
	crear position: container bottomLeft + (container width / 2 @ 0)
		- (crear width / 2 @ 50).
		crear  mouseAction: [ self crearAalert ].
]

{ #category : #accessing }
VistaAdmin >> cerrarVentanaAdmin [
self delete.
]

{ #category : #initialization }
VistaAdmin >> crearAalert [
|mensaje|
"Mensaje de alerta"
	mensaje := '¡Viaje Especial creado con exito!'.
	mensaje := UIManager inform: mensaje.
]

{ #category : #accessing }
VistaAdmin >> eliminarViaje: tupla [ 
tupla delete.
]

{ #category : #initialization }
VistaAdmin >> ingresaAdmin [

	lateral := Morph new.
	lateral extent: 300 @ self height.
	lateral color: Color white.
	lateral position: self position.
	modal := Morph new.
	modal color: ( Color r:0.40 g:0.55 b:0.95). 
	modal extent: self extent - (lateral width @ 0).
	modal position: lateral topRight.
	modViaje := Button new.
	modViaje label: 'MODIFICAR VIAJES'.
	modViaje color: ( Color r:0.40 g:0.55 b:0.95). 
	modViaje cornerStyle: #rounded.
	modCliente := Button new.
	modCliente label: 'MODIFICAR CLIENTES'.
	modCliente  color: ( Color r:0.40 g:0.55 b:0.95). 
	modCliente cornerStyle: #rounded.
	modViaje position: lateral leftCenter + (20 @ 40).
	modCliente position: lateral leftCenter - (-20 @ 40).
	modCliente extent: lateral width - 40 @ 50.
	modViaje extent: lateral width - 40 @ 50.
	lateral addMorph: modViaje.
	lateral addMorph: modCliente.
	cerrar := Button new.
	cerrar label: 'CERRAR'.
	cerrar extent: 100 @ 30.
	cerrar  color:( Color r:0.40 g:0.55 b:0.95). 
	cerrar position: modViaje bottomLeft + (0 @ 40).
	cerrar cornerStyle: #rounded.
	lateral addMorph: cerrar.
	self addMorph: lateral.
	self addMorph: modal.
	self openInWorld.
	modViaje mouseAction: [ self opcionesViaje ].
	cerrar mouseAction: [ self cerrarVentanaAdmin ]
]

{ #category : #accessing }
VistaAdmin >> opcionBaja [

sectionSeach := SectionSeach crear: (700@modal height) in: modal .
 
]

{ #category : #accessing }
VistaAdmin >> opcionesViaje [

	| alta  baja volver text centro container |
	container := Morph new.
	container color: Color white.
	container extent: lateral extent.
	container position: lateral position.
	modCliente visible: false.
	modViaje visible: false.
	cerrar visible: false.
	alta := Button new.
	alta label: 'ALTA VIAJE ESPECIAL'.
	alta color:( Color r:0.40 g:0.55 b:0.95). 
	alta cornerStyle: #rounded.
	baja := Button new.
	baja label: 'BAJA'.
	baja color: ( Color r:0.40 g:0.55 b:0.95). 
	baja cornerStyle: #rounded.
	centro := container center.
	text := TextMorph new.
	text contents: 'SELECCIONE UNA OPCION:'.
	text extent: text extent + (container width - text width @ 10).
	text centered.
	text color: Color black.
	alta extent: container width - 60 @ 40.
	baja extent: container width - 60 @ 40.
	alta position: container center - (alta extent / 2).
	baja position: alta center - (baja extent / 2) + (0 @ 45).
	text position: alta center - (text extent / 2) - (0 @ 45).
	container addMorph: alta.
	container addMorph: baja.
	container addMorph: text.
	volver := Button new.
	volver label: 'VOLVER'.
	volver extent: 100@30.
	volver color:( Color r:0.40 g:0.55 b:0.95). 
	volver cornerStyle: #rounded.
	volver position: baja bottomLeft + (0 @ 40).
	container addMorph: volver.
	lateral addMorph: container.
	alta mouseAction: [ self altaViajeOrganizado ].
	baja  mouseAction: [ self opcionBaja ].
	volver mouseAction: [ self volverLogin: container ]
]

{ #category : #accessing }
VistaAdmin >> restaurarOpciones [
modViaje   visible:true.
modCliente    visible:true.
cerrar   visible:true.
]

{ #category : #accessing }
VistaAdmin >> volverLogin: cont [
cont delete.
self restaurarOpciones .
]
