
{extends file="layouts/master.tpl"}


{block name="content"}
  <header class="text-center pt-5">
    <h1>{$title}</h1>
    <p>{$message}</p>
  </header>
  <main class="container container-fluid min-vh-100 py-5">
    <div class="row">
    {if has_flash('error')}
      <div class="col-12">
        <div class="alert alert-danger" role="alert">
          {flash('error')}
        </div>
      </div>
    {/if}
    </div>
    <div class="row g-3 mt-3">
      {if is_array($tours) && count($tours) > 0}
        {foreach from=$tours item=tour}
          <div class="col-12 col-sm-6 col-md-4 col-lg-3">
            <div class="card">
              <img class="card-img-top" src="/uploads/tours/{$tour['imagen_tour']}" alt="Card image cap">
              <div class="card-body">
                <h5 class="card-title">{$tour['nombre_tour']}</h5>
                <p class="card-text">{$tour['descripcion_tour']}</p>
                <a href="/tours/{$tour['id_tour']}" class="btn btn-primary">Ver</a>
              </div>
            </div>
          </div>
        {/foreach}
      {else}
        <div class="col-12">
          <div class="alert alert-warning" role="alert">
            Aun no hay tours disponibles
          </div>
        </div>
      {/if}
    </div>
  </main>
{/block}