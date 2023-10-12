<?php 

  namespace Module\Todo\Controllers;

  use Module\Todo\Models\TodoModel;

  class TodoController {
    public function index() {
      $data = [
        'title' => 'Tours Explorer sv TODO',
        'message' => 'Ejemplo de crud',
        'todos' => TodoModel::index()
      ];
      return view('todo.list', $data);
    }

    public function store ($request, $params) {
      if (isset($request['nombre']) && isset($request['descripcion'])) {
        $data = [
          'nombre' => $request['nombre'],
          'descripcion' => $request['descripcion']
        ];
        TodoModel::insert($data);
        return true;
      } else {
        return false;
      }
    }

    public function update ($request, $params) {
      var_dump($request);
    }

    public function destroy ($request, $params) {
      var_dump($request);
    }

  }