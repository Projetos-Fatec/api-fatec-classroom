<?php 

  namespace app\helpers;
  
  class Validator
  {
    public static function validator(Object $obj, string $attr, array $opts = []): void
    { 

      if(isset($opts["present"]) && $obj->{"get".ucfirst($attr)}() === "" && $opts["present"]){
        throw new \Exception("Invalid argument $attr in the object $obj", 400);
      }

      if(isset($opts["max"]) && strlen($obj->{"get".ucfirst($attr)}()) > (int) $opts["max"]){
        throw new \Exception("Invalid max string length for the attribute $attr in the object $obj", 400);
      }

      if(isset($opts["min"]) && strlen($obj->{"get".ucfirst($attr)}()) < (int) $opts["min"]){
        throw new \Exception("Invalid min string length for the attribute $attr in the object $obj", 400);
      }
    }    

    public static function validParsedBody(array $parsedBody, array $dataExpected): void
    {

      foreach ($parsedBody as $key => $value) {
        if (!in_array($key, $dataExpected)) {
          throw new \InvalidArgumentException("Invalid argument $key", 400);
        }
      }
    }

  }


?>