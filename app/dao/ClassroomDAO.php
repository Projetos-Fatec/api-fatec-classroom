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
      $classrooms = $this->select("SELECT * FROM tb_classroom");

      if (count($classrooms) <= 0) {
        throw new \Exception("Dados não encontrados", 1);
      }

      return $classrooms;
    }

    public function find(int $id): Classroom
    {
      $classroom = $this->select("SELECT * FROM tb_classroom WHERE idClassroom = :id", [
        ":id"=> $id
      ]);

      if(count($classroom) <= 0){
        throw new \Exception("Nenhum registro encontrado", 400);
      }

      return new Classroom($classroom[0]);
    }

    public function save(Classroom $classroom): bool
    {
      return $this->query("INSERT INTO tb_classroom VALUES(null, :descriptive, :classroomType)", [
        "descriptive"=> $classroom->getDescriptive(),
        "classroomType"=> $classroom->getClassroomType()
      ]);
    }

    public function update(Classroom $classroom): bool
    {
      return $this->query("UPDATE tb_classroom SET descriptive = :descriptive, classroomType = :classroomType WHERE idClassroom = :id", [
        "descriptive"=> $classroom->getDescriptive(),
        "classroomType"=> $classroom->getClassroomType(),
        "id"=> $classroom->getIdClassroom()
      ]);
    }

    public function delete(Classroom $classroom): bool
    {
      $stmt = $this->conn
        ->prepare("DELETE FROM tb_classroom WHERE idClassroom = :id");

      return $stmt->execute([
        "id"=> $classroom->getIdClassroom()
      ]);
    }
  
  }

?>