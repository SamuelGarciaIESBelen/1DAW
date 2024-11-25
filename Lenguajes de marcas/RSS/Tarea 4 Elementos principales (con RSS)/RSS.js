// URL del feed RSS (reemplaza con la URL de tu propio feed)
var feedURL = 'http://darknight.42web.io/feedRSS.xml';

// Función para cargar el feed y mostrarlo en el contenedor
function cargarFeed() {
    fetch(`https://api.rss2json.com/v1/api.json?rss_url=${encodeURIComponent(feedURL)}`)
        .then(response => response.json())
        .then(data => {
            // Verificar si se obtuvo el feed correctamente
            if (data.status === 'ok') {
                mostrarFeed(data.items);
            } else {
                console.error('Error al obtener el feed.');
            }
        })
        .catch(error => {
            console.error('Error de red:', error);
        });
}

// Función para mostrar el feed en el contenedor
function mostrarFeed(items) {
    var contenedor = document.getElementById('blog-feed');

    // Crear elementos HTML para cada artículo del feed
    items.forEach(item => {
        // Crear un DIV para cada artículo del feed
        var contenedorArticulo = document.createElement('div');

        var titulo = document.createElement('h2');
        titulo.textContent = item.title;

        var enlace = document.createElement('a');
        enlace.href = item.link;
        enlace.textContent = 'Leer más';

        // Crear una imagen con el estilo definido
        var imagen = document.createElement('img');
        imagen.src = item.thumbnail;
        imagen.alt = item.title;
        imagen.classList.add('feed-image');

        var descripcion = document.createElement('p');
        descripcion.innerHTML = item.description;

        var separador = document.createElement('hr');

        // Agregar elementos al contenedor del artículo
contenedorArticulo.appendChild(imagen);
contenedorArticulo.appendChild(titulo);
contenedorArticulo.appendChild(descripcion);
contenedorArticulo.appendChild(enlace);
contenedorArticulo.appendChild(separador);

        // Agregar el contenedor del artículo al contenedor principal
        contenedor.appendChild(contenedorArticulo);
    });
}

// Cargar el feed cuando la página se carga completamente
window.addEventListener('load', cargarFeed);