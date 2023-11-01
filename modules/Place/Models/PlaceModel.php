<?php 

  namespace Module\Place\Models;
  
  use Core\MysqlPDO;

  class PlaceModel {
    const TABLE = 'lugares';

    static public function index() {
      return MysqlPDO::find(self::TABLE);
    }

    static public function insert($data) {
      return MysqlPDO::insert(self::TABLE, $data);
    }

    static public function obtenerUno($id_lugar) {
      return MysqlPDO::findOne(self::TABLE, ['*'], ['id_lugar' => $id_lugar]);
    }

    static public function borrarUsuarioPorId($id_lugar) {
      try {
        $user = MysqlPDO::deleteOne(self::TABLE, ['id_lugar' => $id_lugar]);
        return $user;
      } catch (\Exception $e) {
        return null;
      }
    }

    static public function actualizar($id, $columns) {
      try {
        return MysqlPDO::update(self::TABLE, $columns, ['id_lugar' => $id]);
      } catch (\Exception $e) {
        return null;
      }
    }
  }