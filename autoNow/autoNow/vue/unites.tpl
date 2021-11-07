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
    <br><br><br>
    <div class="row">
        <div class="col-sm-6">
          <div class="card">
            <div class="card">
                <?php echo '<img class="card-img-bottom" src="data:image/jpeg;base64,'.base64_encode( $resultat['image'] ).'"/>'; ?>
              </div>
          </div>
        </div>
        <div class="col-sm-6">
          <div class="card">
            <div class="card-body">
              <h5 class="card-title" style="font-size:28px;"><?php echo $resultat['model']; ?></h5>
              <p class="card-text" style="font-size:15px; color:#766346"><?php echo $resultat['prix']; ?>€/jours</p>
              <i class="material-icons" style="font-size:25px;margin-left:0.2%;color:rgb(0, 0, 0);">settings_suggest</i>
              <h8 style="color:rgb(199, 153, 103); font-size:15px;"> Boite de vitesse : <?php echo $resultat['vitesse']; ?></h8>

              <br>
              <i class="material-icons" style="font-size:25px;color:rgb(0, 0, 0);">people</i>
              <h8 style="color:rgb(199, 153, 103); font-size:15px;"> Nombres de portes : <?php echo $resultat['nbPorte']; ?></h8>

              <br>
            <i class="material-icons" style="font-size:25px;margin-left:0.2%;color:rgb(0, 0, 0);">local_gas_station</i>
            <h8 style="color:rgb(199, 153, 103); font-size:15px;"> Carburant : <?php echo $resultat['carburant']; ?></h8>

            <br>
            <form action="index.php?controle=panier&action=ajoutPanier&voiture=<?php echo $resultat['id'];?>" method="post">
              <label class="title" >Nombre d'unité :</label>
              <select name="nbUnite" class="custom-select" id="inputGroupSelect01" >
                <option selected>Choisir...</option>
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
                <option value="6">6</option>
                <option value="7">7</option>
                <option value="8">8</option>
                <option value="9">9</option>
                <option value="10">10</option>
              </select>
              <label class="title" >Date debut :</label>
                <div class="input-group">
                    <input name="dateDebut" type="date" class="form-control" id="start" aria-label="Amount (to the nearest dollar)" required>
                    <div class="input-group-append">
                    </div>
                </div>
              <label class="title" >Date fin :</label>
                <div class="input-group">
                    <input name="dateFin" type="date" class="form-control" id="start" aria-label="Amount (to the nearest dollar)" required>
                    <div class="input-group-append">
                    </div>
                </div>
                    <button type="submit">Ajouter au pannier</button>
            </form>

          </div>
        </div>
      </div>
