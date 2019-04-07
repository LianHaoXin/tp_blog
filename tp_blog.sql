/*
Navicat MySQL Data Transfer

Source Server         : thinkphp5.0
Source Server Version : 50723
Source Host           : localhost:3306
Source Database       : tp_blog

Target Server Type    : MYSQL
Target Server Version : 50723
File Encoding         : 65001

Date: 2019-03-07 16:46:56
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `tp_admin`
-- ----------------------------
DROP TABLE IF EXISTS `tp_admin`;
CREATE TABLE `tp_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL COMMENT '管理员账户',
  `password` varchar(20) NOT NULL COMMENT '密码',
  `nickname` varchar(20) NOT NULL COMMENT '昵称',
  `email` varchar(20) NOT NULL COMMENT '邮箱',
  `status` enum('1','0') NOT NULL DEFAULT '0' COMMENT '0是禁用,1是可用',
  `is_super` enum('1','0') NOT NULL DEFAULT '0' COMMENT '0是普通管理员,1是超级管理员',
  `create_time` int(11) NOT NULL COMMENT '注册时间',
  `update_time` int(11) NOT NULL COMMENT '更新时间',
  `delete_time` int(11) DEFAULT NULL COMMENT '软删除',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tp_admin
-- ----------------------------
INSERT INTO `tp_admin` VALUES ('1', 'admin', 'admin', 'lian', '18316481267@163.com', '1', '1', '1550542054', '1550542054', null);
INSERT INTO `tp_admin` VALUES ('2', 'xin', 'xin', 'xin', '18316481267@qq.com', '1', '0', '1550558174', '1550558258', null);

-- ----------------------------
-- Table structure for `tp_article`
-- ----------------------------
DROP TABLE IF EXISTS `tp_article`;
CREATE TABLE `tp_article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL COMMENT '标题',
  `author` varchar(20) NOT NULL DEFAULT '' COMMENT '评论作者',
  `desc` text NOT NULL COMMENT '概要',
  `tags` varchar(100) NOT NULL COMMENT '标签',
  `click` int(11) NOT NULL DEFAULT '0' COMMENT '点击量',
  `comm_num` int(11) NOT NULL DEFAULT '0' COMMENT '评论量',
  `content` longtext NOT NULL COMMENT '内容',
  `is_top` enum('1','0') NOT NULL DEFAULT '0' COMMENT '0是未推荐,1是推荐',
  `cate_id` int(11) NOT NULL COMMENT '所属导航id',
  `create_time` int(11) NOT NULL COMMENT '添加时间',
  `update_time` int(11) NOT NULL COMMENT '更新时间',
  `delete_time` int(11) DEFAULT NULL COMMENT '软删除',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tp_article
-- ----------------------------
INSERT INTO `tp_article` VALUES ('1', 'PHP01', 'lian', 'PHP01', 'php01', '2', '0', '<p>PHP01</p>', '1', '1', '1550544613', '1550544613', null);
INSERT INTO `tp_article` VALUES ('2', 'thinkphp01', 'lian', 'thinkphp01', 'thinkphp01', '1', '0', '<p>thinkphp01</p>', '1', '2', '1550546998', '1550546998', null);
INSERT INTO `tp_article` VALUES ('3', 'larveral01', 'lian', 'larveral01', 'larveral01', '6', '0', '<p>larveral01</p>', '1', '3', '1550547041', '1550547041', null);

-- ----------------------------
-- Table structure for `tp_cate`
-- ----------------------------
DROP TABLE IF EXISTS `tp_cate`;
CREATE TABLE `tp_cate` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `catename` varchar(20) NOT NULL COMMENT '导航名称',
  `sort` int(11) NOT NULL COMMENT '排序',
  `create_time` int(11) NOT NULL COMMENT '添加时间',
  `update_time` int(11) NOT NULL COMMENT '更新时间',
  `delete_time` int(11) DEFAULT NULL COMMENT '软删除',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tp_cate
-- ----------------------------
INSERT INTO `tp_cate` VALUES ('1', 'php', '1', '1550544002', '1550544002', null);
INSERT INTO `tp_cate` VALUES ('2', 'thinkphp5.0', '2', '1550544089', '1550544089', null);
INSERT INTO `tp_cate` VALUES ('3', 'larveral', '3', '1550544149', '1550544149', null);

-- ----------------------------
-- Table structure for `tp_comment`
-- ----------------------------
DROP TABLE IF EXISTS `tp_comment`;
CREATE TABLE `tp_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL COMMENT '评论内容',
  `article_id` int(11) NOT NULL COMMENT '评论文章',
  `member_id` int(11) NOT NULL COMMENT '评论用户',
  `create_time` int(11) NOT NULL COMMENT '评论时间',
  `update_time` int(11) NOT NULL COMMENT '更新时间',
  `delete_time` int(11) DEFAULT NULL COMMENT '软删除',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tp_comment
-- ----------------------------
INSERT INTO `tp_comment` VALUES ('1', 'php不错~', '1', '1', '1550547041', '1550547041', null);
INSERT INTO `tp_comment` VALUES ('2', '这篇文章不错！', '3', '1', '1550664777', '1550664777', null);

-- ----------------------------
-- Table structure for `tp_member`
-- ----------------------------
DROP TABLE IF EXISTS `tp_member`;
CREATE TABLE `tp_member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL COMMENT '会员账号',
  `password` varchar(20) NOT NULL COMMENT '密码',
  `nickname` varchar(20) NOT NULL COMMENT '昵称',
  `email` varchar(20) NOT NULL COMMENT '邮箱',
  `create_time` int(11) NOT NULL COMMENT '注册时间',
  `update_time` int(11) NOT NULL COMMENT '更新时间',
  `delete_time` int(11) DEFAULT NULL COMMENT '软删除',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tp_member
-- ----------------------------
INSERT INTO `tp_member` VALUES ('1', 'lian', 'lian', 'lian', '18316481267@163.com', '1550540824', '1550544844', null);
INSERT INTO `tp_member` VALUES ('2', 'hao', 'hao', 'hao', '2650602079@qq.com', '1550547295', '1550547295', null);

-- ----------------------------
-- Table structure for `tp_system`
-- ----------------------------
DROP TABLE IF EXISTS `tp_system`;
CREATE TABLE `tp_system` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `webname` varchar(50) NOT NULL COMMENT '网站标题',
  `copyright` varchar(50) NOT NULL COMMENT '版权信息',
  `create_time` int(11) NOT NULL COMMENT '设置时间',
  `update_time` int(11) NOT NULL COMMENT '更新时间',
  `delete_time` int(11) DEFAULT NULL COMMENT '软删除',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tp_system
-- ----------------------------
INSERT INTO `tp_system` VALUES ('1', 'active.cn', 'lian', '1550540824', '1550544844', null);
