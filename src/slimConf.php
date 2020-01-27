<?php 

    namespace src;

    function slimConf(): \Slim\Container
    {
			$config = [
				'settings'=> [
					'displayErrorDetails'=> getenv('DISPLAY_ERRORS_DETAILS')
				],
			];
			
			return new \Slim\Container($config);
    }

?>