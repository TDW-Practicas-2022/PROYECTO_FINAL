let userId = null
let personaId = null
let userRole = null

function CargaDetails(){
    //Recuperamos los datos del querystring del URL
    const urlParams = new URLSearchParams(window.location.search);
    userId = urlParams.get('userId');
    personaId = urlParams.get('idPersona');

    CargaInfoUsuario();
    DetallesProducto();
    EntidadesPersona();
    ProductosPersona();
}

function DetallesProducto(){
    $.ajax({
        type: "GET",
        url: '/api/v1/persons/' + personaId ,
        headers: {"Authorization": localStorage.getItem('authHeader')},
        // dataType: 'json',
        success: function (data) {
            let h1 = document.createElement("h1");
            let text_h1 = document.createTextNode("Anales de la Ciencia - "+data.person.name);
            h1.appendChild(text_h1);
            document.getElementById("cabecera_details").appendChild(h1);

            let h2 = document.createElement("h2");
            let text_h2 = document.createTextNode(data.person.name);
            h2.appendChild(text_h2);
            document.getElementById("div_informacion").appendChild(h2);

            let h4_1 = document.createElement("h4");
            let text_h4_1 = document.createTextNode("Birth Date = " +data.person.birthDate);
            h4_1.appendChild(text_h4_1);
            document.getElementById("div_informacion").appendChild(h4_1);

            let h4_2 = document.createElement("h4");
            let text_h4_2 = document.createTextNode("Death Date = " +data.person.deathDate);
            h4_2.appendChild(text_h4_2);
            document.getElementById("div_informacion").appendChild(h4_2);

            let image = document.createElement("img");
            image.src = data.person.imageUrl;
            image.style.width = "450";
            image.style.height = "450";
            image.alt = name;
            document.getElementById("div_informacion").appendChild(image);

            let iframe = document.createElement("iframe");
            iframe.src = data.person.wikiUrl;
            iframe.title = "Wiki " +data.person.name;
            iframe.width = "600";
            iframe.height = "600";
            document.getElementById("div_wiki").appendChild(iframe);
        }
    });
}

function EntidadesPersona(){
    let titulo = document.createElement("h3");
    let text_titulo = document.createTextNode("Entidades relacionadas");
    titulo.appendChild(text_titulo);
    document.getElementById("div_entidades").appendChild(titulo);

    $.ajax({
        type: "GET",
        url: '/api/v1/persons/' + personaId + "/entities",
        headers: {"Authorization": localStorage.getItem('authHeader')},
        // dataType: 'json',
        success: function (data) {
            let i = 0
            while (i < data.entities.length) {
                let p = document.createElement("p");
                let text = document.createTextNode(data.entities[i].entity.name);
                let image = document.createElement("img");

                let detailsButton = document.createElement("button");
                detailsButton.name = "View";
                detailsButton.textContent = "View";
                detailsButton.setAttribute("onclick", "DetailsEntidad("+data.entities[i].entity.id+")")

                image.src=data.entities[i].entity.imageUrl;
                image.className="imageEntidad"

                p.appendChild(image);
                p.appendChild(text);
                p.appendChild(detailsButton);

                document.getElementById("div_entidades").appendChild(p);
                i += 1;
            }
        }
    });
}

function DetailsEntidad(id){
    location.replace("http://127.0.0.1:8000/webPage/details/detailsEntidad.html?userId="+ userId + "&idEntidad=" + id);
}

function ProductosPersona(){
    let titulo = document.createElement("h3");
    let text_titulo = document.createTextNode("Productos relacionados");
    titulo.appendChild(text_titulo);
    document.getElementById("div_productos").appendChild(titulo);

    $.ajax({
        type: "GET",
        url: '/api/v1/persons/' + personaId + "/products",
        headers: {"Authorization": localStorage.getItem('authHeader')},
        // dataType: 'json',
        success: function (data) {
            let i = 0
            while (i < data.products.length) {
                let p = document.createElement("p");
                let text = document.createTextNode(data.products[i].product.name);
                let image = document.createElement("img");

                let detailsButton = document.createElement("button");
                detailsButton.name = "View";
                detailsButton.textContent = "View";
                detailsButton.setAttribute("onclick", "DetailsProducto("+data.products[i].product.id+")")

                image.src=data.products[i].product.imageUrl;
                image.className="imageEntidad"

                p.appendChild(image);
                p.appendChild(text);
                p.appendChild(detailsButton);

                document.getElementById("div_productos").appendChild(p);
                i += 1;
            }
        }
    });
}

function DetailsProducto(id){
    location.replace("http://127.0.0.1:8000/webPage/details/detailsProducto.html?userId="+ userId + "&idProducto=" + id);
}

function CargaInfoUsuario(){
    $.ajax({
        type: "GET",
        url: '/api/v1/users/' + userId,
        headers: {"Authorization": localStorage.getItem('authHeader')},
        // dataType: 'json',
        success: function (data) {
            userRole = data.user.role;

            let p = document.createElement("p");
            let text = document.createTextNode("User: " +data.user.username+ " - Role: " +data.user.role);
            p.appendChild(text);
            document.getElementById("div_info_usuario").appendChild(p);
        }
    });
}

function Volver(){
    if (userRole === "reader"){
        location.replace("http://127.0.0.1:8000/webPage/readerSubsystem/reader.html?userId=" +userId);
    }else{
        location.replace("http://127.0.0.1:8000/webPage/writerSubsystem/writer.html?userId=" +userId);
    }
}