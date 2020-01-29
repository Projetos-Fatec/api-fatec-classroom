<?php 

  namespace app\models;

  use app\helpers\Validator;

  final class Classroom
  {
    private $idClassroom;
    private $descriptive;
    private $classroomType;

    public function __construct(array $data)
    { 
      $this->idClassroom = $data["idClassroom"] ?? null;
      $this->descriptive = $data["descriptive"] ?? "";
      $this->classroomType = $data["classroomType"] ?? "";

      Validator::validator($this, "descriptive", [ "present"=> true, "min"=> 3, "max"=> 3 ]);
      Validator::validator($this, "classroomType", [ "present"=> true, "min"=> 3, "max"=> 4 ]);

    }

    public function getIdClassroom(): int
    {
      return (int) $this->idClassroom;
    }

    public function setIdClassroom($id): Classroom
    {
      $this->idClassroom = (int) $id;
      return $this;
    }

    public function getDescriptive(): string 
    {
      return $this->descriptive;
    }

    public function setDescriptive(string $descriptive): Classroom
    {
      $this->descriptive = $descriptive;
      return $this;
    }

    public function getClassroomType(): string
    {
      return $this->classroomType;
    }

    public function setClassroomType(string $classroomType): Classroom
    {
      $this->classroomType = $classroomType;
      return $this;
    }

    public function getValues(): array
    {
      return [
        "idClassroom"=> $this->idClassroom,
        "descriptive"=> $this->descriptive,
        "classroomType"=> $this->classroomType
      ];
    }

    public function setValues(array $data): Classroom
    {
      foreach ($data as $key => $value) {
        $this->{"set".ucfirst($key)}($value);
      }
      return $this;
    }

    public function __toString()
    {
      return "Classroom";
    }

  }

?>