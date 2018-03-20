<?php
    session_start();
require_once 'utils.php';
//incluir la libreria:
require_once("includes/libs/Smarty.class.php"); 

$mensaje = $_SESSION['mensaje'];
//instancio un objeto
$smarty = getSmarty();

$smarty->assign("mensaje",$mensaje);

//procesamos el resultado procesado por smarty
$smarty->display("login.tpl");

?>

