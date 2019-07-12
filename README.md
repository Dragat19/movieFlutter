# moviesDBFlutter

Proyecto Flutter - Películas.

Se debe construir un App Mobile en Flutter que muestre las 20 películas más populares o mejor calificadas con información que se obtiene de TheMovieDB.org (según los criterios seleccionados por el usuario). También contiene una sección para mostrar las películas "favoritas" del usuario.

Para obtener los datos que se necesitan mostrar en la aplicación de TheMovieDB se debe hacer uso de su API. Leer la documentación https://www.themoviedb.org/documentation/api
Requerimientos.

La aplicación tiene dos secciones:
Inicio (pantalla que se ingresa cuando se abre el app)
Favoritos
A estas secciones se las puede acceder a través del bottom bar


Sección Inicio
1 - Cuando acceda por primera vez a la pantalla inicio de la aplicación, se verá un shimmer (shimmer effect) que indica que se están obteniendo los datos. Cuando se hayan recibido los datos y comiencen a cargarse las imágenes, el shimmer permanecerá solamente en la imagen hasta mostrar el póster real una vez que esté completamente cargado (ponerlo como fondo en el pre load de la imagen).

2 - Los carteles de películas se muestran en una grilla. El número de columnas se ajustará automáticamente dependiendo del ancho y la orientación del dispositivo.

3 - Se pueden seleccionar los criterios con los cuales se van a mostrar las películas haciendo click en los tres dots que se encuentran en la parte superior derecha de la pantalla. Al hacer click se mostrará un menú desplegable con las opciones "más populares" y "mejor valoradas". La interfaz de usuario se actualizará automáticamente para responder a esta nueva selección.

4 - Una vez que el usuario haya encontrado una película sobre la que le gustaría tener más información, al hacer clic sobre ella, lo llevará a la pantalla de detalles 
Pantalla de detalles
5- Se muestran datos adicionales de la película, como el póster de la película, el título, año de lanzamiento, calificación promedio del usuario, resumen, trailers y opiniones.

6 - Si hace clic en la miniatura de un tráiler, se lanzará una aplicación para reproducir el video de YouTube correspondiente.

7 - Si hace clic en "Leer comentarios", se mostrará una nueva pantalla con las reseñas de las películas. Los comentarios se muestran en una lista uno abajo del otro (nombre del usuario, fecha y comentario). Si no hay ningún comentario, el botón de comentarios tiene que aparecer invisible.

8 - El usuario puede seleccionar una película como "Favorito" en la pantalla de detalles de la película haciendo clic en un botón de acción flotante con un símbolo de corazón. Esta selección se puede alternar con el mismo botón. Cuando un usuario marca una película como favorito esta aparece en la sección favoritos y el corazón pasa a estar pintado en toda la aplicación

9 - La pantalla de detalles tiene un header que al scrollear (usuario se desplaza hacia abajo) la misma se contrae mostrando solamente el título de la película en una fuente más pequeña para lograr una mejor experiencia del usuario.


Sección Favoritos
10 - Se mostrarán todas las películas que el usuario marcó favoritas.

11 - Los carteles de películas se muestran en una cuadrícula. El número de columnas se ajustará automáticamente dependiendo del ancho y la orientación del dispositivo. 

12 - Si el usuario quiere obtener tener más información, al hacer clic sobre una película, lo llevará a la pantalla de detalles. 

Consultar al siguiente enlace para obtener los assets de UI:
https://www.figma.com/file/DKu3PKQu9qQtlIKp8kWAOWqd/Flutter-pel%C3%ADculas?node-id=0%3A1

Funcionamiento del app:

Evaluación del proyecto.
El proyecto debe ser subido a github y tiene que poder accederse públicamente para poder ser evaluado.
