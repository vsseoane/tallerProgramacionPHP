<?php

session_start();
//incluir la libreria:
require_once("includes/libs/Smarty.class.php");
require_once 'utils.php';

$usuarios = showUser();
$mensaje = $_SESSION['mensaje'];
$smarty = getSmarty();
$smarty->assign("mensaje", $mensaje);
$smarty->assign("usuarios", $usuarios);


$smarty->display("register.tpl");
?>

