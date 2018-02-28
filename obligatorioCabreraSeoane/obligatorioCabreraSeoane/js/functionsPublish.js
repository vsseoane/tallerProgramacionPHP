$(document).ready(inicializo);

function inicializo(){
    $("#especie").change(llenarRazas);
    
}

function llenarRazas(){
    var especie_id =  $("#especie").val(); 
    alert("el valor es : " + especie_id);


}