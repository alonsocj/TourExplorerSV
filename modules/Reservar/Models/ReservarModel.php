<?php 

  namespace Module\Reservar\Models;
  
  use Core\MysqlPDO;

  class ReservarModel {
    // estado toma los valores: pendiente, aceptada, rechazada
    const TABLE = 'reservas';

    static public function index() {
      return MysqlPDO::find(self::TABLE);
    }

    static public function insert($data) {
      return MysqlPDO::insert(self::TABLE, $data);
    }

    static public function obtenerReservaPorUsuarioYTour($id_usuario, $id_tour) {
      return MysqlPDO::findOne(self::TABLE, ['*'], ['id_usuario' => $id_usuario, 'id_tour' => $id_tour]);
    }

    static public function updatePorUsuarioYTour($id_usuario, $id_tour, $columns) {
      try {
        return MysqlPDO::update(self::TABLE, $columns, ['id_usuario' => $id_usuario, 'id_tour' => $id_tour]);
      } catch (\Exception $e) {
        return null;
      }
    }

    static public function borrarPorUsuariYTour($id_usuario, $id_tour) {
      try {
        $user = MysqlPDO::deleteOne(self::TABLE, ['id_usuario' => $id_usuario, 'id_tour' => $id_tour]);
        return $user;
      } catch (\Exception $e) {
        return null;
      }
    }

    static public function obtenerReservasPorUsuario($id_usuario) {
      return MysqlPDO::find(self::TABLE, ['*'], ['id_usuario' => $id_usuario]);
    }

    static public function seleccionarPendiente() {
      return MysqlPDO::find(self::TABLE, ['*'], ['estado' => 'pendiente']);
    }

    static public function obtenerPorId($id_reserva) {
      return MysqlPDO::findOne(self::TABLE, ['*'], ['id_reserva' => $id_reserva]);
    }

    static public function rechazarReserva($id_reserva) {
      return MysqlPDO::update(self::TABLE, ['estado' => 'rechazada'], ['id_reserva' => $id_reserva]);
    }

    static public function aceptarReserva($id_reserva) {
      return MysqlPDO::update(self::TABLE, ['estado' => 'aceptada'], ['id_reserva' => $id_reserva]);
    }

  }