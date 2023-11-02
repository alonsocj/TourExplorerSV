<?php 

  namespace Module\Landing\Controllers;

use DateTime;
use Module\Tour\Models\TourModel;
  use Module\Tour\Models\TourPlaceModel;
  use Module\Place\Models\PlaceModel;
  use Module\Place\Models\ImageModel;
  use Module\User\Models\UserModel;
  use Module\Reservar\Models\ReservarModel;

  class HomeController {
    public function index() {
      $data = [
        'title' => 'ToursExplorer SV',
        'message' => 'Encuentra los mejores tours en El Salvador',
        'tours' => TourModel::obtenerToursFechaMayorAAhora()
      ];
      return view('landing.home', $data);
    }

    public function showProfile($params) {
      $paramsData = $params['params'];
      if (!is_auth() && !is_turista()) {
        return view('app.errors.no-autho', [
          'title' => "No autorizado",
          'message' => "No tiene permisos para acceder a esta seccion"
        ]);
        exit();
      }
      $usuario = UserModel::obtenerUno(id_usuario());


      $usuario = UserModel::obtenerUno(id_usuario());
      $data = [
        'title' => 'ToursExplorer SV',
        'message' => 'Encuentra los mejores tours en El Salvador',
        'usuario' => $usuario,
      ];

      $reservas = ReservarModel::obtenerReservasPorUsuario($usuario['id_usuario']);
      
      if (is_array($reservas) && count($reservas) > 0) {
        for ($i=0; $i < count($reservas); $i++) { 
          $tour = TourModel::obtenerUno($reservas[$i]['id_tour']);
          if ($tour) {
            $reservas[$i]['tour'] = $tour;
          }
        }
      }

      $data['reservas'] = $reservas;


      return view('landing.perfil', $data);
    }
    
    public function showOldTours() {
      $data = [
        'title' => 'ToursExplorer SV',
        'message' => 'Encuentra los mejores tours en El Salvador',
        'tours' => TourModel::obtenerToursFechaMenorAAhora()
      ];
      return view('landing.home', $data);
    }

    public function showTour($params) {
      $paramsData = $params['params'];
      $tour = TourModel::obtenerUno(htmlentities(addslashes($paramsData['id_tour'])));

      if (!$tour) {
        flash('error', 'Tour no encontrado');
        return redirect('/');
      }

      $lugares = TourPlaceModel::obtenerPorTour($tour['id_tour']);

      for ($i=0; $i < count($lugares); $i++) { 
        $lugar = PlaceModel::obtenerUno($lugares[$i]['id_lugar']);
        $lugares[$i]['lugar'] = $lugar;
        $lugares[$i]['imagenes'] = ImageModel::imagenesPorLugar($lugar['id_lugar']);
      }

      $data = [
        'title' => 'ToursExplorer SV',
        'message' => 'Encuentra los mejores tours en El Salvador',
        'tour' => $tour,
        'lugares' => $lugares
      ];

      if (is_auth() && is_turista()) {
        $reserva = ReservarModel::obtenerReservaPorUsuarioYTour(id_usuario(), $tour['id_tour']);
        if ($reserva) {
          $data['reserva'] = $reserva;
        }
      }

      return view('landing.tour', $data);

    }

    public function phpinfo() {
      phpinfo();
    }

    public function reservarTour($request, $params) {
      $bodyData = $request['body'];
      $paramsData = $params['params'];
      if (!is_auth() && !is_turista()) {
        flash('error', 'No tiene permisos para acceder a esta seccion');
        return redirect('/tour/' . htmlentities(addslashes($paramsData['id_tour'])));
      }

      $id_user = id_usuario();
      $usuario = UserModel::obtenerUno($id_user);
      $tour = TourModel::obtenerUno(htmlentities(addslashes($paramsData['id_tour'])));

      ReservarModel::insert([
        'id_usuario' => $usuario['id_usuario'],
        'id_tour' => $tour['id_tour'],
        'fecha_reserva' => date('Y-m-d H:i:s'),
        'estado' => 'pendiente'
      ]);

      flash('success', 'Reserva realizada correctamente');
      return redirect('/tours/' . htmlentities(addslashes($paramsData['id_tour'])));

    }

    public function cancelarReservarTour($request, $params) {
      $bodyData = $request['body'];
      $paramsData = $params['params'];
      if (!is_auth() && !is_turista()) {
        flash('error', 'No tiene permisos para acceder a esta seccion');
        return redirect('/tour/' . htmlentities(addslashes($paramsData['id_tour'])));
      }

      $id_user = id_usuario();
      $usuario = UserModel::obtenerUno($id_user);
      $tour = TourModel::obtenerUno(htmlentities(addslashes($paramsData['id_tour'])));

      ReservarModel::borrarPorUsuariYTour($usuario['id_usuario'], $tour['id_tour']);

      flash('success', 'Reserva cancelada correctamente');
      return redirect('/tours/' . htmlentities(addslashes($paramsData['id_tour'])));
    }
  }