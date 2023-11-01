{extends file="layouts/master.tpl"}


{block name="content"}
  <header class="text-center pt-5">
    <h1>{$title}</h1>
  </header>
  <main class="container container-fluid min-vh-100 py-5">
    <div class="row">
      <div class="col-md-12">
        <div class="card mx-auto" style="max-width: 1000px;">
          <div class="card-body text-center">
            <p>
              {$message}
            </p>
            <a href="/panel/tours/crear" class="btn btn-primary btn-lg">
              Crear
            </a>

            <table id="registros_table" class="table">
              <thead>
                <tr>
                  <th>ID</th>
                  <th>Nombre tour</th>
                  <th>Descripción tour</th>
                  <th>Precio Tour</th>
                  <th>Disponibilidad</th>
                  <th>Fecha de salida</th>
                  <th>Fecha de regreso</th>
                  <th>Acciones</th>
                </tr>
              </thead>
              <tbody>
                {foreach from=$tours item=tour}
                  <tr id="registro_{$tour['id_tour']}">
                    <td>{$tour['id_tour']}</td>
                    <td>{$tour['nombre_tour']}</td>
                    <td>{$tour['descripcion_tour']}</td>
                    <td>{$tour['precio_tour']}</td>
                    <td>{$tour['disponibilidad_tour']}</td>
                    <td>{$tour['fecha_salida_tour']}</td>
                    <td>{$tour['fecha_regreso_tour']}</td>
                    <td>
                      <a href="/panel/tours/{$tour['id_tour']}/editar" class="btn btn-warning">
                        <i class="fa fa-pencil"></i>
                      </a>
                      <button type="submit" class="btn btn-danger" onclick="eliminarRegistro('{$tour['id_tour']}')">
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

          fetch('/panel/tours/' + id_registro, {
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
            name: 'Nombre',
            orderable: true,
          },
          {
            name: 'Descripción',
            orderable: true,
          },
          {
            name: 'Precio',
            orderable: true,
          },
          {
            name: "Disponibilidad",
            orderable: true,
          },
          {
            name: "Fecha de salida",
            orderable: true,
          },
          {
            name: "Fecha de regreso",
            orderable: true,
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