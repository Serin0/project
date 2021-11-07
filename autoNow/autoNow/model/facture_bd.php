<?php

function ajoutFacture($idVoiture, $idClient, $dateDebut, $dateFin, $nb){
  require(realpath(dirname(__FILE__) . '/../model/connect.php'));
  $sql="INSERT INTO facture(idVoiture, idClient, dateDebut, dateFin, nb) VALUES (:idVoiture, :idClient, :dateDebut, :dateFin, :nb)";

  $commande = $pdo->prepare($sql);
  $commande->bindParam(':idVoiture', $idVoiture);
  $commande->bindParam(':idClient', $idClient);
  $commande->bindParam(':dateDebut', $dateDebut);
  $commande->bindParam(':dateFin', $dateFin);
  $commande->bindParam(':nb', $nb);
  $bool = $commande->execute();
  return $bool;
}

function getFactureClient($ident, &$resultat=array()) {
  require(realpath(dirname(__FILE__) . '/../model/connect.php'));
  $sql="SELECT * FROM `facture`  where idClient=:idClient";

  try {
    $commande = $pdo->prepare($sql);
    $commande->bindParam(':idClient', $ident);
    $bool = $commande->execute();

    if ($bool){
      $resultat = $commande->fetchAll(PDO::FETCH_ASSOC);
    }
    if ($resultat == null){
      return false;
    }
    else{
      return true;
    }
  }

  catch (PDOException $e) {
    echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
    die();
  }

  if ($resultat == null)
    return false;
  else
    return true;
}

function getFactureMois($idClient, $moisCourant, &$resultat=array()){
  require(realpath(dirname(__FILE__) . '/../model/connect.php'));
  $moisCourant = (int)$moisCourant;
  $sql="SELECT * FROM `facture`  where idClient=:idClient and month(dateFin)=:dateRep";

  try {
    $commande = $pdo->prepare($sql);
    $commande->bindParam(':idClient', $idClient);
    $commande->bindParam(':dateRep', $moisCourant);
    $bool = $commande->execute();

    if ($bool){
      $resultat = $commande->fetchAll(PDO::FETCH_ASSOC);
    }
    if ($resultat == null){
      return false;
    }
    else{
      return true;
    }
  }

  catch (PDOException $e) {
    echo utf8_encode("Echec de select : " . $e->getMessage() . "\n");
    die();
  }

  if ($resultat == null)
    return false;
  else
    return true;
}

?>
