{extends file="layouts/master.tpl"}


{block name="content"}
  <header class="text-center pt-5">
    <h1>{$title}</h1>
  </header>
  <main class="container container-fluid min-vh-100 py-5">
    <div class="row">
      <div class="col-md-12">
        <form action="/panel/tours" method="post" enctype="multipart/form-data">
          <div>
            {* forms *}
            {if has_flash('error')}
              <div class="alert alert-danger" role="alert">
                {flash('error')}
              </div>
            {/if}
            {if has_flash('success')}
              <div class="alert alert-success" role="alert">
                {flash('success')}
              </div>
            {/if}
            {* name input *}
            <div class="form-group">
              <label for="name">Nombre</label>
              <input type="text" name="nombre_tour" id="nombre" class="form-control" placeholder="Nombre"
                >
            </div>
            {* description input *}
            <div class="form-group mt-3">
              <label for="description">Descripcion</label>
              <textarea class="form-control" name="descripcion_tour" id="descripcion" rows="3"></textarea>
            </div>

            <div class="form-group mt-3">
              <label for="name">Precio</label>
              <input type="numeric" name="precio_tour" id="precio" class="form-control" placeholder="Precio"
                >
            </div>

            <div class="form-group mt-3">
              <label for="name">Disponibilidad</label>
              <input type="numeric" name="disponibilidad_tour" id="disponibilidad" class="form-control"
                placeholder="Disponibilidad" >
            </div>

            <div class="form-group mt-3">
              <label for="name">Fecha de salidad</label>
              <input type="datetime-local" name="fecha_salida_tour" id="fecha_salida" class="form-control"
                placeholder="Fecha de salida" >
            </div>

            <div class="form-group mt-3">
              <label for="name">Fecha regreso</label>
              <input type="datetime-local" name="fecha_regreso_tour" id="fecha_regreso" class="form-control"
                placeholder="Fecha de regreso" >
            </div>

            <div class="form-group mt-3">
              <label for="name">Imagen</label>
              <input type="file" name="imagen" id="fecha_regreso" class="form-control" />
            </div>

            <div class="border rounded mt-3 p-3">
              <h3 class="text-center">Agregar Lugares</h3>
              <div id="repeater">

                <!--begin::Form group-->
                <div class="form-group">
                  <div data-repeater-list="lugares">
                    <div data-repeater-item>
                      <div class="form-group row">
                        <div class="col-12">
                          <div class="form-group mt-3">
                            <label for="name">Lugares</label>
                            <select name="lugar" class="form-control">
                              <option value="">Seleccione</option>
                              {foreach from=$lugares item=lugar}
                                <option value="{$lugar['id_lugar']}">{$lugar['nombre_lugar']}</option>
                              {/foreach}
                            </select>
                          </div>
                        </div>
                        <div class="col-md-4">
                          <div class="mt-3">
                            <label class="form-label">Hora inicio:</label>
                            <input type="datetime-local" name="hora_inicio_lugar" class="form-control"/>
                          </div>
                        </div>
                        <div class="col-md-4">
                          <div class="mt-3">
                            <label class="form-label">Hora fin:</label>
                            <input type="datetime-local" name="hora_fin_lugar" class="form-control"/>
                          </div>
                        </div>
                        <div class="col-md-4 d-flex align-items-end">
                          <a href="javascript:;" data-repeater-delete class="btn btn-danger">
                            Delete
                          </a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!--end::Form group-->

                <!--begin::Form group-->
                <div class="form-group mt-3">
                  <a href="javascript:;" data-repeater-create class="btn btn-info">
                    Agregar
                  </a>
                </div>
                <!--end::Form group-->

              </div>
            </div>

            <div class="mt-3">
              <button type="submit" class="btn btn-primary">Guardar</button>
            </div>
          </div>
        </form>
      </div>
    </div>
  </main>
{/block}

{block name="scripts"}
  <script src="/public/jquery/jquery.min.js"></script>
  <script src="/public/jquery/jquery.repeater.js"></script>
  <script>
    document.addEventListener('DOMContentLoaded', function() {
      $('#repeater').repeater({
        initEmpty: false,

        defaultValues: {
          'text-input': 'foo'
        },

        show: function() {
          $(this).slideDown();
        },

        hide: function(deleteElement) {
          $(this).slideUp(deleteElement);
        }
      })
    });
  </script>
{/block}