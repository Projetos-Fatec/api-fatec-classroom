<?php 

    namespace app\controllers;

    use Psr\Http\Message\ServerRequestInterface as Request;
	use Psr\Http\Message\ResponseInterface as Response;

    final class TesteController
    {
        public function teste(Request $request, Response $response, array $args): Response
        {
            return $response;
        }
    }

?>