<?php 

  use app\controllers\ClassroomController;
  use app\middlewares\ExceptionMiddleware;

  use function src\{
    slimConf
  };

  $app = new \Slim\App(slimConf());

  $app->group('', function(Slim\App $app) {

    $app->get("/classrooms", ClassroomController::class . ":index");
    $app->get("/classroom/{id}", ClassroomController::class . ":show");
    $app->post("/classroom", ClassroomController::class . ":create");
    $app->put("/classroom/{id}", ClassroomController::class . ":update");
    $app->delete("/classroom/{id}", ClassroomController::class . ":destroy");

  })->add( ExceptionMiddleware::class . ":captureExceptions" );

  $app->run();

?>