<?php

  if (! isset($smarty)) {
    $smarty = new \Core\Providers\TemplateProvider();
  }
  if(!function_exists('view')) {
    function view($view, $data = []) {
      global $smarty;
      $view = explode('.', $view);
      $templateDirs = $smarty->getTemplateDir();
      $templateName = implode('/', array_slice($view, 1)) . '.tpl';

      // structure view[0] = module, view[1] = view|dir view[2] = view|dir ...
      // templateDir = ['module' => 'd  ir']

      $template = $templateDirs[$view[0]] . "/" . $templateName;
      if (!$smarty->templateExists($template)) {
        $smarty->assign($data);
        return $smarty->display($templateDirs['app'] . "/" . 'errors/error.tpl');
      }

      $smarty->assign($data);
      return $smarty->display($template);
    }
  }