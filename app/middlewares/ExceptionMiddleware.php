<?php 

  namespace app\middlewares;

  use Psr\Http\Message\ServerRequestInterface as Request;
	use Psr\Http\Message\ResponseInterface as Response;

  class ExceptionMiddleware 
  {
    public static function captureExceptions(Request $request, Response $response, $next): Response
    {
      try {
        $response = $next($request, $response);
      } catch (\Exception | \Throwable $th) {
        $response = $response->withJson([
          "error"=> $th->getMessage()
        ]);
      }
  
      return $response;
    }

  }

?>