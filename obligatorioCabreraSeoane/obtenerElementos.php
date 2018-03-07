<?php

session_start();
//incluir la libreria:
require_once 'utils.php';
require_once("includes/libs/Smarty.class.php");
$conn = getConexion();

$elementosPorPagina = 10;

$accion = strlen($_POST["accion"]) ? $_POST["accion"] : $_GET["accion"];
$pagina = strlen($_POST["p"]) ? $_POST["p"] : $_GET["p"];
$estado = strlen($_POST["estado"]) ? $_POST["estado"] : $_GET["estado"];
$especie = strlen($_POST["especie"]) ? $_POST["especie"] : $_GET["especie"];
$raza = strlen($_POST["raza"]) ? $_POST["raza"] : $_GET["raza"];
$barrio = strlen($_POST["barrio"]) ? $_POST["barrio"] : $_GET["barrio"];
$palabra = strlen($_POST["palabra"]) ? $_POST["palabra"] : $_GET["palabra"];

if ($pagina < 1)
    $pagina = 1;

$conn->conectar();

$sql = "select count(*) as cantidad from publicaciones";

$conn->consulta($sql);

$res = $conn->siguienteRegistro();

$cantidadPaginas = (int) $res["cantidad"];

$cantidadPaginas = ceil($cantidadPaginas / $elementosPorPagina);

$conn->desconectar();

$anterior = $pagina - 1 < 1 ? 1 : $pagina - 1;
$siguiente = $pagina + 1 > $cantidadPaginas ? $cantidadPaginas : $pagina + 1;

$conn->conectar();

//$sql = "select * from publicaciones where abierto = 1 order by id limit :offset, :cantidad";

$sql = "select * from publicaciones where abierto = 1 ";

if($especie != "" && $especie != " " && $especie!= NULL){
    $sql = $sql . " and especie_id=" . $especie;
}
if($estado != "" && $estado != " " && $estado!= NULL){
    $sql = $sql . " and tipo='" . $estado . "'";
}
if($raza != "" && $raza != " " && $raza!= NULL){
    $sql = $sql . " and raza_id =" . $raza;
}
if($barrio != "" && $barrio != " " && $barrio!= NULL){
    $sql = $sql . " and barrio_id=" . $barrio;
}
if($palabra != "" && $palabra != " " && $palabra!= NULL){
    $sql = $sql . " and titulo  like ". '"' . "%" . $palabra . "%" . '"';
}
$sqlCantidad = $sql;
$sql = $sql . " order by id limit :offset, :cantidad";


$param = array(
    array("offset", ($pagina - 1) * $elementosPorPagina, "int"),
    array("cantidad", $elementosPorPagina, "int"),
);

$conn->consulta($sql, $param);


$res = $conn->restantesRegistros();

 $conn->consulta($sqlCantidad);
 $cantTotalDeLaConsulta = $conn->cantidadRegistros();


$conn->desconectar();

$paginacion = array();

$paginacion[] = array("p" => 1, "texto" => "&lt;&lt;");
$paginacion[] = array("p" => $anterior, "texto" => "&lt;");

for ($i = 1; $i <= $cantidadPaginas; $i++) {
    $paginacion[] = array("p" => $i, "texto" => "" . $i, "sel" => ($pagina == $i));
}

$paginacion[] = array("p" => $siguiente, "texto" => "&gt;");
$paginacion[] = array("p" => $cantidadPaginas, "texto" => "&gt;&gt;"); 

$arr = array('data' => $res, 'cantTotal' => $cantTotalDeLaConsulta);

echo json_encode($arr);