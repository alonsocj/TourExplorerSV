<?php 

  namespace Module\Todo\Controllers;

  use Module\Todo\Models\TodoModel;
  use App\Routes\Response;
  use Symfony\Component\HttpFoundation\Request;

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
      var_dump("Request ", $request, "Params", $params);
      if (isset($request['nombre']) && isset($request['descripcion'])) {
        $data = [
          'nombre' => $request['nombre'],
          'descripcion' => $request['descripcion']
        ];
        try {
          TodoModel::insert($data);
        } catch (\Throwable $th) {
          return Response::json([
            'status' => 'error',
            'message' => 'Error al crear el todo'
          ], 400);
        }
        Response::json([
          'status' => 'success',
          'message' => 'Todo creado correctamente'
        ], 201);
      } else {
        return Response::json([
          'status' => 'error',
          'message' => 'Error al crear el todo'
        ], 400);
      }

      
    }

    public function update ($request, $params) {
      var_dump($request);
    }

    public function destroy ($request, $params) {
      var_dump($request);
    }

  }