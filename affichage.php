<?php

$bdd = new PDO('mysql:host=localhost;dbname=gta_rp','root',''); // connexion à la BDD

$req  = $bdd->prepare("SELECT * FROM utilisateur"); // la requete 

$req->execute(); // envoi et execution en BDD 

$myGames = $req->fetchAll(PDO::FETCH_ASSOC); // recupere les datas de la req on met dans un tableau

$req->closeCursor(); // coupe la connection avec la bdd 

// var_dump($myGames); c'etait juste pour verifier

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>

<body>

    <main class="container">


        <h1 class="p-4 my-5 bg-info text-white text-center">Liste des joueurs GTA RP </h1>


        <table class="table table-hover text-center">
            <thead class="bg-info">
                <tr>
                    <th scope="col">nom</th>
                    <th scope="col">prenom</th>
                    <th scope="col">code_postal</th>
                    <th scope="col">celibataire</th>
                    <th scope="col">salaire</th>
                    <th scope="col">photo</th>
                    <th scope="col">niveau</th>
                    <th scope="col">date_creation</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($myGames as $game) : ?>
                    <tr class="table">
                        <td> <?= $game['nom'] ?></td>
                        <td> <?= $game['prenon'] ?></td>
                        <td> <?= $game['code_postal'] ?></td>
                        <td> <?= $game['celibataire'] ?></td>
                        <td> <?= $game['salaire'] ?> &euro;</td>
                        <td> <?= $game['photo'] ?></td>
                        <td> <?= $game['loyauter'] ?></td>
                        <td> <?= $game['date-creation'] ?></td>

                    </tr>
                <?php endforeach; ?>
            </tbody>
        </table>

    </main>

</body>

</html>