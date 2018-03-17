<?php
session_start();
require_once 'utils.php';

$accion = "";
$especie = "";

$accion = isset($_POST["accion"]) ? $_POST["accion"] : $_GET["accion"];
$especie = isset($_POST["especie"]) ? $_POST["especie"] : $_GET["especie"];

if($accion == "ajax" && strlen($especie)){
    $conn = getConexion();
    
    $sql = "select * from razas where especie_id = :especie order by nombre";
    
    $param = array(
        array("especie", $especie, "string")
    );
    
    $conn->consulta($sql, $param);
    
    $res = $conn->restantesRegistros();
    
    $conn->desconectar();

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


