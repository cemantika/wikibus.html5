 <?php
	//chama o arquivo de conexão com o bd
	include("../conectar.php");

	$info = $_POST['empresas'];

	$data = json_decode(stripslashes($info));

	$nome = $data->nome;
	$id = $data->id_empresa;
	 
	//consulta sql
	$query = sprintf("UPDATE Empresa SET nome_fantasia = '%s' WHERE id_empresa_permissionaria=%d",
		pg_escape_string($nome),
		pg_escape_string($id));

	$rs = pg_query($query);
	 
	echo json_encode(array(
		"success" => pg_error() == 0
	));
?>