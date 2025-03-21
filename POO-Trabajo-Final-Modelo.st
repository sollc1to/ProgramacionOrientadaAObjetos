Object subclass: #Cliente
	instanceVariableNames: 'nombre apellido direccion telefono'
	classVariableNames: ''
	package: 'POO-Trabajo-Final-Modelo'!

!Cliente methodsFor: 'Observadores' stamp: 'char 5/19/2024 11:06'!
getApellido

	^ apellido! !

!Cliente methodsFor: 'Observadores' stamp: 'char 5/19/2024 11:06'!
getTelefono 

	^ telefono! !

!Cliente methodsFor: 'Observadores' stamp: 'char 5/19/2024 11:06'!
getDireccion 

	^ direccion! !

!Cliente methodsFor: 'Observadores' stamp: 'char 5/19/2024 11:06'!
getNombre

	^ nombre! !


!Cliente methodsFor: 'Aplicación' stamp: 'char 2/10/2025 19:53'!
aCadenaCliente

	^ 'Nombre del Cliente: ' , nombre , Character cr asString , 'Apellido del Cliente: '
	  , apellido , Character cr asString , 'Telefono del Cliente: '
	  , telefono asString , Character cr asString , 'Direccion del Cliente: '
	  , direccion asString! !

!Cliente methodsFor: 'Aplicación' stamp: 'char 8/3/2024 12:54'!
aCadenaNombreTelefono
	"Devuelve una cadena formada por el nombre y teléfono del cliente."

	^ 'nombre de cliente: ' , nombre , ' - telefono de cliente: '
	  , telefono asString! !


!Cliente methodsFor: 'Modificadores' stamp: 'char 5/19/2024 11:06'!
setNombre: unNombre

	nombre := unNombre! !

!Cliente methodsFor: 'Modificadores' stamp: 'char 5/19/2024 11:07'!
setDireccion: unaDireccion

	direccion := unaDireccion! !

!Cliente methodsFor: 'Modificadores' stamp: 'char 5/19/2024 11:07'!
setTelefono: unTelefono

	telefono := unTelefono! !

!Cliente methodsFor: 'Modificadores' stamp: 'char 5/19/2024 11:06'!
setApellido: unApellido

	apellido := unApellido! !


!Cliente methodsFor: 'Inicializadores' stamp: 'char 5/19/2024 11:08'!
iniciar: unNombre apellido: unApellido direccion: unaDireccion telefono: unTelefono

	nombre := unNombre.
	apellido := unApellido.
	direccion := unaDireccion.
	telefono := unTelefono! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

Cliente class
	instanceVariableNames: ''!

!Cliente class methodsFor: 'Constructores' stamp: 'char 5/19/2024 11:09'!
crear: unNombre apellido: unApellido direccion: unaDireccion telefono: unTelefono

	| nuevoCliente |
	nuevoCliente := self new.
	
	nuevoCliente
		iniciar: unNombre
		apellido: unApellido
		direccion: unaDireccion
		telefono: unTelefono.
		
	^ nuevoCliente
! !


Object subclass: #Contrato
	instanceVariableNames: 'cliente listaElementos servicio fechaFirma identificador cancelado multa tamañoActual tamañoDisponible fechaInicial'
	classVariableNames: 'Contador'
	package: 'POO-Trabajo-Final-Modelo'!

!Contrato methodsFor: 'initialization' stamp: 'Marisol 2/4/2025 16:18'!
setIdentificador: unNum


identificador := unNum.
! !


!Contrato methodsFor: 'Inicializadores' stamp: 'Yzk 3/17/2025 10:43'!
iniciar: unCliente fechaFirma: unaFecha servicio: unServicio fechaInicial: unaFechaI

	cliente := unCliente.
	listaElementos := OrderedCollection new. "La  lista se crea vacía y luego se le agregan los elementos"
	fechaFirma := unaFecha.
	servicio := unServicio.
	cancelado := false.
	fechaInicial := unaFechaI.
	cancelado := false.
	tamañoActual := 0.
	tamañoDisponible := 10.

	self class aumentarContador.
	identificador := Contador! !


!Contrato methodsFor: 'Modificadores' stamp: 'char 5/19/2024 11:51'!
setCliente: unCliente

	cliente := unCliente! !

!Contrato methodsFor: 'Modificadores' stamp: 'char 7/31/2024 16:28'!
setFechaFirma: unaFecha

	fechaFirma := unaFecha! !

!Contrato methodsFor: 'Modificadores' stamp: 'char 8/2/2024 15:49'!
setMulta: unValor

	multa := unValor! !

!Contrato methodsFor: 'Modificadores' stamp: 'char 8/2/2024 14:06'!
setCancelado: unValor

	cancelado := unValor! !

!Contrato methodsFor: 'Modificadores' stamp: 'char 5/20/2024 21:09'!
setServicio: unServicio

	servicio := unServicio! !


!Contrato methodsFor: 'Observadores' stamp: 'Marisol 3/16/2025 18:19'!
tipoServicio

	^ servicio getTipo! !

!Contrato methodsFor: 'Observadores' stamp: 'char 5/19/2024 11:49'!
getCliente

	^ cliente! !

!Contrato methodsFor: 'Observadores' stamp: 'char 8/6/2024 13:24'!
getListaElementos

	^ listaElementos! !

!Contrato methodsFor: 'Observadores' stamp: 'char 8/2/2024 14:03'!
getCancelado

	^ cancelado! !

!Contrato methodsFor: 'Observadores' stamp: 'char 8/1/2024 18:07'!
getIdentificador

	^ identificador! !

!Contrato methodsFor: 'Observadores' stamp: 'Marisol 3/15/2025 11:05'!
getFechaInicial 

^ fechaInicial! !

!Contrato methodsFor: 'Observadores' stamp: 'Marisol 3/15/2025 18:41'!
getNombreCliente

|nombre|


nombre := cliente getNombre asString.

	^ nombre.
	! !

!Contrato methodsFor: 'Observadores' stamp: 'char 5/20/2024 21:09'!
getServicio

	^ servicio! !

!Contrato methodsFor: 'Observadores' stamp: 'char 12/5/2024 19:17'!
getMulta

	^ multa! !

!Contrato methodsFor: 'Observadores' stamp: 'char 7/31/2024 16:28'!
getFechaFirma

	^ fechaFirma! !


!Contrato methodsFor: 'Aplicación' stamp: 'Marisol 3/14/2025 22:36'!
verificarCondicion: unaFecha
	"Verifica que la fecha de la reprogramación sea después de la fecha de mudanza."

	| rta |

	rta := ((unaFecha subtractDate: fechaInicial ) >0) "Si es true, la fecha es después de la fecha final". 

	^ rta! !

!Contrato methodsFor: 'Aplicación' stamp: 'char 3/17/2025 00:47'!
aCadenaContrato

	| cadena unCliente unServicio |
	unCliente := cliente aCadenaCliente.
	unServicio := servicio aCadenaServicio.

	cadena := unCliente , Character cr asString , Character cr asString
	          , unServicio , Character cr asString
	          , 'Identificador del Contrato: ' , identificador asString
	          , Character cr asString , 'Contrato Cancelado: '
	          , cancelado asString , Character cr asString
	          , Character cr asString
	          , 'Valor Total Calculado del Contrato: '
	          , self calcularValorTotal asString.
	^ cadena! !

!Contrato methodsFor: 'Aplicación' stamp: 'Marisol 3/14/2025 10:22'!
agregarElemento: unElemento
	"Agrega un elemento a la lista de elementos."

	listaElementos add: unElemento.
	
tamañoActual := tamañoActual +1.! !

!Contrato methodsFor: 'Aplicación' stamp: 'Yzk 3/17/2025 18:15'!
cancelarContrato

	| rta cantDias |
	"Si el contrato no fue cancelado (ifFalse) - Si fue cancelado (ifTrue)"
	cancelado
		ifFalse: [
			cantDias := self obtenerDiasRestantes.
			rta := self verificarCancelacion: cantDias.
			]
		ifTrue: [ rta := ' El contrato ya fue cancelado.' ].
	^ rta! !

!Contrato methodsFor: 'Aplicación' stamp: 'Yzk 3/17/2025 10:52'!
verificarCancelacion: cantidadDias

	^ self subclassResponsibility! !

!Contrato methodsFor: 'Aplicación' stamp: 'Marisol 3/14/2025 10:23'!
verificarTamaño

^(tamañoActual < tamañoDisponible).
! !

!Contrato methodsFor: 'Aplicación' stamp: 'char 8/3/2024 13:00'!
esSemanal
	"Devuelve T/F dependiendo si el contrato se realizó hace una semana o menos."

	^ (Date today subtractDate: fechaFirma) <= 7! !

!Contrato methodsFor: 'Aplicación' stamp: 'Marisol 3/14/2025 22:38'!
calcularValorTotal 

^ (servicio getValorBase).
! !

!Contrato methodsFor: 'Aplicación' stamp: 'char 8/8/2024 12:36'!
esContrato: unIdentificador

	^ identificador = unIdentificador! !

!Contrato methodsFor: 'Aplicación' stamp: 'Yzk 3/17/2025 18:21'!
obtenerDiasRestantes
	"Devuelve la cantidad de días restantes que quedan desde la fecha de hoy hasta la fecha del servicio."

	| rta |
	(fechaInicial isAfter: Date today)
		ifTrue: [ ^ rta := fechaInicial subtractDate: Date today. ]
		ifFalse: [ ^ rta := -1 ]! !

!Contrato methodsFor: 'Aplicación' stamp: 'char 8/3/2024 12:55'!
aCadenaDatos
	"Devuelve una cadena formada por los datos del cliente, el nombre del servicio y la fecha del contrato."

	| cadena cad nom |
	cad := cliente aCadenaNombreTelefono.
	nom := servicio aCadenaNombre.

	cadena := cad , ' - ' , nom , ' - fecha de contrato: '
	          , fechaFirma asString.

	^ cadena! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

Contrato class
	instanceVariableNames: ''!

!Contrato class methodsFor: 'Aplicación' stamp: 'Yzk 3/17/2025 10:43'!
aumentarContador

	Contador := Contador + 1! !

!Contrato class methodsFor: 'Aplicación' stamp: 'Yzk 3/17/2025 10:43'!
iniciarContador
	
	Contador := 0! !


Contrato subclass: #ContratoGuardamuebles
	instanceVariableNames: 'tiempoDuracion colFechasRenovacion'
	classVariableNames: 'DiasMax DiasMin'
	package: 'POO-Trabajo-Final-Modelo'!

!ContratoGuardamuebles methodsFor: 'Observadores' stamp: 'char 5/19/2024 11:55'!
getTiempoDuracion

	^ tiempoDuracion! !

!ContratoGuardamuebles methodsFor: 'Observadores' stamp: 'char 8/6/2024 13:26'!
getColFechasRenovacion

	^ colFechasRenovacion! !


!ContratoGuardamuebles methodsFor: 'Aplicación' stamp: 'Marisol 3/16/2025 10:56'!
renovarContrato
	"Renueva automáticamente luego de la fecha final."

	| rta fecha |
	fecha := self obtenerFechaFinalizacionServicio addDays: 1.

	cancelado not
		ifTrue: [
			colFechasRenovacion add: fecha.
			self actualizarFechaInicial: fecha.
			rta := 'El contrato fue renovado con éxito.' ]
		ifFalse: [ rta := 'El contrato no fue renovado.' ].

	^ rta! !

!ContratoGuardamuebles methodsFor: 'Aplicación' stamp: 'Marisol 3/16/2025 09:55'!
calcularValorTotal 
|valor|

valor := servicio getValorBase. 

multa ifTrue:[ valor := valor + (valor*10)/100].


^valor.
! !

!ContratoGuardamuebles methodsFor: 'Aplicación' stamp: 'Yzk 3/17/2025 18:33'!
verificarCancelacion: cantDias

	| rta |
	cantDias >= DiasMax
		ifTrue: [
			rta := 'El contrato fue cancelado sin costo.'.
			cancelado := true ]
		ifFalse: [
			cantDias > DiasMin
				ifTrue: [
					rta := 'El contrato fue cancelado sin costo'.
					cancelado := true ]
				ifFalse: [
					cantDias > 0
						ifTrue: [
							rta := 'El contrato fue cancelado con costo.'.
							multa := true.
							cancelado := true ]
						ifFalse: [ rta := 'El contrato ya caducó.' ] ] ].
	^ rta! !

!ContratoGuardamuebles methodsFor: 'Aplicación' stamp: 'char 2/10/2025 20:11'!
verificarFecha: unaFecha
	"Verifica que la fecha de la reprogramación sea después de la fecha de mudanza."

	| hoy rta |
	hoy := Date today.
	rta := (unaFecha subtractDate: hoy) > 0.

	^ rta! !

!ContratoGuardamuebles methodsFor: 'Aplicación' stamp: 'Marisol 3/14/2025 16:26'!
obtenerFechaFinalizacionServicio
	"Devuelve una cadena formada por la fecha de finalización del servicio."

	| fecha |
	fecha := fechaInicial addDays: tiempoDuracion.

	^ fecha! !

!ContratoGuardamuebles methodsFor: 'Aplicación' stamp: 'Marisol 3/14/2025 22:46'!
actualizarFechaInicial: unaFecha

fechaInicial := unaFecha.

! !

!ContratoGuardamuebles methodsFor: 'Aplicación' stamp: 'Yzk 3/17/2025 23:08'!
aCadenaContrato

	| elementos fechasR |
	elementos := 'Lista de elementos: '.

	listaElementos do: [ :cadaElemento |
		elementos := elementos , ' ' , cadaElemento asString ].

	fechasR := 'Fechas de renovacion: '.

	colFechasRenovacion do: [ :cadaR |
		fechasR := fechasR , ' ' , cadaR asDate asString ].


	^ super aCadenaContrato , Character cr asString , 'Duración en días: '
	  , tiempoDuracion asString , Character cr asString
	  , Character cr asString , elementos , Character cr asString
	  , 'Fecha de Finalización: '
	  , self obtenerFechaFinalizacionServicio asString
	  , Character cr asString , fechasR! !


!ContratoGuardamuebles methodsFor: 'Modificadores' stamp: 'char 5/19/2024 12:07'!
setTiempoDuracion: unTiempo

	tiempoDuracion := unTiempo! !


!ContratoGuardamuebles methodsFor: 'Inicializadores' stamp: 'Yzk 3/17/2025 11:28'!
iniciar: unCliente fechaFirma: unaFecha servicio: unServicio tiempoDuracion: unTiempo fechaInicial: unaFechaI

	self
		iniciar: unCliente
		fechaFirma: unaFecha
		servicio: unServicio
		fechaInicial: unaFechaI.
	tiempoDuracion := unTiempo.
	colFechasRenovacion := OrderedCollection new.
	multa := false.

	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

ContratoGuardamuebles class
	instanceVariableNames: ''!

!ContratoGuardamuebles class methodsFor: 'Constructores' stamp: 'Yzk 3/16/2025 20:05'!
crear: unCliente fechaFirma: unaFecha servicio: unServicio  tiempoDuracion: unTiempo fechaInicial: unaFechaI

	| nuevoContrato |
	nuevoContrato := self new.

	nuevoContrato
		iniciar: unCliente
		fechaFirma: unaFecha
		servicio: unServicio
		tiempoDuracion: unTiempo
		fechaInicial: unaFechaI.

	^ nuevoContrato! !


!ContratoGuardamuebles class methodsFor: 'as yet unclassified' stamp: 'Yzk 3/17/2025 10:35'!
limiteDias
 
 DiasMin := 3.
DiasMax := 10.! !


Contrato subclass: #ContratoMudanza
	instanceVariableNames: 'direccionOrigen direccionDestino hora fechaReprogramacion urgente'
	classVariableNames: ''
	package: 'POO-Trabajo-Final-Modelo'!

!ContratoMudanza methodsFor: 'initialization' stamp: 'Marisol 3/14/2025 10:37'!
setUrgente: boolean

	urgente := boolean! !


!ContratoMudanza methodsFor: 'Aplicación' stamp: 'Marisol 3/14/2025 22:50'!
verificarCondicionDeUrgencia
	"Verifica que la mudanza no haya sido realizada."

	| hoy rta |
	hoy := Date today.

	rta := (fechaInicial subtractDate: hoy) > 0.

	^ rta! !

!ContratoMudanza methodsFor: 'Aplicación' stamp: 'Marisol 3/16/2025 17:40'!
reprogramarMudanza: unaFecha
	"Devuelve una de tres posibles respuestas las cuales son: 'reprogramacion valida', 'reprogramacion rechazada', 'ya fue reprogramado'"

	| rta |
	fechaReprogramacion = nil 
		ifTrue: [
			(self verificarCondicion: unaFecha)
				ifTrue: [
					fechaReprogramacion := unaFecha.
					rta := 'El contrato fue reprogramado.' ]
				ifFalse: [ rta := 'El contrato no pudo ser reprogramado.' ] ]
		ifFalse: [ rta := 'El contrato ya fue reprogramado.' ].

	^ rta! !

!ContratoMudanza methodsFor: 'Aplicación' stamp: 'Marisol 3/14/2025 10:40'!
calcularValor: unValor
	"Devuelve el valor al 100% si no fue reprogramado urgente o al 120% si fue reprogramado urgente."

	| valor |
	valor := urgente
		         ifTrue: [ 1.2 ]
		         ifFalse: [ 1 ].

	valor := unValor * valor.

	^ valor! !

!ContratoMudanza methodsFor: 'Aplicación' stamp: 'Marisol 3/14/2025 22:49'!
calcularValorTotal
	"Devuelve la suma del valorBase más los valores adicionales del servicio."

	| rta |
	rta := (servicio getValorBase) + servicio getValorAdEmbalaje
	       + servicio getValorAdAltura.

	^ rta! !

!ContratoMudanza methodsFor: 'Aplicación' stamp: 'Marisol 3/16/2025 17:14'!
aCadenaContrato

	| cadena |
	cadena := super aCadenaContrato.

	fechaReprogramacion ~= nil ifTrue:[
		cadena := cadena , Character cr asString
		          , 'Fecha de reprogramación: '
		          , fechaReprogramacion asDate asString ].







	^ cadena! !

!ContratoMudanza methodsFor: 'Aplicación' stamp: 'Yzk 3/17/2025 10:59'!
verificarCancelacion: cantidadDias

	^ self subclassResponsibility! !

!ContratoMudanza methodsFor: 'Aplicación' stamp: 'Marisol 3/14/2025 22:50'!
reprogramarMudanzaUrgente: unaFecha
	"Devuelve una de tres posibles respuestas las cuales son: 'urgencia valida', 'urgencia rechazada', 'ya fue reprogramado'"

	| rta |
	fechaReprogramacion
		ifNil: [
			self verificarCondicionDeUrgencia
				ifTrue: [
					fechaReprogramacion := unaFecha.
					urgente := true.
					rta := 'El contrato fue reprogramado de urgencia con éxito.' ]
				ifFalse: [ rta := 'El contrato no pudo ser reprogramado con éxito.' ] ]
		ifNotNil: [ rta := 'El contrato ya fue reprogramado.' ].

	^ rta! !


!ContratoMudanza methodsFor: 'Observadores' stamp: 'char 5/19/2024 12:13'!
getHora

	^ hora! !

!ContratoMudanza methodsFor: 'Observadores' stamp: 'char 5/19/2024 12:12'!
getDireccionOrigen

	^ direccionOrigen! !

!ContratoMudanza methodsFor: 'Observadores' stamp: 'Marisol 3/14/2025 10:28'!
getFechaReprogramacion

	^ fechaReprogramacion! !

!ContratoMudanza methodsFor: 'Observadores' stamp: 'char 5/19/2024 12:12'!
getDireccionDestino

	^ direccionDestino! !


!ContratoMudanza methodsFor: 'Modificadores' stamp: 'char 5/19/2024 12:14'!
setHora: unaHora

	hora := unaHora! !

!ContratoMudanza methodsFor: 'Modificadores' stamp: 'char 5/19/2024 12:13'!
setDireccionOrigen: unaDireccionOrigen

	direccionOrigen := unaDireccionOrigen! !

!ContratoMudanza methodsFor: 'Modificadores' stamp: 'char 5/19/2024 12:14'!
setDireccionDestino: unaDireccionDestino

	direccionDestino := unaDireccionDestino! !


!ContratoMudanza methodsFor: 'Inicializadores' stamp: 'Yzk 3/16/2025 19:55'!
iniciar: unCliente fechaFirma: unaFecha servicio: unServicio  direccionOrigen: unaDireccionOrigen direccionDestino: unaDireccionDestino hora: unaHora fechaInicial: unaFechaI

	self
		iniciar: unCliente
		fechaFirma: unaFecha
		servicio: unServicio
		fechaInicial: unaFechaI.
	direccionOrigen := unaDireccionOrigen.
	direccionDestino := unaDireccionDestino.
	hora := unaHora.
	multa := false.

	urgente := false! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

ContratoMudanza class
	instanceVariableNames: ''!

!ContratoMudanza class methodsFor: 'Constructores' stamp: 'Yzk 3/16/2025 20:05'!
crear: unCliente fechaFirma: unaFecha servicio: unServicio direccionOrigen: unaDireccionOrigen direccionDestino: unaDireccionDestino hora: unaHora fechaInicial: unaFechaI

	| nuevoContrato |
	nuevoContrato := self new.

	nuevoContrato
		iniciar: unCliente
		fechaFirma: unaFecha
		servicio: unServicio
		direccionOrigen: unaDireccionOrigen
		direccionDestino: unaDireccionDestino
		hora: unaHora
		fechaInicial: unaFechaI.

	^ nuevoContrato! !


ContratoMudanza subclass: #ContratoInternacional
	instanceVariableNames: 'tipoTransporte'
	classVariableNames: ''
	package: 'POO-Trabajo-Final-Modelo'!

!ContratoInternacional methodsFor: 'initialization' stamp: 'Marisol 3/14/2025 23:16'!
setTransporte: unTransporte 
tipoTransporte := unTransporte.
! !


!ContratoInternacional methodsFor: 'Inicializadores' stamp: 'Yzk 3/16/2025 19:55'!
iniciar: unCliente fechaFirma: unaFecha servicio: unServicio  direccionOrigen: unaDireccionOrigen direccionDestino: unaDireccionDestino hora: unaHora fechaInicial: unaFechaI

	super
		iniciar: unCliente
		fechaFirma: unaFecha
		servicio: unServicio
		direccionOrigen: unaDireccionOrigen
		direccionDestino: unaDireccionDestino
		hora: unaHora
		fechaInicial: unaFechaI.

	tipoTransporte := nil! !


!ContratoInternacional methodsFor: 'Aplicación' stamp: 'Marisol 3/17/2025 16:04'!
verificarTipoTransporte

	^ tipoTransporte isNotNil! !

!ContratoInternacional methodsFor: 'Aplicación' stamp: 'Marisol 3/16/2025 09:52'!
calcularValorTotal
	"Devuelve el valor total del servicio de mudanza internacional."

	| valor |
	valor := servicio getValorBase + servicio getValorAdAduana
	         + servicio getValorAdTransporte.
	valor := self calcularValor: valor.
	multa ifTrue:[valor := valor + ((servicio getValorAdAduana )*10)/100.].
	

	^ valor! !

!ContratoInternacional methodsFor: 'Aplicación' stamp: 'Marisol 3/16/2025 17:09'!
aCadenaContrato

	| cadena |
	cadena := super aCadenaContrato.


	cadena := cadena , Character cr asString , ' Tipo de Transporte: '
	          , tipoTransporte asString .

	^ cadena! !

!ContratoInternacional methodsFor: 'Aplicación' stamp: 'Marisol 3/17/2025 16:04'!
verificarCondicion: unaFecha
	"Devuelve T/F dependiendo si el tipoTransporte no fue solucionado."

	| rta |
	rta := (super verificarCondicion: unaFecha).
	
	
		   rta  ifTrue: [ "Si el transporte es nulo, entonces no se puede reprogramar."
			       rta := self verificarTipoTransporte ]
		       ifFalse: [ false ].
	^ rta! !

!ContratoInternacional methodsFor: 'Aplicación' stamp: 'Yzk 3/17/2025 18:24'!
verificarCancelacion: cantDias

	| rta |
	cantDias >= 0 ifTrue: [
		rta := 'El contrato fue cancelado con costo'.
		multa := true.
		cancelado := true ]
	ifFalse: [ rta:= 'El contrato ya caducó.' ].

	^ rta! !


!ContratoInternacional methodsFor: 'Observadores' stamp: 'Marisol 3/14/2025 23:16'!
getTransporte 
^ tipoTransporte.
! !


ContratoMudanza subclass: #ContratoLocal
	instanceVariableNames: ''
	classVariableNames: 'DiasMax DiasMin'
	package: 'POO-Trabajo-Final-Modelo'!

!ContratoLocal methodsFor: 'Aplicación' stamp: 'Marisol 3/17/2025 16:06'!
verificarCondicion: unaFecha
	"Devuelve T/F dependiendo si quedan 2 días desde la fecha de hoy hasta la fecha de mudanza."

	| hoy rta |
	hoy := Date today.
	rta := (super verificarCondicion: unaFecha)
		       ifTrue: [ (fechaInicial subtractDate: hoy) > 2 ]
		       ifFalse: [ false ].
	^ rta! !

!ContratoLocal methodsFor: 'Aplicación' stamp: 'Marisol 3/14/2025 23:00'!
calcularValorTotal
	"Devuelve el valor total del servicio de mudanza local."

	| valor |
	valor := super calcularValorTotal.
	valor := self calcularValor: valor.

	^ valor! !

!ContratoLocal methodsFor: 'Aplicación' stamp: 'Yzk 3/17/2025 18:30'!
verificarCancelacion: cantDias

	| rta |
	cantDias > 0
		ifTrue: [
			rta := 'El contrato fue cancelado sin costo.'.
			cancelado := true ]
		ifFalse: [ rta := 'El contrato no se puede cancelar.' ].
	^ rta! !


!ContratoLocal methodsFor: 'Inicializadores' stamp: 'Yzk 3/16/2025 19:56'!
iniciar: unCliente fechaFirma: unaFecha servicio: unServicio direccionOrigen: unaDireccionOrigen direccionDestino: unaDireccionDestino hora: unaHora fechaInicial: unaFechaI

	super
		iniciar: unCliente
		fechaFirma: unaFecha
		servicio: unServicio
		direccionOrigen: unaDireccionOrigen
		direccionDestino: unaDireccionDestino
		hora: unaHora
		fechaInicial: unaFechaI! !


ContratoMudanza subclass: #ContratoNacional
	instanceVariableNames: 'distancia distanciaRecorrida'
	classVariableNames: ''
	package: 'POO-Trabajo-Final-Modelo'!

!ContratoNacional methodsFor: 'Inicializadores' stamp: 'Yzk 3/16/2025 19:56'!
iniciar: unCliente fechaFirma: unaFecha servicio: unServicio direccionOrigen: unaDireccionOrigen direccionDestino: unaDireccionDestino hora: unaHora distancia: unaDistancia fechaInicial: unaFechaI

	self
		iniciar: unCliente
		fechaFirma: unaFecha
		servicio: unServicio
		direccionOrigen: unaDireccionOrigen
		direccionDestino: unaDireccionDestino
		hora: unaHora
		fechaInicial: unaFechaI.
	"Agregamos atributo distancia y distancia recorrida"
	distancia := unaDistancia.


	distanciaRecorrida := 100 "Le ponemos un numero random"! !


!ContratoNacional methodsFor: 'Aplicación' stamp: 'Marisol 3/17/2025 12:31'!
calcularValorTotal
	"Devuelve el valor total del servicio de mudanza nacional."

	| valor diferencia dif |
	distancia ifNil: [ distancia := 0 ].
	diferencia := distanciaRecorrida asInteger - distancia asInteger.
	dif := 0.



	diferencia <= 0 ifTrue: [
		dif := (distanciaRecorrida - distancia / 50) asInteger.
		dif := dif abs ].

	valor := super calcularValorTotal + servicio getValorAdSeguro
	         + (servicio getValorAdDistancia * dif)
	         + servicio getValorAdReprogramacion.
	valor := self calcularValor: valor.
	multa ifTrue: [ valor := valor + (valor * 10) / 100 ].

	^ valor! !

!ContratoNacional methodsFor: 'Aplicación' stamp: 'Marisol 3/16/2025 17:09'!
aCadenaContrato 
|cadena|

cadena := super aCadenaContrato.

cadena := cadena, Character cr asString, ' Distancia: ', distancia asString.

^ cadena.

! !

!ContratoNacional methodsFor: 'Aplicación' stamp: 'Marisol 3/17/2025 15:53'!
verificarCondicion: unaFecha
	"Devuelve T/F dependiendo si quedan 5 días desde la fecha de hoy hasta la fecha de mudanza."

	| hoy rta |
	hoy := Date today.
	rta := (super verificarCondicion: unaFecha)
		       ifTrue: [ (fechaInicial subtractDate: hoy) > 5 ]
		       ifFalse: [ false ].
	^ rta! !

!ContratoNacional methodsFor: 'Aplicación' stamp: 'Yzk 3/18/2025 00:04'!
verificarCancelacion: cantDias

	| rta |
	cantDias > 7
		ifTrue: [ rta := 'El Contrato fue cancelado sin costo.' .
			cancelado := true.]
		ifFalse: [
			cantDias >= 0
				ifTrue: [
					rta := 'El Contrato fue cancelado con costo.'.
					multa := true.
					cancelado := true ]
				ifFalse: [ rta := 'El contrato ya caducó' ] ].

	^ rta! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

ContratoNacional class
	instanceVariableNames: 'distancia distanciaRecorrida'!

!ContratoNacional class methodsFor: 'Inicializadores' stamp: 'Yzk 3/16/2025 20:05'!
crear: unCliente fechaFirma: unaFecha servicio: unServicio direccionOrigen: unaDireccionOrigen direccionDestino: unaDireccionDestino hora: unaHora distancia: unaDistancia fechaInicial: unaFechaI

	| contrato |
	contrato := self new.
	contrato
		iniciar: unCliente
		fechaFirma: unaFecha
		servicio: unServicio
		direccionOrigen: unaDireccionOrigen
		direccionDestino: unaDireccionDestino
		hora: unaHora
		distancia: unaDistancia
		fechaInicial: unaFechaI.

	^ contrato! !


Object subclass: #Direccion
	instanceVariableNames: 'calle nro piso dpto barrio'
	classVariableNames: ''
	package: 'POO-Trabajo-Final-Modelo'!

!Direccion methodsFor: 'Inicializadores' stamp: 'char 5/19/2024 10:57'!
iniciar: unaCalle nro: unNro piso: unPiso dpto: unDpto barrio: unBarrio

	calle := unaCalle.
	nro := unNro.
	piso := unPiso.
	dpto := unDpto.
	barrio := unBarrio! !


!Direccion methodsFor: 'Observadores' stamp: 'char 5/19/2024 10:54'!
getBarrio

	^ barrio! !

!Direccion methodsFor: 'Observadores' stamp: 'char 5/19/2024 10:54'!
getNro

	^ nro! !

!Direccion methodsFor: 'Observadores' stamp: 'char 5/19/2024 10:54'!
getPiso

	^ piso! !

!Direccion methodsFor: 'Observadores' stamp: 'char 5/19/2024 10:54'!
getCalle 
	
	^ calle! !

!Direccion methodsFor: 'Observadores' stamp: 'char 5/19/2024 10:54'!
getDpto

	^ dpto! !


!Direccion methodsFor: 'Modificadores' stamp: 'char 5/19/2024 10:55'!
setPiso: unPiso

	piso := unPiso! !

!Direccion methodsFor: 'Modificadores' stamp: 'char 5/19/2024 10:55'!
setNro: unNro

	nro := unNro! !

!Direccion methodsFor: 'Modificadores' stamp: 'char 5/19/2024 10:55'!
setBarrio: unBarrio

	barrio := unBarrio! !

!Direccion methodsFor: 'Modificadores' stamp: 'char 5/19/2024 10:55'!
setCalle: unaCalle

	calle := unaCalle! !

!Direccion methodsFor: 'Modificadores' stamp: 'char 5/19/2024 10:55'!
setDpto: unDpto

	dpto := unDpto! !


!Direccion methodsFor: 'Aplicación' stamp: 'char 8/4/2024 16:57'!
aCadenaDireccion

	^ Character cr asString , '           - calle: ' , calle asString
	  , Character cr asString , '           - nro: ' , nro asString
	  , Character cr asString , '           - piso: ' , piso asString
	  , Character cr asString , '           - dpto: ' , dpto asString
	  , Character cr asString , '           - barrio: ' , barrio asString! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

Direccion class
	instanceVariableNames: ''!

!Direccion class methodsFor: 'Constructores' stamp: 'char 5/19/2024 12:52'!
crear: unaCalle nro: unNro piso: unPiso dpto: unDpto barrio: unBarrio

	| nuevaDireccion |
	nuevaDireccion := self new.

	nuevaDireccion
		iniciar: unaCalle
		nro: unNro
		piso: unPiso
		dpto: unDpto
		barrio: unBarrio.

	^ nuevaDireccion! !


Object subclass: #Empresa
	instanceVariableNames: 'razonSocial direccion paginaWeb telefono colServicios colContratos'
	classVariableNames: ''
	package: 'POO-Trabajo-Final-Modelo'!

!Empresa methodsFor: 'Aplicación' stamp: 'char 8/6/2024 13:34'!
aCadenaEmpresa
	" Retorna los datos de la empresa en forma de cadena."

	^ '- Empresa:' , Character cr asString , '      - razonSocial: '
	  , razonSocial asString , Character cr asString
	  , '      - direccion: ' , direccion aCadenaDireccion
	  , Character cr asString , '      - paginaWeb: ' , paginaWeb
	  , Character cr asString , '      - telefono: ' , telefono asString
	  , Character cr asString , '      - colServicio: '
	  , colServicios size asString , Character cr asString
	  , '      - colContrato: ' , colContratos size asString
	  , Character cr asString , Character cr asString
	  , '   Servicios disponibles: ' , Character cr asString
	  , '         Servicio de Guardamuebles' , Character cr asString
	  , '         Servicio de Mudanzas Local' , Character cr asString
	  , '         Servicio de Mudanzas Nacional' , Character cr asString
	  , '         Servicio de Mudanzas Internacional'
	  , Character cr asString! !

!Empresa methodsFor: 'Aplicación' stamp: 'Yzk 3/17/2025 11:54'!
cancelarContrato: unIdentificador

	| unContrato rta |
	unContrato := colContratos detect: [ :cadaContrato |
		              cadaContrato esContrato: unIdentificador ].
	unContrato
		ifNotNil: [
			rta := unContrato cancelarContrato.
			self changed ]
		ifNil: [ rta := 'No existe el contrato.' ].

	^ rta! !

!Empresa methodsFor: 'Aplicación' stamp: 'Marisol 3/16/2025 10:57'!
renovarContrato: unIdentificador
	"El contrato se renuevo automáticamente dps de la fecha final"

	| contrato rta |
	contrato := colContratos detect: [ :cadaContrato |
		            cadaContrato esContrato: unIdentificador ].

	rta := contrato
		       ifNotNil: [ contrato renovarContrato ]
		       ifNil: [ 'No existe el contrato.' ].

	^ rta! !

!Empresa methodsFor: 'Aplicación' stamp: 'Marisol 3/15/2025 15:55'!
agregarServicio: unServicio

	colServicios add: unServicio.
	
self changed.

! !

!Empresa methodsFor: 'Aplicación' stamp: 'Marisol 3/14/2025 23:23'!
reprogramarMudanzaEmpresa: unIdentificador fecha: unaFecha

	| contrato rta |
	contrato := colContratos detect: [ :cadaContrato |
		            cadaContrato esContrato: unIdentificador ].

	rta := contrato
		       ifNotNil: [ contrato reprogramarMudanza: unaFecha ]
		       ifNil: [ 'No existe el contrato' ].

	^ rta! !

!Empresa methodsFor: 'Aplicación' stamp: 'char 8/6/2024 13:34'!
generarListadoContratosSemanal
	"Genera y devuelve una lista de contratos que fueron realizados en los últimos 7 días."

	| colContratoSemanal listaContratos |
	colContratoSemanal := colContratos select: [ :cadaContrato |
		                      cadaContrato esSemanal ].

	listaContratos := colContratoSemanal collect: [ :cadaContrato |
		                  cadaContrato aCadenaDatos ].

	^ listaContratos! !

!Empresa methodsFor: 'Aplicación' stamp: 'Marisol 3/16/2025 16:56'!
reprogramarMudanzaUrgente: unIdentificador fecha: unaFecha

	| contrato rta |
	contrato := colContratos detect: [ :cadaContrato |
		            cadaContrato esContrato: unIdentificador ].

	rta := contrato
		       ifNotNil: [ contrato reprogramarMudanzaUrgente: unaFecha ]
		       ifNil: [ 'No existe el contrato.' ].

	^ rta! !

!Empresa methodsFor: 'Aplicación' stamp: 'Marisol 3/15/2025 18:26'!
agregarContrato: unContrato
	"Agrega un contrato a la colección de contratos."

	colContratos add: unContrato.

	self changed! !

!Empresa methodsFor: 'Aplicación' stamp: 'Marisol 3/15/2025 15:47'!
verificarNombreServicio: unNombre
|rta| "En este metodo verificamos que no exista un servicio con el mismo nombre del que deseamos agregar"

rta := true.

colServicios do:[:cadaServicio| (cadaServicio getNombre = unNombre)ifTrue:[ rta := false.]].

^ rta.









! !

!Empresa methodsFor: 'Aplicación' stamp: 'Marisol 3/15/2025 16:42'!
buscarServicio: unNombre

	| servicio |
	servicio := colServicios detect: [ :cServicio |
		cServicio getNombre = unNombre ] ifNone:[nil].

	^ servicio! !

!Empresa methodsFor: 'Aplicación' stamp: 'Yzk 2/8/2025 13:26'!
aCadenaDatosEmpresa
	" Retorna los datos de la empresa en forma de cadena."

	^ 'Razon Social: ' , razonSocial asString , Character cr asString
	  ,Character cr asString
	  , 'Direccion: ' , direccion aCadenaDireccion
	  , Character cr asString ,Character cr asString
	  , 'Pagina Web: ' , paginaWeb
	  , Character cr asString , Character cr asString
	  ,'Telefono: ' , telefono asString! !


!Empresa methodsFor: 'Observadores' stamp: 'char 8/6/2024 13:33'!
getColContratos

	^ colContratos! !

!Empresa methodsFor: 'Observadores' stamp: 'char 5/19/2024 10:43'!
getDireccion

	^ direccion! !

!Empresa methodsFor: 'Observadores' stamp: 'char 5/19/2024 10:43'!
getRazonSocial

	^ razonSocial! !

!Empresa methodsFor: 'Observadores' stamp: 'char 5/19/2024 10:44'!
getPaginaWeb 

	^ paginaWeb! !

!Empresa methodsFor: 'Observadores' stamp: 'char 8/6/2024 13:33'!
getColServicios

	^ colServicios! !

!Empresa methodsFor: 'Observadores' stamp: 'char 5/19/2024 10:44'!
getTelefono 

	^ telefono! !


!Empresa methodsFor: 'Modificadores' stamp: 'char 5/19/2024 10:45'!
setTelefono: unTelefono

	telefono := unTelefono! !

!Empresa methodsFor: 'Modificadores' stamp: 'char 5/19/2024 10:45'!
setPaginaWeb: unaPaginaWeb

	paginaWeb := unaPaginaWeb! !

!Empresa methodsFor: 'Modificadores' stamp: 'char 5/19/2024 10:44'!
setDireccion: unaDireccion

	direccion := unaDireccion! !

!Empresa methodsFor: 'Modificadores' stamp: 'char 5/19/2024 10:44'!
setRazonSocial: unaRazonSocial

	razonSocial := unaRazonSocial! !


!Empresa methodsFor: 'Inicializadores' stamp: 'char 2/10/2025 18:36'!
iniciar: unaRazonSocial direccion: unaDireccion paginaWeb: unaPaginaWeb telefono: unTelefono

	razonSocial := unaRazonSocial.
	direccion := unaDireccion.
	paginaWeb := unaPaginaWeb.
	telefono := unTelefono.
	colServicios := OrderedCollection new.
	colContratos := OrderedCollection new.
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

Empresa class
	instanceVariableNames: ''!

!Empresa class methodsFor: 'Constructores' stamp: 'char 8/4/2024 14:48'!
crear: unaRazonSocial direccion: unaDireccion paginaWeb: unaPaginaWeb telefono: unTelefono

	| nuevaEmpresa |
	nuevaEmpresa := self new.

	nuevaEmpresa
		iniciar: unaRazonSocial
		direccion: unaDireccion
		paginaWeb: unaPaginaWeb
		telefono: unTelefono.

	^ nuevaEmpresa! !


Object subclass: #Servicio
	instanceVariableNames: 'descripcion nombre valorBase tipo'
	classVariableNames: ''
	package: 'POO-Trabajo-Final-Modelo'!

!Servicio methodsFor: 'Observadores' stamp: 'Marisol 3/15/2025 17:19'!
getTipo

^tipo.
! !

!Servicio methodsFor: 'Observadores' stamp: 'char 5/19/2024 11:23'!
getValorBase

	^ valorBase! !

!Servicio methodsFor: 'Observadores' stamp: 'char 5/19/2024 11:22'!
getDescripcion

	^ descripcion! !

!Servicio methodsFor: 'Observadores' stamp: 'char 5/19/2024 11:23'!
getNombre

	^ nombre! !


!Servicio methodsFor: 'Modificadores' stamp: 'char 5/19/2024 11:23'!
setNombre: unNombre

	nombre := unNombre! !

!Servicio methodsFor: 'Modificadores' stamp: 'char 5/19/2024 11:29'!
setValorBase: unValor

	valorBase := unValor! !

!Servicio methodsFor: 'Modificadores' stamp: 'char 5/19/2024 11:23'!
setDescripcion: unaDescripcion

	descripcion := unaDescripcion! !


!Servicio methodsFor: 'Aplicación' stamp: 'char 8/3/2024 16:52'!
aCadenaNombre
	"Devuelve una cadena con el nombre del servicio."

	^ 'nombre de servicio: ' , nombre! !

!Servicio methodsFor: 'Aplicación' stamp: 'Yzk 3/16/2025 18:41'!
aCadenaServicio

	^ 'Servicio: ' , nombre , Character cr asString
	  , 'Tipo de Servicio: ' , tipo , Character cr asString
	  , 'Descripción del Servicio: ' , descripcion
	  , Character cr asString 
	  , 'Valor Base del Servicio: ' , valorBase asString! !


!Servicio methodsFor: 'Inicializadores' stamp: 'Marisol 3/15/2025 15:55'!
iniciar: unaDescripcion nombre: unNombre valorBase: unValor

	descripcion := unaDescripcion.
	nombre := unNombre.
	valorBase := unValor.! !


Servicio subclass: #ServicioGuardamuebles
	instanceVariableNames: 'aislamientoTermico guardaLlaves'
	classVariableNames: ''
	package: 'POO-Trabajo-Final-Modelo'!

!ServicioGuardamuebles methodsFor: 'Modificadores' stamp: 'char 5/19/2024 11:29'!
setGuardaLlaves: unaLlave

	guardaLlaves := unaLlave! !

!ServicioGuardamuebles methodsFor: 'Modificadores' stamp: 'char 5/19/2024 11:29'!
setAislamientoTermico: unAislamiento

	aislamientoTermico := unAislamiento! !


!ServicioGuardamuebles methodsFor: 'Aplicación' stamp: 'Marisol 3/15/2025 19:14'!
aCadenaServicio

	| cadena |
	cadena := super aCadenaServicio.


	cadena := cadena , Character cr asString , 'Aislamiento Termico: '
	          , aislamientoTermico asString , Character cr asString
	          , 'Guardallaves: ' , guardaLlaves asString.

	^ cadena! !


!ServicioGuardamuebles methodsFor: 'Observadores' stamp: 'char 5/19/2024 11:26'!
getAislamientoTermico

	^ aislamientoTermico! !

!ServicioGuardamuebles methodsFor: 'Observadores' stamp: 'char 5/19/2024 11:26'!
getGuardaLlaves

	^ guardaLlaves! !


!ServicioGuardamuebles methodsFor: 'Inicializadores' stamp: 'Marisol 3/15/2025 17:18'!
iniciar: unaDescripcion nombre: unNombre aislamientoTermico: unAislamiento guardaLlave: unaLlave valorBase: unValor

	self iniciar: unaDescripcion nombre: unNombre valorBase: unValor.
	aislamientoTermico := unAislamiento.
	guardaLlaves := unaLlave.
	tipo := 'Guardamuebles'.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

ServicioGuardamuebles class
	instanceVariableNames: ''!

!ServicioGuardamuebles class methodsFor: 'Constructores' stamp: 'Yzk 3/16/2025 19:19'!
crear: unaDescripcion nombre: unNombre aislamientoTermico: unAislamiento guardaLlaves: unaLlave valorBase: unValorBase

	| nuevoServicioGuardamueble |
	nuevoServicioGuardamueble := self new.

	nuevoServicioGuardamueble
		iniciar: unaDescripcion
		nombre: unNombre
		aislamientoTermico: unAislamiento
		guardaLlave: unaLlave
		valorBase: unValorBase. "Le ponemos un valor base ya definido"

	^ nuevoServicioGuardamueble! !


Servicio subclass: #ServicioMudanza
	instanceVariableNames: 'valorAdEmbalaje valorAdAltura capacidad'
	classVariableNames: ''
	package: 'POO-Trabajo-Final-Modelo'!

!ServicioMudanza methodsFor: 'Inicializadores' stamp: 'Yzk 3/16/2025 19:08'!
iniciar: unaDescripcion nombre: unNombre valorBase: unValorBase valorEmbalaje: unValorEmbalaje valorAltura: unValorAltura capcidad: unaCapacidad

	self iniciar: unaDescripcion nombre: unNombre valorBase: unValorBase.
	valorAdEmbalaje := unValorEmbalaje.
	valorAdAltura := unValorAltura.
	capacidad := unaCapacidad! !


!ServicioMudanza methodsFor: 'Observadores' stamp: 'char 8/6/2024 13:36'!
getValorAdAltura

	^ valorAdAltura! !

!ServicioMudanza methodsFor: 'Observadores' stamp: 'char 8/6/2024 13:36'!
getValorAdEmbalaje

	^ valorAdEmbalaje! !

!ServicioMudanza methodsFor: 'Observadores' stamp: 'char 5/19/2024 11:34'!
getCapacidad

	^ capacidad! !


!ServicioMudanza methodsFor: 'Aplicación' stamp: 'Marisol 3/15/2025 19:14'!
aCadenaServicio

	| cadena |
	cadena := super aCadenaServicio.

	cadena := cadena , Character cr asString, 'Valor Embalaje: ' , valorAdEmbalaje asString
	          , Character cr asString, 'Valor Altura: ' , valorAdAltura asString
	          , Character cr asString ,'Capacidad: ' , capacidad asString.
	^ cadena! !


!ServicioMudanza methodsFor: 'Modificadores' stamp: 'char 8/6/2024 13:37'!
setValorAdAltura: unValorAdAltura

	valorAdAltura := unValorAdAltura! !

!ServicioMudanza methodsFor: 'Modificadores' stamp: 'char 5/19/2024 11:36'!
setCapacidad: unaCapacidad

	capacidad := unaCapacidad! !

!ServicioMudanza methodsFor: 'Modificadores' stamp: 'char 8/6/2024 13:37'!
setValorAdEmbalaje: unValorAdEmbalaje

	valorAdEmbalaje := unValorAdEmbalaje! !


ServicioMudanza subclass: #MudanzaInternacional
	instanceVariableNames: 'valorAdAduana valorAdTransporte seguroInternacional'
	classVariableNames: ''
	package: 'POO-Trabajo-Final-Modelo'!

!MudanzaInternacional methodsFor: 'Inicializadores' stamp: 'char 3/17/2025 02:05'!
iniciar: unaDescripcion nombre: unNombre capacidad: unaCapacidad seguroInternacional: unSeguroInternacional valorAduana: unValorAduana valorTransporte: unValorTransporte valorEmbalaje: unValorEmbalaje valorAltura: unValorAltura valorBase: unValorBase

	self
		iniciar: unaDescripcion
		nombre: unNombre
		valorBase: unValorBase
		valorEmbalaje: unValorEmbalaje
		valorAltura: unValorAltura
		capcidad: unaCapacidad.
	tipo := 'Mudanza Internacional'.
	valorAdAduana := unValorAduana.
	valorAdTransporte := unValorTransporte.
	seguroInternacional := unSeguroInternacional! !


!MudanzaInternacional methodsFor: 'Observadores' stamp: 'char 8/6/2024 13:40'!
getValorAdTransporte

	^ valorAdTransporte! !

!MudanzaInternacional methodsFor: 'Observadores' stamp: 'char 8/6/2024 13:40'!
getValorAdAduana

	^ valorAdAduana! !

!MudanzaInternacional methodsFor: 'Observadores' stamp: 'char 7/31/2024 17:14'!
getSeguroInternacional

	^ seguroInternacional! !


!MudanzaInternacional methodsFor: 'Modificadores' stamp: 'char 7/31/2024 17:18'!
setSeguroInternacional: unSeguroInternacional

	seguroInternacional := unSeguroInternacional! !

!MudanzaInternacional methodsFor: 'Modificadores' stamp: 'char 8/6/2024 13:40'!
setValorAdTransporte: unValorAdTransporte

	valorAdTransporte := unValorAdTransporte! !

!MudanzaInternacional methodsFor: 'Modificadores' stamp: 'char 8/6/2024 13:40'!
setValorAdAduana: unValorAdAduana

	valorAdAduana := unValorAdAduana! !


!MudanzaInternacional methodsFor: 'Aplicación' stamp: 'Yzk 3/16/2025 19:11'!
aCadenaServicio

	| cadena |
	cadena := super aCadenaServicio.

	cadena := cadena , Character cr asString , 'Valor Adicional Aduana: '
	          , valorAdAduana asString , Character cr asString
	          , 'Valor Adicional Transporte: ' , valorAdTransporte asString
	          , Character cr asString , 'Seguro Internacional: '
	          , seguroInternacional asString.

	^ cadena! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

MudanzaInternacional class
	instanceVariableNames: ''!

!MudanzaInternacional class methodsFor: 'Constructores' stamp: 'Yzk 3/16/2025 19:17'!
crear: unaDescripcion nombre: unNombre valorBase: unValorBase capacidad: unaCapacidad seguroInternacional: unSeguroInternacional valorAduana: unValorAduana valorTransporte: unValorTransporte valorEmbalaje: unValorEmbalaje valorAltura: unValorAltura

	| nuevaMudanzaInternacional |
	nuevaMudanzaInternacional := self new.

	nuevaMudanzaInternacional
		iniciar: unaDescripcion
		nombre: unNombre
		capacidad: unaCapacidad
		seguroInternacional: unSeguroInternacional
		valorAduana: unValorAduana
		valorTransporte: unValorTransporte 
		valorEmbalaje: unValorEmbalaje 
		valorAltura: unValorAltura 
		valorBase: unValorBase .


	^ nuevaMudanzaInternacional! !


ServicioMudanza subclass: #MudanzaLocal
	instanceVariableNames: 'ofreceCargas ofreceDescargas'
	classVariableNames: ''
	package: 'POO-Trabajo-Final-Modelo'!

!MudanzaLocal methodsFor: 'Modificadores' stamp: 'char 5/20/2024 21:20'!
setOfreceDescargas: unOfreceDescargas

	ofreceDescargas := unOfreceDescargas! !

!MudanzaLocal methodsFor: 'Modificadores' stamp: 'char 5/20/2024 21:20'!
setOfreceCargas: unOfreceCargas

	ofreceCargas := unOfreceCargas! !


!MudanzaLocal methodsFor: 'Aplicación' stamp: 'Marisol 3/15/2025 19:15'!
aCadenaServicio

	| cadena |
	cadena := super aCadenaServicio.
	cadena := cadena , Character cr asString, 'Ofrece Carga: ' , ofreceCargas asString
	          , Character cr asString, 'Ofrece Descarga: ' , ofreceDescargas asString.

	^ cadena! !


!MudanzaLocal methodsFor: 'Inicializadores' stamp: 'char 3/17/2025 02:05'!
iniciar: unaDescripcion nombre: unNombre valorBase: unValorBase valorEmbalaje: unValorEmbalaje valorAltura: unValorAltura capcidad: unaCapacidad ofreceCarga: ofreceC ofreceDescarga: ofreceD

	self
		iniciar: unaDescripcion
		nombre: unNombre
		valorBase: unValorBase
		valorEmbalaje: unValorEmbalaje
		valorAltura: unValorAltura
		capcidad: unaCapacidad.
	tipo := 'Mudanza Local'.
	ofreceCargas := ofreceC.
	ofreceDescargas := ofreceD! !


!MudanzaLocal methodsFor: 'Observadores' stamp: 'char 5/20/2024 21:19'!
getOfreceCargas

	^ ofreceCargas! !

!MudanzaLocal methodsFor: 'Observadores' stamp: 'char 5/20/2024 21:19'!
getOfreceDescargas

	^ ofreceDescargas! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

MudanzaLocal class
	instanceVariableNames: ''!

!MudanzaLocal class methodsFor: 'Constructores' stamp: 'Yzk 3/16/2025 19:16'!
crear: unaDescripcion nombre: unNombre valorBase: unValorBase valorEmbalaje: unValorEmbalaje valorAltura: unValorAltura capcidad: unaCapacidad ofreceCarga: ofreceC ofreceDescarga: ofreceD

	| nuevaMudanzaLocal |
	nuevaMudanzaLocal := self new.

	nuevaMudanzaLocal
		iniciar: unaDescripcion
		nombre: unNombre
		valorBase: unValorBase
		valorEmbalaje: unValorEmbalaje 
		valorAltura: unValorAltura
		capcidad: unaCapacidad
		ofreceCarga: ofreceC
		ofreceDescarga: ofreceD.

	^ nuevaMudanzaLocal! !


ServicioMudanza subclass: #MudanzaNacional
	instanceVariableNames: 'valorAdSeguro valorAdDistancia valorAdReprogramacion'
	classVariableNames: ''
	package: 'POO-Trabajo-Final-Modelo'!

!MudanzaNacional methodsFor: 'Observadores' stamp: 'Marisol 3/14/2025 10:58'!
getValorAdSeguro 
^ valorAdSeguro.
! !

!MudanzaNacional methodsFor: 'Observadores' stamp: 'char 8/6/2024 13:45'!
getValorAdDistancia

	^ valorAdDistancia! !

!MudanzaNacional methodsFor: 'Observadores' stamp: 'Marisol 3/14/2025 10:56'!
getValorAdReprogramacion

^valorAdReprogramacion.
! !


!MudanzaNacional methodsFor: 'Modificadores' stamp: 'char 8/6/2024 13:46'!
setValorAdSeguro: unValorAdSeguro

	valorAdSeguro := unValorAdSeguro! !

!MudanzaNacional methodsFor: 'Modificadores' stamp: 'char 8/6/2024 13:46'!
setValorAdDistancia: unValorAdDistancia

	valorAdDistancia := unValorAdDistancia! !


!MudanzaNacional methodsFor: 'Aplicación' stamp: 'Marisol 3/15/2025 19:15'!
aCadenaServicio

	| cadena |
	cadena := super aCadenaServicio.

	cadena := cadena , Character cr asString ,'Valor Seguro:' , valorAdSeguro asString
	          , Character cr asString ,'Valor Distancia: ' , valorAdDistancia asString
	          , Character cr asString ,' Valor Reprogramacion: '
	          , valorAdReprogramacion asString.
	^ cadena! !


!MudanzaNacional methodsFor: 'Inicializadores' stamp: 'char 3/17/2025 02:06'!
iniciar: unaDescripcion nombre: unNombre valorBase: unValorBase valorEmbalaje: unValorEmbalaje valorAltura: unValorAltura capcidad: unaCapacidad valorSeguro: unValorSeguro valorDistancia: unValorDistancia valorReprogramacion: unValorReprogramacion

	self
		iniciar: unaDescripcion
		nombre: unNombre
		valorBase: unValorBase
		valorEmbalaje: unValorEmbalaje
		valorAltura: unValorAltura
		capcidad: unaCapacidad.
	valorAdSeguro := unValorSeguro.
	valorAdDistancia := unValorDistancia.
	tipo := 'Mudanza Nacional'.
	valorAdReprogramacion := unValorReprogramacion! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

MudanzaNacional class
	instanceVariableNames: ''!

!MudanzaNacional class methodsFor: 'Constructores' stamp: 'Yzk 3/16/2025 19:18'!
crear: unaDescripcion nombre: unNombre valorBase: unValorBase valorEmbalaje: unValorEmbalaje valorAltura: unValorAltura capcidad: unaCapacidad valorSeguro: unValorSeguro valorDistancia: unValorDistancia valorReprogramacion: unValorReprogramacion

	| nuevaMudanzaNacional |
	nuevaMudanzaNacional := self new.

	nuevaMudanzaNacional
		iniciar: unaDescripcion
		nombre: unNombre
		valorBase: unValorBase 
		valorEmbalaje: unValorEmbalaje 
		valorAltura: unValorAltura 
		capcidad: unaCapacidad
		valorSeguro: unValorSeguro 
		valorDistancia: unValorDistancia 
		valorReprogramacion: unValorReprogramacion .

	^ nuevaMudanzaNacional! !
