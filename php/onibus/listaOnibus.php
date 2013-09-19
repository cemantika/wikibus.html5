<?php
	//chama o arquivo de conexão com o bd
	include("../conectar.php");
	 
	$condicao = isset($_GET['numero']) ? sprintf(" AND tipo_localizador='%s' ", $_GET['numero']) : '';  
	
	//consulta sql
	$query = pg_query("SELECT id_carro as id_onibus, id_empresas_permissionarias as id_empresa, tipo_localizador as numero, acessibilidade as adaptado FROM carros WHERE (1=1) " . $condicao) or die(pg_error());

	//faz um looping e cria um array com os campos da consulta
	$rows = array('onibus' => array());
	while($dados = pg_fetch_assoc($query)) {
	    $rows['onibus'][] = $dados;
	}

	//encoda para formato JSON
	echo json_encode($rows);
?>