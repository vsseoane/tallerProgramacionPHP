$(document).ready(inicializo);
var estado = " ";
var especie = " ";
var raza = " ";
var barrio = " ";
var palabra = " ";
var palabra = " ";
var cantPagTotal = 10;
function inicializo() {
    var contador = 2;

    $("#botonBuscar").click(cargarDatos);
    comportamientoBotones();
    $("#especie").change(function () {
        console.log($(this));
        cargarEspecie($(this).val());
    });
    $("#razas").change(function () {
        $("#resultado").html($(this).val());
    });
    $('#razas').prop('disabled', true);
    $("#otraFoto").click(function () {
        var input = $("<input />").attr("type", "file");
        input.attr("name", "archivo_" + contador++);
        $("input.ultimoFile").after(input).removeClass("ultimoFile").css("display", "block");
        input.addClass("ultimoFile");
    });
    $("#cantPagTotal").click(cambiarCantidadPaginacion);
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
            $('#razas').prop('disabled', true);
        }
    }).done(function (data) {

        $('#razas').prop('disabled', false);

        var select = $("#razas").empty();

        select.append("<option value=''> Raza </option>");

        for (var i = 0; i < data.length; i++) {
            var option = $("<option />");
            option.attr("value", data[i].id);
            option.html(data[i].nombre);
            select.append(option);
        }
    });
}


function comportamientoBotones() {

    $("#paginacion #numeros").click(function (e) {
        e.preventDefault();
        cambiarPagina($(this).attr("alt"), estado, especie, raza, barrio, palabra, cantPagTotal);
    });
}

function cambiarPagina(p, estado, especie, raza, barrio, palabra, cantPagTotal) {
    console.log("cantPagTotal? " + cantPagTotal);
    $.ajax({
        url: "obtenerElementos.php",
        dataType: "json",
        type: "POST",
        data: "accion=ajax&especie=" + especie + "&p=" + p + "&estado=" + estado + "&raza=" + raza + "&barrio=" + barrio + "&palabra=" + palabra + "&cantPagTotal=" + cantPagTotal,
        timeout: 2000,
        beforeSend: function () {
        }
    }).done(function (arr) {
        comportamientoBotones();
        var data = arr['data'];
        var cantTotalDeLaConsulta = arr['cantTotal'];

        var divPublicaciones = $("#publicaciones").empty();
        var divRow = $("<div />").addClass("row");
        for (var i = 0; i < data.length; i++) {
            var dirCol = $("<div />").addClass("col");
            var divCard = $("<div />").addClass("card");
            divCard.attr("style", "width: 20rem;");
            var divTipo = $("<div />");
            if (data[i].tipo === "P") {
                divTipo.html("Perdido");
                divTipo.addClass("not-found card-header");
            }
            if (data[i].tipo === "E") {
                divTipo.html("Encontrado");
                divTipo.addClass("found card-header");
            }
            var imgTag = $("<img>").addClass("card-img-top");
            imgTag.attr("src", "fotos/" + data[i].id + "/1.jpg");
            imgTag.attr("alt", "Card image cap");
            var divCardBody = $("<div />").addClass("card-body");
            var h5Titulo = $("<a />").addClass("card-title").html(data[i].titulo);
            h5Titulo.attr("target", "_blank");
            h5Titulo.attr("href", "./detallePublicacion.php?id=" + data[i].id);
            var pTag = $("<p />").addClass("card-text").html(data[i].descripcion.substring(0, 150) + "...");
            var aTag = $("<a />").addClass("btn btn-primary").html("Ver Detalles").attr("href", "./detallePublicacion.php?id=" + data[i].id);
            aTag.attr("target", "_blank");
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
        //recalcular paginado
        var cantResultados = cantTotalDeLaConsulta;
        var cantPaginas = Math.floor(cantResultados / cantPagTotal);
        console.log("cantPaginas dividido 10 > " + cantPaginas);
        if ((cantResultados % cantPagTotal) != 0) {
            cantPaginas++;
        }

        console.log("cantResultados en bd: " + cantResultados);
        console.log("cantPaginas > " + cantPaginas);
        var divPaginacion = $("#paginacion").empty();
        divPaginacion.attr("id", "paginacion");
        var nav = $("<nav />").attr("aria-label", "Page navigation example");
        var ul = $("<ul />").addClass("pagination");
        var liPageItem = $("<li />").addClass("page-item");
        var aPageLink = $("<a />").addClass("page-link").attr("href", "#").attr("aria-label", "Previous");
        var spanAriaHidden = $("<span />").attr("aria-hidden", "true").html("&laquo;");
        var spanSrOnly = $("<span />").addClass("sr-only").html("Previous");
        aPageLink.append(spanAriaHidden);
        aPageLink.append(spanSrOnly);
        liPageItem.append(aPageLink);

        ul.append(liPageItem);
        for (var i = 1; i <= cantPaginas; i++) {
            var liPageItemFor = $("<li />").addClass("page-item");
            var aNumeros = $("<a />").addClass("page-link").attr("href", "?p=" + i).attr("alt", i).attr("id", "numeros").html(i);
            liPageItemFor.append(aNumeros);
            ul.append(liPageItemFor);

        }
        var liPageItem2 = $("<li />").addClass("page-item");
        var aPageLink2 = $("<a />").addClass("page-link").attr("href", "#").attr("aria-label", "Next");
        var spanAriaHidden2 = $("<span />").attr("aria-hidden", "true").html("&raquo;");
        var spanSrOnly2 = $("<span />").addClass("sr-only").html("Next");

        aPageLink2.append(spanAriaHidden2);
        aPageLink2.append(spanSrOnly2);
        liPageItem2.append(aPageLink2);

        ul.append(liPageItem2);

        nav.append(ul);
        divPaginacion.append(nav);
        comportamientoBotones();

    }

    );
}

function cargarDatos() {
    estado = $("#estado").val();
    if (estado === '') {
        estado = " ";
    }
    especie = $("#especie").val();
    if (especie === '') {
        especie = " ";
    }
    raza = $("#razas").val();
    if (raza === '') {
        raza = " ";
    }
    barrio = $("#barrio").val();
    if (barrio === '') {
        barrio = " ";
    }
    palabra = $("#palabra").val();
    if (palabra === '') {
        palabra = " ";
    }
    cambiarPagina(1, estado, especie, raza, barrio, palabra, cantPagTotal);
}

function cambiarCantidadPaginacion() {
    cantPagTotal = $("#cantPag").val();
    cambiarPagina(1, estado, especie, raza, barrio, palabra, cantPagTotal);

}