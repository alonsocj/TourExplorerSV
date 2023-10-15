<?php
/* Smarty version 4.3.4, created on 2023-10-11 15:08:56
  from '/var/www/html/views/layouts/master.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.3.4',
  'unifunc' => 'content_6526ba88ae8db9_20160485',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    'dd34d11f3ed87721ec75d4677ed0743651e54a17' => 
    array (
      0 => '/var/www/html/views/layouts/master.tpl',
      1 => 1697036921,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
    'file:../auth/login.tpl' => 1,
  ),
),false)) {
function content_6526ba88ae8db9_20160485 (Smarty_Internal_Template $_smarty_tpl) {
?><!DOCTYPE html>
<html>

<head>
    <title>Iniciar sesión</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>

<body>
        <!--  <?php if ($_SERVER['REQUEST_URI'] == '/login') {?> -->
        <?php $_smarty_tpl->_subTemplateRender("file:../auth/login.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>
    <!--  <?php } else { ?> -->
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h1>Inicio</h1>
                    <p>Esta es la página de inicio</p>
                </div>
            </div>
        </div>
    <?php }?>

</body>

</html><?php }
}
