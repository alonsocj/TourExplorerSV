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
      <div class="card  mx-auto my-5 col-4 col-md-4 col-sm-12">
        <article class="card-body">
          <h4 class="card-title mb-4 mt-1 text-center">Iniciar Sesión</h4>
          <form id="form-login">
            <div class="form-group m-3">
              <label>Email</label>
              <input name="email" class="form-control" placeholder="ejemplo@gmail.com" type="email">
            </div>
            <div class="form-group m-3">
              <label>Contraseña</label>
              <input class="form-control mb-3" placeholder="Digite su contraseña" type="password">
              <a href="">¿Olvidaste tu contraseña?</a>
            </div>
            <div class="form-group">
            </div>
            <div class="form-group p-3 d-flex justify-content-end gap-2">
              <button type="submit" class="btn btn-primary btn-block">Iniciar sesión</button>
              <a href="" class="btn btn-outline-primary">Registrarse</a>
            </div>
          </form>
        </article>
      </div>
    </div>
  </main>

  <script>
    const form = document.querySelector('#form-login');

    form.addEventListener('submit', (e) => {
      e.preventDefault();
      const data = new FormData(form);
      fetch('/login', {
          method: 'POST',
          body: data
        })
        .then(res => res.json())
        .then(data => {
          if (data.status === 200) {
            window.location.href = '/dashboard';
          }
        })
        .catch(err => console.log(err));
    });
  </script>
</body>

</html>