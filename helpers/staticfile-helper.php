<?php


if (!function_exists('staticFileHandler')) {
  function staticFileHandler($vars)
  {
    $filename = __DIR__ . '/../public/' . $vars['dir'] . '/' . $vars['file'];
    if (file_exists($filename)) {
      $mime = mime_content_type($filename);
      $explode_file = explode('.', $filename);

      switch ($mime) {
        case 'text/plain':
          $mime = 'text/' . end($explode_file);
          break;
        case 'text/x-php':
          $mime = 'text/html';
          break;
        case 'application/x-httpd-php':
          $mime = 'text/html';
          break;
        case 'application/octet-stream':
          $mime = 'application/' . end($explode_file);
          break;
        case 'application/x-shockwave-flash':
          $mime = 'application/' . end($explode_file);
          break;
        case 'application/x-javascript':
          $mime = 'application/' . end($explode_file);
          break;
        case 'video/'.end($explode_file):
          $mime = 'video/' . end($explode_file);
          break;
        case 'image/'.end($explode_file):
          $mime = 'image/' . end($explode_file);
          break;
        default:
          $mime = $mime;
          break;
      }

      header('Content-Type: ' . $mime);
      readfile($filename);
      exit;
    } else {
      header("HTTP/1.0 404 Not Found");
      echo 'Archivo no encontrado';
    }
  }
}
