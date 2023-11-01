<?php

namespace App\Routes;

use FastRoute\RouteCollector;
use FastRoute\Dispatcher;
use FastRoute\RouteParser\Std;
use FastRoute\DataGenerator\GroupCountBased;
use GuzzleHttp\Client;

class Route
{
  static private $httpMethod;
  static private $uri;
  static private $r;
  static private $client;

  const UNAUTHORIZED = 401;

  /**
   * @return void
   * Inicializa las variables de la clase de forma estatica
   */
  public static function init()
  {
    self::$httpMethod = $_SERVER['REQUEST_METHOD'];
    self::$uri = $_SERVER['REQUEST_URI'];
    self::$r = new RouteCollector(new Std(), new GroupCountBased());
    self::$client = new Client();
  }

  /**
   * @param $callable
   * Permite pasar un callable como string o array
   * luego lo convierte en un callable y lo retorna
   */
  static private function parseCallable($callable)
  {
    if (is_callable($callable)) {
      return $callable;
    }
    if (is_string($callable)) {
      $explode_callable = explode('@', $callable);
      if (count($explode_callable) == 2) {
        $controller = $explode_callable[0];
        $method = $explode_callable[1];
        if (class_exists($controller)) {
          $controller = new $controller();
          if (method_exists($controller, $method)) {
            return [$controller, $method];
          }
        }
      } else {
        if (function_exists($callable)) {
          return $callable;
        }
      }
    }
    if (is_array($callable)) {
      if (count($callable) == 2) {
        $controller = $callable[0];
        $method = $callable[1];
        if (class_exists($controller)) {
          $controller = new $controller();
          if (method_exists($controller, $method)) {
            return [$controller, $method];
          }
        }
      }
    }
    return false;
  }

  /**
   * @param $uri
   * @param $callback
   * @param string $middleware
   * 
   * @return void
   */
  static public function get($uri, $callback)
  {
    static::$r->addRoute('GET', $uri, static::parseCallable($callback));
  }

  /**
   * @param $uri
   * @param $callback
   * 
   * @return void
   */
  static public function post($uri, $callback)
  {
    static::$r->addRoute('POST', $uri, $callback);
  }


  /**
   * @param $uri
   * @param $callback
   * 
   * @return void
   */
  static public function put($uri, $callback)
  {
    $method = $_SERVER['REQUEST_METHOD'];
    if ($method == 'POST' && isset($_POST['_method']) && $_POST['_method'] == 'PUT') {
      static::$r->addRoute('POST', $uri, $callback);
    }else {
      static::$r->addRoute('PUT', $uri, $callback);
    }
  }

  /**
   * @param $uri
   * @param $callback
   * 
   * @return void
   */
  static public function delete($uri, $callback)
  {
    $method = $_SERVER['REQUEST_METHOD'];
    if ($method == 'POST' && isset($_POST['_method']) && $_POST['_method'] == 'DELETE') {
      static::$r->addRoute('POST', $uri, $callback);
    }else {
      static::$r->addRoute('DELETE', $uri, $callback);
    }
  }

  /**
   * Genera el dispatcher de FastRoute
   */
  static private function generateDispatcher ($options = []) {
    $options += [
        'dispatcher' => 'FastRoute\\Dispatcher\\GroupCountBased',
    ];

    return new $options['dispatcher'](static::$r->getData());
  }

  /**
   * @return void
   * Ejecuta el dispatcher de FastRoute
   */
  static public function execDispatcher ()
  {
    // Fetch method and URI from somewhere
    $uri = static::$uri;

    // Strip query string (?foo=bar) and decode URI
    if (false !== $pos = strpos($uri, '?')) {
      $uri = substr($uri, 0, $pos);
    }
    $uri = rawurldecode($uri);
    $dispatcher = static::generateDispatcher();

    $routeInfo = $dispatcher->dispatch(static::$httpMethod, $uri);
    $json_data = file_get_contents("php://input");
    $data = json_decode($json_data, true);


    switch ($routeInfo[0]) {
      case Dispatcher::NOT_FOUND:
        // ... 404 Not Found
        return view('app.error.error', ['error' => '404 Not Found']);
        break;
      case Dispatcher::METHOD_NOT_ALLOWED:
        $allowedMethods = $routeInfo[1];
        // ... 405 Method Not Allowed
        return view('app.error.error', ['error' => '405 Method Not Allowed']);
        break;
      case static::UNAUTHORIZED:
        return view('app.error.error', ['error' => '401 Unauthorized']);
        break;
      case Dispatcher::FOUND:
        $handler = $routeInfo[1];
        $paramsData = $routeInfo[2];
        $queryParams = $_GET;
        $bodyParams = $_POST;
<<<<<<< HEAD
=======
        $fileData = $_FILES;
>>>>>>> 8615ed8ceb47fcca71178b8e734b62afdc3ed8f7
        // ... call $handler with $vars
        if (static::$httpMethod == 'POST' || static::$httpMethod == 'PUT' || static::$httpMethod == 'DELETE') {
          
          return static::callCallable($handler, [
            'body' => $data ? $data : $bodyParams,
            'query' => $queryParams,
<<<<<<< HEAD
=======
            'files' => $fileData,
>>>>>>> 8615ed8ceb47fcca71178b8e734b62afdc3ed8f7
          ], [
            'params' => $paramsData
          ]);
        }
        return static::callCallable($handler, [
          'query' => $queryParams,
          'params' => $paramsData
        ]);
        break;
    }
  }

  /**
   * @param $callable
   * @param array $params
   * 
   * @return mixed
   * Ejecuta un callable
   */
  static private function callCallable ($callable, ...$params) {
    if (is_callable($callable)) {
      return $callable(...$params);
    }
    if (is_array($callable)) {
      if (count($callable) == 2) {
        $controller = $callable[0];
        $method = $callable[1];
        if (class_exists($controller)) {
          $controller = new $controller();
          if (method_exists($controller, $method)) {
            return $controller->$method(...$params);
          }
        }
      }
    }
  }

}

Route::init();

Route::get('/public/{dir}/{file}', 'staticFileHandler');
