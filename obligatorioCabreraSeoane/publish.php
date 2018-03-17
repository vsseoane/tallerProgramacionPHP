<?php

session_start();
require_once("includes/libs/Smarty.class.php");
require_once 'utils.php';

$smarty = getSmarty();
$smarty->assign("especies", obtenerEspecies());
$smarty->assign("barrios", obtenerBarrios());
$smarty->assign("razas", obtenerRazaBy(1));
$smarty->display("publish.tpl");
?>
