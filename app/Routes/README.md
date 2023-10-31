# Como usar la clase Route

Lo primero es importar la clase Route usando lo siguiente:

```php

  use App\Routes\Route;

```

Existen 4 tipos de metodos http actualmente soportados por la clase Route:

- GET
- POST
- PUT
- DELETE

Para crear una ruta se debe usar el metodo http que se desea usar, por ejemplo:

```php

  Route::get('/home', function(){
    echo "Hola mundo";
  });

```

En el ejemplo anterior se crea una ruta de tipo GET que responde a la url /home y ejecuta una funcion anonima que imprime en pantalla "Hola mundo".
