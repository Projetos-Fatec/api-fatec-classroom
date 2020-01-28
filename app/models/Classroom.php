<?php 

  namespace app\models;

  final class Classroom
  {
    private $id;
    private $descriptive;
    private $classroomType;

    public function __construct(array $data)
    {
      $this->descriptive = $data["descriptive"];
      $this->classroomType = $data["classroomType"];
    }

    public function getId(): int
    {
      return (int) $this->id;
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
        "descriptive"=> $this->descriptive,
        "classroomType"=> $this->classroomType
      ];
    }

  }

?>