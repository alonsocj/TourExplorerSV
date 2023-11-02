{extends file="layouts/master.tpl"}


{block name="content"}
  <img src="uploads/auth/background.jpg" alt="" class="img-fluid position-absolute top-0 left-0 w-100%"
    style="z-index: -3;">
  <main class="min-vh-100">
    <div class="row">
      <div class="card  mx-auto my-5 col-12 col-md-7 col-sm-12" style="max-width: 500px; background-color: rgba(255, 255, 255, 0.3);">
        <article class="card-body">
          <h4 class="card-title mb-4 mt-1 text-center">Registrarse</h4>
          <form id="form-register">
            <div class="row">
              <div class="form-group mb-3 col-6">
                <label for="nombre">Nombre</label>
                <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre" required>
              </div>
              <div class="form-group mb-3 col-6">
                <label for="telefono">Telefono</label>
                <input type="text" class="form-control" id="telefono" name="telefono" placeholder="0000-0000">
              </div>
            </div>
            <div class="row">
              <div class="form-group mb-3 col-8">
                <label for="direccion">Dirección</label>
                <input type="text" class="form-control" id="direccion" name="direccion" placeholder="Dirección">
              </div>
              <div class="form-group mb-3 col-4">
                <label for="genero">Genero</label>
                <select id="genero" name="genero" class="form-control">
                  <option value="male">Masculino</option>
                  <option value="female">Femenino</option>
                </select>
              </div>
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
            <div class="form-group mb-3">
              <label for="contrasena">Repetir contraseña</label>
              <input type="password" class="form-control" id="contrasena" name="repetir_contrasena"
                placeholder="Repetir Contraseña" required>
            </div>
            <div class="form-group p-3 d-flex justify-content-end gap-2">
              <button id="registrar" type="submit" class="btn btn-primary btn-block">Registrar</button>
            </div>
          </form>
        </article>
      </div>
    </div>
  </main>

{/block}

{block name="scripts"}
  <script>
    const formRegister = document.getElementById('form-register');
    const inputTelefono = document.getElementById('telefono');
    const registrar_button = document.getElementById('registrar');

    registrar_button.addEventListener('click', function(e) {
      e.preventDefault();


      const json_data = {
        nombre: document.querySelector('input[name="nombre"]').value,
        telefono: document.querySelector('input[name="telefono"]').value,
        direccion: document.querySelector('input[name="direccion"]').value,
        genero: document.querySelector('select[name="genero"]').value,
        correo: document.querySelector('input[name="correo"]').value,
        contrasena: document.querySelector('input[name="contrasena"]').value,
      };
      if (json_data.contrasena != document.querySelector('input[name="repetir_contrasena"]').value) {
        Swal.fire({
          icon: 'error',
          title: 'Oops...',
          text: 'Las contraseñas no coinciden',
        });
        return;
      }

      if (json_data.nombre == '' || json_data.telefono == '' || json_data.direccion == '' || json_data.genero == '' ||
        json_data.correo == '' || json_data.contrasena == '') {
        Swal.fire({
          icon: 'error',
          title: 'Oops...',
          text: 'Todos los campos son obligatorios',
        });
        return;
      }

      fetch('/registrar', {
          method: 'POST',
          body: JSON.stringify(json_data),
          headers: {
            "Content-Type": "application/json",
          }
        })
        .then(response => response.json())
        .then((data) => {
          if (data.success) {
            window.location.href = '/login';
          } else {
            Swal.fire({
              icon: 'error',
              title: 'Oops...',
              text: data.message || 'Error al registrar',
            });
            //- limpiar contrasena
            document.querySelector('input[name="contrasena"]').value = '';
            document.querySelector('input[name="repetir_contrasena"]').value = '';
          }
        }).catch((error) => {
          console.log(error);
          //- limpiar contrasena
          document.querySelector('input[name="contrasena"]').value = '';
          document.querySelector('input[name="repetir_contrasena"]').value = '';
        });
    });
  </script>
{/block}