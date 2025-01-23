/*
SQLyog Community v13.2.0 (64 bit)
MySQL - 8.1.0 : Database - db_blog3
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_blog3` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `db_blog3`;

/*Table structure for table `album_albuminfo` */

DROP TABLE IF EXISTS `album_albuminfo`;

CREATE TABLE `album_albuminfo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `introduce` varchar(200) NOT NULL,
  `photo` varchar(100) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `album_albuminfo_user_id_ef08f7d4_fk_user_myuser_id` (`user_id`),
  CONSTRAINT `album_albuminfo_user_id_ef08f7d4_fk_user_myuser_id` FOREIGN KEY (`user_id`) REFERENCES `user_myuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `album_albuminfo` */

insert  into `album_albuminfo`(`id`,`title`,`introduce`,`photo`,`user_id`) values 
(1,'图片1','图片1介绍','album/1.jpg',1),
(2,'图片2','图片2介绍','album/2.jpg',1),
(3,'图片3','图片3介绍','album/3.jpg',1),
(4,'图片4','图片4介绍','album/4.jpg',1),
(5,'图片5','图片5介绍','album/5.jpg',1),
(6,'图片6','图片6介绍','album/6.jpg',1),
(7,'图片7','图片7介绍','album/7.jpg',1),
(8,'图片8','图片8介绍','album/8.jpg',1),
(9,'图片9','图片9介绍','album/9.jpg',1),
(10,'图片10','图片10介绍','album/10.jpg',1),
(11,'图片11','图片11介绍','album/11.jpg',1),
(13,'1','2','album/33.jpg',1),
(14,'我去1','不从啊','album/55.jpg',1);

/*Table structure for table `article_article` */

DROP TABLE IF EXISTS `article_article`;

CREATE TABLE `article_article` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `content` varchar(1000) NOT NULL,
  `image` varchar(100) NOT NULL,
  `reads` int NOT NULL,
  `abstract` varchar(300) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `update_time` datetime(6) NOT NULL,
  `author_id` bigint NOT NULL,
  `type_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `article_article_author_id_e6b479f8_fk_user_myuser_id` (`author_id`),
  KEY `article_article_type_id_f3debe9a_fk_article_articletype_id` (`type_id`),
  CONSTRAINT `article_article_author_id_e6b479f8_fk_user_myuser_id` FOREIGN KEY (`author_id`) REFERENCES `user_myuser` (`id`),
  CONSTRAINT `article_article_type_id_f3debe9a_fk_article_articletype_id` FOREIGN KEY (`type_id`) REFERENCES `article_articletype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `article_article` */

insert  into `article_article`(`id`,`title`,`content`,`image`,`reads`,`abstract`,`create_time`,`update_time`,`author_id`,`type_id`) values 
(1,'1','文字是心灵的港湾，是我们与世界相连接的桥梁。在文字的世界里，我们可以感受到历史的沧桑，体味生活的美好。文字是心灵的港湾，是我们与世界相连接的桥梁。在文字的世界里，我们可以感受到历史的沧桑，体味生活的美好。文字是心灵的港湾，是我们与世界相连接的桥梁。在文字的世界里，我们可以感受到历史的沧桑，体味生活的美好。文字是心灵的港湾，是我们与世界相连接的桥梁。在文字的世界里，我们可以感受到历史的沧桑，体味生活的美好。文字是心灵的港湾，是我们与世界相连接的桥梁。在文字的世界里，我们可以感受到历史的沧桑，体味生活的美好。','article/11.png',48,'文字是心灵的港湾，是我们与世界相连接的桥梁。','2024-12-04 15:50:55.000000','2024-12-03 15:50:55.000000',1,1),
(2,'1','2','article/22.jpg',1,'11','2024-12-03 15:56:24.000000','2024-12-03 15:56:24.000000',1,1),
(3,'2','2','',1,'11','2024-12-03 15:56:24.000000','2024-12-03 15:56:24.000000',1,1),
(4,'3','2','',1,'11','2024-12-03 15:56:24.000000','2024-12-03 15:56:24.000000',1,1),
(5,'是的','2','',1,'11','2024-12-01 15:56:24.000000','2024-12-03 15:56:24.000000',1,1),
(6,'5','2','',1,'11','2024-12-03 15:56:24.000000','2024-12-03 15:56:24.000000',1,1),
(7,'6','2','',1,'11','2024-12-03 15:56:24.000000','2024-12-03 15:56:24.000000',1,1),
(8,'7','2','',1,'11','2024-12-03 15:56:24.000000','2024-12-03 15:56:24.000000',1,1),
(9,'8','好啊是的','',2,'11','2024-12-03 15:56:24.000000','2024-12-03 15:56:24.000000',1,1),
(10,'9','2','',1,'11','2024-12-02 15:56:24.000000','2024-12-03 15:56:24.000000',1,2),
(11,'10','2','',1,'11','2024-12-03 15:56:24.000000','2024-12-03 15:56:24.000000',1,2),
(12,'1','<p>1</p>','',2,'1','2024-12-17 03:26:00.000000','2024-12-17 03:27:26.235658',1,2),
(15,'带儿子去看植物','<p>太牛逼了。</p>\r\n\r\n<p><img alt=\"\" src=\"/media/article_images/2024/12/18/login-background.jpg\" style=\"height:394px; width:700px\" /></p>','article/login-background.jpg',9,'超大的仙人掌','2024-12-18 00:18:00.000000','2024-12-18 00:23:33.002701',1,3);

/*Table structure for table `article_articletype` */

DROP TABLE IF EXISTS `article_articletype`;

CREATE TABLE `article_articletype` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `article_articletype_user_id_86358c8c_fk_user_myuser_id` (`user_id`),
  CONSTRAINT `article_articletype_user_id_86358c8c_fk_user_myuser_id` FOREIGN KEY (`user_id`) REFERENCES `user_myuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `article_articletype` */

insert  into `article_articletype`(`id`,`name`,`user_id`) values 
(1,'python基础1',1),
(2,'数据分析2',1),
(3,'人工智能3',1);

/*Table structure for table `article_comment` */

DROP TABLE IF EXISTS `article_comment`;

CREATE TABLE `article_comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user` varchar(60) NOT NULL,
  `content` longtext NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `article_id` int NOT NULL,
  `author_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `article_comment_article_id_4fa145bf_fk_article_article_id` (`article_id`),
  KEY `article_comment_author_id_9487a55a_fk_user_myuser_id` (`author_id`),
  CONSTRAINT `article_comment_article_id_4fa145bf_fk_article_article_id` FOREIGN KEY (`article_id`) REFERENCES `article_article` (`id`),
  CONSTRAINT `article_comment_author_id_9487a55a_fk_user_myuser_id` FOREIGN KEY (`author_id`) REFERENCES `user_myuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `article_comment` */

insert  into `article_comment`(`id`,`user`,`content`,`create_time`,`article_id`,`author_id`) values 
(1,'jack','11111','2024-12-06 17:34:16.000000',1,1),
(2,'张三','222','2024-12-06 17:34:58.000000',1,1),
(3,'匿名用户','11','2024-12-06 13:04:21.494838',1,1),
(4,'匿名用户','3232','2024-12-06 13:05:40.925858',1,1),
(5,'匿名用户','eewew','2024-12-06 00:00:00.000000',1,1),
(6,'匿名用户','方式电风扇','2024-12-06 21:08:18.300357',1,1),
(7,'11','11','2024-12-13 18:06:34.000000',1,1),
(8,'11','牛逼','2024-12-28 17:22:27.041900',15,1),
(9,'666','不错！','2024-12-28 18:05:42.221089',15,1),
(10,'32','11','2025-01-09 20:43:32.813306',1,1),
(11,'匿名用户','111','2025-01-09 20:43:41.994800',1,1),
(12,'老六','好玩啊','2025-01-09 20:43:52.592517',1,1);

/*Table structure for table `auth_group` */

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_group` */

/*Table structure for table `auth_group_permissions` */

DROP TABLE IF EXISTS `auth_group_permissions`;

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

/*Data for the table `auth_group_permissions` */

/*Table structure for table `auth_permission` */

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_permission` */

insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values 
(1,'Can add log entry',1,'add_logentry'),
(2,'Can change log entry',1,'change_logentry'),
(3,'Can delete log entry',1,'delete_logentry'),
(4,'Can view log entry',1,'view_logentry'),
(5,'Can add permission',2,'add_permission'),
(6,'Can change permission',2,'change_permission'),
(7,'Can delete permission',2,'delete_permission'),
(8,'Can view permission',2,'view_permission'),
(9,'Can add group',3,'add_group'),
(10,'Can change group',3,'change_group'),
(11,'Can delete group',3,'delete_group'),
(12,'Can view group',3,'view_group'),
(13,'Can add content type',4,'add_contenttype'),
(14,'Can change content type',4,'change_contenttype'),
(15,'Can delete content type',4,'delete_contenttype'),
(16,'Can view content type',4,'view_contenttype'),
(17,'Can add session',5,'add_session'),
(18,'Can change session',5,'change_session'),
(19,'Can delete session',5,'delete_session'),
(20,'Can view session',5,'view_session'),
(21,'Can add user',6,'add_myuser'),
(22,'Can change user',6,'change_myuser'),
(23,'Can delete user',6,'delete_myuser'),
(24,'Can view user',6,'view_myuser'),
(25,'Can add 博客类别管理',7,'add_articletype'),
(26,'Can change 博客类别管理',7,'change_articletype'),
(27,'Can delete 博客类别管理',7,'delete_articletype'),
(28,'Can view 博客类别管理',7,'view_articletype'),
(29,'Can add 友情链接管理',8,'add_linkinfo'),
(30,'Can change 友情链接管理',8,'change_linkinfo'),
(31,'Can delete 友情链接管理',8,'delete_linkinfo'),
(32,'Can view 友情链接管理',8,'view_linkinfo'),
(33,'Can add 博客帖子管理',9,'add_article'),
(34,'Can change 博客帖子管理',9,'change_article'),
(35,'Can delete 博客帖子管理',9,'delete_article'),
(36,'Can view 博客帖子管理',9,'view_article'),
(37,'Can add 评论管理',10,'add_comment'),
(38,'Can change 评论管理',10,'change_comment'),
(39,'Can delete 评论管理',10,'delete_comment'),
(40,'Can view 评论管理',10,'view_comment'),
(41,'Can add 图片墙管理',11,'add_albuminfo'),
(42,'Can change 图片墙管理',11,'change_albuminfo'),
(43,'Can delete 图片墙管理',11,'delete_albuminfo'),
(44,'Can view 图片墙管理',11,'view_albuminfo'),
(45,'Can add 留言管理',12,'add_message'),
(46,'Can change 留言管理',12,'change_message'),
(47,'Can delete 留言管理',12,'delete_message'),
(48,'Can view 留言管理',12,'view_message');

/*Table structure for table `django_admin_log` */

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_user_myuser_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_user_myuser_id` FOREIGN KEY (`user_id`) REFERENCES `user_myuser` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_admin_log` */

/*Table structure for table `django_content_type` */

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_content_type` */

insert  into `django_content_type`(`id`,`app_label`,`model`) values 
(1,'admin','logentry'),
(11,'album','albuminfo'),
(9,'article','article'),
(7,'article','articletype'),
(10,'article','comment'),
(3,'auth','group'),
(2,'auth','permission'),
(4,'contenttypes','contenttype'),
(8,'link','linkinfo'),
(12,'message','message'),
(5,'sessions','session'),
(6,'user','myuser');

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_migrations` */

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values 
(1,'article','0001_initial','2024-12-30 03:55:00.017518'),
(2,'contenttypes','0001_initial','2025-01-01 09:18:05.782708'),
(3,'contenttypes','0002_remove_content_type_name','2025-01-01 09:18:05.815708'),
(4,'auth','0001_initial','2025-01-01 09:18:05.971866'),
(5,'auth','0002_alter_permission_name_max_length','2025-01-01 09:18:06.019867'),
(6,'auth','0003_alter_user_email_max_length','2025-01-01 09:18:06.027867'),
(7,'auth','0004_alter_user_username_opts','2025-01-01 09:18:06.035885'),
(8,'auth','0005_alter_user_last_login_null','2025-01-01 09:18:06.041872'),
(9,'auth','0006_require_contenttypes_0002','2025-01-01 09:18:06.047871'),
(10,'auth','0007_alter_validators_add_error_messages','2025-01-01 09:18:06.054380'),
(11,'auth','0008_alter_user_username_max_length','2025-01-01 09:18:06.061380'),
(12,'auth','0009_alter_user_last_name_max_length','2025-01-01 09:18:06.067380'),
(13,'auth','0010_alter_group_name_max_length','2025-01-01 09:18:06.082379'),
(14,'auth','0011_update_proxy_permissions','2025-01-01 09:18:06.089379'),
(15,'auth','0012_alter_user_first_name_max_length','2025-01-01 09:18:06.096381'),
(16,'user','0001_initial','2025-01-01 09:18:06.287728'),
(17,'admin','0001_initial','2025-01-01 09:18:06.363861'),
(18,'admin','0002_logentry_remove_auto_add','2025-01-01 09:18:06.369862'),
(19,'admin','0003_logentry_add_action_flag_choices','2025-01-01 09:18:06.374875'),
(20,'sessions','0001_initial','2025-01-01 09:18:06.400392'),
(21,'article','0002_articletype_user','2025-01-05 03:39:33.188015'),
(22,'link','0001_initial','2025-01-05 03:47:43.253216'),
(23,'article','0003_article','2025-01-06 11:49:47.650677'),
(24,'article','0004_comment','2025-01-09 12:19:14.901441'),
(25,'album','0001_initial','2025-01-10 10:47:43.427251'),
(26,'message','0001_initial','2025-01-12 03:36:24.908809');

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_session` */

insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values 
('0p8ch8isbz0q6dkm54gygfrhkj7grpqy','.eJxVjDsOwjAQBe_iGlleO_5R0nMGa3ft4ABypDipEHeHSCmgfTPzXiLhtta09bKkKYuzAHH63Qj5UdoO8h3bbZY8t3WZSO6KPGiX1zmX5-Vw_w4q9vqtHfngfaTggR0jaVCkALSB6CgWM-jRBY6gmLM1wToPMIzKoEOLxmjx_gC7jTaj:1tVray:VIee2xKKOOAagmdBuvWpbYuHwkQBg8Tn3-_rvM8A86s','2025-01-23 12:25:04.654008'),
('564biqri30585f3638g6dtra3oe5xzvh','.eJxVjDsOwjAQBe_iGlleO_5R0nMGa3ft4ABypDipEHeHSCmgfTPzXiLhtta09bKkKYuzAHH63Qj5UdoO8h3bbZY8t3WZSO6KPGiX1zmX5-Vw_w4q9vqtHfngfaTggR0jaVCkALSB6CgWM-jRBY6gmLM1wToPMIzKoEOLxmjx_gC7jTaj:1tUHei:tKbpT6tRq8M1RtkykNmoTrVWkpTrtuPn8MeQHGjbx7U','2025-01-19 03:50:24.451770'),
('gcqnq1u5g45txiolk5ke1q5rec2fjw4z','.eJxVjDsOwjAQBe_iGlleO_5R0nMGa3ft4ABypDipEHeHSCmgfTPzXiLhtta09bKkKYuzAHH63Qj5UdoO8h3bbZY8t3WZSO6KPGiX1zmX5-Vw_w4q9vqtHfngfaTggR0jaVCkALSB6CgWM-jRBY6gmLM1wToPMIzKoEOLxmjx_gC7jTaj:1tTd1O:RgTdYdwcKfqzKVjb093M-O_Kuzx_M-fK_va2ZMzbV9Q','2025-01-17 08:27:06.195426'),
('gvio3e585rk7vclgklgfwoudy7gf66ki','.eJxVjDsOwjAQBe_iGlleO_5R0nMGa3ft4ABypDipEHeHSCmgfTPzXiLhtta09bKkKYuzAHH63Qj5UdoO8h3bbZY8t3WZSO6KPGiX1zmX5-Vw_w4q9vqtHfngfaTggR0jaVCkALSB6CgWM-jRBY6gmLM1wToPMIzKoEOLxmjx_gC7jTaj:1tUlio:Km2ewRvL-hZVLuFaMyZqPyAPkwyj-t_Q6eOjhZLNcdQ','2025-01-20 11:56:38.588120'),
('mybwrov935vfzjv2z2c2nze15wo44yt1','.eJxVjDsOwjAQBe_iGlleO_5R0nMGa3ft4ABypDipEHeHSCmgfTPzXiLhtta09bKkKYuzAHH63Qj5UdoO8h3bbZY8t3WZSO6KPGiX1zmX5-Vw_w4q9vqtHfngfaTggR0jaVCkALSB6CgWM-jRBY6gmLM1wToPMIzKoEOLxmjx_gC7jTaj:1tWotY:ddA-HY4amXsNJNGa1rKocDl3Glkn9JXqXcUjo3gmjJQ','2025-01-26 03:44:12.177148'),
('oinz2qb2e48q95nova32xdxx6bvtn797','.eJxVjDsOwjAQBe_iGlleO_5R0nMGa3ft4ABypDipEHeHSCmgfTPzXiLhtta09bKkKYuzAHH63Qj5UdoO8h3bbZY8t3WZSO6KPGiX1zmX5-Vw_w4q9vqtHfngfaTggR0jaVCkALSB6CgWM-jRBY6gmLM1wToPMIzKoEOLxmjx_gC7jTaj:1tTvYL:UE26Vwv65q0umlJyPVR6ke8L8h3Zt2mQz1ioFIWSt_Q','2025-01-18 04:14:21.371618'),
('omqw7hzxohwtx433vhvxpoke5oa6kuzm','.eJxVjDsOwjAQBe_iGlleO_5R0nMGa3ft4ABypDipEHeHSCmgfTPzXiLhtta09bKkKYuzAHH63Qj5UdoO8h3bbZY8t3WZSO6KPGiX1zmX5-Vw_w4q9vqtHfngfaTggR0jaVCkALSB6CgWM-jRBY6gmLM1wToPMIzKoEOLxmjx_gC7jTaj:1tV8LT:KdUI1c5iqdSfuVzHR8s2vLroLI7_xctf-EIl4Sd0-DM','2025-01-21 12:06:03.926388'),
('qag006opg7vnxo5t41rw3d0428v6ajfo','.eJxVjDsOwjAQBe_iGlleO_5R0nMGa3ft4ABypDipEHeHSCmgfTPzXiLhtta09bKkKYuzAHH63Qj5UdoO8h3bbZY8t3WZSO6KPGiX1zmX5-Vw_w4q9vqtHfngfaTggR0jaVCkALSB6CgWM-jRBY6gmLM1wToPMIzKoEOLxmjx_gC7jTaj:1tWChX:yPa30Hu1FRrnLhlA-fwzPXRcIMvph0ndSyhJob5p8rA','2025-01-24 10:57:15.142182'),
('seapq4q1blk0em5apokk3h18pcf8tiin','.eJxVjDsOwjAQBe_iGlleO_5R0nMGa3ft4ABypDipEHeHSCmgfTPzXiLhtta09bKkKYuzAHH63Qj5UdoO8h3bbZY8t3WZSO6KPGiX1zmX5-Vw_w4q9vqtHfngfaTggR0jaVCkALSB6CgWM-jRBY6gmLM1wToPMIzKoEOLxmjx_gC7jTaj:1tVN5U:d6OnlnQ8PTCjI9NxnvpWlniulw9-D9bJW7DnMSJ7cQM','2025-01-22 03:50:32.948950'),
('ucylbwqc1x4uvfgpv561ond9ypsflqkx','.eJxVjDsOwjAQBe_iGlleO_5R0nMGa3ft4ABypDipEHeHSCmgfTPzXiLhtta09bKkKYuzAHH63Qj5UdoO8h3bbZY8t3WZSO6KPGiX1zmX5-Vw_w4q9vqtHfngfaTggR0jaVCkALSB6CgWM-jRBY6gmLM1wToPMIzKoEOLxmjx_gC7jTaj:1taB7f:ksiDdFxr93z4ORJ8P5sjCNWtLrMoiYHhlieAGWkOE4g','2025-02-04 10:04:39.403358'),
('xrdmojhxwli93outrvdsfjdaifjp6b39','.eJxVjDsOwjAQBe_iGlleO_5R0nMGa3ft4ABypDipEHeHSCmgfTPzXiLhtta09bKkKYuzAHH63Qj5UdoO8h3bbZY8t3WZSO6KPGiX1zmX5-Vw_w4q9vqtHfngfaTggR0jaVCkALSB6CgWM-jRBY6gmLM1wToPMIzKoEOLxmjx_gC7jTaj:1tXHQA:pFDGoAEoyMF-nF_2TXt1_zNdFOJ8hKb9snO5aofgRCw','2025-01-27 10:11:46.843376');

/*Table structure for table `link_linkinfo` */

DROP TABLE IF EXISTS `link_linkinfo`;

CREATE TABLE `link_linkinfo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `url` varchar(200) NOT NULL,
  `remark` varchar(500) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `link_linkinfo_user_id_b50e4dbb_fk_user_myuser_id` (`user_id`),
  CONSTRAINT `link_linkinfo_user_id_b50e4dbb_fk_user_myuser_id` FOREIGN KEY (`user_id`) REFERENCES `user_myuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `link_linkinfo` */

insert  into `link_linkinfo`(`id`,`name`,`url`,`remark`,`user_id`) values 
(1,'java知识分享网1','http://www.java1234.com/','好网站',1),
(2,'java开源博客2','http://blog.java1234.com/index.html','好博客',1);

/*Table structure for table `message_message` */

DROP TABLE IF EXISTS `message_message`;

CREATE TABLE `message_message` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `content` varchar(500) NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `message_message_user_id_e5d1ceee_fk_user_myuser_id` (`user_id`),
  CONSTRAINT `message_message_user_id_e5d1ceee_fk_user_myuser_id` FOREIGN KEY (`user_id`) REFERENCES `user_myuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `message_message` */

insert  into `message_message`(`id`,`name`,`email`,`content`,`create_time`,`user_id`) values 
(1,'Jack逊','111@qq.com','牛逼','2024-12-11 10:41:59.000000',1),
(2,'Marry马','222@qq.com','哈哈','2024-12-10 10:43:55.000000',1),
(3,'1','1','1','2024-12-11 19:20:24.685254',1),
(4,'王老二','332@qq.com','真不错，学习了。','2024-12-11 19:20:48.869941',1),
(5,'1','2','3','2024-12-28 17:22:38.005017',1),
(6,'1','2','3','2025-01-12 11:54:27.271940',1),
(7,'王老二','111@11.com','真香！','2025-01-12 11:55:21.414661',1);

/*Table structure for table `user_myuser` */

DROP TABLE IF EXISTS `user_myuser`;

CREATE TABLE `user_myuser` (
  `id` bigint NOT NULL AUTO_INCREMENT,
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
  `name` varchar(50) NOT NULL,
  `introduce` longtext NOT NULL,
  `company` varchar(100) NOT NULL,
  `profession` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `telephone` varchar(11) NOT NULL,
  `wx` varchar(50) NOT NULL,
  `qq` varchar(50) NOT NULL,
  `avatar` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `user_myuser` */

insert  into `user_myuser`(`id`,`password`,`last_login`,`is_superuser`,`username`,`first_name`,`last_name`,`email`,`is_staff`,`is_active`,`date_joined`,`name`,`introduce`,`company`,`profession`,`address`,`telephone`,`wx`,`qq`,`avatar`) values 
(1,'pbkdf2_sha256$870000$MUdB4TuKrFxCthK8CEf91F$8qQ4t529pOR0Ssp33WtWixdhxlrXktwGQwxA8T4dSDg=','2025-01-21 10:04:39.399359',1,'python222','','','',1,1,'2025-01-03 08:17:57.142706','python222_小锋1','13年java,python老司机，高级讲师2','南通小锋网络科技有限公司','CEO','江苏南通XXX','18862857102','java9266','3320160706','avatar/222.jpg');

/*Table structure for table `user_myuser_groups` */

DROP TABLE IF EXISTS `user_myuser_groups`;

CREATE TABLE `user_myuser_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `myuser_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_myuser_groups_myuser_id_group_id_680fbae2_uniq` (`myuser_id`,`group_id`),
  KEY `user_myuser_groups_group_id_e21a6dfd_fk_auth_group_id` (`group_id`),
  CONSTRAINT `user_myuser_groups_group_id_e21a6dfd_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `user_myuser_groups_myuser_id_dfd02c0f_fk_user_myuser_id` FOREIGN KEY (`myuser_id`) REFERENCES `user_myuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `user_myuser_groups` */

/*Table structure for table `user_myuser_user_permissions` */

DROP TABLE IF EXISTS `user_myuser_user_permissions`;

CREATE TABLE `user_myuser_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `myuser_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_myuser_user_permiss_myuser_id_permission_id_ae8df385_uniq` (`myuser_id`,`permission_id`),
  KEY `user_myuser_user_per_permission_id_d16c386c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `user_myuser_user_per_myuser_id_5d2dcfb0_fk_user_myus` FOREIGN KEY (`myuser_id`) REFERENCES `user_myuser` (`id`),
  CONSTRAINT `user_myuser_user_per_permission_id_d16c386c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `user_myuser_user_permissions` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
