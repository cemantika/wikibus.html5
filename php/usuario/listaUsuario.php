<?php
	//chama o arquivo de conexão com o bd
	include("../conectar.php");
	 
	$condicao = isset($_GET['nome']) ? sprintf(" AND nome='%s' ", $_GET['nome']) : ''; 
	
	//consulta sql
	$query = pg_query("SELECT * FROM usuarios WHERE (1=1) " . $condicao) or die(pg_last_error());
	 
	//faz um looping e cria um array com os campos da consulta
	$rows = array('usuarios' => array());
	while($dados = pg_fetch_assoc($query)) {
	    $rows['usuarios'][] = $dados;
	}

	//encoda para formato JSON
	echo json_encode($rows);
?>