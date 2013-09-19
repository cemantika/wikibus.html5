<?php
	//chama o arquivo de conexão com o bd
	include("../conectar.php");
//INCOMPLETO
	$info = $_POST['itinerarios'];

	$data = json_decode(stripslashes($info));

	$numero = $data->numero;
	$id_ponto = $data->id_ponto;
	$id_ponto_anterior = isset($data->id_ponto_anterior) ? $data->id_ponto_anterior : 'NULL';
	$sequencia = isset($data->sequencia) ? $data->sequencia : 'NULL';
	 
	$rs = pg_query("select id_linha from linha WHERE numero = " . $numero);
	$row = pg_fetch_row($rs);
	$id_linha = $row[0];
	
	
	//consulta sql
	$query = sprintf("INSERT INTO itinerario (id_linha, id_ponto, id_ponto_anterior, sequencia) VALUES (%s, %s, %s, %s)",
		mysql_real_escape_string($id_linha),
		mysql_real_escape_string($id_ponto),
		mysql_real_escape_string($id_ponto_anterior),
		mysql_real_escape_string($sequencia));

	$rs = pg_query($query);
	echo $rs . "<br><br>";
	echo json_encode(array(
		"success" => pg_error() == 0,
		"itinerarios" => array(
			"id" => mysql_insert_id(),
			"id_linha" => $id_linha,
			"id_ponto" => $id_ponto,
			"id_ponto_anterior" => $id_ponto_anterior
		)
	));
?>