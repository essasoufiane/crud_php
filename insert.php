<?php

// var_dump($_POST);

if ((!empty($_POST["nom"] && $_POST["prenom"] && $_POST["code_postal"] && $_POST["celibataire"] && $_POST["salaire"] && $niveau = $_POST["niveau"])) && (preg_match("#^[0-9]{5}$#",$_POST['code_postal']))) {

            $plane = htmlspecialchars($_POST["nom"]);
            $prenon = htmlspecialchars($_POST["prenom"]);
            $code_postal = intval($_POST["code_postal"]);
            $celibataire = $_POST["celibataire"];
            $salaire = $_POST["salaire"];
            $photo = $_POST["photo"];
            $niveau = $_POST["niveau"];
        
    
      

    
}else{
    header("Location: index.php");
    // echo "vous devez mettre nom";
}


var_dump(is_string(intval($_POST["nom"])));
var_dump(is_string($prenon));
var_dump(gettype(intval($code_postal)));
var_dump(is_string($code_postal));
var_dump(gettype(intval($salaire)));
var_dump(gettype($salaire));
echo $salaire;
// je stock la date et l'heure actuelle dans une variable
$date_creation = date('d-m-y h:i:s');

// ouvertur d'une connexion a la BDD

// $objetPDO = new PDO('mysql:host=localhost;dbname=gta_rp','root','');

// Préparer la requete d'insertion 

// $pdoStat = $objetPDO->prepare('INSERT INTO utilisateur VALUES (NULL, :nom, :prenom, :code_postal, :celibataire, :salaire, :photo, :niveau, :date_creation)');

// je lie chaque marqueur à une valeur

// $pdoStat->bindValue(':nom', $_POST["nom"], PDO::PARAM_STR);
// $pdoStat->bindValue(':prenom', $_POST["prenom"], PDO::PARAM_STR);
// $pdoStat->bindValue(':code_postal', $_POST["code_postal"], PDO::PARAM_INT);
// $pdoStat->bindValue(':celibataire', $_POST["celibataire"], PDO::PARAM_BOOL);
// $pdoStat->bindValue(':salaire', $_POST["salaire"], PDO::PARAM_INT);
// $pdoStat->bindValue(':photo', $_POST["photo"], PDO::PARAM_STR);
// $pdoStat->bindValue(':niveau', $_POST["niveau"], PDO::PARAM_INT);
// $pdoStat->bindValue(':date_creation', $date_creation);

// execution de la requete préparée

// $insertIsOk = $pdoStat->execute();

// if($insertIsOk){
//     $message = 'le contact a ete ajouter a la BDD';
// }else{
//     $message = 'echec de l\insertion';
// }

?>

<!-- <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>

<h1>Insertion des données</h1>
    <p><?php echo $message; ?></p>
</body>
</html> -->