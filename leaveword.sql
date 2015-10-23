# MySQL-Front 4.2  (Build 2.53)

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE */;
/*!40101 SET SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES */;
/*!40103 SET SQL_NOTES='ON' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;


# Host: localhost    Database: leaveword
# ------------------------------------------------------
# Server version 6.0.2-alpha-community-nt-debug

DROP DATABASE IF EXISTS `leaveword`;
CREATE DATABASE `leaveword` /*!40100 DEFAULT CHARACTER SET gb2312 */;
USE `leaveword`;

#
# Table structure for table popedom
#

CREATE TABLE `popedom` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `des` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

#
# Dumping data for table popedom
#
LOCK TABLES `popedom` WRITE;
/*!40000 ALTER TABLE `popedom` DISABLE KEYS */;

INSERT INTO `popedom` VALUES (1,'浏览留言','浏览留言内容');
INSERT INTO `popedom` VALUES (2,'发表留言','发布留言');
INSERT INTO `popedom` VALUES (3,'删除留言','删除留言内容');
/*!40000 ALTER TABLE `popedom` ENABLE KEYS */;
UNLOCK TABLES;

#
# Table structure for table topic
#

CREATE TABLE `topic` (
  `Id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '0',
  `createTime` datetime NOT NULL,
  `Author` varchar(20) NOT NULL,
  `qq` varchar(20) DEFAULT NULL,
  `email` varchar(20) NOT NULL,
  `content` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=gb2312;

#
# Dumping data for table topic
#
LOCK TABLES `topic` WRITE;
/*!40000 ALTER TABLE `topic` DISABLE KEYS */;

INSERT INTO `topic` VALUES (7,'5月17日发留言1','2010-05-18 16:14:38','叶德华','546150360','546150360@qq.com','5月17日发留言1');
INSERT INTO `topic` VALUES (8,'5月17日发留言2','2010-05-18 16:14:55','叶德华','546150360','546150360@qq.com','5月17日发留言2');
INSERT INTO `topic` VALUES (9,'5月17日发留言3','2010-05-18 16:15:03','叶德华','546150360','546150360@qq.com','5月17日发留言3');
INSERT INTO `topic` VALUES (10,'5月17日发留言4','2010-05-18 16:15:07','叶德华','546150360','546150360@qq.com','5月17日发留言4');
/*!40000 ALTER TABLE `topic` ENABLE KEYS */;
UNLOCK TABLES;

#
# Table structure for table user
#

CREATE TABLE `user` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `pwd` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

#
# Dumping data for table user
#
LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;

INSERT INTO `user` VALUES (1,'janson','janson');
INSERT INTO `user` VALUES (2,'dehua','dehua');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

#
# Table structure for table user_pepodom
#

CREATE TABLE `user_pepodom` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `popedomid` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `user_id` (`userid`),
  KEY `popedom_id` (`popedomid`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=ujis;

#
# Dumping data for table user_pepodom
#
LOCK TABLES `user_pepodom` WRITE;
/*!40000 ALTER TABLE `user_pepodom` DISABLE KEYS */;

INSERT INTO `user_pepodom` VALUES (84,1,1);
INSERT INTO `user_pepodom` VALUES (85,1,2);
INSERT INTO `user_pepodom` VALUES (86,1,3);
INSERT INTO `user_pepodom` VALUES (87,2,1);
INSERT INTO `user_pepodom` VALUES (88,2,2);
/*!40000 ALTER TABLE `user_pepodom` ENABLE KEYS */;
UNLOCK TABLES;

#
#  Foreign keys for table user_pepodom
#

ALTER TABLE `user_pepodom`
  ADD CONSTRAINT `popedom_id` FOREIGN KEY (`popedomid`) REFERENCES `popedom` (`Id`),
  ADD CONSTRAINT `user_id` FOREIGN KEY (`userid`) REFERENCES `user` (`Id`)
;


/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
