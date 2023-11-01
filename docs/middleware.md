# Middleware

Estos deben de colocarse dentro de una carpeta con nombre Middleware, debe ser una clase con un método __invoke, el cual recibe como parámetros
La información de ruta o request, y el siguiente middleware.

```php
<?php
namespace App\Middleware;


class ExampleMiddleware
{
    public function __invoke($request)
    {
      //- validar aquí
      return $response;
    }
}
```