<?php

require_once("includes/libs/Smarty.class.php");
require_once 'utils.php';

function getPagination($currentPage, $cantPorPagina) {

    $paginacion = array();
    $cantpublicaciones = getCantTotalPublicacionesAbiertas()[0][0];
    
    $cantPageTotal = round(($cantpublicaciones / $cantPorPagina), 0, PHP_ROUND_HALF_DOWN);;
    if(($cantpublicaciones % $cantPorPagina)!= 0){
        $cantPageTotal++;
    }
    
    for ($i = $currentPage; $i <= $cantPageTotal; $i++) {
        $texto = "<span ";
        $texto .= $currentPage == $i ? "class='sel'>" . $i : ">" . $i;
        $texto .= "</span>";
        if ($i == $currentPage) {
            array_push($paginacion, array("p" => $i, "texto" => $texto, "sel" => 1));
        } else {
            array_push($paginacion, array("p" => $i, "texto" => $texto, "sel" => 0));
        }
    }
    return $paginacion;
}

?>