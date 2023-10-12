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
  static private $middlewares;
  static private $global_middleware;
  static private $client;

  const UNAUTHORIZED = 401;

  public static function init()
  {
    self::$httpMethod = $_SERVER['REQUEST_METHOD'];
    self::$uri = $_SERVER['REQUEST_URI'];
    self::$r = new RouteCollector(new Std(), new GroupCountBased());
    self::$middlewares = [];
    self::$global_middleware = [];
    self::$client = new Client();
  }

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
  static public function get($uri, $callback, $middleware = '')
  {
    static::setMiddleware($middleware);
    static::$r->addRoute('GET', $uri, static::parseCallable($callback));
  }

  /**
   * @param $uri
   * @param $callback
   * @param string $middleware
   * 
   * @return void
   */
  static public function post($uri, $callback, $middleware = '')
  {
    static::setMiddleware($middleware);
    static::$r->addRoute('POST', $uri, $callback);
  }


  /**
   * @param $uri
   * @param $callback
   * @param string $middleware
   * 
   * @return void
   */
  static public function put($uri, $callback, $middleware = '')
  {
    static::setMiddleware($middleware);
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
   * @param string $middleware
   * 
   * @return void
   */
  static public function delete($uri, $callback, $middleware = '')
  {
    static::setMiddleware($middleware);
    $method = $_SERVER['REQUEST_METHOD'];
    if ($method == 'POST' && isset($_POST['_method']) && $_POST['_method'] == 'DELETE') {
      static::$r->addRoute('POST', $uri, $callback);
    }else {
      static::$r->addRoute('DELETE', $uri, $callback);
    }
  }

  static private function generateDispatcher ($options = []) {
    $options += [
        'dispatcher' => 'FastRoute\\Dispatcher\\GroupCountBased',
    ];

    return new $options['dispatcher'](static::$r->getData());
  }


  static public function execDispatcher ()
  {
    $routeInfo = static::generateDispatcher()->dispatch(static::$httpMethod, static::$uri);
    // Fetch method and URI from somewhere
    $uri = static::$uri;

    // Strip query string (?foo=bar) and decode URI
    if (false !== $pos = strpos($uri, '?')) {
      $uri = substr($uri, 0, $pos);
    }
    $uri = rawurldecode($uri);
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
        $vars = $routeInfo[2];
        // ... call $handler with $vars
        if (static::$httpMethod == 'POST' || static::$httpMethod == 'PUT' || static::$httpMethod == 'DELETE') {
          
          return static::callCallable($handler, $_REQUEST, $vars);
        }
        return static::callCallable($handler, $vars);
        break;
    }
  }

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

  static public function setGlobalMiddleware($middleware)
  {
    if (!class_exists($middleware)) {
      return;
    }
    // find if exists
    if (in_array($middleware, static::$global_middleware)) {
      return;
    }
    static::$global_middleware[] = $middleware;
  }

  static private function setMiddleware ($middleware) {
    // eval tyype
    if (is_string($middleware)) {
      $middleware = [$middleware];
    } else if (!is_array($middleware)) {
      return;
    }
    static::$middlewares = $middleware;
  }

  static private function execMiddleware($routeInfo, $middleware)
  {
    if (class_exists($middleware)) {
      if ($routeInfo[0] == Dispatcher::FOUND) {
        $middleware = new $middleware();
        if (!$middleware($routeInfo)) {
          return false;
        }
      }
    }
    return true;
  }
}

Route::init();

Route::get('/public/{dir}/{file}', 'staticFileHandler');
