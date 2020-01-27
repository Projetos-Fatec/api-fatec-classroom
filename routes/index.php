<?php 

  use app\controllers\TesteController;

  use function src\{
    slimConf
  };

  $app = new \Slim\App(slimConf());

  $app->get("/", TesteController::class . ":teste");

  $app->run();

?>