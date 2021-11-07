<?php

if (isset($_POST['ident']) && isset($_POST['mdp'])) {
  connexion();
}

function connexion(){
	$ident = isset($_POST['ident'])?($_POST['ident']):'';
	$mdp = isset($_POST['mdp'])?($_POST['mdp']):'';
	$msg='';

	if (count($_POST)==0)
		require_once(realpath(dirname(__FILE__) . '/../vue/connexion_L.tpl'));
	else {
		 if (!verif_ident_bd($ident, $mdp, $resultat)) {
				$_SESSION['profil'] = array();
				$msg ="erreur de saisie";
				require_once(realpath(dirname(__FILE__) . '/../vue/connexion_L.tpl'));
		}
		else {
			 $_SESSION['profil'] = $resultat[0];
			 header("Location: index.php?controle=voiture_L&action=afficher");
			}
		}
}

function verif_ident_bd($ident, $mdp, &$resultat=array()) {
	require_once(realpath(dirname(__FILE__) . '/../model/loueur_bd.php'));
  estPresent($ident, $mdp, $resultat);
	if(count($resultat)!= 0)
		return true;
	return false;
}
?>
