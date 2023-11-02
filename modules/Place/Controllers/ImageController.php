<?php 

  namespace Module\Place\Controllers;

  use Module\Place\Models\PlaceModel;
  use Module\Place\Models\ImageModel;
  use App\Routes\Response;
  use Symfony\Component\HttpFoundation\Request;

  class ImageController {
    public function index($params) {
      if (!is_admin()) {
        return view('app.errors.no-autho', [
          'title' => "No autorizado",
          'message' => "No tiene permisos para acceder a esta seccion"
        ]);
        exit();
      }
      $paramsData = $params['params'];
      $lugar = PlaceModel::obtenerUno(htmlentities(addslashes($paramsData['lugar'])));
      $data = [
        'title' => 'Tours Explorer SV | imagenes',
        'message' => 'imagenes',
        'imagenes' => ImageModel::imagenesPorLugar($lugar['id_lugar']),
        'lugar' => $lugar
      ];
      return view('place.imagenes', $data);
    }

    public function show($params) {
      if (!is_admin()) {
        return view('app.errors.no-autho', [
          'error' => "No autorizado",
          'message' => "No tiene permisos para acceder a esta seccion"
        ]);
        exit();
      }
      $paramsData = $params['params'];
      $imagen = ImageModel::obtenerUno(htmlentities(addslashes($paramsData['id'])));
      if (!$imagen) {
        return Response::json([
          'success' => false,
          'message' => 'El imagen no existe'
        ], 404);
      }
      return Response::json([
        'success' => true,
        'message' => 'imagen encontrado',
        'data' => $imagen
      ], 200);
    }

    public function store ($request, $params) {
      if (!is_admin()) {
        return view('app.errors.no-autho', [
          'error' => "No autorizado",
          'message' => "No tiene permisos para acceder a esta seccion"
        ]);
        exit();
      }
      $paramsData = $params['params'];
      $files = $request['files'];

      $lugar = PlaceModel::obtenerUno(htmlentities(addslashes($paramsData['lugar'])));

      if (!$lugar) {
        flash('lugar_no_encontrado', 'No se encontro el lugar');
        return redirect('/panel/lugares');
      }


      if (isset($files['imagen']) && $files['imagen']['size'] == 0) {
        flash('imagen_error', 'Debe subir una imagen');
        return redirect('/panel/lugares/' . $lugar['id_lugar'] . '/imagenes');
      }

      // solo imagen
      if (!is_image($files['imagen'])) {
        flash('imagen_error', 'Debe subir una imagen');
        return redirect('/panel/lugares/' . $lugar['id_lugar'] . '/imagenes');
      }

      $imagen_subida = upload_image($files['imagen']);
     
      $data = [
        'nombre_imagen' => $imagen_subida['name'],
        'url_imagen' => $imagen_subida['path'],
        'texto_alternativo_imagen' => $imagen_subida['filename'],
        'id_lugar' => $lugar['id_lugar']
      ];
      
      $imagen = ImageModel::obtenerUno(ImageModel::insert($data));

      if (!$imagen) {
        flash('imagen_error', 'Error al crear el imagen');
        return redirect('/panel/lugares/' . $lugar['id_lugar'] . '/imagenes');
      }

      flash('imagen_creada', 'Imagen creado correctamente');
      return redirect('/panel/lugares/' . $lugar['id_lugar'] . '/imagenes');

    }

    public function destroy ($request, $params) {
      if (!is_admin()) {
        return view('app.errors.no-autho', [
          'error' => "No autorizado",
          'message' => "No tiene permisos para acceder a esta seccion"
        ]);
        exit();
      }
      $paramsData = $params['params'];

      $lugar = PlaceModel::obtenerUno(htmlentities(addslashes($paramsData['lugar'])));
      if(!$lugar) {
        return Response::json([
          'success' => false,
          'message' => 'El lugar no existe'
        ], 404);
      }

      $imagen = ImageModel::obtenerUno(htmlentities(addslashes($paramsData['id'])));
      if (!$imagen) {
        return Response::json([
          'success' => false,
          'message' => 'La imagen no existe'
        ], 404);
      }

      if (!remove_image($imagen['url_imagen'])) {
        return Response::json([
          'success' => false,
          'message' => 'Error al eliminar el imagen'
        ], 400);
      } else {
        $imagen_borrado = ImageModel::borrarUsuarioPorId($imagen['id_imagen']);
        return Response::json([
          'success' => true,
          'message' => 'Imagen eliminado correctamente',
          'data' => $imagen_borrado
        ], 200);
      }

    }

  }