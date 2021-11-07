<?php

function afficher(){
  if($_SESSION == null){
    header("Location: index.php");
  }
  require_once(realpath(dirname(__FILE__) . '/../model/voiture_bd.php'));
  listVoiture($listVoitures);
  require (realpath(dirname(__FILE__) . '/../vue/mes_voitures.tpl'));
}

function disponible(){
  if($_SESSION == null){
    header("Location: index.php");
  }
  require_once(realpath(dirname(__FILE__) . '/../model/voiture_bd.php'));
  passerDisponible($_GET['voiture']);
  afficher();
}

function indisponible(){
  if($_SESSION == null){
    header("Location: index.php");
  }
  require_once(realpath(dirname(__FILE__) . '/../model/voiture_bd.php'));
  passerIndisponible($_GET['voiture']);
  afficher();
}
?>
