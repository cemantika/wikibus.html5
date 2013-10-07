<?php
  include("../conectar.php");

  $email = $_POST['email'];
  $senha = $_POST['senha'];

  $query = sprintf("SELECT nome_usuario FROM usuarios WHERE (email = '%s' AND senha = '%s')",
    pg_escape_string($email),
    pg_escape_string($senha)
  );

  $rs = pg_query($query);
	
  if (pg_num_rows($rs) >= 1) {
    $row = pg_fetch_row($rs);
    echo $row[0];
  } else {
    echo "NOT_FOUND";
  }
?>