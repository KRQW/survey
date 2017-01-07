/*
SQLyog Ultimate v11.27 (32 bit)
MySQL - 5.7.17-log 
*********************************************************************
*/
/*!40101 SET NAMES utf8 */;

create table `sheet` (
	`id` varchar (96),
	`title` varchar (600),
	`createdTime` datetime ,
	`startTime` datetime ,
	`endTime` datetime ,
	`items` varchar (3000),
	`type` int (2)
); 
insert into `sheet` (`id`, `title`, `createdTime`, `startTime`, `endTime`, `items`, `type`) values('2d3ce2a1d2ec11e6a42eb083fe7074d5','问卷调查测试','2017-01-05 10:10:49','2017-01-06 18:17:30','2017-01-31 18:17:37','[{\"type\": \"checkbox\", \"items\": [{\"title\": \"旅游\"}, {\"title\": \"游泳\"}, {\"title\": \"唱歌\"}, {\"title\": \"跳舞\"}, {\"title\": \"阅读\"}], \"title\": \"爱好\", \"required\": 1, \"subTitle\": \"\"}, {\"type\": \"radio\", \"items\": [{\"title\": \"是\"}, {\"title\": \"否\"}], \"title\": \"婚否\", \"required\": 1, \"subTitle\": \"\"}, {\"type\": \"textarea\", \"title\": \"住址\", \"required\": 1}]',NULL);
insert into `sheet` (`id`, `title`, `createdTime`, `startTime`, `endTime`, `items`, `type`) values('30668080d48911e6828e80fa5b16ab32','日志测试','2017-01-07 11:27:16','2017-01-07 11:29:09','2017-01-31 11:29:12','[{\"type\": \"text\", \"title\": \"姓名\", \"required\": 1}, {\"type\": \"textarea\", \"title\": \"地址\", \"required\": 1}, {\"type\": \"checkbox\", \"items\": [{\"title\": \"游泳\"}, {\"title\": \"旅游\"}], \"title\": \"爱好\", \"required\": 1, \"subTitle\": \"\"}]',NULL);
insert into `sheet` (`id`, `title`, `createdTime`, `startTime`, `endTime`, `items`, `type`) values('357e8163d48911e6828e80fa5b16ab32','日志测试','2017-01-07 11:27:25','2017-01-07 11:29:16','2017-01-31 11:29:22','[{\"type\": \"text\", \"title\": \"姓名\", \"required\": 1}, {\"type\": \"text\", \"title\": \"职业\", \"required\": 1}, {\"type\": \"radio\", \"items\": [{\"title\": \"男\"}, {\"title\": \"女\"}], \"title\": \"性别\", \"required\": 1, \"subTitle\": \"\"}]',NULL);
insert into `sheet` (`id`, `title`, `createdTime`, `startTime`, `endTime`, `items`, `type`) values('847e981ed48911e6828e80fa5b16ab32','日志测试','2017-01-07 11:29:37','2017-01-07 11:29:42','2017-01-31 11:29:46','[{\"type\": \"text\", \"title\": \"地址\", \"required\": 1}, {\"type\": \"text\", \"title\": \"年龄\", \"required\": 1}, {\"type\": \"checkbox\", \"items\": [{\"title\": \"游泳\"}, {\"title\": \"旅游\"}, {\"title\": \"唱歌\"}], \"title\": \"爱好\", \"required\": 1, \"subTitle\": \"\"}]',NULL);
insert into `sheet` (`id`, `title`, `createdTime`, `startTime`, `endTime`, `items`, `type`) values('ae732420d3fa11e6806ab083fe7074d5','报名测试','2017-01-06 18:27:10','2017-01-06 18:27:25','2017-01-31 18:27:28','[{\"type\": \"checkbox\", \"items\": [{\"title\": \"旅游\"}, {\"title\": \"游泳\"}, {\"title\": \"唱歌\"}, {\"title\": \"跳舞\"}, {\"title\": \"阅读\"}], \"title\": \"爱好\", \"required\": 1, \"subTitle\": \"\"}, {\"type\": \"radio\", \"items\": [{\"title\": \"是\"}, {\"title\": \"否\"}], \"title\": \"婚否\", \"required\": 1, \"subTitle\": \"\"}, {\"type\": \"textarea\", \"title\": \"住址\", \"required\": 1}, {\"type\": \"image\", \"title\": \"你的靓照\", \"required\": 1}]',NULL);
