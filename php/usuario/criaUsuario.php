<?php
	//chama o arquivo de conexão com o bd
	include("../conectar.php");

	$info = $_POST['usuarios'];

	$data = json_decode(stripslashes($info));

	$nome = $data->nome;
	$email = $data->email;
	$senha = $data->senha;
	$adorno = 0;
	$adornoDate = "2013-09-17";
	$adornoGeo = "0101000020E610000000000000000000000000000000000000";
	
	//consulta sql
	$query = sprintf("INSERT INTO usuarios (id_usuario, nome_usuario, email, senha, login, data_ingresso, data_ultimo_acesso, localizacao, data_nascimento, ativo) values (nextval('sq_usuarios'),'%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%d') RETURNING id_usuario", 
		pg_escape_string($nome),
		pg_escape_string($email),
		pg_escape_string($senha),
		pg_escape_string($adorno),
		pg_escape_string($adornoDate),
		pg_escape_string($adornoDate),
		pg_escape_string($adornoGeo),
		pg_escape_string($adornoDate),
		pg_escape_string($adorno)
		);
	
	$rs = pg_query($query);
	$row = pg_fetch_row($rs);
	$id = $row[0];
	
	echo json_encode(array(
		"success" => pg_last_error() == 0,
		"usuarios" => array(
			"id" => $id,
			"nome" => $nome,
			"email" => $email,
			"senha" => $senha						
		)
	));
?>