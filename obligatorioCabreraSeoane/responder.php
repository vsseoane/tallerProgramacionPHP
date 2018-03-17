<?php

session_start();
require_once 'utils.php';
require_once("includes/libs/Smarty.class.php");


if ($_SESSION['ingreso']) {

    if (isset($_POST['pubIdResponder']) && isset($_POST['txtResponder']) && isset($_POST['pregIdResponder'])) {
        
        $pubId = $_POST['pubIdResponder'];
        $preguntaId = $_POST['pregIdResponder'];
        $respuesta = $_POST['txtResponder'];
        
        responder($preguntaId, $respuesta);
        
        header("location:detallePublicacion.php?id=" . $pubId);
    }
}
?>