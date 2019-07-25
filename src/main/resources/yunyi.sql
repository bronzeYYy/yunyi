/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50722
Source Host           : localhost:3306
Source Database       : yunyi

Target Server Type    : MYSQL
Target Server Version : 50722
File Encoding         : 65001

Date: 2019-07-25 14:07:44
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for answer
-- ----------------------------
DROP TABLE IF EXISTS `answer`;
CREATE TABLE `answer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `question_id` int(10) unsigned NOT NULL,
  `answer_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer_time` datetime NOT NULL,
  `responder_id` int(10) NOT NULL,
  `likenum` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `qid` (`question_id`) USING BTREE,
  KEY `uid` (`responder_id`) USING BTREE,
  CONSTRAINT `qid` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `uid` FOREIGN KEY (`responder_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for file
-- ----------------------------
DROP TABLE IF EXISTS `file`;
CREATE TABLE `file` (
  `md5` varchar(35) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_detail` tinytext COLLATE utf8mb4_unicode_ci,
  `uploader_id` int(10) NOT NULL,
  `creation_time` datetime NOT NULL,
  `file_size` float(10,1) NOT NULL,
  `download_num` int(10) unsigned NOT NULL DEFAULT '0',
  `file_type` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size_unit` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name1` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`md5`),
  KEY `uploader` (`uploader_id`),
  CONSTRAINT `uploader` FOREIGN KEY (`uploader_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for file_comment
-- ----------------------------
DROP TABLE IF EXISTS `file_comment`;
CREATE TABLE `file_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `file_md5` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_time` datetime NOT NULL,
  `commenter_id` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `f_md5` (`file_md5`),
  KEY `c_id` (`commenter_id`),
  CONSTRAINT `c_id` FOREIGN KEY (`commenter_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `f_md5` FOREIGN KEY (`file_md5`) REFERENCES `file` (`md5`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for likenum_ans
-- ----------------------------
DROP TABLE IF EXISTS `likenum_ans`;
CREATE TABLE `likenum_ans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `response_id` int(10) unsigned NOT NULL,
  `responder_id` int(10) NOT NULL,
  `star_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `unique_id` (`response_id`,`responder_id`) USING BTREE,
  KEY `res_id` (`response_id`) USING BTREE,
  KEY `reser_id` (`responder_id`) USING BTREE,
  CONSTRAINT `res_id` FOREIGN KEY (`response_id`) REFERENCES `answer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `reser_id` FOREIGN KEY (`responder_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for likenum_ques
-- ----------------------------
DROP TABLE IF EXISTS `likenum_ques`;
CREATE TABLE `likenum_ques` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `question_id` int(10) unsigned NOT NULL,
  `questioner_id` int(10) NOT NULL,
  `star_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_id` (`question_id`,`questioner_id`) USING BTREE,
  KEY `queser_id` (`questioner_id`),
  KEY `ques_id` (`question_id`) USING BTREE,
  CONSTRAINT `ques_id` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `queser_id` FOREIGN KEY (`questioner_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for question
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `question_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `questioner_id` int(10) NOT NULL,
  `question_content` text COLLATE utf8mb4_unicode_ci,
  `creation_time` datetime(1) NOT NULL,
  `likenum` int(10) unsigned NOT NULL DEFAULT '0',
  `comment_num` int(10) unsigned NOT NULL DEFAULT '0',
  `name1` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name2` varchar(16) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `uqid` (`questioner_id`) USING BTREE,
  CONSTRAINT `uqid` FOREIGN KEY (`questioner_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `user_password` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `user_class` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `integral` smallint(5) DEFAULT '0' COMMENT '积分',
  `asking_number` smallint(5) DEFAULT '0',
  `answer_number` smallint(5) DEFAULT '0',
  `email` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `creation_time` datetime NOT NULL,
  `student_no` varchar(10) CHARACTER SET utf8 NOT NULL,
  `upload_number` int(10) unsigned NOT NULL DEFAULT '0',
  `user_qq` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `email` (`email`) USING BTREE,
  KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
