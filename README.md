# Movies

![GIF](rappmovie.gif)

## Arquitectura del proyecto

![Diagram](diagram.png)

El `APIStore` es responsable de devolver los observables que devuelven información 

## Clases

- `Model` y sus subclases son responsables de parsear (utilizando `SwiftyJSON`) las respuestas del la API.

- Protocolo `RouterRequest`, cada struct que implementa este protocolo 

- `APIStore` y `NetworkStore` son reponsables de generar los observables que hacen el request a la API (o devuelven los request cacheados)

- `StateViewModel` y subclases son los responsables de susbcribirse a los observables que devuelve el `APIStore` y transformar la respuesta en un array de `Section` y setear el `state` el cual es observado por el ViewController. Además son responsables de la "lógica de negocio"

- `Row` representa una celda en un `UITableView` (o `UICollectionView`)

- `Section` representa una sección de celdas en un `UITableView` (o `UICollectionView`). Cada `Section` tiene un array de `Row`

## Preguntas

#### 1. En qué consiste el principio de responsabilidad única? Cuál es su propósito?

El principio de responsabilidad única describe que cada objeto/módulo/clase tiene una única razón para cambiar. Es decir que es responsable de un única tarea. 

El propósito de este principio es que el código sea mantenible y escalable.

#### 2. Qué características tiene, según su opinión, un “buen” código o código limpio

Un codigo limpio es aquel que

- Las responsabilidades de las clases están claramente definidas y no se superponen
- Define nombres claros para las clases, metodos y variables
- Respeta el mismo styling del código (sirve usar lint para esto)
