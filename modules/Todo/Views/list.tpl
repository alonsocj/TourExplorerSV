
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
            <button type="button" class="btn btn-primary btn-lg" data-bs-toggle="modal" data-bs-target="#crear_todo">
              Crear
            </button>
            
            <table class="table">
              <thead>
                <tr>
                  <th>ID</th>
                  <th>Nombre</th>
                  <th>Descripcion</th>
                </tr>
              </thead>
              <tbody>
                {foreach from=$todos item=todo}
                  <tr>
                    <td>{$todo['id']}</td>
                    <td>{$todo['nombre']}</td>
                    <td>{$todo['descripcion']}</td>
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
    <div class="modal fade" id="crear_todo" tabindex="-1" role="dialog" aria-labelledby="modalTitleId" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalTitleId">Todos</h5>
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
          <div class="modal-body">
            <div class="container-fluid">
              {* forms *}
              {* name input *}
              <div class="form-group">
                <label for="name">Nombre</label>
                <input type="text" name="nombre" id="nombre" class="form-control" placeholder="Nombre" aria-describedby="helpId">
              </div>
              {* description input *}
              <div class="form-group">
                <label for="description">Descripcion</label>
                <textarea class="form-control" name="descripcion" id="descripcion" rows="3"></textarea>
              </div>
            </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            <button id="save_todo" type="button" class="btn btn-primary">Save</button>
          </div>
        </div>
      </div>
    </div>
{/block}

{block name="scripts"}
  <script>
    document.addEventListener('DOMContentLoaded', function () {
      const modalId = document.getElementById('crear_todo');
      const save_todo = document.getElementById('save_todo');
    
      modalId.addEventListener('show.bs.modal', function (event) {
          // Button that triggered the modal
          let button = event.relatedTarget;
          // Extract info from data-bs-* attributes
          let recipient = button.getAttribute('data-bs-whatever');
    
        // Use above variables to manipulate the DOM
      });

      save_todo.addEventListener('click', function () {
        const nombre = document.getElementById('nombre').value;
        const descripcion = document.getElementById('descripcion').value;

        if (nombre == '' || descripcion == '') {
          return;
        }

        const formData = new FormData();

        formData.append('nombre', nombre);
        formData.append('descripcion', descripcion);

        fetch('/todos', {
          method: 'POST',
          body: formData
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