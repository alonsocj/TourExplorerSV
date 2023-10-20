<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    {if !isset($title)}
      {assign var="title" value="ToursExplorerSv"}
    {/if}
    <title>{$title}</title>
    <link rel="stylesheet" type="text/css" href="/public/assets/index.css">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

  </head>
  <body>

    {include file="partials/header.tpl"}
    {block name="content"}{/block}
    {include file="partials/footer.tpl"}
    {block name="modals"}{/block}
    <script src="/public/assets/index.js"></script>
    {block name="scripts"}{/block}
  </body>
</html>