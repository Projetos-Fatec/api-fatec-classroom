<?php 

  use app\controllers\ClassroomController;
  use app\middlewares\ExceptionMiddleware;

  use function src\{
    slimConf
  };

  $app = new \Slim\App(slimConf());

  $app->get("/classrooms", ClassroomController::class . ":index")->add( ExceptionMiddleware::class . ":isValid" );
  $app->get("/classroom/{id}", ClassroomController::class . ":show");
  $app->post("/classroom", ClassroomController::class . ":create");
  $app->put("/classroom/{id}", ClassroomController::class . ":update");
  $app->delete("/classroom/{id}", ClassroomController::class . ":destroy");

  $app->run();

?>