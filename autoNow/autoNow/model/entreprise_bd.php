<?php

  function ajoutE($pseudo, $nom, $nomE, $email, $mdp){
    require(realpath(dirname(__FILE__) . '/../model/connect.php'));
    $hash = sha1($mdp);
    $sql="INSERT INTO client(pseudo, nom, nomE, mdp, email) VALUES (:pseudo, :nom, :nomE, :hash, :email)";

    $commande = $pdo->prepare($sql);
    $commande->bindParam(':pseudo', $pseudo);
    $commande->bindParam(':nom', $nom);
    $commande->bindParam(':nomE', $nomE);
    $commande->bindParam(':hash', $hash);
    $commande->bindParam(':email', $email);
    $bool = $commande->execute();
    return $bool;
  }

  function estPresent($ident, $mdp, &$resultat=array()) {
  	require(realpath(dirname(__FILE__) . '/../model/connect.php'));
    $hash = sha1($mdp);
  	$sql="SELECT * FROM `client`  where pseudo=:ident and mdp=:hash";

  	try {
  		$commande = $pdo->prepare($sql);
  		$commande->bindParam(':ident', $ident);
  		$commande->bindParam(':hash', $hash);
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

  function estPresentIdent($ident) {
  	require(realpath(dirname(__FILE__) . '/../model/connect.php'));
  	$sql="SELECT * FROM `client`  where pseudo=:ident";

  	try {
  		$commande = $pdo->prepare($sql);
  		$commande->bindParam(':ident', $ident);
  		$bool = $commande->execute();

  		if ($bool)
  			$resultat = $commande->fetchAll(PDO::FETCH_ASSOC);

  		if (count($resultat)== 0)
        return false;
  		else
        return true;
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

  function estPresentEmail($email) {
  	require(realpath(dirname(__FILE__) . '/../model/connect.php'));
  	$sql="SELECT * FROM `client`  where email=:email";

  	try {
  		$commande = $pdo->prepare($sql);
  		$commande->bindParam(':email', $email);
  		$bool = $commande->execute();

  		if ($bool)
  			$resultat = $commande->fetchAll(PDO::FETCH_ASSOC);

  		if (count($resultat)== 0)
        return false;
  		else
        return true;
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

  function listClient(&$resultat=array()){
    require(realpath(dirname(__FILE__) . '/../model/connect.php'));
    $sql="SELECT * FROM `client`";

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

?>
