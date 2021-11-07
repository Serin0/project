<?php

function promo(){
  require (realpath(dirname(__FILE__) . '/../model/voiture_bd.php'));
  listVoitureDispo($listVoitures);
  require_once("./vue/accueil.tpl");
}

?>
