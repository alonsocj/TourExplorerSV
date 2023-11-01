
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
                  <th>Nombre lugar</th>
                  <th>Descripción lugar</th>
                  <th>Dirección lugar</th>
                </tr>
              </thead>
              <tbody>
                {foreach from=$places item=place}
                  <tr>
                    <td>{$place['id_lugar']}</td>
                    <td>{$place['nombre_lugar']}</td>
                    <td>{$place['descripcion_lugar']}</td>
                    <td>{$place['direccion_lugar']}</td>
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
              <div class="form-group">
                <label for="description">Descripcion</label>
                <textarea class="form-control" name="descripcion_lugar" id="descripcion" rows="3"></textarea>
              </div>

              <div class="form-group">
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
        const direccion = document.getElementById('direccion').value;

        if (nombre == '' || descripcion == '') {
          return;
        }

        const formData = new FormData();

        formData.append('nombre', nombre);
        formData.append('descripcion', descripcion);
        formData.append('direccion', direccion);

        fetch('/lugares', {
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