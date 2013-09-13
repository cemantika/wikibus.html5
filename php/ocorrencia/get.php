<?php
  include("../conectar.php");

  $id_usuario = $_GET['id_usuario'];

  $query = sprintf("select * from favorito WHERE id_usuario = %d", $id_usuario);

  $rs = mysql_query($query);
  $pontos = array();
  $linhas = array();
  
  array_push($linhas, -1);
  array_push($pontos, -1);

  while($fav = mysql_fetch_assoc($rs)) {
    if ($fav['tipo'] == 'P') {
      array_push($pontos, $fav['id_entidade']);
    } else if ($fav['tipo'] == 'L') {
      array_push($linhas, $fav['id_entidade']);
    }
  }

  $ocorrencias_query = sprintf("select o.*, u.nome from ocorrencia o 
                JOIN usuario u ON u.id_usuario = o.id_usuario 
                WHERE (o.tipo_entidade = 'P' AND o.id_entidade IN (%s)) OR 
                ((o.tipo_entidade = 'L' AND o.id_entidade IN (%s))) ORDER BY data DESC", 
                implode(',', $pontos), implode(',', $linhas));
 
  $rs_ocorrencias = mysql_query($ocorrencias_query);

  $ocorrencias = array('ocorrencias' => array());
  while($ocorrencia = mysql_fetch_assoc($rs_ocorrencias)) {
    $ocorrencias['ocorrencias'][] = $ocorrencia;
  }

  echo json_encode($ocorrencias);

?>
