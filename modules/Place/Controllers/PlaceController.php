<?php 

  namespace Module\Place\Controllers;

  use Module\Place\Models\PlaceModel;
  use Module\Place\Models\ImageModel;
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

    public function show($params) {
      $paramsData = $params['params'];
      $lugar = PlaceModel::obtenerUno(htmlentities(addslashes($paramsData['id'])));
      if (!$lugar) {
        return Response::json([
          'success' => false,
          'message' => 'El lugar no existe'
        ], 404);
      }
      return Response::json([
        'success' => true,
        'message' => 'Lugar encontrado',
        'data' => $lugar
      ], 200);
    }

    public function store ($request, $params) {
      $request = $request['body'];
      if (isset($request['nombre']) && isset($request['descripcion']) && isset($request['direccion'])) {
        $data = [
          'nombre_lugar' => htmlentities(addslashes($request['nombre'])),
          'descripcion_lugar' => htmlentities(addslashes($request['descripcion'])),
          'direccion_lugar' => htmlentities(addslashes($request['direccion']))
        ];
        try {
          $lugar = PlaceModel::obtenerUno(PlaceModel::insert($data));
        } catch (\Throwable $th) {
          return Response::json([
            'success' => false,
            'message' => 'Error al crear el tour'
          ], 401);
        }
        Response::json([
          'success' => true,
          'message' => 'Lugar creado correctamente',
          'data' => $lugar
        ], 201);
      } else {
        return Response::json([
          'success' => false,
          'message' => 'Error al crear el tour'
        ], 400);
      }
    }

    public function update ($request, $params) {
      $bodyData = $request['body'];
      $paramsData = $params['params'];

      $lugar = PlaceModel::obtenerUno(htmlentities(addslashes($paramsData['id'])));

      if (!$lugar) {
        return Response::json([
          'success' => false,
          'message' => 'El lugar no existe'
        ], 404);
      }

      $data = [
        'nombre_lugar' => isset($bodyData['nombre']) ? htmlentities(addslashes($bodyData['nombre'])) : $lugar['nombre_lugar'],
        'descripcion_lugar' => isset($bodyData['descripcion']) ? htmlentities(addslashes($bodyData['descripcion'])) : $lugar['descripcion_lugar'],
        'direccion_lugar' => isset($bodyData['direccion']) ? htmlentities(addslashes($bodyData['direccion'])) : $lugar['direccion_lugar']
      ];

      $lugar_actualizado = PlaceModel::actualizar($lugar['id_lugar'], $data);

      return Response::json([
        'success' => true,
        'message' => 'Lugar actualizado correctamente',
        'data' => PlaceModel::obtenerUno($lugar['id_lugar'])
      ], 200);

    }

    public function destroy ($request, $params) {
      $paramsData = $params['params'];

      $lugar = PlaceModel::obtenerUno(htmlentities(addslashes($paramsData['id'])));
      if (!$lugar) {
        return Response::json([
          'success' => false,
          'message' => 'El lugar no existe'
        ], 404);
      }

      //- eliminar las imagenes que existan en el lugar
      $imagenes = ImageModel::imagenesPorLugar($lugar['id_lugar']);
      foreach ($imagenes as $imagen) {
        if (!remove_image($imagen['url_imagen'])) {
          continue;
        } else {
          ImageModel::borrarUsuarioPorId($imagen['id_imagen']);
        }
      }

      $lugar_borrado = PlaceModel::borrarUsuarioPorId($lugar['id_lugar']);

      if(!$lugar_borrado) {
        return Response::json([
          'success' => false,
          'message' => 'Error al eliminar el lugar'
        ], 401);
      }

      return Response::json([
        'success' => true,
        'message' => 'Lugar eliminado correctamente'
      ], 200);

    }

  }