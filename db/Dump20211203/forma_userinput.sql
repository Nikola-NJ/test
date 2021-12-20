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
-- Table structure for table `userinput`
--

DROP TABLE IF EXISTS `userinput`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userinput` (
  `userInputID` int(11) NOT NULL AUTO_INCREMENT,
  `input` varchar(145) NOT NULL,
  `questionsID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  PRIMARY KEY (`userInputID`),
  KEY `questionsID_idx` (`questionsID`),
  KEY `userID_idx` (`userID`),
  CONSTRAINT `questionsID` FOREIGN KEY (`questionsID`) REFERENCES `questions` (`questionsID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `userID` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userinput`
--

LOCK TABLES `userinput` WRITE;
/*!40000 ALTER TABLE `userinput` DISABLE KEYS */;
INSERT INTO `userinput` VALUES (1,'djole',3,1),(2,'56',7,6),(3,'42',9,6),(4,'blue',10,6),(5,'56',7,6),(6,'42',9,6),(7,'blue',10,6),(8,'perfex',6,8),(9,'perfex',6,8),(10,'perfex',6,8),(22,'samo sa breskvicom',6,4),(23,'Medaa',3,4),(24,'djole',3,1),(25,'djole',3,1),(26,'38',7,3),(27,'38',9,3),(28,'crna',10,3),(29,'38',7,3),(30,'38',9,3),(31,'crna',10,3),(32,'38',7,3),(33,'38',9,3),(34,'crna',10,3),(35,'Submit',10,3),(36,'38',7,3),(37,'38',9,3),(38,'crna',10,3),(39,'27',7,9),(40,'43',9,9),(41,'masna',10,9),(42,'violeta',6,9),(43,'nadal',3,9),(44,'nadal',3,9),(45,'nadal',3,9),(46,'djole',3,9),(47,'djole',3,9),(48,'26',7,1),(49,'47',9,1),(50,'crna',10,1),(51,'samo sa breskvicom',6,1),(52,'Medvedev',3,1),(53,'Medvedev',3,4);
/*!40000 ALTER TABLE `userinput` ENABLE KEYS */;
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
