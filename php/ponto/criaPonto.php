<?php
	//chama o arquivo de conexão com o bd
	include("../conectar.php");

	$info = $_POST['pontos'];

	$data = json_decode(stripslashes($info));

	//cria endereco
	$nome = $data->logradouro;
	$bairro = $data->bairro;
	$cep = str_replace('-', '', $data->cep);
	
	$query = sprintf("INSERT INTO enderecos (id_endereco, nome, bairro, cep) values (nextval('sq_enderecos'),'%s', '%s', '%d') RETURNING id_endereco",
			pg_escape_string($nome),
			pg_escape_string($bairro),
			pg_escape_string($cep)
	);
	
	$rs = pg_query($query);
	$row = pg_fetch_row($rs);
	$id_endereco = $row[0];
	
	//cria ponto
	$nome_parada = $data->numero;
	$latitude = $data->latitude;
	$longitude = $data->longitude;
	$descricao_parada = $data->referencia;
	
	$query = sprintf("INSERT INTO paradas (id_parada, id_endereco, nome_parada, localizacao, descricao_parada) values (nextval('sq_paradas'), '%d', '%s', ST_GeomFromText('POINT( %s %s)', 4326), '%s') RETURNING id_parada",
		pg_escape_string($id_endereco),
		pg_escape_string($nome_parada),
		pg_escape_string($latitude),
		pg_escape_string($longitude),
		pg_escape_string($descricao_parada)
		);

	$rs = pg_query($query);
	$row = pg_fetch_row($rs);
	$id_parada = $row[0];
	
	echo json_encode(array(
		"success" => pg_last_error() == 0,
		"pontos" => array(
			"id" => $id_parada,
			"latitude" => $latitude,
			"longitude" => $longitude,
			"numero" => $nome_parada,
			"logradouro" => $nome,
			"bairro" => $bairro,
			"cep" => $cep,
			"referencia" => $descricao_parada						
		)
	));
?>