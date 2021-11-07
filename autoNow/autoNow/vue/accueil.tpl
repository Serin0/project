<!-- Page Accueil -->
<!doctype html>
<html lang="fr">
  <head>

    <!-- Menu en Bootstrap-->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="Bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <link rel="icon" type="image/png"  href="Images/logo.png">
    <title>AutoNow</title>
  </head>
  <body>
    <!-- Barre de navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top" style="background-color: #383024" ><a class="navbar-brand" href="index.php" >AutoNow</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
      </button>
         <div class="collapse navbar-collapse" id="navbarNavDropdown">
           <ul class="navbar-nav">
              <li class="nav-item"><a class="nav-link" href="index.php?controle=inscription&action=inscription">Créer un compte</a></li>
              <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Se connecter</a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                  <a class="dropdown-item" href="index.php?controle=connexion_E&action=connexion">Entreprise</a>
                  <a class="dropdown-item" href="index.php?controle=connexion_L&action=connexion">Loueur</a>
                </div>
              </li>
           </ul>
         </div>
    </nav>
    <br>
    <br>
    <br>

    <div class="c-wrapper">
    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
      <ol class="carousel-indicators">
        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
      </ol>
      <div class="carousel-inner">

        <?php
        $i=0;
        while($i < 3){

          echo '<div data-target="#carouselExampleIndicators" class="carousel-item'; if($i==0){echo 'active">';}else{echo '">';}
            echo '<img class="d-block w-100" style="width: 80%;" src="data:image/jpeg;base64,'.base64_encode( $listVoitures[$i]['image'] ).'"';
            switch ($i){
              case 0:
                  echo 'alt="First slide"/>';
                  break;
              case 1:
                  echo 'alt="Second slide"/>';
                  break;
              case 2:
                  echo 'alt="Third slide"/>';
                  break;
            }
            echo '<div class="carousel-caption">';
            echo '<h3>'.$listVoitures[$i]['model'].'</h3>';
            switch ($i) {
                case 0:
                    echo '<p>Top vente en France !</p>';
                    break;
                case 1:
                    echo '<p>Des modèles de toutes les gammes !</p>';
                    break;
                case 2:
                    echo '<p>Des réductions exclusives !</p>';
                    break;
            }
              echo '<a href="index.php?controle=connexion_E&action=connexion" class="btn">EN SAVOIR PLUS</a>';
            echo '</div>';
          echo '</div>';

          $i++;
        }


        ?>

      </div>
      <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div>
</div>
<br>
<br>
<section class="about" id="about">


  <div class="row">

      <div class="image">
          <img src="Images/logo.png" alt="">
      </div>

      <div class="content">
          <h3>LOCATION DE VOITURES ET DE VÉHICULES UTILITAIRES</h3>
          <p>AutoNow est une entreprise de location de voiture française. Elle est à la fois une entreprise familiale et internationale. Elle a été créee en 2021 par trois étudiants en Informatique : Nathan, Romain & Serine.</p>
          <p>Que vous ayez besoin d'une petite voiture, d’une voiture compacte ou d’un break spacieux, notre flotte vous propose des véhicules neufs, en moyenne six mois d’ancienneté, de grandes marques telles que BMW, Audi, VW et Mercedes-Benz.</p>
          <a href="index.php?controle=connexion_E&action=connexion" class="btn">découvrir le catatlogue</a>
      </div>

  </div>

</section>
</body>



    <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
    <!-- custom js file link  -->
<script src="js/script.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script></body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</html>
