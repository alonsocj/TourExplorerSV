<?php 

  namespace Module\Place\Models;
  
  use Core\MysqlPDO;

  class ImageModel {
    const TABLE = 'imagenes';

    static public function index() {
      return MysqlPDO::find(self::TABLE);
    }

    static public function imagenesPorLugar($id_lugar) {
      return MysqlPDO::find(self::TABLE, ['*'], ['id_lugar' => $id_lugar]);
    }

    static public function insert($data) {
      return MysqlPDO::insert(self::TABLE, $data);
    }

    static public function obtenerUno($id_imagen) {
      return MysqlPDO::findOne(self::TABLE, ['*'], ['id_imagen' => $id_imagen]);
    }

    static public function borrarUsuarioPorId($id_imagen) {
      try {
        $user = MysqlPDO::deleteOne(self::TABLE, ['id_imagen' => $id_imagen]);
        return $user;
      } catch (\Exception $e) {
        return null;
      }
    }

    static public function actualizar($id, $columns) {
      try {
        return MysqlPDO::update(self::TABLE, $columns, ['id_imagen' => $id]);
      } catch (\Exception $e) {
        return null;
      }
    }


    static public function obtenerUnoPorFilename($filename) {
      try {
        return MysqlPDO::findOne(self::TABLE, ['*'], ['nombre_imagen' => $filename]);
      } catch (\Throwable $th) {
        return null;
      }
    }

  }