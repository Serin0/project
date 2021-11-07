<?php

function afficher(){
  if($_SESSION == null){
    header("Location: index.php");
  }
  require (realpath(dirname(__FILE__) . '/../model/voiture_bd.php'));
  listVoitureDispo($listVoitures);
  require (realpath(dirname(__FILE__) . '/../vue/voiture.tpl'));
}

?>
