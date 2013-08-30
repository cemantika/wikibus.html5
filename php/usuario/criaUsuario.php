<?php
	//chama o arquivo de conexão com o bd
	include("../conectar.php");

	$info = $_POST['usuarios'];

	$data = json_decode(stripslashes($info));

	$nome = $data->nome;
	$email = $data->email;
	$senha = $data->senha;
	
	//consulta sql
	$query = sprintf("INSERT INTO usuario (nome, email, senha) values ('%s', '%s', '%s')",
		mysql_real_escape_string($nome),
		mysql_real_escape_string($email),
		mysql_real_escape_string($senha)		
		);

	$rs = mysql_query($query);
	 
	echo json_encode(array(
		"success" => mysql_errno() == 0,
		"usuario" => array(
			"id" => mysql_insert_id(),
			"nome" => $nome,
			"email" => $email,
			"senha" => $senha						
		)
	));
?>