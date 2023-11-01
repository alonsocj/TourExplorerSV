<nav class="navbar navbar-expand-sm navbar-light bg-light">
  <div class="container">
    <a class="navbar-brand" href="#">TourExplorers</a>
    <button class="navbar-toggler d-lg-none" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavId"
      aria-controls="collapsibleNavId" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="collapsibleNavId">
      <ul class="navbar-nav me-auto mt-2 mt-lg-0">
        <li class="nav-item">
          <a class="nav-link active" href="#" aria-current="page">Home <span
              class="visually-hidden">(current)</span></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Link</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="dropdownId" data-bs-toggle="dropdown" aria-haspopup="true"
            aria-expanded="false">Dropdown</a>
         
        </li>
      </ul>
      {if is_auth()}
        <form action="/logout" method="post">
          <button class="btn btn-danger" type="submit">Cerrar sesión</button>
        </form>
      {else}
        <a class="btn btn-success" href="/login">Iniciar sesión</a>
        <a class="btn btn-primary" href="/register">registrarse</a>
      {/if}
    </div>
  </div>
</nav>