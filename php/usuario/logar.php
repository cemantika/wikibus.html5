<?php
  include("../conectar.php");

  $email = $_POST['email'];
  $senha = $_POST['senha'];

  $query = sprintf("SELECT id_usuario FROM usuario WHERE email = '%s' AND senha = '%s'",
    mysql_real_escape_string($email),
    mysql_real_escape_string($senha)
  );

  $rs = mysql_query($query);
	
  if (mysql_num_rows($rs) == 1) {
    $row = mysql_fetch_row($rs);
    echo $row[0];
  } else {
    echo "NOT_FOUND";
  }
?>
