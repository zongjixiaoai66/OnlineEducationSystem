/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb3 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP DATABASE IF EXISTS `t060`;
CREATE DATABASE IF NOT EXISTS `t060` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `t060`;

DROP TABLE IF EXISTS `chat`;
CREATE TABLE IF NOT EXISTS `chat` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `userid` bigint NOT NULL COMMENT '用户id',
  `adminid` bigint DEFAULT NULL COMMENT '管理员id',
  `ask` longtext COMMENT '提问',
  `reply` longtext COMMENT '回复',
  `isreply` int DEFAULT NULL COMMENT '是否回复',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8mb3 COMMENT='客户服务';

DELETE FROM `chat`;
INSERT INTO `chat` (`id`, `addtime`, `userid`, `adminid`, `ask`, `reply`, `isreply`) VALUES
	(111, '2021-05-09 07:46:56', 1, 1, '提问1', '回复1', 1),
	(112, '2021-05-09 07:46:56', 2, 2, '提问2', '回复2', 2),
	(113, '2021-05-09 07:46:56', 3, 3, '提问3', '回复3', 3),
	(114, '2021-05-09 07:46:56', 4, 4, '提问4', '回复4', 4),
	(115, '2021-05-09 07:46:56', 5, 5, '提问5', '回复5', 5),
	(116, '2021-05-09 07:46:56', 6, 6, '提问6', '回复6', 6);

DROP TABLE IF EXISTS `config`;
CREATE TABLE IF NOT EXISTS `config` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COMMENT='配置文件';

DELETE FROM `config`;
INSERT INTO `config` (`id`, `name`, `value`) VALUES
	(1, 'picture1', 'http://localhost:8080/springbootus5uu/upload/picture1.jpg'),
	(2, 'picture2', 'http://localhost:8080/springbootus5uu/upload/picture2.jpg'),
	(3, 'picture3', 'http://localhost:8080/springbootus5uu/upload/picture3.jpg'),
	(6, 'homepage', 'https://asoa-1305425069.cos.ap-shanghai.myqcloud.com/1669635627773202432.png');

DROP TABLE IF EXISTS `discusskechengxinxi`;
CREATE TABLE IF NOT EXISTS `discusskechengxinxi` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `refid` bigint NOT NULL COMMENT '关联表id',
  `userid` bigint NOT NULL COMMENT '用户id',
  `nickname` varchar(200) DEFAULT NULL COMMENT '用户名',
  `content` longtext NOT NULL COMMENT '评论内容',
  `reply` longtext COMMENT '回复内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=197 DEFAULT CHARSET=utf8mb3 COMMENT='课程信息评论表';

DELETE FROM `discusskechengxinxi`;
INSERT INTO `discusskechengxinxi` (`id`, `addtime`, `refid`, `userid`, `nickname`, `content`, `reply`) VALUES
	(191, '2021-05-09 07:46:56', 1, 1, '用户名1', '评论内容1', '回复内容1'),
	(192, '2021-05-09 07:46:56', 2, 2, '用户名2', '评论内容2', '回复内容2'),
	(193, '2021-05-09 07:46:56', 3, 3, '用户名3', '评论内容3', '回复内容3'),
	(194, '2021-05-09 07:46:56', 4, 4, '用户名4', '评论内容4', '回复内容4'),
	(195, '2021-05-09 07:46:56', 5, 5, '用户名5', '评论内容5', '回复内容5'),
	(196, '2021-05-09 07:46:56', 6, 6, '用户名6', '评论内容6', '回复内容6');

DROP TABLE IF EXISTS `exampaper`;
CREATE TABLE IF NOT EXISTS `exampaper` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `name` varchar(200) NOT NULL COMMENT '试卷名称',
  `time` int NOT NULL COMMENT '考试时长(分钟)',
  `status` int NOT NULL DEFAULT '0' COMMENT '试卷状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='试卷表';

DELETE FROM `exampaper`;

DROP TABLE IF EXISTS `examquestion`;
CREATE TABLE IF NOT EXISTS `examquestion` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `paperid` bigint NOT NULL COMMENT '所属试卷id（外键）',
  `papername` varchar(200) NOT NULL COMMENT '试卷名称',
  `questionname` varchar(200) NOT NULL COMMENT '试题名称',
  `options` longtext COMMENT '选项，json字符串',
  `score` bigint DEFAULT '0' COMMENT '分值',
  `answer` varchar(200) DEFAULT NULL COMMENT '正确答案',
  `analysis` longtext COMMENT '答案解析',
  `type` bigint DEFAULT '0' COMMENT '试题类型，0：单选题 1：多选题 2：判断题 3：填空题（暂不考虑多项填空）',
  `sequence` bigint DEFAULT '100' COMMENT '试题排序，值越大排越前面',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='试题表';

DELETE FROM `examquestion`;

DROP TABLE IF EXISTS `examrecord`;
CREATE TABLE IF NOT EXISTS `examrecord` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `userid` bigint NOT NULL COMMENT '用户id',
  `username` varchar(200) DEFAULT NULL COMMENT '用户名',
  `paperid` bigint NOT NULL COMMENT '试卷id（外键）',
  `papername` varchar(200) NOT NULL COMMENT '试卷名称',
  `questionid` bigint NOT NULL COMMENT '试题id（外键）',
  `questionname` varchar(200) NOT NULL COMMENT '试题名称',
  `options` longtext COMMENT '选项，json字符串',
  `score` bigint DEFAULT '0' COMMENT '分值',
  `answer` varchar(200) DEFAULT NULL COMMENT '正确答案',
  `analysis` longtext COMMENT '答案解析',
  `myscore` bigint NOT NULL DEFAULT '0' COMMENT '试题得分',
  `myanswer` varchar(200) DEFAULT NULL COMMENT '考生答案',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='考试记录表';

DELETE FROM `examrecord`;

DROP TABLE IF EXISTS `forum`;
CREATE TABLE IF NOT EXISTS `forum` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `title` varchar(200) DEFAULT NULL COMMENT '帖子标题',
  `content` longtext NOT NULL COMMENT '帖子内容',
  `parentid` bigint DEFAULT NULL COMMENT '父节点id',
  `userid` bigint NOT NULL COMMENT '用户id',
  `username` varchar(200) DEFAULT NULL COMMENT '用户名',
  `isdone` varchar(200) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8mb3 COMMENT='学习交流';

DELETE FROM `forum`;
INSERT INTO `forum` (`id`, `addtime`, `title`, `content`, `parentid`, `userid`, `username`, `isdone`) VALUES
	(121, '2021-05-09 07:46:56', '帖子标题1', '帖子内容1', 1, 1, '用户名1', '开放'),
	(122, '2021-05-09 07:46:56', '帖子标题2', '帖子内容2', 2, 2, '用户名2', '开放'),
	(123, '2021-05-09 07:46:56', '帖子标题3', '帖子内容3', 3, 3, '用户名3', '开放'),
	(124, '2021-05-09 07:46:56', '帖子标题4', '帖子内容4', 4, 4, '用户名4', '开放'),
	(125, '2021-05-09 07:46:56', '帖子标题5', '帖子内容5', 5, 5, '用户名5', '开放'),
	(126, '2021-05-09 07:46:56', '帖子标题6', '帖子内容6', 6, 6, '用户名6', '开放');

DROP TABLE IF EXISTS `goumaidekecheng`;
CREATE TABLE IF NOT EXISTS `goumaidekecheng` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `kechengmingcheng` varchar(200) DEFAULT NULL COMMENT '课程名称',
  `leixing` varchar(200) DEFAULT NULL COMMENT '类型',
  `xueke` varchar(200) DEFAULT NULL COMMENT '学科',
  `feiyong` varchar(200) DEFAULT NULL COMMENT '费用',
  `yonghuzhanghao` varchar(200) DEFAULT NULL COMMENT '用户账号',
  `goumaishijian` datetime DEFAULT NULL COMMENT '购买时间',
  `sfsh` varchar(200) DEFAULT '否' COMMENT '是否审核',
  `shhf` longtext COMMENT '审核回复',
  `ispay` varchar(200) DEFAULT '未支付' COMMENT '是否支付',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb3 COMMENT='购买的课程';

DELETE FROM `goumaidekecheng`;
INSERT INTO `goumaidekecheng` (`id`, `addtime`, `kechengmingcheng`, `leixing`, `xueke`, `feiyong`, `yonghuzhanghao`, `goumaishijian`, `sfsh`, `shhf`, `ispay`) VALUES
	(51, '2021-05-09 07:46:56', '课程名称1', '类型1', '学科1', '费用1', '用户账号1', '2021-05-09 15:46:56', '是', '', '未支付'),
	(52, '2021-05-09 07:46:56', '课程名称2', '类型2', '学科2', '费用2', '用户账号2', '2021-05-09 15:46:56', '是', '', '未支付'),
	(53, '2021-05-09 07:46:56', '课程名称3', '类型3', '学科3', '费用3', '用户账号3', '2021-05-09 15:46:56', '是', '', '未支付'),
	(54, '2021-05-09 07:46:56', '课程名称4', '类型4', '学科4', '费用4', '用户账号4', '2021-05-09 15:46:56', '是', '', '未支付'),
	(55, '2021-05-09 07:46:56', '课程名称5', '类型5', '学科5', '费用5', '用户账号5', '2021-05-09 15:46:56', '是', '', '未支付'),
	(56, '2021-05-09 07:46:56', '课程名称6', '类型6', '学科6', '费用6', '用户账号6', '2021-05-09 15:46:56', '是', '', '未支付');

DROP TABLE IF EXISTS `kechengleixing`;
CREATE TABLE IF NOT EXISTS `kechengleixing` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `leixing` varchar(200) DEFAULT NULL COMMENT '类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb3 COMMENT='课程类型';

DELETE FROM `kechengleixing`;
INSERT INTO `kechengleixing` (`id`, `addtime`, `leixing`) VALUES
	(31, '2021-05-09 07:46:56', '类型1'),
	(32, '2021-05-09 07:46:56', '类型2'),
	(33, '2021-05-09 07:46:56', '类型3'),
	(34, '2021-05-09 07:46:56', '类型4'),
	(35, '2021-05-09 07:46:56', '类型5'),
	(36, '2021-05-09 07:46:56', '类型6');

DROP TABLE IF EXISTS `kechengxinxi`;
CREATE TABLE IF NOT EXISTS `kechengxinxi` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `kechengmingcheng` varchar(200) DEFAULT NULL COMMENT '课程名称',
  `leixing` varchar(200) DEFAULT NULL COMMENT '类型',
  `xueke` varchar(200) DEFAULT NULL COMMENT '学科',
  `shipin` varchar(200) DEFAULT NULL COMMENT '视频',
  `laoshixingming` varchar(200) DEFAULT NULL COMMENT '老师姓名',
  `feiyong` varchar(200) DEFAULT NULL COMMENT '费用',
  `kechengtupian` varchar(200) DEFAULT NULL COMMENT '课程图片',
  `fabushijian` date DEFAULT NULL COMMENT '发布时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb3 COMMENT='课程信息';

DELETE FROM `kechengxinxi`;
INSERT INTO `kechengxinxi` (`id`, `addtime`, `kechengmingcheng`, `leixing`, `xueke`, `shipin`, `laoshixingming`, `feiyong`, `kechengtupian`, `fabushijian`) VALUES
	(21, '2021-05-09 07:46:56', '课程名称1', '类型1', '学科1', '', '老师姓名1', '费用1', 'http://localhost:8080/springbootus5uu/upload/kechengxinxi_kechengtupian1.jpg', '2021-05-09'),
	(22, '2021-05-09 07:46:56', '课程名称2', '类型2', '学科2', '', '老师姓名2', '费用2', 'http://localhost:8080/springbootus5uu/upload/kechengxinxi_kechengtupian2.jpg', '2021-05-09'),
	(23, '2021-05-09 07:46:56', '课程名称3', '类型3', '学科3', '', '老师姓名3', '费用3', 'http://localhost:8080/springbootus5uu/upload/kechengxinxi_kechengtupian3.jpg', '2021-05-09'),
	(24, '2021-05-09 07:46:56', '课程名称4', '类型4', '学科4', '', '老师姓名4', '费用4', 'http://localhost:8080/springbootus5uu/upload/kechengxinxi_kechengtupian4.jpg', '2021-05-09'),
	(25, '2021-05-09 07:46:56', '课程名称5', '类型5', '学科5', '', '老师姓名5', '费用5', 'http://localhost:8080/springbootus5uu/upload/kechengxinxi_kechengtupian5.jpg', '2021-05-09'),
	(26, '2021-05-09 07:46:56', '课程名称6', '类型6', '学科6', '', '老师姓名6', '费用6', 'http://localhost:8080/springbootus5uu/upload/kechengxinxi_kechengtupian6.jpg', '2021-05-09');

DROP TABLE IF EXISTS `messages`;
CREATE TABLE IF NOT EXISTS `messages` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `userid` bigint NOT NULL COMMENT '留言人id',
  `username` varchar(200) DEFAULT NULL COMMENT '用户名',
  `content` longtext NOT NULL COMMENT '留言内容',
  `reply` longtext COMMENT '回复内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1705796987986 DEFAULT CHARSET=utf8mb3 COMMENT='留言板';

DELETE FROM `messages`;
INSERT INTO `messages` (`id`, `addtime`, `userid`, `username`, `content`, `reply`) VALUES
	(181, '2021-05-09 07:46:56', 1, '用户名1', '留言内容1', '回复内容1'),
	(182, '2021-05-09 07:46:56', 2, '用户名2', '留言内容2', '回复内容2'),
	(183, '2021-05-09 07:46:56', 3, '用户名3', '留言内容3', '回复内容3'),
	(184, '2021-05-09 07:46:56', 4, '用户名4', '留言内容4', '回复内容4'),
	(185, '2021-05-09 07:46:56', 5, '用户名5', '留言内容5', '回复内容5'),
	(186, '2021-05-09 07:46:56', 6, '用户名6', '留言内容6', '回复内容6'),
	(1705796987985, '2024-01-21 00:29:47', 11, '用户1', '666', NULL);

DROP TABLE IF EXISTS `news`;
CREATE TABLE IF NOT EXISTS `news` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `title` varchar(200) NOT NULL COMMENT '标题',
  `introduction` longtext COMMENT '简介',
  `picture` varchar(200) NOT NULL COMMENT '图片',
  `content` longtext NOT NULL COMMENT '内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=177 DEFAULT CHARSET=utf8mb3 COMMENT='教育资讯';

DELETE FROM `news`;
INSERT INTO `news` (`id`, `addtime`, `title`, `introduction`, `picture`, `content`) VALUES
	(171, '2021-05-09 07:46:56', '标题1', '简介1', 'http://localhost:8080/springbootus5uu/upload/news_picture1.jpg', '内容1'),
	(172, '2021-05-09 07:46:56', '标题2', '简介2', 'http://localhost:8080/springbootus5uu/upload/news_picture2.jpg', '内容2'),
	(173, '2021-05-09 07:46:56', '标题3', '简介3', 'http://localhost:8080/springbootus5uu/upload/news_picture3.jpg', '内容3'),
	(174, '2021-05-09 07:46:56', '标题4', '简介4', 'http://localhost:8080/springbootus5uu/upload/news_picture4.jpg', '内容4'),
	(175, '2021-05-09 07:46:56', '标题5', '简介5', 'http://localhost:8080/springbootus5uu/upload/news_picture5.jpg', '内容5'),
	(176, '2021-05-09 07:46:56', '标题6', '简介6', 'http://localhost:8080/springbootus5uu/upload/news_picture6.jpg', '内容6');

DROP TABLE IF EXISTS `shipindianbo`;
CREATE TABLE IF NOT EXISTS `shipindianbo` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `shipinmingcheng` varchar(200) DEFAULT NULL COMMENT '视频名称',
  `shipin` varchar(200) DEFAULT NULL COMMENT '视频',
  `shipinjianjie` longtext COMMENT '视频简介',
  `laiyuan` varchar(200) DEFAULT NULL COMMENT '来源',
  `shangchuanshijian` datetime DEFAULT NULL COMMENT '上传时间',
  `fengmian` varchar(200) DEFAULT NULL COMMENT '封面',
  `yonghuzhanghao` varchar(200) DEFAULT NULL COMMENT '用户账号',
  `userid` bigint DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb3 COMMENT='视频点播';

DELETE FROM `shipindianbo`;
INSERT INTO `shipindianbo` (`id`, `addtime`, `shipinmingcheng`, `shipin`, `shipinjianjie`, `laiyuan`, `shangchuanshijian`, `fengmian`, `yonghuzhanghao`, `userid`) VALUES
	(71, '2021-05-09 07:46:56', '视频名称1', 'http://localhost:8080/springbootus5uu/upload/1620547330699.mp4', '视频简介1', '来源1', '2021-05-09 15:46:56', 'http://localhost:8080/springbootus5uu/upload/shipindianbo_fengmian1.jpg', '用户1', 1),
	(72, '2021-05-09 07:46:56', '视频名称2', '', '视频简介2', '来源2', '2021-05-09 15:46:56', 'http://localhost:8080/springbootus5uu/upload/shipindianbo_fengmian2.jpg', '用户账号2', 2),
	(73, '2021-05-09 07:46:56', '视频名称3', '', '视频简介3', '来源3', '2021-05-09 15:46:56', 'http://localhost:8080/springbootus5uu/upload/shipindianbo_fengmian3.jpg', '用户账号3', 3),
	(74, '2021-05-09 07:46:56', '视频名称4', '', '视频简介4', '来源4', '2021-05-09 15:46:56', 'http://localhost:8080/springbootus5uu/upload/shipindianbo_fengmian4.jpg', '用户账号4', 4),
	(75, '2021-05-09 07:46:56', '视频名称5', '', '视频简介5', '来源5', '2021-05-09 15:46:56', 'http://localhost:8080/springbootus5uu/upload/shipindianbo_fengmian5.jpg', '用户账号5', 5),
	(76, '2021-05-09 07:46:56', '视频名称6', '', '视频简介6', '来源6', '2021-05-09 15:46:56', 'http://localhost:8080/springbootus5uu/upload/shipindianbo_fengmian6.jpg', '用户账号6', 6);

DROP TABLE IF EXISTS `storeup`;
CREATE TABLE IF NOT EXISTS `storeup` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `userid` bigint NOT NULL COMMENT '用户id',
  `refid` bigint DEFAULT NULL COMMENT '收藏id',
  `tablename` varchar(200) DEFAULT NULL COMMENT '表名',
  `name` varchar(200) NOT NULL COMMENT '收藏名称',
  `picture` varchar(200) NOT NULL COMMENT '收藏图片',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='收藏表';

DELETE FROM `storeup`;

DROP TABLE IF EXISTS `token`;
CREATE TABLE IF NOT EXISTS `token` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint NOT NULL COMMENT '用户id',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `tablename` varchar(100) DEFAULT NULL COMMENT '表名',
  `role` varchar(100) DEFAULT NULL COMMENT '角色',
  `token` varchar(200) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COMMENT='token表';

DELETE FROM `token`;
INSERT INTO `token` (`id`, `userid`, `username`, `tablename`, `role`, `token`, `addtime`, `expiratedtime`) VALUES
	(1, 11, '用户1', 'yonghu', '用户', 't7r63139uswjx6obe1caaj75ngmo7fwl', '2021-05-09 07:48:33', '2024-01-21 01:29:10'),
	(2, 1, 'abo', 'users', '管理员', '55xpe7hs84ax9pol0zz9ef3wlam7uty4', '2021-05-09 07:49:17', '2024-01-21 01:27:34');

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `role` varchar(100) DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COMMENT='用户表';

DELETE FROM `users`;
INSERT INTO `users` (`id`, `username`, `password`, `role`, `addtime`) VALUES
	(1, 'admin', '123456', '管理员', '2021-05-09 07:46:56');

DROP TABLE IF EXISTS `wodebiji`;
CREATE TABLE IF NOT EXISTS `wodebiji` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `biaoti` varchar(200) DEFAULT NULL COMMENT '标题',
  `neirong` longtext COMMENT '内容',
  `yonghuzhanghao` varchar(200) DEFAULT NULL COMMENT '用户账号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb3 COMMENT='我的笔记';

DELETE FROM `wodebiji`;
INSERT INTO `wodebiji` (`id`, `addtime`, `biaoti`, `neirong`, `yonghuzhanghao`) VALUES
	(81, '2021-05-09 07:46:56', '标题1', '内容1', '用户账号1'),
	(82, '2021-05-09 07:46:56', '标题2', '内容2', '用户账号2'),
	(83, '2021-05-09 07:46:56', '标题3', '内容3', '用户账号3'),
	(84, '2021-05-09 07:46:56', '标题4', '内容4', '用户账号4'),
	(85, '2021-05-09 07:46:56', '标题5', '内容5', '用户账号5'),
	(86, '2021-05-09 07:46:56', '标题6', '内容6', '用户账号6');

DROP TABLE IF EXISTS `wodekecheng`;
CREATE TABLE IF NOT EXISTS `wodekecheng` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `kechengmingcheng` varchar(200) DEFAULT NULL COMMENT '课程名称',
  `zhangjie` varchar(200) DEFAULT NULL COMMENT '章节',
  `wenjian` varchar(200) DEFAULT NULL COMMENT '文件',
  `yonghuzhanghao` varchar(200) DEFAULT NULL COMMENT '用户账号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb3 COMMENT='我的课程';

DELETE FROM `wodekecheng`;
INSERT INTO `wodekecheng` (`id`, `addtime`, `kechengmingcheng`, `zhangjie`, `wenjian`, `yonghuzhanghao`) VALUES
	(91, '2021-05-09 07:46:56', '课程名称1', '章节1', '', '用户账号1'),
	(92, '2021-05-09 07:46:56', '课程名称2', '章节2', '', '用户账号2'),
	(93, '2021-05-09 07:46:56', '课程名称3', '章节3', '', '用户账号3'),
	(94, '2021-05-09 07:46:56', '课程名称4', '章节4', '', '用户账号4'),
	(95, '2021-05-09 07:46:56', '课程名称5', '章节5', '', '用户账号5'),
	(96, '2021-05-09 07:46:56', '课程名称6', '章节6', '', '用户账号6');

DROP TABLE IF EXISTS `xiaoxitongzhi`;
CREATE TABLE IF NOT EXISTS `xiaoxitongzhi` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `tongzhibiaoti` varchar(200) DEFAULT NULL COMMENT '通知标题',
  `tongzhineirong` longtext COMMENT '通知内容',
  `yonghuzhanghao` varchar(200) DEFAULT NULL COMMENT '用户账号',
  `fasongshijian` datetime DEFAULT NULL COMMENT '发送时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8mb3 COMMENT='消息通知';

DELETE FROM `xiaoxitongzhi`;
INSERT INTO `xiaoxitongzhi` (`id`, `addtime`, `tongzhibiaoti`, `tongzhineirong`, `yonghuzhanghao`, `fasongshijian`) VALUES
	(101, '2021-05-09 07:46:56', '通知标题1', '通知内容1', '用户账号1', '2021-05-09 15:46:56'),
	(102, '2021-05-09 07:46:56', '通知标题2', '通知内容2', '用户账号2', '2021-05-09 15:46:56'),
	(103, '2021-05-09 07:46:56', '通知标题3', '通知内容3', '用户账号3', '2021-05-09 15:46:56'),
	(104, '2021-05-09 07:46:56', '通知标题4', '通知内容4', '用户账号4', '2021-05-09 15:46:56'),
	(105, '2021-05-09 07:46:56', '通知标题5', '通知内容5', '用户账号5', '2021-05-09 15:46:56'),
	(106, '2021-05-09 07:46:56', '通知标题6', '通知内容6', '用户账号6', '2021-05-09 15:46:56');

DROP TABLE IF EXISTS `xueke`;
CREATE TABLE IF NOT EXISTS `xueke` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `xueke` varchar(200) DEFAULT NULL COMMENT '学科',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb3 COMMENT='学科';

DELETE FROM `xueke`;
INSERT INTO `xueke` (`id`, `addtime`, `xueke`) VALUES
	(41, '2021-05-09 07:46:56', '学科1'),
	(42, '2021-05-09 07:46:56', '学科2'),
	(43, '2021-05-09 07:46:56', '学科3'),
	(44, '2021-05-09 07:46:56', '学科4'),
	(45, '2021-05-09 07:46:56', '学科5'),
	(46, '2021-05-09 07:46:56', '学科6');

DROP TABLE IF EXISTS `yonghu`;
CREATE TABLE IF NOT EXISTS `yonghu` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `yonghuzhanghao` varchar(200) NOT NULL COMMENT '用户账号',
  `mima` varchar(200) NOT NULL COMMENT '密码',
  `yonghuxingming` varchar(200) NOT NULL COMMENT '用户姓名',
  `xingbie` varchar(200) DEFAULT NULL COMMENT '性别',
  `shouji` varchar(200) DEFAULT NULL COMMENT '手机',
  `youxiang` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `touxiang` varchar(200) DEFAULT NULL COMMENT '头像',
  PRIMARY KEY (`id`),
  UNIQUE KEY `yonghuzhanghao` (`yonghuzhanghao`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3 COMMENT='用户';

DELETE FROM `yonghu`;
INSERT INTO `yonghu` (`id`, `addtime`, `yonghuzhanghao`, `mima`, `yonghuxingming`, `xingbie`, `shouji`, `youxiang`, `touxiang`) VALUES
	(11, '2021-05-09 07:46:56', '用户1', '123456', '用户姓名1', '男', '13823888881', '773890001@qq.com', 'http://localhost:8080/springbootus5uu/upload/yonghu_touxiang1.jpg'),
	(12, '2021-05-09 07:46:56', '用户2', '123456', '用户姓名2', '男', '13823888882', '773890002@qq.com', 'http://localhost:8080/springbootus5uu/upload/yonghu_touxiang2.jpg'),
	(13, '2021-05-09 07:46:56', '用户3', '123456', '用户姓名3', '男', '13823888883', '773890003@qq.com', 'http://localhost:8080/springbootus5uu/upload/yonghu_touxiang3.jpg'),
	(14, '2021-05-09 07:46:56', '用户4', '123456', '用户姓名4', '男', '13823888884', '773890004@qq.com', 'http://localhost:8080/springbootus5uu/upload/yonghu_touxiang4.jpg'),
	(15, '2021-05-09 07:46:56', '用户5', '123456', '用户姓名5', '男', '13823888885', '773890005@qq.com', 'http://localhost:8080/springbootus5uu/upload/yonghu_touxiang5.jpg'),
	(16, '2021-05-09 07:46:56', '用户6', '123456', '用户姓名6', '男', '13823888886', '773890006@qq.com', 'http://localhost:8080/springbootus5uu/upload/yonghu_touxiang6.jpg');

DROP TABLE IF EXISTS `zhiyeguihua`;
CREATE TABLE IF NOT EXISTS `zhiyeguihua` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `ziwofenxi` varchar(200) DEFAULT NULL COMMENT '自我分析',
  `quelimubiao` varchar(200) DEFAULT NULL COMMENT '确立目标',
  `huanjingpingjia` varchar(200) DEFAULT NULL COMMENT '环境评价',
  `zhiyedingwei` varchar(200) DEFAULT NULL COMMENT '职业定位',
  `shishicelve` varchar(200) DEFAULT NULL COMMENT '实施策略',
  `pingguyufankui` varchar(200) DEFAULT NULL COMMENT '评估与反馈',
  `fengmian` varchar(200) DEFAULT NULL COMMENT '封面',
  `xingming` varchar(200) DEFAULT NULL COMMENT '姓名',
  `xingbie` varchar(200) DEFAULT NULL COMMENT '性别',
  `nianling` varchar(200) DEFAULT NULL COMMENT '年龄',
  `muqianzhiye` varchar(200) DEFAULT NULL COMMENT '目前职业',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb3 COMMENT='职业规划';

DELETE FROM `zhiyeguihua`;
INSERT INTO `zhiyeguihua` (`id`, `addtime`, `ziwofenxi`, `quelimubiao`, `huanjingpingjia`, `zhiyedingwei`, `shishicelve`, `pingguyufankui`, `fengmian`, `xingming`, `xingbie`, `nianling`, `muqianzhiye`) VALUES
	(61, '2021-05-09 07:46:56', '自我分析1', '确立目标1', '环境评价1', '职业定位1', '实施策略1', '评估与反馈1', 'http://localhost:8080/springbootus5uu/upload/zhiyeguihua_fengmian1.jpg', '姓名1', '男', '年龄1', '目前职业1'),
	(62, '2021-05-09 07:46:56', '自我分析2', '确立目标2', '环境评价2', '职业定位2', '实施策略2', '评估与反馈2', 'http://localhost:8080/springbootus5uu/upload/zhiyeguihua_fengmian2.jpg', '姓名2', '男', '年龄2', '目前职业2'),
	(63, '2021-05-09 07:46:56', '自我分析3', '确立目标3', '环境评价3', '职业定位3', '实施策略3', '评估与反馈3', 'http://localhost:8080/springbootus5uu/upload/zhiyeguihua_fengmian3.jpg', '姓名3', '男', '年龄3', '目前职业3'),
	(64, '2021-05-09 07:46:56', '自我分析4', '确立目标4', '环境评价4', '职业定位4', '实施策略4', '评估与反馈4', 'http://localhost:8080/springbootus5uu/upload/zhiyeguihua_fengmian4.jpg', '姓名4', '男', '年龄4', '目前职业4'),
	(65, '2021-05-09 07:46:56', '自我分析5', '确立目标5', '环境评价5', '职业定位5', '实施策略5', '评估与反馈5', 'http://localhost:8080/springbootus5uu/upload/zhiyeguihua_fengmian5.jpg', '姓名5', '男', '年龄5', '目前职业5'),
	(66, '2021-05-09 07:46:56', '自我分析6', '确立目标6', '环境评价6', '职业定位6', '实施策略6', '评估与反馈6', 'http://localhost:8080/springbootus5uu/upload/zhiyeguihua_fengmian6.jpg', '姓名6', '男', '年龄6', '目前职业6');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
