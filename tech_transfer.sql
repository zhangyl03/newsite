-- MySQL dump 10.13  Distrib 5.7.13, for Linux (i686)
--
-- Host: localhost    Database: tech_rd_lv_db
-- ------------------------------------------------------
-- Server version	5.7.13-0ubuntu0.16.04.2

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_726533c1_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_726533c1_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_3b2018a8_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_4bafbada_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add question',7,'add_question'),(20,'Can change question',7,'change_question'),(21,'Can delete question',7,'delete_question'),(22,'Can add choice',8,'add_choice'),(23,'Can change choice',8,'change_choice'),(24,'Can delete choice',8,'delete_choice'),(37,'Can add user',13,'add_user'),(38,'Can change user',13,'change_user'),(39,'Can delete user',13,'delete_user'),(40,'Can add exam',14,'add_exam'),(41,'Can change exam',14,'change_exam'),(42,'Can delete exam',14,'delete_exam'),(43,'Can add grades',15,'add_grades'),(44,'Can change grades',15,'change_grades'),(45,'Can delete grades',15,'delete_grades');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$20000$VvmiyGW0BdVZ$kc7JjZZ8+/7AaTvcliHXBHRGWEINN+TYxvqt7vYENH0=','2016-08-30 06:02:35.281649',1,'admin','','','zhangyl@xmu.edu.cn',1,1,'2016-08-04 07:54:04.290039');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_7747df61_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_7747df61_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_51c058b8_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_13d51494_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_perm_permission_id_13d51494_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_690b0c04_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_417f9a8d_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_6b62ed0d_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin__content_type_id_417f9a8d_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_6b62ed0d_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2016-08-04 07:56:42.346763','1','What is your gender?',1,'',7,1),(2,'2016-08-04 07:58:00.735064','2','How much do you earn?',1,'',7,1),(3,'2016-08-12 05:50:38.445798','3','Is it interesting?',1,'',7,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_3907e25d_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(8,'polls','choice'),(14,'polls','exam'),(15,'polls','grades'),(7,'polls','question'),(13,'polls','user'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2016-08-04 06:49:14.873055'),(2,'auth','0001_initial','2016-08-04 06:49:27.382463'),(3,'admin','0001_initial','2016-08-04 06:49:30.142082'),(4,'contenttypes','0002_remove_content_type_name','2016-08-04 06:49:31.744547'),(5,'auth','0002_alter_permission_name_max_length','2016-08-04 06:49:31.968451'),(6,'auth','0003_alter_user_email_max_length','2016-08-04 06:49:32.192462'),(7,'auth','0004_alter_user_username_opts','2016-08-04 06:49:32.284582'),(8,'auth','0005_alter_user_last_login_null','2016-08-04 06:49:33.443111'),(9,'auth','0006_require_contenttypes_0002','2016-08-04 06:49:33.512276'),(10,'polls','0001_initial','2016-08-04 06:49:36.469437'),(11,'sessions','0001_initial','2016-08-04 06:49:37.185922'),(12,'polls','0002_opinion','2016-08-28 13:46:22.340638'),(13,'polls','0003_auto_20160828_1430','2016-08-28 14:30:50.161762'),(14,'polls','0004_auto_20160830_0711','2016-08-30 07:11:53.945579'),(15,'polls','0005_auto_20160830_0714','2016-08-30 07:14:35.600023'),(16,'polls','0006_auto_20160904_1237','2016-09-04 12:37:49.572075');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('7xsccqisp8lfuve3lyrswb6ff4kxzi5p','ZjI1ZmQxODM2ZjU0ZmQ2ZDE4Y2E5NzA1YzY4ODRkODViNTIwYjYxZTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiI2YmJjZTk1OTZhN2NmYjVhZTQ1ZDZhMzMyMzkwMGJiYzdjOTI1OWM2In0=','2016-09-13 06:02:35.348628'),('d92l01txi0to2angh4i3sf0t15bnfco2','YTU5YmY1NGEzMDQxYWUwYjM5ZTA0MDY4NzZmYWRhODJlMzliMDBlMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjZiYmNlOTU5NmE3Y2ZiNWFlNDVkNmEzMzIzOTAwYmJjN2M5MjU5YzYiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=','2016-08-19 12:37:45.034291'),('zh6j268vudquddqeqme2u64fm79s8mmn','NGIxNmQ4YzcyYjA0YWM3OWI5YjBiYzgzZGM0MGZlMjVkNjBjOGQ2Nzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2YmJjZTk1OTZhN2NmYjVhZTQ1ZDZhMzMyMzkwMGJiYzdjOTI1OWM2In0=','2016-08-18 07:55:08.422766');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `polls_choice`
--

DROP TABLE IF EXISTS `polls_choice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `polls_choice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `choice_text` varchar(200) NOT NULL,
  `votes` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `polls_choice_7aa0f6ee` (`question_id`),
  CONSTRAINT `polls_choice_question_id_71ab4406_fk_polls_question_id` FOREIGN KEY (`question_id`) REFERENCES `polls_question` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `polls_choice`
--

LOCK TABLES `polls_choice` WRITE;
/*!40000 ALTER TABLE `polls_choice` DISABLE KEYS */;
INSERT INTO `polls_choice` VALUES (1,'Male',11,1),(2,'Female',1,1),(3,'None of the above',0,1),(4,'< 5000',1,2),(5,'5000-15000',1,2),(6,'> 15000',0,2),(7,'Yes.',2,3),(8,'No.',0,3),(9,'It\'s hard to say.',0,3);
/*!40000 ALTER TABLE `polls_choice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `polls_exam`
--

DROP TABLE IF EXISTS `polls_exam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `polls_exam` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `exam_text` varchar(200) NOT NULL,
  `grade` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `polls_exam`
--

LOCK TABLES `polls_exam` WRITE;
/*!40000 ALTER TABLE `polls_exam` DISABLE KEYS */;
INSERT INTO `polls_exam` VALUES (1,'是否发现或获得了可作为该项技术研发基础的基本原理',1),(2,'基本科学原理是否分析描述清晰',1),(3,'是否通过别人或自己的研究，证明基本原理是有效的',1),(4,'是否提出了应用该基本原理的应用设想',2),(5,'是否初步明确了该技术最终的主要功能要求',2),(6,'是否初步明确了该技术最终的关键性能指标要求',2),(7,'是否初步明确了该技术最终的主要使用环境和接口要求',2),(8,'是否对该新技术在使用环境中可能达到的关键功能和性能进行了初步预测和评估',2),(9,'是否确定了该技术的实现方案',3),(10,'是否完成了试验用的样品或装置设计',3),(11,'是否研制了试验用的样品或装置',3),(12,'是否通过分析、建模和仿真的手段对该技术方案、试验用的样品或装置可能达到的主要性能进行了预测',3),(13,'预测结果是否与最终的要求相符合',3),(14,'是否制定了试验方案并明确了试验环境和接口条件',3),(15,'是否具备了试验设施和试验保障设备',3),(16,'是否在实验室环境中对该技术的关键功能和性能进行了试验',3),(17,'是否完成了试验结果分析',3),(18,'试验结果是否与预测结果一致',3),(19,'通过上述数学分析和/或试验的方法，是否说明了该技术将来达到预期的功能和性能要求的可行性',3),(20,'是否在技术方案基础上完成了部件或单机原理样机设计',4),(21,'是否研制了该技术的部件或单机原理样机',4),(22,'是否在试验前对该技术在集成后的原理样机中的性能进行了分析预测',4),(23,'预测结果是否与最终的要求相符合',4),(24,'是否制定了原理样机的实验室试验方案并明确了试验环境和接口条件',4),(25,'是否具备了用于原理样机试验的试验设施和试验保障设备',4),(26,'是否在实验室环境中完成了对该技术原理样机的标志性试验',4),(27,'是否完成了试验结果分析',4),(28,'试验结果是否验证了该技术达到的性能与预测一致',4),(29,'是否确定了集成该技术的相关分系统和部件',5),(30,'是否完成了部件或分系统演示样机的设计',5),(31,'是否研制了部件或分系统演示样机',5),(32,'是否对该技术在演示样机中的性能进行了预测',5),(33,'性能预测结果是否与最终的要求相符合',5),(34,'是否制定了演示样机在演示环境下的试验方案',5),(35,'设备、保障设备、特殊试验设备是否可以支持在模拟环境和接口下的测试工作',5),(36,'模拟环境是否能体现实际使用环境重要特征',5),(37,'是否在该模拟环境中完成了对演示样机的标志性试验',5),(38,'是否完成了试验结果分析',5),(39,'试验结果是否验证了该技术达到的性能与预测一致',5),(40,'是否完成了包括多个分系统的原型样机设计',6),(41,'是否研制出了包括多个分系统的原型样机',6),(42,'该技术状态是否基本达到或者完全达到了最终产品的要求',6),(43,'是否对该技术在集成后的原型样机中的性能进行了测试',6),(44,'性能预测结果是否与最终的要求相符合',6),(45,'是否制订了原型样机在演示环境中的试验方案',6),(46,'模拟环境是否接近于实际使用环境的要求',6),(47,'设备、保障设备、特殊试验设备是否可以支持在模拟环境和接口下的演示试验工作',6),(48,'是否在模拟环境中完成了对原型样机的标志性演示验证试验',6),(49,'是否完成了试验结果分析',6),(50,'演示验证试验中该技术达到的性能是否与预测结果一致',6),(51,'是否完成了系统工程样机的设计',7),(52,'是否研制出了系统工程样机',7),(53,'该技术状态是否完全达到了最终产品的要求',7),(54,'是否对该技术在工程样机中的性能进行了预测',7),(55,'性能预测结果是否与最终的要求相一致',7),(56,'是否制订了工程样机在典型使用环境中的试验方案',7),(57,'设备、保障设备、特殊试验设备是否可以支持系统工程样机在典型使用环境中的试验',7),(58,'是否在典型使用环境中完成了对工程样机的标志性演示验证试验',7),(59,'是否完成了试验结果分析',7),(60,'演示验证试验中该技术达到的性能是否与预测一致',7),(61,'是否设计了系统级产品',8),(62,'通过分析，是否对产品中由该技术支持的功能和性能进行了预测',8),(63,'是否制造了系统级产品',8),(64,'是否完成了产品的全面测试和鉴定',8),(65,'测试和鉴定结果是否验证了对产品中由该技术支持的功能和性能分析预测的正确性',8),(66,'系统产品在使用环境中执行了任务',9),(67,'完成了系统级产品的性能分析',9),(68,'系统级产品的性能满足使用需求',9);
/*!40000 ALTER TABLE `polls_exam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `polls_grades`
--

DROP TABLE IF EXISTS `polls_grades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `polls_grades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tech_name` varchar(50) NOT NULL,
  `tech_type` varchar(50) NOT NULL,
  `grade` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `exam_item` varchar(68) NOT NULL,
  `tech_note` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `polls_grades_4f331e2f` (`author_id`),
  CONSTRAINT `polls_grades_author_id_74ab83c2_fk_polls_user_id` FOREIGN KEY (`author_id`) REFERENCES `polls_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `polls_grades`
--

LOCK TABLES `polls_grades` WRITE;
/*!40000 ALTER TABLE `polls_grades` DISABLE KEYS */;
INSERT INTO `polls_grades` VALUES (1,'[\'ttttt\']','[\'NengYuan\']',0,5,'','[\'dddaaa\']'),(2,'[\'some\']','[\'JiSuanJi\']',0,6,'','[\'dddddd\']'),(3,'[\'some\']','[\'JiSuanJi\']',0,7,'','[\'dddddd\']'),(4,'[\'some\']','[\'JiSuanJi\']',0,8,'','[\'dddddd\']'),(5,'[\'some\']','[\'JiSuanJi\']',0,9,'','[\'dddddd\']'),(6,'[\'some\']','[\'JiSuanJi\']',0,10,'','[\'dddddd\']'),(7,'[\'some\']','[\'JiSuanJi\']',0,11,'','[\'dddddd\']'),(8,'[\'some\']','[\'JiSuanJi\']',0,12,'','[\'dddddd\']'),(9,'[\'some\']','[\'JiSuanJi\']',0,13,'','[\'dddddd\']'),(10,'[\'some\']','[\'JiSuanJi\']',0,14,'','[\'dddddd\']'),(11,'[\'some\']','[\'JiSuanJi\']',0,15,'','[\'dddddd\']'),(12,'[]','[]',0,16,'','[]'),(13,'[\'dddd\']','[\'NengYuan\']',0,17,'','[\'adfdas\']'),(14,'[]','[]',0,18,'','[]');
/*!40000 ALTER TABLE `polls_grades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `polls_question`
--

DROP TABLE IF EXISTS `polls_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `polls_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_text` varchar(200) NOT NULL,
  `pub_date` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `polls_question`
--

LOCK TABLES `polls_question` WRITE;
/*!40000 ALTER TABLE `polls_question` DISABLE KEYS */;
INSERT INTO `polls_question` VALUES (1,'What is your gender?','2016-08-04 07:56:39.000000'),(2,'How much do you earn?','2016-08-04 07:57:35.000000'),(3,'Is it interesting?','2016-08-12 05:50:36.000000');
/*!40000 ALTER TABLE `polls_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `polls_user`
--

DROP TABLE IF EXISTS `polls_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `polls_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) NOT NULL,
  `pass_word` varchar(50) NOT NULL,
  `e_mail` varchar(254) NOT NULL,
  `cell_phone` int(11) NOT NULL,
  `work_place` varchar(50) NOT NULL,
  `prof` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `polls_user`
--

LOCK TABLES `polls_user` WRITE;
/*!40000 ALTER TABLE `polls_user` DISABLE KEYS */;
INSERT INTO `polls_user` VALUES (1,'[\'test\']','12345','[\'test@tw\']',12345,'workplace',0),(2,'[\'sun\']','12345','[\'sun@xx\']',12345,'workplace',0),(3,'[\'sun\']','12345','[\'sun@ss\']',12345,'workplace',0),(4,'[\'dd\']','12345','[\'dddd@dd\']',12345,'workplace',0),(5,'[\'dd\']','12345','[\'dd@dd\']',12345,'workplace',0),(6,'[\'sun\']','12345','[\'s@ss\']',12345,'workplace',0),(7,'[\'sun\']','12345','[\'s@ss\']',12345,'workplace',0),(8,'[\'sun\']','12345','[\'s@ss\']',12345,'workplace',0),(9,'[\'sun\']','12345','[\'s@ss\']',12345,'workplace',0),(10,'[\'sun\']','12345','[\'s@ss\']',12345,'workplace',0),(11,'[\'sun\']','12345','[\'s@ss\']',12345,'workplace',0),(12,'[\'sun\']','12345','[\'s@ss\']',12345,'workplace',0),(13,'[\'sun\']','12345','[\'s@ss\']',12345,'workplace',0),(14,'[\'sun\']','12345','[\'s@ss\']',12345,'workplace',0),(15,'[\'sun\']','12345','[\'s@ss\']',12345,'workplace',0),(16,'[]','12345','[]',12345,'workplace',0),(17,'[\'xiaoming\']','12345','[\'xiaoming@fake\']',12345,'workplace',0),(18,'[]','12345','[]',12345,'workplace',0);
/*!40000 ALTER TABLE `polls_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-09-05  9:31:27
