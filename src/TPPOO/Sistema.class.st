Class {
	#name : #Sistema,
	#superclass : #Object,
	#instVars : [
		'empresaTurismo',
		'usuarios'
	],
	#category : #'TPPOO-class'
}

{ #category : #initialization }
Sistema class >> crear [
|var|
var:= self new.
var inicializarSistema.
^ var.


]

{ #category : #initialization }
Sistema class >> crearConDatos [
|var|
var:= self new.
var inicializarSistemaConDatos .
^ var.


]

{ #category : #initialization }
Sistema >> addUsuario: usuario [ 
usuarios add: usuario .
]

{ #category : #initialization }
Sistema >> getEmpresa [
^empresaTurismo .


]

{ #category : #initialization }
Sistema >> inicializarSistema [
empresaTurismo  := EmpresaTurismo crearCon  .
usuarios  := OrderedCollection new.


]

{ #category : #initialization }
Sistema >> inicializarSistemaConDatos [
|vE1 vE2 vE3 vO1 vO2  c1 c2 c3 c4 c5 c6 c7  colP colF user1 user2 user3 |
"ct cuota; colC coleccion cuotas ; v viaje etp ; colP coleccion paradas ; c cliente"
empresaTurismo:= EmpresaTurismo crearCon .
usuarios := OrderedCollection new.
Contrato resetNro .
Cuota resetNro .
Excursion resetNro .
Transcript clear .
Transcript show: '------------------------------------Carga Inicial Del Sistema------------------------------------';cr.
"creacion de viajes"
"creacion de viajes Especiales"
vE1 := (Especial crearCon: 'lollapaloza 2024'  precioBase: 20000 valorImpuesto: 3000 valorDelPlus: 5000   fechasDisponibles:   (SortedCollection with: (FechaSalida crearCon: (Date year: 2024 month:3 day:13) cupo:15 ) )ciudad: 'Buenos Aires'  actividad: 'lollapaloza' fechaRegreso:    (Date year: 2024 month:3 day:17) ).
vE2:= Especial crearCon: 'Tomorrowland 2024'  precioBase: 100000 valorImpuesto: 4000 valorDelPlus: 1000   fechasDisponibles:   (SortedCollection with: (FechaSalida crearCon:(Date year: 2024 month:3 day:18) cupo:20 ) )ciudad: 'Boom'  actividad:  'Tomorrowland' fechaRegreso:   (Date year: 2024 month:3 day:29).
vE3:=Especial crearCon:'UMT 2024' precioBase: 130000  valorImpuesto: 60000  valorDelPlus: 70000 fechasDisponibles:   (SortedCollection with: (FechaSalida crearCon:(Date year: 2024 month:3 day:19)  cupo:30)) ciudad: 'Miami' actividad: 'Ultra Music Festival' fechaRegreso: (Date year: 2024 month:3 day:24)  .
empresaTurismo cargarViaje:vE1.
empresaTurismo cargarViaje:vE2.
empresaTurismo cargarViaje:vE3.

"Viaje Organizado"
"creacion de col paradas"
"crearCon:info cantDias:unaCantDias lugar: unLugar tipoPension: unTipoPension hotel: unHotel listaActividades: unaListaActividades excursioneOpcionales: unaColExc"
colP :=OrderedCollection  new.colP add:(Etapa crearCon:'dia 2 llegada 8:00'cantDias:1 lugar:'Roma'  tipoPension: 'pension Completa' hotel: 'Villa del Mare' listaActividades: 'traslado al hotel y cena bienvenida' );
add:(Etapa crearCon:'dia 3'cantDias:1 lugar:'Roma'  tipoPension: 'pension Completa' hotel: 'Villa del Mare' listaActividades: 'visita Coliseo Romano,Foro Romano y el Vatticano');add:(
Etapa crearCon:'dia 4'cantDias:1 lugar:'Florencia'  tipoPension: 'Todo incluido' hotel: 'La Dolce Vita Resort' listaActividades: 'traslado Florenica y tour'
);add:(
Etapa crearCon:'dia 5,6'cantDias:2 lugar:'Florencia'  tipoPension: 'Todo incluido' hotel: 'La Dolce Vita Resort' listaActividades: 'dia libre'
);add:(
Etapa crearCon:'dia 7'cantDias:1 lugar:'Venecia'  tipoPension: 'solo alojamiento' hotel: 'Palazzo Ducale' listaActividades: 'traslado Venecia,paseo en gondola'
).
"creacion de Fechas y cupos"
colF :=OrderedCollection  new.
colF add: (FechaSalida crearCon: (Date year: 2024 month:3 day: 12 ) cupo:10);
add:(FechaSalida crearCon: (Date year: 2024 month:3 day: 15 ) cupo: 15);
add: (FechaSalida crearCon: (Date year: 2024 month:3 day: 20 ) cupo: 30).
"creacion de Viaje Organizado 1"
"crearCon: unNombre  precioBase: unPrecioBase  valorImpuesto: unValorImpuesto colParadas: unaColParadas cantDias: unaCantDias
listaFechasSalidaDisponibles:listaFechas  valorDelPlus: unPorcentaje"
vO1:= Organizado crearCon: 'ViajeO Italia'  precioBase: 400000  valorImpuesto: 60000 valorDelPlus: 5000 fechasDisponibles: colF colParadas: colP cantDias: 7  excursiones: nil.
"segundo viaje Organizado"
"creacion de col paradas"
colP:=OrderedCollection new.
colP add:(Etapa crearCon:'dia 2 llegada 10:00'cantDias:1 lugar:'Tokio'  tipoPension: 'pension Completa' hotel: 'Hotel Tokyo Garden Palace' listaActividades: 'traslado al hotel y cena bienvenida');
add:(Etapa crearCon:'dia 3'cantDias:1 lugar:'Tokio'  tipoPension: 'pension Completa' hotel: 'Hotel Tokyo Garden Palace' listaActividades: 'Visita al Templo Senso-ji y el barrio de Asakusa');
add:(Etapa crearCon:'dia 4'cantDias:1 lugar:'Tokio'  tipoPension: 'Todo incluido' hotel: 'Hotel Tokyo Garden Palace' listaActividades: 'Visita al Templo Kinkaku-ji y el Castillo Nijo');
add:(Etapa crearCon:'dia 5'cantDias:2 lugar:'Hiroshima'  tipoPension: 'Todo incluido' hotel: 'Mitsui Garden' listaActividades: 'Viaje a Hiroshima. Visita al Parque Memorial de la Paz y el Castillo de Hiroshima');
add:(Etapa crearCon:'dia 6-7'cantDias:1 lugar:'Hiroshima'  tipoPension: 'Todo incluido' hotel: 'Mitsui Garden' listaActividades: 'Dia libre,Oportunidad para tomar un ferry a la isla de Miyajima.');
add:(Etapa crearCon:'dia 8'cantDias:1 lugar:'Yamanashi'  tipoPension: 'solo alojamiento' hotel: ' New Hiroden' listaActividades: 'Viaje al monte fuji').
"creacion de Fechas y cupos"
colF := OrderedCollection new.
   colF add: (FechaSalida crearCon:(Date year: 2024 month:3 day: 21 )  cupo:10);
add:(FechaSalida crearCon: (Date year: 2024 month:3 day: 15 ) cupo:15);
add:( FechaSalida crearCon: (Date year: 2024 month:3 day: 12 ) cupo: 18).
"creacion de Viaje Organizado 2"
vO2:=  Organizado crearCon: 'ViajeO Japon'  precioBase: 500000   valorImpuesto: 80000 valorDelPlus: 10000 fechasDisponibles: colF colParadas: colP cantDias: 8  excursiones: nil.
"carga de viajes Organizados"
empresaTurismo cargarViaje:vO1.
empresaTurismo cargarViaje:vO2.
"creacion Clientes"
c1 := Cliente crearCon: 4566777 apellido: 'Mendez' correo: 'Mendez@gmail.com' telefono: 29935014 ciudad: 'Neuquen'. 
c2 := Cliente crearCon: 3689100 apellido: 'Pinar' correo: 'Pinar@gmail.com' telefono: 29991017 ciudad: 'Rio Negro'.
c3 := ViajeroFrecuente   crearCon: 3900213 apellido: 'Ponce' correo: 'Ponce@gmail.com' telefono: 27896322 ciudad: 'Cordoba'  cantMillas:4000 .
c4 := Cliente crearCon: 3912199 apellido: 'Lopez' correo: 'Lopez@gmail.com' telefono: 24578901 ciudad: 'Buenos Aires'.
c5 := ViajeroFrecuente  crearCon: 41123913  apellido: 'Garcia' correo: 'Garcia@gmail.com'  telefono:25642178  ciudad:'Barcelona'  cantMillas:5000  .
c6 :=Cliente crearCon: 4003104 apellido: 'Fernandez' correo: 'fernandez@example.com' telefono: 5554444 ciudad: 'Sevilla'.
c7 := ViajeroFrecuente crearCon: 3943003 apellido: 'Perez' correo: 'perez@example.com' telefono: 5553333 ciudad: 'Valencia' cantMillas: 6000.
"carga clientes"
empresaTurismo cargarCliente: c1.
empresaTurismo cargarCliente: c2.
empresaTurismo cargarCliente: c3.
empresaTurismo cargarCliente: c4.
empresaTurismo cargarCliente: c5.
empresaTurismo cargarCliente: c6.
empresaTurismo cargarCliente: c7.
"cargar Contratos nuevos a clientes y anadir excursiones".
"contratarPaquete: unViaje fechaViaje: unaFecha cantPersonas: unaCantPersonas cantCuotas: unaCantidad pagaPlus: unVoF"
c1 contratarPaquete: vE1 fechaViaje:(vE1 getFechaSalida  )  cantPersonas:10  cantCuotas:6 pagaPlus:true .
c2 contratarPaquete: vE2 fechaViaje: (vE2 getFechaSalida ) cantPersonas:5 cantCuotas:6 pagaPlus: false.
c3 contratarPaquete: vE1 fechaViaje: (vE1 getFechaSalida ) cantPersonas:4 cantCuotas:3 pagaPlus: false.
vO1 nuevaExcursion: (Excursion crearCon:'Excursion a Pompeya y el Monte Vesubio' costo:14000).
vO1 nuevaExcursion: (Excursion crearCon:'Excursion al Vaticano:'  costo:20000 ).
vO1 nuevaExcursion: (Excursion crearCon:'Excurson a la Toscana' costo:30000 ).
c4 contratarPaquete: vO1 fechaViaje:(Date year: 2024 month:3 day: 15)cantPersonas:8 cantCuotas:6 pagaPlus:true.
c5 contratarPaquete: vO2 fechaViaje:(Date year: 2024 month:3 day:12)cantPersonas:6 cantCuotas:5 pagaPlus:false.
c6 contratarPaquete: vO1 fechaViaje:(Date year: 2024 month:3 day:20)cantPersonas:7 cantCuotas:6 pagaPlus:false.
vO2 nuevaExcursion: (Excursion crearCon:'Excursion a Nikko' costo:20000 ).
c7  contratarPaquete: vO2 fechaViaje:(Date year: 2024 month:3 day: 21 )cantPersonas:6 cantCuotas:4 pagaPlus:true.
Transcript show:'------------------------------------Datos actuales del Sistema------------------------------------';cr.
Transcript show: empresaTurismo toString  ;cr.
Transcript show:'------------------------------------Carga inicial exitosa------------------------------------';cr.
user1 := Usuario crear: 'pepe@gmail.com' pasword:'123456'  cuenta: c1 .
user2 := Usuario crear: 'jose@gmail.com' pasword:'key123' cuenta: c2.
user3 := Usuario crear: 'user3@gmail.com' pasword:'KEY123'  cuenta: c3.
usuarios add: user1 .
usuarios add: user2 .
usuarios add: user3 .


]

{ #category : #initialization }
Sistema >> obtenerUsuario: gmail pasword: key [
|var|
var:= usuarios detect:[:user | user verificarIngreso: gmail pasword: key]ifNone:[nil].
^var.

]
