<?php

function deconnexion(){
  $_SESSION = array();
  header("Location: index.php");
}

?>
