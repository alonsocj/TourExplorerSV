{extends file="layouts/master.tpl"}


{block name="content"}
  <header class="text-center pt-5">
    <h1>{$title}</h1>
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
      <div class="col-md-12">
        <div class="card mx-auto" style="max-width: 1000px;">
          <div class="card-body text-center">

            <table id="registros_table" class="table">
              <thead>
                <tr>
                  <th>ID</th>
                  <th>Metodo</th>
                  <th>Fecha pago</th>
                  <th>Monto pagado</th>
                  <th>Fecha de pago</th>
                  <th>Id reserva</th>
                </tr>
              </thead>
              <tbody>
                {foreach from=$pagos item=pago}
                  <tr id="registro_{$pago['id_pago']}">
                    <td>{$pago['id_reserva']}</td>
                    <td>Contraentrega (efectivo)</td>
                    <td>{$pago['metodo_de_pago']}</td>
                    <td>{$pago['monto_pagado']}</td>
                    <td>{$pago['fecha_de_pago']}</td>
                    <td>{$pago['id_reserva']}</td>
                  </tr>
                {/foreach}
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  </main>
{/block}

{block name="scripts"}
  <script>

    document.addEventListener('DOMContentLoaded', function() {

      tabla_registro = new DataTable('#registros_table', {
        responsive: true,
        rowId: 'usuario',
        columns: [{
            name: 'ID',
            orderable: true,
          },
          {
            name: 'Metodo',
            orderable: true,
          },
          {
            name: 'Fecha pago',
            orderable: true,
          },
          {
            name: 'Monto pagado',
            orderable: true,
          },
          {
            name: 'Fecha de pago',
            orderable: true,
          },
          {
            name: 'Id reserva',
            orderable: true,
          }
        ]
      });

    });
  </script>
{/block}