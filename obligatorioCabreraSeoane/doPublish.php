<?php

session_start();
require_once("includes/libs/Smarty.class.php");
require_once 'utils.php';

$usuario = usuarioLogueado();
$titulo = $_POST['titulo'];
$descripcion = $_POST['descripcion'];
$especie = $_POST['especie'];
$raza = $_POST['razas'];
$barrio = $_POST['barrio'];
$tipo = $_POST['estado'];
$latitud = $_POST['latitud'];
$longitud = $_POST['longitud'];

$publicacionId = publicar($usuario['id'], $titulo, $descripcion, $especie, $raza, $barrio, $tipo, $latitud, $longitud);

$dir = "fotos/{$publicacionId}/";

if (!is_dir($dir)) {
    mkdir($dir, 0777);
}

$mensaje = "";
$extensionesPermitidas = array("image/jpg", "image/jpeg" );
$cont = 1;
while (list($clave, $file) = each($_FILES)) {
    
    //Se lleva un contador para guardar el archivo por numero y no por nombre original
    $nombre = $cont . ".jpg";

    $tipoImagen = $file["type"];

    if (in_array($tipoImagen, $extensionesPermitidas)) {

        $tmp = $file["tmp_name"];
        move_uploaded_file($tmp, $dir . $nombre);
        
    }
    
    $cont++;
    
}

$cont = 1;

$smarty = getSmarty();
$smarty->assign("especies", obtenerEspecies());
$smarty->assign("barrios", obtenerBarrios());
$smarty->assign("razas", obtenerRazaBy(1));
$smarty->display("publish.tpl");
?>


