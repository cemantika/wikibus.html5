<?php
	//chama o arquivo de conexão com o bd
	include("../conectar.php");
	 
	$condicao = isset($_GET['id_parada']) ? sprintf(" AND id_parada='%d' ", $_GET['id_parada']) : ''; 
	
	//consulta sql
	$query = pg_query("SELECT * FROM paradas WHERE (1=1) " . $condicao) or die(pg_last_error());
	 
	//faz um looping e cria um array com os campos da consulta
	$rows = array('pontos' => array());
	while(($dados = pg_fetch_assoc($query))&&($dados['id_parada']>300)) {
		
		//seleciona os enderecos de cada parada
		$queryEnd = sprintf("SELECT nome, bairro, tipo FROM enderecos WHERE id_endereco = '%d'",
				pg_escape_string($dados['id_endereco']));
		$dadosEnd = pg_fetch_assoc($queryEnd);
		
		//Quebrando dados da tabela enderecos
		list($dados['logradouro'], $dados['referencia']) = explode("|", $dadosEnd['tipo']);
		list($dados['cidade'], $dados['bairro']) = explode("|", $dadosEnd['bairro']);
		list($dados['pais'], $dados['estado']) = explode("|", $dadosEnd['nome']);
		
		//Quebrando dados da tabela paradas
		list($dados['numero'], $dados['cep']) = explode("|", $dados['nome_parada']);
		list($dados['latitude'], $dados['longitude']) = explode("|", $dados['descricao_parada']);
		$rows['pontos'][] = $dados;
	}
	
	//encoda para formato JSON
	echo json_encode($rows);
?>