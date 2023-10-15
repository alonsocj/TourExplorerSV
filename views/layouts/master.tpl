<!DOCTYPE html>
<html>

<head>
    <title>Iniciar sesión</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>

<body>
    {*  si la url incluye la ruta /login incluir el archivo  *}
    <!--  {if $smarty.server.REQUEST_URI == '/login'} -->
        {include file="../auth/login.tpl"}




    {*  pagina de inicio  *}
    <!--  {else} -->
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h1>Inicio</h1>
                    <p>Esta es la página de inicio</p>
                </div>
            </div>
        </div>
    {/if}

</body>
</html>