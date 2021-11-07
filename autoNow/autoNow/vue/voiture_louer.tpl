<!doctype html>
<html lang="fr">
  <head>

    <!-- Menu en Bootstrap-->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" type="text/css" href="Bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="icon" type="image/png"  href="Images/logo.png">
    <title>AutoNow</title>
  </head>
  <body >

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
    <br><br><br>
    <section class="article" id="article">


        <div class="box-container">
            <?php foreach($facture as $f) {

              getVoiture($f['idVoiture'], $resultat);

              echo '<div class="box">';
                  echo '<div class="image">';
                      echo '<img src="data:image/jpeg;base64,'.base64_encode( $resultat['image'] ).'"/>';
                  echo '</div>';
                  echo '<div class="content">';
                      echo '<a href="index.php?controle=unites&action=afficher&voiture='.$f['idVoiture'].'" class="title">'.$resultat['model'].'</a>';

                        echo '<hr class="my-5" style="background-color:white">';

              echo '<h6 style="color:rgb(199, 153, 103); font-size:15px;">date de début : '.date('d F Y', strtotime($f['dateDebut'])).'</h6>';
              echo '<br>';
              echo '<h6 style="color:rgb(199, 153, 103); font-size:15px;">date de fin : '.date('d F Y', strtotime($f['dateFin'])).'</h6>';
              echo '<br>';
              echo '<h6 style="color:rgb(199, 153, 103); font-size:15px;">Nombre : '.$f['nb'].'</h6>';
              echo '<br>';
              $dateDebut = new DateTime($f['dateDebut']);
              $dateFin = new DateTime($f['dateFin']);
              $diff = $dateFin->diff($dateDebut)->format("%a");
              $prixLoc = $f['nb']*$resultat['prix']*$diff;
              echo '<h6 style="color:rgb(199, 153, 103); font-size:15px;">Montant de la location : '.$prixLoc.' €</h6>';
              echo '<br>';
              $dateAct = new DateTime(date('Y-m-d H:i:s'));
              $diff = $dateFin->diff($dateAct)->format("%a");
              if($diff>0){
                echo '<h6 style="color:green; font-size:15px;">Location : en cours</h6>';
              }else{
                echo '<h6 style="color:red; font-size:15px;">Location : terminé</h6>';
              }
                  echo '</div>';
              echo '</div>';
            }?>

        </div>

    </section>
    </body>
    <script src="js/script.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script></body>
    </html>
