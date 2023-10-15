<?php
/* Smarty version 4.3.4, created on 2023-10-10 21:44:08
  from '/var/www/html/views/auth/login.tpl' */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '4.3.4',
  'unifunc' => 'content_6525c5a8edf0a3_19423842',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '942687e7c1254b3b32f1f1ece76d73805d477a4c' => 
    array (
      0 => '/var/www/html/views/auth/login.tpl',
      1 => 1696974246,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_6525c5a8edf0a3_19423842 (Smarty_Internal_Template $_smarty_tpl) {
?><div class="row">
  <div class="card  mx-auto my-5 col-3 col-md-3 col-sm-12">
    <article class="card-body">
      <h4 class="card-title mb-4 mt-1 text-center">Iniciar Sesión</h4>
      <form>
        <div class="form-group m-3">
          <label>Email</label>
          <input name="email" class="form-control" placeholder="Email" type="email">
        </div>
        <div class="form-group m-3">
          <label>Contraseña</label>
          <input class="form-control" placeholder="Digite su contraseña" type="password">
          <a href="">¿Olvidaste tu contraseña?</a>
        </div>
        <div class="form-group">
        </div>
        <div class="form-group p-3 d-flex justify-content-end gap-2">
          <button type="submit" class="btn btn-primary btn-block">Iniciar sesión</button>
          <a href="" class="btn btn-outline-primary">Registrarse</a>
        </div>
      </form>
    </article>
  </div>
</div><?php }
}
