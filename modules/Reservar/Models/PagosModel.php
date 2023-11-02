<?php 

  namespace Module\Reservar\Models;
  
  use Core\MysqlPDO;

  class PagosModel {
    const TABLE = 'pagos';

    static public function index() {
      return MysqlPDO::find(self::TABLE);
    }

    static public function insert($data) {
      return MysqlPDO::insert(self::TABLE, $data);
    }

  }