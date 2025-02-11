-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: survivor
-- ------------------------------------------------------
-- Server version	5.5.5-10.2.11-MariaDB

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
-- Table structure for table `council`
--

DROP TABLE IF EXISTS `council`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `council` (
  `ID_Council` smallint(6) unsigned NOT NULL,
  `Date_Council` date NOT NULL,
  `Color` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`ID_Council`),
  KEY `FK_council_team` (`Color`),
  KEY `Date_Council` (`Date_Council`),
  CONSTRAINT `FK_council_team` FOREIGN KEY (`Color`) REFERENCES `team` (`Color`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `date_con` CHECK (`Date_Council` between '2017-02-13' and '2017-07-05')
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `council`
--

LOCK TABLES `council` WRITE;
/*!40000 ALTER TABLE `council` DISABLE KEYS */;
INSERT INTO `council` VALUES (1,'2017-02-20','Red'),(2,'2017-02-27','Blue'),(3,'2017-03-05','Blue'),(4,'2017-03-12','Blue'),(5,'2017-03-19','Red'),(6,'2017-03-26','Red');
/*!40000 ALTER TABLE `council` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game`
--

DROP TABLE IF EXISTS `game`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `game` (
  `ID_Game` smallint(5) unsigned NOT NULL,
  `Type_Game` varchar(20) NOT NULL,
  `Date_Game` date NOT NULL,
  `Color` varchar(15) DEFAULT NULL,
  `Score` varchar(10) DEFAULT NULL,
  `Player_ID` smallint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`ID_Game`),
  UNIQUE KEY `Type_Game` (`Type_Game`,`Date_Game`),
  KEY `FK_game_team` (`Color`),
  KEY `FK_game_player` (`Player_ID`),
  CONSTRAINT `FK_game_player` FOREIGN KEY (`Player_ID`) REFERENCES `player` (`ID_Player`),
  CONSTRAINT `FK_game_team` FOREIGN KEY (`Color`) REFERENCES `team` (`Color`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `type_con` CHECK (`Type_Game` = 'Personal_Immunity' or `Type_Game` = 'Team_Immunity' or `Type_Game` = 'Communication' or `Type_Game` = 'Reward'),
  CONSTRAINT `date_con` CHECK (`Date_Game` between '2017-02-13' and '2017-07-05')
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game`
--

LOCK TABLES `game` WRITE;
/*!40000 ALTER TABLE `game` DISABLE KEYS */;
INSERT INTO `game` VALUES (1,'reward','2017-02-14','Blue','5-1',NULL),(2,'reward','2017-02-15','Red','1-5',NULL),(4,'team_immunity','2017-02-18','Blue','5-4',NULL),(5,'personal_immunity','2017-02-18','Red',NULL,1),(6,'reward','2017-02-21','Blue','5-4',NULL),(9,'reward','2017-02-25','Red','5-3',NULL),(10,'team_immunity','2017-02-26','Red','5-4',NULL),(11,'personal_immunity','2017-02-26','Blue',NULL,10),(13,'communication','2017-02-28','Blue','5-2',NULL),(14,'reward','2017-03-01','Blue','5-1',NULL),(15,'reward','2017-03-02','Red','5-2',NULL),(16,'team_immunity','2017-03-04','Red','5-3',NULL),(17,'personal_immunity','2017-03-04','Blue',NULL,9),(19,'communication','2017-03-07','Red','5-3',NULL),(20,'reward','2017-03-08','Red','5-2',NULL),(22,'team_immunity','2017-03-11','Red','5-4',NULL),(23,'personal_immunity','2017-03-11','Blue',NULL,6),(24,'reward','2017-03-13','Blue','5-3',NULL),(25,'communication','2017-03-14','Blue','5-3',NULL),(26,'reward','2017-03-14','Blue','5-2',NULL),(29,'reward','2017-03-17','Red','5-4',NULL),(30,'team_immunity','2017-03-17','Blue','5-3',NULL),(31,'personal_immunity','2017-03-17','Red',NULL,3),(32,'reward','2017-03-20','Red','5-3',NULL),(33,'communication','2017-03-21','Red','5-3',NULL),(34,'reward','2017-03-22','Red','5-4',NULL),(37,'team_immunity','2017-03-25','Blue','5-4',NULL),(38,'personal_immunity','2017-03-25','Red',NULL,4);
/*!40000 ALTER TABLE `game` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gives`
--

DROP TABLE IF EXISTS `gives`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gives` (
  `ID_Reward` int(10) unsigned NOT NULL,
  `ID_Game` smallint(5) unsigned NOT NULL,
  `AFM` int(10) unsigned NOT NULL,
  PRIMARY KEY (`AFM`,`ID_Game`,`ID_Reward`),
  KEY `FK_gives_sponsor_idx` (`AFM`),
  KEY `FK_gives_game` (`ID_Game`),
  KEY `FK_gives_reward` (`ID_Reward`),
  CONSTRAINT `FK_gives_game` FOREIGN KEY (`ID_Game`) REFERENCES `game` (`ID_Game`),
  CONSTRAINT `FK_gives_reward` FOREIGN KEY (`ID_Reward`) REFERENCES `reward` (`ID_Reward`),
  CONSTRAINT `FK_gives_reward_2` FOREIGN KEY (`AFM`) REFERENCES `reward` (`AFM`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gives`
--

LOCK TABLES `gives` WRITE;
/*!40000 ALTER TABLE `gives` DISABLE KEYS */;
INSERT INTO `gives` VALUES (1,1,1236665897),(7,14,1236665897),(7,24,1236665897),(7,26,1236665897),(6,34,1478523578),(1,1,1597531478),(7,6,1597531478),(1,14,1597531478),(1,24,1597531478),(1,26,1597531478),(4,13,1678123450),(4,19,1678123450),(4,25,1678123450),(4,33,1678123450),(3,2,2134567855),(3,9,2134567855),(3,15,2134567855),(3,32,2134567855),(5,9,4294967295),(5,20,4294967295),(5,25,4294967295);
/*!40000 ALTER TABLE `gives` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player`
--

DROP TABLE IF EXISTS `player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player` (
  `ID_Player` smallint(5) unsigned NOT NULL,
  `Age` tinyint(2) unsigned DEFAULT NULL,
  `Name` varchar(20) NOT NULL,
  `Surname` varchar(20) NOT NULL,
  `Job` varchar(30) DEFAULT NULL,
  `Vote_out` date DEFAULT NULL,
  `Color` varchar(15) NOT NULL,
  PRIMARY KEY (`ID_Player`),
  UNIQUE KEY `Name` (`Name`,`Surname`),
  KEY `FK_player_team` (`Color`),
  CONSTRAINT `FK_player_team` FOREIGN KEY (`Color`) REFERENCES `team` (`Color`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `age_con` CHECK (`Age` >= 18 and `Age` <= 70),
  CONSTRAINT `date_con` CHECK (`Vote_out` between '2017-02-13' and '2017-07-05')
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player`
--

LOCK TABLES `player` WRITE;
/*!40000 ALTER TABLE `player` DISABLE KEYS */;
INSERT INTO `player` VALUES (1,29,'Evridiki ','Valavani','Athlitikografos','2017-03-27','Red'),(2,39,'Kostas','Kokkinakis','Athlitis Polo','2017-03-20','Red'),(3,30,'Eirini','Papadopoulou','Tragoudistria',NULL,'Red'),(4,40,'Giannis','Spaliaras','Ithopoios',NULL,'Red'),(5,24,'Marianna','Kalergi','Athlitria','2017-02-21','Red'),(6,34,'Giorgos','Aggelopoulos','Sea ski teacher',NULL,'Blue'),(7,35,'Panos','Argianidis','Rugby Manager','2017-03-06','Blue'),(8,23,'Elisavet','Ainatsioglou','Foititria','2017-02-28','Blue'),(9,27,'Orestis','Chang','Metafrastis Kinezikon','2017-03-13','Blue'),(10,30,'Marios','Ioannidis','Diver',NULL,'Blue');
/*!40000 ALTER TABLE `player` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_votes`
--

DROP TABLE IF EXISTS `player_votes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player_votes` (
  `ID_Council` smallint(6) unsigned NOT NULL,
  `ID_Voter` smallint(5) unsigned NOT NULL,
  `ID_Voted` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`ID_Council`,`ID_Voter`),
  KEY `FK_votes_player` (`ID_Voter`),
  KEY `FK_votes_player_2` (`ID_Voted`),
  CONSTRAINT `FK_votes_council` FOREIGN KEY (`ID_Council`) REFERENCES `council` (`ID_Council`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_votes_player` FOREIGN KEY (`ID_Voter`) REFERENCES `player` (`ID_Player`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_votes_player_2` FOREIGN KEY (`ID_Voted`) REFERENCES `player` (`ID_Player`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_votes`
--

LOCK TABLES `player_votes` WRITE;
/*!40000 ALTER TABLE `player_votes` DISABLE KEYS */;
INSERT INTO `player_votes` VALUES (6,3,1),(6,4,1),(5,3,2),(5,4,2),(6,1,3),(1,2,4),(1,5,4),(5,1,4),(5,2,4),(1,1,5),(1,3,5),(1,4,5),(3,8,6),(3,10,6),(2,8,7),(2,10,7),(2,6,8),(2,7,8),(2,9,8),(3,6,8),(3,9,8),(4,6,9),(4,10,9),(4,9,10);
/*!40000 ALTER TABLE `player_votes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plays`
--

DROP TABLE IF EXISTS `plays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plays` (
  `Round_ID` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `ID_Opponent1` smallint(5) unsigned NOT NULL,
  `ID_Game` smallint(5) unsigned NOT NULL,
  `ID_Opponent2` smallint(5) unsigned NOT NULL,
  `ID_Winner` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`Round_ID`,`ID_Game`),
  KEY `FK_plays_player` (`ID_Opponent1`),
  KEY `FK_plays_player_2` (`ID_Opponent2`),
  KEY `FK_plays_game` (`ID_Game`),
  CONSTRAINT `FK_plays_game` FOREIGN KEY (`ID_Game`) REFERENCES `game` (`ID_Game`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_plays_player` FOREIGN KEY (`ID_Opponent1`) REFERENCES `player` (`ID_Player`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_plays_player_2` FOREIGN KEY (`ID_Opponent2`) REFERENCES `player` (`ID_Player`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plays`
--

LOCK TABLES `plays` WRITE;
/*!40000 ALTER TABLE `plays` DISABLE KEYS */;
INSERT INTO `plays` VALUES (1,1,1,8,1),(2,2,1,10,10),(3,2,1,6,6),(4,4,1,6,6),(5,2,1,6,6),(6,5,1,8,8),(7,1,2,8,1),(8,4,2,10,4),(9,2,2,9,2),(10,4,2,6,6),(11,2,2,7,2),(12,3,2,8,3);
/*!40000 ALTER TABLE `plays` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reward`
--

DROP TABLE IF EXISTS `reward`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reward` (
  `ID_Reward` int(10) unsigned NOT NULL,
  `Name_Reward` varchar(30) NOT NULL,
  `Type_Reward` varchar(30) DEFAULT NULL,
  `AFM` int(10) unsigned NOT NULL,
  PRIMARY KEY (`AFM`,`ID_Reward`),
  KEY `ID_Reward` (`ID_Reward`),
  KEY `FK_reward_sponsor` (`AFM`),
  CONSTRAINT `FK_reward_sponsor` FOREIGN KEY (`AFM`) REFERENCES `sponsor` (`AFM`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `type` CHECK (`Type_Reward` in ('Food','Trip','Communication','Entertainment'))
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reward`
--

LOCK TABLES `reward` WRITE;
/*!40000 ALTER TABLE `reward` DISABLE KEYS */;
INSERT INTO `reward` VALUES (7,'Olive','food',1236665897),(6,'Nissan Car','Entertainment',1478523578),(1,'Rice','food',1597531478),(4,'Phone Call','communication',1678123450),(2,'Burger','food',2134567855),(3,'Souvlaki','food',2134567855),(5,'Shower','Entertainment',4294967295);
/*!40000 ALTER TABLE `reward` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sponsor`
--

DROP TABLE IF EXISTS `sponsor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sponsor` (
  `AFM` int(10) unsigned NOT NULL,
  `Brand` varchar(30) DEFAULT NULL,
  `Field` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`AFM`),
  UNIQUE KEY `Brand` (`Brand`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sponsor`
--

LOCK TABLES `sponsor` WRITE;
/*!40000 ALTER TABLE `sponsor` DISABLE KEYS */;
INSERT INTO `sponsor` VALUES (1236665897,'Altis','Food'),(1478523578,'Nissan','Cars'),(1597531478,'Uncle Bens','Food'),(1678123450,'Wind','Telecommunications'),(2134567855,'Prassas','Food'),(4294967295,'Palmolive','Shower Products');
/*!40000 ALTER TABLE `sponsor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team` (
  `Color` varchar(15) NOT NULL,
  `Name` varchar(20) NOT NULL,
  `Badge` varchar(20) NOT NULL,
  `NumberOfPlayers` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`Color`),
  UNIQUE KEY `Name` (`Name`),
  UNIQUE KEY `Badge` (`Badge`),
  CONSTRAINT `CONSTRAINT_1` CHECK (`Color` in ('Red','Blue','White','Green','Purple','Black','Yellow','Orange','Pink','Brown'))
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
INSERT INTO `team` VALUES ('Blue','Warriors','Eagle',5),('Red','Famous','Wolf',5);
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `view1`
--

DROP TABLE IF EXISTS `view1`;
/*!50001 DROP VIEW IF EXISTS `view1`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view1` AS SELECT 
 1 AS `Name`,
 1 AS `badge`,
 1 AS `NumberOfPlayers`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view2`
--

DROP TABLE IF EXISTS `view2`;
/*!50001 DROP VIEW IF EXISTS `view2`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view2` AS SELECT 
 1 AS `Name`,
 1 AS `badge`,
 1 AS `NumberOfPlayers`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view21`
--

DROP TABLE IF EXISTS `view21`;
/*!50001 DROP VIEW IF EXISTS `view21`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view21` AS SELECT 
 1 AS `Name`,
 1 AS `badge`,
 1 AS `NumberOfPlayers`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view22`
--

DROP TABLE IF EXISTS `view22`;
/*!50001 DROP VIEW IF EXISTS `view22`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view22` AS SELECT 
 1 AS `Name`,
 1 AS `badge`,
 1 AS `NumberOfPlayers`,
 1 AS `Date_Council`,
 1 AS `Color`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view3`
--

DROP TABLE IF EXISTS `view3`;
/*!50001 DROP VIEW IF EXISTS `view3`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view3` AS SELECT 
 1 AS `Name`,
 1 AS `badge`,
 1 AS `NumberOfPlayers`,
 1 AS `Date_Council`,
 1 AS `Color`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `viewer`
--

DROP TABLE IF EXISTS `viewer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `viewer` (
  `Phone_Number` int(10) unsigned NOT NULL,
  PRIMARY KEY (`Phone_Number`),
  CONSTRAINT `CONSTRAINT_2` CHECK (`Phone_Number` between 6900000000 and 6999999999 or `Phone_Number` between 2100000000 and 2899999999)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `viewer`
--

LOCK TABLES `viewer` WRITE;
/*!40000 ALTER TABLE `viewer` DISABLE KEYS */;
INSERT INTO `viewer` VALUES (2101236548),(2105489645),(2231058964),(2238058964),(2310569864),(2310598756);
/*!40000 ALTER TABLE `viewer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `viewer_votes`
--

DROP TABLE IF EXISTS `viewer_votes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `viewer_votes` (
  `Phone_Number` int(10) unsigned NOT NULL,
  `ID_Player` smallint(5) unsigned NOT NULL,
  `Time_Vote` time NOT NULL,
  `Date_Vote` date NOT NULL,
  `ID_Vote` int(8) unsigned NOT NULL,
  PRIMARY KEY (`Phone_Number`,`Time_Vote`,`Date_Vote`),
  KEY `FK_viewer_votes_player` (`ID_Player`),
  CONSTRAINT `FK_viewer_votes_player` FOREIGN KEY (`ID_Player`) REFERENCES `player` (`ID_Player`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_viewer_votes_viewer` FOREIGN KEY (`Phone_Number`) REFERENCES `viewer` (`Phone_Number`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `date_con` CHECK (`Date_Vote` between '2017-02-13' and '2017-07-05')
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `viewer_votes`
--

LOCK TABLES `viewer_votes` WRITE;
/*!40000 ALTER TABLE `viewer_votes` DISABLE KEYS */;
INSERT INTO `viewer_votes` VALUES (2101236548,8,'00:04:56','2017-02-27',10),(2101236548,6,'00:10:09','2017-03-05',11),(2101236548,4,'00:12:21','2017-02-20',1),(2101236548,10,'00:23:49','2017-03-12',19),(2105489645,6,'00:11:09','2017-03-05',12),(2105489645,4,'00:15:21','2017-02-20',2),(2231058964,4,'00:06:21','2017-02-20',4),(2231058964,7,'00:14:56','2017-02-27',9),(2231058964,6,'00:23:09','2017-03-05',14),(2231058964,10,'00:23:49','2017-03-12',20),(2238058964,5,'00:16:21','2017-02-20',3),(2238058964,6,'00:33:09','2017-03-05',13),(2238058964,7,'00:34:56','2017-02-27',8),(2238058964,10,'00:53:49','2017-03-12',21),(2310569864,4,'00:06:21','2017-02-20',5),(2310569864,6,'00:43:09','2017-03-05',15),(2310569864,10,'00:53:09','2017-03-12',17),(2310598756,4,'00:01:21','2017-02-20',6),(2310598756,9,'00:13:49','2017-03-12',18),(2310598756,7,'00:54:56','2017-02-27',7);
/*!40000 ALTER TABLE `viewer_votes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `view1`
--

/*!50001 DROP VIEW IF EXISTS `view1`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view1` AS select `t`.`Name` AS `Name`,`t`.`Badge` AS `badge`,`t`.`NumberOfPlayers` AS `NumberOfPlayers` from (`team` `t` join `council` `c`) where `c`.`Color` = `t`.`Color` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view2`
--

/*!50001 DROP VIEW IF EXISTS `view2`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view2` AS select `t`.`Name` AS `Name`,`t`.`Badge` AS `badge`,`t`.`NumberOfPlayers` AS `NumberOfPlayers` from (`team` `t` join `council` `c`) where `c`.`Color` = `t`.`Color` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view21`
--

/*!50001 DROP VIEW IF EXISTS `view21`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view21` AS select `t`.`Name` AS `Name`,`t`.`Badge` AS `badge`,`t`.`NumberOfPlayers` AS `NumberOfPlayers` from (`team` `t` join `council` `c`) where `c`.`Color` = `t`.`Color` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view22`
--

/*!50001 DROP VIEW IF EXISTS `view22`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view22` AS select `t`.`Name` AS `Name`,`t`.`Badge` AS `badge`,`t`.`NumberOfPlayers` AS `NumberOfPlayers`,`c`.`Date_Council` AS `Date_Council`,`c`.`Color` AS `Color` from (`team` `t` join `council` `c`) where `c`.`Color` = `t`.`Color` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view3`
--

/*!50001 DROP VIEW IF EXISTS `view3`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view3` AS select `t`.`Name` AS `Name`,`t`.`Badge` AS `badge`,`t`.`NumberOfPlayers` AS `NumberOfPlayers`,`c`.`Date_Council` AS `Date_Council`,`c`.`Color` AS `Color` from (`team` `t` join `council` `c`) where `c`.`Color` = `t`.`Color` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-02-16 15:01:15
