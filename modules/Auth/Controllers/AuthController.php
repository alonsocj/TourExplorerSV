<?php 

  namespace Module\Todo\Controllers;

  use Module\Todo\Models\TodoModel;
  use App\Routes\Response;
  use Symfony\Component\HttpFoundation\Request;

  class TodoController {
    
    public function signin () { 
      return view('suth.signin', []);
    }

    public function signup () {
      return view('auth.signup', []);
    }

  }