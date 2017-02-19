-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: thewall
-- ------------------------------------------------------
-- Server version	5.5.49-log

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
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `pw_hash` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Justin','Chang','jqchang@gmail.com','$2b$12$p5OWgPRhnf/5IScDJ2Qc9O2AcrTfATgt63/PWd2lU/5MEGrpskRmC','2017-02-12 14:23:19','2017-02-12 14:23:19'),(2,'New','User','newuser@gmail.com','$2b$12$TSzVcoJc7H2xCC/pBarumesp7TslTq/2tYGzTNvYf/Ekp/RcGq7l.','2017-02-12 14:45:10','2017-02-12 14:45:10'),(3,'Sterling','Archer','sarcher@cia.gov','$2b$12$KjBdHGz6bTkxm3rMVb0wXe3TOYgXz8vTzXu6IvOzkveP6xd/7lhTu','2017-02-12 15:00:14','2017-02-12 15:00:14'),(4,'Cyril','Figgis','cfiggis@figgisagency.com','$2b$12$aeFQNd83QthHCgKl1vLU9uwDXsbiBnM4EQ85SKuCNMADXdOt7n4ke','2017-02-12 15:16:40','2017-02-12 15:16:40'),(5,'Olaf','Olafson','olaf@valhalla.com','$2b$12$LfyhDRUvv.MSK2qz6RyBbuq8ohV6D9Dh9hxNr.qmuRwVtS6RYnEN2','2017-02-12 16:16:05','2017-02-12 16:16:05'),(6,'asdfasf','asdfasdfa','asdf@asdf.com','$2b$12$lSmxyVOhQhKwImb4p.RO3uHZyb8KA8zDG/.r2DrOal5LzEKhr1iNK','2017-02-13 11:22:06','2017-02-13 11:22:06'),(7,'User','One','userone@user.com','$2b$12$AdFJAtLUsiVzMFjteYrpquMUZuJgg9adYa.c3fGCRSZT.PJeSZlZS','2017-02-13 12:33:22','2017-02-13 12:33:22');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-02-13 14:18:16
