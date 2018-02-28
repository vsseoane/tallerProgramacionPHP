<?php

session_start();

require_once 'utils.php';



$name = $_POST['name'];
$clave = $_POST['password'];
$email = $_POST['email'];


$message = addUser($name, $email, $clave);

if(strcmp($message, "") === 0){
    header("Location: index.php");
}else{
    $_SESSION['mensaje'] = $message;
     header("Location: register.php");
}

?>