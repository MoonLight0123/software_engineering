/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50733
 Source Host           : localhost:3306
 Source Schema         : db1

 Target Server Type    : MySQL
 Target Server Version : 50733
 File Encoding         : 65001

 Date: 28/06/2023 16:11:30
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `cno` int(11) NOT NULL AUTO_INCREMENT,
  `cname` varchar(20) CHARACTER SET utf8 COLLATE utf8_danish_ci NOT NULL,
  PRIMARY KEY (`cno`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_danish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES (1, '英语六级');
INSERT INTO `course` VALUES (2, '英语四级');

-- ----------------------------
-- Table structure for exam
-- ----------------------------
DROP TABLE IF EXISTS `exam`;
CREATE TABLE `exam`  (
  `eid` int(11) NOT NULL AUTO_INCREMENT,
  `pname` varchar(20) CHARACTER SET utf8 COLLATE utf8_danish_ci NOT NULL,
  `cno` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `classid` int(11) NOT NULL,
  `singlenumber` int(11) NOT NULL,
  `singlecore` int(11) NOT NULL,
  `multiplenumber` int(11) NOT NULL,
  `multiplecore` int(11) NOT NULL,
  `compositionnumber` int(11) NULL DEFAULT NULL,
  `compositioncore` int(11) NULL DEFAULT NULL,
  `examdate` date NOT NULL,
  `examtime` date NOT NULL,
  `testtime` int(11) NOT NULL,
  PRIMARY KEY (`eid`) USING BTREE,
  INDEX `fk_relationship_2`(`userid`) USING BTREE,
  INDEX `fk_relationship_3`(`classid`) USING BTREE,
  INDEX `fk_relationship_4`(`cno`) USING BTREE,
  CONSTRAINT `fk_relationship_2` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_relationship_3` FOREIGN KEY (`classid`) REFERENCES `pjclass` (`classid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_relationship_4` FOREIGN KEY (`cno`) REFERENCES `course` (`cno`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_danish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of exam
-- ----------------------------
INSERT INTO `exam` VALUES (2, '2023六月六级考试', 1, 2, 1, 1, 10, 0, 0, 0, 0, '2023-06-03', '2023-06-03', 15);
INSERT INTO `exam` VALUES (3, '2023六月四级考试', 1, 2, 1, 3, 10, 0, 0, 0, 0, '2023-06-03', '2023-06-03', 15);

-- ----------------------------
-- Table structure for paper
-- ----------------------------
DROP TABLE IF EXISTS `paper`;
CREATE TABLE `paper`  (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `eid` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `cno` int(11) NOT NULL,
  `stype` int(11) NOT NULL,
  `scontent` varchar(255) CHARACTER SET utf8 COLLATE utf8_danish_ci NOT NULL,
  `sa` varchar(255) CHARACTER SET utf8 COLLATE utf8_danish_ci NULL DEFAULT NULL,
  `sb` varchar(255) CHARACTER SET utf8 COLLATE utf8_danish_ci NULL DEFAULT NULL,
  `sc` varchar(255) CHARACTER SET utf8 COLLATE utf8_danish_ci NULL DEFAULT NULL,
  `sd` varchar(255) CHARACTER SET utf8 COLLATE utf8_danish_ci NULL DEFAULT NULL,
  `skey` varchar(255) CHARACTER SET utf8 COLLATE utf8_danish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`pid`) USING BTREE,
  INDEX `fk_relationship_13`(`eid`) USING BTREE,
  INDEX `fk_relationship_14`(`sid`) USING BTREE,
  CONSTRAINT `fk_relationship_13` FOREIGN KEY (`eid`) REFERENCES `exam` (`eid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_relationship_14` FOREIGN KEY (`sid`) REFERENCES `subject` (`sid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_danish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of paper
-- ----------------------------
INSERT INTO `paper` VALUES (2, 2, 4, 0, 1, 'Give me your telephone number __ I need your help.', 'in case', 'so that', 'unless', 'test', 'A');
INSERT INTO `paper` VALUES (3, 3, 4, 0, 1, 'Give me your telephone number __ I need your help.', 'in case', 'so that', 'unless', 'test', 'A');
INSERT INTO `paper` VALUES (4, 3, 5, 0, 1, 'He was knocked down by a car and badly _', 'injured', 'damaged', 'hurted', 'ruined', 'C');
INSERT INTO `paper` VALUES (5, 3, 1, 0, 1, 'The book contained a large__ of information', 'deal', 'amount', 'number', 'sum', 'B');

-- ----------------------------
-- Table structure for pjclass
-- ----------------------------
DROP TABLE IF EXISTS `pjclass`;
CREATE TABLE `pjclass`  (
  `classid` int(11) NOT NULL AUTO_INCREMENT,
  `classname` varchar(20) CHARACTER SET utf8 COLLATE utf8_danish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`classid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_danish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pjclass
-- ----------------------------
INSERT INTO `pjclass` VALUES (1, 'A卷');
INSERT INTO `pjclass` VALUES (2, 'B卷');
INSERT INTO `pjclass` VALUES (6, '备用卷');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `roleid` int(11) NOT NULL AUTO_INCREMENT,
  `rolename` varchar(20) CHARACTER SET utf8 COLLATE utf8_danish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`roleid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_danish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, '老师');
INSERT INTO `role` VALUES (2, '学生');
INSERT INTO `role` VALUES (3, '管理员');

-- ----------------------------
-- Table structure for studentexam
-- ----------------------------
DROP TABLE IF EXISTS `studentexam`;
CREATE TABLE `studentexam`  (
  `seid` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `classid` int(11) NOT NULL,
  `eid` int(11) NOT NULL,
  `pname` varchar(20) CHARACTER SET utf8 COLLATE utf8_danish_ci NOT NULL,
  `zscore` int(11) NOT NULL DEFAULT 0,
  `score` int(11) NOT NULL DEFAULT 0,
  `cpscore` int(11) NULL DEFAULT 0,
  `tjtime` datetime NOT NULL,
  `status` int(11) NULL DEFAULT 0 COMMENT '状态（0： 未考  1：已考）',
  PRIMARY KEY (`seid`) USING BTREE,
  INDEX `fk_relationship_6`(`userid`) USING BTREE,
  INDEX `fk_relationship_7`(`classid`) USING BTREE,
  INDEX `fk_relationship_8`(`eid`) USING BTREE,
  CONSTRAINT `fk_relationship_6` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_relationship_7` FOREIGN KEY (`classid`) REFERENCES `pjclass` (`classid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_relationship_8` FOREIGN KEY (`eid`) REFERENCES `exam` (`eid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_danish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of studentexam
-- ----------------------------
INSERT INTO `studentexam` VALUES (1, 3, 1, 2, '2023六月六级考试', 22, 0, 10, '2023-06-03 00:56:42', 0);

-- ----------------------------
-- Table structure for studentsubject
-- ----------------------------
DROP TABLE IF EXISTS `studentsubject`;
CREATE TABLE `studentsubject`  (
  `ssid` int(11) NOT NULL AUTO_INCREMENT,
  `seid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `eid` int(11) NOT NULL,
  `sid` int(11) NOT NULL,
  `studentkey` text CHARACTER SET utf8 COLLATE utf8_danish_ci NOT NULL,
  `score` int(11) NULL DEFAULT 0,
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_danish_ci NULL DEFAULT NULL COMMENT '作文审批状态（0：未审批  1：已审批）',
  PRIMARY KEY (`ssid`) USING BTREE,
  INDEX `fk_relationship_9`(`seid`) USING BTREE,
  INDEX `fk_relationship_10`(`userid`) USING BTREE,
  INDEX `fk_relationship_11`(`eid`) USING BTREE,
  INDEX `fk_relationship_12`(`sid`) USING BTREE,
  CONSTRAINT `fk_relationship_10` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_relationship_11` FOREIGN KEY (`eid`) REFERENCES `exam` (`eid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_relationship_12` FOREIGN KEY (`sid`) REFERENCES `subject` (`sid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_relationship_9` FOREIGN KEY (`seid`) REFERENCES `studentexam` (`seid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_danish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of studentsubject
-- ----------------------------
INSERT INTO `studentsubject` VALUES (1, 1, 3, 2, 4, 'D', 0, NULL);
INSERT INTO `studentsubject` VALUES (5, 1, 3, 2, 6, '这是我的测试作文', 10, '1');

-- ----------------------------
-- Table structure for subject
-- ----------------------------
DROP TABLE IF EXISTS `subject`;
CREATE TABLE `subject`  (
  `sid` int(11) NOT NULL AUTO_INCREMENT,
  `cno` int(11) NOT NULL,
  `stype` int(11) NOT NULL,
  `scontent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `sa` varchar(255) CHARACTER SET utf8 COLLATE utf8_danish_ci NULL DEFAULT NULL,
  `sb` varchar(255) CHARACTER SET utf8 COLLATE utf8_danish_ci NULL DEFAULT NULL,
  `sc` varchar(255) CHARACTER SET utf8 COLLATE utf8_danish_ci NULL DEFAULT NULL,
  `sd` varchar(255) CHARACTER SET utf8 COLLATE utf8_danish_ci NULL DEFAULT NULL,
  `skey` varchar(255) CHARACTER SET utf8 COLLATE utf8_danish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sid`) USING BTREE,
  UNIQUE INDEX `scontent`(`scontent`) USING BTREE,
  INDEX `fk_relationship_5`(`cno`) USING BTREE,
  CONSTRAINT `fk_relationship_5` FOREIGN KEY (`cno`) REFERENCES `course` (`cno`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_danish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of subject
-- ----------------------------
INSERT INTO `subject` VALUES (1, 1, 1, 'The book contained a large__ of information', 'deal', 'amount', 'number', 'sum', 'B');
INSERT INTO `subject` VALUES (4, 1, 1, 'Give me your telephone number __ I need your help.', 'in case', 'so that', 'unless', 'test', 'A');
INSERT INTO `subject` VALUES (5, 1, 1, 'He was knocked down by a car and badly _', 'injured', 'damaged', 'hurted', 'ruined', 'C');
INSERT INTO `subject` VALUES (6, 1, 3, 'This is a test essay that needs to be redefined', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `subject` VALUES (9, 1, 1, 'dsa', '1', '2', '3', '4', 'A,B');

-- ----------------------------
-- Table structure for type
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type`  (
  `stype` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_danish_ci NOT NULL,
  PRIMARY KEY (`stype`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_danish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of type
-- ----------------------------
INSERT INTO `type` VALUES (1, '一，单选题');
INSERT INTO `type` VALUES (2, '二，多选题');
INSERT INTO `type` VALUES (3, '三，作文题');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `roleid` int(11) NULL DEFAULT NULL,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_danish_ci NULL DEFAULT NULL,
  `userpwd` varchar(20) CHARACTER SET utf8 COLLATE utf8_danish_ci NULL DEFAULT NULL,
  `truename` varchar(30) CHARACTER SET utf8 COLLATE utf8_danish_ci NULL DEFAULT NULL,
  `classid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`userid`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE,
  INDEX `fk_relationship_1`(`roleid`) USING BTREE,
  CONSTRAINT `fk_relationship_1` FOREIGN KEY (`roleid`) REFERENCES `role` (`roleid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_danish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 3, 'admin', '12345', '管理员', 1);
INSERT INTO `users` VALUES (2, 1, 'teacher1', '12345', '老师1', 1);
INSERT INTO `users` VALUES (3, 2, 'student1', '12345', '学生1', 1);
INSERT INTO `users` VALUES (5, 2, 'student2', '12345', '学生2', 2);

SET FOREIGN_KEY_CHECKS = 1;
