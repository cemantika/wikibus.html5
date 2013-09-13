<?php
  include("../conectar.php");

  $info = $_POST['favorito'];

  $data = json_decode(stripslashes($info));
	 
  $id_usuario = $data->id_usuario;
  $tipo = $data->tipo;
  $id_entidade = $data->id_entidade;

  $query = sprintf("SELECT * FROM favorito WHERE id_usuario = %d AND tipo = '%s' AND id_entidade = %d", $id_usuario, $tipo, $id_entidade);
  $rs = mysql_query($query);

  $inserido = 0;

  if (mysql_num_rows($rs)) {
    $query = sprintf("DELETE FROM favorito WHERE id_usuario = %d AND tipo = '%s' AND id_entidade = %d", $id_usuario, $tipo, $id_entidade);
  } else {
    $query = sprintf("INSERT INTO favorito (id_usuario, tipo, id_entidade) values (%d, '%s', %d)", $id_usuario, $tipo, $id_entidade);
    $inserido = 1;
  }

  $rs = mysql_query($query);
	 
  echo json_encode(array(
	  "success" => mysql_errno() == 0,
	  "favorito" => array(
	    "id_usuario" => $id_usuario,
            "tipo" => $tipo,
            "id_entidade" => $id_entidade
	  )
	));
?>
