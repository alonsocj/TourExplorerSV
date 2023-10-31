<<<<<<< HEAD
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
=======

{extends file="layouts/master.tpl"}


{block name="content"}
  <header class="text-center pt-5">
    <h1>{$title}</h1>
  </header>
>>>>>>> a7246257899d10e9bcee4648fb5f756bc643e772
  <main class="container container-fluid min-vh-100 py-5">
    <div class="row">
      <div class="card  mx-auto my-5 col-4 col-md-4 col-sm-12">
        <article class="card-body">
          <h4 class="card-title mb-4 mt-1 text-center">Iniciar Sesión</h4>
          <form id="form-login" action="/login" method="POST">
            <div class="form-group m-3">
              <label>Email</label>
              <input name="correo" class="form-control" placeholder="ejemplo@gmail.com" type="email">
            </div>
            <div class="form-group m-3">
              <label>Contraseña</label>
              <input class="form-control mb-3" placeholder="Digite su contraseña" type="password" name="contrasena">
              <a href="">¿Olvidaste tu contraseña?</a>
            </div>
            <div class="form-group">
            </div>
            <div class="form-group p-3 d-flex justify-content-end gap-2">
              <button id="login_button" type="submit" class="btn btn-primary btn-block">Iniciar sesión</button>
              <a href="/register" class="btn btn-outline-primary">Registrarse</a>
            </div>
          </form>
        </article>
      </div>
    </div>
  </main>
{/block}

{block name="scripts"}
  <script>
    const form = document.querySelector('#form-login');
    const login_button = document.querySelector('#login_button');
    login_button.addEventListener('click', (e) => {
      e.preventDefault();
      const data = new FormData(form);

      const json_data = {
        correo: document.querySelector('input[name="correo"]').value,
        contrasena: document.querySelector('input[name="contrasena"]').value
      };

      if (json_data.correo == '' || json_data.contrasena == '') {
        Swal.fire({
          icon: 'error',
          title: 'Oops...',
          text: 'Por favor llene todos los campos',
        });
        return;
      }
      
      fetch('/login', {
          method: 'POST',
          body: JSON.stringify(json_data),
          headers: {
            "Content-Type": "application/json",
          }
        })
        .then(response => response.json())
        .then((data) => {
          console.log(data);
          if (data.success) {
            window.location.href = '/';
          } else {
            Swal.fire({
              icon: 'error',
              title: 'Oops...',
              text: 'Usuario o contraseña incorrectos',
            });
            //- limpiar contrasena
            document.querySelector('input[name="contrasena"]').value = '';
          }
        }).catch((error) => {
          console.log(error);
        });
    });
  </script>
{/block}
