<?php



function ajoutVoiture(){
  if($_SESSION == null){
    header("Location: index.php");
  }
  require(realpath(dirname(__FILE__) . '/../model/voiture_bd.php'));

  $model = isset($_POST['model'])?($_POST['model']):'';
  $prix = isset($_POST['prix'])?($_POST['prix']):'';
  $carburant = isset($_POST['carburant'])?($_POST['carburant']):'';
  $vitesse = isset($_POST['vitesse'])?($_POST['vitesse']):'';
  $nbPorte = isset($_POST['nbPorte'])?($_POST['nbPorte']):'';
  $description = isset($_POST['description'])?($_POST['description']):'';
  $msg = '';

  if (count($_POST)==0)
    require(realpath(dirname(__FILE__) . '/../vue/ajout_vehicule.tpl'));
  else {
    $image = file_get_contents($_FILES['image']['tmp_name']);
    $bool = ajout($model, $prix, $carburant, $vitesse, $nbPorte, $description, $image);
    if($bool){
      header("Location: index.php?controle=voiture&action=afficher");
    }
  }
}

?>
