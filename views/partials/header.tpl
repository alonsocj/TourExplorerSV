<nav class="navbar navbar-expand-sm  shadow-sm p-3 mb-5 rounded">
  <div class="container">
    <a class="navbar-brand fw-bold " href="/">Tours Explorer SV 
    <img src="uploads/config/logo.webp" alt="" width="20" height="20" class="d-inline-block align-text-top">
    </a>

    <button class="navbar-toggler d-lg-none" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavId"
      aria-controls="collapsibleNavId" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="collapsibleNavId">
      <ul class="navbar-nav me-auto mt-2 mt-lg-0">
        <li class="nav-item">
        {if is_auth()}
          <li class="nav-item">
            <a class="nav-link" href="/panel/tours">Tours</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/panel/lugares">Lugares</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/todos">Tareas</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="/panel/usuarios">Usuarios</a>
          </li>
        {/if}
      </ul>
      {if is_auth()}
        <form action="/logout" method="post">
          <button class="btn btn-light" type="submit">Cerrar sesión</button>
        </form>
      {else}
        <a class="btn btn-dark mx-3" href="/login">Iniciar sesión</a>
        <a class="btn btn-outline-dark" href="/register">registrarse</a>
      {/if}
    </div>
  </div>
</nav>