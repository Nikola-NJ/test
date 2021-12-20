-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: forma
-- ------------------------------------------------------
-- Server version	5.7.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questions` (
  `questionsID` int(11) NOT NULL AUTO_INCREMENT,
  `pitanje` varchar(255) NOT NULL,
  `typeID` int(11) NOT NULL,
  `formaID` int(11) NOT NULL,
  PRIMARY KEY (`questionsID`),
  KEY `fk_questions_questiontype_idx` (`typeID`),
  KEY `fk_questions_forma1_idx` (`formaID`),
  CONSTRAINT `fk_questions_forma1` FOREIGN KEY (`formaID`) REFERENCES `forma` (`formaID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_questions_questiontype` FOREIGN KEY (`typeID`) REFERENCES `answertype` (`typeID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (1,'Koliko cesto gledate sportski program?',3,3),(2,'Izaberite neke od vasih omiljenih fudbalera?',2,3),(3,'Ko je po vama GOAT u tenisu',1,3),(4,'Koliko puta dnevno idete u prodavnicu?',3,2),(5,'Da li se redovno bavite fizickim aktivnostima',3,2),(6,'Koji tolet papir koristite?',1,2),(7,'Koliko imate godina?',1,1),(8,'Stepen vaseg obrazovanja?',3,1),(9,'Broj obuce?',1,1),(10,'Boja kose?',1,1),(11,'Omiljeni sportski brendovi?',2,3),(144,'Ko je trenutno OP?',2,42),(145,'Koga champa mrzis?',1,42),(146,'Omiljeni itemi',2,42),(147,'Red ili blue side',3,42),(148,'Omiljena rola',3,42),(149,'Omiljeni team?',1,42),(150,'Omiljeno pice',3,43),(151,'Omiljeno voce',2,43),(152,'Najlepsi grad',1,43),(153,'Omiljena pesma',3,43),(154,'Koliko godina imas',1,43),(155,'Omiljeni sport',2,43),(156,'pitanje1',3,44),(157,'pitanje2',2,44),(158,'pitanje3',1,44),(159,'pitanje4',2,44),(160,'pitanje5',3,44);
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-03 21:28:59
