<?php
	//chama o arquivo de conexão com o bd
	include("../conectar.php");

	$info = $_POST['linhas'];

	$data = json_decode(stripslashes($info));

	$numero = $data->numero;
	$nome = ($data->origem . "|" . $data->destino);
	
	//consulta sql
	$query = sprintf("INSERT INTO linhas (id_linha, numero, nome) VALUES (nextval('sq_empresas_permissionarias'), '%s', '%s') RETURNING id_linha",
		pg_escape_string($numero),
		pg_escape_string($nome));

	$rs = pg_query($query);
	$row = pg_fetch_row($rs);
	$id = $row[0];
	
	//algoritmo para identificar os campos "origem" e "destino" a partir do campo "nome" no banco
	list($origem, $destino) = explode("|", $nome);
	
	echo $rs . "<br><br>";
	echo json_encode(array(
		"success" => pg_last_error() == 0,
		"linhas" => array(
			"id" => $id,
			"numero" => $numero,
			"origem" => $origem,
			"destino" => $destino
		)
	));
?>