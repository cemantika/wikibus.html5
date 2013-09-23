<?php
	//chama o arquivo de conexão com o bd
	include("../conectar.php");
	
	$info = $_POST['itinerarios'];

	$data = json_decode(stripslashes($info));

	$numero = $data->numero;
	$id_ponto = $data->id_ponto;
	$id_ponto_anterior = isset($data->id_ponto_anterior) ? $data->id_ponto_anterior : 'NULL';
	$sequencia = isset($data->sequencia) ? $data->sequencia : 'NULL';
	 
	$rs = pg_query("SELECT id_linha from linhas WHERE numero = " . $numero);
	$row = pg_fetch_row($rs);
	$id_linha = $row[0];

	//consulta sql
	$query = sprintf("INSERT INTO linhas_paradas (id_linhas, id_paradas, parada_anterior, proxima_parada) VALUES ('%d', '%d', '%d', '%d')",
		pg_escape_string($id_linha),
		pg_escape_string($id_ponto),
		pg_escape_string($id_ponto_anterior),
		pg_escape_string($sequencia));

	$rs = pg_query($query);
	echo $rs . "<br><br>";
	echo json_encode(array(
		"success" => pg_last_error() == 0,
		"itinerarios" => array(
			"id_linha" => $id_linha,
			"id_ponto" => $id_ponto,
			"id_ponto_anterior" => $id_ponto_anterior
		)
	));
?>