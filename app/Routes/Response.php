<?php

namespace App\Routes;

use Symfony\Component\HttpFoundation\Response as SymfonyResponse;

class Response {
  public static function json($data, $status = 200) {
    $response = new SymfonyResponse();
    $response->setContent(json_encode($data));
    $response->headers->set('Content-Type', 'application/json');
    $response->setStatusCode($status);
    return $response->send();
  }

}
