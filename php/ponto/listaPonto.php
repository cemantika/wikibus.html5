<?php
	//chama o arquivo de conexão com o bd
	include("../conectar.php");
	 
	$condicao = isset($_GET['id_ponto']) ? sprintf(" AND id_parada='%d' ", $_GET['id_ponto']) : ''; 
	
	//consulta sql
	$query = pg_query("SELECT * FROM paradas WHERE (1=1) " . $condicao) or die(pg_last_error());
	 
	//faz um looping e cria um array com os campos da consulta
	$rows = array('pontos' => array());
	while($dadosParadas = pg_fetch_assoc($query)) {
		if($dadosParadas['id_parada']>300){
			
			$dados['id_ponto'] = $dadosParadas['id_parada'];
			
			//seleciona os enderecos de cada parada
			$queryEnd = sprintf("SELECT nome, bairro, tipo FROM enderecos WHERE id_endereco = '%d'",
					pg_escape_string($dadosParadas['id_endereco']));
			$rs = pg_query($queryEnd);
			$dadosEnderecos = pg_fetch_assoc($rs);
			
			//Quebrando dados da tabela enderecos
			list($dados['logradouro'], $dados['referencia']) = explode("|", $dadosEnderecos['tipo']);
			list($dados['cidade'], $dados['bairro']) = explode("|", $dadosEnderecos['bairro']);
			list($dados['pais'], $dados['estado']) = explode("|", $dadosEnderecos['nome']);
			
			//Quebrando dados da tabela paradas
			list($dados['numero'], $dados['cep']) = explode("|", $dadosParadas['nome_parada']);
			list($dados['latitude'], $dados['longitude']) = explode("|", $dadosParadas['descricao_parada']);
			
			$rows['pontos'][] = $dados;
		}
	}
	
	//encoda para formato JSON
	echo json_encode($rows);
?>