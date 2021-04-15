<?php

session_start();
if(!isset($_POST['json'])){
	header('Location: ./');
}

$_SESSION['token'] = $_POST['json'];
echo "ok";
?>