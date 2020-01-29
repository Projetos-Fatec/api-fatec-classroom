<?php 

  namespace app\controllers;

  use Psr\Http\Message\ServerRequestInterface as Request;
	use Psr\Http\Message\ResponseInterface as Response;
  use app\dao\ClassroomDAO;
  use app\models\Classroom;
  use app\helpers\Validator;

  final class ClassroomController
  {
    #index, show, create, update, destroy
    public function index(Request $request, Response $response, array $args): Response
    {
      $classroomDAO = new ClassroomDAO();
      $response = $response->withJson($classroomDAO->all());
      return $response;
    }

    public function show(Request $request, Response $response, array $args): Response
    {
      $classroomDAO = new ClassroomDAO();
      $response = $response->withJson($classroomDAO->find((int) $args["id"])->getValues());
      return $response;
    }

    public function create(Request $request, Response $response, array $args): Response
    {
      $data = $request->getParsedBody();

      Validator::validParsedBody($data, ["descriptive", "classroomType"]);

      $classroomDAO = new ClassroomDAO();
      $classroom = new Classroom($data);

      if($classroomDAO->save($classroom)){
        $response = $response->WithJson([
          "message"=> "success on create!"
        ]);
      } else {
        $response = $response->withJson([
          "message"=> "fail on create!"
        ]);
      }

      return $response;
    }

    public function update(Request $request, Response $response, array $args): Response
    {
      $data = $request->getParsedBody();

      Validator::validParsedBody($data, ["descriptive", "classroomType"]);

      $classroomDAO = new ClassroomDAO();
      $classroom = $classroomDAO->find((int) $args["id"]);

      #gera um novo objeto com o mix dos dados
      $classroom = new Classroom(array_merge($classroom->getValues(), $data));

      $result = $classroomDAO->update($classroom);

      $response = $response->withJson([
        "result"=> $result
      ]);

      return $response;
    }

    public function destroy(Request $request, Response $response, array $args): Response
    {
      $classroomDAO = new ClassroomDAO();
      $classroom = $classroomDAO->find((int) $args["id"]);

      $result = $classroomDAO->delete($classroom);

      $response = $response->withJson([
        "result"=> $result
      ]);

      return $response;
    }

  }

?>