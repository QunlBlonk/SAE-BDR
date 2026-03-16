<!DOCTYPE html>
<html>
<body>
 
<?php
include('myparam.inc.php');
$conn = oci_connect(MYUSER, MYPASS, MYHOST);


if (isset($_POST["login"]) && isset($_POST["pass"])){
    echo $_POST["login"]."<br>";
    echo $_POST["pass"];
    
    $log = explode('.', $_POST["login"]);
	$prem = $log[0];
	$nom = $log[1];
	
	$req="SELECT mdp FROM PERSONNEL WHERE prenom_personnel = :prem AND nom_personnel = :nom";
	$prep = oci_parse($conn, $req);
	oci_bind_by_name($prep, ':prem', $prem);
	oci_bind_by_name($prep, ':nom', $nom);
	oci_execute($prep);
	$mdp = oci_fetch_array($prep)['MDP'];
	if (password_verify($_POST["pass"], $mdp) == 1){
		echo "yes";
	}
	
	echo "<table border='1'>\n";
	while ($row = oci_fetch_array($prep, OCI_ASSOC+OCI_RETURN_NULLS)) {
    echo "<tr>\n";
    foreach ($row as $item) {
        echo "    <td>" . ($item !== null ? htmlentities($item, ENT_QUOTES) : "&nbsp;") . "</td>\n";
		}
		echo "</tr>\n";
	}
	echo "</table>\n";


    $pass = password_hash($_POST["pass"], PASSWORD_DEFAULT);
    $s = password_verify('zzz', $pass);
    //echo $pass;

   

   

}



if (!$conn) {
    $e = oci_error();
    echo "Erreur de connexion : " . $e['message'];
} else {
    echo "Connexion réussie à Oracle !";
 
}
$req="SELECT * FROM PERSONNEL";
$prep = oci_parse($conn, $req);
oci_execute($prep);
//$e = oci_error();
//echo $e['message'];

?>

<form action="<?php $_SERVER['PHP_SELF']?>" method="POST">
    login : <input type="text" name="login"> <br>
    password : <input type="text" name="pass"> <br>
    <input type="submit" value="envoie" name="sub">

</form>

</body>
</html>
