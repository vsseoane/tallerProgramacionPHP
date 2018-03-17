<?php


session_start();
$_SESSION['ingreso'] = false;
session_destroy();

header('location:index.php');