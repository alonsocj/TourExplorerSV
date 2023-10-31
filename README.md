# TourExplorerSV

## Requerimientos

- PHP 7.4

## Servidor

Para poder levantar el servidor se usa el siguiente comando

```bash
php -S localhost:8000
```

`NOTA`: asegurarse de tener especificado la variable de entorno `PATH` con la ruta de `php.exe` y `composer.phar`

## Agregar dependencias

Para agregar dependencias se usa el siguiente comando

```bash
composer require <nombre-dependencia>
```

## Actualizar dependencias

Para actualizar dependencias se usa el siguiente comando

```bash
composer update
```

## instalas dependencias Javascript

Para instalar dependencias Javascript se usa el siguiente comando

```bash
npm install
```

### Generar distribuibles

Para generar los distribuibles se usa el siguiente comando

```bash
npm run prod
```