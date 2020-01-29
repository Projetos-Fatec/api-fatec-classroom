<?php 

  use app\controllers\ClassroomController;
  use app\middlewares\ExceptionMiddleware;

  use function src\{
    slimConf
  };

  $app = new \Slim\App(slimConf());

  $app->get("/classrooms", ClassroomController::class . ":index")->add( ExceptionMiddleware::class . ":captureExceptions" );
  $app->get("/classroom/{id}", ClassroomController::class . ":show")->add( ExceptionMiddleware::class . ":captureExceptions" );
  $app->post("/classroom", ClassroomController::class . ":create")->add( ExceptionMiddleware::class . ":captureExceptions" );
  $app->put("/classroom/{id}", ClassroomController::class . ":update")->add( ExceptionMiddleware::class . ":captureExceptions" );
  $app->delete("/classroom/{id}", ClassroomController::class . ":destroy")->add( ExceptionMiddleware::class . ":captureExceptions" );

  $app->run();

?>