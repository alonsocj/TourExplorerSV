<!DOCTYPE html>
<html>
<head>
    <title>Mi Plantilla Smarty</title>
</head>
<body>

<h1>Bienvenido, {$nombre}!</h1>
<p>Tu edad es {$edad} años.</p>

<form action="/test-test" method="POST">
  <input type="hidden" name="method" value="PUT" />
  <input type="text" name="nombre" />
    <input type="submit" value="Test" />

</form>

</body>
</html>