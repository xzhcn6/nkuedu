CREATE DATABASE  IF NOT EXISTS `nkuedu` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `nkuedu`;
-- MySQL dump 10.13  Distrib 5.5.46, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: nkuedu
-- ------------------------------------------------------
-- Server version	5.5.46-0ubuntu0.14.04.2

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `ID` varchar(32) NOT NULL,
  `login_name` varchar(45) DEFAULT NULL,
  `passwd` varchar(45) DEFAULT NULL,
  `system_open` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('23491fa2793d4762b5bedb014b24c2cc','admin','admin',1);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course` (
  `ID` varchar(32) NOT NULL,
  `select_id` int(11) NOT NULL AUTO_INCREMENT,
  `course_num` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `name` varchar(45) NOT NULL,
  `max_student` int(11) NOT NULL,
  `professor` varchar(45) NOT NULL,
  `classroom` varchar(12) NOT NULL,
  `request` varchar(100) DEFAULT NULL,
  `introduction` varchar(3000) DEFAULT NULL,
  `type` varchar(2) NOT NULL,
  `credit` float(2,1) NOT NULL DEFAULT '2.0',
  `is_open` int(1) NOT NULL DEFAULT '1',
  `is_delete` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `select_id_UNIQUE` (`select_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES ('0b806b7ebe4d434e91af2b616d6c041b',1,'1','java编程思想',10,'李帅成','B205','男生','ｊａｖａ　web','e',2.5,0,0),('1',2,'1902015560','中华国学',10,'郑子平','b301','','','e',2.0,1,1),('360d8e52cbd049d7a3522c7a352fdd4d',3,'0003','计算机网络',11,'李兴娟','警员','','a','e',1.2,1,0),('909219807d344831b28a7422c214ece9',4,'1','java编程思想',10,'李帅成','B205','男生','ｊａｖａ　web','e',2.5,0,0),('983d7587e8ec4e4a9254863b4a6e861b',5,'1','java编程思想',10,'李帅成','B205','男生','ｊａｖａ　web','e',2.5,0,0),('b6cf166e09934570866b1ccf15696cab',6,'2','c++',9,'陈佳星','A105','女性不能选','Thinking in c++','e',2.0,0,0),('e4f8c11d19644647bd45e5b26e538bbb',7,'1111','自增',12,'行书送','h','ea','sss','e',2.0,1,0);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `ID` varchar(32) NOT NULL DEFAULT '0',
  `name` varchar(45) DEFAULT NULL,
  `school` varchar(45) DEFAULT NULL,
  `telephone` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `passwd` varchar(45) DEFAULT NULL,
  `student_num` int(8) DEFAULT NULL,
  `is_delete` int(11) DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `student_num_UNIQUE` (`student_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES ('1','张旭','南开大学','13516191737','917128985@qq.com','123456',1112647,0),('1a4f242fff1944bb94f4e690b41ba198','赵薇','传媒中学','20145632','weizhao@or.com','123456',20150015,0),('1d218dd260e440438cf63d35190d0f50','李恩鹏','山东一中','15623547896','epli@shandong.com','123456',20150012,0),('20aff73dd1c44fe99e7971c297333eae','张玮','天津第四十二中学','15600231589','zhangwei@nankai.edu.cn','123456',20150008,0),('23491fa2793d4762b5bedb014b24c2cd','闫继军','莲子营小学','13569875643','zhangxu199341@foxmail.c','123456',20150004,0),('31f4c50754394765865dfd4075a785b2','高迎春','黑龙江一中','13952366548','ycgao@heilj.edu','123456',20150011,0),('4da129f1e2ae4219ae0f235f036f4f31','袁莉岸','杨村一中','14536987564','lianyuan@yangcun.org','123456',20150013,0),('5b44463319d54579a42fbdf8d06e5693','刘德华','香港中学','12345645','987564863@qq.com','123456',20150016,0),('5ba1b127913345c8a2fd9cfe211320e4','黄子涵','南开大学','13546869542','9171289815@qq.com','123456',20150002,0),('5bc6626203d044768bd6e21c0a5313c8','迎水道','迎水道二中','123456789','yingshuidao@erzhong.com','123456',20150014,0),('658ba9c2b4914bdba5039f18916d6baa','王立群','十三中学','17600853112','xuzhang7@iflytek.com','123456',20150007,0),('7545718838fe4221ba9a96bfc8767428','黄子涵','张旭大学','15620582772','904323606@qq.com','123456',0,0),('7c97713e168f4cc7ab1b36a91fda13b2','倪守国','宝坻一中','13546869542','zhangxu199341@foxmail.co','123456',20150003,0),('880e451acae94e6595ef6e834fa6bb14','李旭东','南开大学','13698654214','lixudong@nankai.edu.cn','123456',20150005,0),('8fa1fd781f5041718165b0f69878977a','张旭','南开大学','13516191737','zhangxu199341@foxail.com','123456',1,0),('9cc87d1f99c6405692f4733165e3b404','张晓林','南开大学','17655236987','zhangxiaolin@nankai.edu.cn','123456',20150010,0),('be34aaa149834bbfaa836f4243b6b49e','张旭','南开大学','13516191737','zhangxu199341@foxmail.com','123456',20150001,0),('c06ea101f3ed46c2b021bb25ddd53315','张曼莉','台湾五中','12345678','taiwan@com.tai','123456',20150017,0),('c3d1bbc2a8d14aaaa553944b089e8b12','张尚','南阳一中','13956845621','zhangshang@nku.edu.cn','123456',20150009,0),('c93fd6bae9eb42e397fefefe593e557e','王璞','天津小学','13546869542','zhangxu199341@foxm.com','123456',20150006,0),('eb2a583227ec44899c5fcdc15262b49f','张艺谋','剩余大学','456789152','shengyu@com.edu','123456',20150018,0);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-11-05  1:08:09
