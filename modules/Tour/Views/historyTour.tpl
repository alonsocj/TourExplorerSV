
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
            
            <table class="table">
              <thead>
                <tr>
                  <th>ID</th>
                  <th>Nombre tour</th>
                  <th>Descripción tour</th>
                  <th>Precio Tour</th>
                  <th>Disponibilidad</th>
                  <th>Fecha de salida</th>
                  <th>Fecha de regreso</th>
                </tr>
              </thead>
              <tbody>
                {foreach from=$tours item=place}
                  <tr>
                    <td>{$place['id_tour']}</td>
                    <td>{$place['nombre_tour']}</td>
                    <td>{$place['descripcion_tour']}</td>
                    <td>{$place['precio_tour']}</td>
                    <td>{$place['disponibilidad_tour']}</td>
                    <td>{$place['fecha_salida_tour']}</td>
                    <td>{$place['fecha_regreso_tour']}</td>                    
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
                <h5 class="modal-title" id="modalTitleId">Tours</h5>
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
          <div class="modal-body">
            <div class="container-fluid">
              {* forms *}
              {* name input *}
              <div class="form-group">
                <label for="name">Nombre</label>
                <input type="text" name="nombre_tour" id="nombre" class="form-control" placeholder="Nombre" aria-describedby="helpId">
              </div>
              {* description input *}
              <div class="form-group">
                <label for="description">Descripcion</label>
                <textarea class="form-control" name="descripcion_tour" id="descripcion" rows="3"></textarea>
              </div>

              <div class="form-group">
                <label for="name">Precio</label>
                <input type="numeric" name="precio_tour" id="precio" class="form-control" placeholder="Precio" aria-describedby="helpId">
              </div>

              <div class="form-group">
                <label for="name">Disponibilidad</label>
                <input type="numeric" name="disponibilidad_tour" id="disponibilidad" class="form-control" placeholder="Disponibilidad" aria-describedby="helpId">
              </div>

              <div class="form-group">
                <label for="name">Nombre</label>
                <input type="datetime-local" name="fecha_salidad_tour" id="fecha_salida" class="form-control" placeholder="Fecha de salida" aria-describedby="helpId">
              </div>

              <div class="form-group">
                <label for="name">Nombre</label>
                <input type="datetime-local" name="fecha_regreso_tour" id="fecha_regreso" class="form-control" placeholder="Fecha de regreso" aria-describedby="helpId">
              </div>


              <div class="form-group mt-3">
                <label for="name">Lugares</label>
                <select class="form-control">
                  <option value="">Seleccione</option>
                  {foreach from=$lugares item=lugar}
                    <option value="{$lugar['id_lugar']}">{$lugar['nombre_lugar']}</option>
                  {/foreach}
                </select>
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
{/block}

{block name="scripts"}
  <script>
    document.addEventListener('DOMContentLoaded', function () {
      const modalId = document.getElementById('crear_place');
      const save_place = document.getElementById('save_place');
    
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
        const precio = document.getElementById('precio').value;
        const disponibilidad = document.getElementById('disponibilidad').value;
        const fecha_salidad = document.getElementById('fecha_salida').value;
        const fecha_regreso = document.getElementById('fecha_regreso').value;
        

        if (nombre == '' || descripcion == '') {
          return;
        }

        const formData = new FormData();

        formData.append('nombre', nombre);
        formData.append('descripcion', descripcion);
        formData.append('precio', precio);
        formData.append('disponibilidad', disponibilidad);
        formData.append('fecha_salida', fecha_salidad);
        formData.append('fecha_regreso', fecha_regreso);

        fetch('/tours', {
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
          console.log(data);
        }).catch((error) => {
          console.log(error);
        });

      });
    });
  </script>
{/block}