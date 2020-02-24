CREATE DATABASE  IF NOT EXISTS `EVENT_BASED_CARPOOLING` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `EVENT_BASED_CARPOOLING`;
-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: fall19-ssdi-project-group5-db.cz4afuqpuil9.us-east-2.rds.amazonaws.com    Database: EVENT_BASED_CARPOOLING
-- ------------------------------------------------------
-- Server version	5.7.22-log

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
-- Table structure for table `ADDRESS`
--

DROP TABLE IF EXISTS `ADDRESS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ADDRESS` (
  `USERNAME` varchar(50) NOT NULL,
  `ADDRESS_LINE1` varchar(255) NOT NULL,
  `ADDRESS_LINE2` varchar(255) NOT NULL,
  `CITY` varchar(50) NOT NULL,
  `STATE` varchar(50) NOT NULL,
  `ZIP_CODE` varchar(5) NOT NULL,
  PRIMARY KEY (`USERNAME`,`ADDRESS_LINE1`,`ADDRESS_LINE2`,`CITY`,`STATE`,`ZIP_CODE`),
  CONSTRAINT `ADDRESS_ibfk_1` FOREIGN KEY (`USERNAME`) REFERENCES `USER` (`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ADDRESS`
--

LOCK TABLES `ADDRESS` WRITE;
/*!40000 ALTER TABLE `ADDRESS` DISABLE KEYS */;
/*!40000 ALTER TABLE `ADDRESS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EVENTS`
--

DROP TABLE IF EXISTS `EVENTS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EVENTS` (
  `EVENT_ID` varchar(255) NOT NULL,
  `EVENT_NAME` varchar(255) NOT NULL,
  `FULL_ADDRESS` varchar(255) NOT NULL,
  `DESCRIPTION` text,
  `PERFORMERS_NAMES` text,
  `PERFORMERS_ID` varchar(255) DEFAULT NULL,
  `VENUE_ID` varchar(255) DEFAULT NULL,
  `DATE_TIME_LOCAL` datetime DEFAULT NULL,
  PRIMARY KEY (`EVENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EVENTS`
--

LOCK TABLES `EVENTS` WRITE;
/*!40000 ALTER TABLE `EVENTS` DISABLE KEYS */;
INSERT INTO `EVENTS` VALUES ('1','ARTS','','',NULL,NULL,NULL,NULL),('4704993','Eiffel Tower Experience - Las Vegas','3655 Las Vegas Boulevard SouthLas Vegas, NV 89109','None provided by Host','Eiffel Tower Experience','605657','1610','2019-11-05 03:30:00'),('4897480','Sesame Street Live - Ontario','4000 East Ontario Center ParkwayOntario, CA 91764','None provided by Host','Sesame Street Live , Sesame Street Live! Make Your Magic','5356 , 686380','257','2019-11-05 14:00:00'),('4948014','New Found Glory with Hawthorne Heights and Free Throw (18+)','200 41st Street SouthBirmingham, AL 35222','None provided by Host','Hawthorne Heights , New Found Glory , Free Throw','840 , 1332 , 302689','78349','2019-11-26 03:30:00'),('4993238','Boston Manor with Heart Attack Man','1423 S Tryon StCharlotte, NC 28203','None provided by Host','Boston Manor , Heart Attack Man','340320 , 385247','779','2019-11-25 19:00:00'),('4994342','Ski Mask The Slump God with Pouya','800 W Olympic BlvdLos Angeles, CA 90015','None provided by Host','Pouya , Ski Mask The Slump God','248275 , 620887','590','2019-11-05 03:30:00'),('5009000','The Suitcase Junket','193 Exchange StreetBangor, ME 04401','None provided by Host','The Suitcase Junket','87386','433078','2019-11-24 19:00:00'),('5026583','Dave East','820 Hamilton StCharlotte, NC 28206','None provided by Host','Dave East','298189','346514','2019-11-24 20:00:00'),('5049482','Houston Cougars at Houston Baptist Huskies Basketball','3422 Cullen BoulevardHouston, TX 77204','None provided by Host','Houston Cougars Basketball , Houston Baptist Huskies Basketball','4066 , 7447','457207','2019-11-26 03:30:00'),('5052224','Basketball Hall of Fame Tip Off 2 Day Pass (November 23-24)','1 Mohegan Sun BlvdUncasville, CT 06382','None provided by Host','Virginia Cavaliers Basketball , Massachusetts Minutemen Basketball , St Johns Red Storm Basketball , Arizona State Sun Devils Basketball , Rider Broncs Basketball , Vermont Catamounts Basketball , Central Connecticut State Blue Devils Basketball , Columbia Lions Basketball','4009 , 4034 , 4048 , 4076 , 6424 , 6461 , 6462 , 6544','92','2019-11-23 03:30:00'),('5075823','National Women\'s Under-18 Championship','600 Park StreetWinkler, Canada','None provided by Host','Canada Mens National Hockey','451736','484483','2019-11-05 03:30:00'),('5096273','DJ TJ','917 Saint Catherine StreetMontreal, Canada','None provided by Host','DJ TJ','219727','36485','2019-11-24 03:30:00'),('5096274','Jon Wait','917 Saint Catherine StreetMontreal, Canada','None provided by Host','Jon Wait','697923','36485','2019-11-17 03:30:00'),('5116232','A Dolls House - Denver','1050 13th StreetDenver, CO 80204','None provided by Host','A Dolls House , A Doll\'s House, Part 2','11100 , 607280','4369','2019-11-17 03:30:00'),('5120926','AAC Volleyball Tournament - Semifinals','12777 Gemini BlvdOrlando, FL 32816','None provided by Host','AAC Volleyball Tournament','779653','5595','2019-11-23 03:30:00'),('5120928','AAC Volleyball Tournament - Final','12777 Gemini BlvdOrlando, FL 32816','None provided by Host','AAC Volleyball Tournament','779653','5595','2019-11-24 03:30:00');
/*!40000 ALTER TABLE `EVENTS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `REQUESTS`
--

DROP TABLE IF EXISTS `REQUESTS`;
/*!50001 DROP VIEW IF EXISTS `REQUESTS`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `REQUESTS` AS SELECT 
 1 AS `HOST_USERNAME`,
 1 AS `HOST_NAME`,
 1 AS `HOST_CONTACT`,
 1 AS `HOST_EMAIL`,
 1 AS `RIDE_ID`,
 1 AS `EVENT_ID`,
 1 AS `PASSENGER_USERNAME`,
 1 AS `PASSENGER_NAME`,
 1 AS `PASSENGER_CONTACT`,
 1 AS `PASSENGER_EMAIL`,
 1 AS `REQUEST_ID`,
 1 AS `STATUS`,
 1 AS `START_TIME`,
 1 AS `EVENT_NAME`,
 1 AS `DATE_TIME`,
 1 AS `ADDRESS`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `RIDES_OFFERED`
--

DROP TABLE IF EXISTS `RIDES_OFFERED`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RIDES_OFFERED` (
  `EVENT_ID` varchar(255) NOT NULL,
  `RIDE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `USERNAME` varchar(50) NOT NULL DEFAULT '',
  `CAR_MODEL` varchar(100) NOT NULL,
  `NO_OF_SEATS` varchar(1) DEFAULT NULL,
  `START_TIME` datetime DEFAULT NULL,
  `START_ADDRESS_LINE1` varchar(255) NOT NULL,
  `START_ADDRESS_LINE2` varchar(255) NOT NULL,
  `START_CITY` varchar(50) NOT NULL,
  `START_STATE` varchar(50) NOT NULL,
  `START_ZIP_CODE` varchar(5) NOT NULL,
  PRIMARY KEY (`RIDE_ID`),
  KEY `USERNAME` (`USERNAME`)
) ENGINE=InnoDB AUTO_INCREMENT=194 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RIDES_OFFERED`
--

LOCK TABLES `RIDES_OFFERED` WRITE;
/*!40000 ALTER TABLE `RIDES_OFFERED` DISABLE KEYS */;
INSERT INTO `RIDES_OFFERED` VALUES ('1',123,'ageldartp','',NULL,'2019-11-06 00:00:00','','','','',''),('1',124,'khoston10','',NULL,'2019-11-06 00:00:00','','','','',''),('1',125,'ageldartp','',NULL,'2019-11-06 00:00:00','','','','',''),('5075823',126,'ageldartp','2020 Toyota Corolla Hybrid','3','2019-11-06 01:20:59','9306 Kittansett Drive','Apt #a','Charlotte','NC','28262'),('5075823',127,'amertel12','2019 Acura ILX','3','2019-11-06 01:26:35','9307 Kittansett Drive','Apt #b','Charlotte','NC','28262'),('5075823',128,'aoheffernan3','2020 Acura MDX Hybrid','3','2019-11-06 01:27:15','9308 Kittansett Drive','Apt #c','Charlotte','NC','28262'),('5075823',129,'arotchelly','2020 Acura MDX','3','2019-11-06 01:27:15','9309 Kittansett Drive','Apt #d','Charlotte','NC','28262'),('5075823',130,'audenv','2019 Acura MDX Hybrid','3','2019-11-06 01:27:15','9300 Kittansett Drive','Apt #e','Charlotte','NC','28262'),('4897480',131,'ageldartp','2020 Acura NSX','3','2019-11-06 01:21:09','9306 Kittansett Drive','Apt #a','Charlotte','NC','28262'),('4897480',132,'amertel12','2019 Audi A3','3','2019-11-06 01:21:19','9307 Kittansett Drive','Apt #b','Charlotte','NC','28262'),('4897480',133,'arotchelly','2019 Chevrolet Blazer','3','2019-11-06 01:21:29','9308 Kittansett Drive','Apt #c','Charlotte','NC','28262'),('4897480',134,'aoheffernan3','2020 Chevrolet Bolt','3','2019-11-06 01:21:39','9309 Kittansett Drive','Apt #d','Charlotte','NC','28262'),('4897480',135,'audenv','2019 Chevrolet Camaro','3','2019-11-06 01:21:49','9300 Kittansett Drive','Apt #e','Charlotte','NC','28262'),('4704993',136,'ageldartp','2020 Chevrolet Corvette','3','2019-11-06 01:21:00','9306 Kittansett Drive','Apt #a','Charlotte','NC','28262'),('4704993',137,'amertel12','2019 Chevrolet Cruze','3','2019-11-06 01:21:10','9307 Kittansett Drive','Apt #b','Charlotte','NC','28262'),('4704993',138,'arotchelly','2019 Chevrolet Impala','3','2019-11-06 01:21:20','9308 Kittansett Drive','Apt #c','Charlotte','NC','28262'),('4704993',139,'aoheffernan3','2020 Chevrolet Sonic','3','2019-11-06 01:21:30','9309 Kittansett Drive','Apt #d','Charlotte','NC','28262'),('4704993',140,'audenv','2020 Mercedes-Benz GT','3','2019-11-06 01:21:40','9300 Kittansett Drive','Apt #e','Charlotte','NC','28262'),('4994342',143,'arotchelly','2020 Kia Optima Hybrid','3','2019-11-06 01:25:06','9308 Kittansett Drive','Apt #c','Charlotte','NC','28262'),('4994342',144,'aoheffernan3','2019 Kia Sorento','3','2019-11-06 01:25:16','9309 Kittansett Drive','Apt #d','Charlotte','NC','28262'),('4994342',145,'audenv','2020 Kia Soul','3','2019-11-06 01:25:26','9300 Kittansett Drive','Apt #e','Charlotte','NC','28262'),('5075823',156,'ageldartp','2020 Toyota Corolla Hybrid','3','2019-11-06 00:00:00','9306 Kittansett Drive','Apt #a','Charlotte','NC','28262'),('5096274',157,'ageldartp','2020 Toyota Corolla Hybrid','3','2019-11-18 00:00:00','9306 Kittansett Drive','Apt #a','Charlotte','NC','28262'),('5096274',158,'amertel12','2019 Acura ILX','3','2019-11-18 00:58:35','9307 Kittansett Drive','Apt #b','Charlotte','NC','28262'),('5096274',159,'aoheffernan3','2020 Acura MDX Hybrid','3','2019-11-18 00:58:35','9308 Kittansett Drive','Apt #c','Charlotte','NC','28262'),('5096274',160,'arotchelly','2020 Acura MDX','3','2019-11-18 00:58:35','9309 Kittansett Drive','Apt #d','Charlotte','NC','28262'),('5096274',161,'audenv','2019 Acura MDX Hybrid','3','2019-11-18 00:58:35','9300 Kittansett Drive','Apt #e','Charlotte','NC','28262'),('5116232',162,'ageldartp','2020 Toyota Corolla Hybrid','3','2019-11-18 00:00:00','9306 Kittansett Drive','Apt #a','Charlotte','NC','28262'),('5116232',163,'amertel12','2019 Acura ILX','3','2019-11-18 01:52:40','9307 Kittansett Drive','Apt #b','Charlotte','NC','28262'),('5116232',164,'aoheffernan3','2020 Acura MDX Hybrid','3','2019-11-18 01:52:40','9308 Kittansett Drive','Apt #c','Charlotte','NC','28262'),('5116232',165,'arotchelly','2020 Acura MDX','3','2019-11-18 01:52:40','9309 Kittansett Drive','Apt #d','Charlotte','NC','28262'),('5116232',166,'audenv','2019 Acura MDX Hybrid','3','2019-11-18 01:52:40','9300 Kittansett Drive','Apt #e','Charlotte','NC','28262'),('5116232',167,'rakgunti26','2020 Tesla X','3','2019-11-18 00:00:00','9306 Kittansett Drive','Apt #e','Charlotte','NC','28262'),('4895064',173,'ageldartp','BMW','3','2019-11-23 19:00:00','ghvg ftygv','yguy uy tguyg','Charlotte','MT','28203'),('5120928',180,'rakgunti26','BMW','1','2019-11-24 18:38:00','ghhb uihiuy','jhiuhiu','new york','NY','12345'),('5096273',181,'JamBond35','Mercedes','3','2019-11-24 14:30:00','Charlotte','','Charlotte','NC','28060'),('5096273',182,'AnuSrivastava33','Camry','1','2019-11-24 20:00:00','1305 S college St','UNIT 2414','Charlotte','NC','28203'),('5096273',183,'AnuSrivastava33','mercedes','2','2019-11-24 20:30:00','1305 S college ln','UNIT 2410','Charlotte','MS','28203'),('5009000',184,'JamBond35','Mustang','4','2019-11-24 16:00:00','999','','Mumbai','HI','23486'),('5026583',185,'SamLee81','Jeep','3','2019-11-24 18:00:00','sadfasd','','Atlanta','AK','12341'),('4993238',186,'SamLee81','Jeep','5','2019-11-25 22:30:00','sadfasd','','Atlanta','AK','12341'),('4993238',187,'HelUser63','Mustang','3','2019-11-25 20:00:00','Charlotte','','Charlotte','CO','28060'),('4993238',188,'AnuSrivastava33','mercedes','3','2019-11-25 12:00:00','1305 S college St','UNIT 2414','Charlotte','NC','28203'),('4948014',189,'JamBond35','Mercedes','5','2019-11-26 13:11:00','Charlotte','','Charlotte','AL','28060'),('4948014',190,'JamBond35','Mercedes','2','2019-11-26 15:00:00','Charlotte','','Charlotte','DE','28060'),('5049482',191,'AnuSrivastava33','Camry','4','2019-11-26 14:30:00','1305 S college St','UNIT 2414','Charlotte','NC','28203'),('5049482',192,'JamBond35','tesla','1','2019-11-26 14:11:00','adhgv','hgcv','jhgv','AK','28060'),('5049482',193,'AnuSrivastava33','mercedes','3','2019-11-26 14:00:00','1305 S college St','UNIT 2414','Charlotte','NC','28203');
/*!40000 ALTER TABLE `RIDES_OFFERED` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RIDES_REQUESTED`
--

DROP TABLE IF EXISTS `RIDES_REQUESTED`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RIDES_REQUESTED` (
  `RIDE_ID` int(11) NOT NULL,
  `EVENT_ID` varchar(255) NOT NULL,
  `USERNAME` varchar(50) NOT NULL,
  `STATUS` varchar(50) NOT NULL DEFAULT 'pending',
  `REQUEST_ID` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`REQUEST_ID`),
  KEY `Rides_requested_ibfk_1_idx` (`RIDE_ID`),
  KEY `Rides_requested_ibfk_3_idx` (`USERNAME`),
  CONSTRAINT `Rides_requested_ibfk_1` FOREIGN KEY (`RIDE_ID`) REFERENCES `RIDES_OFFERED` (`RIDE_ID`),
  CONSTRAINT `Rides_requested_ibfk_3` FOREIGN KEY (`USERNAME`) REFERENCES `USER` (`USERNAME`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RIDES_REQUESTED`
--

LOCK TABLES `RIDES_REQUESTED` WRITE;
/*!40000 ALTER TABLE `RIDES_REQUESTED` DISABLE KEYS */;
INSERT INTO `RIDES_REQUESTED` VALUES (137,'5052224','rakgunti26','pending',40),(139,'5052224','rakgunti26','pending',41),(181,'5096273','AnuSrivastava33','pending',50),(182,'5096273','rakgunti26','declined',51),(183,'5096273','rakgunti26','accepted',52),(184,'5009000','SheHolmes13','accepted',53),(185,'5026583','SheHolmes13','pending',54),(186,'4993238','AnuSrivastava33','accepted',55),(187,'4993238','SamLee81','accepted',56),(188,'4993238','HelUser63','declined',57),(187,'4993238','SheHolmes13','declined',58),(187,'4993238','SheHolmes13','declined',59),(192,'5049482','rakgunti26','accepted',60);
/*!40000 ALTER TABLE `RIDES_REQUESTED` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER`
--

DROP TABLE IF EXISTS `USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER` (
  `USERNAME` varchar(50) NOT NULL,
  `PASSWORD` varchar(255) NOT NULL,
  `FIRST_NAME` varchar(35) NOT NULL,
  `LAST_NAME` varchar(35) NOT NULL,
  `CONTACT_NO` varchar(20) NOT NULL,
  `EMAIL_ID` varchar(255) NOT NULL,
  PRIMARY KEY (`USERNAME`),
  UNIQUE KEY `EMAIL_ID_UNIQUE` (`EMAIL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER`
--

LOCK TABLES `USER` WRITE;
/*!40000 ALTER TABLE `USER` DISABLE KEYS */;
INSERT INTO `USER` VALUES ('ageldartp','Zvt2Uhf5I','Ardelle','Geldart','5544816595','ageldartp@hibu.com'),('AjdJaal07','sjhbvadb','Ajdkshaksb','Jaal','9876543210','abc@l.com'),('Ajdpaksbkjba33','b95e8af4094d3fee4a69cc5696059074','Ajdkshaksb','paksbkjba','9876543210','asdbk@klm.com'),('amertel12','0NlVOtDp','Alberik','Mertel','6994341826','amertel12@sohu.com'),('AnuSrivastava33','16d7a4fca7442dda3ad93c9a726597e4','Anushree','Srivastava','999-999-1234','asri@uncc.edu'),('aoheffernan3','4Qe6eDPNgvb','Audrie','O\'Heffernan','7149098982','aoheffernan3@last.fm'),('arotchelly','ldhNQA75DW','Ancell','Rotchell','4138431844','arotchelly@census.gov'),('ascWhatever53','bd36f8038724581db562ca2bb8f8800a','aschjkasb','Whatever','9876543210','jksbdkc@l.com'),('ascWhatever86','1ebf72f1fd9881e37f9402cd69fc4974','aschjkasb','Whatever','980-282-09','pass@gm.com'),('audenv','5pg9ZCBP','Albrecht','Uden','1428789767','audenv@nyu.edu'),('awacklyl','MVLfMUe9G','Abigale','Wackly','2896578053','awacklyl@pinterest.com'),('belleru','MNOiX7ou9Pg','Broderic','Eller','7864417321','belleru@google.nl'),('bwarboys1d','8Zz9jaM4ZEL','Barnard','Warboys','9837039464','bwarboys1d@sina.com.cn'),('cbestwickr','71Sac52hzsNP','Caralie','Bestwick','5965379774','cbestwickr@noaa.gov'),('cbirdfield2','QqgqDztNe','Ches','Birdfield','4739588258','cbirdfield2@ezinearticles.com'),('cburmang','KRSTzz','Clea','Burman','3139101071','cburmang@domainmarket.com'),('cfostoni','UHz7RKQ8','Cece','Foston','8035852020','cfostoni@constantcontact.com'),('ckinman1c','iX2HbqevBZeG','Cyrus','Kinman','9424626342','ckinman1c@tripod.com'),('cpitkin1','06KC4bSGn4M','Camey','Pitkin','6534502477','cpitkin1@bluehost.com'),('ctimothy0','pBJLxsR2j','Claude','Timothy','8457098904','ctimothy0@unc.edu'),('dsee8','MQJ7XRdP','Dunstan','See','3939316332','dsee8@biblegateway.com'),('DumDum10','Dum','Dum','9876543210','dummy@emai','sdca'),('eaimek','iL69CzAr6','Ebba','Aime','5045989983','eaimek@twitpic.com'),('emarwood16','WStHIuz','Enos','Marwood','1046890979','emarwood16@tripadvisor.com'),('fbrayshay6','AtW0R4dYaes','Filmer','Brayshay','1202231840','fbrayshay6@pbs.org'),('fdoleyd','ILVjNbMEs','Feodor','Doley','9407389923','fdoleyd@smh.com.au'),('gkitec','i2dLF78PQo','Gertrude','Kite','5425302507','gkitec@kickstarter.com'),('HelUser63','62ae3923eefd39fb45f8d90c3cadfb99','Hello','User','123-456-7890','hello@gmail.com'),('hmcgarvie14','mxy920','Helyn','McGarvie','4183402686','hmcgarvie14@ustream.tv'),('hremerq','QMZjZLv','Heinrick','Remer','7798256594','hremerq@weibo.com'),('hrolpht','mFchOXrk','Hilda','Rolph','8543158884','hrolpht@furl.net'),('hroulstonn','E4Bm0lrvWys','Harriette','Roulston','9635785175','hroulstonn@upenn.edu'),('htucsellz','q4e2t99','Henri','Tucsell','6834705895','htucsellz@huffingtonpost.com'),('JadJaiswal23','f352afde5c228db987f2f7ecb34df373','Jade','Jaiswal','980-282-09','pthergao@uncc.edu'),('JamBond35','e84c55c90d955bf1cfa2d31a1f425383','James','Bond','007-007-0007','jamesbond@gmail.com'),('jmccomba','SHw3ZZr','Jehu','McComb','3077133879','jmccomba@hhs.gov'),('jmulder17','LmBXBckyMw','Jerrylee','Mulder','5253088838','jmulder17@blogger.com'),('JohDoe59','16d7a4fca7442dda3ad93c9a726597e4','John','Doe','999-999-12','john.doe@gmail.com'),('jwatermanb','Atvtp6ro','Jard','Waterman','8307044124','jwatermanb@paypal.com'),('khoston10','b4dqQS','Kimberly','Hoston','1601976345','khoston10@hao123.com'),('kwhatham15','jrOZG5','Kris','Whatham','4036892326','kwhatham15@chron.com'),('ljosovichs','TS1sM2gxgMae','Leeland','Josovich','2674390251','ljosovichs@cafepress.com'),('lsiemandlx','7uLHo4zpabzC','Lanae','Siemandl','2519779494','lsiemandlx@phoca.cz'),('mcrannach19','tF7VryCc4','Mareah','Crannach','1832122948','mcrannach19@seattletimes.com'),('mguisot13','YAIzaoveoqs','Mignonne','Guisot','6167856728','mguisot13@geocities.jp'),('mkalb5','0zNady','Malachi','Kalb','7976815355','mkalb5@typepad.com'),('mluisettif','CXwxJME','Massimiliano','Luisetti','1258359168','mluisettif@epa.gov'),('msegom','JB5FefL','Malena','Sego','7792862133','msegom@yelp.com'),('nbeddoww','VFiAYQ8e','Norman','Beddow','3809464281','nbeddoww@salon.com'),('nmaneylaws9','hXyfqK2njI9j','Natalina','Maneylaws','6252863493','nmaneylaws9@ted.com'),('nplowes4','TF8JW4wvsoW','Nannette','Plowes','5934932078','nplowes4@reddit.com'),('onouch1b','Du7zmIs','Otes','Nouch','7802747056','onouch1b@sfgate.com'),('qwarkupe','e1YffI9HJ','Quinn','Warkup','5134741958','qwarkupe@t.co'),('rakgunti26','f292f51a0f4c855af343c67100edfee5','rakesh','gunti','704-819-17','gunti@uncc.edu'),('rsalternej','LwRvlaf','Ruby','Salterne','6333192015','rsalternej@weather.com'),('SamLee81','5af25d5643abad1f74f2f8e1edb3f78e','Sam','Lee','123-456-7890','samlee@gmail.com'),('SamNetto33','dc647eb65e6711e155375218212b3964','Sam','Netto','1234567890','sam@rmail.com'),('SauJaiswal25','9bf713fbcfe657e0ae69e58d48433723','Saurabh','Jaiswal','11234','asdcas'),('SauJaiswal57','680e0aeccdb1b88b31e262de2ec3971d','Saurabh','Jaiswal','9876543210','asdvc@3.com'),('SauJaiswal59','5f4dcc3b5aa765d61d8327deb882cf99','Saurabh','Jaiswal','980-282-09','dumm2@gmail.com'),('SauJaiswal75','e16072927e37b4fb275341ec1266b541','Saurabh','Jaiswal','9876543210','sdcs'),('SauJaiswal79','5858ea228cc2edf88721699b2c8638e5','Saurabh','Jaiswal','980-282-0907','newemail@g.com'),('SauJaiswal83','54fc35c2288127f063b2c5ba79a7d055','Saurabh','Jaiswal','980-282-09','sjaiswa1@uncc.edu'),('sclineck7','IEr1VqeHd','Suzanna','Clineck','1154649060','sclineck7@archive.org'),('SheHolmes13','d6640d89960251619d3035628d578891','Sherlock','Holmes','123-456-7890','sherlock@holmes.com'),('tborge18','qRGMVir','Theresita','Borge','6758206767','tborge18@webs.com'),('telvidgeo','nN3iQcAwx4A','Timothee','Elvidge','1615272504','telvidgeo@cmu.edu'),('tjearumh','s7km97guvQzJ','Tremayne','Jearum','7127282365','tjearumh@google.nl'),('vwhyke1a','AqOBA1','Valeria','Whyke','8941569454','vwhyke1a@moonfruit.com'),('XYZABC58','1bbac217e84da0831a6bf8b4a68a7c48','XYZ','ABC','1234567890','testing@test.com'),('ytesdale11','YhUaaQnt','Yolanda','Tesdale','8894282139','ytesdale11@studiopress.com'),('zcaUnited58','<md5 HASH object @ 0x10bf0f7b0>','zcasda','United','9876543210','dummy@email.com'),('zdfsadvasdjhvsk54','680e0aeccdb1b88b31e262de2ec3971d','zdfv','sadvasdjhvsk','9876543210','sd');
/*!40000 ALTER TABLE `USER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `USER_PROFILE`
--

DROP TABLE IF EXISTS `USER_PROFILE`;
/*!50001 DROP VIEW IF EXISTS `USER_PROFILE`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `USER_PROFILE` AS SELECT 
 1 AS `USERNAME`,
 1 AS `NAME`,
 1 AS `CONTACT_NO`,
 1 AS `EMAIL_ID`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'EVENT_BASED_CARPOOLING'
--

--
-- Dumping routines for database 'EVENT_BASED_CARPOOLING'
--

--
-- Final view structure for view `REQUESTS`
--

/*!50001 DROP VIEW IF EXISTS `REQUESTS`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`Project_root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `REQUESTS` AS select `ro`.`USERNAME` AS `HOST_USERNAME`,concat_ws(' ',`u`.`FIRST_NAME`,`u`.`LAST_NAME`) AS `HOST_NAME`,`u`.`CONTACT_NO` AS `HOST_CONTACT`,`u`.`EMAIL_ID` AS `HOST_EMAIL`,`rr`.`RIDE_ID` AS `RIDE_ID`,`ro`.`EVENT_ID` AS `EVENT_ID`,`rr`.`USERNAME` AS `PASSENGER_USERNAME`,concat_ws(' ',`u1`.`FIRST_NAME`,`u1`.`LAST_NAME`) AS `PASSENGER_NAME`,`u1`.`CONTACT_NO` AS `PASSENGER_CONTACT`,`u1`.`EMAIL_ID` AS `PASSENGER_EMAIL`,`rr`.`REQUEST_ID` AS `REQUEST_ID`,`rr`.`STATUS` AS `STATUS`,`ro`.`START_TIME` AS `START_TIME`,`e`.`EVENT_NAME` AS `EVENT_NAME`,`e`.`DATE_TIME_LOCAL` AS `DATE_TIME`,`e`.`FULL_ADDRESS` AS `ADDRESS` from ((((`RIDES_OFFERED` `ro` left join `RIDES_REQUESTED` `rr` on((`ro`.`RIDE_ID` = `rr`.`RIDE_ID`))) join `USER` `u` on((`ro`.`USERNAME` = `u`.`USERNAME`))) join `USER` `u1` on((`rr`.`USERNAME` = `u1`.`USERNAME`))) join `EVENTS` `e` on((`ro`.`EVENT_ID` = `e`.`EVENT_ID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `USER_PROFILE`
--

/*!50001 DROP VIEW IF EXISTS `USER_PROFILE`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`Project_root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `USER_PROFILE` AS select `USER`.`USERNAME` AS `USERNAME`,concat_ws(' ',`USER`.`FIRST_NAME`,`USER`.`LAST_NAME`) AS `NAME`,`USER`.`CONTACT_NO` AS `CONTACT_NO`,`USER`.`EMAIL_ID` AS `EMAIL_ID` from `USER` */;
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

-- Dump completed on 2019-12-04 20:35:47
