{extends file="layouts/master.tpl"}


{block name="content"}
  <div class="row">
    <div class="card  mx-auto my-5 col-3 col-md-3 col-sm-12">
      <article class="card-body">
        <h4 class="card-title mb-4 mt-1 text-center">Iniciar Sesión</h4>
        <form id="form-login">
          <div class="form-group m-3">
            <label>Email</label>
            <input name="email" class="form-control" placeholder="Email" type="email">
          </div>
          <div class="form-group m-3">
            <label>Contraseña</label>
            <input class="form-control" placeholder="Digite su contraseña" type="password">
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
{/block}
{block name="scripts"}
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
{/block}