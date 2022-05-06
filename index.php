<?php require_once "partials/header.php" ?>



<html>
<body>


<div class="container">

    <form class="text-center form-groupe" action="insert.php" method="post">
    

    <label for="nom">Votre nom:</label>
    <input class="form-control  my-2" type="text" name="nom" id="nom"/>

    <label for="prenom">Votre prénom:</label>
    <input class="form-control  my-2" type="text" name="prenom" id="prenom"/>

    <label for="code_postal">Votre code postal:</label>
    <input class="form-control  my-2" type="text" name="code_postal" id="code_postal"/>

    <label for="celibataire">Coché cette case si vous vous masturber a cause de votre celibat:</label>
    <input class="form-control  my-2" type="checkbox" name="celibataire" id="celibataire"/>

    <label for="salaire">Veuilliez indiquer votre salaire en Dh:</label>
    <input class="form-control  my-2" type="text" name="salaire" id="salaire"/>

    <label for="photo">La photo de votre face de traitre:</label>
    <input class="form-control  my-2" type="text" name="photo" id="photo"/>

    <label for="niveau">Veuilliez indiquer votre niveau de loyauter envers Macron 1er:</label>
    <input class="form-control  my-2" type="range" name="niveau" id="niveau"/>
    

    <button class="btn btn-info my-2" type="submit">Envoyer</button>
    
    </form>
</div>

</body>
</html>