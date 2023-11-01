<?php

//- set flash
if (!function_exists('set_flash')) {
  function set_flash($key, $value)
  {
    $_SESSION['flash'][$key] = $value;
  }
}

//- obtener flash
if (!function_exists('get_flash')) {
  function get_flash($key)
  {
    if (isset($_SESSION['flash'][$key])) {
      $value = $_SESSION['flash'][$key];
      unset($_SESSION['flash'][$key]);
      return $value;
    }
    return false;
  }
}

//- flash
if (!function_exists('flash')) {
  function flash($key, $value = null)
  {
    if ($value) {
      set_flash($key, $value);
    } else {
      return get_flash($key);
    }
  }
}

//- existe flash

if (!function_exists('has_flash')) {
  function has_flash($key)
  {
    return isset($_SESSION['flash'][$key]);
  }
}
