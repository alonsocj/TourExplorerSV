<?php

namespace Core;

use \PDO;

class MysqlPDO
{

  static private $conn;

  public static function init()
  {
    //- env
    $db_connection = $_SERVER['DB_CONNECTION'];
    $db_host = $_SERVER['DB_HOST'];
    $db_port = $_SERVER['DB_PORT'];
    $db_database = $_SERVER['DB_DATABASE'];
    $db_username = $_SERVER['DB_USERNAME'];
    $db_password = $_SERVER['DB_PASSWORD'];
    self::$conn = new PDO("$db_connection:host=$db_host;port=$db_port;dbname=$db_database", $db_username, $db_password);
    self::$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
  }

  /**
   * Metodo para insertar un registro en la base de datos
   * @param $columns = ['column_name' => 'value']
   * @param $table
   */
  static public function insert($table,$columns) {
    $columns_name = array_keys($columns);
    $columns_str = implode(',', $columns_name);
    $columns_bind = array_map(function ($column) {
      return ":$column";
    }, $columns_name);
    $columns_bind_str = implode(',', $columns_bind);

    $sql = "INSERT INTO $table ($columns_str) VALUES ($columns_bind_str)";

    $stmt = self::$conn->prepare($sql);
    foreach ($columns as $column => $value) {
      $stmt->bindValue(":$column", $value);
    }
    $stmt->execute();
    return self::$conn->lastInsertId();
  }
  
  /**
   * Metodo para buscar un registro en la base de datos
   * @param $table
   * @param $columns = ['column_name' => 'value']
   * @param $where = ['column_name' => 'value']
   * @param $order = ['column_name' => 'ASC|DESC']
   * @param $limit
   */
  static public function findOne($table, $columns = ['*'], $where = [], $order = [], $limit = 1) {
    $columns_str = implode(',', $columns);
    $where_str = '';
    if (count($where) > 0) {
      $where_str = 'WHERE ';
      $where_str .= implode(' AND ', array_map(function ($column) {
        return "$column = :$column";
      }, array_keys($where)));
    }
    $order_str = '';
    if (count($order) > 0) {
      $order_str = 'ORDER BY ';
      $order_str .= implode(',', array_map(function ($column, $type) {
        return "$column $type";
      }, array_keys($order), array_values($order)));
    }
    $limit_str = '';
    if ($limit > 0) {
      $limit_str = "LIMIT $limit";
    }

    $sql = "SELECT $columns_str FROM $table $where_str $order_str $limit_str";

    $stmt = self::$conn->prepare($sql);
    foreach ($where as $column => $value) {
      $stmt->bindValue(":$column", $value);
    }

    $stmt->execute();
    return $stmt->fetch(PDO::FETCH_ASSOC);
  }

  /**
   * Metodo para buscar varios registros en la base de datos
   * @param $table
   * @param $columns = ['column_name' => 'value']
   * @param $where = ['column_name' => 'value']
   * @param $order = ['column_name' => 'ASC|DESC']
   * @param $limit
   */
  static public function find ($table, $columns = ['*'], $where = [], $order = [], $limit = 0) {
    $columns_str = implode(',', $columns);
    $where_str = '';
    if (count($where) > 0) {
      $where_str = 'WHERE ';
      $where_str .= implode(' AND ', array_map(function ($column) {
        return "$column = :$column";
      }, array_keys($where)));
    }
    $order_str = '';
    if (count($order) > 0) {
      $order_str = 'ORDER BY ';
      $order_str .= implode(',', array_map(function ($column, $type) {
        return "$column $type";
      }, array_keys($order), array_values($order)));
    }
    $limit_str = '';
    if ($limit > 0) {
      $limit_str = "LIMIT $limit";
    }

    $sql = "SELECT $columns_str FROM $table $where_str $order_str $limit_str";

    $stmt = self::$conn->prepare($sql);
    foreach ($where as $column => $value) {
      $stmt->bindValue(":$column", $value);
    }

    $stmt->execute();
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
  }

  /**
   * Metodo para actualizar un registro en la base de datos
   * @param $table
   * @param $columns = ['column_name' => 'value']
   * @param $where = ['column_name' => 'value']
   */
  static public function update($table, $columns, $where = []) {
    $columns_str = implode(',', array_map(function ($column) {
      return "$column = :$column";
    }, array_keys($columns)));
    $where_str = '';
    if (count($where) > 0) {
      $where_str = 'WHERE ';
      $where_str .= implode(' AND ', array_map(function ($column) {
        return "$column = :$column";
      }, array_keys($where)));
    }

    $sql = "UPDATE $table SET $columns_str $where_str";

    $stmt = self::$conn->prepare($sql);
    foreach ($columns as $column => $value) {
      $stmt->bindValue(":$column", $value);
    }
    foreach ($where as $column => $value) {
      $stmt->bindValue(":$column", $value);
    }

    $stmt->execute();

    return $stmt->rowCount();
  }


  /**
   * Metodo para eliminar un registro en la base de datos
   * @param $table
   * @param $where = ['column_name' => 'value']
   */
  static public function deleteOne ($table, $where = []) {
    $where_str = '';
    if (count($where) > 0) {
      $where_str = 'WHERE ';
      $where_str .= implode(' AND ', array_map(function ($column) {
        return "$column = :$column";
      }, array_keys($where)));
    }

    $sql = "DELETE FROM $table $where_str";

    $stmt = self::$conn->prepare($sql);
    foreach ($where as $column => $value) {
      $stmt->bindValue(":$column", $value);
    }

    $stmt->execute();

    return $stmt->rowCount();
  }

}
