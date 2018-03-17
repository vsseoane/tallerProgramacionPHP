<?php
session_start();
require_once 'utils.php';

$respuesta = "";

$respuesta = isset($_POST["respuesta"]) ? $_POST["respuesta"] : $_GET["especie"];

if(strlen($respuesta)){
    $conn = getConexion();
}
    
