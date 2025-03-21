SimpleButtonMorph subclass: #BotonAccion
	instanceVariableNames: 'bloque'
	classVariableNames: ''
	package: 'POO-Trabajo-Final-Visual'!

!BotonAccion methodsFor: 'event handling' stamp: 'char 8/4/2024 16:14'!
mouseUp: unEvento

	"Este método se ejecuta cuando se produce un evento, como un clic sobre el mouse y su liberación."
	
	super mouseUp: unEvento.
	bloque value.! !


!BotonAccion methodsFor: 'initialization' stamp: 'char 2/11/2025 17:21'!
initialize

	super initialize.
	self color: Color pink darker.! !


!BotonAccion methodsFor: 'accessing' stamp: 'char 8/4/2024 16:15'!
mouseAction: unBloque
	"Este mensaje recibe por parámetro un bloque que indica que acción se ejecutará cuando haya una acción sobre el mouse."
	
	^ bloque := unBloque! !


BorderedMorph subclass: #DatosEmpresa
	instanceVariableNames: 'cadenaDatosEmpresa botonCerrar'
	classVariableNames: ''
	package: 'POO-Trabajo-Final-Visual'!

!DatosEmpresa methodsFor: 'Aplicación' stamp: 'char 2/11/2025 17:34'!
mostrarDatos: objeto empresa: empresa

	| origen titulo |
	origen := objeto innerBounds origin.

	self
		color: Color paleMagenta;
		position: origen + (212 @ 72);
		extent: 600 @ 432.

	titulo := StringMorph new.
	titulo
		contents: 'Datos de Empresa';
		font: (LogicalFont familyName: 'Source Sans Pro' pointSize: 27);
		emphasis: TextEmphasis bold emphasisCode;
		color: Color pink;
		position: self innerBounds origin + (16 @ 16).

	self addMorph: titulo.

	cadenaDatosEmpresa := TextMorph new.
	cadenaDatosEmpresa
		contents: empresa aCadenaDatosEmpresa asString;
		color: Color black;
		position: self innerBounds origin + (100 @ 75).

	self addMorph: cadenaDatosEmpresa.

	botonCerrar := BotonAccion new.

	self addMorph: botonCerrar.

	botonCerrar position: self innerBounds origin + (456 @ 16).

	botonCerrar label: 'Cerrar'.

	botonCerrar extent: 128 @ 36.

	botonCerrar mouseAction: [
		cadenaDatosEmpresa delete.
		self delete ].

	objeto addMorph: self.

	self openInWorld! !


BorderedMorph subclass: #EmpresaVisual
	instanceVariableNames: 'empresa fecha botonDatosEmpresa botonListaContratos botonListaServicios botonRegistrarContrato botonRegistrarServicio botonMinimizar botonCerrar'
	classVariableNames: ''
	package: 'POO-Trabajo-Final-Visual'!

!EmpresaVisual methodsFor: 'initialization' stamp: 'Yzk 3/17/2025 11:29'!
initialize

	| origen ventanaDatosEmpresa ventanaListaContratos ventanaListaServicios ventanaRegistrarContrato titulo ventanaRegistrarServicio colServicios alerta |
	super initialize.
	self color: Color paleMagenta.
	self position: 70 @ 70.
	self bounds: (self position extent: 1024 @ 576).

	self iniciarEmpresa.
	self iniciarInstancias.

	empresa addDependent: self.

	origen := self innerBounds origin.

	"fondo := ImageMorph new image: (Form fromFileNamed:
			          'C:\Users\lucas\Documents\Pharo App\DEFINITIVO\TPO FINAL'). ""ruta de imagen""
	fondo position: self position.
	self addMorphBack: fondo."

	alerta := DialogWindowMorph new.
	alerta title:
		'No existe ningún servicio!! Debe registrar un servicio.'.

	titulo := StringMorph new.
	titulo
		contents: 'Programación Orientada a Objetos';
		font: (LogicalFont familyName: 'Source Sans Pro' pointSize: 27);
		emphasis: TextEmphasis bold emphasisCode;
		color: Color pink;
		position: self innerBounds origin + (16 @ 16).

	self addMorph: titulo.

	botonRegistrarContrato := BotonAccion new.
	botonDatosEmpresa := BotonAccion new.
	botonListaContratos := BotonAccion new.
	botonListaServicios := BotonAccion new.
	botonMinimizar := BotonAccion new.
	botonCerrar := BotonAccion new.
	botonRegistrarServicio := BotonAccion new.

	self addMorph: botonRegistrarContrato.
	self addMorph: botonDatosEmpresa.
	self addMorph: botonListaContratos.
	self addMorph: botonListaServicios.
	self addMorph: botonMinimizar.
	self addMorph: botonCerrar.
	self addMorph: botonRegistrarServicio.

	botonDatosEmpresa position: origen + (592 @ 16).
	botonRegistrarContrato position: origen + (240 @ 200).
	botonRegistrarServicio position: origen + (240 @ 304).
	botonListaContratos position: origen + (528 @ 200).
	botonListaServicios position: origen + (528 @ 304).
	botonMinimizar position: origen + (736 @ 16).
	botonCerrar position: origen + (880 @ 16).

	botonDatosEmpresa label: 'Datos de Empresa'.
	botonRegistrarContrato label: 'Registrar Contrato'.
	botonRegistrarServicio label: 'Registrar Servicio'.
	botonListaContratos label: 'Lista de Contratos'.
	botonListaServicios label: 'Lista de Servicios'.
	botonMinimizar label: 'Minimizar'.
	botonCerrar label: 'Cerrar'.

	botonDatosEmpresa extent: 128 @ 36.
	botonRegistrarContrato extent: 256 @ 72.
	botonRegistrarServicio extent: 256 @ 72.
	botonListaContratos extent: 256 @ 72.
	botonListaServicios extent: 256 @ 72.
	botonMinimizar extent: 128 @ 36.
	botonCerrar extent: 128 @ 36.

	ventanaDatosEmpresa := DatosEmpresa new.
	ventanaListaContratos := ListaContratos new.
	ventanaListaServicios := ListaServicios new.
	ventanaRegistrarContrato := RegistrarContrato new.
	ventanaRegistrarServicio := RegistrarServicioVisual new.

	botonRegistrarContrato mouseAction: [
		colServicios := empresa getColServicios.
		"Si no hay ningún servicio, para registrar un contrato debe al menos existir un servicio. Es para ahorrar tiempo."

		colServicios
			ifNotNil: [
			ventanaRegistrarContrato registrarContrato: self empresa: empresa ]
			ifNil: [ alerta openInWorld ] ].

	botonDatosEmpresa mouseAction: [
		ventanaDatosEmpresa mostrarDatos: self empresa: empresa ].

	botonListaContratos mouseAction: [
		ventanaListaContratos mostrarDatos: self empresa: empresa ].

	botonListaServicios mouseAction: [
		ventanaListaServicios mostrarDatos: self empresa: empresa ].

	botonRegistrarServicio mouseAction: [
		ventanaRegistrarServicio registrarServicio: self empresa: empresa ].

	botonMinimizar mouseAction: [ self collapse ].

	botonCerrar mouseAction: [
		self delete.
		ventanaDatosEmpresa delete.
		ventanaListaContratos delete.
		ventanaRegistrarContrato delete.
		ventanaRegistrarServicio delete ]! !

!EmpresaVisual methodsFor: 'initialization' stamp: 'Yzk 3/17/2025 23:02'!
iniciarInstancias

	| contratoG1 contratoG2 contratoG3 contratoG4 contratoML1 contratoML2 contratoML3 contratoML4 contratoMN1 contratoMN2 contratoMN3 contratoMI1 contratoMI2 contratoMI3 cliente1 cliente2 cliente3 cliente4 servicioMudanzaInternacional1 servicioMudanzaLocal1 servicioMudanzaNacional1 servicioGuardamuebles1 contratoML5 contratoMN4 contratoMN5 |
	Contrato iniciarContador.
	ContratoGuardamuebles limiteDias.

	"// ----------------------------- CLIENTES ----------------------------- //"
	cliente1 := Cliente
		            crear: 'Marisol'
		            apellido: 'Pereira'
		            direccion: 'Leguizamon'
		            telefono: 02972407.

	cliente2 := Cliente
		            crear: 'Agustina'
		            apellido: 'Montoya'
		            direccion: 'Cipoletti'
		            telefono: 02998765.

	cliente3 := Cliente
		            crear: 'Lucas'
		            apellido: 'Sepulveda'
		            direccion: 'Centenario'
		            telefono: 0215648.

	cliente4 := Cliente
		            crear: 'Ignacio'
		            apellido: 'Fernandez'
		            direccion: 'Cipolletti'
		            telefono: 029954531.

	"// ----------------------------- SERVICIOS ----------------------------- //"
	servicioMudanzaInternacional1 := MudanzaInternacional
		                                 crear:
		                                 'Servicio transporta mudanza'
		                                 nombre: 'Mudanza A'
		                                 valorBase: 500
		                                 capacidad: 45
		                                 seguroInternacional: 'SI'
		                                 valorAduana: 1500
		                                 valorTransporte: 1000
		                                 valorEmbalaje: 2000
		                                 valorAltura: 100.

	servicioMudanzaLocal1 := MudanzaLocal
		                         crear: 'Ofrece transporte mudanzas'
		                         nombre: 'Mudanza B'
		                         valorBase: 400
		                         valorEmbalaje: 100
		                         valorAltura: 100
		                         capcidad: 23
		                         ofreceCarga: 'SI'
		                         ofreceDescarga: 'SI'.

	servicioMudanzaNacional1 := MudanzaNacional
		                            crear: 'Mudanza hacia chila'
		                            nombre: 'Mudanza C'
		                            valorBase: 1500
		                            valorEmbalaje: 1000
		                            valorAltura: 100
		                            capcidad: 50
		                            valorSeguro: 1500
		                            valorDistancia: 200
		                            valorReprogramacion: 1600.

	servicioGuardamuebles1 := ServicioGuardamuebles
		                          crear: 'Servicio Guardamuebles'
		                          nombre: 'Servicio A'
		                          aislamientoTermico: 'SI'
		                          guardaLlaves: 'NO'
		                          valorBase: 1500.

	"// ----------------------------- CONTRATOS ----------------------------- //"
	"Cancelar sin costo + de 10 días."
	contratoG1 := ContratoGuardamuebles
		              crear: cliente1
		              fechaFirma: Date today
		              servicio: servicioGuardamuebles1
		              tiempoDuracion: 10
		              fechaInicial: (Date newDay: 25 month: 5 year: 2025).

	"Cancelar con costo de 3 a 10 días"
	contratoG2 := ContratoGuardamuebles
		              crear: cliente3
		              fechaFirma: Date today
		              servicio: servicioGuardamuebles1
		              tiempoDuracion: 15
		              fechaInicial: (Date newDay: 21 month: 3 year: 2025).

	"Renovar"
	contratoG3 := ContratoGuardamuebles
		              crear: cliente2
		              fechaFirma: Date today
		              servicio: servicioGuardamuebles1
		              tiempoDuracion: 7
		              fechaInicial: (Date newDay: 25 month: 3 year: 2025).

	"No puede cancelar porque ya pasó la fecha"
	contratoG4 := ContratoGuardamuebles
		              crear: cliente3
		              fechaFirma: (Date newDay: 3 month: 3 year: 2025)
		              servicio: servicioGuardamuebles1
		              tiempoDuracion: 5
		              fechaInicial: (Date newDay: 3 month: 3 year: 2025).

	"Canceclar sin costo + 1 día"
	contratoML1 := ContratoLocal
		               crear: cliente2
		               fechaFirma: Date today
		               servicio: servicioMudanzaLocal1
		               direccionOrigen: 'leguizamon'
		               direccionDestino: 'Buenos Aires'
		               hora: '8:00'
		               fechaInicial: (Date newDay: 20 month: 3 year: 2025).

	"Cancelar con costo - 1 día"
	contratoML2 := ContratoLocal
		               crear: cliente3
		               fechaFirma: Date today
		               servicio: servicioMudanzaLocal1
		               direccionOrigen: 'Neuquen'
		               direccionDestino: 'Centenario'
		               hora: '10:00'
		               fechaInicial: Date today.

	"Reprogramar antes de 2 días"
	contratoML3 := ContratoLocal
		               crear: cliente2
		               fechaFirma: Date today
		               servicio: servicioMudanzaLocal1
		               direccionOrigen: 'Toschi'
		               direccionDestino: 'Alem'
		               hora: '15:00'
		               fechaInicial: (Date newDay: 20 month: 3 year: 2025).

	"Reprogramar de urgencia"
	contratoML4 := ContratoLocal
		               crear: cliente2
		               fechaFirma: Date today
		               servicio: servicioMudanzaLocal1
		               direccionOrigen: 'Toschi'
		               direccionDestino: 'Alem'
		               hora: '15:00'
		               fechaInicial: (Date newDay: 19 month: 3 year: 2025).

	"No puede cancelar porque ya pasó la fecha"
	contratoML5 := ContratoLocal
		               crear: cliente2
		               fechaFirma: (Date newDay: 1 month: 3 year: 2025)
		               servicio: servicioMudanzaLocal1
		               direccionOrigen: 'Toschi'
		               direccionDestino: 'Alem'
		               hora: '15:00'
		               fechaInicial: (Date newDay: 3 month: 3 year: 2025).

	"Cancelar sin costo -7 días"
	contratoMN1 := ContratoNacional
		               crear: cliente1
		               fechaFirma: Date today
		               servicio: servicioMudanzaNacional1
		               direccionOrigen: 'Buenos Aires'
		               direccionDestino: 'Chos malal'
		               hora: '7:00'
		               distancia: 4000
		               fechaInicial: (Date newDay: 19 month: 3 year: 2025).

	"Cancelar con costo + 7 días"
	contratoMN2 := ContratoNacional
		               crear: cliente4
		               fechaFirma: Date today
		               servicio: servicioMudanzaNacional1
		               direccionOrigen: 'Plotier'
		               direccionDestino: 'Cordoba'
		               hora: '05:00'
		               distancia: 7500
		               fechaInicial: (Date newDay: 30 month: 6 year: 2025).

	"No puede cancelar"
	contratoMN3 := ContratoNacional
		               crear: cliente4
		               fechaFirma: (Date newDay: 3 month: 3 year: 2025)
		               servicio: servicioMudanzaNacional1
		               direccionOrigen: 'Buenos Aires'
		               direccionDestino: 'Chos malal'
		               hora: '7:00'
		               distancia: 4000
		               fechaInicial: (Date newDay: 3 month: 3 year: 2025).

	"Reprogramar - 5 días"
	contratoMN4 := ContratoNacional
		               crear: cliente4
		               fechaFirma: Date today
		               servicio: servicioMudanzaNacional1
		               direccionOrigen: 'Plotier'
		               direccionDestino: 'Cordoba'
		               hora: '05:00'
		               distancia: 7500
		               fechaInicial: (Date newDay: 20 month: 3 year: 2025).

	"Reprogramar de urgencia"
	contratoMN5 := ContratoNacional
		               crear: cliente4
		               fechaFirma: Date today
		               servicio: servicioMudanzaNacional1
		               direccionOrigen: 'Plotier'
		               direccionDestino: 'Cordoba'
		               hora: '05:00'
		               distancia: 7500
		               fechaInicial: (Date newDay: 20 month: 5 year: 2025).

	"Cancela de todas formas con costo"
	contratoMI1 := ContratoInternacional
		               crear: cliente1
		               fechaFirma: Date today
		               servicio: servicioMudanzaInternacional1
		               direccionOrigen: 'Bariloche'
		               direccionDestino: 'Chile'
		               hora: '11:00'
		               fechaInicial: (Date newDay: 27 month: 4 year: 2025).

	contratoMI2 := ContratoInternacional
		               crear: cliente3
		               fechaFirma: Date today
		               servicio: servicioMudanzaInternacional1
		               direccionOrigen: 'Buenos Aires'
		               direccionDestino: 'Montevideo'
		               hora: '17:00'
		               fechaInicial: (Date newDay: 19 month: 3 year: 2025).

	contratoMI3 := ContratoInternacional
		               crear: cliente3
		               fechaFirma: (Date newDay: 3 month: 3 year: 2025)
		               servicio: servicioMudanzaInternacional1
		               direccionOrigen: 'Buenos Aires'
		               direccionDestino: 'Montevideo'
		               hora: '17:00'
		               fechaInicial: (Date newDay: 3 month: 3 year: 2025).

	empresa agregarContrato: contratoG1.
	empresa agregarContrato: contratoG2.
	empresa agregarContrato: contratoG3.
	empresa agregarContrato: contratoG4.
	empresa agregarContrato: contratoML1.
	empresa agregarContrato: contratoML2.
	empresa agregarContrato: contratoML3.
	empresa agregarContrato: contratoML4.
	empresa agregarContrato: contratoML5.
	empresa agregarContrato: contratoMN1.
	empresa agregarContrato: contratoMN2.
	empresa agregarContrato: contratoMN3.
	empresa agregarContrato: contratoMN4.
	empresa agregarContrato: contratoMN5.
	empresa agregarContrato: contratoMI1.
	empresa agregarContrato: contratoMI2.
	empresa agregarContrato: contratoMI3.

	empresa agregarServicio: servicioMudanzaInternacional1.
	empresa agregarServicio: servicioMudanzaLocal1.
	empresa agregarServicio: servicioMudanzaNacional1.
	empresa agregarServicio: servicioGuardamuebles1! !

!EmpresaVisual methodsFor: 'initialization' stamp: 'char 12/8/2024 17:12'!
iniciarEmpresa

	| direccion |
	
	direccion := Direccion crear: 'Buenos Aires' nro: 1400 piso: '-' dpto: '-' barrio: '-'.
	
	empresa := Empresa crear: 'MUDANZAS-NQN' direccion: direccion paginaWeb: 'https://www.mudanzasnqn.com.ar/home/' telefono: '+54 123 456 7890'.
	

	! !


BorderedMorph subclass: #ListaContratos
	instanceVariableNames: 'botonRegistrarContrato botonCerrar botonVerContrato botonEditarContrato botonCancelarContrato botonRenovarContrato botonReprogramarContrato ventanaContratos lista contratos'
	classVariableNames: ''
	package: 'POO-Trabajo-Final-Visual'!

!ListaContratos methodsFor: 'data' stamp: 'char 3/17/2025 03:51'!
mostrarDatos: objeto empresa: empresa

	| origen titulo referencias |
	origen := objeto innerBounds origin.
	empresa addDependent: self.

	self
		color: Color paleMagenta;
		position: origen + (212 @ 72);
		extent: 600 @ 428.

	titulo := StringMorph new.
	titulo
		contents: 'Lista de Contratos';
		font: (LogicalFont familyName: 'Source Sans Pro' pointSize: 27);
		emphasis: TextEmphasis bold emphasisCode;
		color: Color pink;
		position: self innerBounds origin + (16 @ 16).

	referencias := StringMorph new.
	referencias
		contents:
			' Identificador, Tipo,  Fecha De Inicio, Nombre Cliente, Cancelado';
		color: Color white;
		position: self innerBounds origin + (16 @ 68);
		font: (LogicalFont familyName: 'Source Sans Pro' pointSize: 10).
	referencias backgroundColor: Color gray darker darker darker.
	referencias extent: 360 @ 20.

	self addMorph: referencias.

	self addMorph: titulo.

	empresa addDependent: self.

	botonCerrar := BotonAccion new.
	botonVerContrato := BotonAccion new.
	botonCancelarContrato := BotonAccion new.
	botonRenovarContrato := BotonAccion new.
	botonReprogramarContrato := BotonAccion new.

	self addMorph: botonCerrar.
	self addMorph: botonVerContrato.
	self addMorph: botonCancelarContrato.
	self addMorph: botonRenovarContrato.
	self addMorph: botonReprogramarContrato.

	botonCerrar position: self innerBounds origin + (456 @ 16).
	botonVerContrato position: self innerBounds origin + (392 @ 68).
	botonCancelarContrato position: self innerBounds origin + (392 @ 140).
	botonRenovarContrato position: self innerBounds origin + (392 @ 212).
	botonReprogramarContrato position:
		self innerBounds origin + (392 @ 284).

	botonCerrar label: 'Cerrar'.
	botonVerContrato label: 'Datos de Contrato'.
	botonCancelarContrato label: 'Cancelar Contrato'.
	botonRenovarContrato label: 'Renovar Contrato'.
	botonReprogramarContrato label: 'Reprogramar Contrato'.

	botonCerrar extent: 128 @ 36.
	botonVerContrato extent: 192 @ 56.
	botonCancelarContrato extent: 192 @ 56.
	botonRenovarContrato extent: 192 @ 56.
	botonReprogramarContrato extent: 192 @ 56.

	ventanaContratos := BorderedMorph new. "Aca deberiamos agregar la lista de contratos"
	ventanaContratos extent: 360 @ 324.
	ventanaContratos color: Color gray darker darker darker darker.
	ventanaContratos position: self innerBounds origin + (16 @ 85).

	self update: empresa.

	self addMorph: ventanaContratos.

	botonCerrar mouseAction: [
		self delete.
		titulo delete.
		referencias delete ].
	botonVerContrato mouseAction: [ self verDatosContrato: empresa ].
	botonCancelarContrato mouseAction: [ self cancelarContrato: empresa ].
	botonRenovarContrato mouseAction: [ self renovarContrato: empresa ].
	botonReprogramarContrato mouseAction: [
		self reprogramarContrato: empresa ].

	objeto addMorph: self.

	self openInWorld! !

!ListaContratos methodsFor: 'data' stamp: 'char 3/17/2025 03:51'!
update: aParameter

	contratos := OrderedCollection new.
	aParameter getColContratos do: [ :cadaContrato |
		contratos add:
			cadaContrato getIdentificador asString , ', ' , 'Contrato '
			, cadaContrato getServicio getTipo , ', '
			, cadaContrato getFechaInicial asDate asString , ', '
			, cadaContrato getNombreCliente asString , ', '
			, cadaContrato getCancelado asString ].

	lista := PluggableListMorph
		         on: contratos
		         list: #yourself
		         selected: nil
		         changeSelected: nil.

	lista position: self innerBounds origin + (16 @ 85).
	lista extent: 360 @ 324.

	ventanaContratos removeAllMorphs.
	ventanaContratos addMorph: lista! !


!ListaContratos methodsFor: 'as yet unclassified' stamp: 'char 3/17/2025 14:50'!
verDatosContrato: empresa

	| alerta contrato id ventanaContrato |
	alerta := DialogWindowMorph new.
	alerta title: 'No existe el identificador ingresado.'.
	id := UIManager default request:
		      'Ingrese el identificador del contrato que quiere ver.'.

	(id = '' or: id isNil) ifTrue: [ ^ self ].
	empresa getColContratos do: [ :cadaContrato |
		cadaContrato getIdentificador asString = id ifTrue: [
			contrato := cadaContrato ] ].
	
	ventanaContrato := VentanaDatosContrato new.
	
	contrato
		ifNil: [ alerta openInWorld ]
		ifNotNil: [ ventanaContrato ventanaDatos: self contrato: contrato ]! !

!ListaContratos methodsFor: 'as yet unclassified' stamp: 'char 3/17/2025 04:09'!
crearListaElementos: contrato

	| elemento respuesta rta alerta |
	respuesta := 1.

	alerta := DialogWindowMorph new.
	alerta title: 'No hay tamaño suficiente!!'.

	rta := contrato verificarTamaño.

	rta
		ifTrue: [
			[ respuesta = 1 ] whileTrue: [
				elemento := UIManager default request: 'Ingrese un elemento'.
				(elemento = '' or: elemento isNil) ifTrue: [ ^ self ].
				contrato agregarElemento: elemento.
				rta := contrato verificarTamaño.
				rta
					ifTrue: [
						respuesta := UIManager default
							             chooseFrom: #( 'Si' 'No' )
							             title:
							             '¿Desea seguir agregando elementos a la lista?' ]
					ifFalse: [
						alerta openCenteredInWorld.
						respuesta := 2 ] ] ]
		ifFalse: [ alerta openCenteredInWorld ]! !

!ListaContratos methodsFor: 'as yet unclassified' stamp: 'Marisol 3/17/2025 15:43'!
reprogramarContrato: empresa

	| alerta alertaDos alertaTres alertaCuatro contrato id rta fecha reprogramarUrgente fechaAux |
	alerta := DialogWindowMorph new.
	alerta title: 'No existe el identificador ingresado.'.

	alertaDos := DialogWindowMorph new.

	alertaTres := DialogWindowMorph new.
	alertaTres title: 'El contrato no fue reprogramado'.

	alertaCuatro := DialogWindowMorph new.
	alertaCuatro title: 'El contrato selecionado no es MUDANZA.'.

	id := UIManager default request:
		      'Ingrese el identificador del contrato que quiere REPROGRAMAR.'.

	(id = '' or: id isNil) ifTrue: [ ^ self ].
	empresa getColContratos do: [ :cadaContrato |
		cadaContrato getIdentificador asString = id ifTrue: [
			contrato := cadaContrato ] ].

	contrato ifNil: [ alerta openInWorld ] ifNotNil: [
		contrato getServicio getTipo = 'Guardamuebles'
			ifTrue: [ alertaCuatro openInWorld ]
			ifFalse: [
			
				fechaAux := UIManager default request:
					            'Ingrese fecha REPROGRAMACIÓN: MM/DD/YYYY'.
				(fechaAux = '' or: fechaAux isNil) ifTrue: [ ^ self ].
				fecha := Date fromString: fechaAux.
				rta := contrato reprogramarMudanza: fecha. "El mensaje se lo mandamos directamente a contrato."

				rta = 'El contrato no pudo ser reprogramado.' ifTrue: [
					reprogramarUrgente := UIManager default
						                      chooseFrom: #( 'Si' 'No' )
						                      title:
						                      'El contrato no pudo ser reprogramado ¿Desea reprogramarlo urgente?'.
					"Si rta:= 1 entonces, eligió 'si' "
					reprogramarUrgente ifNil: [ ^ self ].
					reprogramarUrgente = 1
						ifTrue: [
							contrato reprogramarMudanzaUrgente: fecha.
							rta := 'El contrato fue reprogramado con éxito.' ]
						ifFalse: [ rta := 'El contrato no fue reprogramado.' ] ] ] ].

	alertaDos title: rta.

	alertaDos openCenteredInWorld! !

!ListaContratos methodsFor: 'as yet unclassified' stamp: 'char 3/17/2025 02:13'!
renovarContrato: empresa

	| alerta alertaDos alertaTres alertaCuatro contrato id |
	alerta := DialogWindowMorph new.
	alerta title: 'No existe el identificador ingresado.'.

	alertaDos := DialogWindowMorph new.

	alertaTres := DialogWindowMorph new.
	alertaTres title: 'El contrato no fue renovado'.

	alertaCuatro := DialogWindowMorph new.
	alertaCuatro title: 'El contrato selecionado no es GUARDAMUEBLES.'.

	id := UIManager default request:
		      'Ingrese el identificador del contrato que quiere RENOVAR.'.

	(id = '' or: id isNil) ifTrue: [ ^ self ].
	empresa getColContratos do: [ :cadaContrato |
		cadaContrato getIdentificador asString = id ifTrue: [
			contrato := cadaContrato ] ].

	contrato ifNil: [ alerta openInWorld ] ifNotNil: [
		contrato getServicio getTipo = 'Guardamuebles'
			ifTrue: [
				self crearListaElementos: contrato.
				empresa renovarContrato: contrato getIdentificador.

				alertaDos title: 'El contrato fue renovado con éxito.'
				 ]
			ifFalse: [
				alertaDos title:
					'El contrato seleccionado no es de tipo Guardamuebles.'.
				 ]. alertaDos openInWorld. ]! !

!ListaContratos methodsFor: 'as yet unclassified' stamp: 'Yzk 3/17/2025 17:56'!
cancelarContrato: empresa

	| alerta contrato id rta |
	alerta := DialogWindowMorph new.
	alerta title: 'No existe el identificador ingresado.'.

	id := UIManager default request:
		      'Ingrese el identificador del contrato que quiere CANCELAR.'.

	(id = '' or: id isNil) ifTrue: [ ^ self ].
	
	empresa getColContratos do: [ :cadaContrato |
		cadaContrato getIdentificador asString = id ifTrue: [
			contrato := cadaContrato ] ].

	contrato ifNil: [ alerta openInWorld ] ifNotNil: [
		rta := empresa cancelarContrato: contrato getIdentificador.
		alerta title: rta asString .
		alerta openInWorld ]! !


BorderedMorph subclass: #ListaServicios
	instanceVariableNames: 'botonCerrar botonDatosServicio ventanaServicios lista servicios'
	classVariableNames: ''
	package: 'POO-Trabajo-Final-Visual'!

!ListaServicios methodsFor: 'Aplicación' stamp: 'char 3/17/2025 14:50'!
verDatosServicio: empresa

	| alerta servicio id ventanaServicio |
	alerta := DialogWindowMorph new.
	alerta title: 'No existe el identificador ingresado.'.

	id := UIManager default request: 'Ingrese el nombre del servicio.'.

	(id = '' or: id isNil) ifTrue: [ ^ self ].
	empresa getColServicios do: [ :cadaServicio |
		cadaServicio getNombre = id ifTrue: [ servicio := cadaServicio ] ].

	ventanaServicio := VentanaDatosServicio new.

	servicio
		ifNil: [ alerta openInWorld ]
		ifNotNil: [ ventanaServicio ventanaDatos: self servicio: servicio ]! !

!ListaServicios methodsFor: 'Aplicación' stamp: 'char 3/17/2025 00:35'!
mostrarDatos: objeto empresa: empresa

	| origen titulo referencias |
	origen := objeto innerBounds origin.
	empresa addDependent: self.

	self
		color: Color paleMagenta;
		position: origen + (212 @ 72);
		extent: 600 @ 428.

	titulo := StringMorph new.
	titulo
		contents: 'Lista de Servicios';
		font: (LogicalFont familyName: 'Source Sans Pro' pointSize: 27);
		emphasis: TextEmphasis bold emphasisCode;
		color: Color pink;
		position: self innerBounds origin + (16 @ 16).

	referencias := StringMorph new.
	referencias
		contents: ' Nombre, Tipo de Servicio';
		color: Color white;
		position: self innerBounds origin + (16 @ 68);
		font: (LogicalFont familyName: 'Source Sans Pro' pointSize: 10).
	referencias backgroundColor: Color gray darker darker darker.
	referencias extent: 360 @ 20.

	botonCerrar := BotonAccion new.
	botonDatosServicio := BotonAccion new.

	self addMorph: botonCerrar.
	self addMorph: botonDatosServicio.
	self addMorph: titulo.
	self addMorph: referencias.

	botonCerrar position: self innerBounds origin + (456 @ 16).
	botonDatosServicio position: self innerBounds origin + (392 @ 68).

	botonCerrar label: 'Cerrar'.
	botonDatosServicio label: 'Datos de Servicio'.

	botonCerrar extent: 128 @ 36.
	botonDatosServicio extent: 192 @ 56.

	ventanaServicios := BorderedMorph new.
	ventanaServicios extent: 360 @ 328.
	ventanaServicios color: Color gray darker darker darker darker.
	ventanaServicios position: self innerBounds origin + (16 @ 85).

	self update: empresa.

	self addMorph: ventanaServicios.

	botonCerrar mouseAction: [
		self delete.
		titulo delete.
		referencias delete ].

	botonDatosServicio mouseAction: [ self verDatosServicio: empresa ].

	objeto addMorph: self.

	self openInWorld! !


!ListaServicios methodsFor: 'updating' stamp: 'char 3/16/2025 23:30'!
update: aParameter

	servicios := OrderedCollection new.
	aParameter getColServicios do: [ :cadaServicio |
		servicios add:
			cadaServicio getNombre , ', Servicio ' , cadaServicio getTipo ].

	lista := PluggableListMorph
		         on: servicios
		         list: #yourself
		         selected: nil
		         changeSelected: nil.

	lista position: self innerBounds origin + (16 @ 85).
	lista extent: 360 @ 328.

	ventanaServicios removeAllMorphs.
	ventanaServicios addMorph: lista! !


BorderedMorph subclass: #Registrar
	instanceVariableNames: 'identificador descripcion nombre fecha direccionO direccionD hora distancia fechaReprogramacion reprogramacionUrgente botonRegistrarMudanza botonCerrar botonMinimizar nombreCliente apellidoCliente telefonoCliente elemento1 elemento2 elemento3 elemento4 fechaCalendar'
	classVariableNames: 'origen'
	package: 'POO-Trabajo-Final-Visual'!

!Registrar methodsFor: 'as yet unclassified' stamp: 'Yzk 3/17/2025 17:50'!
registrarMudanza: objeto empresa: empresa

	| fechaInicial cliente nombreServicio servicio contrato alerta rta |
	self
		color: Color paleMagenta;
		position: origen;
		extent: 700 @ 432.

	descripcion := self
		               crearFormulario: 'Descripcion'
		               posicion: origen + (420 @ 396).

	nombreCliente := self
		                 crearFormulario: 'Nombre'
		                 posicion: origen + (20 @ 88).
	apellidoCliente := self
		                   crearFormulario: 'Apellido'
		                   posicion: origen + (20 @ 140).
	telefonoCliente := self
		                   crearFormulario: 'Telefono cliente'
		                   posicion: origen + (20 @ 192).
	direccionO := self
		              crearFormulario:
		              'Direccion origen (barrio, calle, numero)'
		              posicion: origen + (190 @ 88).
	direccionD := self
		              crearFormulario:
		              'Direccion destino (barrio, calle, numero)'
		              posicion: origen + (190 @ 140).
	hora := self crearFormulario: 'Hora' posicion: origen + (190 @ 192).

	nombreServicio := self
		                  crearFormulario: 'Nombre del servicio'
		                  posicion: origen + (20 @ 244).

	elemento3 := self
		             crearFormulario: 'Elemento 3'
		             posicion: origen + (190 @ 244).

	elemento4 := self
		             crearFormulario: 'Elemento 4'
		             posicion: origen + (190 @ 292).
	elemento1 := self
		             crearFormulario: 'Elemento 1'
		             posicion: origen + (20 @ 292).

	elemento2 := self
		             crearFormulario: 'Elemento 2'
		             posicion: origen + (20 @ 344).
	distancia := self
		             crearFormulario: 'Distancia'
		             posicion: origen + (420 @ 344).

	fechaInicial := StringMorph new.
	fechaInicial
		contents: 'Fecha de inicio del contrato';
		font: (TextStyle default fontAt: 48);
		emphasis: TextEmphasis bold emphasisCode;
		color: Color black.

	fechaCalendar := CalendarMorph new.
	fechaCalendar date: Date today.

	fechaInicial position: origen + (420 @ 70).
	fechaCalendar position: origen + (420 @ 90).

	self addMorph: fechaInicial.
	self addMorph: fechaCalendar.

	botonCerrar := BotonAccion new.
	botonRegistrarMudanza := BotonAccion new.

	botonCerrar label: 'Cerrar'.

	botonRegistrarMudanza position: origen + (16 @ 16).

	botonCerrar position: origen + (556 @ 16).
	botonCerrar mouseAction: [ self delete ].
	botonCerrar extent: 128 @ 36.

	self addMorph: botonCerrar.
	self addMorph: botonRegistrarMudanza.

	alerta := DialogWindowMorph new.

	botonRegistrarMudanza mouseAction: [ "Creamos una mudanza"
		servicio := empresa buscarServicio: nombreServicio getText asString.
		rta := servicio isNotNil.
		rta ifTrue: [ rta := servicio getTipo = self getTipo ].
		rta
			ifTrue: [
				cliente := Cliente
					           crear: nombreCliente getText asString
					           apellido: apellidoCliente getText asString
					           direccion: '-'
					           telefono: telefonoCliente getText asString.
				contrato := self registrarContrato: cliente servicio: servicio.
				empresa agregarContrato: contrato.
								alerta title: 'Se registró con éxito.' ]
			ifFalse: [
				alerta title:
					'No se encontró un servicio con ese nombre o el servicio no es del mismo tipo.' ].
		alerta openCenteredInWorld.
		self delete ]! !

!Registrar methodsFor: 'as yet unclassified' stamp: 'Marisol 3/15/2025 17:38'!
registrarContrato:  cliente servicio: s

^ false.
 ! !

!Registrar methodsFor: 'as yet unclassified' stamp: 'Marisol 3/15/2025 17:30'!
getTipo 

^ false.
! !


!Registrar methodsFor: 'genericos' stamp: 'char 2/11/2025 15:32'!
crearFormulario: unNombre posicion: unaPosicion

	| formulario label |
	formulario := RubTextFieldMorph new.

	formulario
		textFont: (TextStyle default fontAt: 48);
		textColor: Color black;
		backgroundColor: Color pink;
		extent: 130 @ 26;
		position: unaPosicion.

	"Agregamos el label"
	label := StringMorph new.
	label
		contents: unNombre;
		font: (TextStyle default fontAt: 48);
		emphasis: TextEmphasis bold emphasisCode;
		color: Color black;
		position: formulario innerBounds origin + (0 @ -14).

	self addMorph: label.
	self addMorph: formulario.

	"Retornamos el formulario para acceder al contenido luego"
	^ formulario! !


Registrar subclass: #GuardamueblesVisual
	instanceVariableNames: 'botonRegistrarContrato direccionCliente fechaDuracion aislamientoTermicoServicio guardaLlavesServicio tiempoDuracionContrato botonAgregar botonEliminar ventanaElementos elementos lista referencia'
	classVariableNames: 'contador limite'
	package: 'POO-Trabajo-Final-Visual'!

!GuardamueblesVisual methodsFor: 'Aplicación' stamp: 'char 3/17/2025 03:27'!
agregarElemento: unElemento

	(unElemento getText asString ~= '' and:
		 botonAgregar color ~= Color gray) ifTrue: [
		elementos add: unElemento getText asString.
		contador := contador + 1.
		self actualizar ].! !


!GuardamueblesVisual methodsFor: 'as yet unclassified' stamp: 'char 3/17/2025 03:26'!
eliminarElemento

	(contador > 0) ifFalse: [ ^ self ].
	elementos removeAt: contador.
	contador := contador - 1.
	self actualizar! !

!GuardamueblesVisual methodsFor: 'as yet unclassified' stamp: 'char 3/17/2025 12:52'!
actualizar

	lista := PluggableListMorph
		         on: elementos
		         list: #yourself
		         selected: nil
		         changeSelected: nil.

	lista position: self innerBounds origin + (420 @ 300).
	lista extent: 200 @ 100.

	referencia := StringMorph new.
	referencia
		contents: ' Cantidad de Elementos: ' , contador asString , ' / 10';
		color: Color white;
		position: self innerBounds origin + (420 @ 280);
		font: (LogicalFont familyName: 'Source Sans Pro' pointSize: 10).
	referencia backgroundColor: Color gray darker darker darker.
	referencia extent: 200 @ 20.

	contador = limite
		ifTrue: [ botonAgregar color: Color gray ]
		ifFalse: [ botonAgregar color: Color pink darker ].

	ventanaElementos removeAllMorphs.
	ventanaElementos addMorph: lista.
	ventanaElementos addMorph: referencia! !

!GuardamueblesVisual methodsFor: 'as yet unclassified' stamp: 'char 3/17/2025 12:53'!
registrarContratoGuardamuebles: objeto empresa: empresa

	| cliente servicio contrato alerta nombreServicio rta |
	origen := objeto innerBounds origin + (162 @ 72).
	self
		color: Color paleMagenta;
		position: origen;
		extent: 700 @ 432.

	botonRegistrarContrato := BotonAccion new.
	botonCerrar := BotonAccion new.
	botonAgregar := BotonAccion new.
	botonEliminar := BotonAccion new.

	nombreCliente := self
		                 crearFormulario: 'Nombre'
		                 posicion: origen + (20 @ 88).

	apellidoCliente := self
		                   crearFormulario: 'Apellido'
		                   posicion: origen + (20 @ 140).

	direccionCliente := self
		                    crearFormulario:
		                    'Direccion (barrio, calle, numero)'
		                    posicion: origen + (211 @ 88). "20 @ 192"

	telefonoCliente := self
		                   crearFormulario: 'Telefono'
		                   posicion: origen + (211 @ 140).

	fecha := StringMorph new.

	fecha
		contents: 'Fecha de inicio del contrato';
		font: (TextStyle default fontAt: 48);
		emphasis: TextEmphasis bold emphasisCode;
		color: Color black.

	fechaCalendar := CalendarMorph new.
	fechaCalendar date: Date today.

	fecha position: origen + (420 @ 80).

	fechaCalendar position: origen + (420 @ 100).

	self addMorph: fecha.

	self addMorph: fechaCalendar.

	nombreServicio := self
		                  crearFormulario: 'Nombre del servicio'
		                  posicion: origen + (20 @ 244).

	descripcion := self
		               crearFormulario: 'Descripcion'
		               posicion: origen + (20 @ 192). "211 @ 88"


	tiempoDuracionContrato := self
		                          crearFormulario: 'Duración (en días)'
		                          posicion: origen + (211 @ 192).

	"En esta sección estará implementado el control de elementos de la col de Elementos"
	ventanaElementos := BorderedMorph new.
	ventanaElementos extent: 200 @ 100.
	ventanaElementos color: Color gray darker darker darker darker.
	ventanaElementos position: self innerBounds origin + (420 @ 300).

	elementos := OrderedCollection new.
	contador := 0.
	limite := 10.

	referencia := StringMorph new.
	referencia
		contents: ' Cantidad de Elementos: ' , contador asString , ' / 10';
		color: Color white;
		position: self innerBounds origin + (420 @ 280);
		font: (LogicalFont familyName: 'Source Sans Pro' pointSize: 10).
	referencia backgroundColor: Color gray darker darker darker.
	referencia extent: 200 @ 20.

	elemento1 := self
		             crearFormulario: 'Introduzca elemento'
		             posicion: origen + (20 @ 292).


	ventanaElementos addMorph: referencia.
	self addMorph: ventanaElementos.
	"Hasta acá"


	botonRegistrarContrato position: origen + (16 @ 16).
	botonCerrar position: origen + (556 @ 16).
	botonAgregar position: origen + (211 @ 292).
	botonEliminar position: origen + (211 @ 322).

	botonRegistrarContrato label: 'Registrar Guardamuebles'.
	botonCerrar label: 'Cerrar'.
	botonAgregar label: 'Agregar'.
	botonEliminar label: 'Eliminar'.

	botonRegistrarContrato extent: 524 @ 36.
	botonCerrar extent: 128 @ 36.
	botonAgregar extent: 60 @ 25.
	botonEliminar extent: 60 @ 25.

	self addMorph: botonRegistrarContrato.
	self addMorph: botonCerrar.
	self addMorph: botonAgregar.
	self addMorph: botonEliminar.

	alerta := DialogWindowMorph new.
	botonRegistrarContrato mouseAction: [
		servicio := empresa buscarServicio: nombreServicio getText asString.
		rta := servicio isNotNil.
		rta ifTrue: [ rta := servicio getTipo = 'Guardamuebles' ].
		rta
			ifTrue: [ "Si el servicio no es nulo.."
				cliente := Cliente
					           crear: nombreCliente getText asString
					           apellido: apellidoCliente getText asString
					           direccion: direccionCliente getText asString
					           telefono: telefonoCliente getText asString.
				tiempoDuracionContrato := tiempoDuracionContrato getText = ''
					                          ifTrue: [ 1 ]
					                          ifFalse: [
					                          tiempoDuracionContrato getText asString
						                          asInteger ].
				contrato := ContratoGuardamuebles
					            crear: cliente
					            fechaFirma: Date today
					            servicio: servicio
					            tiempoDuracion: tiempoDuracionContrato
					            fechaInicial: fechaCalendar date.
				elementos do: [ :cadaElemento |
					contrato agregarElemento: cadaElemento ].
				empresa agregarContrato: contrato.

				alerta title: 'Se registró con éxito.' ]
			ifFalse: [
				alerta title:
					'No existe un servicio con ese nombre o el servicio no es del mismo tipo.' ].

		alerta openCenteredInWorld.

		self delete ].
	botonCerrar mouseAction: [ self delete ].

	botonAgregar mouseAction: [ self agregarElemento: elemento1 ].
	botonEliminar mouseAction: [ self eliminarElemento ].

	objeto addMorph: self.

	self openInWorld! !


Registrar subclass: #MudanzaInternacionalVisual
	instanceVariableNames: 'seguro tipoTransporte'
	classVariableNames: ''
	package: 'POO-Trabajo-Final-Visual'!

!MudanzaInternacionalVisual methodsFor: 'as yet unclassified' stamp: 'Yzk 3/16/2025 20:07'!
registrarContrato: cliente servicio: servicio

	| contrato |
	contrato := ContratoInternacional
		            crear: cliente
		            fechaFirma: Date today
		            servicio: servicio
		            direccionOrigen: direccionO getText asString
		            direccionDestino: direccionD getText asString
		            hora: hora getText asString
		            fechaInicial: fechaCalendar date.

	tipoTransporte getText asString ~= '' ifTrue: [
		contrato setTransporte: tipoTransporte getText asString ].

	"El tipo transporte debe poder asignarse despues."

	^ contrato! !

!MudanzaInternacionalVisual methodsFor: 'as yet unclassified' stamp: 'Yzk 3/16/2025 20:07'!
registrarMudanzaInternacional: objeto empresa: empresa

	self registrarMudanza: objeto empresa: empresa.

	botonRegistrarMudanza label: 'Registrar Mudanza Internacional'.
	botonRegistrarMudanza extent: 524 @ 36.

	empresa addDependent: self.

	seguro := self
		          crearFormulario: 'Tipo seguro ( A, B C)'
		          posicion: origen + (190 @ 344).

	tipoTransporte := self
		                  crearFormulario: 'Tipo de Transporte'
		                  posicion: origen + (420 @ 292).

	objeto addMorph: self.

	self openInWorld! !

!MudanzaInternacionalVisual methodsFor: 'as yet unclassified' stamp: 'char 3/17/2025 04:23'!
getTipo

	^ 'Mudanza Internacional'! !


Registrar subclass: #MudanzaLocalVisual
	instanceVariableNames: 'pestaña ofreceCarga ofreceDescarga'
	classVariableNames: ''
	package: 'POO-Trabajo-Final-Visual'!

!MudanzaLocalVisual methodsFor: 'as yet unclassified' stamp: 'Yzk 3/16/2025 20:07'!
registrarContrato: cliente servicio: servicio

	| contrato |
	contrato := ContratoLocal
		            crear: cliente
		            fechaFirma: Date today
		            servicio: servicio
		            direccionOrigen: direccionO getText asString
		            direccionDestino: direccionD getText asString
		            hora: hora getText asString
		            fechaInicial: fechaCalendar date.
	^ contrato! !

!MudanzaLocalVisual methodsFor: 'as yet unclassified' stamp: 'Marisol 3/15/2025 18:13'!
registrarMudanzaLocal: objeto empresa: empresa

	self registrarMudanza: objeto empresa: empresa.

	botonRegistrarMudanza label: 'Registrar Mudanza Local'.
	botonRegistrarMudanza extent: 524 @ 36.

	empresa addDependent: self.

	ofreceCarga := self
		               crearFormulario: 'Ofrece Carga (true/false)'
		               posicion: origen + (190 @ 344).

	ofreceDescarga := self
		                  crearFormulario: 'Ofrece descarga (true/false)'
		                  posicion: origen + (420 @ 292).

	objeto addMorph: self.

	self openInWorld! !

!MudanzaLocalVisual methodsFor: 'as yet unclassified' stamp: 'char 3/17/2025 04:23'!
getTipo

	^ 'Mudanza Local'! !


Registrar subclass: #MudanzaNacionalVisual
	instanceVariableNames: 'indicacion distanciaRecorrida'
	classVariableNames: ''
	package: 'POO-Trabajo-Final-Visual'!

!MudanzaNacionalVisual methodsFor: 'as yet unclassified' stamp: 'Yzk 3/16/2025 20:07'!
registrarContrato: cliente servicio: servicio

	| contrato d |
	distancia getText asString = ''
		ifTrue: [ d := 0 ]
		ifFalse: [ d := distancia getText asInteger ].

	contrato := ContratoNacional
		            crear: cliente
		            fechaFirma: Date today
		            servicio: servicio
		            direccionOrigen: direccionO getText asString
		            direccionDestino: direccionD getText asString
		            hora: hora getText asString
		            distancia: d
		            fechaInicial: fechaCalendar date.
	^ contrato! !

!MudanzaNacionalVisual methodsFor: 'as yet unclassified' stamp: 'Marisol 3/15/2025 18:13'!
registrarMudanzaNacional: objeto empresa: empresa


	self registrarMudanza: objeto empresa: empresa.

	botonRegistrarMudanza label: 'Registrar Mudanza Nacional'.
	botonRegistrarMudanza extent: 524 @ 36.

	empresa addDependent: self.

	indicacion := self
		              crearFormulario: 'Indicacion'
		              posicion: origen + (190 @ 344).

	distanciaRecorrida := self
		                      crearFormulario: 'Distancia recorrida'
		                      posicion: origen + (420 @ 292).
	objeto addMorph: self.

	self openInWorld! !

!MudanzaNacionalVisual methodsFor: 'as yet unclassified' stamp: 'char 3/17/2025 04:23'!
getTipo

	^ 'Mudanza Nacional'! !


BorderedMorph subclass: #RegistrarContrato
	instanceVariableNames: 'botonCerrar botonContratoGuardamuebles botonContratoLocal botonContratoNacional botonContratoInternacional'
	classVariableNames: ''
	package: 'POO-Trabajo-Final-Visual'!

!RegistrarContrato methodsFor: 'as yet unclassified' stamp: 'char 3/17/2025 00:12'!
registrarContrato: objeto empresa: empresa

	| origen titulo |
	origen := objeto innerBounds origin.

	self
		color: Color paleMagenta;
		position: origen + (212 @ 72);
		extent: 600 @ 432.

	titulo := StringMorph new.
	titulo
		contents: 'Registro de Contratos';
		font: (LogicalFont familyName: 'Source Sans Pro' pointSize: 27);
		emphasis: TextEmphasis bold emphasisCode;
		color: Color pink;
		position: self innerBounds origin + (16 @ 16).


	self addMorph: titulo.

	botonCerrar := BotonAccion new.
	botonContratoGuardamuebles := BotonAccion new.
	botonContratoLocal := BotonAccion new.
	botonContratoNacional := BotonAccion new.
	botonContratoInternacional := BotonAccion new.

	self addMorph: botonCerrar.
	self addMorph: botonContratoGuardamuebles.
	self addMorph: botonContratoLocal.
	self addMorph: botonContratoNacional.
	self addMorph: botonContratoInternacional.

	botonCerrar position: self innerBounds origin + (456 @ 16).
	botonContratoGuardamuebles position:
		self innerBounds origin + (16 @ 68).
	botonContratoLocal position: self innerBounds origin + (16 @ 159).
	botonContratoNacional position: self innerBounds origin + (16 @ 250).
	botonContratoInternacional position:
		self innerBounds origin + (16 @ 341).


	botonCerrar label: 'Cerrar'.
	botonContratoGuardamuebles label: 'Contrato Guardamuebles'.
	botonContratoLocal label: 'Contrato Mudanza Local'.
	botonContratoNacional label: 'Contrato Mudanza Nacional'.
	botonContratoInternacional label: 'Contrato Mudanza Internacional'.

	botonCerrar extent: 128 @ 36.
	botonContratoGuardamuebles extent: 568 @ 75.
	botonContratoLocal extent: 568 @ 75.
	botonContratoNacional extent: 568 @ 75.
	botonContratoInternacional extent: 568 @ 75.

	botonContratoGuardamuebles mouseAction: [
		GuardamueblesVisual new
			registrarContratoGuardamuebles: objeto
			empresa: empresa.
		self delete ].
	botonContratoLocal mouseAction: [
		MudanzaLocalVisual new
			registrarMudanzaLocal: objeto
			empresa: empresa.
		self delete ].
	botonContratoNacional mouseAction: [
		MudanzaNacionalVisual new
			registrarMudanzaNacional: objeto
			empresa: empresa.
		self delete ].
	botonContratoInternacional mouseAction: [
		MudanzaInternacionalVisual new
			registrarMudanzaInternacional: objeto
			empresa: empresa.
		self delete ].
	botonCerrar mouseAction: [
		self delete.
		titulo delete ].

	objeto addMorph: self.

	self openInWorld! !


BorderedMorph subclass: #RegistrarS
	instanceVariableNames: 'origen descripcion nombre valorBase botonRegistrar botonMini botonCerrar'
	classVariableNames: ''
	package: 'POO-Trabajo-Final-Visual'!

!RegistrarS methodsFor: 'genericos' stamp: 'Marisol 3/15/2025 09:44'!
crearFormulario: unNombre posicion: unaPosicion

	| formulario label |
	formulario := RubTextFieldMorph new.

	formulario
		textFont: (TextStyle default fontAt: 48);
		textColor: Color black;
		backgroundColor: Color pink;
		extent: 100 @ 10;
		position: unaPosicion.

	"Agregamos el label"
	label := StringMorph new.
	label
		contents: unNombre;
		font: (TextStyle default fontAt: 48);
		emphasis: TextEmphasis bold emphasisCode;
		color: Color black;
		position: formulario innerBounds origin + (0 @ -14).

	self addMorph: label.
	self addMorph: formulario.

	"Retornamos el formulario para acceder al contenido luego"
	^ formulario! !


!RegistrarS methodsFor: 'as yet unclassified' stamp: 'char 3/17/2025 00:23'!
registrarServicio: objeto empresa: empresa
	"descripcion nombre valorBase botonRegistrar botonMini botonCerrar"

	| servicio alerta rta |
	empresa addDependent: self.

	origen := objeto innerBounds origin + (162 @ 72).
	self
		color: Color paleMagenta;
		position: origen;
		extent: 700 @ 432.

	descripcion := self
		               crearFormulario: 'Descripción del servicio'
		               posicion: origen + (20 @ 144).

	nombre := self
		          crearFormulario: 'Nombre Servicio'
		          posicion: origen + (20 @ 196).
	valorBase := self
		             crearFormulario: 'Valor Base'
		             posicion: origen + (20 @ 244).

	botonCerrar := BotonAccion new.
	botonMini := BotonAccion new.
	botonRegistrar := BotonAccion new.
	botonCerrar label: 'Cerrar'.

	botonCerrar position: origen + (556 @ 16).
	botonCerrar mouseAction: [ self delete ].
	botonCerrar extent: 128 @ 36.
	botonRegistrar := BotonAccion new.
	botonRegistrar position: origen + (16 @ 16).

	botonRegistrar label: 'Registrar Servicio.'.
	botonRegistrar extent: (524 @ 36).

	objeto addMorph: self.
	self openInWorld.

	self addMorph: botonCerrar.
	self addMorph: botonRegistrar.
	botonCerrar mouseAction: [ self delete ].
	alerta := DialogWindowMorph new.
	botonRegistrar mouseAction: [
		rta := empresa verificarNombreServicio: nombre getText asString.
		rta
			ifTrue: [
				servicio := self registrarServicio. "Si rta = true, no existe un servicio con el mismo nombre."
				empresa agregarServicio: servicio.
				empresa update: #ListaContratos.
				alerta title: 'Se registró con éxito su servicio' ]
			ifFalse: [ alerta title: 'Ya existe un servicio con ese nombre!!' ].
		self delete.
		alerta openCenteredInWorld ]! !

!RegistrarS methodsFor: 'as yet unclassified' stamp: 'Marisol 3/15/2025 10:02'!
registrarServicio 
^false.
! !


BorderedMorph subclass: #RegistrarServicioVisual
	instanceVariableNames: 'botonCerrar botonMinimizar botonRegistrar descripcion nombre valorBase botonServicioGuardamueble botonServicioMudanzaN botonServicioMudanzaL botonServicioMudanzaI'
	classVariableNames: ''
	package: 'POO-Trabajo-Final-Visual'!

!RegistrarServicioVisual methodsFor: 'as yet unclassified' stamp: 'char 3/16/2025 22:42'!
registrarServicio: objeto empresa: empresa

	| origen titulo |
	origen := objeto innerBounds origin.
	empresa addDependent: self.

	self
		color: Color paleMagenta;
		position: origen + (212 @ 72);
		extent: 600 @ 432.

	titulo := StringMorph new.
	titulo
		contents: 'Registro de Servicios';
		font: (LogicalFont familyName: 'Source Sans Pro' pointSize: 27);
		emphasis: TextEmphasis bold emphasisCode;
		color: Color pink;
		position: self innerBounds origin + (16 @ 16).

	self addMorph: titulo.

	botonCerrar := BotonAccion new.
	botonServicioGuardamueble := BotonAccion new.
	botonServicioMudanzaN := BotonAccion new.
	botonServicioMudanzaL := BotonAccion new.
	botonServicioMudanzaI := BotonAccion new.

	self addMorph: botonCerrar.
	self addMorph: botonServicioGuardamueble.
	self addMorph: botonServicioMudanzaN.
	self addMorph: botonServicioMudanzaL.
	self addMorph: botonServicioMudanzaI.

	botonCerrar position: self innerBounds origin + (456 @ 16).
	botonServicioGuardamueble position:
		self innerBounds origin + (16 @ 68).
	botonServicioMudanzaL position: self innerBounds origin + (16 @ 159).
	botonServicioMudanzaN position: self innerBounds origin + (16 @ 250).
	botonServicioMudanzaI position: self innerBounds origin + (16 @ 341).

	botonCerrar label: 'Cerrar'.
	botonServicioGuardamueble label: 'Servicio Guardamuebles'.
	botonServicioMudanzaL label: 'Servicio Mudanza Local'.
	botonServicioMudanzaN label: 'Servicio Mudanza Nacional'.
	botonServicioMudanzaI label: 'Servicio Mudanza Internacional'.

	botonCerrar extent: 128 @ 36.
	botonServicioGuardamueble extent: 568 @ 75.
	botonServicioMudanzaL extent: 568 @ 75.
	botonServicioMudanzaN extent: 568 @ 75.
	botonServicioMudanzaI extent: 568 @ 75.

	botonServicioGuardamueble mouseAction: [
		ServicioG new registrarGuardamueble: objeto empresa: empresa.
		self delete. ].

	botonServicioMudanzaL mouseAction: [
		ServicioMudanzaL new registrarMudanzaLocal: objeto empresa: empresa.
		self delete ].

	botonServicioMudanzaN mouseAction: [
		ServicioMudanzaN new
			registrarMudanzaNacional: objeto
			empresa: empresa.
		self delete ].

	botonServicioMudanzaI mouseAction: [
		ServicioMudanzaI new
			registrarMudanzaInternacional: objeto
			empresa: empresa.
		self delete ].
	botonCerrar mouseAction: [
		self delete.
		titulo delete ].

	objeto addMorph: self.

	self openInWorld! !


RegistrarS subclass: #ServicioG
	instanceVariableNames: 'aislamientoTermico guardallaves'
	classVariableNames: ''
	package: 'POO-Trabajo-Final-Visual'!

!ServicioG methodsFor: 'as yet unclassified' stamp: 'char 3/17/2025 00:21'!
registrarGuardamueble: objeto empresa: empresa

	self registrarServicio: objeto empresa: empresa.

	aislamientoTermico := self
		                      crearFormulario: 'Aislamiento termico (S/N) '
		                      posicion: origen + (190 @ 140).
	guardallaves := self
		                crearFormulario: 'Guardallaves (S/N)'
		                posicion: origen + (190 @ 198).

	objeto addMorph: self.
	self openInWorld! !

!ServicioG methodsFor: 'as yet unclassified' stamp: 'Marisol 3/15/2025 10:18'!
registrarServicio

	| servGuardamueble |
	servGuardamueble := ServicioGuardamuebles
		                    crear: descripcion getText asString
		                    nombre: nombre getText asString
		                    aislamientoTermico:
		                    aislamientoTermico getText asString
		                    guardaLlaves: guardallaves getText asString
		                    valorBase: valorBase getText .

	^ servGuardamueble! !


RegistrarS subclass: #ServicioMudanzaV
	instanceVariableNames: 'valorAdEmbalaje valorAdAltura capacidad'
	classVariableNames: ''
	package: 'POO-Trabajo-Final-Visual'!

!ServicioMudanzaV methodsFor: 'as yet unclassified' stamp: 'Marisol 3/15/2025 10:58'!
registrarMudanza: objeto empresa: empresa

	self registrarServicio: objeto empresa: empresa.

	valorAdEmbalaje := self
		                   crearFormulario: 'Valor Ad. Embalaje'
		                   posicion: origen + (190 @ 140).

	valorAdAltura := self
		                 crearFormulario: 'Valor Adicional Altura'
		                 posicion: origen + (420 @ 140).

	valorBase := self
		             crearFormulario: 'Valor Base'
		             posicion: origen + (190 @ 198).

	capacidad := self
		             crearFormulario: 'Capacidad'
		             posicion: origen + (20 @ 292).

	objeto addMorph: self.
	self openInWorld! !


ServicioMudanzaV subclass: #ServicioMudanzaI
	instanceVariableNames: 'valorAduana valorAdTransporte seguroInternacional'
	classVariableNames: ''
	package: 'POO-Trabajo-Final-Visual'!

!ServicioMudanzaI methodsFor: 'as yet unclassified' stamp: 'char 3/17/2025 00:21'!
registrarMudanzaInternacional: objeto empresa: empresa

	self registrarMudanza: objeto empresa: empresa.

	valorAduana := self
		               crearFormulario: 'Valor Adicional Aduana '
		               posicion: origen + (420 @ 244).

	valorAdTransporte := self
		                     crearFormulario: 'Valor Adicional transporte'
		                     posicion: origen + (420 @ 198).

	seguroInternacional := self
		                       crearFormulario: 'Seguro Internacional '
		                       posicion: origen + (190 @ 244).

	objeto addMorph: self.
	
self openInWorld! !

!ServicioMudanzaI methodsFor: 'as yet unclassified' stamp: 'Yzk 3/16/2025 20:09'!
registrarServicio

	| servicio |
	servicio := MudanzaInternacional
		            crear: descripcion getText asString
		            nombre: nombre getText asString
		            valorBase: valorBase getText asString
		            capacidad: capacidad getText asString
		            seguroInternacional:
		            seguroInternacional getText asString
		            valorAduana: valorAduana getText
		            valorTransporte: valorAdTransporte getText
		            valorEmbalaje: valorAdEmbalaje getText
		            valorAltura: valorAdAltura getText.
	^ servicio! !


ServicioMudanzaV subclass: #ServicioMudanzaL
	instanceVariableNames: 'ofreceCarga ofreceDescarga'
	classVariableNames: ''
	package: 'POO-Trabajo-Final-Visual'!

!ServicioMudanzaL methodsFor: 'as yet unclassified' stamp: 'char 3/17/2025 00:21'!
registrarMudanzaLocal: objeto empresa: empresa

	self registrarMudanza: objeto empresa: empresa.

	ofreceCarga := self
		               crearFormulario: 'Ofrece Carga'
		               posicion: origen + (190 @ 244).

	ofreceDescarga := self
		                  crearFormulario: 'Ofrece descarga '
		                  posicion: origen + (420 @ 198).

	objeto addMorph: self.
	
	self openInWorld! !

!ServicioMudanzaL methodsFor: 'as yet unclassified' stamp: 'Yzk 3/16/2025 20:09'!
registrarServicio

	| servicio |
	servicio := MudanzaLocal
		            crear: descripcion getText asString
		            nombre: nombre getText asString
		            valorBase: valorBase getText
		            valorEmbalaje: valorAdEmbalaje getText
		            valorAltura: valorAdAltura getText
		            capcidad: capacidad getText asString
		            ofreceCarga: ofreceCarga getText asString
		            ofreceDescarga: ofreceDescarga getText asString.
	^ servicio! !


ServicioMudanzaV subclass: #ServicioMudanzaN
	instanceVariableNames: 'valorAdSeguro valorAdDistancia valorAdReprogramacion'
	classVariableNames: ''
	package: 'POO-Trabajo-Final-Visual'!

!ServicioMudanzaN methodsFor: 'as yet unclassified' stamp: 'char 3/17/2025 00:20'!
registrarMudanzaNacional: objeto empresa: empresa

	self registrarMudanza: objeto empresa: empresa.

	valorAdSeguro := self
		                 crearFormulario: 'Valor Adicional Seguro'
		                 posicion: origen + (420 @ 198).

	valorAdDistancia := self
		                    crearFormulario: 'Valor Adicional Distancia'
		                    posicion: origen + (420 @ 244).

	valorAdReprogramacion := self
		                         crearFormulario: 'Valor Reprogramacion'
		                         posicion: origen + (190 @ 244).

	objeto addMorph: self.
	
	self openInWorld! !

!ServicioMudanzaN methodsFor: 'as yet unclassified' stamp: 'Yzk 3/16/2025 20:09'!
registrarServicio

	| servicio |
	servicio := MudanzaNacional
		            crear: descripcion getText asString
		            nombre: nombre getText asString
		            valorBase: valorBase getText
		            valorEmbalaje: valorAdEmbalaje getText
		            valorAltura: valorAdAltura getText
		            capcidad: capacidad getText asString
		            valorSeguro: valorAdSeguro getText
		            valorDistancia: valorAdDistancia getText asString
		            valorReprogramacion:
		            valorAdReprogramacion getText asString.
			^ servicio! !


BorderedMorph subclass: #VentanaDatosContrato
	instanceVariableNames: 'cadenaDatosContrato botonCerrar titulo'
	classVariableNames: ''
	package: 'POO-Trabajo-Final-Visual'!

!VentanaDatosContrato methodsFor: 'as yet unclassified' stamp: 'char 3/17/2025 14:47'!
ventanaDatos: objeto contrato: contrato

	| origen botonTransporte transporteAux |
	origen := objeto innerBounds origin.
	self
		color: Color paleMagenta;
		position: origen + (-1 @ -49);
		extent: 600 @ 528.
		
	titulo := StringMorph new.
	titulo
		contents: 'Datos del Contrato';
		font: (LogicalFont familyName: 'Source Sans Pro' pointSize: 27);
		emphasis: TextEmphasis bold emphasisCode;
		color: Color pink;
		position: self innerBounds origin + (16 @ 16).

	contrato tipoServicio = 'Mudanza Internacional' ifTrue: [
		contrato verificarTipoTransporte ifTrue: [ "Agregamos un botón para asignar el tipo de transporte"
			botonTransporte := BotonAccion new.

			botonTransporte position: self innerBounds origin + (456 @ 476).
			botonTransporte label: 'Agregar Transporte'.
			botonTransporte extent: 128 @ 36.
			self addMorph: botonTransporte.
			botonTransporte mouseAction: [
				transporteAux := UIManager default request:
					                 'Ingrese el tipo de transporte'.
				(transporteAux = '' or: transporteAux isNil) ifTrue: [ ^ self ].

				contrato setTransporte: transporteAux asString.
				self removeMorph: cadenaDatosContrato.
				cadenaDatosContrato := TextMorph new.
				cadenaDatosContrato
					contents: contrato aCadenaContrato asString;
					color: Color black;
					position: self innerBounds origin + (100 @ 75).
				self addMorph: cadenaDatosContrato ] ] ].

	self addMorph: titulo.

	cadenaDatosContrato := TextMorph new.
	cadenaDatosContrato
		contents: contrato aCadenaContrato asString;
		color: Color black;
		position: self innerBounds origin + (100 @ 75).
	self addMorph: cadenaDatosContrato.

	botonCerrar := BotonAccion new.
	self addMorph: botonCerrar.
	botonCerrar position: self innerBounds origin + (456 @ 16).
	botonCerrar label: 'Cerrar'.
	botonCerrar extent: 128 @ 36.
	botonCerrar mouseAction: [
		self delete.
		cadenaDatosContrato delete.
		titulo delete.
		botonTransporte ifNotNil: [ botonTransporte delete ] ].

	objeto addMorph: self.

	self openInWorld! !


BorderedMorph subclass: #VentanaDatosServicio
	instanceVariableNames: 'cadenaDatosServicio botonCerrar titulo'
	classVariableNames: ''
	package: 'POO-Trabajo-Final-Visual'!

!VentanaDatosServicio methodsFor: 'as yet unclassified' stamp: 'char 3/17/2025 14:30'!
ventanaDatos: objeto servicio: servicio

	| origen |
	origen := objeto innerBounds origin.
	self
		color: Color paleMagenta;
		position: origen + (-1 @ -49);
		extent: 600 @ 528.

	titulo := StringMorph new.
	titulo
		contents: 'Datos del Servicio';
		font: (LogicalFont familyName: 'Source Sans Pro' pointSize: 27);
		emphasis: TextEmphasis bold emphasisCode;
		color: Color pink;
		position: self innerBounds origin + (16 @ 16).

	self addMorph: titulo.

	cadenaDatosServicio := TextMorph new.
	cadenaDatosServicio
		contents: servicio aCadenaServicio asString;
		color: Color black;
		position: self innerBounds origin + (100 @ 75).
	self addMorph: cadenaDatosServicio.

	botonCerrar := BotonAccion new.
	self addMorph: botonCerrar.
	botonCerrar position: self innerBounds origin + (456 @ 16).
	botonCerrar label: 'Cerrar'.
	botonCerrar extent: 128 @ 36.
	botonCerrar mouseAction: [
		self delete.
		cadenaDatosServicio delete.
		titulo delete ].

	objeto addMorph: self.

	self openInWorld! !
