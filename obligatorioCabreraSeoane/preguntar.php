<?php

session_start();
require_once 'utils.php';
require_once("includes/libs/Smarty.class.php");

if ($_SESSION['ingreso']) {

    if (isset($_POST['txtPreguntar']) && isset($_POST['pubIdPreguntar'])) {
        
        $pubId = $_POST['pubIdPreguntar'];
        $texto = $_POST['txtPreguntar'];

        $usuarioLogueado = usuarioLogueado();
        
        preguntar($pubId, $texto, $usuarioLogueado['id']);
        
        header("location:detallePublicacion.php?id=" . $pubId);
    }
}
?>