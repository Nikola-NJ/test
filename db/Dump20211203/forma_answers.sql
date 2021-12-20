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
-- Table structure for table `answers`
--

DROP TABLE IF EXISTS `answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `answers` (
  `answerID` int(11) NOT NULL AUTO_INCREMENT,
  `odgovor` varchar(120) NOT NULL,
  `questionsID` int(11) NOT NULL,
  PRIMARY KEY (`answerID`),
  KEY `fk_answers_questions1_idx` (`questionsID`),
  CONSTRAINT `fk_answers_questions1` FOREIGN KEY (`questionsID`) REFERENCES `questions` (`questionsID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=406 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answers`
--

LOCK TABLES `answers` WRITE;
/*!40000 ALTER TABLE `answers` DISABLE KEYS */;
INSERT INTO `answers` VALUES (1,'Mesi',2),(2,'Ronaldo',2),(3,'Mitar',2),(4,'Borjan',2),(5,'Kad me zena posalje',4),(6,'Kad mi se jede slatko',4),(7,'Osnovno obrazovanje i vaspitanje',8),(8,'Srednje obrazovanje u trajanju od četiri godine',8),(9,'Specijalističke akademske studije',8),(10,'Doktorat nauka',8),(11,'Samo vikendom',1),(12,'Samo reprezentaciju',1),(13,'Pratim sva sportska desavanja',1),(14,'Samo odredjene sportove',1),(15,'Kad umirem od gladi',4),(16,'Ne',5),(17,'Nooooo',5),(18,'Nike',11),(19,'Puma',11),(20,'Adidas',11),(21,'UnderArmor',11),(351,'Zed',144),(352,'Viktor',144),(353,'anivia',144),(354,'karma',144),(355,'teemo',144),(356,'Rabadon',146),(357,'infitini',146),(358,'geleforce',146),(359,'mejai',146),(360,'zhonia',146),(361,'red',147),(362,'blue',147),(363,'mid',148),(364,'jng',148),(365,'top',148),(366,'bot',148),(367,'Kola',150),(368,'Fanta',150),(369,'Kisa',150),(370,'Pivo',150),(371,'Banana',151),(372,'Jabuka',151),(373,'Sljiva',151),(374,'Jagoda',151),(375,'Klementina',151),(376,'Dinja',151),(377,'Ruzica si bila',153),(378,'Sta ima novo',153),(379,'Lepotan',153),(380,'Djurdjevdan',153),(381,'Dzin i limunada',153),(382,'Pilici',153),(383,'Odbojka',155),(384,'Fudbal',155),(385,'Golf',155),(386,'Kosarka',155),(387,'Ragbi',155),(388,'Hokej',155),(389,'Vaterpolo',155),(390,'odg',156),(391,'odg1',156),(392,'odg3',156),(393,'odg4',156),(394,'odg5',157),(395,'odg6',157),(396,'odg7',157),(397,'odg8',157),(398,'odg9',157),(399,'odg10',159),(400,'odg11',159),(401,'odg12',159),(402,'odg13',159),(403,'odg14',160),(404,'odg15',160),(405,'odg16',160);
/*!40000 ALTER TABLE `answers` ENABLE KEYS */;
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
