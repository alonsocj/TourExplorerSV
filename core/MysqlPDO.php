<?php 

  namespace Core;

  class MysqlPDO extends \PDO {
    public function __construct($dsn, $username = null, $password = null, $options = null) {
      parent::__construct($dsn, $username, $password, $options);
      $this->setAttribute(\PDO::ATTR_ERRMODE, \PDO::ERRMODE_EXCEPTION);
    }
  }
  