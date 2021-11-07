<?php
  session_start();
  $controle = "accueil";
  $action = "promo";
  if (isset($_GET["controle"]) && isset($_GET["action"])) {
      $controle = $_GET["controle"];
      $action = $_GET["action"];
  }
  require("./controle/$controle.php");
  $action();
?>
