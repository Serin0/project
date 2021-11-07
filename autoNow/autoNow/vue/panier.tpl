<!doctype html>
<html lang="fr">
  <head>

    <!-- Menu en Bootstrap-->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" type="text/css" href="Bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <link rel="icon" type="image/png"  href="Images/logo.png">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">
    <title>AutoNow</title>
  </head>
  <body>
    <!-- Barre de navigation -->

    <nav class="navbar navbar-expand-lg navbar-dark fixed-top" style="background-color: #383024" ><a class="navbar-brand" href="index.php?controle=voiture&action=afficher" >AutoNow</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
      </button>
         <div class="collapse navbar-collapse" id="navbarNavDropdown">
           <ul class="navbar-nav">
              <li class="nav-item"><a class="nav-link" style="color:black">Bienvenue, <?php echo $_SESSION['profil']['nom']?></a></li>
              <li class="nav-item"><a class="nav-link actived" href="index.php?controle=voiture&action=afficher">Catalogue</a></li>
              <li class="nav-item"><a class="nav-link actived" href="index.php?controle=panier&action=afficher">Panier</a></li>
              <li class="nav-item"><a class="nav-link actived" href="index.php?controle=voiture_louer&action=afficher">Mes voitures</a></li>
           </ul>
         </div>
         <div class="connecter">
            <button type="button" class="btn btn-dark" onclick="window.location.href='index.php?controle=deconnexion&action=deconnexion'">Se déconnecter</button>
         </div>
    </nav>


    <section class="h-100 h-custom" style="background-color: rgb(57, 35, 2);">
        <div class="container py-5 h-100">
          <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col-12">
              <div class="card card-registration card-registration-2" style="border-radius: 15px;">
                <div class="card-body p-0">
                  <div class="row g-0">
                    <div class="col-lg-8">
                      <div class="p-5">
                        <div class="d-flex justify-content-between align-items-center mb-5">
                          <h1 class="fw-bold mb-0 text-black">VOTRE PANIER</h1>
                        </div>

                        <?php foreach ($_SESSION['panier'] as $p){

                          getVoiture($p['idVoiture'], $resultat);

                          echo '<hr class="my-4">';
                          echo '<div class="row mb-4 d-flex justify-content-between align-items-center">';
                          echo '<div class="col-md-2 col-lg-2 col-xl-2">';
                            echo '<img class="img-fluid rounded-3" alt="Cotton T-shirt" src="data:image/jpeg;base64,'.base64_encode( $resultat['image'] ).'"/>';
                          echo '</div>';
                          echo '<div class="col-md-3 col-lg-3 col-xl-3">';
                            echo '<h6 class="text-muted">Modèle :</h6>';
                            echo '<h6 class="text-black mb-0">'.$resultat['model'].'</h6>';
                          echo '</div>';
                          echo '<div class="col-md-3 col-lg-3 col-xl-2 d-flex">';
                            echo '<h6 class="text-muted">Nombre d\'unités :</h6>';
                            echo '<h6 class="text-black mb-0">'.$p['nb'].'</h6>';
                          echo '</div>';
                          echo '<div class="col-md-3 col-lg-2 col-xl-2 offset-lg-1">';
                            echo '<h6 class="text-muted">Prix de la location :</h6>';
                            $dateDebut = new DateTime($p['dateDebut']);
                            $dateFin = new DateTime($p['dateFin']);
                            $diff = $dateFin->diff($dateDebut)->format("%a");
                            $prixLoc = $p['nb']*$resultat['prix']*$diff;
                            echo '<h6 class="mb-0">'.$prixLoc.' €</h6>';
                          echo '</div>';
                        echo '</div>';
                        }?>

                        <hr class="my-4">

                        <div class="pt-5">
                          <h6 class="mb-0"><a href="index.php?controle=voiture&action=afficher" class="text-body"><i class="fas fa-long-arrow-alt-left"></i>Continuer mes achats</a></h6>
                        </div>
                      </div>
                    </div>
                    <div class="col-lg-4 bg-grey">
                      <div class="p-5">
                        <h3 class="fw-bold mb-5 mt-2 pt-1">Récapitulatif</h3>
                        <hr class="my-4">

                        <h5 class="text-uppercase mb-3">Achat</h5>
                        <br>
                        <?php
                          $prixTotal = 0;
                          foreach ($_SESSION['panier'] as $p){
                            getVoiture($p['idVoiture'], $resultat);
                            $dateDebut = new DateTime($p['dateDebut']);
                            $dateFin = new DateTime($p['dateFin']);
                            $diff = $dateFin->diff($dateDebut)->format("%a");
                            $prixLoc = $p['nb']*$resultat['prix']*$diff;
                            echo '<h5 class="text mb-3">'.$resultat['model'].'   '. $p['nb'].' x '.$resultat['prix'].'€ x '.$diff.'jours = '.$prixLoc. '</h5>';
                            $prixTotal += $prixLoc;
                          }

                        ?>



                        <hr class="my-4">

                        <div class="d-flex justify-content-between mb-5">
                          <h5 class="text-uppercase">Prix total</h5>
                          <h5><?php echo $prixTotal ?> €</h5>
                        </div>

                        <div align="center">
                          <button class="valider" onclick="window.location.href='index.php?controle=panier&action=valider'" >Valider</button>
                        </div>

                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>

<script src="js/script.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script></body>
</body>
</html>
