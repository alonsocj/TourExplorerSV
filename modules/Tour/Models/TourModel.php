<?php 

  namespace Module\Tour\Models;
  
  use Core\MysqlPDO;

  class TourModel {
    const TABLE = 'tours';

    static public function index() {
      return MysqlPDO::find(self::TABLE);
    }

    static public function insert($data) {
      return MysqlPDO::insert(self::TABLE, $data);
    }

    static public function obtenerUno($id_tour) {
      return MysqlPDO::findOne(self::TABLE, ['*'], ['id_tour' => $id_tour]);
    }

    static public function deleteOne($where) {
      return MysqlPDO::deleteOne(self::TABLE, $where);
    }

    static public function actualizarPorId($id_tour, $data) {
      return MysqlPDO::update(self::TABLE, $data, ['id_tour' => $id_tour]);
    }

    static public function obtenerToursFechaMayorAAhora () {
      $sql = "SELECT * FROM ".self::TABLE." WHERE fecha_salida_tour > NOW()";
      return MysqlPDO::query($sql);
    }
  }