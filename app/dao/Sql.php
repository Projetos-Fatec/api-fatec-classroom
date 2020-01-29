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

    private function bindParams(array $params = [], $stmt): void
    {
      foreach ($params as $key => $value) {
        $stmt->bindValue($key, $value);
      }
    }

    public function query(string $query, array $params = []): bool
    {
      $stmt = $this->conn->prepare($query);
      $this->bindParams($params, $stmt);
      return $stmt->execute();
    }

    public function select(string $query, array $params = []): array
    {
      $stmt = $this->conn->prepare($query);
      $this->bindParams($params, $stmt);
      $stmt->execute();
      
      return $stmt->fetchAll(\PDO::FETCH_ASSOC);

    }

    public function __destruct()
    {
      $this->conn = null;
    }

  }

?>  