<?php

session_start();
require_once 'utils.php';

alert("en especies php");
console.log("estoy aczzzzzz");
$accion = strlen($_POST["accion"]) ? $_POST["accion"] : $_GET["accion"];
$especie = strlen($_POST["especie"]) ? $_POST["especie"] : $_GET["especie"];

if($accion == "ajax" && strlen($especie)){
    $conn->conectar();
    
    $sql = "select * from razas where especie_id = :especie order by nombre";
    
    $param = array(
        array("especie", $especie, "string")
    );
    
    $conn->consulta($sql, $param);
    
    $res = $conn->restantesRegistros();
    
    $conn->desconectar();
    sleep(1);
    echo json_encode($res);
} else {
    $conn->conectar();
    
    $sql = "select * from especies order by nombre";
        
    $conn->consulta($sql);
    
    $especies = $conn->restantesRegistros();
    
    $conn->desconectar();
    
    $smarty->assign("especies", $especies);

    $smarty->display("publish.tpl");
}