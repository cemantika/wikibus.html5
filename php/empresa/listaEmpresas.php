<?php
	//chama o arquivo de conexão com o bd
	include("../conectar.php");
	 
	$condicao = isset($_GET['nome']) ? sprintf(" AND nome_fantasia='%s' ", $_GET['nome']) : ''; 
	
	//consulta sql
	$query = pg_query("SELECT id_empresa_permissionaria as id_empresa, nome_fantasia as nome FROM empresas_permissionarias WHERE (1=1) " . $condicao) or die(pg_error());
	 
	//faz um looping e cria um array com os campos da consulta
	$rows = array('empresas' => array());
	while($dados = pg_fetch_assoc($query)) {
	    $rows['empresas'][] = $dados;
	}

	//encoda para formato JSON
	echo json_encode($rows);
?>