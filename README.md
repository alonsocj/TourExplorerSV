# TourExplorerSV

## Requerimientos

- PHP 7.4

## Instalar dependencias php

En la ruta raíz ejecutar el siguiente comando

```bash
composer install
```

## Servidor

Para poder levantar el servidor se usa el siguiente comando en la ruta raíz

```bash
php -S localhost:8000
```

`NOTA`: asegurarse de tener especificado la variable de entorno `PATH` con la ruta de `php.exe` y `composer.phar`

## Agregar dependencias

Para agregar dependencias se usa el siguiente comando en la ruta raíz

```bash
composer require <nombre-dependencia>
```

## Actualizar dependencias

Para actualizar dependencias se usa el siguiente comando en la ruta raíz

```bash
composer update
```

## instalas dependencias Javascript

Para instalar dependencias Javascript se usa el siguiente comando en la ruta raíz

```bash
npm install
```

### Generar distribuibles

Para generar los distribuibles se usa el siguiente comando en la ruta raíz

```bash
npm run prod
```