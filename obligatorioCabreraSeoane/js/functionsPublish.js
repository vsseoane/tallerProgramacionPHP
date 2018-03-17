$(document).ready(inicializo);

function inicializo() {

    var contador = 2;

    $("#especie").change(function () {
        console.log($(this));
        cargarEspecie($(this).val());
    });

    $("#razas").change(function () {
        $("#resultado").html($(this).val());
    });
    /*  $("#especie").change(llenarRazas);*/
    $('#razas').prop('disabled', true);

    $("#otraFoto").click(function () {
        var input = $("<input />").attr("type", "file");
        input.attr("name", "archivo_" + contador++);
        $("input.ultimoFile").after(input).removeClass("ultimoFile").css("display", "block");
        input.addClass("ultimoFile");
    });
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

        select.append("<option value=''> Seleccione una Raza </option>");

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

var cargandoDialog = null;
/*function cargando(){
 alert("en cargando");
 cargandoDialog = $( "#dialog-cargando" ).dialog({
 resizable: false,
 height: "auto",
 width: "auto",
 modal: true,
 buttons: {},
 open: function(event, ui) {
 $("#dialog-cargando").parent().find(".ui-dialog-titlebar").hide();               
 }
 });
 
 }*/
            