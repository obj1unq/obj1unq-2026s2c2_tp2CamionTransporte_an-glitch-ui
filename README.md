# Camión de transporte

Una empresa de transporte quiere administrar mejor las cargas que lleva un camión, y para eso requiere un sistema que le permita planificar qué cosas puede llevar el camión considerando dos aspectos: no sobrepasar su capacidad y que el destino sea capaz de recibir la carga. 
Por otro lado, las cosas que transporta tienen un nivel de peligrosidad, que es usado para impedir que ciertas cosas demasiado peligrosas circulen en determinadas rutas.

## 1. Elementos a trasportar

A continuación, algunos elementos que puede transportar el camión. De cada uno es importante conocer su peso y nivel de peligrosidad.

* Knight Rider: pesa 500 kilos y su nivel de peligrosidad es 10.
* Arena a granel: el peso es variable, la peligrosidad es 1.
* Bumblebee: pesa 800 kilos y su nivel de peligrosidad es 15 si está transformado en auto o 30 si está como robot.
* Paquete de ladrillos: cada ladrillo pesa 2 kilos, la cantidad de ladrillos que tiene puede variar. La peligrosidad es 2.
* Batería antiaérea: el peso es 300 kilos si está con los misiles o 200 en otro caso. En cuanto a la peligrosidad es 100 si está con los misiles y 0 en otro caso.
* Residuos radiactivos: el peso es variable y su peligrosidad es 200.


## 2. El camión
Se pide modelar un camión que transporta elementos que soporte los siguientes requerimientos:

### 2.1 Carga y descarga
Poder cargar y descargar cosas, considerando que no se puede cargar algo ya cargado ni descargar lo que no contiene el camión.

#### Ejemplo
- A un camión descargado se le carga Bumblebee.
- Asegurarse que en las cosas cargadas sólo esté Bumblebee.
- Cargar ahora a Knight Rider.
- Asegurarse que las cosas cargadas son Bumblebee y Knight Rider.
- Descargar a Bumblebee.
- Asegurarse que en las cosas cargadas sólo esté Knight Rider.
- Intentar cargar a Knight Rider, no se puede porque ya está cargado.
- Intentar descargar a Bumblebee, no se puede porque no estaba cargado.

### 2.2 Todo peso par

Saber si el peso de cada uno de los objetos cargados es un número par.

### Ejemplo
- Para un camión cargado con Bumblebee y 50 kg de arena a granel todo peso es par.
- En cambio, si la arena a granel pesa 51 kg entonces no.

### 2.3 Hay alguno que pesa 
Saber si el camión tiene alguna cosa que pesa exactamente una cantidad de kilogramos dada.

#### Ejemplo

Para un camión cargado con Bumblebee y 50 kg de arena a granel:
- Si se pregunta si hay algo que pesa 50 debe contestar que sí (es verdadero, por la arena).
- Si se pregunta si hay algo que pesa 800 debe contestar que sí (es verdadero, por Bumblebee).
- Si se pregunta si hay algo que pesa 500 debe contestar que no (es falso, ninguno pesa eso).

### 2.4 Peso y exceso de peso

Saber el peso total del camión, que es la suma del peso del camión vacío (tara) y su carga. La tara del camión es de 1000 kilos.

El camión se encuentra excedido de peso si el peso total es superior al peso máximo aceptable, que es de 2500 kilos.

### Ejemplo

Si el camión tiene a Bumblebee y un paquete de 300 ladrillos, entonces el peso total es 2400 y no está excedido de peso. Pero si el paquete de ladrillos contiene 400 ladrillos, entonces el peso total es 2600 y sí está excedido.

### 2.5 El de nivel

Encontrar una cosa cargada cuyo nivel de peligrosidad coincida exactamente con el valor indicado.

#### Ejemplo

Para un camión cargado con Bumblebee en modo auto, la batería antiaérea descargada y los residuos radiactivos: 

- Si se pide algo de nivel 0 debe encontrar a la batería antiaérea.
- Si se pide algo de nivel 15 debe encontrar a Bumblebee.
- Si se pide algo de nivel 200 debe encontrar a los residuos.
- Si se pide algo de nivel 30 debe romper, porque no se encuentra nada.
- Si se cambia a Bumblebee a modo robot y se vuelve a pedir algo de 30, entonces encuentra a Bumblebee.
- Si se carga la batería con misiles y se pide algo de peligrosidad 100 entonces encuentra a la batería.


### 2.6 Cosas peligrosas

Saber:
- Cosas cargadas que estén en el camión que superen cierto nivel de peligrosidad.
- Cosas cargadas que estén en el camión que sean más peligrosas que otra cosa indicada.

Tip: buscá reutilizar el código.

#### Ejemplo:
Para un camión cargado con Knight Rider y la batería antiaérea cargada:

- En las cosas más peligrosas de 15 sólo está la batería antiaérea.
- En las cosas más peligrosas que Bumblebee sólo está la batería antiaérea.
- Las cosas que superan 2 de peligrosidad son Knight Rider y la batería antiaérea.
- Las cosas más peligrosas que el paquete de ladrillos son Knight Rider y la batería antiaérea.
- No hay cosas más peligrosas que 200.
- No hay nada más peligroso que los residuos radiactivos.

### 2.7 Puede circular en ruta
Saber si el camión puede circular en ruta, lo que ocurre si no está excedido de peso y, además, ninguno de los objetos cargados supera el nivel máximo de peligrosidad indicado.

#### Ejemplos:
- Si el camión tiene a Bumblebee en auto y un paquete de 300 ladrillos, puede circular en una ruta con nivel 20.
- Pero si el camión tiene el paquete de 400 ladrillos y Bumblebee en modo auto ya no puede circular en la ruta de nivel 20, por estar excedido de peso.
- Tampoco puede circular en una ruta de nivel 20 si tiene un paquete de 300 ladrillos y Bumblebee está en modo robot.

### 2.8 Más elementos a trasportar

Agregar los siguientes elementos para ser transportadas por el camión:

* Contenedor portuario: un contenedor puede tener otros elementos adentro. El peso es 100 + la suma del peso de todo su contenido. Es tan peligroso como el objeto más peligroso que contiene. Si está vacío, su peligrosidad es 0.

* Embalaje de seguridad: es una cobertura que envuelve a cualquier otro elemento. Su peso equivale al del elemento que envuelve, y su nivel de peligrosidad es la mitad del nivel de peligrosidad del elemento.

### Ejemplos
- El contenedor portuario vacío pesa 100 y su peligrosidad es 0.
- El contenedor portuario que tiene a Knight Rider y 50 kg de arena a granel pesa 650 y su peligrosidad es 10.
- Si el embalaje de seguridad envuelve a Knight Rider, su peso es 500 y su peligrosidad es 5.
- Si el embalaje de seguridad envuelve a Bumblebee en modo auto, su peso es 800 y su peligrosidad 7,5.

### 2.9 Tiene algo cuyo peso está en un rango

Saber si el camión tiene algo cuyo peso está entre dos valores (mínimo y máximo).

#### Ejemplo
Para un camión cargado con Bumblebee y un paquete de 300 ladrillos:
- Tiene algo que pesa entre 5 y 700.
- Tiene algo que pesa entre 5 y 1000.
- No tiene algo que pese entre 900 y 1000.

### 2.10 Elemento más pesado

Conocer el elemento más pesado que tiene el camión, pero atención: se pide _el elemento_ y no su peso.

#### Ejemplo
- Para un camión cargado con Bumblebee y un paquete de 300 ladrillos, la cosa más pesada es Bumblebee.
- Para un camión vacío, no se puede calcular la cosa más pesada.

### 2.11 Pesos

Conocer el peso de cada elemento que tiene el camión.

#### Ejemplo

- Para un camión cargado con Bumblebee y un paquete de 300 ladrillos, los pesos son 800 y 600.  
  Nota: ojo al armar el test, porque para Wollok [800,600] es distinto a [600,800]. A nivel de negocio da igual.

### 2.12 Total de bultos
Cada elemento se puede transportar en uno o más bultos, dependiendo del elemento en sí:

- Knight Rider, arena a granel y residuos radiactivos usan 1 bulto cada uno.
- Bumblebee y embalaje de seguridad usan 2 bultos cada uno.
- Paquete de ladrillos usa 1 bulto hasta 100 ladrillos, 2 bultos si son de 101 a 300 ladrillos, 3 bultos si son 301 o más ladrillos.
- Batería antiaérea: usa 1 bulto si no tiene misiles, 2 si tiene.
- Contenedor portuario: usa 1 bulto más de la cantidad de bultos que usan las cosas que tiene adentro.

Se pide saber la cantidad total de bultos que está transportando el camión.

#### Ejemplos

##### Caso 1
Suponiendo que el camión tiene:
- El contenedor portuario con Knight Rider y Bumblebee.
- El embalaje de seguridad envolviendo los residuos radiactivos.
- Arena a granel.
- Un paquete de 50 ladrillos.
- La batería antiaérea descargada.  
Entonces la cantidad de bultos es: 9.

##### Caso 2
Si el camión tiene:
- Un paquete de 150 ladrillos.
- La batería antiaérea cargada.
- Un contenedor portuario vacío.  
Entonces la cantidad de bultos es 5.

##### Caso 3
Si el camión tiene:
- Un paquete de 350 ladrillos.
- Arena a granel.  
Entonces la cantidad de bultos es 4.

### 2.13 Accidente

Si el camión sufre un accidente, los elementos trasnportados sufren algún efecto. Éstos son los efectos para cada uno:

- Knight Rider: no hace nada.
- Bumblebee: cambia de modo (si estaba en robot pasa a auto y viceversa).
- Paquete de ladrillos: pierde hasta 12 ladrillos. Si tenía menos de 12 queda en 0.
- Arena a granel: agrega 20 kilos.
- Batería antiaérea: descarga los misiles.
- Contenedor portuario: hace que reaccione cada una de las cosas que tiene adentro (por ejemplo, si llevaba a Bumblebee, éste queda en modo robot).
- Residuos radiactivos: agrega 15 kilos.
- Embalaje de seguridad: nada.

Se pide modelar que un camión sufre un accidente, aplicando los efectos a los elementos cargados.

#### Ejemplos

##### Caso 1

Suponiendo que el camión tiene:
- El contenedor portuario con Knight Rider y Bumblebee en modo auto.
- El embalaje de seguridad envolviendo 30 kg de residuos radiactivos. 
- 50 kg de arena a granel.
- Un paquete de 100 ladrillos.
- La batería antiaérea cargada.  

Al producirse un accidente:
- Bumblebee queda en modo robot.
- Residuos radiactivos quedan con 30 kg de peso.
- La arena queda con 70 kg.
- El paquete de ladrillos queda con 88 ladrillos.
- La batería antiaérea queda descargada.

##### Caso 2
Suponiendo que el camión tiene:
- Bumblebee en modo robot.
- 30 kg de residuos radiactivos. 
- Un paquete de 10 ladrillos.
- La batería antiaérea descargada.  

Al producirse un accidente:
- Bumblebee queda en modo auto.
- Residuos radiactivos quedan con 45 kg de peso.
- El paquete de ladrillos queda con 0 ladrillos.
- La batería antiaérea queda descargada.
  

## 3 Transporte

El camión transporta los elementos al almacén. Al llegar al almacén, todo su contenido se almacena: el camión queda vacío y el almacén se queda con los elementos que ya tenía más aquellos transportados por el camión.

Por ejemplo, si el camión tiene a Knight Rider y a Bumblebee, mientras que en el almacén está la arena a granel, cuando el camión llega éste queda vacío y en el almacén quedan Bumblebee, arena a granel y Knight Rider.

El viaje puede ser por la ruta 9 o por caminos vecinales. Esta elección se hace al momento de realizar el transporte.

Para que el transporte pueda ser realizado debe cumplirse con las siguientes condiciones: el camino debe soportar el viaje:
* La ruta 9 soporta viajes según el requerimiento "puede circular en ruta" (resuelto anteriormente) con un nivel de peligrosidad de 20.
* Los caminos vecinales soportan viajes de vehículos que no superen el peso máximo permitido, el cual es configurable. 

Se pide que el camión entienda el mensaje `transportar(destino, camino)`. Donde destino es el almacén (pero se parametriza porque podrían aparecer otros lugares) y el camino es una de las dos opciones (ruta 9 o caminos vecinales, pero también se debe pensar que pueda haber otros caminos polimórficos).

Es importante realizar las validaciones correspondientes.

#### Ejemplo

Para todos los casos, el almacén tiene a Knight Rider y residuos radiactivos.  
El camión arranca teniendo a Bumblebee en modo auto y arena a granel con 50 kg.

#### Caso: ruta 9 exitoso
El camión puede transportar sin problemas por la ruta 9 hacia el almacén.  
En el almacén quedan Knight Rider, residuos radiactivos, Bumblebee y arena a granel.  
El camión queda vacío.

#### Caso: ruta 9 fallido por peligrosidad
Cambiar el modo de Bumblebee a robot.  
El camión no puede transportar por la ruta 9 hacia el almacén (fallará el nivel de peligrosidad).  
En el almacén quedan Knight Rider y residuos radiactivos.  
En el camión quedan Bumblebee y arena a granel.
 
#### Caso: ruta 9 fallido por exceso de peso
Cambiar el peso de la arena a granel a 2000 kg.  
El camión no puede transportar por la ruta 9 hacia el almacén (fallará por exceso de peso del camión).  
En el almacén quedan Knight Rider y residuos radiactivos.  
En el camión quedan Bumblebee y arena a granel.

#### Caso: caminos vecinales exitoso
Configurar los caminos vecinales con un máximo de 2000 kg de soporte.  
El camión puede transportar sin problemas por los caminos vecinales hacia el almacén.  
En el almacén quedan Knight Rider, residuos radiactivos, Bumblebee y arena a granel.  
El camión queda vacío.

#### Caso: caminos vecinales fallido
Configurar los caminos vecinales con un máximo de 300 kg de soporte.  
El camión no puede transportar por los caminos vecinales hacia el almacén.  
En el almacén quedan Knight Rider y residuos radiactivos.  
En el camión quedan Bumblebee y arena a granel.


## 4 Reflexionar sobre los conceptos

* Realizar un diagrama estático del sistema de objetos

* Describir los polimorfismos asociados a las colecciones: 

   - ¿Qué nombre tiene el tipo de los objetos polimórficos?
   - ¿Qué mensajes componen ese tipo?
   - ¿Qué objetos son los emisores de los mensajes polimórficos?
   