<?php 

//- existe la sesion
if (!function_exists('is_auth')) {
  function is_auth()
  {
    return isset($_SESSION['id_usuario']) && isset($_SESSION['nombre']) && isset($_SESSION['correo']);
  }
}

if (!function_exists('is_admin')) {
  function is_admin()
  {
    if (isset($_SESSION['rol']) && isset($_SESSION['rol']['llave'])) {
      return $_SESSION['rol']['llave'] == 'admin';
    }
    return false;
  }
}

if (!function_exists('is_cliente')) {
  function is_cliente()
  {
    if(isset($_SESSION['rol']) && isset($_SESSION['rol']['llave'])) {
      return $_SESSION['rol']['llave'] == 'cliente';
    }
    return false;
  }
}

?>