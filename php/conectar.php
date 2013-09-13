<?php
//CONEXAO COM BANCO MYSQL
//header('Content-Type: text/html; charset=utf-8');

//nome do servidor (127.0.0.1)
$servidor = "127.0.0.1";

//usuário do banco de dados
$user = "root";

//senha do banco de dados
$senha = "test";

//nome da base de dados
$db = "wikibus";

//executa a conexão com o banco, caso contrário mostra o erro ocorrido
$conexao = mysql_connect($servidor,$user,$senha) or die (mysql_error());

//seleciona a base de dados daquela conexão, caso contrário mostra o erro ocorrido
$banco = mysql_select_db($db, $conexao) or die(mysql_error());

// Definindo o charset como utf8 para evitar problemas com acentuação
//mysql_query("SET NAMES 'utf8'");
//mysql_query('SET character_set_connection=utf8');
//mysql_query('SET character_set_client=utf8');
//mysql_query('SET character_set_results=utf8');

/*
//CONEXAO COM BANCO POSTGRES 
//header('Content-Type: text/html; charset=utf-8');

//nome do servidor (200.128.51.48)
$servidor = "200.128.51.48";

//porta padrão 5432
$porta = 5432;

//usuÃ¡rio do banco de dados
$user = "postgres";

//senha do banco de dados
$senha = "senha";

//nome da base de dados
$db = "ubibus";

//executa a conexÃ£o com o banco, caso contrÃ¡rio mostra o erro ocorrido
$conexao = pg_connect("host=$servidor port=$porta dbname=$db " + "user=$user password=$senha");
if (!$conexao) {
die("Não foi possível se conectar ao banco de dados.");
}*/
?>
