<?php 

  namespace app\dao;

  abstract class Sql
  {

    protected $conn;

    public function __construct()
    {
      $host = getenv("MYSQL_HOST");
      $user = getenv("MYSQL_USERNAME");
      $passwd = getenv("MYSQL_PASSWORD");
      $port = getenv("MYSQL_PORT");
      $dbname = getenv("MYSQL_DBNAME");

      try {
        $this->conn = new \PDO("mysql:host=$host;dbname=$dbname;port=$port;charset=utf8", $user, $passwd);
        $this->conn->setAttribute(\PDO::ATTR_ERRMODE, \PDO::ERRMODE_EXCEPTION);
      } catch (\Exception $e) {
        die($e->getMessage());
      }

    }

    public function __destruct()
    {
      $this->conn = null;
    }

  }

?>  