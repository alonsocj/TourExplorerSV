
{extends file="layouts/master.tpl"}


{block name="content"}
  <header class="text-center pt-5">
    <h1>{$hello_word}</h1>
  </header>
  <main class="container container-fluid min-vh-100 py-5">
    <div class="row">
      <div class="col-md-12">
        <div class="card mx-auto" style="max-width: 500px;">
          <div class="card-body text-center">
            <p>
              {$message}
            </p>
          </div>
        </div>
      </div>
    </div>
  </main>
{/block}