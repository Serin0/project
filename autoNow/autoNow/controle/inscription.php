<?php

if (isset($_POST['nom']) && isset($_POST['nomE']) && isset($_POST['pseudo']) && isset($_POST['email']) && isset($_POST['mdp'])) {
  inscription();
}

function inscription(){
  require_once(realpath(dirname(__FILE__) . '/../model/entreprise_bd.php'));

  $nom = isset($_POST['nom'])?($_POST['nom']):'';
  $nomE = isset($_POST['nomE'])?($_POST['nomE']):'';
  $pseudo = isset($_POST['pseudo'])?($_POST['pseudo']):'';
  $email = isset($_POST['email'])?($_POST['email']):'';
  $mdp = isset($_POST['mdp'])?($_POST['mdp']):'';
  $msg = '';

  if (count($_POST)==0)
    require(realpath(dirname(__FILE__) . '/../vue/inscription.tpl'));
  else {
    if (estPresentIdent($pseudo)) {
      $msg ="Ce pseudo est déjà utilisé !";
      require_once(realpath(dirname(__FILE__) . '/../vue/inscription.tpl'));
    }else if(estPresentEmail($email)){
      $msg ="Cet adresse mail est déjà utilisé !";
      require_once(realpath(dirname(__FILE__) . '/../vue/inscription.tpl'));
    }
    else {
      $bool = ajoutE($pseudo, $nom, $nomE, $email, $mdp);
      if($bool){
        estPresent($ident, $mdp, $resultat);
        $_SESSION['profil'] = $resultat[0];
        header("Location: index.php?controle=voiture&action=afficher");
      }
    }
  }
}

?>
