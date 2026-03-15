<!DOCTYPE html>
<html>
<body>
 
<?php
include('myparam.inc.php');
$conn = oci_connect(MYUSER, MYPASS, MYHOST);


if (isset($_POST["login"]) && isset($_POST["pass"])){
    echo $_POST["login"]."<br>";
    echo $_POST["pass"];






    $pass = password_hash($_POST["pass"], PASSWORD_DEFAULT);
    echo $pass;

    $req="SELECT * FROM ANIMAL";
    $prep = oci_parse($conn, $req);
    $q="ANIMAL";
    //oci_bind_by_name($prep, ':pass', $q);
    oci_execute($prep);

    while (($row = oci_fetch_array($prep, OCI_BOTH)) != false) {
        echo $row['ID_ANIMAL'];
    }

}



if (!$conn) {
    $e = oci_error();
    echo "Erreur de connexion : " . $e['message'];
} else {
    echo "Connexion réussie à Oracle !";
 
}
?>

<form action="<?php $_SERVER['PHP_SELF']?>" method="POST">
    login : <input type="text" name="login"> <br>
    password : <input type="text" name="pass"> <br>
    <input type="submit" value="envoie" name="sub">

</form>

</body>
</html>