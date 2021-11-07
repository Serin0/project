<?php

function ajout($model, $prix, $carburant, $vitesse, $nbPorte, $description, $image){
  require_once(realpath(dirname(__FILE__) . '/../model/connect.php'));
  $prix = floatval(str_replace(',', '.', $prix));
  $sql="INSERT INTO voiture(model, prix, carburant, vitesse, nbPorte, description, image) VALUES (:model, :prix, :carburant, :vitesse, :nbPorte, :description, :image)";

  $commande = $pdo->prepare($sql);
  $commande->bindParam(':model', $model);
  $commande->bindParam(':prix', $prix);
  $commande->bindParam(':carburant', $carburant);
  $commande->bindParam(':vitesse', $vitesse);
  $commande->bindParam(':nbPorte', $nbPorte);
  $commande->bindParam(':description', $description);
  $commande->bindParam(':image', $image);
  $bool = $commande->execute();
  return $bool;
}

function listVoitureDispo(&$resultat=array()){
  require(realpath(dirname(__FILE__) . '/../model/connect.php'));
  $sql="SELECT * FROM `voiture` WHERE dispo=1";

  try {
    $commande = $pdo->prepare($sql);
    $bool = $commande->execute();

    if ($bool){
      $resultat = $commande->fetchAll(PDO::FETCH_ASSOC);
    }
    if (count($resultat)== 0){
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

  if (count($resultat)== 0)
    return false;
  else
    return true;
}

function listVoiture(&$resultat=array()){
  require(realpath(dirname(__FILE__) . '/../model/connect.php'));
  $sql="SELECT * FROM `voiture`";

  try {
    $commande = $pdo->prepare($sql);
    $bool = $commande->execute();

    if ($bool){
      $resultat = $commande->fetchAll(PDO::FETCH_ASSOC);
    }
    if (count($resultat)== 0){
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

  if (count($resultat)== 0)
    return false;
  else
    return true;
}

function getVoiture($voiture, &$resultat=array()) {
  require(realpath(dirname(__FILE__) . '/../model/connect.php'));
  $sql="SELECT * FROM `voiture`  where id=:voiture";

  try {
    $commande = $pdo->prepare($sql);
    $commande->bindParam(':voiture', $voiture);
    $bool = $commande->execute();

    if ($bool){
      $resultat = $commande->fetch(PDO::FETCH_ASSOC);
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

function passerDisponible($ident){
  require(realpath(dirname(__FILE__) . '/../model/connect.php'));
  $sql="UPDATE `voiture` SET dispo=1  where id=:voiture";

  $commande = $pdo->prepare($sql);
  $commande->bindParam(':voiture', $ident);
  $bool = $commande->execute();
  return $bool;
}

function passerIndisponible($ident){
  require(realpath(dirname(__FILE__) . '/../model/connect.php'));
  $sql="UPDATE `voiture` SET dispo=0  where id=:voiture";

  $commande = $pdo->prepare($sql);
  $commande->bindParam(':voiture', $ident);
  $bool = $commande->execute();
  return $bool;
}

?>
