<?php

session_start();
//incluir la libreria:
require_once 'utils.php';
require_once("includes/libs/Smarty.class.php");
$conn = getConexion();

$elementosPorPagina = 10;

$accion = strlen($_POST["accion"]) ? $_POST["accion"] : $_GET["accion"];
$pagina = strlen($_POST["p"]) ? $_POST["p"] : $_GET["p"];
$pagina = (int) $pagina;
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

$sql = "select * from publicaciones where abierto = 1 order by id limit :offset, :cantidad";

$param = array(
    array("offset", ($pagina - 1) * $elementosPorPagina, "int"),
    array("cantidad", $elementosPorPagina, "int"),
);

$conn->consulta($sql, $param);


$res = $conn->restantesRegistros();

$conn->desconectar();

$paginacion = array();

$paginacion[] = array("p" => 1, "texto" => "&lt;&lt;");
$paginacion[] = array("p" => $anterior, "texto" => "&lt;");

for ($i = 1; $i <= $cantidadPaginas; $i++) {
    $paginacion[] = array("p" => $i, "texto" => "" . $i, "sel" => ($pagina == $i));
}

$paginacion[] = array("p" => $siguiente, "texto" => "&gt;");
$paginacion[] = array("p" => $cantidadPaginas, "texto" => "&gt;&gt;");
echo json_encode($res);