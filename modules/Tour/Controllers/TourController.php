<?php

namespace Module\Tour\Controllers;
use App\Routes\Response;
use DateTime;
use Module\Place\Models\PlaceModel;
use Module\Tour\Models\TourModel;
class TourController{
    public function index(){

        $data = [
            'title' => 'Tours Explorer SV | Tours',
            'message' => 'Tours',
            'lugares' =>  PlaceModel::index(),
            'tours' => TourModel::index()
        ];

        return view('tour.historyTour', $data);
    }
    
    public function store ($request, $params) {
        $request = $request['body'];
        if (isset($request['nombre']) && isset($request['descripcion']) && isset($request['precio'])) {
          $data = [
            'nombre_tour' => $request['nombre'],
            'descripcion_tour' => $request['descripcion'],
            'precio_tour' => $request['precio'],
            'disponibilidad_tour' => $request['disponibilidad'],
            'fecha_salida_tour' => ($request['fecha_salida']),
            'fecha_regreso_tour' => ($request['fecha_regreso']),
          ];
          try {
            TourModel::insert($data);
          } catch (\Throwable $th) {
            var_dump($th);
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
}