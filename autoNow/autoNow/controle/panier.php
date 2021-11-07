<?php

function ajoutPanier(){
  if($_SESSION == null){
    header("Location: index.php");
  }
  if ($_POST['nbUnite']=="Choisir..."){
    header("Location: index.php?controle=unites&action=afficher&voiture=".$_GET['voiture']);
  }
  $newObjet = [
                          "idVoiture" => $_GET['voiture'],
                          "nb" => $_POST['nbUnite'],
                          "dateDebut" => $_POST['dateDebut'],
                          "dateFin" => $_POST['dateFin'],
                        ];
  array_push($_SESSION['panier'], $newObjet);
  require_once(realpath(dirname(__FILE__) . '/../model/voiture_bd.php'));
  require (realpath(dirname(__FILE__) . '/../vue/panier.tpl'));
}

function afficher(){
  if($_SESSION == null){
    header("Location: index.php");
  }
  require_once(realpath(dirname(__FILE__) . '/../model/voiture_bd.php'));
  require (realpath(dirname(__FILE__) . '/../vue/panier.tpl'));
}

function valider(){
  if($_SESSION == null){
    header("Location: index.php");
  }
  if($_SESSION['panier']==null){
    header("Location: index.php?controle=panier&action=afficher");
  }
  require_once(realpath(dirname(__FILE__) . '/../model/facture_bd.php'));

  foreach ($_SESSION['panier'] as $p) {
    $idVoiture = $p['idVoiture'];
    $idClient = $_SESSION['profil']['id'];
    $dateDebut =  date("Y-m-d", strtotime($p['dateDebut']));
    $dateFin = date("Y-m-d", strtotime($p['dateFin']));
    $nb = $p['nb'];

    ajoutFacture($idVoiture, $idClient, $dateDebut, $dateFin, $nb);
  }
  $_SESSION['panier'] = array();
  header("Location: index.php?controle=voiture_louer&action=afficher");
}
?>
