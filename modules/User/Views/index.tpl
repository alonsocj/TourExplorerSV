
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
            <button type="button" class="btn btn-primary btn-lg" data-bs-toggle="modal" data-bs-target="#crear_user">
              Crear
            </button>
            
            <table id="usuarios_table" class="table">
              <thead>
                <tr>
                  <th>ID</th>
                  <th>Nombre</th>
                  <th>Correo</th>
                  <th>Genero</th>
                  <th>Dirección</th>
                  <th>Telefono</th>
                  <th>Rol</th>
                  <th>Acciones</th>
                </tr>
              </thead>
              <tbody>
                {foreach from=$users item=user}
                  <tr id="usuario_{$user['id_usuario']}">
                    <td>{$user['id_usuario']}</td>
                    <td>{$user['nombre']}</td>
                    <td>{$user['correo']}</td>
                    <td>{$user['genero']}</td>
                    <td>{$user['direccion']}</td>
                    <td>{$user['telefono']}</td>
                    <td>{$user['id_rol']}</td>
                    <td>
                      <div class="d-flex gap-1">
                        <button class="btn btn-primary btn-icon" onclick="editarRegistro('{$user['id_usuario']}')" data-bs-toggle="modal" data-bs-target="#editar_user">
                          <i class="fa fa-pencil"></i>
                        </button>
                        <button class="btn btn-danger btn-icon" onclick="eliminarRegistro('{$user['id_usuario']}')">
                          <i class="fas fa-trash"></i>
                        </button>
                        <button class="btn btn-info" onclick="cambiarContra('{$user['id_usuario']}')" data-bs-toggle="modal" data-bs-target="#cambiar_contra">
                          Cambiar contraseña
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

{block name="modals"}
  <div class="modal fade" id="crear_user" tabindex="-1" role="dialog" aria-labelledby="modalTitleId" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
          <div class="modal-header">
              <h5 class="modal-title" id="modalTitleId">Crear usuario</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
        <div class="modal-body">
          <div class="container-fluid">

            {* name input *}
            <div class="form-group">
              <label for="name">Nombre</label>
              <input type="text" name="nombre" id="nombre" class="form-control" placeholder="Nombre">
            </div>
            {* correo input *}
            <div class="form-group mt-3">
              <label for="email">Correo</label>
              <input type="email" id="email" class="form-control" placeholder="Correo">
            </div>
            {* genero select *}
            <div class="form-group mt-3">
              <label for="genero">Genero</label>
              <select id="genero" name="genero" class="form-control">
                <option value="male">Masculino</option>
                <option value="female">Femenino</option>
              </select>
            </div>
            {* direccion input *}
            <div class="form-group mt-3">
              <label for="direccion">Dirección</label>
              <input type="text" name="direccion" id="direccion" class="form-control" placeholder="Dirección">
            </div>
            {* telefono input *}
            <div class="form-group mt-3">
              <label for="telefono">Teléfono</label>
              <input type="text" name="telefono" id="telefono" class="form-control" placeholder="Teléfono">
            </div>
            {* rol select *}
            <div class="form-group mt-3">
              <label for="rol">Rol</label>
              <select id="rol" name="rol" class="form-control">
                <option value="1">Turista</option>
                <option value="2">Administrador</option>
                <option value="3">Operador</option>
              </select>
            </div>

            <div class="form-group mt-3">
              <label for="password">Contraseña nueva</label>
              <input type="password" name="password" id="password" class="form-control" placeholder="Contraseña nueva">
            </div>

            <div class="form-group mt-3">
              <label for="password_repeat">Confirmar contraseña</label>
              <input type="password" name="password_repeat" id="password_repeat" class="form-control" placeholder="Confirmar contraseña">
            </div>

          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
          <button id="save_user" type="button" class="btn btn-primary">Save</button>
        </div>
      </div>
    </div>
  </div>

  <div class="modal fade" id="editar_user" tabindex="-1" role="dialog" aria-labelledby="modalTitleId" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
          <div class="modal-header">
              <h5 class="modal-title" id="modalTitleId">Editar usuario</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
        <div class="modal-body">
          <div class="container-fluid">

            {* name input *}
            <div class="form-group">
              <label for="editar_name">Nombre</label>
              <input type="text" name="editar_nombre" id="editar_nombre" class="form-control" placeholder="Nombre">
            </div>
            {* correo input *}
            <div class="form-group mt-3">
              <label for="editar_email">Correo</label>
              <input type="email" id="editar_email" class="form-control" placeholder="Correo">
            </div>
            {* genero select *}
            <div class="form-group mt-3">
              <label for="editar_genero">Genero</label>
              <select id="editar_genero" name="editar_genero" class="form-control">
                <option value="male">Masculino</option>
                <option value="female">Femenino</option>
              </select>
            </div>
            {* direccion input *}
            <div class="form-group mt-3">
              <label for="editar_direccion">Dirección</label>
              <input type="text" name="editar_direccion" id="editar_direccion" class="form-control" placeholder="Dirección">
            </div>
            {* telefono input *}
            <div class="form-group mt-3">
              <label for="editar_telefono">Teléfono</label>
              <input type="text" name="editar_telefono" id="editar_telefono" class="form-control" placeholder="Teléfono">
            </div>
            {* rol select *}
            <div class="form-group mt-3">
              <label for="editar_rol">Rol</label>
              <select id="editar_rol" name="editar_rol" class="form-control">
                <option value="1">Turista</option>
                <option value="2">Administrador</option>
                <option value="3">Operador</option>
              </select>
            </div>

            <input type="hidden" name="id_usuario" id="id_usuario" />

          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
          <button id="save_editar_user" type="button" class="btn btn-primary">Save</button>
        </div>
      </div>
    </div>
  </div>

  <div class="modal fade" id="cambiar_contra" tabindex="-1" role="dialog" aria-labelledby="modalTitleId" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
          <div class="modal-header">
              <h5 class="modal-title" id="modalTitleId">Todos</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
        <div class="modal-body">
          <div class="container-fluid">

            <div class="form-group">
              <label for="old_password">Contraseña antigua</label>
              <input type="password" name="old_password" id="old_password" class="form-control" placeholder="Contraseña antigua">
            </div>

            <div class="form-group mt-3">
              <label for="new_password">Contraseña nueva</label>
              <input type="password" name="new_password" id="new_password" class="form-control" placeholder="Contraseña nueva">
            </div>

            <div class="form-group mt-3">
              <label for="confirm_password">Confirmar contraseña</label>
              <input type="password" name="confirm_password" id="confirm_password" class="form-control" placeholder="Confirmar contraseña">
            </div>

       
            <input type="hidden" name="change_id_usuario" id="change_id_usuario" />

          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
          <button id="save_pass_user" type="button" class="btn btn-primary">Save</button>
        </div>
      </div>
    </div>
  </div>
{/block}

{block name="scripts"}
  <script>
    let tabla_usuarios = null;

    function cambiarContra(id_usuario) {
      document.getElementById('change_id_usuario').value = id_usuario;
    }

    function eliminarRegistro(id_usuario) {

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

          fetch('/panel/usuarios/' + id_usuario, {
            method: 'DELETE',
          }).then((response) => response.json())
          .then((data) => {
            if (data.success) {
              Swal.fire(
                'Eliminado!',
                'El registro ha sido eliminado.',
                'success'
              );
              tabla_usuarios.row('#usuario_' + id_usuario).remove().draw(); // eliminar el registro de la tabla
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

    function editarRegistro(id_usuario) {
      Swal.showLoading();
      fetch('/panel/usuarios/' + id_usuario, {
        method: 'GET'
      }).then((response) => response.json())
      .then((data) => {
        Swal.close();
        if (data.success) {
          const usuario = data.data;
          document.getElementById('editar_nombre').value = usuario.nombre;
          document.getElementById('editar_email').value = usuario.correo;
          document.getElementById('editar_genero').value = usuario.genero;
          document.getElementById('editar_direccion').value = usuario.direccion;
          document.getElementById('editar_telefono').value = usuario.telefono;
          document.getElementById('editar_rol').value = usuario.id_rol;
          document.getElementById('id_usuario').value = usuario.id_usuario;

        } else {
          Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: 'Algo salió mal!'
          });
        }
      }).catch((error) => {
        Swal.close();
        console.log(error);
      });
    }

    document.addEventListener('DOMContentLoaded', function () {
      const save_user = document.getElementById('save_user');
      const save_editar_user = document.getElementById('save_editar_user');
      const save_pass_user = document.getElementById('save_pass_user');

      save_user.addEventListener('click', function () {
        const nombre = document.getElementById('nombre').value;
        const correo = document.getElementById('email').value;
        const genero = document.getElementById('genero').value;
        const direccion = document.getElementById('direccion').value;
        const telefono = document.getElementById('telefono').value;
        const rol = document.getElementById('rol').value;
        const password = document.getElementById('password').value;
        const password_repeat = document.getElementById('password_repeat').value;

        if (nombre == '' || correo == '' || genero == '' || direccion == '' || telefono == '' || rol == '' || password == '' || password_repeat == '') {
          Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: 'Debe ingresar todos los campos'
          });
          return;
        }

        if (password != password_repeat) {
          Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: 'Las contraseñas no coinciden'
          });
          return;
        }
        const formData = new FormData();

        formData.append('nombre', nombre);
        formData.append('correo', correo);
        formData.append('genero', genero);
        formData.append('direccion', direccion);
        formData.append('telefono', telefono);
        formData.append('rol', rol);
        formData.append('contrasena', password);


        Swal.showLoading();
        fetch('/panel/usuarios', {
          method: 'POST',
          body: formData
          // headers: {
          //   'Content-Type': 'application/json'
          // }
        }).then((response) => response.json())
        .then((data) => {
          Swal.close();
          if (data.success) {
            Swal.fire({
              icon: 'success',
              title: 'Actualizado!',
              text: data.message,
              showConfirmButton: false,
              timer: 1500
            });
            clearCreate();
            const usuario = data.data;
            const nuevaRow = tabla_usuarios.row.add([
              usuario.id_usuario,
              usuario.nombre,
              usuario.correo,
              usuario.genero,
              usuario.direccion,
              usuario.telefono,
              usuario.id_rol,
              `
                <div class="d-flex gap-1">
                  <button class="btn btn-primary btn-icon" onclick="editarRegistro('{literal}${usuario.id_usuario}{/literal}')" data-bs-toggle="modal" data-bs-target="#editar_user">
                    <i class="fa fa-pencil"></i>
                  </button>
                  <button class="btn btn-danger btn-icon" onclick="eliminarRegistro('{literal}${usuario.id_usuario}{/literal}')">
                    <i class="fas fa-trash"></i>
                  </button>
                </div>
              `
            ]);
            nuevaRow.node().id = 'usuario_' + usuario.id_usuario;
            nuevaRow.draw();
            
          } else {
            Swal.fire({
              icon: 'error',
              title: 'Oops...',
              text: data.message
            });
          }
        }).catch((error) => {
          Swal.close();
          console.log(error);
        });

      });

      save_editar_user.addEventListener('click', function () {
        const id_usuario = document.getElementById('id_usuario').value;
        const nombre = document.getElementById('editar_nombre').value;
        const correo = document.getElementById('editar_email').value;
        const genero = document.getElementById('editar_genero').value;
        const direccion = document.getElementById('editar_direccion').value;
        const telefono = document.getElementById('editar_telefono').value;
        const rol = document.getElementById('editar_rol').value;

        if (id_usuario == '') {
          Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: 'Algo salió mal!'
          });
          return;
        }

        if (nombre == '' || correo == '' || genero == '' || direccion == '' || telefono == '' || rol == '') {
          Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: 'Debe ingresar todos los campos'
          });
          return;
        }

        const json_data = {
          nombre: nombre,
          correo: correo,
          genero: genero,
          direccion: direccion,
          telefono: telefono,
          rol: rol
        };

        Swal.showLoading();
        fetch('/panel/usuarios/' + id_usuario, {
          method: 'PUT',
          body: JSON.stringify(json_data),
          headers: {
            'Content-Type': 'application/json'
          }
        }).then((response) => response.json())
        .then((data) => {
          Swal.close();
          if (data.success) {
            Swal.fire({
              icon: 'success',
              title: 'Actualizado!',
              text: 'El registro ha sido actualizado.',
              showConfirmButton: false,
              timer: 1500
            });
            //- borrar de datatable
            tabla_usuarios.row('#usuario_' + id_usuario).remove().draw();
            //- agregar a datatable
            const nuevaRow = tabla_usuarios.row.add([
              id_usuario,
              nombre,
              correo,
              genero,
              direccion,
              telefono,
              rol,
              `
                <div class="d-flex gap-1">
                  <button class="btn btn-primary btn-icon" onclick="editarRegistro('{literal}${id_usuario}{/literal}')" data-bs-toggle="modal" data-bs-target="#editar_user">
                    <i class="fa fa-pencil"></i>
                  </button>
                  <button class="btn btn-danger btn-icon" onclick="eliminarRegistro('{literal}${id_usuario}{/literal}')">
                    <i class="fas fa-trash"></i>
                  </button>
                </div>
              `
            ]);

            nuevaRow.node().id = 'usuario_' + id_usuario;
            nuevaRow.draw();
          } else {
            Swal.fire({
              icon: 'error',
              title: 'Oops...',
              text: 'Algo salió mal!'
            });
          }

        }).catch((error) => {
          Swal.close();
          console.log(error);
        });

      });

      save_pass_user.addEventListener('click', function () {
        const id_usuario = document.getElementById('change_id_usuario').value;
        const old_password = document.getElementById('old_password').value;
        const new_password = document.getElementById('new_password').value;
        const confirm_password = document.getElementById('confirm_password').value;

        if (id_usuario == '') {
          Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: 'Algo salió mal!'
          });
          return;
        }

        if (old_password == '' || new_password == '' || confirm_password == '') {
          Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: 'Debe ingresar todos los campos'
          });
          return;
        }

        if (new_password != confirm_password) {
          Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: 'Las contraseñas no coinciden'
          });
          return;
        }

        const json_data = {
          old_password: old_password,
          new_password: new_password
        };

        Swal.showLoading();
        fetch('/panel/usuarios/' + id_usuario + '/password', {
          method: 'PUT',
          body: JSON.stringify(json_data),
          headers: {
            'Content-Type': 'application/json'
          }
        }).then((response) => response.json())
        .then((data) => {
          Swal.close();
          console.log(data);
          if (data.success) {
            clearPass();
            Swal.fire({
              icon: 'success',
              title: 'Contraseña cambiada',
              text: 'La contraseña ha sido cambiada con éxito'
            });
          } else {
            Swal.fire({
              icon: 'error',
              title: 'Oops...',
              text: data.message
            });
          }

        }).catch((error) => {
          Swal.close();
          console.log(error);
        });

      });

      tabla_usuarios = new DataTable('#usuarios_table', {
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
            name: 'Correo',
            orderable: true,
          },
          {
            name: 'Genero',
            orderable: true,
            render: function (data, type, row) {
              if (data == 'female') {
                return "Femenino";
              }
              return "Masculino";
            }
          },
          {
            name: 'Dirección',
            orderable: true,
          },
          {
            name: 'Telefono',
            orderable: true,
          },
          {
            name: 'Rol',
            orderable: false,
            render: function (data, type, row) {
              switch (data) {
                case 3:
                  return "Operador"
                  break;
                case 2:
                  return "Administrador"
                  break;
                default:
                  return "Turista"
                  break;
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

    function clearCreate () {
      document.getElementById('nombre').value = '';
      document.getElementById('email').value = '';
      document.getElementById('genero').value = '';
      document.getElementById('direccion').value = '';
      document.getElementById('telefono').value = '';
      document.getElementById('rol').value = '';
      document.getElementById('password').value = '';
      document.getElementById('password_repeat').value = '';
    }

    function clearEditar () {
      document.getElementById('editar_nombre').value = '';
      document.getElementById('editar_email').value = '';
      document.getElementById('editar_genero').value = '';
      document.getElementById('editar_direccion').value = '';
      document.getElementById('editar_telefono').value = '';
      document.getElementById('editar_rol').value = '';
    }

    function clearPass () {
      document.getElementById('old_password').value = '';
      document.getElementById('new_password').value = '';
      document.getElementById('confirm_password').value = '';
    }
  </script>
{/block}