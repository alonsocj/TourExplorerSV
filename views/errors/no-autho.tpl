
{extends file="layouts/master.tpl"}


{block name="content"}
  <header class="text-center pt-5">
    <h1>{$error}</h1>
  </header>
  <main class="container min-vh-100 py-5 container-fluid">
    <div class="row">
      <div class="col-md-12">
        <div class="card mx-auto" style="max-width: 500px;">
          <div class="card-body text-center">
            <p>
              {if !isset($message)}
                {assign var="message" value="Algo salio mal, por favor intente de nuevo."}
              {/if}
              {$message}
            </p>
            <div class="d-flex justify-content-center gap-3">
              <a href="/login" class="btn btn-secondary mt-10">Iniciar sesión</a>
              <a href="/" class="btn btn-primary mt-10">Regresar al inicio</a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </main>
{/block}