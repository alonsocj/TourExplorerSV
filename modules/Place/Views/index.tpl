
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
            <button type="button" class="btn btn-primary btn-lg" data-bs-toggle="modal" data-bs-target="#crear_place">
              Crear
            </button>
            
            <table id="registros_table" class="table">
              <thead>
                <tr>
                  <th>ID</th>
                  <th>Nombre lugar</th>
                  <th>Descripción lugar</th>
                  <th>Dirección lugar</th>
                  <th>Acciones</th>
                </tr>
              </thead>
              <tbody>
                {foreach from=$places item=place}
                  <tr id="registro_{$place['id_lugar']}">
                    <td>{$place['id_lugar']}</td>
                    <td>{$place['nombre_lugar']}</td>
                    <td>{$place['descripcion_lugar']}</td>
                    <td>{$place['direccion_lugar']}</td>
                    <td>
                      <div class="d-flex gap-1">
                        <button class="btn btn-primary btn-icon" onclick="editar_registro('{$place['id_lugar']}')" data-bs-toggle="modal" data-bs-target="#editar_place">
                          <i class="fa fa-pencil"></i>
                        </button>
                        <button class="btn btn-danger btn-icon" onclick="eliminar_registro('{$place['id_lugar']}')">
                          <i class="fas fa-trash"></i>
                        </button>
                        <a href="/panel/lugares/{$place['id_lugar']}/imagenes" class="btn btn-info">Imagenes</a>
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

{block name="modals"}
  <div class="modal fade" id="crear_place" tabindex="-1" role="dialog" aria-labelledby="modalTitleId" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
          <div class="modal-header">
              <h5 class="modal-title" id="modalTitleId">Places</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
        <div class="modal-body">
          <div class="container-fluid">
            {* forms *}
            {* name input *}
            <div class="form-group">
              <label for="name">Nombre</label>
              <input type="text" name="nombre_lugar" id="nombre" class="form-control" placeholder="Nombre" aria-describedby="helpId">
            </div>
            {* description input *}
            <div class="form-group mt-3">
              <label for="description">Descripcion</label>
              <textarea class="form-control" name="descripcion_lugar" id="descripcion" rows="3"></textarea>
            </div>

            <div class="form-group mt-3">
              <label for="name">Nombre</label>
              <input type="text" name="direccion_lugar" id="direccion" class="form-control" placeholder="Dirección lugar" aria-describedby="helpId">
            </div>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
          <button id="save_place" type="button" class="btn btn-primary">Save</button>
        </div>
      </div>
    </div>
  </div>

  <div class="modal fade" id="editar_place" tabindex="-1" role="dialog" aria-labelledby="modalTitleId" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
          <div class="modal-header">
              <h5 class="modal-title" id="modalTitleId">Places</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
        <div class="modal-body">
          <div class="container-fluid">
            {* forms *}
            {* name input *}
            <div class="form-group">
              <label for="editar_nombre">Nombre</label>
              <input type="text" name="nombre_lugar" id="editar_nombre" class="form-control" placeholder="Nombre" aria-describedby="helpId">
            </div>
            {* description input *}
            <div class="form-group mt-3">
              <label for="editar_descripcion">Descripcion</label>
              <textarea class="form-control" name="descripcion_lugar" id="editar_descripcion" rows="3"></textarea>
            </div>

            <div class="form-group mt-3">
              <label for="editar_direccion">Nombre</label>
              <input type="text" name="direccion_lugar" id="editar_direccion" class="form-control" placeholder="Dirección lugar" aria-describedby="helpId">
            </div>

            <input type="hidden" name="id_lugar" id="id_lugar">

          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
          <button id="save_edit_place" type="button" class="btn btn-primary">Save</button>
        </div>
      </div>
    </div>
  </div>
{/block}

{block name="scripts"}
  <script>

    let tabla_registro = null;

    function editar_registro(id_registro) {
      Swal.showLoading();

      fetch('/panel/lugares/' + id_registro, {
        method: 'GET',
      }).then((response) => response.json())
      .then((data) => {
        Swal.close();
        if (data.success) {
          const lugar = data.data;
          document.getElementById('editar_nombre').value = lugar.nombre_lugar;
          document.getElementById('editar_descripcion').value = lugar.descripcion_lugar;
          document.getElementById('editar_direccion').value = lugar.direccion_lugar;
          document.getElementById('id_lugar').value = lugar.id_lugar;
        } else {
          Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: data.message
          });
        }
      }).catch((error) => {
        Swal.close();
      });

    }

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

          fetch('/panel/lugares/' + id_registro, {
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
      const modalId = document.getElementById('crear_place');
      const save_place = document.getElementById('save_place');
      const save_edit_place = document.getElementById('save_edit_place');
    
      modalId.addEventListener('show.bs.modal', function (event) {
          // Button that triggered the modal
          let button = event.relatedTarget;
          // Extract info from data-bs-* attributes
          let recipient = button.getAttribute('data-bs-whatever');
    
        // Use above variables to manipulate the DOM
      });

      save_place.addEventListener('click', function () {
        const nombre = document.getElementById('nombre').value;
        const descripcion = document.getElementById('descripcion').value;
        const direccion = document.getElementById('direccion').value;

        if (nombre == '' || descripcion == '' || direccion == '') {
          Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: 'Todos los campos son obligatorios!'
          });
          return;
        }

        const formData = new FormData();

        formData.append('nombre', nombre);
        formData.append('descripcion', descripcion);
        formData.append('direccion', direccion);

        fetch('/panel/lugares', {
          method: 'POST',
          body: formData
          // body: JSON.stringify({
          //   nombre: nombre,
          //   descripcion: descripcion
          // }),
          // headers: {
          //   'Content-Type': 'application/json'
          // }
        }).then((response) => response.json())
        .then((data) => {
          if (data.success) {
            Swal.fire(
              'Creado!',
              'El registro ha sido creado.',
              'success'
            );
            const lugar = data.data;
            const nuevaRow = tabla_registro.row.add([
              lugar.id_lugar,
              lugar.nombre_lugar,
              lugar.descripcion_lugar,
              lugar.direccion_lugar,
              `<div class="d-flex gap-1">
                <button class="btn btn-primary btn-icon" onclick="editar_registro('{literal}${lugar.id_lugar}{/literal}')" data-bs-toggle="modal" data-bs-target="#editar_registro">
                  <i class="fa fa-pencil"></i>
                </button>
                <button class="btn btn-danger btn-icon" onclick="eliminar_registro('{literal}${lugar.id_lugar}{/literal}')">
                  <i class="fas fa-trash"></i>
                </button>
                <a href="/panel/lugares/{literal}${lugar.id_lugar}{/literal}/imagenes" class="btn btn-info">Imagenes</a>
              </div>`
            ]);
            nuevaRow.node().id = 'registro_' + lugar.id_lugar;
            nuevaRow.draw();
            clearCrear();
          }else {
            Swal.fire({
              icon: 'error',
              title: 'Oops...',
              text: data.message
            });
          }
        }).catch((error) => {
          console.log(error);
        });

      });

      save_edit_place.addEventListener('click', function () {
        const nombre = document.getElementById('editar_nombre').value;
        const descripcion = document.getElementById('editar_descripcion').value;
        const direccion = document.getElementById('editar_direccion').value;
        const id_lugar = document.getElementById('id_lugar').value;

        if (nombre == '' || descripcion == '' || direccion == '') {
          Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: 'Todos los campos son obligatorios!'
          });
          return;
        }

        const json_data = {
          nombre: nombre,
          descripcion: descripcion,
          direccion: direccion
        }

        fetch('/panel/lugares/' + id_lugar, {
          method: 'PUT',
          body: JSON.stringify(json_data),
          headers: {
            'Content-Type': 'application/json'
          }
        }).then((response) => response.json())
        .then((data) => {
          if (data.success) {
            Swal.fire({
              icon: 'success',
              title: 'Actualizado!',
              text: 'El registro ha sido actualizado.'
            });
            const lugar = data.data;

            // remover el registro de la tabla
            tabla_registro.row('#registro_' + lugar.id_lugar).remove().draw();

            // agregar el registro a la tabla
            const nuevaRow = tabla_registro.row.add([
              lugar.id_lugar,
              lugar.nombre_lugar,
              lugar.descripcion_lugar,
              lugar.direccion_lugar,
              `<div class="d-flex gap-1">
                <button class="btn btn-primary btn-icon" onclick="editar_registro('{literal}${lugar.id_lugar}{/literal}')" data-bs-toggle="modal" data-bs-target="#editar_registro">
                  <i class="fa fa-pencil"></i>
                </button>
                <button class="btn btn-danger btn-icon" onclick="eliminar_registro('{literal}${lugar.id_lugar}{/literal}')">
                  <i class="fas fa-trash"></i>
                </button>
                <a href="/panel/lugares/{literal}${lugar.id_lugar}{/literal}/imagenes" class="btn btn-info">Imagenes</a>
              </div>`
            ]);
            nuevaRow.node().id = 'registro_' + lugar.id_lugar;
            nuevaRow.draw();

          }else {
            Swal.fire({
              icon: 'error',
              title: 'Oops...',
              text: data.message
            });
          }
        }).catch((error) => {
          console.log(error);
        });

      });

      tabla_registro = new DataTable('#registros_table', {
        responsive: true,
        rowId: 'usuario',
        columns: [
          {
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
            name: 'Dirección',
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

    function clearCrear () {
      document.getElementById('nombre').value = '';
      document.getElementById('descripcion').value = '';
      document.getElementById('direccion').value = '';
    }
  </script>
{/block}