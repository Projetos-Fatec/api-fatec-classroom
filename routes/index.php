<?php 

  use app\controllers\ClassroomController;

  use function src\{
    slimConf
  };

  $app = new \Slim\App(slimConf());

  $app->get("/classrooms", ClassroomController::class . ":index");
  $app->get("/classroom/{id}", ClassroomController::class . ":show");
  $app->post("/classroom", ClassroomController::class . ":create");
  $app->put("/classroom/{id}", ClassroomController::class . ":update");

  $app->run();

?>