
{extends file="layouts/master.tpl"}


{block name="content"}
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
    <div class="row mt-3">
      <div class="col-12 col-md-4">
        <figure>
          <img src="/uploads/tours/{$tour['imagen_tour']}" alt="{$tour['nombre_tour']}" style="width: 200px;"/>
        </figure>
        {if strtotime($tour['fecha_salida_tour']) < time() }
          <p><span class="badge badge-danger bg-danger">Expirado</span></p>
        {else}
          <p><span class="badge badge-success bg-success">Vigente</span></p>
        {/if}
        <p>Precio: <span class="badge badge-primary bg-primary">{$tour['precio_tour']}</span></p>
        <p>Disponibilidad: <span class="badge badge-primary bg-primary">{$tour['disponibilidad_tour']}</span></p>
      </div>
      <div class="col-12 col-md-8">
        <div>
          <h1>{$tour['nombre_tour']}</h1>
          <p>Fecha salida: <span class="badge badge-primary bg-primary">{$tour['fecha_salida_tour']}</span></p>
          <p>Fecha regreso: <span class="badge badge-primary bg-primary">{$tour['fecha_regreso_tour']}</span></p>
          <p class="mt-3">
            {$tour['descripcion_tour']}
          </p>
        </div>
      </div>
    </div>

    <div class="row g-3 mt-3">
      {if is_array($lugares) && count($lugares)}
        {for $i=0 to (count($lugares) - 1)}
          <div class="col-12">
            <div class="border p-3 rounded">
              <h2>{$lugares[$i]['lugar']['nombre_lugar']}</h2>
              <table>
                <tbody>
                  <tr>
                    <td>Fecha inicio:</td>
                    <td>
                      <span class="badge badge-primary bg-primary">{$lugares[$i]['hora_inicio']}</span>
                    </td>
                  </tr>
                  <tr>
                    <td>Fecha fin:</td>
                    <td>
                      <span class="badge badge-primary bg-primary">{$lugares[$i]['hora_fin']}</span>
                    </td>
                  </tr>
                  <tr>
                    <td colspan="2">
                      Descripción: {$lugares[$i]['lugar']['descripcion_lugar']}
                    </td>
                  </tr>
                  <tr>
                    <td colspan="2">
                      Dirección: {$lugares[$i]['lugar']['direccion_lugar']}
                    </td>
                  </tr>
                </tbody>
              </table>

              <div class="row mt-3">
                {if is_array($lugares[$i]['imagenes']) && count($lugares[$i]['imagenes']) > 0}
                  {foreach from=$lugares[$i]['imagenes'] item=imagen}
                    <div class="col-12 col-sm-6 col-md-4 col-lg-3">
                      <figure>
                        <img src="/uploads/imagenes/{$imagen['nombre_imagen']}" class="w-100" alt="{$imagen['nombre_imagen']}"/>
                      </figure>
                    </div>
                  {/foreach}
                {else}
                  <div class="col-12">
                    <div class="alert alert-warning">
                      No hay imagenes registradas
                    </div>
                  </div>
                {/if}
              </div>

            </div>
          </div>
        {/for}
      {else}
        <div class="col-12">
          <div class="alert alert-warning">
            No hay lugares registrados
          </div>
        </div>
      {/if}
    </div>

  </main>
{/block}