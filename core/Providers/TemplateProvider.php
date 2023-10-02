<?php

  namespace Core\Providers;

  use smarty\smarty\libs\Smarty;

  class TemplateProvider extends Smarty {

    public function __construct() {
      parent::__construct();
      $this->setTemplateDir(__DIR__.'/../../views');
      $this->setCompileDir(__DIR__.'/../../cache/smarty/compile');
      $this->setConfigDir(__DIR__.'/../../cache/smarty/configs');
      $this->setCacheDir(__DIR__.'/../../cache/smarty/cache');
    }

  }