<?php
  include("../conectar.php");

  $info = $_POST['ocorrencia'];

  $data = json_decode(stripslashes($info));
	 
  $id_usuario = $data->id_usuario;
  $tipo_entidade = $data->tipo_entidade;
  $id_entidade = $data->id_entidade;
  $tipo = $data->tipo;
  $descricao = $data->descricao;

  $query = sprintf("INSERT INTO ocorrencia (id_usuario, tipo_entidade, id_entidade, tipo, data, descricao) values (%d, '%s', %d, '%s', now(), '%s')", $id_usuario, $tipo_entidade, $id_entidade, $tipo, $descricao);

  $rs = mysql_query($query);
	 
  echo json_encode(array(
	  "success" => mysql_errno() == 0,
	  "ocorrencia" => array(
            "id_ocorrencia" => mysql_insert_id(),
	    "id_usuario" => $id_usuario,
            "tipo_entidade" => $tipo_entidade,
            "id_entidade" => $id_entidade,
            "tipo" => $tipo
	  )
	));
?>
