<?php 

//- existe la sesion
if (!function_exists('is_auth')) {
  /**
   * @return bool
   * 
   * Comprueba si existe la sesion
   */
  function is_auth()
  {
    return isset($_SESSION['id_usuario']) && isset($_SESSION['nombre']) && isset($_SESSION['correo']);
  }
}

if (!function_exists('is_admin')) {
  /**
   * @return bool
   * 
   * Comprueba si el usuario es admin
   */
  function is_admin()
  {
    if (isset($_SESSION['rol']) && isset($_SESSION['rol']['llave'])) {
      return $_SESSION['rol']['llave'] == 'admin';
    }
    return false;
  }
}

if (!function_exists('is_turista')) {
  /**
   *  @return bool
   *  
   * Comprueba si el usuario es turista
   */
  function is_turista()
  {
    if(isset($_SESSION['rol']) && isset($_SESSION['rol']['llave'])) {
      return $_SESSION['rol']['llave'] == 'turista';
    }
    return false;
  }
}

if (!function_exists('is_operador')) {
  /**
   *  @return bool
   *  
   * Comprueba si el usuario es operador
   */
  function is_operador()
  {
    if(isset($_SESSION['rol']) && isset($_SESSION['rol']['llave'])) {
      return $_SESSION['rol']['llave'] == 'operador';
    }
    return false;
  }
}

if (!function_exists('user')) {
  /**
   * @return array|null
   * 
   * Retorna los datos del usuario
   */
  function user() {
    if (is_auth()) {
      return [
        'id_usuario' => $_SESSION['id_usuario'],
        'nombre' => $_SESSION['nombre'],
        'correo' => $_SESSION['correo'],
        'rol' => $_SESSION['rol']
      ];
    }
    return null;
  }
}

if (!function_exists('id_usuario')) {
  /**
   * @return int|null
   * 
   * Retorna el id del usuario
   */
  function id_usuario() {
    if (is_auth()) {
      return $_SESSION['id_usuario'];
    }
    return null;
  }
}

?>