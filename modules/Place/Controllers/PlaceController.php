<?php 

  namespace Module\Place\Controllers;

  use Module\Place\Models\PlaceModel;
  use App\Routes\Response;
  use Symfony\Component\HttpFoundation\Request;

  class PlaceController {
    public function index() {
      $data = [
        'title' => 'Tours Explorer SV | Lugares',
        'message' => 'Lugares',
        'places' => PlaceModel::index()
      ];
      return view('place.index', $data);
    }

    public function store ($request, $params) {
      $request = $request['body'];
      if (isset($request['nombre']) && isset($request['descripcion']) && isset($request['direccion'])) {
        $data = [
          'nombre_tour' => $request['nombre'],
          'descripcion_tour' => $request['descripcion'],
          'direccion_tour' => $request['direccion']
        ];
        try {
          PlaceModel::insert($data);
        } catch (\Throwable $th) {
          return Response::json([
            'status' => 'error',
            'message' => 'Error al crear el tour'
          ], 401);
        }
        Response::json([
          'status' => 'success',
          'message' => 'Lugar creado correctamente'
        ], 201);
      } else {
        return Response::json([
          'status' => 'error',
          'message' => 'Error al crear el tour'
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