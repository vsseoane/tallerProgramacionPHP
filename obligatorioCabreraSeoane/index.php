<?php

session_start();

require_once 'utils.php';
require_once 'pagination.php';
require_once("includes/libs/Smarty.class.php");

$mensaje = $_SESSION['mensaje'] = "";

$smarty = getSmarty();



$cantPorPagina = 10;
$currentPage = 1;


$smarty->assign("mensaje", $mensaje);
$smarty->assign("especies", obtenerEspecies());
$smarty->assign("barrios", obtenerBarrios());
$smarty->assign("razas", obtenerRazaBy(1));
$smarty->assign("publicaciones", obtenerPublicacionesParaIndex());
$smarty->assign("paginacion", getPagination($currentPage,$cantPorPagina));
//procesamos el resultado procesado por smarty
$smarty->display("index.tpl");
?>