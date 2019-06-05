/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50718
Source Host           : localhost:3306
Source Database       : nsfw

Target Server Type    : MYSQL
Target Server Version : 50718
File Encoding         : 65001

Date: 2017-09-08 18:57:43
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `complain`
-- ----------------------------
DROP TABLE IF EXISTS `complain`;
CREATE TABLE `complain` (
  `c_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_title` varchar(255) DEFAULT NULL,
  `c_content` text,
  `c_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `c_status` int(11) DEFAULT NULL COMMENT '1 已处理 2 未处理 3 已失效',
  `c_isnm` int(11) DEFAULT NULL COMMENT '1 非匿名 2 匿名',
  `ued_id` int(11) DEFAULT NULL COMMENT '被投诉人',
  `u_id` int(11) DEFAULT NULL COMMENT '投诉人',
  PRIMARY KEY (`c_id`),
  KEY `ued_id` (`ued_id`),
  KEY `u_id` (`u_id`),
  CONSTRAINT `complain_ibfk_1` FOREIGN KEY (`ued_id`) REFERENCES `user` (`u_id`),
  CONSTRAINT `complain_ibfk_2` FOREIGN KEY (`u_id`) REFERENCES `user` (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of complain
-- ----------------------------
INSERT INTO `complain` VALUES ('1', '123', '<p>1234567890</p>', '2017-08-28 14:13:49', '1', '1', '36', '30');
INSERT INTO `complain` VALUES ('2', '问号', '<p>莱克斯顿金风科技女会计分录电视剧佛连接凉快</p>', '2017-09-08 10:59:14', '2', '1', '33', '30');
INSERT INTO `complain` VALUES ('3', '66', '<p>66666666666666666</p>', '2017-09-08 14:15:31', null, '1', '21', '2');
INSERT INTO `complain` VALUES ('4', '我要投诉', '<p>我要投诉李海波.........................</p>', '2017-09-08 16:08:32', null, '1', '30', '2');
INSERT INTO `complain` VALUES ('5', '投诉啦啦', '<p>12345612534124512</p>', '2017-09-08 16:11:39', null, '1', '32', '30');

-- ----------------------------
-- Table structure for `complainhanding`
-- ----------------------------
DROP TABLE IF EXISTS `complainhanding`;
CREATE TABLE `complainhanding` (
  `ch_id` int(11) NOT NULL AUTO_INCREMENT,
  `u_id` int(11) DEFAULT NULL,
  `ch_content` text,
  `ch_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `c_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`ch_id`),
  KEY `c_id` (`c_id`),
  CONSTRAINT `complainhanding_ibfk_1` FOREIGN KEY (`c_id`) REFERENCES `complain` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of complainhanding
-- ----------------------------

-- ----------------------------
-- Table structure for `dept`
-- ----------------------------
DROP TABLE IF EXISTS `dept`;
CREATE TABLE `dept` (
  `d_id` int(11) NOT NULL AUTO_INCREMENT,
  `d_name` varchar(255) DEFAULT NULL,
  `d_desc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`d_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dept
-- ----------------------------
INSERT INTO `dept` VALUES ('1', '移动部', '啦啦啦');
INSERT INTO `dept` VALUES ('2', '人事部', '111');
INSERT INTO `dept` VALUES ('3', '联通部', '哈哈哈');
INSERT INTO `dept` VALUES ('4', '安全部', '12345');
INSERT INTO `dept` VALUES ('5', '技术部', '网络技术问题处理');
INSERT INTO `dept` VALUES ('6', '后勤部', '5555');

-- ----------------------------
-- Table structure for `info`
-- ----------------------------
DROP TABLE IF EXISTS `info`;
CREATE TABLE `info` (
  `info_id` int(11) NOT NULL AUTO_INCREMENT,
  `i_title` varchar(255) DEFAULT NULL,
  `i_content` text,
  `i_source` varchar(255) DEFAULT NULL,
  `i_type_id` int(11) DEFAULT NULL,
  `u_id` int(11) DEFAULT NULL,
  `i_createTime` timestamp NULL DEFAULT NULL,
  `i_remark` varchar(255) DEFAULT NULL,
  `i_status` int(11) DEFAULT NULL,
  PRIMARY KEY (`info_id`),
  KEY `u_id` (`u_id`),
  KEY `info_ibfk_1` (`i_type_id`),
  CONSTRAINT `info_ibfk_1` FOREIGN KEY (`i_type_id`) REFERENCES `infotype` (`i_type_id`),
  CONSTRAINT `info_ibfk_2` FOREIGN KEY (`u_id`) REFERENCES `user` (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of info
-- ----------------------------
INSERT INTO `info` VALUES ('1', '国税局领导..', '卡了的石佛阿内然后就离开过origin哦了条件', '附加', '1', '2', '2017-08-15 00:00:00', '大概而特特让他', '1');
INSERT INTO `info` VALUES ('11', '风格化风格化天', '用途', '反光衣u', '2', '2', '2017-05-01 00:00:00', '赌徒而法国几回要天通苑', '1');
INSERT INTO `info` VALUES ('13', '主题666', '<p>啊看见了回复了</p>', '地方颗粒度让他', '3', '30', '2017-08-28 00:00:00', '月的有人提供的法人GVv', '0');
INSERT INTO `info` VALUES ('14', '今天周三', '<p>周三啦啦啦</p>', '哈哈哈', '2', '2', '2017-09-06 00:00:00', '333333333', '1');
INSERT INTO `info` VALUES ('15', '123', '<p>32456385121521℃2017-09-06〣</p>', '123', '3', '2', '2017-08-27 00:00:00', '123\r\n12345645', '0');
INSERT INTO `info` VALUES ('16', '456', '<p>56789534798</p>', '456', '1', '2', '2017-08-27 00:00:00', '7865/798645647', '1');
INSERT INTO `info` VALUES ('22', '电梯公寓', '<p>骨头同时元的规划</p>', '突然反应', '2', '2', '2017-08-27 00:00:00', 'str一天一', '1');
INSERT INTO `info` VALUES ('25', '沃尔', '<p>请问让我去而而我而去</p>', '儿童', '3', '2', '2017-07-30 00:00:00', '位 人反而他热通风管', '1');
INSERT INTO `info` VALUES ('27', '999', '<p>99999999999999</p>', '999', '2', '2', '2017-07-03 00:00:00', '99999999999999999', '1');
INSERT INTO `info` VALUES ('28', '6666666666', '<p>6666666666666</p>', '66666666', '1', '2', '2017-09-06 00:00:00', '6666666', '1');
INSERT INTO `info` VALUES ('29', '111', '', '', '1', '2', '2017-09-06 00:00:00', '', '1');
INSERT INTO `info` VALUES ('33', '222', '', '', '1', '2', '2017-09-06 00:00:00', '', '1');
INSERT INTO `info` VALUES ('34', '纳税指导', '<p>asdf;ljfolaas;flkdm al;sdkmngd;lfkgn;来得及废溶剂 了极速特工</p>', '网页', '3', '1', '2017-09-06 00:00:00', '按时给发的人阿尔法通过', '1');
INSERT INTO `info` VALUES ('35', '这个是6写的', '<p>lk;adsghadnmvaidjfkl,,,g;o;;;;;;;;爱人看电视两面佛浪蝶狂蜂饭都该看的.;按几个</p>', '百度', '3', '30', '2017-09-07 00:00:00', '666', '1');
INSERT INTO `info` VALUES ('36', '啦啦啦', '<p>的一条符合地方规划rtysdfhdfgh v</p>', '啦啦', '3', '30', '2017-09-07 00:00:00', 'fgggggggggggggj', '1');

-- ----------------------------
-- Table structure for `infotype`
-- ----------------------------
DROP TABLE IF EXISTS `infotype`;
CREATE TABLE `infotype` (
  `i_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `i_type_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`i_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of infotype
-- ----------------------------
INSERT INTO `infotype` VALUES ('1', '通知公告');
INSERT INTO `infotype` VALUES ('2', '政策速递');
INSERT INTO `infotype` VALUES ('3', '纳税指导');

-- ----------------------------
-- Table structure for `privilege`
-- ----------------------------
DROP TABLE IF EXISTS `privilege`;
CREATE TABLE `privilege` (
  `p_id` int(11) NOT NULL AUTO_INCREMENT,
  `p_name` varchar(255) DEFAULT NULL,
  `p_desc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`p_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of privilege
-- ----------------------------
INSERT INTO `privilege` VALUES ('1', '纳税服务', '12346');
INSERT INTO `privilege` VALUES ('2', '行政管理', '3214565');
INSERT INTO `privilege` VALUES ('3', '在线学习', '6484132');
INSERT INTO `privilege` VALUES ('4', '后勤管理', '453667');
INSERT INTO `privilege` VALUES ('5', '我的空间', '31546451');

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `r_id` int(11) NOT NULL AUTO_INCREMENT,
  `r_name` varchar(255) DEFAULT NULL,
  `r_desc` varchar(255) DEFAULT NULL,
  `r_status` int(11) DEFAULT NULL,
  PRIMARY KEY (`r_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '超级管理员', 'superman', '1');
INSERT INTO `role` VALUES ('2', '纳税服务管理员', null, '1');
INSERT INTO `role` VALUES ('3', '一般用户', null, '1');
INSERT INTO `role` VALUES ('8', '图书管理员', null, '1');
INSERT INTO `role` VALUES ('9', '123', null, '1');
INSERT INTO `role` VALUES ('10', '后勤管理员', null, '1');
INSERT INTO `role` VALUES ('11', '总监', null, '1');

-- ----------------------------
-- Table structure for `role_privilege`
-- ----------------------------
DROP TABLE IF EXISTS `role_privilege`;
CREATE TABLE `role_privilege` (
  `r_id` int(11) NOT NULL,
  `p_id` int(11) NOT NULL,
  PRIMARY KEY (`r_id`,`p_id`),
  KEY `p_id` (`p_id`),
  CONSTRAINT `role_privilege_ibfk_1` FOREIGN KEY (`r_id`) REFERENCES `role` (`r_id`),
  CONSTRAINT `role_privilege_ibfk_2` FOREIGN KEY (`p_id`) REFERENCES `privilege` (`p_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_privilege
-- ----------------------------
INSERT INTO `role_privilege` VALUES ('1', '1');
INSERT INTO `role_privilege` VALUES ('2', '1');
INSERT INTO `role_privilege` VALUES ('11', '1');
INSERT INTO `role_privilege` VALUES ('1', '2');
INSERT INTO `role_privilege` VALUES ('2', '2');
INSERT INTO `role_privilege` VALUES ('11', '2');
INSERT INTO `role_privilege` VALUES ('1', '3');
INSERT INTO `role_privilege` VALUES ('3', '3');
INSERT INTO `role_privilege` VALUES ('8', '3');
INSERT INTO `role_privilege` VALUES ('11', '3');
INSERT INTO `role_privilege` VALUES ('1', '4');
INSERT INTO `role_privilege` VALUES ('10', '4');
INSERT INTO `role_privilege` VALUES ('1', '5');
INSERT INTO `role_privilege` VALUES ('2', '5');
INSERT INTO `role_privilege` VALUES ('3', '5');
INSERT INTO `role_privilege` VALUES ('8', '5');
INSERT INTO `role_privilege` VALUES ('9', '5');
INSERT INTO `role_privilege` VALUES ('11', '5');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `u_id` int(11) NOT NULL AUTO_INCREMENT,
  `u_name` varchar(10) DEFAULT NULL,
  `u_username` varchar(18) DEFAULT NULL,
  `u_password` varchar(18) DEFAULT NULL,
  `u_photo` varchar(255) DEFAULT NULL,
  `u_sex` varchar(4) DEFAULT NULL,
  `r_id` int(11) DEFAULT NULL,
  `u_status` int(11) DEFAULT NULL,
  `u_tel` varchar(20) DEFAULT NULL,
  `u_mail` varchar(30) DEFAULT NULL,
  `u_birth` timestamp NULL DEFAULT NULL,
  `u_remark` varchar(255) DEFAULT NULL,
  `d_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`u_id`),
  KEY `d_id` (`d_id`),
  KEY `r_id` (`r_id`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`d_id`) REFERENCES `dept` (`d_id`),
  CONSTRAINT `user_ibfk_2` FOREIGN KEY (`r_id`) REFERENCES `role` (`r_id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '小明', 'xiaoming', '123456', 'user//09804a84-f8b1-43d5-b890-5e8a5d36c3a3u=2132181767,631158225&fm=26&gp=0.jpg', '男', '1', '1', '110', '10110110@qq.com', '2017-08-01 14:41:16', '666', '1');
INSERT INTO `user` VALUES ('2', '管理员', 'admin', '123456', 'user//dc588708-a0a4-420d-8416-5fa82ddcdbb1u=2053219083,1423963214&fm=15&gp=0.jpg', '女', '1', '1', '1111', '248528796@qq.com', '2017-05-01 19:09:05', 'dghjg', '5');
INSERT INTO `user` VALUES ('16', '六六六', '666', '666666', 'user//27c226df-55e1-4c32-80b1-3fb96e95cbd9u=3355569652,2427248385&fm=214&gp=0.jpg', '女', '8', '1', '6666666', '6666666666@qq.com', '2017-09-18 00:00:00', '66666666666666', '1');
INSERT INTO `user` VALUES ('18', '啦啦', 'lala', '123', 'user//9986487b-f697-4588-a7de-2315dfefc1f7u=3480386409,76764475&fm=26&gp=0.jpg', '女', '9', '1', '13546578965', '45466938@qq.com', '2012-09-02 00:00:00', '个和你短发接口hiU我生日和电脑科技股份层框架 跑的会覆盖好感动', '3');
INSERT INTO `user` VALUES ('21', '科技', 'sfdgdrt', '134235', 'user//05b90ad2-5d50-45e6-b347-51f7ce10d64au=3981338244,4043847447&fm=11&gp=0.jpg', '男', '2', '1', '13546984234', '3246457658@163.com', '2014-09-01 00:00:00', 'yu8ukggggggggggggggggggjhm', '6');
INSERT INTO `user` VALUES ('22', '魏国丹', 'wei', '123156', null, '女', '8', '1', '14354675453', '21346568@qq.com', '2012-08-27 00:00:00', 'fdxtyyyyyfgggggggggsdrtertew', '3');
INSERT INTO `user` VALUES ('24', '123', '123', '123', 'user//32325568-4142-4d9b-adff-4e18ebf534e3u=1185432685,1702399950&fm=11&gp=0.jpg', '女', '10', '1', '1233333', '123', '2012-08-26 00:00:00', '123', '3');
INSERT INTO `user` VALUES ('28', '222', '222', '222', 'user//162b1e4b-62dc-46ef-a8f2-c2f983036a93u=893714377,1010951087&fm=26&gp=0.jpg', '女', '1', '1', '222', '222', '2017-09-19 00:00:00', '222', '3');
INSERT INTO `user` VALUES ('30', '6', '6', '6', 'user//9c470fc4-db0c-42dd-b112-b11de7b6751cu=3981338244,4043847447&fm=11&gp=0.jpg', '女', '1', '1', '6', '6', '2017-09-04 00:00:00', '6', '4');
INSERT INTO `user` VALUES ('31', '99', '99', '99', null, '男', '3', '1', '99', '99', '2017-09-04 00:00:00', '99', '2');
INSERT INTO `user` VALUES ('32', '0', '0', '0', 'user//cbbe2000-79fa-4b7f-9be0-27bd272ab4e8u=2053219083,1423963214&fm=15&gp=0.jpg', '男', '8', '1', '6', '6', '2017-09-04 00:00:00', '6', '2');
INSERT INTO `user` VALUES ('33', '11', '11', '1', null, '男', '2', '1', '1', '1', '2017-09-04 00:00:00', '1', '2');
INSERT INTO `user` VALUES ('34', '789', '789', '789', 'user//9af100cc-ee87-48c5-b3af-985e48063db2u=3981338244,4043847447&fm=11&gp=0 - 副本.jpg', '女', '9', '1', '12354687999', '789', '2017-09-04 00:00:00', '789', '6');
INSERT INTO `user` VALUES ('35', '012', '012', '012', null, '男', '9', '1', '012', '012', '2017-09-04 00:00:00', '012', '6');
INSERT INTO `user` VALUES ('36', '545', '54', '545', 'user//b6c234e1-8a8f-4c4e-a94f-00489be28c75u=3355569652,2427248385&fm=214&gp=0.jpg', '女', '2', '1', '789967879', '12337444448', '2012-09-04 00:00:00', '/*99999999999999999', '4');
INSERT INTO `user` VALUES ('37', '454', '55', '555', 'user//e8a48be2-907f-4dd7-9ecc-1638dcabf02au=3480386409,76764475&fm=26&gp=0.jpg', '男', '1', '1', '453452453', '5463452', '2012-09-13 00:00:00', '474857', '1');
INSERT INTO `user` VALUES ('40', '654', '654', '654', 'user//dd2fd15c-b0d3-4336-8100-ca2321aea5deok.jpg', '男', '1', '1', '45', '45', '2017-09-04 00:00:00', '5', '1');
INSERT INTO `user` VALUES ('42', '66666666', '66', '66', 'user//5feab87e-db6d-47e3-a287-048404563a37u=2132181767,631158225&fm=26&gp=0.jpg', '男', '1', '1', '22', '222', '2017-09-06 00:00:00', '12341', '1');
