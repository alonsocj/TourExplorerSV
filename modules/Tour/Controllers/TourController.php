<?php

namespace Module\Tour\Controllers;

use App\Routes\Response;
use DateTime;
use Module\Place\Models\PlaceModel;
use Module\Tour\Models\TourPlaceModel;
use Module\Tour\Models\TourModel;

class TourController
{
  public function index()
  {

    $data = [
      'title' => 'Tours Explorer SV | Tours',
      'message' => 'Tours',
      'lugares' =>  PlaceModel::index(),
      'tours' => TourModel::index()
    ];

    return view('tour.index', $data);
  }

  public function borrarImagen($request, $params) {
    $params = $params['params'];
    $tour = TourModel::obtenerUno($params['id']);
    if (!$tour) {
      flash('error', 'Tour no encontrado');
      return redirect('/panel/tours');
    }

    if (remove_image($tour['url_imagen_tour'])) {
      TourModel::actualizarPorId($tour['id_tour'], [
        'imagen_tour' => null,
        'url_imagen_tour' => null
      ]);
      flash('success', 'Imagen eliminada correctamente');
      return redirect('/panel/tours/' . $tour['id_tour'] . '/editar');
    }

    flash('error', 'Error al eliminar la imagen');
    return redirect('/panel/tours/' . $tour['id_tour'] . '/editar');
  }

  public function editar($params) {
    $paramsData = $params['params'];

    $tour = TourModel::obtenerUno($paramsData['id']);

    if (!$tour) {
      flash('error', 'Tour no encontrado');
      return redirect('/panel/tours');
    }

    $lugares = TourPlaceModel::obtenerPorTour($tour['id_tour']);

    $data = [
      'title' => 'Tours Explorer SV | Editar Tour',
      'message' => 'Editar Tour',
      'lugares' =>  PlaceModel::index(),
      'tour' => $tour,
      'lugares_tour' => $lugares
    ];

    return view('tour.editar', $data);
  }

  public function update($request, $params) {
    $bodyData = $request['body'];
    $files = $request['files'];
    $paramsData = $params['params'];

    $path = realpath(__DIR__ . '/../../../uploads/tours');

    $tour = TourModel::obtenerUno($paramsData['id']);

    if (!$tour) {
      flash('error', 'Tour no encontrado');
      return redirect('/panel/tours');
    }

    if (!isset($bodyData['lugares']) && !is_array($bodyData['lugares']) && count($bodyData['lugares']) == 0) {
      flash('error', 'Error al crear el tour');
      return redirect('/panel/tours/crear');
    }

    if (!isset($bodyData['nombre_tour']) || !isset($bodyData['descripcion_tour']) || !isset($bodyData['precio_tour']) || !isset($bodyData['disponibilidad_tour']) || !isset($bodyData['fecha_salida_tour']) || !isset($bodyData['fecha_regreso_tour'])) {
      flash('error', 'Error al crear el tour');
      return redirect('/panel/tours/crear');
    }

    $lugares = $bodyData['lugares'];

    $data = [
      'nombre_tour' => htmlentities(addslashes($bodyData['nombre_tour'])),
      'descripcion_tour' => htmlentities(addslashes($bodyData['descripcion_tour'])),
      'precio_tour' => htmlentities(addslashes($bodyData['precio_tour'])),
      'disponibilidad_tour' => htmlentities(addslashes($bodyData['disponibilidad_tour'])),
      'fecha_salida_tour' => htmlentities(addslashes($bodyData['fecha_salida_tour'])),
      'fecha_regreso_tour' => htmlentities(addslashes($bodyData['fecha_regreso_tour'])),
    ];

    //- borrar imagen si existe 
    if ($files['imagen']['size'] > 0 && $tour['url_imagen_tour'] && file_exists($tour['url_imagen_tour'])) {
      remove_image($tour['url_imagen_tour']);
    }

    //- buscar lugares en toures
    $lugares_tours_por_borrar = TourPlaceModel::obtenerPorTour($tour['id_tour']);

    if (is_array($lugares_tours_por_borrar) && count($lugares_tours_por_borrar)) {
      foreach ($lugares_tours_por_borrar as $lugar) {
        TourPlaceModel::eliminarPorId($lugar['id']);
      }
    }

    if ($files['imagen']['size'] > 0) {
      $imagen_subida = upload_image($files['imagen'], $path);
  
      
      $data['imagen_tour'] = $imagen_subida['filename'];
      $data['url_imagen_tour'] = $imagen_subida['path'];
    }

    $tour_actualizado = TourModel::actualizarPorId($tour['id_tour'], $data);

    foreach ($lugares as $lugar) {
      if(is_numeric($lugar)) {
        $datos_lugar = [
          "id_tour" => $tour['id_tour'],
          "id_lugar" => $lugar['lugar'],
          "hora_inicio" => $lugar['hora_inicio_lugar'],
          "hora_fin" => $lugar['hora_fin_lugar'],
        ];
        TourPlaceModel::insert($datos_lugar);
      }
    }

    flash('success', 'Tour actualizado correctamente');
    return redirect('/panel/tours/' . $tour['id_tour'] . '/editar');
  }

  public function store($request, $params)
  {
    $bodyData = $request['body'];
    $files = $request['files'];
    $path = realpath(__DIR__ . '/../../../uploads/tours/');

    if (!isset($bodyData['lugares']) && !is_array($bodyData['lugares']) && count($bodyData['lugares']) == 0) {
      flash('error', 'Error al crear el tour');
      return redirect('/panel/tours/crear');
    }

    if (!isset($bodyData['nombre_tour']) || !isset($bodyData['descripcion_tour']) || !isset($bodyData['precio_tour']) || !isset($bodyData['disponibilidad_tour']) || !isset($bodyData['fecha_salida_tour']) || !isset($bodyData['fecha_regreso_tour'])) {
      flash('error', 'Error al crear el tour');
      return redirect('/panel/tours/crear');
    }

    $lugares = $bodyData['lugares'];

    $data = [
      'nombre_tour' => htmlentities(addslashes($bodyData['nombre_tour'])),
      'descripcion_tour' => htmlentities(addslashes($bodyData['descripcion_tour'])),
      'precio_tour' => htmlentities(addslashes($bodyData['precio_tour'])),
      'disponibilidad_tour' => htmlentities(addslashes($bodyData['disponibilidad_tour'])),
      'fecha_salida_tour' => htmlentities(addslashes($bodyData['fecha_salida_tour'])),
      'fecha_regreso_tour' => htmlentities(addslashes($bodyData['fecha_regreso_tour'])),
    ];


    $imagen_subida = upload_image($files['imagen'], $path);

    $data['imagen_tour'] = $imagen_subida['filename'];
    $data['url_imagen_tour'] = $imagen_subida['path'];

    $tour_nuevo = TourModel::obtenerUno(TourModel::insert($data));

    foreach ($lugares as $lugar) {
      $datos_lugar = [
        "id_tour" => $tour_nuevo['id_tour'],
        "id_lugar" => $lugar['lugar'],
        "hora_inicio" => $lugar['hora_inicio_lugar'],
        "hora_fin" => $lugar['hora_fin_lugar'],
      ];
      TourPlaceModel::insert($datos_lugar);
    }

    flash('success', 'Tour creado correctamente');
    return redirect('/panel/tours/crear');
  }

  public function create($params)
  {
    $data = [
      'title' => 'Tours Explorer SV | Crear Tour',
      'message' => 'Crear Tour',
      'lugares' =>  PlaceModel::index(),
    ];
    return view('tour.crear', $data);
  }

  public function destroy($request, $params)
  {
    $paramsData = $params['params'];

    $tour = TourModel::obtenerUno($paramsData['id']);

    if (!$tour) {
      return Response::json([
        "success" => false,
        'message' => 'Tour no encontrado'
      ], 404);
    }

    $lugares = TourPlaceModel::obtenerPorTour($tour['id_tour']);

    if (is_array($lugares) && count($lugares)) {
      foreach ($lugares as $lugar) {
        TourPlaceModel::eliminarPorId($lugar['id']);
      }
    }

    remove_image($tour['url_imagen_tour']);

    TourModel::deleteOne(['id_tour' => $tour['id_tour']]);

    return Response::json([
      "success" => true,
      'message' => 'Tour eliminado correctamente'
    ], 200);
  }
}
