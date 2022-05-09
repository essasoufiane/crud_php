<?php

// var_dump($_POST);
$bdd = new PDO('mysql:host=localhost;dbname=gta_rp','root','');
if (!empty($_POST['gameID'])) {


    $idGame = $_POST['gameID']; // vérifier type

    $req = "DELETE FROM utilisateur WHERE id_user= :id";
    $stmt = $bdd->prepare($req); // ou ecrire dans prepare 
    $stmt->bindValue(":id", $idGame, PDO::PARAM_INT);
    $result = $stmt->execute(); // si good redirection !
    $stmt->closeCursor();


    if ($result) {
        header("Location: affichage.php");
    }
}