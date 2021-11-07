<?php

function afficher(){
  if($_SESSION == null){
    header("Location: index.php");
  }
  require_once(realpath(dirname(__FILE__) . '/../model/facture_bd.php'));
  require_once(realpath(dirname(__FILE__) . '/../model/voiture_bd.php'));
  require_once(realpath(dirname(__FILE__) . '/../model/entreprise_bd.php'));
  listClient($clients);
  $listFacture = array();
  require (realpath(dirname(__FILE__) . '/../vue/facture.tpl'));
}

function chercher(){
  if($_SESSION == null){
    header("Location: index.php");
  }
  $idClient = isset($_POST['client'])?($_POST['client']):'';
  $moisCourant = isset($_POST['moisCourant'])?($_POST['moisCourant']):'';
  require_once(realpath(dirname(__FILE__) . '/../model/facture_bd.php'));
  require_once(realpath(dirname(__FILE__) . '/../model/voiture_bd.php'));
  $listFacture = array();
  getFactureMois($idClient, $moisCourant, $listFacture);
  afficher();
}
?>
