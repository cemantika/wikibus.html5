<?php
	//chama o arquivo de conexão com o bd
	include("../conectar.php");

	$info = $_POST['empresas'];

	$data = json_decode(stripslashes($info));

	$nome = utf8_encode($data->nome);
	 
	//consulta sql
	$query = sprintf("INSERT INTO empresas_permissionarias (id_empresa_permissionaria,nome_fantasia) values (nextval('sq_empresas_permissionarias'),'%s') RETURNING id_empresa_permissionaria",
		pg_escape_string($nome));

	$rs = pg_query($query);
	$row = pg_fetch_row($rs);
	$id = $row[0];
	 
	echo json_encode(array(
		"success" => pg_last_error() == 0,
		"empresas" => array(
			"id_empresa" => $id,
			"nome" => $nome
		)
	));
?>