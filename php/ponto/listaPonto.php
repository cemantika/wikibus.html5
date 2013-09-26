<?php
	//chama o arquivo de conexão com o bd
	include("../conectar.php");
	 
	$condicao = isset($_GET['id_ponto']) ? sprintf(" AND id_parada='%d' ", $_GET['id_ponto']) : ''; 
	
	//consulta sql
	$query = pg_query("SELECT id_parada, id_endereco, nome_parada, ST_X(localizacao), ST_Y(localizacao), descricao_parada FROM paradas " . $condicao) or die(pg_last_error());
	
	//faz um looping e cria um array com os campos da consulta
	$rows = array('pontos' => array());
	while($dadosParadas = pg_fetch_assoc($query)) {
		/*print_r($dadosParadas);
		die;*/
		
		$dados['id_ponto'] = $dadosParadas['id_parada'];
		$dados['latitude'] = $dadosParadas['st_x'];
		$dados['longitude'] = $dadosParadas['st_y'];
		$dados['referencia'] = $dadosParadas['descricao_parada'];
		$dados['numero'] = $dadosParadas['nome_parada'];
		
		//seleciona os enderecos de cada parada
		$queryEnd = sprintf("SELECT nome, bairro, cep FROM enderecos WHERE id_endereco = '%d'",
				pg_escape_string($dadosParadas['id_endereco']));
		$rs = pg_query($queryEnd);
		$dadosEnderecos = pg_fetch_assoc($rs);
		
		$dados['logradouro'] = $dadosEnderecos['nome'];
		$dados['bairro'] = $dadosEnderecos['bairro'];
		$dados['cep'] = $dadosEnderecos['cep'];
		
		//list($dados['1'], $dados['2']) = explode("|", $dadosEnd['3']);
		$rows['pontos'][] = $dados;
	}
	
	//encoda para formato JSON
	echo json_encode($rows);
?>