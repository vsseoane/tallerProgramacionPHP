<?php

session_start();
require_once 'utils.php';
require_once("includes/libs/Smarty.class.php");


if (isset($_GET['id'])) {
    $pubId = $_GET['id'];

    $usuarioLogueado = usuarioLogueado();

    $publicacion = obtenerPublicacionPorId($pubId);

    $preguntas = obtenerPreguntasPorId($pubId);

    $dir = "fotos/{$pubId}/";
    $fotos = array();
    $indices = array();

    $indice = 0;
    
    /*Obtengo todas las fotos a partir del directorio creado con el id de publicacion*/
    if (is_dir($dir)) {
        $d = dir($dir);
        while (false !== ($file = $d->read())) {
            if ($file != "." && $file != "..") {
                $fotos[] = $dir . $file;
                $indices[] = $indice;
                $indice++;
            }
        }
        $d->close();
    }

    $miSmarty = getSmarty();
    $miSmarty->assign("usuarioLogueado", $usuarioLogueado);
    $miSmarty->assign("publicacion", $publicacion);
    $miSmarty->assign("preguntas", $preguntas);
    $miSmarty->assign("fotos", $fotos);
    $miSmarty->assign("indices", $indices);
    $miSmarty->display("detallePublicacion.tpl");
    
}
?>