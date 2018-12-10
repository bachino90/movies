# Movies

![GIF](rappmovie.gif)

## Arquitectura del proyecto

![Diagram](diagram.png)

Los `TableViewController` son los responsables de mostrar la información obtenida de los `StateViewModel`. Para ello cada view model tiene un `state`, el cual puede tener los siguientes valores:

  - `initial`
  - `loading`
  - `sucess`
  - `error`

Los cambios del `state` son escuchados por los `TableViewController` los cuales saben que presentar en cada caso (`stateHasChanged`).

Los `StateViewModel` son los encargados de hacer los request y estructurarlos en `Section` y `Row` los cuales son utilizados por los `TableViewController` para definir que mostrar.

El `APIStore` es responsable de devolver los observables que hacen el request a la API (o devuelven los request cacheados)

## Clases

- `Model` y sus subclases son responsables de parsear (utilizando `SwiftyJSON`) las respuestas del la API.

- Protocolo `RouterRequest`, cada struct que implementa este protocolo 

- `APIStore` y `NetworkStore` son reponsables de generar los observables que hacen el request a la API (o devuelven los request cacheados)

- `StateViewModel` y subclases son los responsables de susbcribirse a los observables que devuelve el `APIStore` y transformar la respuesta en un array de `Section` y setear el `state` el cual es observado por el ViewController. Además son responsables de la "lógica de negocio"

- `Row` representa una celda en un `UITableView` (o `UICollectionView`)

- `Section` representa una sección de celdas en un `UITableView` (o `UICollectionView`). Cada `Section` tiene un array de `Row`

- `TableViewController` es una subclase de `UIViewController` que implementa un `tableView` (con su `delegate` y `dataSource`) y un array de `Section` el cual es el responsable de actualizar la tabla cuando se setea.

- `CollectionViewController` cumple el mismo proposito que el `TableViewController` pero con un `UICollectionView`

## Preguntas

#### 1. En qué consiste el principio de responsabilidad única? Cuál es su propósito?

Técnicamente hablando el principio de responsabilidad única describe que cada objeto/módulo/clase tiene una única razón para cambiar. Es decir que es responsable de un única tarea.

El propósito de este principio es encapsular funcionalidades que estén relacionadas entre sí en una misma clase/módulo. Otro aspecto importante que sale del principio es tratar de disminuir el acoplamiento entre clases lo mayor posible, que los modulos dependan muy poco entre sí. Si los modulos se vuelven muy dependientes a medida que vayan surgiendo cambios en alguno, el resto de los módulos también se tendrán que actualizar de acuerdo a estos cambios. En cambio desarrollando módulos independientes estas actualizaciones deberían reducirse al mínimo.

Todo estos aspectos hacen que el código sea escalable y mantenible. Reduce el riesgo de que alguna modificación a una clase/módulo genre un bug en otra clase/módulo y por otro lado 

#### 2. Qué características tiene, según su opinión, un “buen” código o código limpio

Un codigo limpio es aquel que

- Las responsabilidades de las clases están claramente definidas y no se superponen
- Mantiene un bajo acomplamiento entre las clases
- Define nombres claros para las clases, métodos y variables
- Respeta el mismo styling del código
