<?php

session_start();
require_once 'utils.php';

$email = $_POST['email'];
$clave = $_POST['password'];

$logueado = userAndPasswordCorrect($email, $clave);
if ($logueado) {
    $_SESSION['ingreso'] = true;
    $_SESSION['mensaje'] ="";
    header("Location: index.php");
} else {
    $_SESSION['ingreso'] = false;
    $_SESSION['mensaje'] = "Usuario o Contrase&ntilde;a erronea!";
    header("Location: login.php");
}
?>