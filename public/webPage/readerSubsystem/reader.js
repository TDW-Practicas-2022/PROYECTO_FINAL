let userId = null

function CargaDatos(){
    //Recuperamos los datos del querystring del URL para poder hacer las operaciones
    const urlParams = new URLSearchParams(window.location.search);
    userId = urlParams.get('userId');

    CargaProductos();
    CargaPersonas();
    CargaEntidades();
    CargaInfoUsuario();
}

function CargaProductos(){
    //Hacemos una peticion GET a la ruta de los productos y trabajamos insertando en el DOM los elementos
    $.ajax({
        type: "GET",
        url: '/api/v1/products',
        headers: {"Authorization": localStorage.getItem('authHeader')},
        // dataType: 'json',
        success: function (data) {
            console.log(data);
            let i = 0
            while (i < data.products.length){
                let producto = {
                    id: data.products[i].product.id,
                    name: data.products[i].product.name,
                    birthDate: data.products[i].product.birthDate,
                    deathDate: data.products[i].product.deathDate,
                    imageUrl: data.products[i].product.imageUrl,
                    wikiUrl: data.products[i].product.wikiUrl,
                    entities: data.products[i].product.entities,
                    persons: data.products[i].product.persons
                };
                MostrarProducto(producto);
                i += 1;
            }
        }
    })
}

function MostrarProducto(item){
    let p = document.createElement("p");
    let text = document.createTextNode(item.name);
    let image = document.createElement("img");

    let detailsButton = document.createElement("button");
    detailsButton.name = "View";
    detailsButton.textContent = "View";
    detailsButton.setAttribute("onclick", "DetailsProducto(\""+item.id+"\")")

    image.src=item.imageUrl;
    image.className="imageProducto"

    p.appendChild(image);
    p.appendChild(text);
    p.appendChild(detailsButton);

    let producto = document.createElement("div");
    producto.className="producto";
    producto.id="producto-"+item.name;
    producto.appendChild(p);
    document.getElementById("div_productos").appendChild(producto);
}

function CargaPersonas(){
    //Hacemos una peticion GET a la ruta de los personas y trabajamos insertando en el DOM los elementos
    $.ajax({
        type: "GET",
        url: '/api/v1/persons',
        headers: {"Authorization": localStorage.getItem('authHeader')},
        // dataType: 'json',
        success: function (data) {
            let i = 0
            while (i < data.persons.length) {
                let person = {
                    id: data.persons[i].person.id,
                    name: data.persons[i].person.name,
                    birthDate: data.persons[i].person.birthDate,
                    deathDate: data.persons[i].person.deathDate,
                    imageUrl: data.persons[i].person.imageUrl,
                    wikiUrl: data.persons[i].person.wikiUrl,
                    entities: data.persons[i].person.entities,
                    products: data.persons[i].person.products
                };
                MostrarPersona(person);
                i += 1;
            }
        }
    })
}

function MostrarPersona(item){
    let p = document.createElement("p");
    let text = document.createTextNode(item.name);
    let image = document.createElement("img");

    let detailsButton = document.createElement("button");
    detailsButton.name = "View";
    detailsButton.textContent = "View";
    detailsButton.setAttribute("onclick", "DetailsPersona(\""+item.id+"\")")

    image.src=item.imageUrl;
    image.className="imagePersona"

    p.appendChild(image);
    p.appendChild(text);
    p.appendChild(detailsButton);

    let persona = document.createElement("div");
    persona.className="persona";
    persona.id="persona-"+item.name;
    persona.appendChild(p);
    document.getElementById("div_personas").appendChild(persona);
}

function CargaEntidades(){
    //Hacemos una peticion GET a la ruta de los entidades y trabajamos insertando en el DOM los elementos
    $.ajax({
        type: "GET",
        url: '/api/v1/entities',
        headers: {"Authorization": localStorage.getItem('authHeader')},
        // dataType: 'json',
        success: function (data) {
            let i = 0
            while (i < data.entities.length) {
                let entity = {
                    id: data.entities[i].entity.id,
                    name: data.entities[i].entity.name,
                    birthDate: data.entities[i].entity.birthDate,
                    deathDate: data.entities[i].entity.deathDate,
                    imageUrl: data.entities[i].entity.imageUrl,
                    wikiUrl: data.entities[i].entity.wikiUrl,
                    persons: data.entities[i].entity.persons,
                    products: data.entities[i].entity.products
                };
                MostrarEntidad(entity);
                i += 1;
            }
        }
    })
}

function MostrarEntidad(item){
    let p = document.createElement("p");
    let text = document.createTextNode(item.name);
    let image = document.createElement("img");


    let detailsButton = document.createElement("button");
    detailsButton.name = "View";
    detailsButton.textContent = "View";
    detailsButton.setAttribute("onclick", "DetailsEntidad(\""+item.id+"\")")

    image.src=item.imageUrl;
    image.className="imageEntidad"

    p.appendChild(image);
    p.appendChild(text);
    p.appendChild(detailsButton);

    let entidad = document.createElement("div");
    entidad.className="entidad";
    entidad.id="entidad-"+item.name;
    entidad.appendChild(p);
    document.getElementById("div_entidades").appendChild(entidad);
}

function CargaInfoUsuario(){
    $.ajax({
        type: "GET",
        url: '/api/v1/users/' + userId,
        headers: {"Authorization": localStorage.getItem('authHeader')},
        // dataType: 'json',
        success: function (data) {
            let p = document.createElement("p");
            let text = document.createTextNode("User: " +data.user.username+ " - Role: " +data.user.role);
            p.appendChild(text);
            document.getElementById("div_info_usuario").appendChild(p);
        }
    });
}

function Logout(){
    location.replace("http://127.0.0.1:8000/webPage/index.html")
}

//Funciones de los botones de details

function DetailsProducto(idProducto){
    location.replace("http://127.0.0.1:8000/webPage/details/detailsProducto.html?idProducto=" +idProducto+ "&userId=" +userId);
}

function DetailsPersona(idPersona){
    location.replace("http://127.0.0.1:8000/webPage/details/detailsPersona.html?idPersona=" +idPersona+ "&userId=" +userId);
}

function DetailsEntidad(idEntidad){
    location.replace("http://127.0.0.1:8000/webPage/details/detailsEntidad.html?idEntidad=" +idEntidad+ "&userId=" +userId);
}

//Funcion para ir al perfil de usuario

function Perfil(){
    location.replace("http://127.0.0.1:8000/webPage/readerSubsystem//perfil/perfilReader.html?userId=" +userId);
}