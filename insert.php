<?php

// var_dump($_POST);

if ((!empty($_POST["nom"] && $_POST["prenom"] && $_POST["code_postal"] && $_POST["celibataire"] && $_POST["salaire"] && $niveau = $_POST["niveau"])) && (preg_match("#^[0-9]{5}$#",$_POST['code_postal']))) {

            $nom = htmlspecialchars($_POST["nom"]);
            $prenon = htmlspecialchars($_POST["prenom"]);
            $code_postal = intval($_POST["code_postal"]);
            $celibataire = $_POST["celibataire"];
            $salaire = $_POST["salaire"];
            $photo = $_POST["photo"];
            $niveau = $_POST["niveau"];
        
    
      

    
}else{
    ?>
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
    </head>
    <body>
    <?php require_once "partials/header.php" ?>
    
    <div class="text-center">

        <h1>problème</h1>
            <p>veuillez verifier les champs</p>
    </div>
    </body>
    </html>

    <?php
}

// teste car j'ai essayer de rejouter des controle mais j'ai eu des complication j'ai preferer y revenir plustard si j'ai le temps

// var_dump(is_string(intval($_POST["nom"])));
// var_dump(is_string($prenon));
// var_dump(gettype(intval($code_postal)));
// var_dump(is_string($code_postal));
// var_dump(gettype(intval($salaire)));
// var_dump(is_string($salaire));
// echo $salaire;

// -------------------------------------insertion BDD---------------------

// je stock la date et l'heure actuelle dans une variable
$date_creation = date('d-m-y h:i:s');

// ouvertur d'une connexion a la BDD

$objetPDO = new PDO('mysql:host=localhost;dbname=gta_rp','root','');

// Préparer la requete d'insertion 

$pdoStat = $objetPDO->prepare('INSERT INTO utilisateur VALUES (NULL, :nom, :prenom, :code_postal, :celibataire, :salaire, :photo, :niveau, :date_creation)');

// je lie chaque marqueur à une valeur

if (isset($nom)) {
    # code...
    $pdoStat->bindValue(':nom', $nom, PDO::PARAM_STR);
    $pdoStat->bindValue(':prenom', $prenon, PDO::PARAM_STR);
    $pdoStat->bindValue(':code_postal', $code_postal, PDO::PARAM_INT);
    $pdoStat->bindValue(':celibataire', $celibataire, PDO::PARAM_BOOL);
    $pdoStat->bindValue(':salaire', $salaire, PDO::PARAM_INT);
    $pdoStat->bindValue(':photo', $photo, PDO::PARAM_STR);
    $pdoStat->bindValue(':niveau', $niveau, PDO::PARAM_INT);
    $pdoStat->bindValue(':date_creation', $date_creation);
}


// execution de la requete préparée

$insertIsOk = $pdoStat->execute();

if($insertIsOk){
    $message = 'le contact a ete ajouter a la BDD';
}else{
    $message = "echec de l'insertion";
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
<?php require_once "partials/header.php" ?>

<div class="container text-center">

    
        <p><?=$message?></p>
</div>
</body>
</html>





