<?php

  namespace Module\Tour\Models;
  
  use Core\MysqlPDO;

  class TourPlaceModel {
    const TABLE = 'tours_lugares';

    static public function index() {
      return MysqlPDO::find(self::TABLE);
    }

    static public function insert($data) {
      return MysqlPDO::insert(self::TABLE, $data);
    }

    static public function obtenerUno($id_tour_lugar) {
      return MysqlPDO::find(self::TABLE, ['*'], ['id' => $id_tour_lugar]);
    }

    static public function obtenerPorTour ($id_tour) {
      return MysqlPDO::find(self::TABLE, ['*'], ['id_tour' => $id_tour]);
    }

    static public function eliminarPorId($id_tour_lugar) {
      return MysqlPDO::deleteOne(self::TABLE, ['id' => $id_tour_lugar]);
    }

  }