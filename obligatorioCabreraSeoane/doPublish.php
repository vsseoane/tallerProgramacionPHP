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
//$estado = $_POST['estado'];
$tipo = $_POST['estado'];
$latitud = $_POST['latitud'];
$longitud = $_POST['longitud'];

$publicacionId = publicar($usuario['id'], $titulo, $descripcion, $especie, $raza, $barrio, $tipo, $latitud, $longitud);

//$id_publicacion = publicar($especie, $raza,$descripcion,$tipo);

$dir = "fotos/{$publicacionId}/";

if (!is_dir($dir)) {
    mkdir($dir, 0777);
}

$mensaje = "";
$extensionesPermitidas = array("image/png", "image/jpg", "image/jpeg", "image/gif" );

while (list($clave, $file) = each($_FILES)) {

    $nombre = $file["name"];

    $tipoImagen = $file["type"];

    if (in_array($tipoImagen, $extensionesPermitidas)) {

        $tmp = $file["tmp_name"];

        if (move_uploaded_file($tmp, $dir . $nombre)) {
            $mensaje .= "<br /> Archivo subido: " . $nombre;
        } else {
            $mensaje .= "<br />Error: " . $_FILES["archivo"]["error"];
        }
    }
    
}


$smarty = getSmarty();
$smarty->assign("especies", obtenerEspecies());
$smarty->assign("barrios", obtenerBarrios());
$smarty->assign("razas", obtenerRazaBy(1));
$smarty->display("publish.tpl");
?>


