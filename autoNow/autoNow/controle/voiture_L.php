<?php

function afficher(){
  if($_SESSION == null){
    header("Location: index.php");
  }
  require (realpath(dirname(__FILE__) . '/../vue/voiture_L.tpl'));
}

?>
