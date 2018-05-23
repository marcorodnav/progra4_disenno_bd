# Base de datos: boleteria_progra

··El diseño propuesto consta de 15 tablas. A continuación se listan las mismas; cabe aclarar que el orden siguiente
no tiene relevancia con el diseño, es simplemente a modo de introducción a la responsabilidad de cada tabla:

## Tablas
### 1. persona

···Tabla utilizada para representar a las personas involucradas en el sistema. Con respecto al enunciado, se identifican
dos tipos de usuarios (clientes y administradores), que van a compartir los mismos atributos. 

### 2. rol
··Tabla utilizada para controlar los roles disponibles en el sistema, se identifican por el momento: clientes y administradores.

### 3. direccion
··Tabla que representa una direccion, consta de una referencia segun lo acostumbrado: Provincia, Canton, Distrito y una descripción
para completar la dirección exacta.
### 4. provincia
··Utilizada para almacenar las provincias
### 5. canton
··Utilizada para almacenar los cantones de las provincias
### 6. distrito
··Utilizada para almacenar los distritos de los cantones
### 7. actividad
··Tabla utilizada para almacenar los shows, espectáculos y demás opciones que vayan a estar disponibles en la aplicación.
### 8. escenario
··Tabla utilizada para almacenar la información del lugar físico (dígase "escenario") en el que va a realizarse un evento.
### 9. seccion
··Tabla utilizada para registrar la información de las secciones disponibles en un escenario.
### 10. asiento
··Tabla utilizada para registrar la lista de todos los asientos disponibles en las secciones (ligadas a un escenario en específico).
### 11. evento
··Tabla utilizada para representar un evento que estará disponible en el sistema de boleteria. Esta tabla es de las más importantes
para el diseño planteado. Un evento representará la presentación de una actividad, en un momento (fecha y hora) determinado, en un
escenario en especifico.
### 12. eventos_por_escenario
··Tabla utilizada para normalizar la relación "muchos a muchos" que existe entre la tabla eventos y la tabla escenarios.
### 13. asiento_reservado
··Tabla empleada para representar un asiento que fue reservado para un evento, y que esta ligado a un boleto de dicho evento.
### 14. estado_reservacion_asiento
··Tabla empleada para los estados de una reserva de un asiento para un evento en particular. Utilizado para controlar el tiempo de gracia
de 5min que tiene un usuario para completar la reserva, indicar que la reserva esta activa o bien, inactivarla cuando el evento ya pasó.
### 15. boleto
··Tabla que representa una compra en la aplicacion. Un boleto mantiene una referencia al evento para el que se compró, el asiento que le
corresponde como reservado y la persona que lo compro. Adicional mantiene un atributo para denotar si es una entrada valida (si el boleto
esta activo). Se consideran inactivos boletos que referencian a un evento de una fecha pasada de la actual.

## Simulación de la interacción de una aplicación con la base de datos propuesta.

   Usualmente, un diseño de base de datos va acompañado de un _diccionario de datos_, pero para ser prácticos, voy a exponer un caso
ficticio de interacción entre una aplicación con la base de datos __boleteria_progra__.
   La información del _diccionario de datos_ se puede deducir facilmente ya sea del Modelo Entidad-Relación o del script sql para la
generación de la base de datos.

### Inicio de caso ejemplo 
#### 1. Creación de registros en tablas utilitarias: _persona_, _provincia_, _canton_, _distrito_, _escenario_, _seccion_, _asiento_.
De primera entrada, la base de datos debe contar con al menos una persona registrada con el rol de administrador. A partir del rol
"administrador" la aplicación determina que el usuario que solicita acceso, tiene permisos totales.

El administrador, como parte de su rol (en una etapa inicial), crea las provincias, cantones de provincias y distritos de cantones. Esto
puede ser facilitado desde la instalación de la base de datos.

Luego de este mantenimiento, debe ingresar la información de los _escenarios_ iniciales que estaran disponibles para la venta de boletos.
Se agrega el Estadio Nacional.

#### 2. Primer evento a ser gestionado a través de la aplicación de boleteria en cuestion.
   Al administrador se le proporcionan los datos del evento a ser gestionado.
   El evento consiste en el concierto de Roger Waters. El administrador debe ingresar primero la información del espectáculo, que es 
almacenado en la tabla _actividad_. Posterior a esto, selecciona el escenario en que va a darse la presentación (escoje el Estadio
Nacional) Completa los campos requeridos de la fecha y la hora del espectáculo.
Una vez completados los datos generales del evento, procede a la creación de las secciones disponibles en el escenario, para el evento
en cuestión.
   Crea las secciones A, B, C, D y gramilla. Es pertiente aclarar que para cada evento, las secciones del escenario deben ser creadas, dado
que para cada actividad la diposición del público es personalizada.
   En la creación de cada seccion se indica si corresponde a una sección con asientos enumerados o si simplemente se desea restringir la cantidad
de personas que van a ser permitidas en dicha sección.
   En el caso de de las secciones A, B, C y D, dado que corresponden a secciones con asientos enumerados, se debe indicar la disposición de los mismos a través de una guía matricial (filas y columnas).


#### 3. Primer cliente interesado en comprar entradas a través de la aplicación
··El cliente llega a la pantalla de registro, completa los datos necesarios y hace inicio de sesión en la aplicación.
··En el "home page" se muestran las actividades disponibles. Al seleccionar la actividad de interés, debe escoger la fecha del
evento al que está interesado asistir.
··Selecciona el concierto de Roger Waters. Ingresa la cantidad de boletos que desea comprar. A partir de este momento la reserva del asiento en particular queda con un estado "pendiente de completar", el cual cambiará ya sea a "reservado" o se eliminara el registro de la tabla _asiento_reservado_ luego de completada la compra o de 5 min. 
··Continua con la compra hasta que hace _chekout_ donde queda registrada la compra de los boletos.




