<?php
	//chama o arquivo de conexão com o bd
	include("../conectar.php");
	
	$condicao = isset($_GET['id_ponto']) ? sprintf(" AND id_paradas='%s' ", $_GET['id_ponto']) : '';  
	$condicao .= isset($_GET['id_linha']) ? sprintf(" AND i.id_linhas='%s' ", $_GET['id_linha']) : '';  
	$condicao .= isset($_GET['numero']) ? sprintf(" AND l.numero='%s' ", $_GET['numero']) : ''; 

	if(isset($_GET['atualiza'])){
		$sql = sprintf("UPDATE linhas_paradas SET parada_anterior = '%d', proxima_parada = '%d' WHERE id_linhas = '%d' AND id_paradas = '%d' ", $_GET['id_ponto_anterior'], $_GET['sequencia'], $_GET['id_linha'], $_GET['id_ponto']);
	}else{
		$sql = "SELECT i.id_linhas, i.id_paradas, i.parada_anterior, l.numero, i.proxima_parada|||||AQUI|||||, l.nome FROM linhas_paradas i INNER JOIN linhas l ON l.id_linha = i.id_linhas WHERE (1=1) " . $condicao . " order by l.numero ";
	}
	
	$query = pg_query($sql) or die(pg_last_error());
	
	/*
	id_linha int(11)			id_linhas int
	id_ponto int(11)			id_paradas int
	id_ponto_anterior int(11)	parada_anterior int
	sequencia smallint(6)		proxima_parada int
	*/
	
	//faz um looping e cria um array com os campos da consulta
	$rows = array('itinerarios' => array());
	
	if(isset($_GET['atualiza'])){
	
		echo json_encode(array(
			"success" => pg_last_error() == 0
		));	
		
	}else{
	
		while($dados = pg_fetch_assoc($query)) {
			$rows['itinerarios'][] = $dados;
		}
		
		//encoda para formato JSON
		echo json_encode($rows);	
		
	}
?>