<?php 

  namespace Module\Reservar\Controllers;

  use App\Routes\Response;
  use Symfony\Component\HttpFoundation\Request;

  use Module\Reservar\Models\ReservarModel;
  use Module\Tour\Models\TourModel;
  use Module\User\Models\UserModel;
  use Module\Reservar\Models\PagosModel;

  class ReservarController {
    public function index($params) {
      $data = [
        'title' => 'Reservar',
        'message' => 'Reservar',
        'reservas' => ReservarModel::seleccionarPendiente()
      ];
      return view('reservar.index', $data);
    }

    public function indexPagos($params) {
      $data = [
        'title' => 'Pagos',
        'message' => 'Pagos',
        'pagos' => PagosModel::index()
      ];
      return view('reservar.pagos', $data);
    }


    public function show($paramms) {
      if (!is_auth() && (!is_admin() || !is_operador())) {
        return view('app.errors.no-autho', [
          'title' => "No autorizado",
          'message' => "No tiene permisos para acceder a esta seccion"
        ]);
        exit();
      }
      $paramsData = $paramms['params'];

      $reserva = ReservarModel::obtenerPorId(htmlentities(addslashes($paramsData['id_reserva'])));

      if (!$reserva) {
        flash('error', 'Reserva no encontrada');
        return redirect('/panel/reservaciones');
      }


      $tour = TourModel::obtenerUno($reserva['id_tour']);
      $usuario = UserModel::obtenerUno($reserva['id_usuario']);

      $data = [
        "title" => "Reserva",
        "message" => "Reserva",
        "reserva" => $reserva,
        "tour" => $tour,
        "usuario" => $usuario
      ];


      return view('reservar.reserva', $data);
    }


    public function destroy($request, $params) {
      if (!is_auth() && (!is_admin() || !is_operador())) {
        return view('app.errors.no-autho', [
          'title' => "No autorizado",
          'message' => "No tiene permisos para acceder a esta seccion"
        ]);
        exit();
      }
      $paramsData = $params['params'];

      $reserva = ReservarModel::obtenerPorId(htmlentities(addslashes($paramsData['id_reserva'])));

      if (!$reserva) {
        return Response::json([
          'success' => false,
          'status' => 404,
          'message' => 'Reserva no encontrada'
        ]);
      }

      // eliminar la reserva
      $reserva = ReservarModel::borrarPorUsuariYTour($reserva['id_usuario'], $reserva['id_tour']);

      if (!$reserva) {
        return Response::json([
          'success' => false,
          'status' => 500,
          'message' => 'Error al eliminar la reserva'
        ]);
      }

      return Response::json([
        'success' => true,
        'status' => 200,
        'message' => 'Reserva eliminada'
      ]);

    }

    public function rechazarTour($request, $params) {
      if (!is_auth() && (!is_admin() || !is_operador())) {
        return view('app.errors.no-autho', [
          'title' => "No autorizado",
          'message' => "No tiene permisos para acceder a esta seccion"
        ]);
        exit();
      }
      $paramsData = $params['params'];

      $reserva = ReservarModel::obtenerPorId(htmlentities(addslashes($paramsData['id_reserva'])));

      if (!$reserva) {
        flash('error', 'Reserva no encontrada');
        return redirect('/panel/reservaciones');
      }

      if ($reserva['estado'] != 'pendiente') {
        flash('error', 'La reserva no esta pendiente');
        return redirect('/panel/reservaciones');
      }

      // rechazar la reserva
      $reserva = ReservarModel::rechazarReserva($reserva['id_reserva']);

      if (!$reserva) {
        flash('error', 'Error al rechazar la reserva');
        return redirect('/panel/reservaciones');
      }

      flash('success', 'Reserva rechazada');
      return redirect('/panel/reservaciones/' . $paramsData['id_reserva'] . '/editar');
    }

    public function pagarTour($request, $params) {
      if (!is_auth() && (!is_admin() || !is_operador())) {
        return view('app.errors.no-autho', [
          'title' => "No autorizado",
          'message' => "No tiene permisos para acceder a esta seccion"
        ]);
        exit();
      }
      $paramsData = $params['params'];

      $reserva = ReservarModel::obtenerPorId(htmlentities(addslashes($paramsData['id_reserva'])));

      if (!$reserva) {
        flash('error', 'Reserva no encontrada');
        return redirect('/panel/reservaciones');
      }

      $id_reserva = $reserva['id_reserva'];
      $tour = TourModel::obtenerUno($reserva['id_tour']);

      if ($reserva['estado'] != 'pendiente') {
        flash('error', 'La reserva no esta pendiente');
        return redirect('/panel/reservaciones');
      }

      // aceptar la reserva
      $reserva = ReservarModel::aceptarReserva($reserva['id_reserva']);


      if (!$reserva) {
        flash('error', 'Error al aceptar la reserva');
        return redirect('/panel/reservaciones');
      }



      PagosModel::insert([
        'metodo_de_pago' => 'efectivo',	
        'monto_pagado' => $tour['precio_tour'] ?? 0,
        'fecha_de_pago' => date('Y-m-d H:i:s'),
        'id_reserva' => $id_reserva
      ]);

      flash('success', 'Reserva aceptada');
      return redirect('/panel/reservaciones/' . $id_reserva . '/editar');
    }

  }