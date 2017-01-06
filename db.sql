/*
SQLyog Enterprise v12.09 (64 bit)
MySQL - 5.7.17-log : Database - survey
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`survey` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `survey`;

/*Table structure for table `sheet` */

DROP TABLE IF EXISTS `sheet`;

CREATE TABLE `sheet` (
  `id` varchar(32) NOT NULL,
  `title` varchar(200) DEFAULT '',
  `createdTime` datetime DEFAULT CURRENT_TIMESTAMP,
  `startTime` datetime DEFAULT NULL,
  `endTime` datetime DEFAULT NULL,
  `items` varchar(1000) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sheet` */

insert  into `sheet`(`id`,`title`,`createdTime`,`startTime`,`endTime`,`items`) values ('2d3ce2a1d2ec11e6a42eb083fe7074d5','问卷调查测试','2017-01-05 10:10:49','2017-01-06 18:17:30','2017-01-31 18:17:37','{\"dd\":\"cc\"}'),('ae732420d3fa11e6806ab083fe7074d5','报名测试','2017-01-06 18:27:10','2017-01-06 18:27:25','2017-01-31 18:27:28','{\"dd\":\"cc\"}');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
