<?php 

  namespace Module\Landing\Controllers;

  class HomeController {
    public function index() {
      $data = [
        'hello_word' => 'Hola mundo',
        'message' => 'Welcome to the landing module'
      ];
      return view('landing.home', $data);
    }

    public function phpinfo() {
      phpinfo();
    }
  }