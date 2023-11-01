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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
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