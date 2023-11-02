<?php

  use PHPMailer\PHPMailer\PHPMailer;
  use PHPMailer\PHPMailer\Exception;


  class EmailProvider extends PHPMailer {
      
    public function __construct() {
      parent::__construct();
      $this->isSMTP();
      $this->SMTPDebug = 0;
      $this->Host = 'smtp.gmail.com';
      $this->Port = 587;
      $this->SMTPSecure = 'tls';
      $this->SMTPAuth = true;
      $this->Username = '';
    }
  }