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
                  <th>Fecha reserva</th>
                  <th>Estado</th>
                  <th>Acciones</th>
                </tr>
              </thead>
              <tbody>
                {foreach from=$reservas item=tour}
                  <tr id="registro_{$tour['id_reserva']}">
                    <td>{$tour['id_reserva']}</td>
                    <td>{$tour['fecha_reserva']}</td>
                    <td>{$tour['estado']}</td>
                    <td>
                      <a href="/panel/reservaciones/{$tour['id_reserva']}/editar" class="btn btn-warning">
                        <i class="fa fa-pencil"></i>
                      </a>
                      <button type="submit" class="btn btn-danger" onclick="eliminarRegistro('{$tour['id_reserva']}')">
                        <i class="fas fa-trash"></i>
                      </button>
                    </td>
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
    function eliminarRegistro(id_registro) {
      Swal.fire({
        title: '¿Estas seguro?',
        text: "¡No podrás revertir esto!",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#d33',
        cancelButtonColor: '#3085d6',
        confirmButtonText: 'Si, eliminar',
        cancelButtonText: 'Cancelar'
      }).then((result) => {
        if (result.isConfirmed) {

          fetch('/panel/reservaciones/' + id_registro, {
              method: 'DELETE',
            }).then((response) => response.json())
            .then((data) => {
              if (data.success) {
                Swal.fire(
                  'Eliminado!',
                  'El registro ha sido eliminado.',
                  'success'
                );
                tabla_registro.row('#registro_' + id_registro).remove().draw(); // eliminar el registro de la tabla
              } else {
                Swal.fire({
                  icon: 'error',
                  title: 'Oops...',
                  text: 'Algo salió mal!'
                });
              }
            }).catch((error) => {
              console.log(error);
            });

        }
      })
    }

    document.addEventListener('DOMContentLoaded', function() {

      tabla_registro = new DataTable('#registros_table', {
        responsive: true,
        rowId: 'usuario',
        columns: [{
            name: 'ID',
            orderable: true,
          },
          {
            name: "Fecha reserva",
            orderable: true,
          },
          {
            name: "Estado",
            orderable: true,
            render: function (data, type, row) {
              if (data == 'pendiente') {
                return '<span class="badge badge-warning bg-warning">' + data + '</span>';
              } else if (data == 'aceptado') {
                return '<span class="badge badge-success bg-success">' + data + '</span>';
              } else if (data == 'rechazado') {
                return '<span class="badge badge-danger bg-danger">' + data + '</span>';
              }
            
            }
          },
          {
            name: 'Acciones',
            orderable: false,
            searchable: false
          }
        ]
      });

    });
  </script>
{/block}