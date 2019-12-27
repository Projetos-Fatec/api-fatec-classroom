-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: db_fatecclassroom
-- ------------------------------------------------------
-- Server version	5.5.5-10.3.16-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tb_admin`
--

DROP TABLE IF EXISTS `tb_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_admin` (
  `idAdmin` int(11) NOT NULL AUTO_INCREMENT,
  `adminName` varchar(50) NOT NULL,
  `cpf` varchar(11) NOT NULL,
  `passwd` varchar(255) NOT NULL,
  `email` varchar(120) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `dateRegister` timestamp NOT NULL DEFAULT current_timestamp(),
  `dateAccess` date NOT NULL,
  `profileImage` text DEFAULT NULL,
  PRIMARY KEY (`idAdmin`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_admin`
--

LOCK TABLES `tb_admin` WRITE;
/*!40000 ALTER TABLE `tb_admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_class`
--

DROP TABLE IF EXISTS `tb_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_class` (
  `idClass` int(11) NOT NULL AUTO_INCREMENT,
  `idProfessor` int(11) NOT NULL,
  `idCourse` int(11) NOT NULL,
  `idClassroom` int(11) NOT NULL,
  `descriptive` varchar(40) NOT NULL,
  `classScheduleStart` time NOT NULL,
  `classScheduleEnd` time NOT NULL,
  `classDay` date NOT NULL,
  PRIMARY KEY (`idClass`),
  KEY `idProfessor` (`idProfessor`),
  KEY `idCourse` (`idCourse`),
  KEY `idClassroom` (`idClassroom`),
  CONSTRAINT `tb_class_ibfk_1` FOREIGN KEY (`idProfessor`) REFERENCES `tb_professor` (`idProfessor`),
  CONSTRAINT `tb_class_ibfk_2` FOREIGN KEY (`idCourse`) REFERENCES `tb_course` (`idCourse`),
  CONSTRAINT `tb_class_ibfk_3` FOREIGN KEY (`idClassroom`) REFERENCES `tb_classroom` (`idClassroom`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_class`
--

LOCK TABLES `tb_class` WRITE;
/*!40000 ALTER TABLE `tb_class` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_classroom`
--

DROP TABLE IF EXISTS `tb_classroom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_classroom` (
  `idClassroom` int(11) NOT NULL AUTO_INCREMENT,
  `descriptive` varchar(20) NOT NULL,
  `classroomType` enum('lab','sala') DEFAULT NULL,
  PRIMARY KEY (`idClassroom`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_classroom`
--

LOCK TABLES `tb_classroom` WRITE;
/*!40000 ALTER TABLE `tb_classroom` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_classroom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_component`
--

DROP TABLE IF EXISTS `tb_component`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_component` (
  `idComponent` int(11) NOT NULL AUTO_INCREMENT,
  `idType` int(11) NOT NULL,
  `idModel` int(11) NOT NULL,
  `descriptive` varchar(50) NOT NULL,
  `dateRegister` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`idComponent`),
  KEY `idType` (`idType`),
  KEY `idModel` (`idModel`),
  CONSTRAINT `tb_component_ibfk_1` FOREIGN KEY (`idType`) REFERENCES `tb_equipmenttype` (`idType`),
  CONSTRAINT `tb_component_ibfk_2` FOREIGN KEY (`idModel`) REFERENCES `tb_model` (`idModel`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_component`
--

LOCK TABLES `tb_component` WRITE;
/*!40000 ALTER TABLE `tb_component` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_component` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_course`
--

DROP TABLE IF EXISTS `tb_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_course` (
  `idCourse` int(11) NOT NULL AUTO_INCREMENT,
  `descriptive` varchar(20) NOT NULL,
  PRIMARY KEY (`idCourse`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_course`
--

LOCK TABLES `tb_course` WRITE;
/*!40000 ALTER TABLE `tb_course` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_equipment`
--

DROP TABLE IF EXISTS `tb_equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_equipment` (
  `idEquipment` int(11) NOT NULL AUTO_INCREMENT,
  `idType` int(11) NOT NULL,
  `idClassroom` int(11) NOT NULL,
  `idModel` int(11) NOT NULL,
  `descriptive` varchar(50) NOT NULL,
  `dateRegister` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`idEquipment`),
  KEY `idType` (`idType`),
  KEY `idClassroom` (`idClassroom`),
  KEY `idModel` (`idModel`),
  CONSTRAINT `tb_equipment_ibfk_1` FOREIGN KEY (`idType`) REFERENCES `tb_equipmenttype` (`idType`),
  CONSTRAINT `tb_equipment_ibfk_2` FOREIGN KEY (`idClassroom`) REFERENCES `tb_classroom` (`idClassroom`),
  CONSTRAINT `tb_equipment_ibfk_3` FOREIGN KEY (`idModel`) REFERENCES `tb_model` (`idModel`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_equipment`
--

LOCK TABLES `tb_equipment` WRITE;
/*!40000 ALTER TABLE `tb_equipment` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_equipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_equipmentcomponent`
--

DROP TABLE IF EXISTS `tb_equipmentcomponent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_equipmentcomponent` (
  `idEquipmentComponent` int(11) NOT NULL AUTO_INCREMENT,
  `idComponent` int(11) NOT NULL,
  `idEquipment` int(11) NOT NULL,
  PRIMARY KEY (`idEquipmentComponent`),
  KEY `idEquipment` (`idEquipment`),
  KEY `idComponent` (`idComponent`),
  CONSTRAINT `tb_equipmentcomponent_ibfk_1` FOREIGN KEY (`idEquipment`) REFERENCES `tb_equipment` (`idEquipment`),
  CONSTRAINT `tb_equipmentcomponent_ibfk_2` FOREIGN KEY (`idComponent`) REFERENCES `tb_component` (`idComponent`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_equipmentcomponent`
--

LOCK TABLES `tb_equipmentcomponent` WRITE;
/*!40000 ALTER TABLE `tb_equipmentcomponent` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_equipmentcomponent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_equipmentreport`
--

DROP TABLE IF EXISTS `tb_equipmentreport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_equipmentreport` (
  `idEquipmentReport` int(11) NOT NULL AUTO_INCREMENT,
  `idErrorReport` int(11) NOT NULL,
  `idEquipment` int(11) NOT NULL,
  PRIMARY KEY (`idEquipmentReport`),
  KEY `idErrorReport` (`idErrorReport`),
  KEY `idEquipment` (`idEquipment`),
  CONSTRAINT `tb_equipmentreport_ibfk_1` FOREIGN KEY (`idErrorReport`) REFERENCES `tb_errorreport` (`idErrorReport`),
  CONSTRAINT `tb_equipmentreport_ibfk_2` FOREIGN KEY (`idEquipment`) REFERENCES `tb_equipment` (`idEquipment`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_equipmentreport`
--

LOCK TABLES `tb_equipmentreport` WRITE;
/*!40000 ALTER TABLE `tb_equipmentreport` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_equipmentreport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_equipmenttype`
--

DROP TABLE IF EXISTS `tb_equipmenttype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_equipmenttype` (
  `idType` int(11) NOT NULL AUTO_INCREMENT,
  `descriptive` varchar(30) NOT NULL,
  PRIMARY KEY (`idType`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_equipmenttype`
--

LOCK TABLES `tb_equipmenttype` WRITE;
/*!40000 ALTER TABLE `tb_equipmenttype` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_equipmenttype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_errorreport`
--

DROP TABLE IF EXISTS `tb_errorreport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_errorreport` (
  `idErrorReport` int(11) NOT NULL AUTO_INCREMENT,
  `idProfessor` int(11) NOT NULL,
  `title` varchar(40) NOT NULL,
  `descriptive` text NOT NULL,
  `reportStatus` enum('aguardando','concluido') NOT NULL,
  `dateRegister` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`idErrorReport`),
  KEY `idProfessor` (`idProfessor`),
  CONSTRAINT `tb_errorreport_ibfk_1` FOREIGN KEY (`idProfessor`) REFERENCES `tb_professor` (`idProfessor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_errorreport`
--

LOCK TABLES `tb_errorreport` WRITE;
/*!40000 ALTER TABLE `tb_errorreport` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_errorreport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_model`
--

DROP TABLE IF EXISTS `tb_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_model` (
  `idModel` int(11) NOT NULL AUTO_INCREMENT,
  `descriptive` varchar(40) NOT NULL,
  PRIMARY KEY (`idModel`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_model`
--

LOCK TABLES `tb_model` WRITE;
/*!40000 ALTER TABLE `tb_model` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_professor`
--

DROP TABLE IF EXISTS `tb_professor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_professor` (
  `idProfessor` int(11) NOT NULL AUTO_INCREMENT,
  `professorName` varchar(50) NOT NULL,
  `passwd` varchar(255) NOT NULL,
  `email` varchar(120) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `profileImage` text DEFAULT NULL,
  PRIMARY KEY (`idProfessor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_professor`
--

LOCK TABLES `tb_professor` WRITE;
/*!40000 ALTER TABLE `tb_professor` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_professor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_professorcourse`
--

DROP TABLE IF EXISTS `tb_professorcourse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_professorcourse` (
  `idProfessorCourse` int(11) NOT NULL AUTO_INCREMENT,
  `idProfessor` int(11) NOT NULL,
  `idCourse` int(11) NOT NULL,
  `dateRegister` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`idProfessorCourse`),
  KEY `idProfessor` (`idProfessor`),
  KEY `idCourse` (`idCourse`),
  CONSTRAINT `tb_professorcourse_ibfk_1` FOREIGN KEY (`idProfessor`) REFERENCES `tb_professor` (`idProfessor`),
  CONSTRAINT `tb_professorcourse_ibfk_2` FOREIGN KEY (`idCourse`) REFERENCES `tb_course` (`idCourse`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_professorcourse`
--

LOCK TABLES `tb_professorcourse` WRITE;
/*!40000 ALTER TABLE `tb_professorcourse` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_professorcourse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_request`
--

DROP TABLE IF EXISTS `tb_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_request` (
  `idRequest` int(11) NOT NULL AUTO_INCREMENT,
  `idProfessor` int(11) NOT NULL,
  `idClass` int(11) NOT NULL,
  `dateRegister` timestamp NOT NULL DEFAULT current_timestamp(),
  `requestStatus` enum('aguardando','concluido') NOT NULL,
  `feedback` text NOT NULL,
  PRIMARY KEY (`idRequest`),
  KEY `idProfessor` (`idProfessor`),
  KEY `idClass` (`idClass`),
  CONSTRAINT `tb_request_ibfk_1` FOREIGN KEY (`idProfessor`) REFERENCES `tb_professor` (`idProfessor`),
  CONSTRAINT `tb_request_ibfk_2` FOREIGN KEY (`idClass`) REFERENCES `tb_class` (`idClass`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_request`
--

LOCK TABLES `tb_request` WRITE;
/*!40000 ALTER TABLE `tb_request` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_request` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-27 13:32:04
