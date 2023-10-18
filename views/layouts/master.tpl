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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
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