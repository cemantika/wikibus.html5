<?php
	//chama o arquivo de conexão com o bd
	include("../conectar.php");

	$info = $_POST['linhas'];

	$data = json_decode(stripslashes($info));

	$id = $data->id_linha;
	 
	//consulta sql
	$query = sprintf("DELETE FROM linha WHERE id= %d",
		mysql_real_escape_string($id));

	$rs = mysql_query($query);
	 
	echo json_encode(array(
		"success" => mysql_errno() == 0
	));
?>