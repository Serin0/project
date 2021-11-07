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
      <body id="facture">
          <form action="index.php?controle=facture&action=chercher" method="post">
          <div class="form-row">
            <div class="form-group col-sm-5">
                <div class="form-controll">
                <select name="client" class="form-control form-control-lg">
                    <?php

                    foreach($clients as $c){
                      echo '<option value="'.$c['id'].'">'.$c['nomE'].'</option>';
                    }

                    ?>
                  </select>
                </div>
            </div>
            <div class="form-group col-sm-5">
                <div class="form-controll">
                <select name="moisCourant" class="form-control form-control-lg">
                    <option value="1">January</option>
                    <option value="2">February</option>
                    <option value="3">March</option>
                    <option value="4">April</option>
                    <option value="5">May</option>
                    <option value="6">June</option>
                    <option value="7">July</option>
                    <option value="8">August</option>
                    <option value="9">September</option>
                    <option value="10">October</option>
                    <option value="11">November</option>
                    <option value="12">December</option>
                  </select>
                </div>
            </div>
              <button type="submit">Chercher</button>
          </div>
        </form>


    <table class="table table-bordered">
        <thead>
          <tr>
            <th scope="col">Nom du modele</th>
            <th scope="col">Id</th>
            <th scope="col">Quantité</th>
            <th scope="col">Prix unitaire</th>
            <th scope="col">Date début</th>
            <th scope="col">Date fin</th>
            <th scope="col">Prix Total</th>
          </tr>
        </thead>
        <tbody>
          <?php
            $total=0;
            foreach ($listFacture as $f){
              getVoiture($f['idVoiture'], $resultat);

          echo '<tr>';
            echo '<td>'.$resultat['model'].'</td>';
            echo '<td>'.$f['nb'].'</td>';
            echo '<td>'.$resultat['prix'].'</td>';
            echo '<td>'.$f['dateDebut'].'</td>';
            echo '<td>'.$f['dateFin'].'</td>';
            $dateDebut = new DateTime($f['dateDebut']);
            $dateFin = new DateTime($f['dateFin']);
            $diff = $dateFin->diff($dateDebut)->format("%a");
            $prixLoc = $f['nb']*$resultat['prix']*$diff;
            echo '<td>'.$prixLoc.'</td>';
            $total += $prixLoc;
          echo '</tr>';
          }

        echo '</tbody>';
      echo '</table>';

      echo '<div class="total">';
      echo '<table class="table table-bordered ">';
        echo '<thead>';
          echo'<tr>';
            echo '<th scope="col">Total Facture</th>';
          echo '</tr>';
        echo '</thead>';
        echo '<tbody>';
          echo '<tr>';
            echo '<td>'.$total.'</td>';

          ?>


          </tr>
        </tbody>
      </table>
    </div>
</body>
<script src="js/script.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script></body>
</html>
