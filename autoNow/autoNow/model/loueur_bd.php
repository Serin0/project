<?php

  function estPresent($ident, $mdp, &$resultat=array()) {
  	require(realpath(dirname(__FILE__) . '/../model/connect.php'));
  	$sql="SELECT * FROM `loueur`  where pseudo=:ident and mdp=:mdp";

  	try {
  		$commande = $pdo->prepare($sql);
  		$commande->bindParam(':ident', $ident);
  		$commande->bindParam(':mdp', $mdp);
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
