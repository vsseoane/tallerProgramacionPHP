<?php

session_start();
require_once 'utils.php';
require_once("includes/libs/Smarty.class.php");

if ($_SESSION['ingreso']) {


    $datosEspecies = getTotalesPorEspecies();
    $datosCerrado = getTotalesPorEstado(0);
    $datosAbierto = getTotalesPorEstado(1);
    $datosNoExitoso = getTotalesSegunEncontrado(0);
    $datosExitoso = getTotalesSegunEncontrado(1);

    $miSmarty = getSmarty();
    $miSmarty->assign("datosEspecies", $datosEspecies);
    $miSmarty->assign("datosCerrado", $datosCerrado);
    $miSmarty->assign("datosAbierto", $datosAbierto);
    $miSmarty->assign("datosNoExitoso", $datosNoExitoso);
    $miSmarty->assign("datosExitoso", $datosExitoso);

    $miSmarty->display('estadisticas.tpl');
}
?>