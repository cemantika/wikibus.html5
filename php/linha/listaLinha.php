<?php
	//chama o arquivo de conexУЃo com o bd
	include("../conectar.php");
	 
	$condicao = isset($_GET['numero']) ? sprintf(" AND numero='%s' ", $_GET['numero']) : '';  
	
	//consulta sql
	$query = pg_query("SELECT * FROM linhas WHERE (1=1) " . $condicao) or die(pg_last_error());
	
	//faz um looping e cria um array com os campos da consulta
	$rows = array('linhas' => array());
	while($dados = pg_fetch_assoc($query)) {
		list($dados['origem'],$dados['destino']) = explode("|", $dados['nome']);
		$rows['linhas'][] = $dados;
	}
	//encoda para formato JSON
	echo json_encode($rows);
	
	//Ainda nуo foi resolvida a questуo da obtenчуo das colunas "origem" e "destino" a partir da coluna "nome" no banco
?>