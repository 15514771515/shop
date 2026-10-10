-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: iii
-- ------------------------------------------------------
-- Server version	8.0.44

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `app_comment`
--

DROP TABLE IF EXISTS `app_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_comment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `time` varchar(50) NOT NULL,
  `text` longtext NOT NULL,
  `img1` longtext NOT NULL,
  `img2` longtext NOT NULL,
  `img3` longtext NOT NULL,
  `img4` longtext NOT NULL,
  `img5` longtext NOT NULL,
  `img6` longtext NOT NULL,
  `good_id` bigint NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_comment`
--

LOCK TABLES `app_comment` WRITE;
/*!40000 ALTER TABLE `app_comment` DISABLE KEYS */;
INSERT INTO `app_comment` VALUES (30,'2026-09-15 17:49','666','#','#','#','#','#','#',1,4);
/*!40000 ALTER TABLE `app_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_dianpu`
--

DROP TABLE IF EXISTS `app_dianpu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_dianpu` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `jianjie` longtext NOT NULL,
  `sales` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_dianpu`
--

LOCK TABLES `app_dianpu` WRITE;
/*!40000 ALTER TABLE `app_dianpu` DISABLE KEYS */;
INSERT INTO `app_dianpu` VALUES (1,'键创外设专营店','本店主营各类电脑外设产品，包含机械键盘、游戏鼠标、无线耳机等设备，产品经过严格品控，性价比高，售后保障完善。',0),(2,'声麦数码旗舰店','专注音频数码产品，耳机、麦克风、音响设备齐全，适合电竞、直播以及日常影音使用，支持7天无理由退换。',0),(3,'智芯穿戴官方店','主营智能手环、智能手表等穿戴设备，健康监测、消息提醒功能齐全，款式简约时尚，续航持久。',0),(4,'锐影数码馆','专注影音配件，高清摄像头、视频采集卡、桌面补光灯，满足直播、网课以及视频创作需求。',0),(5,'星耀外设店','电竞外设优选店铺，机械键鼠套装、鼠标垫、耳机支架，多款配色可选，手感舒适，适合游戏玩家。',0);
/*!40000 ALTER TABLE `app_dianpu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_goods`
--

DROP TABLE IF EXISTS `app_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_goods` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `storage` int NOT NULL,
  `categlory` varchar(12) NOT NULL,
  `img_url` varchar(200) NOT NULL,
  `dpi` varchar(50) NOT NULL,
  `introduce` longtext NOT NULL,
  `jiekou` varchar(100) NOT NULL,
  `light` varchar(100) NOT NULL,
  `use` varchar(100) NOT NULL,
  `xinghao` varchar(100) NOT NULL,
  `dianpu_id` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_goods`
--

LOCK TABLES `app_goods` WRITE;
/*!40000 ALTER TABLE `app_goods` DISABLE KEYS */;
INSERT INTO `app_goods` VALUES (1,'无线降噪耳机',299.00,159,'数码耳机','/media/good_img/img_2.png','','主动降噪无线蓝牙耳机，搭载智能降噪芯片，隔绝外界嘈杂噪音，续航持久稳定，佩戴轻盈舒适，高清立体声，适合日常通勤、办公学习使用。','Type_C','无灯光','手机_电脑','WH_1000XM5','2'),(2,'机械键盘青轴',459.00,103,'键盘外设','/media/good_img/img_3.png','','青轴机械游戏键盘，按键段落感清晰，触发灵敏，自带多彩背光效果，做工扎实耐用，兼顾电竞游戏与日常打字办公。','USB有线','RGB背光','电脑','GK715','1'),(3,'智能运动手表',699.00,39,'智能穿戴','/media/good_img/img_4.png','','运动健康智能手表，支持心率、睡眠监测，多种运动模式，高清触控大屏，续航时间长，消息实时提醒，适合运动健身日常佩戴。','蓝牙5.3','屏幕背光','安卓_IOS','Watch_GT4','3'),(4,'无线蓝牙耳机',169.00,199,'数码耳机','/media/good_img/img_5.png','','半入耳无线蓝牙耳机，音质清晰通透，连接稳定不易断连，小巧便携，长时间佩戴无压迫感，追剧听歌、日常通话都很合适。','Type_C','指示灯','手机平板','Buds_SE2','2'),(5,'游戏鼠标',199.00,78,'键盘外设','/media/good_img/img_1.png','8000可调','入门电竞游戏鼠标，人体工学外壳，多档DPI自由调节，绚丽RGB灯光，按键回弹迅速，握持手感舒适，适合电竞游戏与办公操作。','USB','RGB彩灯','台式笔记本','G102','1'),(6,'智能手环',129.00,152,'智能穿戴','/media/good_img/img.png','','健康监测智能手环，全天候监测睡眠与心率，轻薄机身，夜光显示屏，续航强悍，来电消息提醒，运动、日常佩戴两不误。','蓝牙5.4','息屏夜光','安卓_IOS','Band9','3'),(12,'机械游戏鼠标',249.00,92,'键盘外设','/media/good_img/img_6.png','25600可调','无线轻量化游戏鼠标，轻盈机身，超高可调DPI，炫酷LOGO灯效，信号传输稳定，长时间握感舒适，是电竞玩家的优选外设。','USB无线','LOGO灯效','电竞电脑','GPW二代','1'),(13,'降噪头戴耳机',399.00,63,'数码耳机','/media/good_img/img_7.png','','头戴式降噪耳机，宽大柔软耳罩，被动降噪，沉浸式立体声效，柔和呼吸灯光，有线双模适配手机电脑，游戏影音体验出色。','3.5mm+TypeC','呼吸灯','电脑手机','H7','2'),(14,'智能通话手表',899.00,29,'智能穿戴','/media/good_img/img_8.png','','高端智能通话手表，支持蓝牙接打电话，夜光表盘，多种健康检测功能，大屏高清显示，续航持久，商务出行、户外运动均可佩戴。','蓝牙','夜光表盘','安卓_IOS','Watch_Ultra','3'),(15,'超薄无线键盘',329.00,112,'键盘外设','/media/good_img/img_9.png','','超薄静音无线键盘，按键安静柔和，轻薄便携，白光背光，蓝牙有线双模式连接，适配平板笔记本，适合移动办公使用。','蓝牙+USB','白光','平板电脑','K380','1'),(16,'运动蓝牙耳机',229.00,147,'数码耳机','/media/good_img/img_10.png','','颈挂运动蓝牙耳机，柔性颈挂设计不易脱落，防水防汗，续航持久，音质饱满，适合跑步健身、户外出行听歌通话。','Type_C','充电指示灯','手机','FreeLace','2'),(17,'无线游戏耳机',349.00,88,'数码耳机','/media/good_img/img_11.png','20000可调','低延迟无线游戏耳机，搭载大尺寸发声单元，听声辨位精准，长续航，佩戴轻盈久戴不累。','Type_C','RGB灯效','电脑_手机','G435','1'),(18,'静音有线鼠标',129.00,142,'键盘外设','/media/good_img/img_12.png','4000可调','办公静音有线鼠标，按键安静无杂音，人体工学造型，适合长时间办公学习。','USB有线','无灯光','电脑','M186','2'),(19,'多功能智能手环',159.00,124,'智能穿戴','/media/good_img/img_13.png','','多功能健康手环，血氧心率全天候监测，支持多种运动模式，防水防尘，续航持久。','蓝牙','指示灯','安卓_IOS','Band10','3'),(20,'HiFi有线耳机',179.00,96,'数码耳机','/media/good_img/img_14.png','','HiFi高保真有线耳机，立体声饱满，人声清晰，适配电脑手机，线控一键切歌。','3.5mm','无灯光','手机_电脑','KZ-EDX','4'),(21,'超薄机械键盘',399.00,70,'键盘外设','/media/good_img/img_15.png','','矮轴超薄机械键盘，手感轻柔，键位紧凑，办公码字静音，携带方便。','USB有线','白光','电脑','S980','5'),(22,'大屏智能手表',1099.00,26,'智能穿戴','/media/good_img/img_16.png','','高清大屏智能手表，支持独立蓝牙通话，健康监测，GPS运动定位，续航强劲。','蓝牙','夜光表盘','安卓_IOS','Watch_GT5','1'),(23,'轻量化有线鼠标',149.00,108,'键盘外设','/media/good_img/img_17.png','16000可调','轻量化电竞有线鼠标，机身轻盈，微动清脆，多档DPI调节，适合电竞游戏。','USB有线','LOGO灯效','台式笔记本','G304','2'),(24,'挂脖降噪耳机',269.00,133,'数码耳机','/media/good_img/img_18.png','','挂脖式主动降噪耳机，柔性颈挂，防水防汗，适合跑步健身，音质通透。','Type_C','充电指示灯','手机','FreeLacePro','3'),(25,'入门智能手环',99.00,180,'智能穿戴','/media/good_img/img_19.png','','入门款智能手环，基础心率睡眠监测，消息提醒，轻薄机身，超长待机。','蓝牙','息屏夜光','安卓_IOS','Band8','4'),(26,'便携蓝牙键盘',249.00,89,'键盘外设','/media/good_img/img_20.png','','折叠便携蓝牙键盘，多设备一键切换，平板手机电脑通用，轻薄易收纳。','蓝牙+USB','无灯光','平板电脑','K480','5'),(27,'专业监听耳机',429.00,54,'数码耳机','/media/good_img/img_21.png','','头戴专业监听耳机，声场均衡，还原原声，适合录音剪辑、音乐制作。','3.5mm','无灯光','电脑手机','HD200','1'),(28,'电竞宏鼠标',219.00,67,'键盘外设','/media/good_img/img_22.png','24000可调','可编程宏按键电竞鼠标，自定义按键，RGB流光，游戏响应迅速。','USB有线','RGB彩灯','台式笔记本','GPW一代','2'),(29,'儿童智能手表',399.00,44,'智能穿戴','/media/good_img/img_23.png','','儿童智能通话手表，高清视频通话，定位守护，防水，多种趣味功能。','蓝牙','夜光表盘','安卓_IOS','KidsWatch','3'),(30,'半入耳降噪耳机',239.00,151,'数码耳机','/media/good_img/img_24.png','','半入耳主动降噪耳机，小巧舒适，通透模式，日常通勤听歌，续航持久。','Type_C','指示灯','手机平板','Buds_3','4'),(31,'无线机械键盘',549.00,63,'键盘外设','/media/good_img/img_25.png','','三模无线机械键盘，热插拔轴体，RGB背光，游戏办公两用。','USB无线','RGB背光','电脑','F99','5'),(32,'户外智能手表',1299.00,21,'智能穿戴','/media/good_img/img_26.png','','户外专业运动手表，GPS定位、气压海拔检测，防水耐摔，超长续航。','蓝牙','屏幕背光','安卓_IOS','Watch_Outdoor','1'),(33,'简约办公鼠标',89.00,210,'键盘外设','/media/good_img/img_27.png','1200可调','简约无线办公鼠标，低噪按键，小巧便携，适配笔记本日常办公。','USB无线','无灯光','电脑','M220','2'),(34,'颈挂音乐耳机',199.00,166,'数码耳机','/media/good_img/img_28.png','','颈挂式蓝牙音乐耳机，稳定连接，低音浑厚，长时间佩戴舒适。','Type_C','指示灯','手机','W280NB','3'),(35,'运动智能手环',139.00,137,'智能穿戴','/media/good_img/img_29.png','','专业运动手环，100+运动模式，心率血氧实时监测，游泳防水。','蓝牙','指示灯','安卓_IOS','BandSport','4'),(36,'静音蓝牙键盘',279.00,94,'键盘外设','/media/good_img/img_30.png','','静音薄膜蓝牙键盘，按键安静，无线连接，适合宿舍、图书馆办公。','蓝牙','白光','平板电脑','K600','5');
/*!40000 ALTER TABLE `app_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_order`
--

DROP TABLE IF EXISTS `app_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_order` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `count` int NOT NULL,
  `state` varchar(10) NOT NULL,
  `good_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `code` varchar(50) NOT NULL,
  `t` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `app_order_good_id_b7ca97d7_fk_app_goods_id` (`good_id`),
  KEY `app_order_user_id_f25a9fc4_fk_app_users_id` (`user_id`),
  CONSTRAINT `app_order_good_id_b7ca97d7_fk_app_goods_id` FOREIGN KEY (`good_id`) REFERENCES `app_goods` (`id`),
  CONSTRAINT `app_order_user_id_f25a9fc4_fk_app_users_id` FOREIGN KEY (`user_id`) REFERENCES `app_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_order`
--

LOCK TABLES `app_order` WRITE;
/*!40000 ALTER TABLE `app_order` DISABLE KEYS */;
INSERT INTO `app_order` VALUES (87,1,'已取消',1,7,'ORD202609122018074059','1789217967.1323292'),(99,1,'待收货',5,7,'ORD202609122152111213','1789281999.9139836'),(117,1,'已取消',2,8,'ORD202609142041039564','1789392118.287504'),(120,2,'待收货',3,8,'ORD202609142133575967','1789393726.8990817'),(121,2,'待收货',2,8,'ORD202609142133575967','1789393867.766249'),(122,2,'待收货',1,8,'ORD202609142133575967','1789394658.690169'),(124,1,'已完成',14,6,'ORD202609142148546629','1789642476.5535617'),(125,1,'已完成',3,6,'ORD202609142149333830','1789642476.5655575'),(159,1,'退款中',4,6,'ORD202609151743386173','1789642658.8273897'),(160,1,'待收货',21,6,'ORD202609171857565037','1789649968.0138538');
/*!40000 ALTER TABLE `app_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `app_users`
--

DROP TABLE IF EXISTS `app_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `avatar_url` varchar(200) NOT NULL,
  `name` varchar(20) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` varchar(100) NOT NULL,
  `user_id` int NOT NULL,
  `pay_pwd` varchar(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `app_users_user_id_d5ef82cf_fk_auth_user_id` (`user_id`),
  CONSTRAINT `app_users_user_id_d5ef82cf_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_users`
--

LOCK TABLES `app_users` WRITE;
/*!40000 ALTER TABLE `app_users` DISABLE KEYS */;
INSERT INTO `app_users` VALUES (6,'/media/avatar/1788876244263lisl4xeu.jpg','大大大','15514771515','河南省焦作市解放区',4,'123456'),(7,'/media/avatar/178919658639215audkyd.jpg','李李','','河南省郑州市金水区',5,'123456'),(8,'/media/avatar/1789389578096dl12j33x.jpg','嘎嘎','','河南省郑州市金水区',6,'123456');
/*!40000 ALTER TABLE `app_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add goods',7,'add_goods'),(26,'Can change goods',7,'change_goods'),(27,'Can delete goods',7,'delete_goods'),(28,'Can view goods',7,'view_goods'),(29,'Can add users',8,'add_users'),(30,'Can change users',8,'change_users'),(31,'Can delete users',8,'delete_users'),(32,'Can view users',8,'view_users'),(33,'Can add order',9,'add_order'),(34,'Can change order',9,'change_order'),(35,'Can delete order',9,'delete_order'),(36,'Can view order',9,'view_order'),(37,'Can add dianpu',10,'add_dianpu'),(38,'Can change dianpu',10,'change_dianpu'),(39,'Can delete dianpu',10,'delete_dianpu'),(40,'Can view dianpu',10,'view_dianpu'),(41,'Can add comments',11,'add_comments'),(42,'Can change comments',11,'change_comments'),(43,'Can delete comments',11,'delete_comments'),(44,'Can view comments',11,'view_comments');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (4,'pbkdf2_sha256$320000$o8DVJA4I41BcgyN0CBKf9u$cTQpPVcgeNjA7Oi1+aSiZqRAkLLtvgclWZdPb6CERGM=',NULL,0,'12345678','0','','3163981881@qq.com',0,1,'2026-09-08 14:03:08.340512'),(5,'pbkdf2_sha256$320000$aImlRmMRSDe67jm6Vm3pLS$DO508oLH7s1x2k9ghiMQj2FXETK8rd73mkgWBUEAwgo=',NULL,0,'111111','0','','779400255@qq.com',0,1,'2026-09-12 07:02:33.276976'),(6,'pbkdf2_sha256$320000$pME64z4L8PpWplGDyDcJwZ$XMMw533E+RaawgF5VVRGtbc9Xw5yAgBDFp1DXIEdgsg=',NULL,0,'410621','0','','459292210@qq.com',0,1,'2026-09-14 12:38:08.419704');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(11,'app','comments'),(10,'app','dianpu'),(7,'app','goods'),(9,'app','order'),(8,'app','users'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2026-09-02 09:38:24.713657'),(2,'auth','0001_initial','2026-09-02 09:38:25.989567'),(3,'admin','0001_initial','2026-09-02 09:38:26.247691'),(4,'admin','0002_logentry_remove_auto_add','2026-09-02 09:38:26.261453'),(5,'admin','0003_logentry_add_action_flag_choices','2026-09-02 09:38:26.273678'),(6,'contenttypes','0002_remove_content_type_name','2026-09-02 09:38:26.462718'),(7,'auth','0002_alter_permission_name_max_length','2026-09-02 09:38:26.577946'),(8,'auth','0003_alter_user_email_max_length','2026-09-02 09:38:26.612981'),(9,'auth','0004_alter_user_username_opts','2026-09-02 09:38:26.625888'),(10,'auth','0005_alter_user_last_login_null','2026-09-02 09:38:26.710309'),(11,'auth','0006_require_contenttypes_0002','2026-09-02 09:38:26.718887'),(12,'auth','0007_alter_validators_add_error_messages','2026-09-02 09:38:26.727289'),(13,'auth','0008_alter_user_username_max_length','2026-09-02 09:38:26.844456'),(14,'auth','0009_alter_user_last_name_max_length','2026-09-02 09:38:26.968337'),(15,'auth','0010_alter_group_name_max_length','2026-09-02 09:38:26.996455'),(16,'auth','0011_update_proxy_permissions','2026-09-02 09:38:27.008532'),(17,'auth','0012_alter_user_first_name_max_length','2026-09-02 09:38:27.123898'),(18,'sessions','0001_initial','2026-09-02 09:38:27.190503'),(37,'app','0001_initial','2026-09-13 13:06:26.170324'),(38,'app','0002_auto_20260913_2102','2026-09-13 13:06:26.176483'),(39,'app','0003_comment_delete_comments','2026-09-13 13:16:30.286978');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-09-18 20:41:44
