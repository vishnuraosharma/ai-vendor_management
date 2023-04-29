CREATE DATABASE  IF NOT EXISTS `ai_vendor_management` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `ai_vendor_management`;
-- MySQL dump 10.13  Distrib 8.0.31, for macos12 (x86_64)
--
-- Host: localhost    Database: ai_vendor_management
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Temporary view structure for view `averageprojectcostreport`
--

DROP TABLE IF EXISTS `averageprojectcostreport`;
/*!50001 DROP VIEW IF EXISTS `averageprojectcostreport`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `averageprojectcostreport` AS SELECT 
 1 AS `DepartmentName`,
 1 AS `AvgCostPerProject`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Contract`
--

DROP TABLE IF EXISTS `Contract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Contract` (
  `idContract` int NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `vendor_id` int NOT NULL,
  `network_id` int NOT NULL,
  PRIMARY KEY (`idContract`,`vendor_id`,`network_id`),
  KEY `fk_Contract_Vendor1_idx` (`vendor_id`),
  KEY `fk_Contract_Network1_idx` (`network_id`),
  CONSTRAINT `fk_Contract_Network1` FOREIGN KEY (`network_id`) REFERENCES `Network` (`network_id`),
  CONSTRAINT `fk_Contract_Vendor1` FOREIGN KEY (`vendor_id`) REFERENCES `Vendor` (`vendor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Contract`
--

LOCK TABLES `Contract` WRITE;
/*!40000 ALTER TABLE `Contract` DISABLE KEYS */;
INSERT INTO `Contract` VALUES (1,'2022-09-20','2023-12-02',9,2),(2,'2022-06-22','2024-05-10',7,3),(3,'2022-08-14','2025-01-20',4,2),(4,'2023-02-08','2022-08-18',4,3),(5,'2022-06-08','2023-04-19',6,5),(6,'2022-05-07','2024-03-23',4,4),(7,'2022-12-17','2023-04-10',6,1),(8,'2022-07-03','2024-02-10',8,5),(9,'2022-10-03','2022-10-16',7,2),(10,'2023-02-16','2024-07-15',9,4),(11,'2022-05-05','2022-12-30',7,4),(12,'2022-12-07','2022-05-26',10,5),(13,'2022-08-04','2024-08-16',3,5),(14,'2023-02-08','2024-01-29',1,3),(15,'2022-06-15','2023-05-14',3,4),(16,'2022-05-29','2022-08-20',8,4),(17,'2022-05-17','2024-05-21',9,3),(18,'2022-12-02','2022-07-06',10,2),(19,'2022-07-06','2023-08-23',3,2),(21,'2022-07-23','2022-12-01',2,2),(23,'2022-09-14','2023-10-11',3,4),(24,'2022-06-07','2025-12-29',5,3),(25,'2022-10-19','2024-06-24',4,1),(26,'2022-12-22','2024-06-29',7,5),(27,'2022-12-18','2025-02-21',2,5),(28,'2022-10-16','2022-08-19',3,4),(29,'2022-05-29','2022-07-03',8,1),(31,'2022-07-03','2023-03-20',5,4),(32,'2022-09-09','2022-07-29',3,2),(34,'2022-05-25','2022-05-18',9,5),(35,'2022-05-01','2023-08-22',3,1);
/*!40000 ALTER TABLE `Contract` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Department`
--

DROP TABLE IF EXISTS `Department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Department` (
  `dept_id` int NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(45) NOT NULL,
  `network_id` int NOT NULL,
  PRIMARY KEY (`dept_id`),
  KEY `fk_Department_Network1_idx` (`network_id`),
  CONSTRAINT `network_fk` FOREIGN KEY (`network_id`) REFERENCES `Network` (`network_id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Department`
--

LOCK TABLES `Department` WRITE;
/*!40000 ALTER TABLE `Department` DISABLE KEYS */;
INSERT INTO `Department` VALUES (1,'Finance',1),(2,'Marketing',1),(4,'IT',1),(5,'Sales',1),(6,'Customer Service',1),(21,'IT',2),(22,'Sales',2),(24,'Legal',2),(25,'Sales',3),(26,'Finance',4),(27,'Marketing',4),(29,'IT',4),(32,'Legal',4),(34,'Marketing',5),(36,'Customer Service',5),(38,'Research and Development',5),(39,'Operations',5);
/*!40000 ALTER TABLE `Department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DepartmentBudget`
--

DROP TABLE IF EXISTS `DepartmentBudget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DepartmentBudget` (
  `budget_id` int NOT NULL AUTO_INCREMENT,
  `first_day_of_qtr` date NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `qtr_num` tinyint NOT NULL,
  `fk_dept_id` int NOT NULL,
  PRIMARY KEY (`budget_id`,`fk_dept_id`),
  UNIQUE KEY `budget_id_UNIQUE` (`budget_id`),
  KEY `fk_dept_idx` (`fk_dept_id`),
  CONSTRAINT `fk_dept` FOREIGN KEY (`fk_dept_id`) REFERENCES `Department` (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DepartmentBudget`
--

LOCK TABLES `DepartmentBudget` WRITE;
/*!40000 ALTER TABLE `DepartmentBudget` DISABLE KEYS */;
INSERT INTO `DepartmentBudget` VALUES (1,'2023-01-01',1050.00,1,1),(2,'2023-01-01',900.00,1,2),(3,'2023-01-01',345.00,1,4),(4,'2023-01-01',4535.00,1,5),(5,'2023-01-01',100.00,1,6),(6,'2023-01-01',1050.00,1,21),(7,'2023-01-01',1300.00,1,22),(8,'2023-01-01',1750.00,1,24),(9,'2023-01-01',2560.00,1,25),(10,'2023-01-01',1300.00,1,26),(11,'2023-01-01',1265.00,1,27),(12,'2023-01-01',1080.00,1,29),(13,'2023-01-01',1050.00,1,32),(14,'2023-01-01',3000.00,1,34),(15,'2023-01-01',2000.00,1,36),(16,'2023-01-01',1050.00,1,38),(17,'2023-01-01',1050.00,1,39);
/*!40000 ALTER TABLE `DepartmentBudget` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `DeptBudgetChange` AFTER UPDATE ON `departmentbudget` FOR EACH ROW BEGIN
    INSERT INTO DeptBudgetLog (budget_id, first_day_of_qtr, amount, qtr_num, fk_dept_id, updated_at, new_amount)
    VALUES (OLD.budget_id, OLD.first_day_of_qtr, OLD.amount, OLD.qtr_num, OLD.fk_dept_id, NOW(), NEW.amount);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `DeptBudgetLog`
--

DROP TABLE IF EXISTS `DeptBudgetLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DeptBudgetLog` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `budget_id` int NOT NULL,
  `first_day_of_qtr` date NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `qtr_num` int NOT NULL,
  `fk_dept_id` int NOT NULL,
  `updated_at` datetime NOT NULL,
  `new_amount` decimal(10,2) NOT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DeptBudgetLog`
--

LOCK TABLES `DeptBudgetLog` WRITE;
/*!40000 ALTER TABLE `DeptBudgetLog` DISABLE KEYS */;
/*!40000 ALTER TABLE `DeptBudgetLog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `discountoutreach`
--

DROP TABLE IF EXISTS `discountoutreach`;
/*!50001 DROP VIEW IF EXISTS `discountoutreach`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `discountoutreach` AS SELECT 
 1 AS `vendor_id`,
 1 AS `VendorName`,
 1 AS `email`,
 1 AS `phone_number`,
 1 AS `price`,
 1 AS `ServiceName`,
 1 AS `count(*)`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Employee`
--

DROP TABLE IF EXISTS `Employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Employee` (
  `emp_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `fk_team_id` int NOT NULL,
  PRIMARY KEY (`emp_id`),
  KEY `fk_Employee_Team1_idx` (`fk_team_id`),
  CONSTRAINT `fk_Employee_Team1` FOREIGN KEY (`fk_team_id`) REFERENCES `Team` (`team_id`)
) ENGINE=InnoDB AUTO_INCREMENT=251 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employee`
--

LOCK TABLES `Employee` WRITE;
/*!40000 ALTER TABLE `Employee` DISABLE KEYS */;
INSERT INTO `Employee` VALUES (1,'Noah Jefferson','morbi@icloud.com',5),(2,'Amery Blanchard','congue.a@google.com',15),(3,'Ivor Davidson','auctor.nunc@aol.couk',7),(4,'Veronica Roy','aliquam.erat.volutpat@yahoo.org',24),(5,'Mira Palmer','lacus.quisque@protonmail.edu',16),(6,'Alana Davis','elit.dictum.eu@aol.com',12),(7,'Matthew Copeland','amet@outlook.org',25),(8,'David Macdonald','interdum.ligula@protonmail.net',22),(9,'Kirsten Rosales','libero.mauris@outlook.com',17),(10,'Amal Moody','auctor.velit@google.edu',6),(11,'Paloma Grant','ac@hotmail.couk',5),(12,'Garrett Barnes','mattis.ornare.lectus@hotmail.ca',25),(13,'Angela Rosario','diam.nunc.ullamcorper@yahoo.edu',9),(14,'Channing Ferguson','bibendum.sed.est@icloud.com',15),(15,'Lillian Snider','fringilla.est@hotmail.couk',24),(16,'Amethyst Hawkins','nulla.interdum@icloud.com',13),(17,'Herrod Hayes','iaculis.aliquet@icloud.org',4),(18,'Tanner Henderson','penatibus@yahoo.ca',14),(19,'Lars Atkinson','magnis.dis@yahoo.edu',27),(20,'Britanni Monroe','non@yahoo.ca',10),(21,'Zachary Buckley','nunc.ullamcorper.eu@yahoo.ca',8),(22,'Macy Sykes','vestibulum.ante@hotmail.net',13),(23,'Morgan Bishop','tincidunt.aliquam@aol.org',4),(24,'Mason Ortiz','eu.dui.cum@hotmail.couk',2),(25,'Carson Brooks','lectus@icloud.ca',20),(26,'Claire Tanner','id.blandit@protonmail.edu',23),(27,'Deacon Harrell','nullam.ut.nisi@aol.ca',15),(28,'Shafira Hodges','pede.suspendisse@aol.edu',9),(29,'Madison Miranda','sociis.natoque.penatibus@outlook.com',27),(30,'Adrian Sheppard','sapien.gravida.non@google.couk',9),(31,'Burke Vaughn','dictum.eleifend@outlook.com',16),(32,'Trevor Buckner','a.odio@icloud.ca',26),(33,'Octavius Meadows','ut.lacus@outlook.org',15),(34,'Bruce Rivera','morbi.quis.urna@outlook.edu',15),(35,'Karina Underwood','vestibulum.nec@outlook.net',2),(36,'Jakeem Armstrong','ipsum.suspendisse@aol.net',26),(37,'Lysandra Shepherd','lobortis.quam@hotmail.net',27),(38,'Xanthus Chambers','facilisis@protonmail.edu',24),(39,'Breanna Cortez','mauris@outlook.edu',5),(40,'Joelle Christensen','adipiscing.lacus.ut@icloud.couk',25),(41,'Claire Atkinson','ultricies.dignissim@google.org',20),(42,'Aline Dunlap','lorem.eu@yahoo.edu',9),(43,'Colton Casey','tellus.eu.augue@outlook.couk',11),(44,'Signe Campbell','amet.risus@aol.org',28),(45,'Summer Kerr','montes.nascetur@aol.org',2),(46,'Fleur Holcomb','pellentesque.tincidunt.tempus@icloud.ca',6),(47,'Jeanette Gutierrez','vitae.posuere@outlook.ca',3),(48,'Felicia Hendricks','dui.semper@google.org',17),(49,'Aristotle Green','donec.sollicitudin@protonmail.edu',26),(50,'Jared Short','laoreet.libero@google.edu',5),(51,'Cody Kent','ornare.in@icloud.couk',14),(52,'Suki Hester','eget.magna@google.ca',14),(53,'Joseph Abbott','vehicula@google.ca',16),(54,'Hunter Nunez','pede.suspendisse@google.com',17),(55,'Amos Herman','massa.rutrum.magna@google.com',9),(56,'Imani Burton','sapien.cursus@google.com',12),(57,'Ina Trevino','fusce.aliquet@outlook.org',4),(58,'Faith Chang','eu.nibh@aol.com',5),(59,'Fulton Petersen','mauris.aliquam@protonmail.com',2),(60,'Yasir Powers','phasellus.elit@google.net',3),(61,'Preston Ferrell','at.nisi@google.net',15),(62,'Daryl Cohen','adipiscing.mauris@yahoo.org',22),(63,'Velma Bruce','pellentesque.tellus@icloud.com',10),(64,'Octavius Moreno','in@icloud.net',8),(65,'Martina Velasquez','ultrices.iaculis@protonmail.com',15),(66,'Isaiah Mckinney','fusce.dolor@outlook.net',9),(67,'Pamela Mcintosh','enim.consequat@icloud.couk',4),(68,'Quamar Phillips','quis.turpis.vitae@yahoo.edu',4),(69,'Lyle Cain','id.risus@yahoo.ca',2),(70,'Cassidy Bryant','eget@aol.couk',18),(71,'Cleo Pugh','ad@yahoo.com',27),(72,'Darryl Lee','justo.eu.arcu@google.com',17),(73,'Remedios Pickett','dapibus.quam.quis@hotmail.com',26),(74,'Alec Lee','maecenas.malesuada@aol.org',23),(75,'Macaulay Garrison','etiam@icloud.com',13),(76,'Gabriel Blackburn','dolor.donec.fringilla@hotmail.ca',8),(77,'Troy Brennan','augue.eu.tellus@outlook.com',17),(78,'Rebecca Pate','at.augue.id@hotmail.edu',20),(79,'Colorado Herman','aliquam.fringilla@google.edu',10),(80,'Rahim Estes','magna.suspendisse@protonmail.ca',22),(81,'Montana Molina','iaculis@outlook.ca',8),(82,'Tana Hall','eu@aol.ca',20),(83,'Hakeem Yang','vulputate.dui.nec@hotmail.net',12),(84,'Amber Irwin','ultricies.adipiscing@outlook.edu',3),(85,'Ashely Gross','pellentesque.massa.lobortis@outlook.couk',22),(86,'Wynne Orr','sem@icloud.edu',10),(87,'Salvador Lyons','ligula.tortor@yahoo.couk',11),(88,'Alice O\'Neill','risus.in.mi@outlook.couk',15),(89,'Madaline Snow','ante.vivamus@icloud.couk',23),(90,'Ralph Roy','faucibus.orci.luctus@yahoo.com',16),(91,'Christopher Booker','mus.donec@protonmail.com',8),(92,'Richard Serrano','mattis.ornare@protonmail.ca',22),(93,'Darrel Blair','parturient.montes@icloud.net',13),(94,'Wallace Pittman','massa.suspendisse.eleifend@protonmail.com',27),(95,'Sara Watkins','ornare.facilisis@aol.couk',21),(96,'Walker Bright','nunc.commodo@google.ca',7),(97,'Adrienne Whitfield','accumsan.laoreet.ipsum@aol.ca',22),(98,'Mallory Mclaughlin','semper.erat@google.com',8),(99,'Lisandra Wiggins','tincidunt.adipiscing@google.com',27),(100,'Roth Kent','morbi.vehicula@hotmail.com',4),(101,'Brennan Wells','eu.neque@aol.couk',8),(102,'Devin Sharp','nonummy@hotmail.ca',15),(103,'Valentine Chaney','non@hotmail.net',23),(104,'Cally Dodson','mauris.blandit@icloud.com',5),(105,'May Sanford','amet.consectetuer.adipiscing@icloud.ca',8),(106,'Baxter Dejesus','ante.dictum@protonmail.ca',13),(107,'Sacha Knapp','nam.ligula.elit@google.ca',17),(108,'Igor Conley','eu@google.org',1),(109,'Anthony Newton','dolor@hotmail.couk',4),(110,'Dalton Roth','praesent.luctus.curabitur@yahoo.org',20),(111,'Xantha Watson','dignissim@aol.ca',23),(112,'Akeem Noel','quis.pede@protonmail.net',10),(113,'Clio Cummings','torquent.per@google.couk',27),(114,'Hunter West','montes@hotmail.couk',24),(115,'Kennan Strong','erat.neque@yahoo.com',22),(116,'Eric Graham','lacus.cras@aol.org',1),(117,'Carl Reeves','dui@outlook.edu',4),(118,'Carol Beach','dapibus.id@yahoo.net',27),(119,'Henry Wilkinson','turpis@outlook.edu',9),(120,'Jamal Berger','donec.tempus@google.com',23),(121,'Zachery Williams','vel.lectus@protonmail.ca',22),(122,'Walker Cantrell','in.felis.nulla@aol.net',14),(123,'Samson Stewart','pede.nonummy@aol.edu',14),(124,'Leslie Emerson','nulla@google.org',3),(125,'Dustin Hogan','nulla.magna@aol.com',16),(126,'Barrett Rutledge','eu@hotmail.ca',4),(127,'Rhoda Powers','eu@yahoo.net',28),(128,'Claire Levine','nec@aol.ca',3),(129,'Lana Sears','dui.lectus@protonmail.edu',9),(130,'Simon Adams','felis.orci@hotmail.com',16),(131,'Jasper Meadows','iaculis.quis.pede@outlook.com',12),(132,'Kenyon Moses','ut.eros@yahoo.com',18),(133,'Upton Tanner','gravida@icloud.net',28),(134,'Hillary Montoya','aliquam.ornare.libero@aol.ca',18),(135,'Maggie Mcmahon','imperdiet.ornare@google.couk',19),(136,'Solomon Woodward','ullamcorper.nisl.arcu@google.net',10),(137,'Thor Mullen','ac.nulla@protonmail.couk',15),(138,'Wyatt Berg','diam.at.pretium@protonmail.ca',6),(139,'Ivan Carney','blandit@protonmail.net',3),(140,'Jocelyn Albert','magna@yahoo.couk',14),(141,'Branden Moody','laoreet@yahoo.net',27),(142,'Leroy Wilder','gravida.praesent@google.org',3),(143,'Marvin Lloyd','dictum@hotmail.com',25),(144,'Ruth Mcleod','phasellus.fermentum@aol.ca',24),(145,'Ivor Johnson','hendrerit@outlook.org',7),(146,'Yuri Petersen','tellus@outlook.net',5),(147,'Wylie Fisher','nullam.vitae.diam@protonmail.com',14),(148,'Halee Williamson','enim@protonmail.org',15),(149,'Dawn Guy','aliquam.vulputate@icloud.couk',27),(150,'Devin Thornton','scelerisque@aol.edu',24),(151,'Kylynn Butler','ullamcorper.viverra.maecenas@yahoo.net',3),(152,'Branden Burns','est@hotmail.couk',14),(153,'Dane Morin','praesent.interdum.ligula@yahoo.com',20),(154,'Amal Stewart','dolor.donec.fringilla@google.edu',21),(155,'Priscilla Clemons','a.enim.suspendisse@aol.net',2),(156,'Raja Pugh','scelerisque.mollis@hotmail.ca',2),(157,'Barclay Glenn','orci.sem@yahoo.net',20),(158,'Maia Acosta','sed.turpis@icloud.com',2),(159,'Sybil Waters','a@icloud.edu',24),(160,'Colin Carroll','facilisis.facilisis@hotmail.net',26),(161,'Zephr Goff','ornare.tortor@hotmail.org',6),(162,'Myra Harrison','tristique.aliquet@aol.edu',28),(163,'Flavia Casey','ac.facilisis@outlook.edu',28),(164,'Katelyn Howard','risus@protonmail.edu',20),(165,'Plato Murray','viverra.maecenas@outlook.couk',23),(166,'Mufutau Potts','sagittis@google.com',19),(167,'Paul Mann','vestibulum@hotmail.com',5),(168,'Joelle Reeves','non.lobortis@icloud.net',18),(169,'Cole Key','aliquam.tincidunt.nunc@icloud.net',15),(170,'Iliana Skinner','egestas@aol.org',20),(171,'Keiko Stokes','felis.purus.ac@google.couk',6),(172,'Zeph Suarez','dictum.magna@yahoo.edu',9),(173,'Sylvester Jensen','pede.cras@yahoo.net',25),(174,'Kathleen Lowery','fusce.aliquet.magna@icloud.ca',2),(175,'Sharon Delaney','eu@protonmail.net',14),(176,'Lacey Chapman','vivamus.non@outlook.org',5),(177,'Risa Mcfarland','nulla.interdum.curabitur@icloud.ca',11),(178,'Herrod Langley','quisque.nonummy@yahoo.net',4),(179,'Kelsie Pace','ac.turpis.egestas@google.edu',21),(180,'Shannon Norris','convallis@yahoo.org',15),(181,'Vladimir Maldonado','purus.ac.tellus@hotmail.couk',16),(182,'Jenna Maxwell','nam.ligula@google.ca',26),(183,'Trevor Mayer','quam.curabitur@icloud.net',15),(184,'Phelan Levy','lacinia.vitae.sodales@google.ca',21),(185,'Carter Blankenship','et@google.edu',18),(186,'Plato Guerrero','sed@hotmail.edu',7),(187,'Fritz Frank','aliquet@yahoo.org',5),(188,'Michael Charles','donec.egestas@hotmail.org',25),(189,'Jessamine Blake','orci.sem@outlook.net',5),(190,'Hermione Mcconnell','dictum.eu@yahoo.couk',8),(191,'Ruth Emerson','nulla@yahoo.ca',13),(192,'Hayes Cain','sed@google.org',24),(193,'Carly Fisher','sed.orci@hotmail.couk',16),(194,'Oscar Rose','auctor@hotmail.couk',11),(195,'Ashely Dejesus','ornare.egestas.ligula@outlook.ca',5),(196,'Gil Rodriquez','nostra.per.inceptos@google.org',20),(197,'Imelda Russell','vel.arcu.eu@icloud.edu',27),(198,'Henry Valdez','proin.vel@google.edu',23),(199,'Rudyard Pittman','ipsum.ac.mi@hotmail.net',20),(200,'Destiny Sampson','eu.nibh@aol.org',26),(201,'Irene Lancaster','proin.non.massa@yahoo.couk',5),(202,'Vivian Mcmahon','nisi@icloud.edu',4),(203,'Hoyt Carpenter','eget.venenatis@outlook.org',13),(204,'Nissim Moon','arcu.iaculis.enim@yahoo.edu',3),(205,'Kylynn Lowery','a.aliquet.vel@aol.edu',1),(206,'Geraldine Frost','tortor@aol.com',24),(207,'Harper Baxter','neque.vitae@yahoo.net',2),(208,'Akeem Jimenez','libero.morbi.accumsan@aol.com',22),(209,'Ivor Nolan','ac@icloud.org',26),(210,'Jane Warner','luctus.felis@outlook.com',16),(211,'Aimee Foster','donec.non@aol.edu',3),(212,'Maxwell Sawyer','turpis.nec@icloud.org',7),(213,'Ivor Young','suspendisse.sed@icloud.org',21),(214,'Rana Hyde','lorem@google.ca',17),(215,'Austin Sims','risus.donec@aol.org',14),(216,'Dexter Drake','nisi.dictum@hotmail.org',3),(217,'Hollee Fisher','magna.nec.quam@protonmail.com',24),(218,'Nyssa Haney','hendrerit@google.net',14),(219,'Scott Russo','nullam.feugiat@yahoo.edu',4),(220,'Tanisha Sutton','velit.aliquam@yahoo.com',9),(221,'Yoshio Gray','at@yahoo.org',4),(222,'Cecilia Griffin','vel.faucibus@google.com',11),(223,'Jessica Talley','eu.tempor@protonmail.edu',25),(224,'Joshua Barton','magnis@outlook.net',25),(225,'Alea Cline','aliquet.vel@outlook.org',8),(226,'Imelda Mclean','sem.magna@protonmail.edu',1),(227,'Holmes Mccormick','purus.duis.elementum@outlook.com',23),(228,'Salvador Madden','magna.malesuada@google.com',13),(229,'Buffy Salas','id.libero.donec@aol.ca',25),(230,'Devin Gaines','malesuada@yahoo.couk',19),(231,'Stuart Petersen','diam.eu.dolor@yahoo.ca',6),(232,'Zeph Good','fermentum@yahoo.couk',10),(233,'Noelani Wise','orci.phasellus@hotmail.org',12),(234,'Lionel Gilliam','quis.lectus@yahoo.edu',3),(235,'Macy Langley','est.congue.a@outlook.net',9),(236,'Giacomo Gilbert','accumsan.convallis@hotmail.org',21),(237,'Maia Daniel','venenatis.lacus@outlook.ca',21),(238,'Montana Cabrera','nec.euismod.in@hotmail.com',12),(239,'Indira Beach','velit.eu.sem@google.net',25),(240,'Jakeem Jenkins','massa@yahoo.com',4),(241,'Timon Roy','nullam@aol.org',12),(242,'Adrian Gonzalez','elit.pellentesque@yahoo.org',27),(243,'Imogene Short','sed.turpis@google.com',17),(244,'Rogan Heath','eget@icloud.com',6),(245,'Callum Yates','ridiculus@protonmail.couk',16),(246,'Olga Huffman','mi@hotmail.net',2),(247,'Fleur Cabrera','turpis.egestas@outlook.com',2),(248,'Ahmed Gallegos','ipsum.ac@hotmail.edu',2),(249,'Kareem Shepard','aliquet@aol.net',9),(250,'Brenna Blankenship','egestas.fusce@hotmail.org',11);
/*!40000 ALTER TABLE `Employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Network`
--

DROP TABLE IF EXISTS `Network`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Network` (
  `network_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`network_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Network`
--

LOCK TABLES `Network` WRITE;
/*!40000 ALTER TABLE `Network` DISABLE KEYS */;
INSERT INTO `Network` VALUES (1,'Boston','Our Northeast Location'),(2,'Los Angeles','Our West Coast Location'),(3,'Miami','Our Southern Location'),(4,'Chicago','Our Midwest Location'),(5,'New York','Our East Coast Location');
/*!40000 ALTER TABLE `Network` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `overallexpensereport`
--

DROP TABLE IF EXISTS `overallexpensereport`;
/*!50001 DROP VIEW IF EXISTS `overallexpensereport`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `overallexpensereport` AS SELECT 
 1 AS `NetworkID`,
 1 AS `NetworkName`,
 1 AS `DepartmentName`,
 1 AS `DepartmentBudget`,
 1 AS `DepartmentExpense`,
 1 AS `PercentofBudgetUsed`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Project`
--

DROP TABLE IF EXISTS `Project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Project` (
  `project_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  PRIMARY KEY (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Project`
--

LOCK TABLES `Project` WRITE;
/*!40000 ALTER TABLE `Project` DISABLE KEYS */;
INSERT INTO `Project` VALUES (1,'aliquet molestie','molestie orci tincidunt','2023-01-05','2023-03-04'),(2,'Ut semper','enim. Suspendisse aliquet,','2023-01-02','2023-03-20'),(3,'Curabitur dictum.','egestas ligula. Nullam','2023-01-27','2023-03-02'),(4,'pede. Nunc','ornare, lectus ante','2023-01-12','2023-03-14'),(5,'mus. Donec','ornare sagittis felis.','2023-01-07','2023-03-04'),(6,'convallis erat,','mollis vitae, posuere','2023-01-27','2023-03-30'),(7,'nisi. Aenean','Curabitur dictum. Phasellus','2023-01-18','2023-03-28'),(8,'sem elit,','metus. Aenean sed','2023-01-29','2023-03-08'),(9,'Fusce aliquet','eget, dictum placerat,','2023-01-05','2023-03-03'),(10,'tortor. Nunc','consequat enim diam','2023-01-08','2023-03-24'),(11,'convallis convallis','a, aliquet vel,','2023-01-21','2023-03-24'),(12,'vitae, sodales','ut mi. Duis','2023-01-06','2023-03-18'),(13,'magnis dis','lobortis, nisi nibh','2023-01-01','2023-03-15'),(14,'mauris a','nisi. Aenean eget','2023-01-05','2023-03-13'),(15,'at, velit.','elit, dictum eu,','2023-01-30','2023-03-06'),(16,'lectus quis','ipsum leo elementum','2023-01-11','2023-03-04'),(17,'vitae dolor.','libero est, congue','2023-01-17','2023-03-18'),(18,'vel turpis.','fringilla cursus purus.','2023-01-26','2023-03-08'),(19,'odio semper','nec, diam. Duis','2023-01-22','2023-03-25'),(20,'dolor dolor,','Donec felis orci,','2023-01-16','2023-03-11'),(21,'mauris. Integer','erat, eget tincidunt','2023-01-23','2023-03-28'),(22,'ornare egestas','felis purus ac','2023-01-04','2023-03-16'),(23,'eu eros.','odio. Etiam ligula','2023-01-28','2023-03-07'),(24,'dictum mi,','Pellentesque ultricies dignissim','2023-01-28','2023-03-02'),(25,'eleifend nec,','vulputate, nisi sem','2023-01-13','2023-03-21'),(26,'sociis natoque','Donec vitae erat','2023-01-07','2023-03-02'),(27,'molestie tellus.','aliquam adipiscing lacus.','2023-01-07','2023-03-25'),(28,'justo eu','tempor diam dictum','2023-01-27','2023-03-20'),(29,'nisl. Nulla','sagittis augue, eu','2023-01-19','2023-03-13'),(30,'ultrices. Duis','hendrerit neque. In','2023-01-11','2023-03-23'),(31,'Aenean massa.','quis, pede. Suspendisse','2023-01-06','2023-03-11'),(32,'Phasellus fermentum','est ac mattis','2023-01-07','2023-03-09'),(33,'enim diam','Quisque tincidunt pede','2023-01-14','2023-03-11'),(34,'Nulla tempor','blandit at, nisi.','2023-01-31','2023-03-06'),(35,'sem elit,','Integer aliquam adipiscing','2023-01-09','2023-03-06'),(36,'Vestibulum ut','lacus. Aliquam rutrum','2023-01-13','2023-03-21'),(37,'a odio','tincidunt aliquam arcu.','2023-01-14','2023-03-17'),(38,'rhoncus. Proin','dolor sit amet,','2023-01-29','2023-03-24'),(39,'nunc ac','Donec at arcu.','2023-01-09','2023-03-18'),(40,'mattis. Cras','vestibulum massa rutrum','2023-01-13','2023-03-14'),(41,'aptent taciti','nec mauris blandit','2023-01-06','2023-03-15'),(42,'eu tellus.','mauris sagittis placerat.','2023-01-28','2023-03-22'),(43,'consectetuer mauris','magna. Cras convallis','2023-01-04','2023-03-30'),(44,'in felis.','egestas lacinia. Sed','2023-01-25','2023-03-24'),(45,'sit amet,','arcu. Aliquam ultrices','2023-01-24','2023-03-15'),(46,'Quisque purus','quis massa. Mauris','2023-01-20','2023-03-14'),(47,'at auctor','neque. Nullam ut','2023-01-29','2023-03-20'),(48,'sit amet','suscipit, est ac','2023-01-19','2023-03-03'),(49,'est, congue','dapibus id, blandit','2023-01-09','2023-03-19'),(50,'magna. Praesent','Sed diam lorem,','2023-01-05','2023-03-11'),(51,'pretium et,','neque sed sem','2023-01-23','2023-03-12'),(52,'augue, eu','non justo. Proin','2023-01-02','2023-03-18'),(53,'tortor nibh','urna, nec luctus','2023-01-05','2023-03-29'),(54,'egestas, urna','natoque penatibus et','2023-01-05','2023-03-25'),(55,'et pede.','blandit at, nisi.','2023-01-26','2023-03-07'),(56,'tempus non,','est, mollis non,','2023-01-29','2023-03-09'),(57,'nunc est,','pharetra. Quisque ac','2023-01-28','2023-03-16'),(58,'et, eros.','egestas nunc sed','2023-01-07','2023-03-04'),(59,'aliquam iaculis,','Aliquam erat volutpat.','2023-01-03','2023-03-26'),(60,'non, egestas','faucibus. Morbi vehicula.','2023-01-09','2023-03-27'),(61,'Sed et','varius. Nam porttitor','2023-01-07','2023-03-07'),(62,'tristique senectus','sem eget massa.','2023-01-24','2023-03-05'),(63,'ac mattis','pellentesque a, facilisis','2023-01-10','2023-03-06'),(64,'Nam porttitor','feugiat nec, diam.','2023-01-19','2023-03-09'),(65,'aliquet vel,','magna. Praesent interdum','2023-01-04','2023-03-21'),(66,'consequat dolor','ante dictum cursus.','2023-01-15','2023-03-21'),(67,'non arcu.','sit amet, dapibus','2023-01-25','2023-03-29'),(68,'risus. Donec','facilisi. Sed neque.','2023-01-11','2023-03-22'),(69,'est. Mauris','et ipsum cursus','2023-01-09','2023-03-07'),(70,'Donec dignissim','Aenean massa. Integer','2023-01-23','2023-03-07'),(71,'egestas ligula.','id ante dictum','2023-01-25','2023-03-24'),(72,'sem magna','et, rutrum non,','2023-01-20','2023-03-26'),(73,'sem, vitae','nec, imperdiet nec,','2023-01-03','2023-03-26'),(74,'egestas. Duis','lorem vitae odio','2023-01-26','2023-03-21'),(75,'tellus. Aenean','vestibulum nec, euismod','2023-01-06','2023-03-30'),(76,'Ut semper','Nullam feugiat placerat','2023-01-21','2023-03-10'),(77,'diam dictum','Aliquam adipiscing lobortis','2023-01-13','2023-03-23'),(78,'orci lobortis','dictum ultricies ligula.','2023-01-11','2023-03-13'),(79,'enim, gravida','egestas, urna justo','2023-01-09','2023-03-10'),(80,'Quisque porttitor','luctus et ultrices','2023-01-13','2023-03-23'),(81,'placerat eget,','tristique neque venenatis','2023-01-19','2023-03-23'),(82,'sit amet','commodo tincidunt nibh.','2023-01-14','2023-03-20'),(83,'non enim','eget magna. Suspendisse','2023-01-28','2023-03-22'),(84,'ultrices, mauris','ultrices. Duis volutpat','2023-01-30','2023-03-21'),(85,'vulputate mauris','ultrices posuere cubilia','2023-01-03','2023-03-10'),(86,'scelerisque mollis.','egestas ligula. Nullam','2023-01-04','2023-03-18'),(87,'magna tellus','accumsan neque et','2023-01-03','2023-03-18'),(88,'non, dapibus','enim. Etiam imperdiet','2023-01-12','2023-03-30'),(89,'netus et','eget, dictum placerat,','2023-01-14','2023-03-19'),(90,'hendrerit a,','tristique senectus et','2023-01-12','2023-03-27'),(91,'luctus aliquet','nec, imperdiet nec,','2023-01-26','2023-03-10'),(92,'metus facilisis','purus. Duis elementum,','2023-01-30','2023-03-21'),(93,'Donec tempus,','nec orci. Donec','2023-01-09','2023-03-23'),(94,'neque non','est mauris, rhoncus','2023-01-21','2023-03-20'),(95,'Nullam nisl.','ac facilisis facilisis,','2023-01-30','2023-03-28'),(96,'Sed eu','urna. Ut tincidunt','2023-01-26','2023-03-18'),(97,'dictum eu,','Aenean euismod mauris','2023-01-27','2023-03-18'),(98,'sem, consequat','pharetra ut, pharetra','2023-01-27','2023-03-28'),(99,'iaculis nec,','non, vestibulum nec,','2023-01-08','2023-03-13'),(100,'sapien imperdiet','ac risus. Morbi','2023-01-17','2023-03-09');
/*!40000 ALTER TABLE `Project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Review`
--

DROP TABLE IF EXISTS `Review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Review` (
  `review_id` int NOT NULL AUTO_INCREMENT,
  `rating` int DEFAULT NULL,
  `description` text,
  `fk_vendor_id` int NOT NULL,
  `fk_emp_id` int NOT NULL,
  PRIMARY KEY (`review_id`),
  KEY `vendor_id` (`fk_vendor_id`),
  KEY `user_id` (`fk_emp_id`),
  CONSTRAINT `review_ibfk_1` FOREIGN KEY (`fk_vendor_id`) REFERENCES `Vendor` (`vendor_id`),
  CONSTRAINT `review_ibfk_2` FOREIGN KEY (`fk_emp_id`) REFERENCES `Employee` (`emp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=854 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Review`
--

LOCK TABLES `Review` WRITE;
/*!40000 ALTER TABLE `Review` DISABLE KEYS */;
INSERT INTO `Review` VALUES (1,4,'Good service',10,42),(2,0,'Bad Service',7,224),(3,2,'Bad Service',7,245),(4,2,'Bad Service',7,171),(5,0,'Bad Service',2,174),(6,0,'Bad Service',4,70),(7,0,'Bad Service',3,160),(8,2,'Bad Service',1,38),(9,0,'Bad Service',2,68),(10,5,'Good service',4,241),(11,4,'Good service',3,202),(12,3,'Bad Service',3,222),(13,4,'Good service',3,43),(14,1,'Bad Service',8,243),(15,0,'Bad Service',4,89),(16,1,'Bad Service',6,81),(17,2,'Bad Service',4,151),(18,2,'Bad Service',1,71),(19,5,'Good service',6,50),(20,0,'Bad Service',6,11),(21,1,'Bad Service',7,42),(22,5,'Good service',8,203),(23,5,'Good service',2,167),(24,5,'Good service',4,233),(25,1,'Bad Service',4,65),(26,2,'Bad Service',2,1),(27,1,'Bad Service',8,179),(28,5,'Good service',1,64),(29,2,'Bad Service',4,149),(30,1,'Bad Service',5,229),(31,4,'Good service',1,40),(32,4,'Good service',8,237),(33,0,'Bad Service',10,57),(34,5,'Good service',4,61),(35,2,'Bad Service',10,51),(36,0,'Bad Service',5,159),(37,0,'Bad Service',1,26),(38,4,'Good service',3,8),(39,0,'Bad Service',3,164),(40,2,'Bad Service',7,93),(41,3,'Bad Service',3,115),(42,3,'Bad Service',5,156),(43,5,'Good service',1,105),(44,0,'Bad Service',2,57),(45,4,'Good service',7,44),(46,3,'Bad Service',7,173),(47,1,'Bad Service',1,188),(48,4,'Good service',8,93),(49,3,'Bad Service',4,152),(50,0,'Bad Service',5,4),(51,0,'Bad Service',6,17),(52,2,'Bad Service',7,154),(53,4,'Good service',8,48),(54,5,'Good service',6,190),(55,0,'Bad Service',6,189),(56,1,'Bad Service',7,100),(57,5,'Good service',3,78),(58,4,'Good service',2,40),(59,4,'Good service',8,72),(60,1,'Bad Service',4,50),(61,1,'Bad Service',4,137),(62,3,'Bad Service',7,146),(63,2,'Bad Service',3,112),(64,0,'Bad Service',7,9),(65,4,'Good service',4,18),(66,4,'Good service',4,169),(67,1,'Bad Service',3,190),(68,1,'Bad Service',7,134),(69,1,'Bad Service',10,215),(70,1,'Bad Service',1,227),(71,1,'Bad Service',3,206),(72,5,'Good service',7,184),(73,3,'Bad Service',4,247),(74,3,'Bad Service',6,237),(75,0,'Bad Service',6,239),(76,1,'Bad Service',7,117),(77,4,'Good service',4,2),(78,4,'Good service',6,12),(79,2,'Bad Service',4,123),(80,1,'Bad Service',5,192),(81,0,'Bad Service',1,19),(82,2,'Bad Service',10,67),(83,5,'Good service',2,9),(84,3,'Bad Service',7,53),(85,2,'Bad Service',4,158),(86,5,'Good service',7,36),(87,5,'Good service',8,176),(88,4,'Good service',4,131),(89,3,'Bad Service',2,248),(90,2,'Bad Service',7,28),(91,3,'Bad Service',4,24),(92,2,'Bad Service',5,89),(93,2,'Bad Service',6,156),(94,4,'Good service',7,232),(95,5,'Good service',7,237),(96,1,'Bad Service',8,31),(97,1,'Bad Service',1,89),(98,2,'Bad Service',8,139),(99,3,'Bad Service',3,169),(100,2,'Bad Service',3,46),(101,1,'Bad Service',7,201),(102,3,'Bad Service',7,75),(103,4,'Good service',6,201),(104,0,'Bad Service',4,156),(105,3,'Bad Service',5,246),(106,0,'Bad Service',7,132),(107,3,'Bad Service',2,197),(108,2,'Bad Service',5,223),(109,1,'Bad Service',4,131),(110,0,'Bad Service',3,20),(111,0,'Bad Service',4,86),(112,5,'Good service',7,160),(113,3,'Bad Service',4,165),(114,0,'Bad Service',5,49),(115,3,'Bad Service',6,223),(116,2,'Bad Service',8,184),(117,1,'Bad Service',3,126),(118,5,'Good service',2,145),(119,5,'Good service',7,59),(120,0,'Bad Service',5,107),(121,2,'Bad Service',5,157),(122,0,'Bad Service',7,185),(123,2,'Bad Service',7,249),(124,3,'Bad Service',7,70),(125,4,'Good service',1,74),(126,5,'Good service',4,194),(127,1,'Bad Service',4,153),(128,2,'Bad Service',5,224),(129,3,'Bad Service',3,2),(130,1,'Bad Service',4,118),(131,0,'Bad Service',4,45),(132,1,'Bad Service',5,170),(133,2,'Bad Service',10,147),(134,4,'Good service',7,239),(135,0,'Bad Service',2,126),(136,4,'Good service',4,47),(137,4,'Good service',10,18),(138,0,'Bad Service',7,178),(139,1,'Bad Service',7,48),(140,5,'Good service',7,143),(141,3,'Bad Service',7,49),(142,4,'Good service',4,35),(143,3,'Bad Service',8,189),(144,0,'Bad Service',7,6),(145,4,'Good service',5,25),(146,4,'Good service',4,33),(147,2,'Bad Service',5,144),(148,2,'Bad Service',6,224),(149,0,'Bad Service',1,143),(150,5,'Good service',3,183),(151,1,'Bad Service',6,100),(152,0,'Bad Service',6,91),(153,1,'Bad Service',8,155),(154,0,'Bad Service',5,48),(155,5,'Good service',7,157),(156,3,'Bad Service',4,132),(157,5,'Good service',2,71),(158,5,'Good service',7,1),(159,1,'Bad Service',5,243),(160,0,'Bad Service',2,21),(161,4,'Good service',7,133),(162,2,'Bad Service',5,150),(163,4,'Good service',5,160),(164,1,'Bad Service',2,190),(165,1,'Bad Service',10,175),(166,3,'Bad Service',6,105),(167,5,'Good service',5,209),(168,3,'Bad Service',7,248),(169,0,'Bad Service',4,56),(170,3,'Bad Service',4,120),(171,5,'Good service',6,240),(172,2,'Bad Service',6,45),(173,4,'Good service',4,155),(174,2,'Bad Service',7,207),(175,4,'Good service',2,64),(176,5,'Good service',4,199),(177,0,'Bad Service',2,29),(178,1,'Bad Service',4,183),(179,4,'Good service',7,17),(180,4,'Good service',4,157),(181,3,'Bad Service',7,168),(182,3,'Bad Service',8,84),(183,0,'Bad Service',4,146),(184,4,'Good service',4,87),(185,2,'Bad Service',4,103),(186,4,'Good service',8,193),(187,4,'Good service',3,225),(188,4,'Good service',2,37),(189,1,'Bad Service',4,25),(190,5,'Good service',4,1),(191,2,'Bad Service',7,126),(192,5,'Good service',6,1),(193,1,'Bad Service',10,221),(194,5,'Good service',7,16),(195,2,'Bad Service',2,39),(196,2,'Bad Service',7,135),(197,3,'Bad Service',2,224),(198,2,'Bad Service',1,242),(199,1,'Bad Service',7,181),(200,5,'Good service',8,16),(201,1,'Bad Service',8,77),(202,1,'Bad Service',1,86),(203,0,'Bad Service',6,101),(204,3,'Bad Service',10,7),(205,5,'Good service',8,107),(206,4,'Good service',3,153),(207,1,'Bad Service',5,227),(208,5,'Good service',2,11),(209,1,'Bad Service',1,20),(210,5,'Good service',10,229),(211,5,'Good service',2,225),(212,2,'Bad Service',3,27),(213,2,'Bad Service',7,195),(214,2,'Bad Service',2,239),(215,0,'Bad Service',5,114),(216,0,'Bad Service',4,34),(217,5,'Good service',7,176),(218,3,'Bad Service',2,72),(219,3,'Bad Service',7,203),(220,2,'Bad Service',7,77),(221,3,'Bad Service',2,186),(222,1,'Bad Service',6,35),(223,3,'Bad Service',7,189),(224,0,'Bad Service',2,243),(225,4,'Good service',4,177),(226,4,'Good service',7,72),(227,2,'Bad Service',3,76),(228,3,'Bad Service',1,21),(229,2,'Bad Service',2,116),(230,1,'Bad Service',3,86),(231,2,'Bad Service',10,55),(232,0,'Bad Service',7,83),(233,2,'Bad Service',8,47),(234,3,'Bad Service',7,119),(235,4,'Good service',8,158),(236,1,'Bad Service',4,2),(237,0,'Bad Service',10,129),(238,0,'Bad Service',2,100),(239,4,'Good service',3,68),(240,5,'Good service',2,113),(241,4,'Good service',8,154),(242,1,'Bad Service',4,233),(243,5,'Good service',8,11),(244,2,'Bad Service',5,38),(245,5,'Good service',7,223),(246,4,'Good service',8,195),(247,1,'Bad Service',7,135),(248,2,'Bad Service',4,196),(249,1,'Bad Service',4,71),(250,3,'Bad Service',6,69),(251,0,'Bad Service',1,103),(252,1,'Bad Service',4,122),(253,3,'Bad Service',1,198),(254,2,'Bad Service',1,113),(255,0,'Bad Service',10,122),(256,3,'Bad Service',4,215),(257,2,'Bad Service',7,10),(258,3,'Bad Service',7,219),(259,3,'Bad Service',7,13),(260,2,'Bad Service',3,100),(261,4,'Good service',1,112),(262,3,'Bad Service',1,150),(263,4,'Good service',7,90),(264,0,'Bad Service',2,50),(265,2,'Bad Service',4,19),(266,5,'Good service',5,162),(267,5,'Good service',3,180),(268,5,'Good service',7,209),(269,5,'Good service',8,211),(270,2,'Bad Service',8,167),(271,0,'Bad Service',4,87),(272,3,'Bad Service',5,206),(273,2,'Bad Service',3,138),(274,2,'Bad Service',1,29),(275,0,'Bad Service',5,69),(276,2,'Bad Service',5,212),(277,3,'Bad Service',7,229),(278,4,'Good service',3,194),(279,4,'Good service',4,164),(280,1,'Bad Service',7,202),(281,1,'Bad Service',6,229),(282,3,'Bad Service',4,248),(283,3,'Bad Service',8,104),(284,2,'Bad Service',4,120),(285,0,'Bad Service',4,112),(286,3,'Bad Service',3,209),(287,5,'Good service',3,102),(288,2,'Bad Service',7,136),(289,3,'Bad Service',7,125),(290,3,'Bad Service',8,234),(291,5,'Good service',4,199),(292,3,'Bad Service',4,136),(293,0,'Bad Service',4,65),(294,4,'Good service',2,187),(295,5,'Good service',7,246),(296,4,'Good service',2,158),(297,0,'Bad Service',4,52),(298,0,'Bad Service',7,57),(299,1,'Bad Service',1,223),(300,1,'Bad Service',1,7),(301,3,'Bad Service',2,109),(302,2,'Bad Service',10,152),(303,4,'Good service',5,143),(304,1,'Bad Service',4,29),(305,2,'Bad Service',6,158),(306,3,'Bad Service',2,23),(307,3,'Bad Service',4,43),(308,1,'Bad Service',4,26),(309,5,'Good service',8,210),(310,3,'Bad Service',6,67),(311,3,'Bad Service',6,154),(312,2,'Bad Service',7,63),(313,2,'Bad Service',8,39),(314,1,'Bad Service',1,206),(315,0,'Bad Service',6,7),(316,4,'Good service',7,45),(317,4,'Good service',6,58),(318,0,'Bad Service',4,14),(319,5,'Good service',4,185),(320,0,'Bad Service',3,67),(321,5,'Good service',7,78),(322,2,'Bad Service',2,59),(323,3,'Bad Service',7,54),(324,2,'Bad Service',6,219),(325,4,'Good service',3,38),(326,1,'Bad Service',8,213),(327,2,'Bad Service',3,21),(328,1,'Bad Service',1,37),(329,3,'Bad Service',4,74),(330,2,'Bad Service',7,240),(331,4,'Good service',7,41),(332,1,'Bad Service',4,110),(333,1,'Bad Service',7,86),(334,4,'Good service',3,148),(335,5,'Good service',2,219),(336,2,'Bad Service',4,250),(337,0,'Bad Service',8,125),(338,1,'Bad Service',4,147),(339,0,'Bad Service',8,236),(340,3,'Bad Service',2,108),(341,2,'Bad Service',8,151),(342,4,'Good service',10,117),(343,3,'Bad Service',4,52),(344,1,'Bad Service',5,73),(345,2,'Bad Service',3,244),(346,0,'Bad Service',4,63),(347,5,'Good service',7,243),(348,5,'Good service',2,207),(349,3,'Bad Service',7,23),(350,1,'Bad Service',3,219),(351,5,'Good service',4,102),(352,1,'Bad Service',3,200),(353,4,'Good service',4,140),(354,0,'Bad Service',3,182),(355,2,'Bad Service',7,46),(356,1,'Bad Service',10,202),(357,3,'Bad Service',4,142),(358,2,'Bad Service',4,128),(359,1,'Bad Service',2,99),(360,1,'Bad Service',7,187),(361,2,'Bad Service',4,41),(362,1,'Bad Service',4,238),(363,3,'Bad Service',5,199),(364,0,'Bad Service',7,174),(365,0,'Bad Service',4,60),(366,3,'Bad Service',3,82),(367,0,'Bad Service',10,100),(368,4,'Good service',7,200),(369,0,'Bad Service',3,10),(370,3,'Bad Service',4,204),(371,1,'Bad Service',2,214),(372,2,'Bad Service',2,67),(373,3,'Bad Service',4,165),(374,0,'Bad Service',6,221),(375,4,'Good service',2,69),(376,4,'Good service',10,219),(377,4,'Good service',8,204),(378,5,'Good service',8,54),(379,3,'Bad Service',6,126),(380,4,'Good service',7,12),(381,5,'Good service',4,215),(382,4,'Good service',4,88),(383,4,'Good service',8,130),(384,1,'Bad Service',6,23),(385,2,'Bad Service',4,82),(386,2,'Bad Service',6,64),(387,2,'Bad Service',4,51),(388,4,'Good service',2,77),(389,2,'Bad Service',1,76),(390,0,'Bad Service',4,148),(391,5,'Good service',7,156),(392,3,'Bad Service',3,105),(393,4,'Good service',4,216),(394,1,'Bad Service',4,11),(395,2,'Bad Service',4,187),(396,4,'Good service',7,188),(397,0,'Bad Service',5,182),(398,2,'Bad Service',1,118),(399,2,'Bad Service',1,149),(400,4,'Good service',4,6),(401,0,'Bad Service',8,245),(402,5,'Good service',6,21),(403,2,'Bad Service',2,35),(404,5,'Good service',4,227),(405,2,'Bad Service',7,69),(406,4,'Good service',5,127),(407,1,'Bad Service',5,72),(408,4,'Good service',5,217),(409,1,'Bad Service',8,50),(410,1,'Bad Service',4,123),(411,5,'Good service',3,33),(412,4,'Good service',2,201),(413,3,'Bad Service',6,109),(414,1,'Bad Service',7,15),(415,1,'Bad Service',4,83),(416,5,'Good service',3,144),(417,1,'Bad Service',7,230),(418,1,'Bad Service',7,144),(419,2,'Bad Service',5,198),(420,2,'Bad Service',4,82),(421,4,'Good service',3,177),(422,4,'Good service',4,198),(423,5,'Good service',7,193),(424,3,'Bad Service',1,197),(425,5,'Good service',4,111),(426,4,'Good service',7,164),(427,1,'Bad Service',7,170),(428,1,'Bad Service',5,155),(429,4,'Good service',4,241),(430,1,'Bad Service',2,155),(431,1,'Bad Service',8,187),(432,0,'Bad Service',4,89),(433,2,'Bad Service',3,217),(434,1,'Bad Service',6,104),(435,3,'Bad Service',4,104),(436,3,'Bad Service',4,197),(437,5,'Good service',1,141),(438,3,'Bad Service',8,248),(439,4,'Good service',2,143),(440,0,'Bad Service',3,79),(441,2,'Bad Service',3,136),(442,2,'Bad Service',10,143),(443,0,'Bad Service',7,66),(444,5,'Good service',5,9),(445,4,'Good service',8,142),(446,0,'Bad Service',5,111),(447,5,'Good service',3,49),(448,0,'Bad Service',3,4),(449,0,'Bad Service',3,117),(450,3,'Bad Service',2,81),(451,3,'Bad Service',4,39),(452,5,'Good service',10,119),(453,3,'Bad Service',7,163),(454,3,'Bad Service',7,196),(455,3,'Bad Service',6,24),(456,2,'Bad Service',3,157),(457,2,'Bad Service',2,117),(458,3,'Bad Service',4,148),(459,0,'Bad Service',3,63),(460,0,'Bad Service',8,124),(461,3,'Bad Service',1,12),(462,1,'Bad Service',10,66),(463,0,'Bad Service',3,110),(464,4,'Good service',7,25),(465,2,'Bad Service',8,247),(466,3,'Bad Service',7,221),(467,2,'Bad Service',7,150),(468,3,'Bad Service',10,140),(469,2,'Bad Service',6,167),(470,0,'Bad Service',7,55),(471,1,'Bad Service',4,34),(472,2,'Bad Service',8,174),(473,1,'Bad Service',2,48),(474,3,'Bad Service',7,238),(475,5,'Good service',1,239),(476,0,'Bad Service',7,110),(477,5,'Good service',7,230),(478,4,'Good service',8,90),(479,1,'Bad Service',3,96),(480,0,'Bad Service',6,68),(481,2,'Bad Service',2,246),(482,2,'Bad Service',2,173),(483,2,'Bad Service',6,155),(484,0,'Bad Service',5,24),(485,2,'Bad Service',4,194),(486,1,'Bad Service',8,5),(487,5,'Good service',3,231),(488,2,'Bad Service',4,207),(489,0,'Bad Service',4,56),(490,1,'Bad Service',8,246),(491,2,'Bad Service',4,134),(492,5,'Good service',4,6),(493,2,'Bad Service',5,120),(494,2,'Bad Service',7,50),(495,1,'Bad Service',2,240),(496,1,'Bad Service',10,52),(497,1,'Bad Service',4,78),(498,1,'Bad Service',4,169),(499,0,'Bad Service',2,91),(500,3,'Bad Service',7,7),(501,3,'Bad Service',5,54),(502,3,'Bad Service',5,77),(503,0,'Bad Service',3,36),(504,1,'Bad Service',1,63),(505,4,'Good service',3,88),(506,0,'Bad Service',2,24),(507,0,'Bad Service',3,109),(508,5,'Good service',3,64),(509,5,'Good service',7,206),(510,3,'Bad Service',8,146),(511,5,'Good service',2,212),(512,1,'Bad Service',3,208),(513,2,'Bad Service',1,173),(514,2,'Bad Service',2,101),(515,4,'Good service',8,60),(516,5,'Good service',4,113),(517,0,'Bad Service',2,205),(518,5,'Good service',5,247),(519,2,'Bad Service',6,187),(520,0,'Bad Service',4,147),(521,4,'Good service',8,53),(522,0,'Bad Service',7,191),(523,0,'Bad Service',5,145),(524,1,'Bad Service',7,214),(525,3,'Bad Service',4,103),(526,4,'Good service',5,32),(527,5,'Good service',10,220),(528,2,'Bad Service',3,41),(529,0,'Bad Service',8,216),(530,1,'Bad Service',8,95),(531,5,'Good service',8,191),(532,1,'Bad Service',6,188),(533,3,'Bad Service',2,146),(534,3,'Bad Service',8,106),(535,0,'Bad Service',4,78),(536,0,'Bad Service',8,128),(537,2,'Bad Service',8,69),(538,5,'Good service',5,103),(539,0,'Bad Service',1,4),(540,0,'Bad Service',4,14),(541,5,'Good service',4,27),(542,3,'Bad Service',10,240),(543,3,'Bad Service',5,96),(544,2,'Bad Service',4,26),(545,4,'Good service',7,11),(546,3,'Bad Service',4,180),(547,4,'Good service',4,18),(548,3,'Bad Service',6,202),(549,4,'Good service',4,167),(550,2,'Bad Service',2,45),(551,5,'Good service',5,158),(552,1,'Bad Service',4,137),(553,2,'Bad Service',7,79),(554,2,'Bad Service',3,14),(555,1,'Bad Service',3,171),(556,0,'Bad Service',5,41),(557,4,'Good service',10,188),(558,0,'Bad Service',4,189),(559,4,'Good service',10,126),(560,1,'Bad Service',1,229),(561,4,'Good service',3,114),(562,3,'Bad Service',3,250),(563,3,'Bad Service',4,51),(564,4,'Good service',3,97),(565,2,'Bad Service',7,106),(566,0,'Bad Service',5,15),(567,0,'Bad Service',3,240),(568,2,'Bad Service',2,223),(569,0,'Bad Service',4,88),(570,3,'Bad Service',7,192),(571,3,'Bad Service',10,28),(572,5,'Good service',2,188),(573,0,'Bad Service',6,246),(574,5,'Good service',6,178),(575,5,'Good service',2,54),(576,3,'Bad Service',4,33),(577,3,'Bad Service',7,131),(578,2,'Bad Service',7,162),(579,NULL,NULL,2,7),(580,NULL,NULL,5,174),(581,NULL,NULL,6,184),(582,NULL,NULL,8,59),(583,NULL,NULL,8,9),(584,NULL,NULL,7,244),(585,NULL,NULL,4,58),(586,NULL,NULL,7,22),(587,NULL,NULL,10,218),(588,NULL,NULL,4,83),(589,NULL,NULL,6,39),(590,NULL,NULL,4,196),(591,NULL,NULL,7,159),(592,NULL,NULL,3,145),(593,NULL,NULL,4,250),(594,NULL,NULL,3,17),(595,NULL,NULL,8,1),(596,NULL,NULL,1,120),(597,NULL,NULL,7,210),(598,NULL,NULL,7,107),(599,NULL,NULL,3,137),(600,NULL,NULL,7,172),(601,NULL,NULL,7,40),(602,NULL,NULL,4,69),(603,NULL,NULL,4,124),(604,NULL,NULL,3,186),(605,NULL,NULL,5,196),(606,NULL,NULL,4,211),(607,NULL,NULL,7,35),(608,NULL,NULL,1,136),(609,NULL,NULL,7,220),(610,NULL,NULL,3,101),(611,NULL,NULL,3,25),(612,NULL,NULL,4,27),(613,NULL,NULL,3,150),(614,NULL,NULL,10,172),(615,NULL,NULL,7,67),(616,NULL,NULL,7,167),(617,NULL,NULL,7,161),(618,NULL,NULL,8,214),(619,NULL,NULL,2,195),(620,NULL,NULL,6,59),(621,NULL,NULL,3,23),(622,NULL,NULL,4,122),(623,NULL,NULL,7,236),(624,NULL,NULL,10,109),(625,NULL,NULL,4,168),(626,NULL,NULL,2,98),(627,NULL,NULL,8,22),(628,NULL,NULL,3,34),(629,NULL,NULL,7,213),(630,NULL,NULL,1,165),(631,NULL,NULL,4,177),(632,NULL,NULL,4,94),(633,NULL,NULL,2,178),(634,NULL,NULL,5,153),(635,NULL,NULL,2,226),(636,NULL,NULL,3,57),(637,NULL,NULL,3,212),(638,NULL,NULL,4,218),(639,NULL,NULL,4,198),(640,NULL,NULL,4,242),(641,NULL,NULL,4,111),(642,NULL,NULL,3,161),(643,NULL,NULL,10,249),(644,NULL,NULL,10,68),(645,NULL,NULL,5,78),(646,NULL,NULL,6,195),(647,NULL,NULL,1,114),(648,NULL,NULL,5,3),(649,NULL,NULL,1,232),(650,NULL,NULL,6,117),(651,NULL,NULL,2,17),(652,NULL,NULL,5,36),(653,NULL,NULL,6,95),(654,NULL,NULL,7,38),(655,NULL,NULL,2,242),(656,NULL,NULL,4,110),(657,NULL,NULL,7,217),(658,NULL,NULL,6,76),(659,NULL,NULL,2,189),(660,NULL,NULL,4,180),(661,NULL,NULL,4,20),(662,NULL,NULL,7,166),(663,NULL,NULL,6,173),(664,NULL,NULL,5,59),(665,NULL,NULL,5,74),(666,NULL,NULL,2,118),(667,NULL,NULL,10,30),(668,NULL,NULL,5,214),(669,NULL,NULL,7,233),(670,NULL,NULL,3,81),(671,NULL,NULL,4,74),(672,NULL,NULL,4,175),(673,NULL,NULL,10,17),(674,NULL,NULL,4,41),(675,NULL,NULL,2,229),(676,NULL,NULL,5,7),(677,NULL,NULL,8,75),(678,NULL,NULL,7,58),(679,NULL,NULL,10,40),(680,NULL,NULL,7,166),(681,NULL,NULL,10,123),(682,NULL,NULL,8,228),(683,NULL,NULL,4,25),(684,NULL,NULL,7,235),(685,NULL,NULL,3,192),(686,NULL,NULL,1,79),(687,NULL,NULL,3,178),(688,NULL,NULL,8,45),(689,NULL,NULL,1,144),(690,NULL,NULL,2,19),(691,NULL,NULL,3,73),(692,NULL,NULL,7,24),(693,NULL,NULL,3,121),(694,NULL,NULL,7,4),(695,NULL,NULL,3,65),(696,NULL,NULL,2,94),(697,NULL,NULL,5,188),(698,NULL,NULL,7,241),(699,NULL,NULL,1,217),(700,NULL,NULL,2,107),(701,NULL,NULL,7,129),(702,NULL,NULL,2,3),(703,NULL,NULL,4,99),(704,NULL,NULL,7,247),(705,NULL,NULL,4,79),(706,NULL,NULL,7,5),(707,NULL,NULL,6,57),(708,NULL,NULL,2,104),(709,NULL,NULL,4,201),(710,NULL,NULL,4,152),(711,NULL,NULL,8,207),(712,NULL,NULL,6,40),(713,NULL,NULL,4,37),(714,NULL,NULL,6,146),(715,NULL,NULL,6,248),(716,NULL,NULL,6,225),(717,NULL,NULL,7,68),(718,NULL,NULL,3,91),(719,NULL,NULL,5,248),(720,NULL,NULL,6,174),(721,NULL,NULL,7,199),(722,NULL,NULL,4,140),(723,NULL,NULL,4,170),(724,NULL,NULL,7,82),(725,NULL,NULL,7,158),(726,NULL,NULL,7,104),(727,NULL,NULL,7,73),(728,NULL,NULL,10,239),(729,NULL,NULL,3,170),(730,NULL,NULL,4,234),(731,NULL,NULL,5,164),(732,NULL,NULL,1,98),(733,NULL,NULL,2,12),(734,NULL,NULL,10,223),(735,NULL,NULL,3,85),(736,NULL,NULL,1,192),(737,NULL,NULL,6,143),(738,NULL,NULL,7,231),(739,NULL,NULL,3,199),(740,NULL,NULL,1,101),(741,NULL,NULL,3,196),(742,NULL,NULL,5,12),(743,NULL,NULL,7,127),(744,NULL,NULL,7,182),(745,NULL,NULL,3,98),(746,NULL,NULL,5,133),(747,NULL,NULL,3,87),(748,NULL,NULL,7,39),(749,NULL,NULL,4,195),(750,NULL,NULL,4,246),(751,NULL,NULL,3,15),(752,NULL,NULL,3,221),(753,NULL,NULL,7,109),(754,NULL,NULL,7,56),(755,NULL,NULL,7,153),(756,NULL,NULL,4,238),(757,NULL,NULL,3,80),(758,NULL,NULL,7,179),(759,NULL,NULL,4,175),(760,NULL,NULL,5,82),(761,NULL,NULL,3,92),(762,NULL,NULL,10,178),(763,NULL,NULL,10,12),(764,NULL,NULL,7,228),(765,NULL,NULL,4,218),(766,NULL,NULL,2,58),(767,NULL,NULL,2,202),(768,NULL,NULL,8,35),(769,NULL,NULL,6,236),(770,NULL,NULL,5,165),(771,NULL,NULL,4,153),(772,NULL,NULL,8,58),(773,NULL,NULL,1,190),(774,NULL,NULL,8,156),(775,NULL,NULL,4,170),(776,NULL,NULL,3,159),(777,NULL,NULL,7,95),(778,NULL,NULL,3,3),(779,NULL,NULL,5,163),(780,NULL,NULL,4,139),(781,NULL,NULL,4,102),(782,NULL,NULL,3,61),(783,NULL,NULL,3,232),(784,NULL,NULL,5,200),(785,NULL,NULL,1,99),(786,NULL,NULL,1,15),(787,NULL,NULL,6,207),(788,NULL,NULL,5,239),(789,NULL,NULL,6,98),(790,NULL,NULL,6,213),(791,NULL,NULL,7,30),(792,NULL,NULL,4,157),(793,NULL,NULL,5,40),(794,NULL,NULL,7,155),(795,NULL,NULL,4,164),(796,NULL,NULL,6,179),(797,NULL,NULL,4,222),(798,NULL,NULL,6,247),(799,NULL,NULL,2,149),(800,NULL,NULL,2,141),(801,NULL,NULL,5,173),(802,NULL,NULL,4,61),(803,NULL,NULL,7,138),(804,NULL,NULL,7,31),(805,NULL,NULL,5,110),(806,NULL,NULL,7,114),(807,NULL,NULL,1,91),(808,NULL,NULL,5,35),(809,NULL,NULL,1,224),(810,NULL,NULL,7,112),(811,NULL,NULL,2,247),(812,NULL,NULL,3,32),(813,NULL,NULL,10,13),(814,NULL,NULL,2,105),(815,NULL,NULL,10,224),(816,NULL,NULL,4,222),(817,NULL,NULL,2,156),(818,NULL,NULL,3,62),(819,NULL,NULL,1,225),(820,NULL,NULL,8,24),(821,NULL,NULL,8,181),(822,NULL,NULL,5,26),(823,NULL,NULL,7,130),(824,NULL,NULL,10,173),(825,NULL,NULL,1,111),(826,NULL,NULL,4,84),(827,NULL,NULL,2,176),(828,NULL,NULL,4,174),(829,NULL,NULL,5,186),(830,NULL,NULL,4,176),(831,NULL,NULL,8,201),(832,NULL,NULL,4,59),(833,NULL,NULL,4,183),(834,NULL,NULL,4,227),(835,NULL,NULL,7,32),(836,NULL,NULL,4,232),(837,NULL,NULL,6,176),(838,NULL,NULL,4,141),(839,NULL,NULL,5,207),(840,NULL,NULL,1,94),(841,NULL,NULL,5,45),(842,NULL,NULL,10,235),(843,NULL,NULL,10,23),(844,NULL,NULL,5,44),(845,NULL,NULL,4,43),(846,NULL,NULL,2,221),(847,NULL,NULL,7,20),(848,NULL,NULL,2,96),(849,NULL,NULL,2,76),(850,NULL,NULL,1,159),(851,NULL,NULL,1,81),(852,4,'Really nice products!',7,10),(853,2,'Really bad products!',7,12);
/*!40000 ALTER TABLE `Review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Service`
--

DROP TABLE IF EXISTS `Service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Service` (
  `service_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `category` varchar(45) DEFAULT NULL,
  `fk_vendor_id` int NOT NULL,
  PRIMARY KEY (`service_id`),
  KEY `vendor_id` (`fk_vendor_id`),
  CONSTRAINT `service_ibfk_1` FOREIGN KEY (`fk_vendor_id`) REFERENCES `Vendor` (`vendor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Service`
--

LOCK TABLES `Service` WRITE;
/*!40000 ALTER TABLE `Service` DISABLE KEYS */;
INSERT INTO `Service` VALUES (1,'Image Recognition','AI-based image recognition service',10.00,'Computer Vision',1),(2,'Speech-to-Text','AI-based speech-to-text conversion service',8.00,'Speech Recognition',2),(3,'Text-to-Speech','AI-based text-to-speech conversion service',7.50,'Speech Synthesis',3),(4,'Natural Language Processing','AI-based natural language processing service',11.00,'Natural Language Processing',4),(5,'Object Detection','AI-based object detection service',9.50,'Computer Vision',5),(6,'Sentiment Analysis','AI-based sentiment analysis service',12.00,'Natural Language Processing',6),(7,'Recommendation Engine','AI-based recommendation engine service',13.50,'Recommendation Systems',7),(8,'Facial Recognition','AI-based facial recognition service',10.50,'Computer Vision',8),(9,'Fraud Detection','AI-based fraud detection service',14.00,'Fraud Detection',9),(10,'Virtual Assistant','AI-based virtual assistant service',11.50,'Virtual Assistants',10),(11,'Image Segmentation','AI-based image segmentation service',8.50,'Computer Vision',1),(12,'Named Entity Recognition','AI-based named entity recognition service',9.00,'Natural Language Processing',2),(13,'Keyword Extraction','AI-based keyword extraction service',7.00,'Natural Language Processing',3),(14,'Chatbot','AI-based chatbot service',10.00,'Virtual Assistants',4),(15,'Speech Emotion Recognition','AI-based speech emotion recognition service',11.50,'Speech Recognition',5),(16,'Speech Enhancement','AI-based speech enhancement service',9.00,'Speech Processing',6),(17,'Entity Linking','AI-based entity linking service',8.50,'Natural Language Processing',7),(18,'Content Moderation','AI-based content moderation service',12.00,'Moderation',8);
/*!40000 ALTER TABLE `Service` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `ServicePriceChange` AFTER UPDATE ON `service` FOR EACH ROW BEGIN
    INSERT INTO ServicePriceLog (service_id, name, description, price, fk_vendor_id, updated_at, new_price)
    VALUES (OLD.service_id, OLD.name, OLD.description, OLD.price, OLD.fk_vendor_id, NOW(), NEW.price);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `ServicePriceLog`
--

DROP TABLE IF EXISTS `ServicePriceLog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ServicePriceLog` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `service_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `fk_vendor_id` int NOT NULL,
  `updated_at` datetime NOT NULL,
  `new_price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ServicePriceLog`
--

LOCK TABLES `ServicePriceLog` WRITE;
/*!40000 ALTER TABLE `ServicePriceLog` DISABLE KEYS */;
/*!40000 ALTER TABLE `ServicePriceLog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ServiceUsage`
--

DROP TABLE IF EXISTS `ServiceUsage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ServiceUsage` (
  `usage_id` int NOT NULL AUTO_INCREMENT,
  `totalcost` decimal(10,2) DEFAULT NULL,
  `fk_task_id` int NOT NULL,
  `fk_service_id` int NOT NULL,
  PRIMARY KEY (`usage_id`),
  KEY `task_id` (`fk_task_id`),
  KEY `service_id` (`fk_service_id`),
  CONSTRAINT `serviceusage_ibfk_1` FOREIGN KEY (`fk_task_id`) REFERENCES `Task` (`task_id`),
  CONSTRAINT `serviceusage_ibfk_2` FOREIGN KEY (`fk_service_id`) REFERENCES `Service` (`service_id`)
) ENGINE=InnoDB AUTO_INCREMENT=241 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ServiceUsage`
--

LOCK TABLES `ServiceUsage` WRITE;
/*!40000 ALTER TABLE `ServiceUsage` DISABLE KEYS */;
INSERT INTO `ServiceUsage` VALUES (121,352.00,59,13),(122,395.00,26,12),(123,333.00,98,17),(124,131.00,58,7),(125,353.00,111,2),(126,303.00,25,12),(127,140.00,20,5),(128,184.00,37,14),(129,327.00,64,16),(130,286.00,101,5),(131,218.00,40,17),(132,320.00,54,17),(133,356.00,102,11),(134,230.00,56,13),(135,242.00,109,5),(136,317.00,30,4),(137,278.00,119,6),(138,166.00,66,15),(139,374.00,41,11),(140,378.00,35,6),(141,287.00,71,14),(142,373.00,96,4),(143,154.00,39,12),(144,338.00,86,4),(145,216.00,11,13),(146,270.00,65,6),(147,151.00,70,17),(148,149.00,114,15),(149,172.00,19,12),(150,369.00,38,13),(151,132.00,15,15),(152,198.00,29,6),(153,270.00,32,9),(154,165.00,55,4),(155,253.00,104,17),(156,230.00,17,14),(157,286.00,45,12),(158,315.00,88,7),(159,387.00,61,7),(160,248.00,87,2),(161,376.00,8,13),(162,268.00,21,16),(163,274.00,14,17),(164,232.00,46,15),(165,284.00,75,13),(166,344.00,84,10),(167,340.00,105,13),(168,238.00,12,4),(169,348.00,36,1),(170,241.00,76,10),(171,272.00,42,3),(172,322.00,74,12),(173,159.00,81,11),(174,348.00,82,8),(175,183.00,108,11),(176,166.00,85,14),(177,303.00,97,5),(178,365.00,22,16),(179,267.00,50,2),(180,220.00,91,11),(181,326.00,31,8),(182,400.00,100,12),(183,385.00,23,10),(184,278.00,1,14),(185,299.00,57,15),(186,357.00,16,12),(187,168.00,103,12),(188,234.00,33,1),(189,312.00,51,17),(190,287.00,99,7),(191,173.00,43,7),(192,298.00,6,7),(193,310.00,3,12),(194,263.00,72,18),(195,135.00,93,1),(196,181.00,63,1),(197,301.00,95,6),(198,182.00,118,15),(199,260.00,7,15),(200,168.00,53,18),(201,382.00,113,5),(202,170.00,92,3),(203,250.00,13,11),(204,390.00,34,2),(205,386.00,24,12),(206,317.00,67,17),(207,221.00,90,8),(208,240.00,94,13),(209,242.00,9,4),(210,221.00,27,13),(211,249.00,2,13),(212,285.00,78,10),(213,338.00,112,1),(214,167.00,117,1),(215,211.00,120,3),(216,210.00,52,3),(217,400.00,69,13),(218,168.00,115,3),(219,253.00,18,18),(220,163.00,44,13),(221,256.00,77,1),(222,390.00,79,1),(223,297.00,83,13),(224,204.00,28,6),(225,196.00,73,11),(226,250.00,80,11),(227,326.00,5,2),(228,333.00,107,8),(229,161.00,48,12),(230,265.00,49,15),(231,355.00,68,4),(232,131.00,60,14),(233,211.00,62,8),(234,297.00,110,17),(235,384.00,4,9),(236,231.00,106,5),(237,271.00,89,15),(238,249.00,10,17),(239,286.00,116,17),(240,142.00,47,12);
/*!40000 ALTER TABLE `ServiceUsage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Task`
--

DROP TABLE IF EXISTS `Task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Task` (
  `task_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `fk_project_id` int NOT NULL,
  PRIMARY KEY (`task_id`),
  KEY `project_id` (`fk_project_id`),
  CONSTRAINT `task_ibfk_1` FOREIGN KEY (`fk_project_id`) REFERENCES `Project` (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Task`
--

LOCK TABLES `Task` WRITE;
/*!40000 ALTER TABLE `Task` DISABLE KEYS */;
INSERT INTO `Task` VALUES (1,'sed, sapien.','aliquet vel, vulputate','2023-02-02','2023-03-21',59),(2,'Nulla interdum.','tempus non, lacinia','2023-02-13','2023-03-23',83),(3,'risus, at','Cras dictum ultricies','2023-02-07','2023-03-20',67),(4,'tempor, est','et libero. Proin','2023-02-04','2023-03-31',96),(5,'Mauris ut','Duis mi enim,','2023-02-03','2023-03-16',90),(6,'lorem ipsum','pede, ultrices a,','2023-02-08','2023-03-06',66),(7,'amet ultricies','fames ac turpis','2023-02-16','2023-03-04',70),(8,'nec enim.','augue, eu tempor','2023-02-16','2023-03-12',40),(9,'augue. Sed','Donec sollicitudin adipiscing','2023-02-08','2023-03-31',82),(10,'ornare tortor','In scelerisque scelerisque','2023-02-05','2023-03-18',98),(11,'pede. Suspendisse','rutrum magna. Cras','2023-02-02','2023-03-19',26),(12,'ut, sem.','purus. Duis elementum,','2023-02-05','2023-02-16',48),(13,'ornare. Fusce','et arcu imperdiet','2023-02-11','2023-03-03',75),(14,'erat neque','neque sed sem','2023-02-05','2023-03-02',43),(15,'Cras vehicula','elit, pellentesque a,','2023-02-07','2023-03-15',34),(16,'ipsum dolor','sodales at, velit.','2023-02-10','2023-02-24',60),(17,'penatibus et','consectetuer adipiscing elit.','2023-02-07','2023-03-20',37),(18,'sed dolor.','magna, malesuada vel,','2023-02-13','2023-03-21',87),(19,'hymenaeos. Mauris','eu lacus. Quisque','2023-02-02','2023-02-25',30),(20,'vitae sodales','ultrices posuere cubilia','2023-02-10','2023-02-23',8),(21,'Donec feugiat','pede. Praesent eu','2023-02-08','2023-03-09',41),(22,'a neque.','non, luctus sit','2023-02-03','2023-02-19',56),(23,'convallis erat,','ultrices posuere cubilia','2023-02-04','2023-03-18',58),(24,'magna. Phasellus','Nulla interdum. Curabitur','2023-02-14','2023-03-13',77),(25,'Nunc laoreet','enim. Etiam imperdiet','2023-02-05','2023-03-23',7),(26,'montes, nascetur','enim. Curabitur massa.','2023-02-16','2023-03-21',5),(27,'dapibus rutrum,','sociis natoque penatibus','2023-02-12','2023-03-03',82),(28,'eu, accumsan','orci, adipiscing non,','2023-02-06','2023-03-04',89),(29,'nostra, per','vulputate velit eu','2023-02-02','2023-03-04',34),(30,'fringilla. Donec','lectus pede, ultrices','2023-02-13','2023-03-01',18),(31,'viverra. Maecenas','Aenean euismod mauris','2023-02-16','2023-03-21',57),(32,'nibh. Phasellus','ultrices. Vivamus rhoncus.','2023-02-04','2023-03-22',36),(33,'euismod ac,','neque. Morbi quis','2023-02-10','2023-02-26',63),(34,'fringilla, porttitor','Phasellus libero mauris,','2023-02-03','2023-03-12',75),(35,'in aliquet','molestie tortor nibh','2023-02-11','2023-02-27',23),(36,'gravida. Aliquam','enim. Etiam imperdiet','2023-02-11','2023-03-10',48),(37,'eget laoreet','parturient montes, nascetur','2023-02-15','2023-03-22',8),(38,'vulputate, lacus.','Aliquam erat volutpat.','2023-02-08','2023-02-18',30),(39,'ultrices. Vivamus','velit eget laoreet','2023-02-02','2023-02-16',24),(40,'aliquet libero.','et, rutrum eu,','2023-02-16','2023-03-27',11),(41,'mi, ac','vitae nibh. Donec','2023-02-09','2023-03-23',22),(42,'ornare tortor','et, lacinia vitae,','2023-02-07','2023-03-29',52),(43,'purus, accumsan','mi. Aliquam gravida','2023-02-12','2023-02-20',65),(44,'interdum enim','morbi tristique senectus','2023-02-04','2023-03-20',87),(45,'vulputate eu,','porttitor scelerisque neque.','2023-02-14','2023-03-04',37),(46,'quam. Curabitur','metus. Vivamus euismod','2023-02-05','2023-03-03',44),(47,'Cum sociis','risus, at fringilla','2023-02-12','2023-03-04',100),(48,'risus. Donec','aliquet. Phasellus fermentum','2023-02-12','2023-03-22',91),(49,'vestibulum. Mauris','ipsum cursus vestibulum.','2023-02-09','2023-03-07',91),(50,'purus sapien,','lobortis mauris. Suspendisse','2023-02-04','2023-02-18',56),(51,'id, mollis','Aenean gravida nunc','2023-02-10','2023-03-24',63),(52,'felis, adipiscing','sagittis placerat. Cras','2023-02-09','2023-03-26',85),(53,'lobortis risus.','egestas nunc sed','2023-02-08','2023-02-25',70),(54,'et, euismod','eu nulla at','2023-02-06','2023-02-23',11),(55,'orci, adipiscing','sapien imperdiet ornare.','2023-02-06','2023-03-06',36),(56,'enim. Etiam','arcu. Sed eu','2023-02-02','2023-03-19',13),(57,'facilisis non,','lacus. Cras interdum.','2023-02-03','2023-02-27',59),(58,'Quisque nonummy','mi lorem, vehicula','2023-02-09','2023-03-12',6),(59,'hendrerit id,','ullamcorper eu, euismod','2023-02-16','2023-03-09',1),(60,'gravida. Praesent','fringilla cursus purus.','2023-02-05','2023-02-17',93),(61,'habitant morbi','lorem ut aliquam','2023-01-12','2023-01-29',38),(62,'nec mauris','et, rutrum non,','2023-01-12','2023-01-20',94),(63,'eget metus','parturient montes, nascetur','2023-01-15','2023-01-24',69),(64,'feugiat non,','magna. Phasellus dolor','2023-01-03','2023-01-23',9),(65,'Donec feugiat','vestibulum lorem, sit','2023-01-08','2023-01-30',27),(66,'lectus. Nullam','tincidunt aliquam arcu.','2023-01-10','2023-01-27',20),(67,'ultricies dignissim','tincidunt vehicula risus.','2023-01-06','2023-01-30',78),(68,'imperdiet, erat','non lorem vitae','2023-01-02','2023-01-29',91),(69,'tellus id','ornare. In faucibus.','2023-01-07','2023-01-18',85),(70,'faucibus leo,','arcu. Sed et','2023-01-07','2023-01-20',27),(71,'quis massa.','scelerisque mollis. Phasellus','2023-01-05','2023-01-28',23),(72,'aliquet, metus','vestibulum. Mauris magna.','2023-01-06','2023-01-27',67),(73,'accumsan laoreet','dis parturient montes,','2023-01-13','2023-01-23',89),(74,'ipsum. Suspendisse','ornare, lectus ante','2023-01-07','2023-01-18',52),(75,'ante blandit','Donec dignissim magna','2023-01-12','2023-01-22',44),(76,'dis parturient','Suspendisse commodo tincidunt','2023-01-04','2023-01-21',51),(77,'magnis dis','sapien. Cras dolor','2023-01-04','2023-01-27',88),(78,'nunc id','Curae Phasellus ornare.','2023-01-12','2023-01-26',83),(79,'Duis cursus,','Sed eu nibh','2023-01-06','2023-01-22',88),(80,'Nullam velit','pellentesque, tellus sem','2023-01-07','2023-01-19',89),(81,'volutpat ornare,','massa lobortis ultrices.','2023-01-06','2023-01-28',52),(82,'enim non','Duis mi enim,','2023-01-04','2023-01-26',53),(83,'arcu. Sed','eleifend non, dapibus','2023-01-09','2023-01-26',88),(84,'sociis natoque','convallis in, cursus','2023-01-12','2023-01-22',44),(85,'ultrices posuere','Sed malesuada augue','2023-01-13','2023-01-20',54),(86,'sem. Pellentesque','vehicula. Pellentesque tincidunt','2023-01-03','2023-01-19',25),(87,'ligula eu','adipiscing lobortis risus.','2023-01-04','2023-01-26',38),(88,'neque. Morbi','tincidunt aliquam arcu.','2023-01-04','2023-01-23',37),(89,'mi, ac','eu turpis. Nulla','2023-01-11','2023-01-18',97),(90,'Phasellus dapibus','imperdiet non, vestibulum','2023-01-10','2023-01-20',78),(91,'amet risus.','lobortis tellus justo','2023-01-03','2023-01-28',56),(92,'tempor augue','egestas. Fusce aliquet','2023-01-10','2023-01-20',72),(93,'molestie dapibus','ac orci. Ut','2023-01-07','2023-01-25',68),(94,'nibh lacinia','Aliquam vulputate ullamcorper','2023-01-11','2023-01-25',78),(95,'fames ac','Sed eu nibh','2023-01-11','2023-01-30',69),(96,'faucibus ut,','Aliquam ornare, libero','2023-01-13','2023-01-19',23),(97,'purus, accumsan','iaculis aliquet diam.','2023-01-15','2023-01-30',55),(98,'Nam nulla','In nec orci.','2023-01-04','2023-01-25',5),(99,'Aliquam adipiscing','vitae, orci. Phasellus','2023-01-16','2023-01-23',64),(100,'ridiculus mus.','iaculis nec, eleifend','2023-01-03','2023-01-28',57),(101,'blandit enim','porttitor tellus non','2023-01-17','2023-01-27',9),(102,'quis massa.','vehicula risus. Nulla','2023-01-08','2023-01-20',12),(103,'aliquet magna','In at pede.','2023-01-17','2023-01-24',61),(104,'sapien. Aenean','Etiam bibendum fermentum','2023-01-08','2023-01-30',36),(105,'scelerisque scelerisque','Phasellus dolor elit,','2023-01-06','2023-01-22',46),(106,'mi eleifend','aliquet nec, imperdiet','2023-01-03','2023-01-29',96),(107,'a nunc.','consectetuer, cursus et,','2023-01-06','2023-01-20',90),(108,'blandit. Nam','magna sed dui.','2023-01-12','2023-01-30',53),(109,'ac mi','orci. Ut semper','2023-01-16','2023-01-23',14),(110,'vitae, orci.','id enim. Curabitur','2023-01-07','2023-01-20',94),(111,'diam dictum','Lorem ipsum dolor','2023-01-14','2023-01-24',6),(112,'mi. Duis','ligula tortor, dictum','2023-01-15','2023-01-25',84),(113,'ut ipsum','consequat purus. Maecenas','2023-01-15','2023-01-23',71),(114,'urna, nec','amet, consectetuer adipiscing','2023-01-17','2023-01-31',27),(115,'nunc. Quisque','eu elit. Nulla','2023-01-17','2023-01-28',86),(116,'nunc, ullamcorper','ligula. Aliquam erat','2023-01-07','2023-01-22',98),(117,'mi tempor','vitae mauris sit','2023-01-06','2023-01-19',84),(118,'Vivamus nibh','porttitor interdum. Sed','2023-01-06','2023-01-26',69),(119,'interdum enim','nibh. Phasellus nulla.','2023-01-08','2023-01-19',18),(120,'sapien. Nunc','nec, leo. Morbi','2023-01-14','2023-01-27',84);
/*!40000 ALTER TABLE `Task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Team`
--

DROP TABLE IF EXISTS `Team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Team` (
  `team_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `fk_dept_id` int NOT NULL,
  PRIMARY KEY (`team_id`,`fk_dept_id`),
  KEY `fk_team_idx` (`fk_dept_id`),
  CONSTRAINT `fk_team` FOREIGN KEY (`fk_dept_id`) REFERENCES `Department` (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Team`
--

LOCK TABLES `Team` WRITE;
/*!40000 ALTER TABLE `Team` DISABLE KEYS */;
INSERT INTO `Team` VALUES (1,'Global Capital Group','Elite Investment Advisors',1),(2,'Brand Architects',' Market Masters',2),(3,'Enterprise Innovators',' Digital Visionaries',4),(4,'Strategic Solutions Group',' Sales Summit',5),(5,'Service Savants',' Customer Care Council',6),(6,'Tech Titans',' Information Pioneers',21),(7,'Revenue Builders',' Growth Gurus',22),(8,'Corporate Counselors',' Compliance Champions',24),(9,'Lead Generators',' Market Movers',25),(10,'Wealth Managers',' Financial Futurists',26),(11,'Influence Inc.',' Brand Builders',27),(12,'Innovation Insurgents',' Technology Titans',29),(13,'Legal Eagles',' Regulatory Risk-Takers',32),(14,'Ad Architects',' Campaign Captains',34),(15,'Support Superstars',' Customer Experience Council',36),(16,'Product Innovators',' Science Strategists',38),(17,'Operations Oracle',' Performance Pioneers',39),(18,'Financial Wizards','A group of highly skilled financial analysts',1),(19,'Brand Ambassadors','A creative and innovative team of marketing professionals',2),(20,'Tech Savants','A group of technology expert',4),(21,'Service Champions','A team of customer service professionals ',6),(22,'Code Crusaders','A team of software developers and programmers ',21),(23,'Compliance Counselors','A team of legal experts',24),(24,'Revenue Builders','A team of sales professionals ',25),(25,'Campaign Captains','A team of marketing specialists ',27),(26,'Content Creators','A team of content creators',34),(27,'Support Superstars','A team of customer service professionals ',36),(28,'Performance Pioneers','A team of operations professionals',39);
/*!40000 ALTER TABLE `Team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Team_Project_Bridge`
--

DROP TABLE IF EXISTS `Team_Project_Bridge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Team_Project_Bridge` (
  `id` int NOT NULL,
  `fk_team_id` int NOT NULL,
  `fk_project_id` int NOT NULL,
  PRIMARY KEY (`id`,`fk_team_id`,`fk_project_id`),
  KEY `fk_Team_Project_Bridge_Team1_idx` (`fk_team_id`),
  KEY `fk_Team_Project_Bridge_Project1_idx` (`fk_project_id`),
  CONSTRAINT `fk_Team_Project_Bridge_Project1` FOREIGN KEY (`fk_project_id`) REFERENCES `Project` (`project_id`),
  CONSTRAINT `fk_Team_Project_Bridge_Team1` FOREIGN KEY (`fk_team_id`) REFERENCES `Team` (`team_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Team_Project_Bridge`
--

LOCK TABLES `Team_Project_Bridge` WRITE;
/*!40000 ALTER TABLE `Team_Project_Bridge` DISABLE KEYS */;
INSERT INTO `Team_Project_Bridge` VALUES (7,1,31),(135,1,34),(24,2,43),(38,2,100),(81,2,12),(84,2,43),(95,2,57),(112,2,64),(117,2,100),(127,2,18),(29,3,12),(31,3,12),(94,3,82),(34,4,64),(50,4,44),(97,4,34),(114,4,78),(119,4,99),(125,4,6),(134,4,5),(145,4,87),(27,5,29),(28,5,55),(61,5,6),(87,5,72),(124,5,5),(137,5,5),(141,5,65),(9,6,69),(54,6,59),(77,6,40),(36,7,56),(43,7,34),(46,7,80),(123,7,97),(5,8,93),(21,8,44),(57,8,87),(69,8,69),(82,8,34),(111,8,45),(122,8,22),(22,9,88),(53,9,62),(146,9,84),(2,10,39),(6,10,60),(10,10,10),(60,10,88),(88,10,93),(120,10,69),(41,11,94),(78,11,37),(126,11,86),(133,11,74),(20,12,86),(23,12,74),(52,12,50),(66,12,2),(113,12,88),(132,12,37),(44,13,43),(93,13,33),(138,13,82),(49,14,85),(55,14,96),(104,14,28),(106,14,84),(108,14,39),(116,14,1),(147,14,84),(71,15,37),(86,15,76),(100,15,68),(144,15,52),(19,16,3),(74,16,82),(96,16,58),(101,16,2),(1,17,72),(59,17,95),(62,17,32),(92,17,51),(105,17,14),(115,17,97),(128,17,42),(142,17,25),(14,18,19),(25,18,71),(107,18,54),(143,18,67),(47,19,98),(58,19,67),(68,19,70),(83,19,88),(4,20,52),(30,20,85),(63,20,86),(67,20,21),(79,20,80),(99,20,89),(121,20,12),(130,20,67),(139,20,92),(80,21,72),(91,21,22),(102,21,88),(109,21,43),(42,22,39),(48,22,75),(150,22,47),(3,23,57),(16,23,45),(35,23,91),(51,23,55),(56,23,86),(64,23,60),(17,24,59),(26,24,73),(32,24,33),(33,24,41),(89,24,7),(90,24,91),(98,24,40),(103,24,10),(136,24,69),(11,25,34),(37,25,40),(39,25,41),(129,25,84),(131,25,64),(148,25,46),(149,25,34),(8,26,31),(13,26,20),(15,26,40),(40,26,59),(72,26,99),(12,27,5),(65,27,16),(70,27,62),(76,27,55),(85,27,35),(110,27,31),(118,27,41),(18,28,7),(45,28,46),(73,28,67),(75,28,54),(140,28,99);
/*!40000 ALTER TABLE `Team_Project_Bridge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TeamBudget`
--

DROP TABLE IF EXISTS `TeamBudget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TeamBudget` (
  `budget_id` int NOT NULL AUTO_INCREMENT,
  `first_day_of_qtr` date NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `qtr_number` tinyint DEFAULT NULL,
  `team_id` int NOT NULL,
  PRIMARY KEY (`budget_id`),
  UNIQUE KEY `budget_id_UNIQUE` (`budget_id`),
  KEY `team_id` (`team_id`),
  CONSTRAINT `budget_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `Team` (`team_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TeamBudget`
--

LOCK TABLES `TeamBudget` WRITE;
/*!40000 ALTER TABLE `TeamBudget` DISABLE KEYS */;
INSERT INTO `TeamBudget` VALUES (1,'2022-01-01',420.00,1,1),(2,'2022-01-01',630.00,1,18),(3,'2022-01-01',270.00,1,2),(4,'2022-01-01',630.00,1,19),(5,'2022-01-01',86.25,1,3),(6,'2022-01-01',258.75,1,20),(7,'2022-01-01',4535.00,1,4),(8,'2022-01-01',40.00,1,5),(9,'2022-01-01',60.00,1,21),(10,'2022-01-01',105.00,1,6),(11,'2022-01-01',945.00,1,22),(12,'2022-01-01',1300.00,1,7),(13,'2022-01-01',875.00,1,8),(14,'2022-01-01',875.00,1,23),(15,'2022-01-01',1152.00,1,9),(16,'2022-01-01',1408.00,1,7),(17,'2022-01-01',1300.00,1,10),(18,'2022-01-01',506.00,1,11),(19,'2022-01-01',759.00,1,25),(20,'2022-01-01',1080.00,1,12),(21,'2022-01-01',1050.00,1,13),(22,'2022-01-01',2550.00,1,14),(23,'2022-01-01',450.00,1,26),(24,'2022-01-01',600.00,1,15),(25,'2022-01-01',1400.00,1,15),(26,'2022-01-01',1050.00,1,16),(27,'2022-01-01',750.00,1,17),(28,'2022-01-01',750.00,1,28);
/*!40000 ALTER TABLE `TeamBudget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Vendor`
--

DROP TABLE IF EXISTS `Vendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Vendor` (
  `vendor_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  PRIMARY KEY (`vendor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Vendor`
--

LOCK TABLES `Vendor` WRITE;
/*!40000 ALTER TABLE `Vendor` DISABLE KEYS */;
INSERT INTO `Vendor` VALUES (1,'Plai','plai@plai.com','845-555-5555'),(2,'AIsoft','aisoft@aisoft.com','555-123-4567'),(3,'SmartBot','smartbot@smartbot.com','555-987-6543'),(4,'NeuralMind','neuralmind@neuralmind.com','555-555-5555'),(5,'InnovateAI','innovateai@innovateai.com','555-111-2222'),(6,'CognitiveMinds','cognitiveminds@cognitiveminds.com','555-444-5555'),(7,'RoboLogic','robologic@robologic.com','555-777-8888'),(8,'Thinkbot','thinkbot@thinkbot.com','555-222-3333'),(9,'Intellify','intellify@intellify.com','555-666-7777'),(10,'Brainwave','brainwave@brainwave.com','555-888-9999');
/*!40000 ALTER TABLE `Vendor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'ai_vendor_management'
--

--
-- Dumping routines for database 'ai_vendor_management'
--
/*!50003 DROP PROCEDURE IF EXISTS `get_services_by_department_and_team` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_services_by_department_and_team`(IN department_name VARCHAR(255), IN team_name VARCHAR(255))
BEGIN
  SELECT distinct n.network_id NetworkID, n.name NetworkName, dept_name as DepartmentName, t.name as TeamName, service_id as ServiceID,s.category ServiceCategory ,s.name ServiceName

from Network n
join Department d on d.network_id = n.network_id
join DepartmentBudget db on db.fk_dept_id = d.dept_id
join Team t on t.fk_dept_id = d.dept_id
join Team_Project_bridge pb on t.team_ID = pb.fk_team_id
join Project p on p.project_id = pb.fk_project_id
join Task ta on p.project_id = ta.fk_project_id
join ServiceUsage su on su.fk_task_id = ta.fk_project_id
join Service s on s.service_id = su.fk_service_id
join Vendor v on v.vendor_id = s.fk_vendor_id

where d.dept_name =department_name AND (team_name IS NULL OR t.name = team_name)
Order by 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_employee_review` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_employee_review`(IN empID int, IN rating tinyint, IN vendorID int, IN userdescription varchar(255))
BEGIN
  insert into Review values (null, rating, userdescription, vendorID, empID);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `averageprojectcostreport`
--

/*!50001 DROP VIEW IF EXISTS `averageprojectcostreport`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `averageprojectcostreport` AS select `s`.`DepartmentName` AS `DepartmentName`,avg(`s`.`CostperProject`) AS `AvgCostPerProject` from (select `d`.`dept_id` AS `dept_id`,`d`.`dept_name` AS `DepartmentName`,`db`.`amount` AS `DepartmentBudget`,`t`.`team_id` AS `team_id`,`t`.`name` AS `name`,`p`.`project_id` AS `project_id`,`p`.`name` AS `ProjName`,sum(`su`.`totalcost`) AS `CostperProject` from ((((((`department` `d` join `departmentbudget` `db` on((`db`.`fk_dept_id` = `d`.`dept_id`))) join `team` `t` on((`t`.`fk_dept_id` = `d`.`dept_id`))) join `team_project_bridge` `pb` on((`t`.`team_id` = `pb`.`fk_team_id`))) join `project` `p` on((`p`.`project_id` = `pb`.`fk_project_id`))) join `task` `ta` on((`p`.`project_id` = `ta`.`fk_project_id`))) join `serviceusage` `su` on((`su`.`fk_task_id` = `ta`.`fk_project_id`))) group by `d`.`dept_id`,`d`.`dept_name`,`db`.`amount`,`t`.`team_id`,`t`.`name`,`p`.`project_id`,`p`.`name`) `s` group by `s`.`DepartmentName` order by avg(`s`.`CostperProject`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `discountoutreach`
--

/*!50001 DROP VIEW IF EXISTS `discountoutreach`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `discountoutreach` AS select `v`.`vendor_id` AS `vendor_id`,`v`.`name` AS `VendorName`,`v`.`email` AS `email`,`v`.`phone_number` AS `phone_number`,`s`.`price` AS `price`,`s`.`name` AS `ServiceName`,count(0) AS `count(*)` from ((`vendor` `v` join `service` `s` on((`s`.`fk_vendor_id` = `v`.`vendor_id`))) join `serviceusage` `su` on((`su`.`fk_service_id` = `s`.`service_id`))) group by `v`.`vendor_id`,`v`.`name`,`v`.`email`,`v`.`phone_number`,`s`.`price`,`s`.`name` order by count(0) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `overallexpensereport`
--

/*!50001 DROP VIEW IF EXISTS `overallexpensereport`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `overallexpensereport` AS select `n`.`network_id` AS `NetworkID`,`n`.`name` AS `NetworkName`,`d`.`dept_name` AS `DepartmentName`,`db`.`amount` AS `DepartmentBudget`,sum(`su`.`totalcost`) AS `DepartmentExpense`,(sum(`su`.`totalcost`) / `db`.`amount`) AS `PercentofBudgetUsed` from (((((((`network` `n` join `department` `d` on((`d`.`network_id` = `n`.`network_id`))) join `departmentbudget` `db` on((`db`.`fk_dept_id` = `d`.`dept_id`))) join `team` `t` on((`t`.`fk_dept_id` = `d`.`dept_id`))) join `team_project_bridge` `pb` on((`t`.`team_id` = `pb`.`fk_team_id`))) join `project` `p` on((`p`.`project_id` = `pb`.`fk_project_id`))) join `task` `ta` on((`p`.`project_id` = `ta`.`fk_project_id`))) join `serviceusage` `su` on((`su`.`fk_task_id` = `ta`.`fk_project_id`))) group by `n`.`network_id`,`n`.`name`,`d`.`dept_name`,`db`.`amount` order by `n`.`network_id` */;
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

-- Dump completed on 2023-04-28 14:14:20
