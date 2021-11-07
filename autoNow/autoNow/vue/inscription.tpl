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
  <body >
    <!-- Barre de navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top" style="background-color: #383024" ><a class="navbar-brand" href="index.php" >AutoNow</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
      </button>
         <div class="collapse navbar-collapse" id="navbarNavDropdown">
           <ul class="navbar-nav">
              <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Se connecter</a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                  <a class="dropdown-item" href="index.php?controle=connexion_E&action=connexion">Entreprise</a>
                  <a class="dropdown-item" href="index.php?controle=connexion_L&action=connexion">Loueur</a>
                </div>
              </li>
           </ul>
         </div>
    </nav>

  <form class="inCo" action="index.php?controle=inscription&action=inscription" method="post">
    <h1>S'INSCRIRE</h1>
    <div class="container" style="color: red"> <?php echo $msg; ?> </div>
    <br>
    <div class="inputs">
      <input name="nom" type="text" placeholder="Nom" required/>
      <input name="email" type="text" placeholder="Email" required/>
      <input name="pseudo" type="text" placeholder="Pseudo" required/>
      <input name="nomE" type="text" placeholder="Nom de l'entreprise" required/>
      <input name="mdp" type="text" placeholder="Mot de passe" required>
    </div>

    <p class="inscription">En créant votre compte, vous acceptez nos <span>termes </span>& <span>conditions</span> & <span></span><span>politique de confidentialité.</span></p>
    <div align="center">
      <button type="submit">S'inscrire</button>
    </div>
  </form>

</body>
<script src="js/script.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script></body>
</html>
</html>
