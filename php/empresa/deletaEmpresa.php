 <?php
	//chama o arquivo de conexão com o bd
	include("../conectar.php");

	$info = $_POST['empresas'];

	$data = json_decode(stripslashes($info));

	$id = $data->id_empresa;
	 
	//consulta sql
	$query = sprintf("DELETE FROM empresas_permissionarias WHERE id_empresa_permissionaria=%d",
		pg_escape_string($id));

	$rs = pg_query($query);
	 
	echo json_encode(array(
		"success" => pg_error() == 0
	));
?>