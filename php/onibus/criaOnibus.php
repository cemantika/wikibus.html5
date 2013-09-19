<?php
	//chama o arquivo de conexão com o bd
	include("../conectar.php");

	$info = $_POST['onibus'];

	$data = json_decode(stripslashes($info));

	$numero = $data->numero;
	$id_empresa = $data->id_empresa;
	$adorno = 0;
	$adaptado = $data->adaptado;
	
	$query = sprintf("INSERT INTO carros (id_carro, tipo_localizador, id_empresas_permissionarias, acessibilidade, cap_passag_pe, cap_passag_sen, capacidade_tanque, cor, placa) VALUES (nextval('sq_carros'),'%s','%d','%d','%d','%d','%d','%s','%s') RETURNING id_carro",
		pg_escape_string($numero),
		pg_escape_string($id_empresa),
		pg_escape_string($adaptado),
		pg_escape_string($adorno),
		pg_escape_string($adorno),
		pg_escape_string($adorno),
		pg_escape_string($adorno),
		pg_escape_string($adorno));
	

	$rs = pg_query($query);
	$row = pg_fetch_row($rs);
	$id = $row[0];
	
	echo $rs . "<br><br>";
	echo json_encode(array(
		"success" => pg_last_error() == 0,
		"onibus" => array(
			"id" => $id,
			"numero" => $numero,
			"id_empresa" => $id_empresa,
			"adaptado" => $adaptado
		)
	));
?>