{extends file="layouts/master.tpl"}


{block name="content"}
  <header class="text-center pt-5">
    <h1>{$title} {$reserva['estado']}</h1>
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
      {if has_flash('success')}
        <div class="col-12">
          <div class="alert alert-success" role="alert">
            {flash('success')}
          </div>
        </div>
      {/if}
    </div>
    <div class="row">
      {if $reserva['estado'] == 'pendiente'}
        <div class="col-12">
            <div class="row g-3">
  
              <div class="col-12 col-md-8">
                <div class="form-group">
                  <label>Método de pago</label>
                  <select class="form-control" name="contraentrega">
                    <option value="1">Contraentrega</option>
                  </select>
                </div>
              </div>
              <div class="col-12 col-md-4 d-flex justify-content-end align-items-end">
                <div class="d-flex gap-1">
                  <form action="/panel/reservaciones/{$reserva['id_reserva']}/pagar" method="post">
                    <button type="submit" class="btn btn-primary">Pagar</button>
                  </form>
                  <form action="/panel/reservaciones/{$reserva['id_reserva']}/rechazar" method="post">
                    <button type="submit" class="btn btn-danger">rechazar</button>
                  </form>
                </div>
              </div>
            </div>
        </div>
      {/if}
    </div>
    <div class="row mt-3">
      <div class="col-12 col-md-4">
        <div class="border rounded p-3">
          <figure class="d-flex justify-content-center">
            <img src="/uploads/tours/{$tour['imagen_tour']}" alt="{$tour['nombre_tour']}" style="width: 175px;" />
          </figure>
          {if strtotime($tour['fecha_salida_tour']) < time() }
            <p><span class="badge badge-danger bg-danger">Expirado</span></p>
          {else}
            <p><span class="badge badge-success bg-success">Vigente</span></p>
          {/if}
          <p>Precio: <span class="badge badge-primary bg-primary">{$tour['precio_tour']}</span></p>
          <p>Disponibilidad: <span class="badge badge-primary bg-primary">{$tour['disponibilidad_tour']}</span></p>
        </div>
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


    <div class="row mt-3">
      <div class="col-12 ">
        <div class="rounded border p-3">
          <p>Nombre: <span class="badge badge-primary bg-primary">{$usuario['nombre']}</span></p>
          <p>Correo: <span class="badge badge-primary bg-primary">{$usuario['correo']}</span></p>
          {if isset($usuario['genero'])}
            {if $usuario['genero'] == 'male'}
              <p>Género: <span class="badge badge-primary bg-primary">Masculino</span></p>
            {else}
              <p>Género: <span class="badge badge-primary bg-primary">Femenino</span></p>
            {/if}
          {/if}
          <p>Dirección: <span class="badge badge-primary bg-primary">{$usuario['direccion']}</span></p>
          <p>Teléfono: <span class="badge badge-primary bg-primary">{$usuario['telefono']}</span></p>
        </div>
      </div>
    </div>

  </main>
{/block}

{block name="scripts"}
  <script>
    document.addEventListener('DOMContentLoaded', function() {

    });
  </script>
{/block}