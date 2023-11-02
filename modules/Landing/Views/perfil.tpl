{extends file="layouts/master.tpl"}


{block name="content"}
  <header class="text-center pt-5">
      <h1>Bienvenido: {$usuario['nombre']}</h1>
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
    
    <div class="row mt-3">
      <div class="col-12 col-md-4">
        <div class="border rounded p-3">
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
      <div class="col-12 col-md-8">
        <div class="row g-3">
          {if is_array($reservas) && count($reservas)}
            {for $i=0 to (count($reservas) - 1)}
              <div class="col-12">
                <div class="border p-3 rounded">
                  <table>
                    <tbody>
                      <tr>
                        <td>Fecha reserva:</td>
                        <td>
                          <span class="badge badge-primary bg-primary">{$reservas[$i]['fecha_reserva']}</span>
                        </td>
                      </tr>
                      <tr>
                        <td>Estado:</td>
                        <td>
                          <span class="badge badge-primary bg-primary">{$reservas[$i]['estado']}</span>
                        </td>
                      </tr>
                      <tr>
                        <td colspan="">
                          Nombre tour: 
                        </td>
                        <td>
                          <a href="/tours/{$reservas[$i]['tour']['id_tour']}">{$reservas[$i]['tour']['nombre_tour']}</a>
                        </td>
                      </tr>
                      <tr>
                        <td colspan="">
                          Fecha de salida tour: 
                        </td>
                        <td>
                          {$reservas[$i]['tour']['fecha_salida_tour']}
                        </td>
                      </tr>
                      <tr>
                        <td colspan="">
                          Fecha de regreso tour: 
                        </td>
                        <td>
                          {$reservas[$i]['tour']['fecha_regreso_tour']}
                        </td>
                      </tr>
                    </tbody>
                  </table>

                </div>
              </div>
            {/for}
          {else}
            <div class="col-12">
              <div class="alert alert-warning">
                No hay reservas registradas
              </div>
            </div>
          {/if}
        </div>
      </div>
    </div>
  </main>
{/block}