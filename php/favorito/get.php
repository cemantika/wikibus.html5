<?php
  include("../conectar.php");

  $id_usuario = $_GET['id_usuario'];
  $tipo = $_GET['tipo'];
  $id_entidade = $_GET['id_entidade'];

  $query = sprintf("SELECT * FROM favorito WHERE id_usuario = %d AND tipo = '%s' AND id_entidade = %d", $id_usuario, $tipo, $id_entidade);
  $rs = mysql_query($query);

  $inserido = 0;

  $rows = mysql_num_rows($rs);

  echo json_encode(array(
	  "success" => mysql_errno() == 0,
	  "favoritos" => $rows
	));
?>
