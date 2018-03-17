<?php

session_start();
require_once 'utils.php';
require_once("includes/libs/Smarty.class.php");


if ($_SESSION['ingreso']) {

    if (isset($_POST['pubId']) && isset($_POST['exitoso'])) {
        
        $pubId = $_POST['pubId'];
        $exitoso = $_POST['exitoso'];
        
        cerrar($pubId, $exitoso);
        
        header("location:index.php");
    }
}
?>