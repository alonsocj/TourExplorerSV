<!doctype html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  {if !isset($title)}
    {assign var="title" value="ToursExplorerSv"}
  {/if}
  <title>{$title}</title>
  <link rel="stylesheet" type="text/css" href="/public/assets/index.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous">
  </script>
</head>

<body>
  <main class="container container-fluid min-vh-100 py-5">
    <div class="row">
      <div class="card  mx-auto my-5 col-12 col-md-7 col-sm-12" style="max-width: 500px;">
        <article class="card-body">
          <h4 class="card-title mb-4 mt-1 text-center">Registrarse</h4>
          <form id="form-register">
            <div class="form-group mb-3">
              <label for="nombre">Nombre</label>
              <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre" required>
            </div>
            <div class="form-group mb-3">
              <label for="telefono">Telefono</label>
              <input type="text" class="form-control" id="telefono" name="telefono" placeholder="0000-0000"  maxlength="9" minlength="9" pattern="[0-9]4-[0-9]" >
            </div>
            <div class="form-group mb-3">
              <label for="direccion">Dirección</label>
              <input type="text" class="form-control" id="direccion" name="direccion" placeholder="Dirección">
            </div>
            <div class="form-group mb-3">
              <label for="genero">Genero</label>
              <input type="text" class="form-control" id="genero" name="genero" placeholder="genero">
            </div>
            <div class="form-group mb-3">
              <label for="correo">Correo</label>
              <input type="email" class="form-control" id="correo" name="correo" placeholder="Correo" required>
            </div>
            <div class="form-group mb-3">
              <label for="contrasena">contraseña</label>
              <input type="password" class="form-control" id="contrasena" name="contrasena" placeholder="Contraseña"
                required>
            </div>
            <div class="form-group p-3 d-flex justify-content-end gap-2">
              <button type="submit" class="btn btn-primary btn-block">Registrar</button>
            </div>
          </form>
        </article>
      </div>
    </div>
  </main>
  <script>
    const formRegister = document.getElementById('form-register');
    const inputTelefono = document.getElementById('telefono');
    formRegister.addEventListener('submit', (e) => {
      e.preventDefault();
      const formData = new FormData(formRegister);
      fetch('/register', {
        method: 'POST',
        body: formData
      })
        .then(res => {
          console.log(res); 
          if (res.status === 200) {
            window.location.href = '/';
          } else {
            alert('Error al registrar usuario');
          }
        })
    })
  </script>
</body>

</html>