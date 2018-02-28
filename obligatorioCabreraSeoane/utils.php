<?php

require_once("includes/libs/Smarty.class.php");
require_once("class.Conexion.BD.php");

function getConexion() {
    $cn = new ConexionBD(
            "mysql", "localhost", "mascotas", "root", "root");

    $cn->conectar();
    return $cn;
}

function getSmarty() {
    $miSmarty = new Smarty();
    $miSmarty->template_dir = "templates";
    $miSmarty->compile_dir = "templates_c";
    $miSmarty->cache_dir = "cache";
    $miSmarty->config_dir = "config";
     $miSmarty->assign("usuario", usuarioLogueado());
    return $miSmarty;
}

function showUser() {
    $cn = getConexion();
    $cn->consulta("select * from usuarios");
    return $cn->restantesRegistros();
}
function addUser($name, $email, $pass) {
    $message="";
    $resultIsValidPassword = isValidPassword($pass);
    $resultIsRepeatedEmail = isRepeatedEmail($email);
    if($resultIsValidPassword && !$resultIsRepeatedEmail){
        $cn = getConexion();
        $cn->consulta(
                "insert into usuarios(nombre, password, email) values(:name,:pass,:email)", array(
            array("name",$name,'string'),
                    array("pass",$pass,'string'),
                    array("email",$email,'string')
        ));
    }else if(!$resultIsValidPassword){
        $message = "La clave debe tener al menos un numero y una letra. Debe tener al menos 8 caracteres";
    }else if($resultIsRepeatedEmail){
        $message = "El email ya existe. Ingrese otro";        
    }
    
    return $message;
}
function isValidPassword($pass){
    $isValid = false;
    if(preg_match("/^.*(?=.{8,})(?=.*\d)(?=.*[a-z])([A-Z]*).*$/", $pass)){
         $isValid= true;
    }    
    return $isValid;
}

function isRepeatedEmail($email){
    $result = false;
    $cn = getConexion();
    $cn->consulta("select * from usuarios where email =:emailBD",array(array('emailBD', $email,'string')));// se escribe asi para evitar sql injector
  
    $user = $cn->siguienteRegistro();
    if ($user) {
        $result = true;
    }
    return $result;
}
function userAndPasswordCorrect($email, $pass) {
    $result = false;
    $cn = getConexion();
    $cn->consulta("select * from usuarios where email =:emailBD and password=:passBD",array(array('emailBD', $email,'string'),array('passBD', $pass,'string')));// se escribe asi para evitar sql injector
  
    $user = $cn->siguienteRegistro();
    $_SESSION["usuario"] = $user;  
    if ($user) {
        $result = true;
    }
    return $result;
}
function usuarioLogueado() {
    if (isset($_SESSION['usuario'])) {
        return $_SESSION['usuario'];
    }

    return null;
}

function obtenerEspecies(){
     $cn = getConexion();
    $cn->consulta("select * from especies");
    return $cn->restantesRegistros();
}
function obtenerBarrios(){
     $cn = getConexion();
    $cn->consulta("select * from barrios");
    return $cn->restantesRegistros();
}

function obtenerRazaBy($especie_id){
    $cn = getConexion();
    $cn->consulta("select * from razas where especie_id=:especieID", array(array('especieID', $especie_id,'string')));
    return $cn->restantesRegistros(); 
    
}