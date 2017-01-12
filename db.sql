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

/*Table structure for table `result` */

DROP TABLE IF EXISTS `result`;

CREATE TABLE `result` (
  `id` varchar(36) NOT NULL,
  `createdTime` datetime DEFAULT CURRENT_TIMESTAMP,
  `uId` varchar(36) DEFAULT '',
  `sId` varchar(36) DEFAULT '',
  `status` int(2) DEFAULT '0',
  `items` varchar(500) DEFAULT '',
  PRIMARY KEY (`id`),
  FULLTEXT KEY `sid` (`sId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `result` */

insert  into `result`(`id`,`createdTime`,`uId`,`sId`,`status`,`items`) values ('21c368aad7ae11e68454b083fe7074d5','2017-01-11 11:29:17','::ffff:192.168.1.119','847e981ed48911e6828e80fa5b16ab32',0,'[{\"q\":\"地址\",\"a\":\"深圳南山\"},{\"q\":\"年龄\",\"a\":\"22\"},{\"q\":\"爱好\",\"a\":[\"游泳\",\"旅游\",\"唱歌\"]}]'),('36ccd805d7ae11e68454b083fe7074d5','2017-01-11 11:29:52','::ffff:192.168.1.119','357e8163d48911e6828e80fa5b16ab32',0,'[{\"q\":\"姓名\",\"a\":\"测试项目\"},{\"q\":\"职业\",\"a\":\"IT\"},{\"q\":\"性别\",\"a\":\"男\"}]'),('4140c90ad7ae11e68454b083fe7074d5','2017-01-11 11:30:10','::ffff:192.168.1.119','30668080d48911e6828e80fa5b16ab32',0,'[{\"q\":\"姓名\",\"a\":\"姓名测试\"},{\"q\":\"地址\",\"a\":\"深圳南山\"},{\"q\":\"爱好\",\"a\":[\"游泳\",\"旅游\"]}]'),('483657b0d7ae11e68454b083fe7074d5','2017-01-11 11:30:21','::ffff:192.168.1.119','ae732420d3fa11e6806ab083fe7074d5',0,'[{\"q\":\"爱好\",\"a\":[\"旅游\"]},{\"q\":\"婚否\",\"a\":\"是\"},{\"q\":\"住址\",\"a\":\"深圳南山\"},{\"q\":\"你的靓照\",\"a\":\"\"}]'),('c17062cbd7ae11e68454b083fe7074d5','2017-01-11 11:33:45','::ffff:192.168.1.119','2d3ce2a1d2ec11e6a42eb083fe7074d5',0,'[{\"q\":\"邮箱\",\"a\":\"test@gmail.com\"},{\"q\":\"年龄\",\"a\":\"22\"},{\"q\":\"是否喜欢唱歌\",\"a\":\"喜欢\"},{\"q\":\"是否爱游泳\",\"a\":\"喜欢\"},{\"q\":\"最喜欢的水果\",\"a\":[\"香蕉\",\"苹果\"]},{\"q\":\"住址\",\"a\":\"南山\"},{\"q\":\"照片\",\"a\":\"pic:690921584414913.jpg\"}]');

/*Table structure for table `sheet` */

DROP TABLE IF EXISTS `sheet`;

CREATE TABLE `sheet` (
  `id` varchar(32) NOT NULL,
  `title` varchar(200) DEFAULT '',
  `createdTime` datetime DEFAULT CURRENT_TIMESTAMP,
  `startTime` datetime DEFAULT NULL,
  `endTime` datetime DEFAULT NULL,
  `items` varchar(1000) DEFAULT '',
  `type` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sheet` */

insert  into `sheet`(`id`,`title`,`createdTime`,`startTime`,`endTime`,`items`,`type`) values ('2d3ce2a1d2ec11e6a42eb083fe7074d5','vue-demo问卷调查测试','2017-01-10 10:10:49','2017-01-06 18:17:30','2017-01-31 18:17:37','[{\"type\":\"text\",\"title\":\"邮箱\",\"verify\":\"email\",\"required\":1},{\"type\":\"text\",\"title\":\"年龄\",\"verify\":\"age\",\"required\":1},{\"type\":\"radio\",\"items\":[{\"title\":\"喜欢\"},{\"title\":\"不喜欢\"}],\"title\":\"是否喜欢唱歌\",\"required\":1,\"subTitle\":\"\"},{\"type\":\"radio\",\"items\":[{\"title\":\"喜欢\"},{\"title\":\"不喜欢\"}],\"title\":\"是否爱游泳\",\"required\":1,\"subTitle\":\"\"},{\"type\":\"checkbox\",\"items\":[{\"title\":\"香蕉\"},{\"title\":\"苹果\"},{\"title\":\"橘子\"},{\"title\":\"葡萄\"},{\"title\":\"榴莲\"}],\"title\":\"最喜欢的水果\",\"required\":1,\"subTitle\":\"\"},{\"type\":\"textarea\",\"title\":\"住址\",\"required\":0},{\"type\":\"image\",\"title\":\"照片\",\"required\":1}]',NULL),('30668080d48911e6828e80fa5b16ab32','vue-demo问卷测试3','2017-01-10 11:27:16','2017-01-07 11:29:09','2017-01-31 11:29:12','[{\"type\": \"text\", \"title\": \"姓名\", \"required\": 1}, {\"type\": \"textarea\", \"title\": \"地址\", \"required\": 1}, {\"type\": \"checkbox\", \"items\": [{\"title\": \"游泳\"}, {\"title\": \"旅游\"}], \"title\": \"爱好\", \"required\": 1, \"subTitle\": \"\"}]',NULL),('357e8163d48911e6828e80fa5b16ab32','vue-demo问卷测试2','2017-01-10 11:27:25','2017-01-07 11:29:16','2017-01-31 11:29:22','[{\"type\": \"text\", \"title\": \"姓名\", \"required\": 1}, {\"type\": \"text\", \"title\": \"职业\", \"required\": 1}, {\"type\": \"radio\", \"items\": [{\"title\": \"男\"}, {\"title\": \"女\"}], \"title\": \"性别\", \"required\": 1, \"subTitle\": \"\"}]',NULL),('847e981ed48911e6828e80fa5b16ab32','vue-demo问卷测试1','2017-01-10 11:29:37','2017-01-07 11:29:42','2017-01-31 11:29:46','[{\"type\": \"text\", \"title\": \"地址\", \"required\": 1}, {\"type\": \"text\", \"title\": \"年龄\", \"required\": 1}, {\"type\": \"checkbox\", \"items\": [{\"title\": \"游泳\"}, {\"title\": \"旅游\"}, {\"title\": \"唱歌\"}], \"title\": \"爱好\", \"required\": 1, \"subTitle\": \"\"}]',NULL),('ae732420d3fa11e6806ab083fe7074d5','vue-demo问卷测试','2017-01-10 18:27:10','2017-01-06 18:27:25','2017-01-31 18:27:28','[{\"type\": \"checkbox\", \"items\": [{\"title\": \"旅游\"}, {\"title\": \"游泳\"}, {\"title\": \"唱歌\"}, {\"title\": \"跳舞\"}, {\"title\": \"阅读\"}], \"title\": \"爱好\", \"required\": 1, \"subTitle\": \"\"}, {\"type\": \"radio\", \"items\": [{\"title\": \"是\"}, {\"title\": \"否\"}], \"title\": \"婚否\", \"required\": 1, \"subTitle\": \"\"}, {\"type\": \"textarea\", \"title\": \"住址\", \"required\": 0}, {\"type\": \"image\", \"title\": \"你的靓照\", \"required\": 1}]',NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
