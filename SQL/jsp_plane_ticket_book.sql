/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80022
 Source Host           : localhost:3306
 Source Schema         : jsp_plane_ticket_book

 Target Server Type    : MySQL
 Target Server Version : 80022
 File Encoding         : 65001

 Date: 05/05/2023 22:13:24
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin_user
-- ----------------------------
DROP TABLE IF EXISTS `admin_user`;
CREATE TABLE `admin_user` (
  `user` varchar(16) NOT NULL COMMENT '管理员用户名',
  `pwd` varchar(32) NOT NULL COMMENT '管理员密码',
  PRIMARY KEY (`user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='管理员用户表';

-- ----------------------------
-- Records of admin_user
-- ----------------------------
BEGIN;
INSERT INTO `admin_user` VALUES ('admin', '74D839D98630E280DF752E8939454A6B');
COMMIT;

-- ----------------------------
-- Table structure for common_user
-- ----------------------------
DROP TABLE IF EXISTS `common_user`;
CREATE TABLE `common_user` (
  `user_name` varchar(16) NOT NULL,
  `user_pwd` varchar(32) NOT NULL,
  `avatar_img` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`user_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of common_user
-- ----------------------------
BEGIN;
INSERT INTO `common_user` VALUES ('admin', '74D839D98630E280DF752E8939454A6B', '9c77f9e7-6334-49df-a444-149e7bd49f81.png');
INSERT INTO `common_user` VALUES ('matou', 'F59BD65F7EDAFB087A81D4DCA06C4910', '8470c358-2855-4c99-9aed-3aac027c8b6f.jpg');
INSERT INTO `common_user` VALUES ('person', '4C904D7B4ED2AE1C4F37C7913A2AD694', NULL);
INSERT INTO `common_user` VALUES ('ttt', '0848B04BE353ABCBE2F684C8B3112E7A', NULL);
COMMIT;

-- ----------------------------
-- Table structure for flight
-- ----------------------------
DROP TABLE IF EXISTS `flight`;
CREATE TABLE `flight` (
  `f_n` varchar(6) NOT NULL COMMENT '航班号',
  `f_s_p` varchar(4) NOT NULL COMMENT '航班起点',
  `f_e_p` varchar(4) NOT NULL COMMENT '航班终点',
  `f_s_a` varchar(12) NOT NULL COMMENT '航班起飞机场',
  `f_a_a` varchar(12) NOT NULL COMMENT '航班到达机场',
  `f_d_t` varchar(5) NOT NULL COMMENT '起飞(departure)时间',
  `f_a_t` varchar(5) NOT NULL COMMENT '到达时间',
  `f_f_c_p` int NOT NULL COMMENT '头等舱价格First class price',
  `f_s_c_p` int NOT NULL COMMENT '商务舱价格',
  `f_t_c_p` int NOT NULL COMMENT '经济舱价格',
  `f_f_c_n` int DEFAULT NULL COMMENT '头等舱机票数量',
  `f_s_c_n` int DEFAULT NULL COMMENT '商务舱机票数量',
  `f_t_c_n` int DEFAULT NULL COMMENT '经济舱机票数量',
  PRIMARY KEY (`f_n`),
  UNIQUE KEY `f_n` (`f_n`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='航班信息';

-- ----------------------------
-- Records of flight
-- ----------------------------
BEGIN;
INSERT INTO `flight` VALUES ('SU2312', '北京', '郑州', '大兴机场', '新郑机场', '07:30', '12:00', 2100, 1500, 800, 0, 0, 0);
INSERT INTO `flight` VALUES ('CA3060', '北京', '上海', '首都机场', '虹桥机场', '08:30', '12:30', 2100, 1600, 1200, 0, 0, 0);
INSERT INTO `flight` VALUES ('IR5098', '北京', '德黑兰', '首都国际机场', '德黑兰国际机场', '9::50', '18:50', 5600, 18800, 3500, 0, 0, 0);
INSERT INTO `flight` VALUES ('F7834', '天津', '上海', '天津国际机场', '上海浦东机场', '8:14', '12:00', 2010, 4000, 800, 0, 0, 0);
INSERT INTO `flight` VALUES ('FV3454', '青岛', '山西', '青岛国际机场', '山西机场', '12:03', '14:00', 100, 200, 50, 0, 0, 0);
INSERT INTO `flight` VALUES ('FV3489', '天津', '山西', '青岛国际机场', '山西机场', '8:14', '12:00', 2010, 4000, 800, 8, 11, 800);
INSERT INTO `flight` VALUES ('FA0001', '青岛', '山西', '青岛国际机场', '山西机场', '12:03', '14:00', 2010, 4000, 800, 8, 0, 10);
COMMIT;

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_user` varchar(50) NOT NULL COMMENT '下单用户',
  `f_n` varchar(50) NOT NULL COMMENT '航班号',
  `p_name` varchar(50) NOT NULL COMMENT '乘客姓名',
  `date` varchar(50) NOT NULL COMMENT '订单日期',
  `grade` varchar(50) NOT NULL COMMENT '舱别',
  `p_id` varchar(50) NOT NULL COMMENT '乘客身份证号',
  `contact` varchar(50) NOT NULL COMMENT '联系人',
  `c_p` varchar(50) NOT NULL COMMENT '联系人电话',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of t_order
-- ----------------------------
BEGIN;
INSERT INTO `t_order` VALUES (7, 'matou', 'SU2312', 'du yabo', '2020-01-10', '头等舱', '223600', 'du yabo', '13022502404');
INSERT INTO `t_order` VALUES (8, 'matou', 'SU2312', 'matou', '2020-01-09', '头等舱', '321312321213132213', 'matou', '13022502404');
INSERT INTO `t_order` VALUES (9, 'admin', 'CA3060', '王尧', '2020-01-09', '头等舱', '534534654654', '为人父', '45345443');
INSERT INTO `t_order` VALUES (10, 'person', 'SU2312', '李四', '2023-04-19', '商务舱', '422202199503141417', '李四', '18834333333');
INSERT INTO `t_order` VALUES (11, 'person', 'SU2312', '李四', '2023-04-13', '经济舱', '422202199503141417', '李四', '18834333333');
COMMIT;

-- ----------------------------
-- Table structure for user_message
-- ----------------------------
DROP TABLE IF EXISTS `user_message`;
CREATE TABLE `user_message` (
  `id` int NOT NULL AUTO_INCREMENT,
  `time` varchar(10) NOT NULL,
  `user_name` varchar(32) NOT NULL,
  `message_content` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_message
-- ----------------------------
BEGIN;
INSERT INTO `user_message` VALUES (24, '2019-6-14', '小糊涂仙', '贵公司服务态度很好，继续努力^c^');
INSERT INTO `user_message` VALUES (30, '2020-1-9', 'matou', '很好');
INSERT INTO `user_message` VALUES (31, '2020-1-9', '源码码头', '留言');
INSERT INTO `user_message` VALUES (32, '2023-4-17', '乘客', '这家航空公司不错');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
