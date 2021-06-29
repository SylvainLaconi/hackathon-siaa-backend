CREATE DATABASE  IF NOT EXISTS `fiverr_community` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `fiverr_community`;
-- MySQL dump 10.13  Distrib 8.0.24, for macos11 (x86_64)
--
-- Host: localhost    Database: fiverr_community
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `community`
--

DROP TABLE IF EXISTS `community`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `community` (
  `id` int NOT NULL AUTO_INCREMENT,
  `community_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `community`
--

LOCK TABLES `community` WRITE;
/*!40000 ALTER TABLE `community` DISABLE KEYS */;
INSERT INTO `community` VALUES (1,'Web developpement'),(2,'Logo design'),(3,'E-Commerce management'),(4,'Video editing'),(5,'Content marketing'),(6,'Data analysis'),(7,'Photography'),(8,'UI UX Design');
/*!40000 ALTER TABLE `community` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(45) DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `content` longtext,
  `date` date DEFAULT NULL,
  `location` varchar(45) DEFAULT NULL,
  `community_id` int NOT NULL,
  `user_id` int NOT NULL,
  `post_category_id` int NOT NULL,
  PRIMARY KEY (`id`,`community_id`,`user_id`,`post_category_id`),
  KEY `fk_post_community_idx` (`community_id`),
  KEY `fk_post_user1_idx` (`user_id`),
  KEY `fk_post_post_category1_idx` (`post_category_id`),
  CONSTRAINT `fk_post_community` FOREIGN KEY (`community_id`) REFERENCES `community` (`id`),
  CONSTRAINT `fk_post_post_category1` FOREIGN KEY (`post_category_id`) REFERENCES `post_category` (`id`),
  CONSTRAINT `fk_post_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (1,'React conference','https://www.mon-evenement.net/wp-content/uploads/2017/05/conference.jpg','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum','2021-06-30','Paris',1,1,1),(2,'Photo apero','https://madeinfrancebox.com/wp-content/uploads/2019/07/ap%C3%A9ro-fete-des-voisins-coupons-%C3%A0-imprimer-810x540-810x480.jpg','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum','2021-07-15','London',7,3,1),(3,'Workshop data','https://www.50a.fr/img/upload/devis-workshop.jpg','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum','2021-07-10','Madrid',5,2,1),(4,'MacBook Pro 15\'\'','https://d1fmx1rbmqrxrr.cloudfront.net/cnet/i/edit/2017/08/apple-macbook-pro-touch-bar-15-770.jpg','890 euros','2021-06-28','Rome',1,1,2),(5,'Screen ASUS VP248H','https://images-na.ssl-images-amazon.com/images/I/71YJWf7-OQL._AC_SX425_.jpg','200 euros','2021-07-01','Paris',1,2,2),(6,'Canon EOS 4000D','https://www.cdiscount.com/pdt2/0/0/3/1/300x300/can3011c003/rw/canon-eos-4000d-18-megapixels-wi-fi-objectif-e.jpg','590 euros','2021-06-10','Zurich',4,3,2),(7,'What\'s NOT new in React 18','https://cdn.changelog.com/uploads/news_items/Z31e/large.png?v=63791156480','https://changelog.com/topic/react','2021-06-01','San Francisco',1,1,3),(8,'Data analysis on lagundi as COVID-19 ...','https://mb.com.ph/wp-content/uploads/2021/06/14326.jpeg','https://mb.com.ph/2021/06/28/data-analysis-on-lagundi-as-covid-19-therapeutic-to-be-completed-by-end-of-june-dost-chief/','2021-06-30','London',6,2,3),(9,'Sony Xperia 1 III pre-orders open in ...','https://fdn.gsmarena.com/imgroot/news/21/04/sony-xperia-1iii-5iii-offic/-1200/gsmarena_002.jpg','https://www.gsmarena.com/newscomm-49735.php','2021-06-20','Paris',7,3,3),(10,'I have a big bug ...',NULL,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum','2021-06-28','Madrid',1,1,4),(11,'Error with Python',NULL,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum','2021-06-27','Bern',6,2,4),(12,'Looking for mission (urgent)',NULL,'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum','2021-06-26','Berlin',5,3,4),(13,'Learn Angular.js','https://www.softfluent.fr/wp-content/uploads/2019/10/angularjs.png','30h','2021-06-28',NULL,1,1,5),(14,'Learn Storm for Big Data','https://storm.apache.org/images/logo.png','20h','2021-06-28',NULL,5,2,5),(15,'Learn Photoshop','https://upload.wikimedia.org/wikipedia/commons/thumb/a/af/Adobe_Photoshop_CC_icon.svg/1200px-Adobe_Photoshop_CC_icon.svg.png','10h','2021-06-28',NULL,7,3,5),(17,'Wild expo','https://c.ndtvimg.com/2021-01/c8pe23q_wildlife-photographer-generic-animal-photographer-generic_625x300_23_January_21.jpg','Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum','2021-08-31','Nairobi',7,3,1),(18,'Learn HTML/CSS for beginners','https://1.bp.blogspot.com/--p330qFaNuM/YCFQVL-v7iI/AAAAAAAABMg/NmtcjzcbmFoVyzniqHZ2OSr2oe_zyEZbwCLcBGAsYHQ/s1200-rw/HTML5-CSS3.webp','12h','2021-08-12','Paris',1,1,5);
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_category`
--

DROP TABLE IF EXISTS `post_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_category` (
  `id` int NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_category`
--

LOCK TABLES `post_category` WRITE;
/*!40000 ALTER TABLE `post_category` DISABLE KEYS */;
INSERT INTO `post_category` VALUES (1,'Events'),(2,'Good deals'),(3,'Tech actualities'),(4,'Forum'),(5,'Trainings');
/*!40000 ALTER TABLE `post_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(45) DEFAULT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  `job` varchar(45) DEFAULT NULL,
  `user_picture` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'John','Doe','Web Developer','https://www.tekoway.com/wp-content/uploads/2018/12/John-Doe.jpg'),(2,'Mary','Green','Photographer','https://images.pexels.com/photos/38554/girl-people-landscape-sun-38554.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),(3,'Benjamin','Wilson','Data Analyst','https://us.123rf.com/450wm/zdenkam/zdenkam1602/zdenkam160200139/52267975-young-black-business-man-posing-on-white-background.jpg?ver=6');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_has_community`
--

DROP TABLE IF EXISTS `user_has_community`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_has_community` (
  `user_id` int NOT NULL,
  `community_id` int NOT NULL,
  PRIMARY KEY (`user_id`,`community_id`),
  KEY `fk_user_has_community_community1_idx` (`community_id`),
  KEY `fk_user_has_community_user1_idx` (`user_id`),
  CONSTRAINT `fk_user_has_community_community1` FOREIGN KEY (`community_id`) REFERENCES `community` (`id`),
  CONSTRAINT `fk_user_has_community_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_has_community`
--

LOCK TABLES `user_has_community` WRITE;
/*!40000 ALTER TABLE `user_has_community` DISABLE KEYS */;
INSERT INTO `user_has_community` VALUES (1,1),(2,2),(1,3),(2,4),(3,5),(3,6),(2,7);
/*!40000 ALTER TABLE `user_has_community` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-29  9:27:14
