<?php
//CONEXAO COM BANCO POSTGRES 
//header('Content-Type: text/html; charset=utf-8');

//nome do servidor (200.128.51.48)
$servidor = "localhost";

//porta padrão 5432
$porta = 5432;

//usuÃ¡rio do banco de dados
$user = "postgres";

//senha do banco de dados
$senha = "postgres";

//nome da base de dados
$db = "simtur";

//executa a conexÃ£o com o banco, caso contrÃ¡rio mostra o erro ocorrido
$conexao = pg_connect("host=$servidor port=$porta dbname=$db user=$user password=$senha");
if (!$conexao) {
die("Não foi possível se conectar ao banco de dados.");
}
?>
