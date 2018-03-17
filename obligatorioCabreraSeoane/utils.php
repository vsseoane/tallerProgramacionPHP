<?php

require_once("includes/libs/Smarty.class.php");
require_once("class.Conexion.BD.php");

require_once("configuracion.php");

function getConexion() {
    $cn = new ConexionBD(
            "mysql", HOST, BASE, USUARIO, CLAVE);

    $cn->conectar();
    return $cn;
}

/* function getConexion(){
  return $conn;
  } */

function getSmarty() {
    $miSmarty = new Smarty();
    $miSmarty->template_dir = TEMPLATE_DIR;
    $miSmarty->compile_dir = COMPILER_DIR;
    $miSmarty->cache_dir = CACHE_DIR;
    $miSmarty->config_dir = CONFIG_DIR;
    $miSmarty->assign("usuario", usuarioLogueado());
    return $miSmarty;
}

function showUser() {
    $cn = getConexion();
    $cn->consulta("select * from usuarios");
    return $cn->restantesRegistros();
}

function addUser($name, $email, $pass) {
    $message = "";
    $resultIsValidPassword = isValidPassword($pass);
    $resultIsRepeatedEmail = isRepeatedEmail($email);
    if ($resultIsValidPassword && !$resultIsRepeatedEmail) {
        $cn = getConexion();
        $cn->consulta(
                "insert into usuarios(nombre, password, email) values(:name,:pass,:email)", array(
            array("name", $name, 'string'),
            array("pass", $pass, 'string'),
            array("email", $email, 'string')
        ));
    } else if (!$resultIsValidPassword) {
        $message = "La clave debe tener al menos un numero y una letra. Debe tener al menos 8 caracteres";
    } else if ($resultIsRepeatedEmail) {
        $message = "El email ya existe. Ingrese otro";
    }

    return $message;
}

function isValidPassword($pass) {
    $isValid = false;
    if (preg_match("/^.*(?=.{8,})(?=.*\d)(?=.*[a-z])([A-Z]*).*$/", $pass)) {
        $isValid = true;
    }
    return $isValid;
}

function isRepeatedEmail($email) {
    $result = false;
    $cn = getConexion();
    $cn->consulta("select * from usuarios where email =:emailBD", array(array('emailBD', $email, 'string'))); // se escribe asi para evitar sql injector

    $user = $cn->siguienteRegistro();
    if ($user) {
        $result = true;
    }
    return $result;
}

function userAndPasswordCorrect($email, $pass) {
    $result = false;
    $cn = getConexion();
    $cn->consulta("select * from usuarios where email =:emailBD and password=:passBD", array(array('emailBD', $email, 'string'), array('passBD', $pass, 'string'))); // se escribe asi para evitar sql injector

    $user = $cn->siguienteRegistro();
    $_SESSION["usuario"] = $user;
    if ($user) {
        $result = true;
    }
    return $result;
}

function usuarioLogueado() {
    if (isset($_SESSION['usuario'])) {
        $_SESSION['usuario'];
        return $_SESSION['usuario'];
    }

    return null;
}

function obtenerEspecies() {
    $cn = getConexion();
    $cn->consulta("select * from especies");
    return $cn->restantesRegistros();
}

function obtenerBarrios() {
    $cn = getConexion();
    $cn->consulta("select * from barrios");
    return $cn->restantesRegistros();
}

function obtenerRazaBy($especie_id) {
    $cn = getConexion();
    $cn->consulta("select * from razas where especie_id=:especieID", array(array('especieID', $especie_id, 'string')));
    return $cn->restantesRegistros();
}

function obtenerPublicacionesParaIndex() {
    $cn = getConexion();
    $cn->consulta("select * from publicaciones where abierto=1 limit 0, 10");


    $resultados = $cn->restantesRegistros();
    $tipo = 3;
    foreach ($resultados as $key => $valor) {
        if (($valor[$tipo]) === "E") {
            $resultados[$key]["tipo"] = "Encontrado";
        } else if (($valor[$tipo]) === "P") {
            $resultados[$key]["tipo"] = "Perdido";
        }
        $resultados[$key]["descripcion"] = substr($resultados[$key]["descripcion"], 0, 150) . "...";
    }
    return $resultados;
}

function publicar($usuario, $titulo, $descripcion, $especie, $raza, $barrio, $tipo, $latitud, $longitud) {
    $message = "";
    $cn = getConexion();

    $cn->consulta(
            "insert into publicaciones(titulo, descripcion, tipo, especie_id, raza_id, barrio_id, abierto, usuario_id, exitoso, latitud, longitud) values(:titulo,:descripcion,:tipo,:especie,:raza,:barrio,1,:usuario,NULL,:latitud,:longitud)", array(
        array("usuario", $usuario, 'int'),
        array("titulo", $titulo, 'string'),
        array("descripcion", $descripcion, 'string'),
        array("tipo", $tipo, 'string'),
        array("especie", $especie, 'int'),
        array("raza", $raza, 'int'),
        array("barrio", $barrio, 'int'),
        array("latitud", $latitud, 'int'),
        array("longitud", $longitud, 'int'),
    ));

    $message = $cn->ultimoIdInsert();

    return $message;
}

function obtenerPublicacionPorId($pubId) {

    $cn = getConexion();

    $cn->consulta(
            "select p.id, p.titulo, p.descripcion, p.tipo, p.abierto, p.usuario_id, p.exitoso, p.latitud, p.longitud, r.nombre as nombRaza, e.nombre as nombEspecie, b.nombre as nombBarrio from publicaciones p, especies e, razas r, barrios b where p.id=:pub and p.especie_id = e.id and p.raza_id = r.id and p.barrio_id = b.id", array(
        array("pub", $pubId, 'int')
    ));

    return $cn->siguienteRegistro();
}

function obtenerPreguntasPorId($pubId) {
    $cn = getConexion();

    $cn->consulta(
            "select p.id, p.id_publicacion, p.texto, p.respuesta, p.usuario_id, u.email from preguntas p, usuarios u where p.id_publicacion=:pub and p.usuario_id = u.id", array(
        array("pub", $pubId, 'int')
    ));

    return $cn->restantesRegistros();
}

function preguntar($pubId, $texto, $usuarioId) {

    $cn = getConexion();
    $cn->consulta(
            "insert into preguntas(id_publicacion, texto, usuario_id) values(:id_publicacion,:texto,:usuario_id)", array(
        array("id_publicacion", $pubId, 'int'),
        array("texto", $texto, 'string'),
        array("usuario_id", $usuarioId, 'int')
    ));
}

function responder($preguntaId, $respuesta){
    $cn = getConexion();
    $cn->consulta(
            "update preguntas set respuesta = :respuesta where id = :id", array(
        array("id", $preguntaId, 'int'),
        array("respuesta", $respuesta, 'string')
    ));
}

function cerrar($pubId, $exitoso){
    $cn = getConexion();
    $cn->consulta(
            "update publicaciones set abierto = 0, exitoso = :exitoso where id = :id", array(
        array("id", $pubId, 'int'),
        array("exitoso", $exitoso, 'bool')
    ));
}

function getCantTotalPublicacionesAbiertas(){
    $cn = getConexion();
    $cn->consulta("select count(*) from publicaciones where abierto=1");

    $resultado = $cn->restantesRegistros();
    return $resultado;
    
}
