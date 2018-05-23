# Base de datos: boleteria_progra

El diseño propuesto consta de 13 tablas. A continuación se listan las mismas; cabe aclarar que el orden siguiente
no tiene relevancia con el diseño, es simplemente a modo de introducción a la responsabilidad de cada tabla:

## 1. persona
.. Tabla utilizada para representar a las personas involucradas en el sistema. Con respecto al enunciado, se identifican
.. dos tipos de usuarios (clientes y administradores), que van a compartir los mismos atributos. 
## 2. rol
.. Tabla utilizada para controlar los roles disponibles en el sistema, se identifican por el momento: clientes y administradores.
## 3. direccion
.. Tabla que representa una direccion, consta de una referencia segun lo acostumbrado: Provincia, Canton, Distrito y una descripción
.. para completar la dirección exacta.
## 4. provincia
.. Utilizada para almacenar las provincias
## 5. canton
.. Utilizada para almacenar los cantones de las provincias
## 6. distrito
.. Utilizada para almacenar los distritos de los cantones
## 7. actividad
.. Tabla utilizada para almacenar los shows, espectáculos y demás opciones que vayan a estar disponibles en la aplicación.
## 8. escenario
.. Tabla utilizada para almacenar la información del lugar físico (dígase "escenario") en el que va a realizarse un evento.
## 9. seccion
.. Tabla utilizada para registrar la información de las secciones disponibles en un escenario.
## 10. asiento
.. Tabla utilizada para registrar la lista de todos los asientos disponibles en las secciones (ligadas a un escenario en específico).
## 11. evento
.. Tabla utilizada para representar un evento que estará disponible en el sistema de boleteria. Esta tabla es de las más importantes
.. para el diseño planteado. Un evento representará la presentación de una actividad, en un momento (fecha y hora) determinado, en un
.. escenario en especifico.
## 12. asiento_reservado
.. Tabla empleada para  
