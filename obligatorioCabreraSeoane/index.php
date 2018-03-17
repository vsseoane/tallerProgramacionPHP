<?php
session_start();

require_once 'utils.php';
require_once("includes/libs/Smarty.class.php"); 

$mensaje = $_SESSION['mensaje'] = "";

$smarty = getSmarty();

$smarty->assign("mensaje",$mensaje);
$smarty->assign("publicaciones", obtenerPublicacionesParaIndex());
$smarty->assign("especies", obtenerEspecies());
$smarty->assign("barrios", obtenerBarrios());
$smarty->assign("razas", obtenerRazaBy(1));

//procesamos el resultado procesado por smarty
$smarty->display("index.tpl");

?>