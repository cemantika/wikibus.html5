<?php
	//chama o arquivo de conexão com o bd
	include("../conectar.php");
	 
	$condicao = isset($_GET['email']) && isset($_GET['senha']) ? sprintf(" AND email='%s' ", $_GET['email'] AND senha ='%s' ", $_GET['senha']) : ''; 
	
	//consulta sql
	$query = mysql_query("SELECT * FROM usuario WHERE (1=1) " . $condicao) or die(mysql_error());
	 
	//faz um looping e cria um array com os campos da consulta
	$rows = array('usuario' => array());
	while($dados = mysql_fetch_assoc($query)) {
	    $rows['usuario'][] = $dados;
	}

	//encoda para formato JSON
	echo json_encode($rows);
?>