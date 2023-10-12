# Modulos

En los modulos se encuentra la logica de la aplicación, hay que tratar de mantenerlos lo mas desacoplados posibles para que puedan ser reutilizados en otras aplicaciones.

## Estructura de directorio

La estructura de directorio de un modulo es la siguiente:

```
  modules/
    modulo/
      Controllers/
        NameController.php
      Models/
        NameModel.php
      Views/
        index.tpl
      Routes/
        NameRoutes.php
      routes.php
```