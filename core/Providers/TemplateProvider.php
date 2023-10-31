<?php

  namespace Core\Providers;

  use Smarty;

  class TemplateProvider extends Smarty {

    public function __construct() {
      parent::__construct();
      // $this->setTemplateDir(__DIR__.'/../../views');
      $this->setModuleTemplateDir(); 
      $this->setCompileDir(__DIR__.'/../../cache/smarty/compile');
      $this->setConfigDir(__DIR__.'/../../cache/smarty/configs');
      $this->setCacheDir(__DIR__.'/../../cache/smarty/cache');
    }

    public function setModuleTemplateDir() {
      $modules_dir = __DIR__.'/../../modules';
      $template_dirs = [
        'app' => __DIR__.'/../../views'
      ];
      $modules = scandir($modules_dir);
      foreach ($modules as $module) {
        if ($module != '.' && $module != '..') {
          $strlowermodule = strtolower($module);
          $template_dirs[$strlowermodule] = $modules_dir.'/'.$module.'/Views';
        }
      }
      $this->setTemplateDir($template_dirs);
    }

  }