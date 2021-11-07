<?php

function afficher(){
  if($_SESSION == null){
    header("Location: index.php");
  }
  require (realpath(dirname(__FILE__) . '/../model/voiture_bd.php'));
  getVoiture($_GET["voiture"], $resultat);
  require (realpath(dirname(__FILE__) . '/../vue/unites.tpl'));
}

?>
