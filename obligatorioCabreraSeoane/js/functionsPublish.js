$(document).ready(inicializo);

function inicializo() {
    comportamientoBotones();
    $("#especie").change(function () {
        console.log($(this));
        cargarEspecie($(this).val());
    });

    $("#razas").change(function () {
        $("#resultado").html($(this).val());
    });
    /*  $("#especie").change(llenarRazas);*/

}

function llenarRazas() {
    var especie_id = $("#especie").val();

}
function cargarEspecie(especie) {
    $.ajax({
        url: "especies.php",
        dataType: "json",
        type: "POST",
        data: "accion=ajax&especie=" + especie,
        timeout: 2000,
        beforeSend: function () {
            //   cargando();
        }
    }).done(function (data) {
        var select = $("#razas").empty();

        select.append("<option value=''> -- Seleccione una raza -- </option>");

        for (var i = 0; i < data.length; i++) {
            var option = $("<option />");
            option.attr("value", data[i].id);
            option.html(data[i].nombre);
            select.append(option);
        }

        // $(cargandoDialog).dialog( "close" );

        // $("#resultado").html( select.val() );
    });


}


function comportamientoBotones() {
   /* $("#paginacion a").click(function (e) {
        e.preventDefault();

        cambiarPagina($(this).attr("alt"));
    });*/
    
        $("#paginacion #numeros").click(function (e) {
        e.preventDefault();

        cambiarPagina($(this).attr("alt"));
    });
}

//  var pagina = {$p};
function cambiarPagina(p) {
    $.ajax({
        url: "obtenerElementos.php",
        dataType: "json",
        type: "POST",
        data: "accion=ajax&p=" + p,
        timeout: 2000,
        beforeSend: function () {
        }
    }).done(function (data) {


        var divPublicaciones = $("#publicaciones").empty();

        var divRow = $("<div />").addClass("row");

        for (var i = 0; i < data.length; i++) {
            var dirCol = $("<div />").addClass("col");
            var divCard = $("<div />").addClass("card");
            divCard.attr("style", "width: 20rem;");
            var divTipo = $("<div />");
            if(data[i].tipo === "P"){
                divTipo.html("Perdido");
                divTipo.addClass("not-found card-header");
            }
            if(data[i].tipo === "E"){
                divTipo.html("Encontrado");
                divTipo.addClass("found card-header");
            }
            var imgTag = $("<img>").addClass("card-img-top");
            imgTag.attr("src", "https://html.com/wp-content/uploads/very-large-flamingo.jpg");
            imgTag.attr("alt", "Card image cap");
            var divCardBody = $("<div />").addClass("card-body");
            var h5Titulo = $("<h5 />").addClass("card-title").html(data[i].titulo);
            var pTag = $("<p />").addClass("card-text").html(data[i].descripcion.substring(0, 150) + "...");
            var aTag = $("<a />").addClass("btn btn-primary").html("Ver Detalles").attr("href", "#");

            divCardBody.append(h5Titulo);
            divCardBody.append(pTag);
            divCardBody.append(aTag);

            divCard.append(divTipo);
            divCard.append(imgTag);
            divCard.append(divCardBody);
            
            dirCol.append(divCard);
            
            divRow.append(dirCol);

           
        }
         divPublicaciones.append(divRow);

    });

}

           