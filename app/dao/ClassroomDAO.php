<?php 

  namespace app\dao;

  use app\models\Classroom;

  class ClassroomDAO extends Sql
  {
    public function __construct()
    {
      parent::__construct();
    }

    public function all(): array
    {
      $classrooms = $this->conn
        ->query("SELECT * FROM tb_classroom")
        ->fetchAll(\PDO::FETCH_ASSOC);

      return $classrooms;
    }

    public function find(int $id): Classroom
    {
      $classroom = $this->conn
        ->query("SELECT * FROM tb_classroom WHERE idClassroom = $id")
        ->fetchAll(\PDO::FETCH_ASSOC);

      return new Classroom($classroom[0]);
    }

    public function save(Classroom $classroom): bool
    {
      $stmt = $this->conn->prepare("INSERT INTO tb_classroom VALUES(null, :descriptive, :classroomType)");
      return $stmt->execute([
        "descriptive"=> $classroom->getDescriptive(),
        "classroomType"=> $classroom->getClassroomType()
      ]);
    }

  }

?>