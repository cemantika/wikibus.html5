<?php
	//chama o arquivo de conexão com o bd
	include("../conectar.php");

	$info = $_POST['pontos'];

	$data = json_decode(stripslashes($info));

	//cria endereco
	$tipo = ($data->logradouro . "|" . $data->referencia);;
	$Sbairro = ($data->cidade . "|" . $data->bairro);
	$nome = ($data->pais . "|" . $data->estado);
	
	$query = sprintf("INSERT INTO enderecos (id_endereco, nome, bairro, tipo) values (nextval('sq_enderecos'),'%s', '%s', '%s') RETURNING id_endereco",
			pg_escape_string($nome),
			pg_escape_string($Sbairro),
			pg_escape_string($tipo)
	);
	
	$rs = pg_query($query);
	$row = pg_fetch_row($rs);
	$idEndereco = $row[0];
	
	//cria ponto
	$descricao_parada = ($data->latitude . "|" . $data->longitude);
	$nome_parada = ($data->numero . "|" . $data->cep);
	$adornoGeo = "0101000020E610000000000000000000000000000000000000";
	
	$query = sprintf("INSERT INTO paradas (id_parada, id_endereco, nome_parada, localizacao, descricao_parada) values (nextval('sq_paradas'), '%d', '%s', '%s', '%s') RETURNING id_parada",
		pg_escape_string($idEndereco),
		pg_escape_string($nome_parada),
		pg_escape_string($adornoGeo),
		pg_escape_string($descricao_parada)
		);

	$rs = pg_query($query);
	$row = pg_fetch_row($rs);
	$idParada = $row[0];
	
	list($logradouro, $referencia) = explode("|", $tipo);
	list($numero, $cep) = explode("|", $nome_parada);
	list($latitude, $longitude) = explode("|", $descricao_parada);
	list($cidade, $bairro) = explode("|", $Sbairro);
	list($pais, $estado) = explode("|", $nome);
	
	echo json_encode(array(
		"success" => pg_last_error() == 0,
		"pontos" => array(
			"id" => $idParada,
			"latitude" => $latitude,
			"longitude" => $longitude,
			"numero" => $numero,
			"logradouro" => $logradouro,
			"bairro" => $bairro,
			"cidade" => $cidade,
			"estado" => $estado,
			"pais" => $pais,
			"cep" => $cep,
			"referencia" => $referencia						
		)
	));
?>