<?php 

  if (!function_exists('upload_image')) {
    /**
     * Funcion que permite subir imagenes
     * 
     * @return ['path' => 'path', 'name' => 'name', 'mime' => 'mime']
     */
    function upload_image($file, $dir = __DIR__ .'/../uploads/imagenes/') {
      if (substr($dir, -1) != '/') {
        $dir .= '/';
      } 
      $path = $file['tmp_name'];
      $name = $file['name'];
      $mime = $file['type'];
      $extension = explode('/', $mime)[1];
      $newName = uniqid() . '.' . $extension;
      $newPath = $dir . $newName;
      if (move_uploaded_file($path, $newPath)) {
        return [
          'filename' => $newName,
          'path' => $newPath,
          'name' => $newName,
          'mime' => $mime
        ];
      }
      return null;
    }

    
  }
  if (!function_exists('remove_image')) {
    /**
     * Funcion que permite eliminar imagenes
     */
    function remove_image($path) {
      if($path)  {
        if (file_exists($path)) {
          unlink($path);
          return true;
        }
      }
      return false;
    }
  }

  if (!function_exists('render_imagen')) {
    /**
     * Funcion que permite renderizar imagenes
     * 
     */
    function render_imagen($path) {
      if (!file_exists($path)) {
        return null;
      }
      $mime = mime_content_type($path);
      header('Content-Type: ' . $mime);
      readfile($path);
    }
  }

  if (!function_exists('is_image')) {
    /**
     * Funcion que permite saber si es una imagen
     */
    function is_image($file) {
      $mime = $file['type'];
      $extension = explode('/', $mime)[1];
      $allowed = ['png', 'jpg', 'jpeg', 'gif'];
      return in_array($extension, $allowed);
    }
  }


?>