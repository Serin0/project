<!doctype html>
<html lang="fr">
  <head>

    <!-- Menu en Bootstrap-->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" type="text/css" href="Bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <link rel="icon" type="image/png"  href="Images/logo.png">
    <title>AutoNow</title>
  </head>
  <body>
    <!-- Barre de navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top" style="background-color: #383024" ><a class="navbar-brand" href="index.php?controle=voiture_L&action=afficher" >AutoNow</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
      </button>
         <div class="collapse navbar-collapse" id="navbarNavDropdown">
           <ul class="navbar-nav">
              <li class="nav-item"><a class="nav-link actived" href="index.php?controle=facture&action=afficher">Factures</a></li>
              <li class="nav-item"><a class="nav-link actived" href="index.php?controle=mes_voitures&action=afficher">Mes Voitures</a></li>
              <li class="nav-item"><a class="nav-link actived" href="index.php?controle=ajout_vehicule&action=ajoutVoiture">Ajouter</a></li>
           </ul>
         </div>
         <div class="connecter">
            <button type="button" class="btn btn-dark" onclick="window.location.href='index.php?controle=deconnexion&action=deconnexion'">Se déconnecter</button>
         </div>
    </nav>
    <br><h1 class="heading"> BIENVENUE SUR VOTRE ESPACE ! </h1>

    <section class="article" id="article">

        <div class="box-containerr">

            <div class="box">
                <div class="image">
                    <img src="https://images.unsplash.com/photo-1460925895917-afdab827c52f?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1415&q=80" alt="">
                </div>
                <div class="content">
                    <a href="index.php?controle=facture&action=afficher" class="title">Historique des Factures</a>
                </div>
            </div>

            <div class="box">
                <div class="image">
                    <img src="https://images.unsplash.com/photo-1526726538690-5cbf956ae2fd?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1470&q=80" alt="">
                </div>
                <div class="content">
                    <a href="index.php?controle=mes_voitures&action=afficher" class="title">Gestion du stock de voitures</a>
                </div>
            </div>


            <div class="box">
                <div class="image">
                    <img src="https://images.unsplash.com/photo-1485291571150-772bcfc10da5?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1528&q=80" alt="">
                </div>
                <div class="content">
                    <a href="index.php?controle=ajout_vehicule&action=ajoutVoiture" class="title">Ajouter un nouveau modèle</a>
                </div>
            </div>


        </div>

    </section>

<script src="js/script.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script></body>
</body></html>
