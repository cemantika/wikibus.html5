<?php
//CONEXAO COM BANCO POSTGRES 
//header('Content-Type: text/html; charset=utf-8');

//nome do servidor (200.128.51.48)
$servidor = "localhost";

//porta padr�o 5432
$porta = 5432;

//usuário do banco de dados
$user = "postgres";

//senha do banco de dados
$senha = "senha";

//nome da base de dados
$db = "simtur";

//executa a conexão com o banco, caso contrário mostra o erro ocorrido
$conexao = pg_connect("host=$servidor port=$porta dbname=$db user=$user password=$senha");
if (!$conexao) {
die("Não foi poss�vel se conectar ao banco de dados.");

}
?>
