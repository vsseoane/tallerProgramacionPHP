<?php

/*
 * CONFIGURACION DE SMARTY  
 */
require_once('includes/libs/Smarty.class.php');
require_once("class.Conexion.BD.php");


define('CONFIG_DIR', 'config');
define('CACHE_DIR', 'cache');

define('TEMPLATE_DIR', 'templates/');
define('COMPILER_DIR', 'templates_c/');

//DECLARO SAMRTY
$smarty = new Smarty;

//COLOCO LA DESIGNACION DE DIRECTORIOS
$smarty->template_dir = TEMPLATE_DIR;
$smarty->compile_dir = COMPILER_DIR;
$smarty->config_dir = CONFIG_DIR;
$smarty->cache_dir = CACHE_DIR;
//Configuración de base de datos
define('HOST', 'localhost');
define('USUARIO', 'root');
define('CLAVE', 'root');
define('BASE', 'mascotas');

?>