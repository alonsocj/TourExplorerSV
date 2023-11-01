
{extends file="layouts/master.tpl"}


{block name="content"}
  <header class="text-center pt-5">
    <h1>{$title}</h1>
  </header>
  <main class="container container-fluid min-vh-100 py-5">
    <div class="row mb-3">
      <div class="col-12">
        <a href="/panel/lugares" class="btn btn-primary">Regresar</a>
      </div>
    </div>
    <div class="row">
      {if has_flash('imagen_error')}
        <div class="col-md-12">
          <div class="alert alert-danger" role="alert">
            {flash('imagen_error')}
          </div>
        </div>
      {/if}
      {if has_flash('imagen_creada')}
        <div class="col-md-12">
          <div class="alert alert-success" role="alert">
            {flash('imagen_creada')}
          </div>
        </div>
      {/if}
      
      <div class="col-md-12">
        <div class="card mx-auto" style="max-width: 1000px;">
          <div class="card-body text-center">
            <form action="/panel/lugares/{$lugar['id_lugar']}/imagenes" method="post" enctype="multipart/form-data">
              <div class="row aling-items-end rounded border p-3 mb-3">
                <div class="col-12 col-md-8">
                  <div class="form-group">
                    <label for="formFile" class="form-label">Imagenes</label>
                    <input class="form-control" type="file" id="formFile" name="imagen" >
                  </div>
                </div>
                <div class="col-12 col-md-4 d-flex align-items-end">
                  <button type="submit" class="btn btn-primary">Subir</button>
                </div>
              </div>
            </form>
            
            <table id="registros_table" class="table">
              <thead>
                <tr>
                  <th>ID</th>
                  <th>Imagen</th>
                  <th>Filename</th>
                  <th>Acciones</th>
                </tr>
              </thead>
              <tbody>
                {foreach from=$imagenes item=imagen}
                  <tr id="registro_{$imagen['id_imagen']}">
                    <td>{$imagen['id_imagen']}</td>
                    <td>
                      <img src="/uploads/imagenes/{$imagen['nombre_imagen']}" alt="{$imagen['nombre_imagen']}" width="100px" />
                    </td>
                    <td>{$imagen['nombre_imagen']}</td>
                    <td>
                      <div class="d-flex gap-1">
                        <button class="btn btn-danger btn-icon" onclick="eliminar_registro('{$imagen['id_imagen']}')">
                          <i class="fas fa-trash"></i>
                        </button>
                      </div>
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

    let tabla_registro = null;

    function eliminar_registro(id_registro) {
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

          fetch('/panel/lugares/{$lugar['id_lugar']}/imagenes/' + id_registro, {
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

    document.addEventListener('DOMContentLoaded', function () {
      tabla_registro = new DataTable('#registros_table', {
        responsive: true,
        rowId: 'usuario',
        columns: [
          {
            name: 'ID',
            orderable: true,
          },
          {
            name: 'imagen',
            orderable: false,
          },
          {
            name: 'Nombre',
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