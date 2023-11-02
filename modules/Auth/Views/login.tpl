
{extends file="layouts/master.tpl"}


{block name="content"}
  <header class="text-center">
    <h1>Tour Explorer SV 
    <img src="uploads/config/logo.webp" alt="" width="50" height="50" class="d-inline-block align-text-top">
    </h1>
  </header>
  <main class="min-vh-100">
  <img src="uploads/auth/background.jpg" alt="" class="img-fluid position-absolute top-0 left-0 w-100%" style="z-index: -3;">
    <div class="row">
      <div class="card  mx-auto  col-4 col-md-4 col-sm-12" style="background-color: rgba(255, 255, 255, 0.3);">
        <article class="card-body" >
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
