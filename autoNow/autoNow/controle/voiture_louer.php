<?php

function afficher(){
  if($_SESSION == null){
    header("Location: index.php");
  }
  require_once(realpath(dirname(__FILE__) . '/../model/facture_bd.php'));
  require_once(realpath(dirname(__FILE__) . '/../model/voiture_bd.php'));
  $facture = array();
  getFactureClient($_SESSION['profil']['id'], $facture);
  require (realpath(dirname(__FILE__) . '/../vue/voiture_louer.tpl'));
}

?>
