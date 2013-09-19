<?php
	include("../conectar.php");

  $email = $_POST['email'];

  $query = sprintf("SELECT id_usuario FROM usuarios WHERE email = '%s'",
			pg_escape_string($email)
	);
	
	$rs = pg_query($query);

	if (pg_num_rows($rs) >= 1) {
		echo "EXISTS_IN_DB";
	}else{
		echo "NOT_FOUND";
	}
	
?>