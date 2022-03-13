/*
 Navicat Premium Data Transfer

 Source Server         : MySQL
 Source Server Type    : MySQL
 Source Server Version : 50732
 Source Host           : localhost:3306
 Source Schema         : erpdb

 Target Server Type    : MySQL
 Target Server Version : 50732
 File Encoding         : 65001

 Date: 13/03/2022 15:23:31
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account`  (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `account_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `now_money` double(255, 2) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `flag` int(10) NULL DEFAULT NULL COMMENT '标志：0代表本企业，1代表供应商',
  `status` int(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES (1, '中国农业银行', '622728371102596345', 4999810.50, '0.0', 0, 1);
INSERT INTO `account` VALUES (2, '鲁南制药', '622728371103647894', NULL, '0.0', 1, 1);
INSERT INTO `account` VALUES (10, '中国工商银行', '622818485654785501', 100008.00, '中国工商银行', 0, 1);
INSERT INTO `account` VALUES (15, '伊利乳业', '684566478564789648', 0.00, '卡哇伊', 1, 1);
INSERT INTO `account` VALUES (16, '可口可乐账户', '622825748945465454', 0.00, '可口可乐', 1, 1);

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `role` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'admin', '$2a$10$f4d.ETIniNQrcMZqtwEDN.Qfj4c7Xotvo.OFFBAUKQBdACuHL8ZGS', '管理员', '10032311520', '1065678296@qq.com', '此账号为系统管理员账号，拥有本系统的最高权限！', '5');
INSERT INTO `admin` VALUES (2, 'admin1', '$2a$10$L1ibi0tEKWQQ7SF7dHk1Ueg0Lg.KGo.MV/QLo58H5CplgcEBxGIce', '小王', '1584756756', '1234541@163.com', 'hahahhahah被骗了吧', '1');
INSERT INTO `admin` VALUES (14, 'test', '$2a$10$flUqeq15xua/POTdGnrghOTlp6bHkf4HYMlQY2/Yh2R.hcqw3QRzm', '测试账号', '12306', '969224480@qq.com', '测试账号，拥有最高权限！', '5');
INSERT INTO `admin` VALUES (15, 'addtest', '$2a$10$c8.7X8HqPS/aVLqJwBacNOQ872cRyNssgoTuYO0iHHzaY2foHKhaG', '添加测试', '1011001', '2022002', '测试添加功能，该用户不具备管理员权限！', '1');
INSERT INTO `admin` VALUES (16, 'a1101', '$2a$10$6Q8/AYlL2b7CzaSOqxuhPuWx2Rrn6W/EqqfkdHPmbdoBlmNKevJnu', '1111', '11111', '111111@qq.com', '11345645661', '1');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `pid` int(20) NULL DEFAULT NULL COMMENT '父id',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类别名称',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `status` tinyint(1) NULL DEFAULT NULL COMMENT 'zhaungtai',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, 0, '饮品', '果味饮品，各种各样的好喝的', 1);
INSERT INTO `category` VALUES (2, 1, '蒙牛', '牛奶也是饮品', 0);
INSERT INTO `category` VALUES (3, 1, '伊利', '伊利牛奶', 0);
INSERT INTO `category` VALUES (12, 1, '乳制品', '纯牛奶酸奶', 1);
INSERT INTO `category` VALUES (13, 1, '果汁', '汇源。。。', 1);

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`  (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `category_id` int(20) NULL DEFAULT NULL COMMENT '所属类别',
  `measure_id` int(20) NULL DEFAULT NULL COMMENT '计量单位',
  `safety_stock` int(20) NULL DEFAULT NULL COMMENT '安全存量',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `status` tinyint(1) NULL DEFAULT NULL COMMENT '状态（启用禁用）',
  `delete_flag` tinyint(1) NULL DEFAULT NULL COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES (1, '优酸乳', 12, 3, 5, '优酸乳就是好喝！', 1, 0);
INSERT INTO `goods` VALUES (2, '豆奶粉', 12, 1, 5000, '豆奶制品', 1, 0);
INSERT INTO `goods` VALUES (3, '安慕希', 12, 3, 500, '安慕希酸奶，高端酸奶！', 1, 0);
INSERT INTO `goods` VALUES (4, '可口可乐', 1, 3, 1000, '可口可乐，cococolo', 1, 0);
INSERT INTO `goods` VALUES (5, '养乐多', 1, 3, 100, '养乐多，好喝多喝养乐多！', 1, 0);

-- ----------------------------
-- Table structure for goods_supplier
-- ----------------------------
DROP TABLE IF EXISTS `goods_supplier`;
CREATE TABLE `goods_supplier`  (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `gid` int(20) NULL DEFAULT NULL COMMENT 'goods的id',
  `sid` int(20) NULL DEFAULT NULL COMMENT 'supplier的id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品——供应商表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods_supplier
-- ----------------------------
INSERT INTO `goods_supplier` VALUES (1, 1, 3);
INSERT INTO `goods_supplier` VALUES (2, 1, 4);
INSERT INTO `goods_supplier` VALUES (5, 3, 3);
INSERT INTO `goods_supplier` VALUES (6, 2, 2);
INSERT INTO `goods_supplier` VALUES (7, 2, 3);
INSERT INTO `goods_supplier` VALUES (9, 4, 5);
INSERT INTO `goods_supplier` VALUES (10, 5, 3);
INSERT INTO `goods_supplier` VALUES (11, 5, 4);

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log`  (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `module` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `operation` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `date` datetime(6) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(6),
  `status` int(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1574 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES (1, 'test', '测试账号', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2021-11-21 19:47:39.858000', 1);
INSERT INTO `log` VALUES (2, 'test', '测试账号', '系统管理', '查询用户信息', 'http://localhost:8088/system/userInfo', '127.0.0.1', '2021-11-21 19:47:46.170000', 1);
INSERT INTO `log` VALUES (3, 'test', '测试账号', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2021-11-21 20:12:58.939000', 1);
INSERT INTO `log` VALUES (4, 'test', '测试账号', '系统管理', '查询日志信息', 'http://localhost:8088/system/log', '127.0.0.1', '2021-11-21 20:13:01.702000', 1);
INSERT INTO `log` VALUES (5, 'test', '测试账号', '系统管理', '查询系统功能', 'http://localhost:8088/system/functionInfo', '127.0.0.1', '2021-11-21 20:13:03.122000', 1);
INSERT INTO `log` VALUES (6, 'test', '测试账号', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2021-11-21 20:15:08.027000', 1);
INSERT INTO `log` VALUES (7, 'test', '测试账号', '系统管理', '查询系统功能', 'http://localhost:8088/system/functionInfo', '127.0.0.1', '2021-11-21 20:15:11.144000', 1);
INSERT INTO `log` VALUES (8, 'test', '测试账号', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2021-11-21 20:16:48.194000', 1);
INSERT INTO `log` VALUES (9, 'test', '测试账号', '系统管理', '查询系统功能', 'http://localhost:8088/system/functionInfo', '127.0.0.1', '2021-11-21 20:16:51.295000', 1);
INSERT INTO `log` VALUES (10, 'test', '测试账号', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2021-11-21 21:19:55.899000', 1);
INSERT INTO `log` VALUES (11, 'test', '测试账号', '系统管理', '查询用户信息', 'http://localhost:8088/system/userInfo', '127.0.0.1', '2021-11-21 21:19:59.123000', 1);
INSERT INTO `log` VALUES (12, 'test', '测试账号', '系统管理', '查询日志信息', 'http://localhost:8088/system/log', '127.0.0.1', '2021-11-21 21:19:59.245000', 1);
INSERT INTO `log` VALUES (13, 'test', '测试账号', '系统管理', '查询系统功能', 'http://localhost:8088/system/functionInfo', '127.0.0.1', '2021-11-21 21:19:59.707000', 1);
INSERT INTO `log` VALUES (14, 'test', '测试账号', '系统管理', '查询系统功能', 'http://localhost:8088/system/functionInfo', '127.0.0.1', '2021-11-21 21:48:52.682000', 1);
INSERT INTO `log` VALUES (15, 'test', '测试账号', '系统管理', '禁用功能', 'http://localhost:8088/system/banFunctionById', '127.0.0.1', '2021-11-21 21:49:12.042000', 1);
INSERT INTO `log` VALUES (16, 'test', '测试账号', '系统管理', '查询系统功能', 'http://localhost:8088/system/functionInfo', '127.0.0.1', '2021-11-21 21:49:13.747000', 1);
INSERT INTO `log` VALUES (17, 'test', '测试账号', '系统管理', '禁用功能', 'http://localhost:8088/system/banFunctionById', '127.0.0.1', '2021-11-21 21:49:21.293000', 1);
INSERT INTO `log` VALUES (18, 'test', '测试账号', '系统管理', '禁用功能', 'http://localhost:8088/system/banFunctionById', '127.0.0.1', '2021-11-21 21:49:21.672000', 1);
INSERT INTO `log` VALUES (19, 'test', '测试账号', '系统管理', '查询系统功能', 'http://localhost:8088/system/functionInfo', '127.0.0.1', '2021-11-21 21:49:22.965000', 1);
INSERT INTO `log` VALUES (20, 'test', '测试账号', '系统管理', '查询系统功能', 'http://localhost:8088/system/functionInfo', '127.0.0.1', '2021-11-21 21:49:30.841000', 1);
INSERT INTO `log` VALUES (21, 'test', '测试账号', '系统管理', '查询日志信息', 'http://localhost:8088/system/log', '127.0.0.1', '2021-11-21 21:49:33.975000', 1);
INSERT INTO `log` VALUES (22, 'test', '测试账号', '系统管理', '启用功能', 'http://localhost:8088/system/openFunctionById', '127.0.0.1', '2021-11-21 21:49:51.746000', 1);
INSERT INTO `log` VALUES (23, 'test', '测试账号', '系统管理', '查询系统功能', 'http://localhost:8088/system/functionInfo', '127.0.0.1', '2021-11-21 21:49:53.422000', 1);
INSERT INTO `log` VALUES (24, 'test', '测试账号', '系统管理', '禁用功能', 'http://localhost:8088/system/banFunctionById', '127.0.0.1', '2021-11-21 21:49:58.714000', 1);
INSERT INTO `log` VALUES (25, 'test', '测试账号', '系统管理', '查询系统功能', 'http://localhost:8088/system/functionInfo', '127.0.0.1', '2021-11-21 21:50:00.375000', 1);
INSERT INTO `log` VALUES (26, 'test', '测试账号', '系统管理', '查询系统功能', 'http://localhost:8088/system/functionInfo', '127.0.0.1', '2021-11-21 21:50:01.871000', 1);
INSERT INTO `log` VALUES (27, 'test', '测试账号', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2021-11-21 21:52:28.598000', 1);
INSERT INTO `log` VALUES (28, 'test', '测试账号', '系统管理', '查询系统功能', 'http://localhost:8088/system/functionInfo', '127.0.0.1', '2021-11-21 21:52:32.804000', 1);
INSERT INTO `log` VALUES (29, 'test', '测试账号', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2021-11-22 17:39:44.479000', 1);
INSERT INTO `log` VALUES (30, 'test', '测试账号', '系统管理', '查询系统功能', 'http://localhost:8088/system/functionInfo', '127.0.0.1', '2021-11-22 17:39:53.458000', 1);
INSERT INTO `log` VALUES (31, 'test', '测试账号', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2021-11-22 19:39:35.931000', 1);
INSERT INTO `log` VALUES (32, 'test', '测试账号', '系统管理', '查询系统功能', 'http://localhost:8088/system/functionInfo', '127.0.0.1', '2021-11-22 19:39:38.697000', 1);
INSERT INTO `log` VALUES (33, 'test', '测试账号', '系统管理', '禁用功能', 'http://localhost:8088/system/banFunctionById', '127.0.0.1', '2021-11-22 19:39:45.019000', 1);
INSERT INTO `log` VALUES (34, 'test', '测试账号', '系统管理', '查询系统功能', 'http://localhost:8088/system/functionInfo', '127.0.0.1', '2021-11-22 19:39:46.660000', 1);
INSERT INTO `log` VALUES (35, 'test', '测试账号', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2021-11-22 20:09:59.410000', 1);
INSERT INTO `log` VALUES (36, 'test', '测试账号', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2021-11-22 20:29:18.560000', 1);
INSERT INTO `log` VALUES (37, 'test', '测试账号', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2021-11-22 20:32:03.463000', 1);
INSERT INTO `log` VALUES (38, 'test', '测试账号', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2021-11-22 21:53:53.924000', 1);
INSERT INTO `log` VALUES (39, 'test', '测试账号', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2021-11-22 21:53:56.867000', 1);
INSERT INTO `log` VALUES (40, 'test', '测试账号', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2021-11-22 21:54:30.884000', 1);
INSERT INTO `log` VALUES (41, 'test', '测试账号', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2021-11-22 21:55:50.302000', 1);
INSERT INTO `log` VALUES (42, 'test', '测试账号', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2021-11-22 21:55:54.117000', 1);
INSERT INTO `log` VALUES (43, 'test', '测试账号', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2021-11-22 21:56:30.464000', 1);
INSERT INTO `log` VALUES (44, 'test', '测试账号', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2021-11-22 22:04:23.645000', 1);
INSERT INTO `log` VALUES (45, 'test', '测试账号', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2021-11-22 22:04:26.691000', 1);
INSERT INTO `log` VALUES (46, 'test', '测试账号', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2021-11-23 09:11:27.167000', 1);
INSERT INTO `log` VALUES (47, 'test', '测试账号', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2021-11-23 09:11:31.612000', 1);
INSERT INTO `log` VALUES (48, 'test', '测试账号', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2021-11-23 09:12:29.844000', 1);
INSERT INTO `log` VALUES (49, 'test', '测试账号', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2021-11-23 09:12:32.877000', 1);
INSERT INTO `log` VALUES (50, 'test', '测试账号', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2021-11-23 09:52:07.881000', 1);
INSERT INTO `log` VALUES (51, 'test', '测试账号', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2021-11-23 09:52:11.046000', 1);
INSERT INTO `log` VALUES (52, 'test', '测试账号', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2021-11-23 12:38:49.056000', 1);
INSERT INTO `log` VALUES (53, 'test', '测试账号', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2021-11-23 12:38:52.847000', 1);
INSERT INTO `log` VALUES (54, 'test', '测试账号', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2021-11-23 12:46:37.172000', 1);
INSERT INTO `log` VALUES (55, 'test', '测试账号', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2021-11-23 12:46:39.959000', 1);
INSERT INTO `log` VALUES (56, 'test', '测试账号', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2021-11-23 12:47:41.936000', 1);
INSERT INTO `log` VALUES (57, 'test', '测试账号', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2021-11-23 12:47:44.924000', 1);
INSERT INTO `log` VALUES (58, 'test', '测试账号', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2021-11-23 12:47:46.420000', 1);
INSERT INTO `log` VALUES (59, 'test', '测试账号', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2021-11-23 12:47:57.380000', 1);
INSERT INTO `log` VALUES (60, 'test', '测试账号', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2021-11-23 12:47:59.682000', 1);
INSERT INTO `log` VALUES (61, 'test', '测试账号', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2021-11-23 12:48:02.258000', 1);
INSERT INTO `log` VALUES (62, 'test', '测试账号', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2021-11-23 12:48:05.744000', 1);
INSERT INTO `log` VALUES (63, 'test', '测试账号', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2021-11-23 12:48:37.315000', 1);
INSERT INTO `log` VALUES (64, 'test', '测试账号', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2021-11-23 12:48:39.186000', 1);
INSERT INTO `log` VALUES (65, 'test', '测试账号', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2021-11-23 12:48:40.763000', 1);
INSERT INTO `log` VALUES (66, 'test', '测试账号', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2021-11-23 12:48:43.654000', 1);
INSERT INTO `log` VALUES (67, 'test', '测试账号', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2021-11-23 12:48:50.580000', 1);
INSERT INTO `log` VALUES (68, 'test', '测试账号', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2021-11-23 12:48:52.027000', 1);
INSERT INTO `log` VALUES (69, 'test', '测试账号', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2021-11-23 12:49:29.793000', 1);
INSERT INTO `log` VALUES (70, 'test', '测试账号', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2021-11-23 12:49:33.003000', 1);
INSERT INTO `log` VALUES (71, 'test', '测试账号', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2021-11-23 12:49:35.272000', 1);
INSERT INTO `log` VALUES (72, 'test', '测试账号', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2021-11-23 12:49:39.348000', 1);
INSERT INTO `log` VALUES (73, 'test', '测试账号', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2021-11-23 12:49:40.705000', 1);
INSERT INTO `log` VALUES (74, 'test', '测试账号', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2021-11-23 12:49:42.138000', 1);
INSERT INTO `log` VALUES (75, 'test', '测试账号', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2021-11-23 12:49:44.083000', 1);
INSERT INTO `log` VALUES (76, 'test', '测试账号', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2021-11-23 12:49:45.940000', 1);
INSERT INTO `log` VALUES (77, 'test', '测试账号', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2021-11-23 12:49:48.715000', 1);
INSERT INTO `log` VALUES (78, 'test', '测试账号', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2021-11-23 12:51:33.226000', 1);
INSERT INTO `log` VALUES (79, 'test', '测试账号', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2021-11-23 12:51:36.188000', 1);
INSERT INTO `log` VALUES (80, 'test', '测试账号', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2021-11-23 12:51:46.910000', 1);
INSERT INTO `log` VALUES (81, 'test', '测试账号', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2021-11-23 13:08:28.479000', 1);
INSERT INTO `log` VALUES (82, 'test', '测试账号', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2021-11-23 13:08:33.273000', 1);
INSERT INTO `log` VALUES (83, 'test', '测试账号', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2021-11-23 13:08:35.077000', 1);
INSERT INTO `log` VALUES (84, 'test', '测试账号', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2021-11-23 13:08:35.265000', 1);
INSERT INTO `log` VALUES (85, 'test', '测试账号', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2021-11-23 13:08:37.759000', 1);
INSERT INTO `log` VALUES (86, 'test', '测试账号', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2021-11-23 13:08:43.028000', 1);
INSERT INTO `log` VALUES (87, 'test', '测试账号', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2021-11-23 13:16:57.946000', 1);
INSERT INTO `log` VALUES (88, 'test', '测试账号', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2021-11-23 13:17:01.279000', 1);
INSERT INTO `log` VALUES (89, 'test', '测试账号', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2021-11-23 13:18:35.473000', 1);
INSERT INTO `log` VALUES (90, 'test', '测试账号', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2021-11-23 13:18:38.673000', 1);
INSERT INTO `log` VALUES (91, 'test', '测试账号', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2021-11-23 13:19:10.654000', 1);
INSERT INTO `log` VALUES (92, 'test', '测试账号', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2021-11-23 13:19:15.146000', 1);
INSERT INTO `log` VALUES (93, 'test', '测试账号', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2021-11-23 14:14:31.643000', 1);
INSERT INTO `log` VALUES (94, 'test', '测试账号', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2021-11-23 14:14:34.492000', 1);
INSERT INTO `log` VALUES (95, 'test', '测试账号', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2021-11-23 14:14:36.665000', 1);
INSERT INTO `log` VALUES (96, 'test', '测试账号', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2021-11-23 14:14:38.427000', 1);
INSERT INTO `log` VALUES (97, 'test', '测试账号', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2021-11-23 14:14:40.679000', 1);
INSERT INTO `log` VALUES (98, 'test', '测试账号', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2021-11-23 14:15:31.119000', 1);
INSERT INTO `log` VALUES (99, 'test', '测试账号', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2021-11-23 14:34:43.526000', 1);
INSERT INTO `log` VALUES (100, 'test', '测试账号', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2021-11-23 14:34:49.983000', 1);
INSERT INTO `log` VALUES (101, 'test', '测试账号', '系统管理', '查询日志信息', 'http://localhost:8088/system/log', '127.0.0.1', '2021-11-23 14:34:55.535000', 1);
INSERT INTO `log` VALUES (102, 'test', '测试账号', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2021-11-23 14:38:56.139000', 1);
INSERT INTO `log` VALUES (103, 'test', '测试账号', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2021-11-23 14:41:41.108000', 1);
INSERT INTO `log` VALUES (104, 'test', '测试账号', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2021-11-23 14:43:56.189000', 1);
INSERT INTO `log` VALUES (105, 'test', '测试账号', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2021-11-23 14:45:00.002000', 1);
INSERT INTO `log` VALUES (106, 'test', '测试账号', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2021-11-23 14:50:44.506000', 1);
INSERT INTO `log` VALUES (107, 'test', '测试账号', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2021-11-23 14:50:52.072000', 1);
INSERT INTO `log` VALUES (108, 'test', '测试账号', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2021-11-23 15:08:04.686000', 1);
INSERT INTO `log` VALUES (109, 'test', '测试账号', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2021-11-23 15:32:10.792000', 1);
INSERT INTO `log` VALUES (110, 'test', '测试账号', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2021-11-23 15:32:14.678000', 1);
INSERT INTO `log` VALUES (111, 'test', '测试账号', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2021-11-23 15:37:05.293000', 1);
INSERT INTO `log` VALUES (112, 'test', '测试账号', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2021-11-23 15:42:15.910000', 1);
INSERT INTO `log` VALUES (113, 'test', '测试账号', '系统管理', '查询用户信息', 'http://localhost:8088/system/userInfo', '127.0.0.1', '2021-11-23 15:43:17.775000', 1);
INSERT INTO `log` VALUES (114, 'test', '测试账号', '系统管理', '查询日志信息', 'http://localhost:8088/system/log', '127.0.0.1', '2021-11-23 15:43:20.661000', 1);
INSERT INTO `log` VALUES (115, 'test', '测试账号', '系统管理', '查询系统功能', 'http://localhost:8088/system/functionInfo', '127.0.0.1', '2021-11-23 15:43:22.474000', 1);
INSERT INTO `log` VALUES (116, 'test', '测试账号', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2021-11-23 15:45:59.014000', 1);
INSERT INTO `log` VALUES (117, 'test', '测试账号', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2021-11-23 15:49:17.272000', 1);
INSERT INTO `log` VALUES (118, 'test', '测试账号', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2021-11-23 15:50:52.121000', 1);
INSERT INTO `log` VALUES (119, 'test', '测试账号', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2021-11-23 15:51:32.586000', 1);
INSERT INTO `log` VALUES (120, 'test', '测试账号', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2021-11-23 15:53:20.140000', 1);
INSERT INTO `log` VALUES (121, 'test', '测试账号', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2021-11-23 15:53:58.957000', 1);
INSERT INTO `log` VALUES (122, 'test', '测试账号', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2021-11-23 15:54:32.602000', 1);
INSERT INTO `log` VALUES (123, 'test', '测试账号', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2021-11-23 15:55:46.921000', 1);
INSERT INTO `log` VALUES (124, 'test', '测试账号', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2021-11-23 16:06:16.672000', 1);
INSERT INTO `log` VALUES (125, 'test', '测试账号', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2021-11-23 16:13:09.133000', 1);
INSERT INTO `log` VALUES (126, 'test', '测试账号', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2021-11-23 16:17:12.564000', 1);
INSERT INTO `log` VALUES (127, 'test', '测试账号', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2021-11-23 16:22:15.168000', 1);
INSERT INTO `log` VALUES (128, 'test', '测试账号', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2021-11-23 16:23:53.208000', 1);
INSERT INTO `log` VALUES (129, 'test', '测试账号', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2021-11-23 16:24:42.949000', 1);
INSERT INTO `log` VALUES (130, 'test', '测试账号', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2021-11-23 16:28:21.102000', 1);
INSERT INTO `log` VALUES (131, 'test', '测试账号', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2021-11-23 16:44:30.220000', 1);
INSERT INTO `log` VALUES (132, 'test', '测试账号', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2021-11-23 16:44:34.033000', 1);
INSERT INTO `log` VALUES (133, 'test', '测试账号', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2021-11-23 16:47:11.181000', 1);
INSERT INTO `log` VALUES (134, 'test', '测试账号', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2021-11-23 16:47:15.960000', 1);
INSERT INTO `log` VALUES (135, 'test', '测试账号', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2021-11-23 16:47:30.410000', 1);
INSERT INTO `log` VALUES (136, 'test', '测试账号', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2021-11-23 16:49:08.263000', 1);
INSERT INTO `log` VALUES (137, 'test', '测试账号', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2021-11-23 16:49:29.752000', 1);
INSERT INTO `log` VALUES (138, 'test', '测试账号', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2021-11-23 16:49:33.246000', 1);
INSERT INTO `log` VALUES (139, 'test', '测试账号', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2021-11-23 16:49:38.446000', 1);
INSERT INTO `log` VALUES (140, 'test', '测试账号', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2021-11-23 16:50:38.135000', 1);
INSERT INTO `log` VALUES (141, 'test', '测试账号', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2021-11-23 16:51:05.250000', 1);
INSERT INTO `log` VALUES (142, 'test', '测试账号', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2021-11-23 16:51:35.008000', 1);
INSERT INTO `log` VALUES (143, 'test', '测试账号', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2021-11-23 16:51:55.058000', 1);
INSERT INTO `log` VALUES (144, 'test', '测试账号', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2021-11-23 16:58:57.600000', 1);
INSERT INTO `log` VALUES (145, 'test', '测试账号', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2021-11-23 16:59:01.840000', 1);
INSERT INTO `log` VALUES (146, 'test', '测试账号', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2021-11-23 17:03:21.035000', 1);
INSERT INTO `log` VALUES (147, 'test', '测试账号', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2021-11-23 17:03:24.412000', 1);
INSERT INTO `log` VALUES (148, 'test', '测试账号', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2021-11-23 17:04:16.114000', 1);
INSERT INTO `log` VALUES (149, 'test', '测试账号', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2021-11-23 17:04:19.493000', 1);
INSERT INTO `log` VALUES (150, 'test', '测试账号', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2021-11-23 17:04:28.416000', 1);
INSERT INTO `log` VALUES (151, 'test', '测试账号', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2021-11-23 17:10:42.174000', 1);
INSERT INTO `log` VALUES (152, 'test', '测试账号', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2021-11-23 17:10:46.811000', 1);
INSERT INTO `log` VALUES (153, 'test', '测试账号', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2021-11-23 17:12:28.180000', 1);
INSERT INTO `log` VALUES (154, 'test', '测试账号', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2021-11-23 17:12:32.430000', 1);
INSERT INTO `log` VALUES (155, 'test', '测试账号', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2021-11-23 17:14:44.439000', 1);
INSERT INTO `log` VALUES (156, 'test', '测试账号', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2021-11-23 17:14:47.829000', 1);
INSERT INTO `log` VALUES (157, 'test', '测试账号', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2021-11-23 17:18:41.577000', 1);
INSERT INTO `log` VALUES (158, 'test', '测试账号', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2021-11-23 17:18:45.473000', 1);
INSERT INTO `log` VALUES (159, 'test', '测试账号', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2021-11-23 17:18:51.250000', 1);
INSERT INTO `log` VALUES (160, 'test', '测试账号', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2021-11-23 17:20:12.958000', 1);
INSERT INTO `log` VALUES (161, 'test', '测试账号', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2021-11-23 17:20:16.450000', 1);
INSERT INTO `log` VALUES (162, 'test', '测试账号', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2021-11-23 17:20:22.443000', 1);
INSERT INTO `log` VALUES (163, 'test', '测试账号', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2021-11-23 17:23:12.995000', 1);
INSERT INTO `log` VALUES (164, 'test', '测试账号', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2021-11-23 17:23:15.983000', 1);
INSERT INTO `log` VALUES (165, 'test', '测试账号', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2021-11-23 17:23:22.433000', 1);
INSERT INTO `log` VALUES (166, 'test', '测试账号', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2021-11-23 17:23:49.428000', 1);
INSERT INTO `log` VALUES (167, 'test', '测试账号', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2021-11-23 17:24:25.232000', 1);
INSERT INTO `log` VALUES (168, 'test', '测试账号', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2021-11-23 17:24:28.563000', 1);
INSERT INTO `log` VALUES (169, 'test', '测试账号', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2021-11-23 17:24:35.424000', 1);
INSERT INTO `log` VALUES (170, 'test', '测试账号', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2021-11-23 17:24:51.097000', 1);
INSERT INTO `log` VALUES (171, 'test', '测试账号', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2021-11-23 17:26:21.099000', 1);
INSERT INTO `log` VALUES (172, 'test', '测试账号', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2021-11-23 17:26:24.471000', 1);
INSERT INTO `log` VALUES (173, 'test', '测试账号', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2021-11-23 17:26:49.433000', 1);
INSERT INTO `log` VALUES (174, 'test', '测试账号', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2021-11-23 17:27:17.437000', 1);
INSERT INTO `log` VALUES (175, 'test', '测试账号', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2021-11-23 17:34:57.488000', 1);
INSERT INTO `log` VALUES (176, 'test', '测试账号', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2021-11-23 17:35:01.953000', 1);
INSERT INTO `log` VALUES (177, 'test', '测试账号', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2021-11-23 17:36:39.307000', 1);
INSERT INTO `log` VALUES (178, 'test', '测试账号', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2021-11-23 17:36:42.202000', 1);
INSERT INTO `log` VALUES (179, 'test', '测试账号', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2021-11-23 17:39:00.481000', 1);
INSERT INTO `log` VALUES (180, 'test', '测试账号', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2021-11-23 17:39:03.801000', 1);
INSERT INTO `log` VALUES (181, 'test', '测试账号', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2021-11-23 17:39:10.074000', 1);
INSERT INTO `log` VALUES (182, 'test', '测试账号', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2021-11-23 17:39:17.717000', 1);
INSERT INTO `log` VALUES (183, 'test', '测试账号', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2021-11-23 17:39:41.445000', 1);
INSERT INTO `log` VALUES (184, 'test', '测试账号', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2021-11-23 17:46:02.923000', 1);
INSERT INTO `log` VALUES (185, 'test', '测试账号', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2021-11-23 17:46:06.661000', 1);
INSERT INTO `log` VALUES (186, 'test', '测试账号', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2021-11-23 17:46:21.427000', 1);
INSERT INTO `log` VALUES (187, 'test', '测试账号', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2021-11-23 17:51:16.708000', 1);
INSERT INTO `log` VALUES (188, 'test', '测试账号', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2021-11-23 17:51:20.647000', 1);
INSERT INTO `log` VALUES (189, 'test', '测试账号', '基本资料', '删除账户信息', 'http://localhost:8088/info/delAccount', '127.0.0.1', '2021-11-23 17:51:22.683000', 1);
INSERT INTO `log` VALUES (190, 'test', '测试账号', '系统管理', '修改用户信息', 'http://localhost:8088/system/editUserInfo', '127.0.0.1', '2021-11-23 17:51:29.292000', 1);
INSERT INTO `log` VALUES (191, 'test', '测试账号', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2021-11-23 17:51:30.974000', 1);
INSERT INTO `log` VALUES (192, 'test', '测试账号', '系统管理', '修改用户信息', 'http://localhost:8088/system/editUserInfo', '127.0.0.1', '2021-11-23 17:52:11.474000', 1);
INSERT INTO `log` VALUES (193, 'test', '测试账号', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2021-11-23 17:52:13.192000', 1);
INSERT INTO `log` VALUES (194, 'test', '测试账号', '系统管理', '修改用户信息', 'http://localhost:8088/system/editUserInfo', '127.0.0.1', '2021-11-23 17:52:44.230000', 1);
INSERT INTO `log` VALUES (195, 'test', '测试账号', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2021-11-23 17:52:46.063000', 1);
INSERT INTO `log` VALUES (196, 'test', '测试账号', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2021-11-23 17:55:42.218000', 1);
INSERT INTO `log` VALUES (197, 'test', '测试账号', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2021-11-23 17:55:46.734000', 1);
INSERT INTO `log` VALUES (198, 'test', '测试账号', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2021-11-23 17:55:57.467000', 1);
INSERT INTO `log` VALUES (199, 'test', '测试账号', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2021-11-23 17:57:12.430000', 1);
INSERT INTO `log` VALUES (200, 'test', '测试账号', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2021-11-23 17:59:46.520000', 1);
INSERT INTO `log` VALUES (201, 'test', '测试账号', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2021-11-23 18:06:39.728000', 1);
INSERT INTO `log` VALUES (202, 'test', '测试账号', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2021-11-23 18:06:43.546000', 1);
INSERT INTO `log` VALUES (203, 'test', '测试账号', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2021-11-23 18:06:55.515000', 1);
INSERT INTO `log` VALUES (204, 'test', '测试账号', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2021-11-23 18:09:33.889000', 1);
INSERT INTO `log` VALUES (205, 'test', '测试账号', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2021-11-23 18:09:37.295000', 1);
INSERT INTO `log` VALUES (206, 'test', '测试账号', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2021-11-23 18:09:39.407000', 1);
INSERT INTO `log` VALUES (207, 'test', '测试账号', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2021-11-23 18:11:32.652000', 1);
INSERT INTO `log` VALUES (208, 'test', '测试账号', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2021-11-23 18:11:37.859000', 1);
INSERT INTO `log` VALUES (209, 'test', '测试账号', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2021-11-23 18:12:59.447000', 1);
INSERT INTO `log` VALUES (210, 'test', '测试账号', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2021-11-23 18:13:32.833000', 1);
INSERT INTO `log` VALUES (211, 'test', '测试账号', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2021-11-23 18:14:20.669000', 1);
INSERT INTO `log` VALUES (212, 'test', '测试账号', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2021-11-23 18:14:24.365000', 1);
INSERT INTO `log` VALUES (213, 'test', '测试账号', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2021-11-23 18:14:31.419000', 1);
INSERT INTO `log` VALUES (214, 'test', '测试账号', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2021-11-23 18:15:11.937000', 1);
INSERT INTO `log` VALUES (215, 'test', '测试账号', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2021-11-23 18:15:15.003000', 1);
INSERT INTO `log` VALUES (216, 'test', '测试账号', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2021-11-23 18:16:37.132000', 1);
INSERT INTO `log` VALUES (217, 'test', '测试账号', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2021-11-23 18:16:41.574000', 1);
INSERT INTO `log` VALUES (218, 'test', '测试账号', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2021-11-23 18:18:08.205000', 1);
INSERT INTO `log` VALUES (219, 'test', '测试账号', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2021-11-23 18:18:11.534000', 1);
INSERT INTO `log` VALUES (220, 'test', '测试账号', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2021-11-23 18:18:19.006000', 1);
INSERT INTO `log` VALUES (221, 'test', '测试账号', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2021-11-23 18:18:33.910000', 1);
INSERT INTO `log` VALUES (222, 'test', '测试账号', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2021-11-24 14:01:31.097000', 1);
INSERT INTO `log` VALUES (223, 'test', '测试账号', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2021-11-24 14:01:37.835000', 1);
INSERT INTO `log` VALUES (224, 'test', '测试账号', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2021-11-24 14:01:48.116000', 1);
INSERT INTO `log` VALUES (225, 'test', '测试账号', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2021-11-24 14:01:49.542000', 1);
INSERT INTO `log` VALUES (226, 'test', '测试账号', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2021-11-24 14:01:52.507000', 1);
INSERT INTO `log` VALUES (227, 'test', '测试账号', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2021-11-24 14:01:53.971000', 1);
INSERT INTO `log` VALUES (228, 'test', '测试账号', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2021-11-24 14:01:55.373000', 1);
INSERT INTO `log` VALUES (229, 'test', '测试账号', '基本资料', '删除账户信息', 'http://localhost:8088/info/delAllAcount', '127.0.0.1', '2021-11-24 14:01:59.182000', 1);
INSERT INTO `log` VALUES (230, 'test', '测试账号', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2021-11-24 14:02:00.322000', 1);
INSERT INTO `log` VALUES (231, 'test', '测试账号', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2021-11-24 14:02:02.713000', 1);
INSERT INTO `log` VALUES (232, 'test', '测试账号', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2021-11-24 14:07:05.658000', 1);
INSERT INTO `log` VALUES (233, 'test', '测试账号', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2021-11-24 14:07:10.016000', 1);
INSERT INTO `log` VALUES (234, 'test', '测试账号', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2021-11-24 14:09:09.854000', 1);
INSERT INTO `log` VALUES (235, 'test', '测试账号', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2021-11-24 14:09:13.777000', 1);
INSERT INTO `log` VALUES (236, 'test', '测试账号', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2021-11-24 14:09:22.287000', 1);
INSERT INTO `log` VALUES (237, 'test', '测试账号', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2021-11-24 14:09:29.749000', 1);
INSERT INTO `log` VALUES (238, 'test', '测试账号', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2021-11-24 14:09:36.978000', 1);
INSERT INTO `log` VALUES (239, 'test', '测试账号', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2021-11-24 18:57:13.699724', 0);
INSERT INTO `log` VALUES (240, 'test', '测试账号', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2021-11-24 18:57:13.696694', 0);
INSERT INTO `log` VALUES (241, 'test', '测试账号', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2021-11-24 18:57:13.693800', 0);
INSERT INTO `log` VALUES (242, 'test', '测试账号', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2021-11-24 18:57:13.691071', 0);
INSERT INTO `log` VALUES (243, 'test', '测试账号', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2021-11-24 18:57:13.687897', 0);
INSERT INTO `log` VALUES (244, 'test', '测试账号', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2021-11-24 18:57:13.685487', 0);
INSERT INTO `log` VALUES (245, 'test', '测试账号', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2021-11-24 18:57:13.681870', 0);
INSERT INTO `log` VALUES (246, 'test', '测试账号', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2021-11-24 18:57:13.679694', 0);
INSERT INTO `log` VALUES (247, 'test', '测试账号', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2021-11-24 18:57:13.675893', 0);
INSERT INTO `log` VALUES (248, 'test', '测试账号', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2021-11-24 18:57:13.673192', 0);
INSERT INTO `log` VALUES (249, 'test', '测试账号', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2021-11-24 18:57:13.669622', 0);
INSERT INTO `log` VALUES (250, 'test', '测试账号', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2021-11-24 18:57:13.667531', 0);
INSERT INTO `log` VALUES (251, 'test', '测试账号', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2021-11-24 18:57:13.664249', 0);
INSERT INTO `log` VALUES (252, 'test', '测试账号', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2021-11-24 18:57:13.661906', 0);
INSERT INTO `log` VALUES (253, 'test', '测试账号', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2021-11-24 18:57:04.872237', 0);
INSERT INTO `log` VALUES (254, 'test', '测试账号', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2021-11-24 18:57:04.870037', 0);
INSERT INTO `log` VALUES (255, 'test', '测试账号', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2021-11-24 18:57:04.866882', 0);
INSERT INTO `log` VALUES (256, 'test', '测试账号', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2021-11-24 18:57:04.864318', 0);
INSERT INTO `log` VALUES (257, 'test', '测试账号', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2021-11-24 18:57:04.861192', 0);
INSERT INTO `log` VALUES (258, 'test', '测试账号', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2021-11-24 18:57:04.858977', 0);
INSERT INTO `log` VALUES (259, 'test', '测试账号', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2021-11-24 18:57:04.855723', 0);
INSERT INTO `log` VALUES (260, 'test', '测试账号', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2021-11-24 18:57:04.853542', 0);
INSERT INTO `log` VALUES (261, 'test', '测试账号', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2021-11-24 18:57:04.850287', 0);
INSERT INTO `log` VALUES (262, 'test', '测试账号', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2021-11-24 18:57:04.847599', 0);
INSERT INTO `log` VALUES (263, 'test', '测试账号', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2021-11-24 18:57:04.844602', 0);
INSERT INTO `log` VALUES (264, 'test', '测试账号', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2021-11-24 18:57:04.842395', 0);
INSERT INTO `log` VALUES (265, 'test', '测试账号', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2021-11-24 18:57:04.839006', 0);
INSERT INTO `log` VALUES (266, 'test', '测试账号', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2021-11-24 18:57:04.836611', 0);
INSERT INTO `log` VALUES (267, 'test', '测试账号', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2021-11-24 18:57:01.488851', 0);
INSERT INTO `log` VALUES (268, 'test', '测试账号', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2021-11-24 18:57:01.486514', 0);
INSERT INTO `log` VALUES (269, 'test', '测试账号', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2021-11-24 18:57:01.482069', 0);
INSERT INTO `log` VALUES (270, 'test', '测试账号', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2021-11-24 18:57:01.479877', 0);
INSERT INTO `log` VALUES (271, 'test', '测试账号', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2021-11-24 18:57:01.476721', 0);
INSERT INTO `log` VALUES (272, 'test', '测试账号', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2021-11-24 18:57:01.474445', 0);
INSERT INTO `log` VALUES (273, 'test', '测试账号', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2021-11-24 18:57:01.471159', 0);
INSERT INTO `log` VALUES (274, 'test', '测试账号', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2021-11-24 18:57:01.468717', 0);
INSERT INTO `log` VALUES (275, 'test', '测试账号', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2021-11-24 18:57:01.465033', 0);
INSERT INTO `log` VALUES (276, 'test', '测试账号', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2021-11-24 18:57:01.463144', 0);
INSERT INTO `log` VALUES (277, 'test', '测试账号', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2021-11-24 18:57:01.460084', 0);
INSERT INTO `log` VALUES (278, 'test', '测试账号', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2021-11-24 18:57:01.458001', 0);
INSERT INTO `log` VALUES (279, 'test', '测试账号', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2021-11-24 18:57:01.454804', 0);
INSERT INTO `log` VALUES (280, 'test', '测试账号', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2021-11-24 18:57:01.440007', 0);
INSERT INTO `log` VALUES (281, 'test', '测试账号', '基本资料', '删除账户信息', 'http://localhost:8088/info/delAccount', '127.0.0.1', '2021-11-24 18:56:58.284726', 0);
INSERT INTO `log` VALUES (282, 'test', '测试账号', '基本资料', '删除账户信息', 'http://localhost:8088/info/delAllAcount', '127.0.0.1', '2021-11-24 18:56:58.281207', 0);
INSERT INTO `log` VALUES (283, 'test', '测试账号', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2021-11-24 18:56:58.279090', 0);
INSERT INTO `log` VALUES (284, 'test', '测试账号', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2021-11-24 18:56:58.275942', 0);
INSERT INTO `log` VALUES (285, 'test', '测试账号', '基本资料', '删除账户信息', 'http://localhost:8088/info/delAccount', '127.0.0.1', '2021-11-24 18:56:58.273695', 0);
INSERT INTO `log` VALUES (286, 'test', '测试账号', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2021-11-24 18:56:58.270254', 0);
INSERT INTO `log` VALUES (287, 'test', '测试账号', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2021-11-24 18:56:58.266788', 0);
INSERT INTO `log` VALUES (288, 'test', '测试账号', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2021-11-24 18:56:58.264725', 0);
INSERT INTO `log` VALUES (289, 'test', '测试账号', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2021-11-24 18:56:58.261497', 0);
INSERT INTO `log` VALUES (290, 'test', '测试账号', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2021-11-24 18:56:58.259200', 0);
INSERT INTO `log` VALUES (291, 'test', '测试账号', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2021-11-24 18:56:58.255898', 0);
INSERT INTO `log` VALUES (292, 'test', '测试账号', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2021-11-24 18:56:58.254091', 0);
INSERT INTO `log` VALUES (293, 'test', '测试账号', '基本资料', '删除账户信息', 'http://localhost:8088/info/delAccount', '127.0.0.1', '2021-11-24 18:56:58.250762', 0);
INSERT INTO `log` VALUES (294, 'test', '测试账号', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2021-11-24 18:56:58.248613', 0);
INSERT INTO `log` VALUES (295, 'test', '测试账号', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2021-11-24 18:56:54.113952', 0);
INSERT INTO `log` VALUES (296, 'test', '测试账号', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2021-11-24 18:56:54.111520', 0);
INSERT INTO `log` VALUES (297, 'test', '测试账号', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2021-11-24 18:56:54.108170', 0);
INSERT INTO `log` VALUES (298, 'test', '测试账号', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2021-11-24 18:56:54.105918', 0);
INSERT INTO `log` VALUES (299, 'test', '测试账号', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2021-11-24 18:56:54.102701', 0);
INSERT INTO `log` VALUES (300, 'test', '测试账号', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2021-11-24 18:56:54.099871', 0);
INSERT INTO `log` VALUES (301, 'test', '测试账号', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2021-11-24 18:56:54.096120', 0);
INSERT INTO `log` VALUES (302, 'test', '测试账号', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2021-11-24 18:56:54.094282', 0);
INSERT INTO `log` VALUES (303, 'test', '测试账号', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2021-11-24 18:56:54.090839', 0);
INSERT INTO `log` VALUES (304, 'test', '测试账号', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2021-11-24 18:56:54.088211', 0);
INSERT INTO `log` VALUES (305, 'test', '测试账号', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2021-11-24 18:56:54.084876', 0);
INSERT INTO `log` VALUES (306, 'test', '测试账号', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2021-11-24 18:56:54.081819', 0);
INSERT INTO `log` VALUES (307, 'test', '测试账号', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2021-11-24 18:56:54.046137', 0);
INSERT INTO `log` VALUES (308, 'test', '测试账号', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2021-11-24 18:56:54.043316', 0);
INSERT INTO `log` VALUES (309, 'test', '测试账号', '系统管理', '查询日志信息', 'http://localhost:8088/system/log', '127.0.0.1', '2021-11-24 18:56:54.028888', 0);
INSERT INTO `log` VALUES (310, 'test', '测试账号', '系统管理', '查询日志信息', 'http://localhost:8088/system/log', '127.0.0.1', '2021-11-24 18:56:58.225819', 0);
INSERT INTO `log` VALUES (311, 'test', '测试账号', '系统管理', '查询日志信息', 'http://localhost:8088/system/log', '127.0.0.1', '2021-11-24 18:57:01.427228', 0);
INSERT INTO `log` VALUES (312, 'test', '测试账号', '系统管理', '查询日志信息', 'http://localhost:8088/system/log', '127.0.0.1', '2021-11-24 18:57:04.811278', 0);
INSERT INTO `log` VALUES (313, 'test', '测试账号', '系统管理', '查询日志信息', 'http://localhost:8088/system/log', '127.0.0.1', '2021-11-24 18:57:13.658579', 0);
INSERT INTO `log` VALUES (314, 'test', '测试账号', '系统管理', '查询日志信息', 'http://localhost:8088/system/log', '127.0.0.1', '2021-11-24 18:57:18.647254', 0);
INSERT INTO `log` VALUES (315, 'test', '测试账号', '系统管理', '查询日志信息', 'http://localhost:8088/system/log', '127.0.0.1', '2021-11-24 18:57:19.680000', 1);
INSERT INTO `log` VALUES (316, 'test', '测试账号', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2021-11-24 18:57:22.781000', 1);
INSERT INTO `log` VALUES (317, 'test', '测试账号', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2021-11-24 18:59:39.034000', 1);
INSERT INTO `log` VALUES (318, 'test', '测试账号', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2021-11-24 18:59:42.482000', 1);
INSERT INTO `log` VALUES (319, 'test', '测试账号', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2021-11-24 19:10:56.290000', 1);
INSERT INTO `log` VALUES (320, 'test', '测试账号', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2021-11-24 19:10:59.894000', 1);
INSERT INTO `log` VALUES (321, 'test', '测试账号', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2021-11-24 19:18:59.881000', 1);
INSERT INTO `log` VALUES (322, 'test', '测试账号', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2021-11-24 19:22:42.845000', 1);
INSERT INTO `log` VALUES (323, 'test', '测试账号', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2021-11-24 19:22:45.481000', 1);
INSERT INTO `log` VALUES (324, 'test', '测试账号', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2021-11-24 19:55:23.492000', 1);
INSERT INTO `log` VALUES (325, 'test', '测试账号', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2021-11-24 19:55:27.249000', 1);
INSERT INTO `log` VALUES (326, 'test', '测试账号', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2021-11-24 19:56:30.561000', 1);
INSERT INTO `log` VALUES (327, 'test', '测试账号', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2021-11-24 19:56:34.401000', 1);
INSERT INTO `log` VALUES (328, 'test', '测试账号', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2021-11-24 19:59:38.453000', 1);
INSERT INTO `log` VALUES (329, 'test', '测试账号', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2021-11-24 19:59:41.840000', 1);
INSERT INTO `log` VALUES (330, 'test', '测试账号', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2021-11-24 20:00:29.080000', 1);
INSERT INTO `log` VALUES (331, 'test', '测试账号', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2021-11-24 20:00:32.733000', 1);
INSERT INTO `log` VALUES (332, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-06 13:54:53.252000', 1);
INSERT INTO `log` VALUES (333, 'admin', '管理员', '系统管理', '查询用户信息', 'http://localhost:8088/system/userInfo', '127.0.0.1', '2022-01-06 13:55:05.100000', 1);
INSERT INTO `log` VALUES (334, 'admin', '管理员', '系统管理', '查询日志信息', 'http://localhost:8088/system/log', '127.0.0.1', '2022-01-06 13:55:06.066000', 1);
INSERT INTO `log` VALUES (335, 'admin', '管理员', '系统管理', '查询系统功能', 'http://localhost:8088/system/functionInfo', '127.0.0.1', '2022-01-06 13:55:06.999000', 1);
INSERT INTO `log` VALUES (336, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-06 13:55:09.800000', 1);
INSERT INTO `log` VALUES (337, 'admin', '管理员', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2022-01-06 13:55:10.779000', 1);
INSERT INTO `log` VALUES (338, 'admin', '管理员', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2022-01-06 13:56:17.043000', 1);
INSERT INTO `log` VALUES (339, 'admin', '管理员', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2022-01-06 13:56:19.745000', 1);
INSERT INTO `log` VALUES (340, 'admin', '管理员', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2022-01-06 13:56:33.417000', 1);
INSERT INTO `log` VALUES (341, 'admin', '管理员', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2022-01-06 13:56:35.238000', 1);
INSERT INTO `log` VALUES (342, 'admin', '管理员', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2022-01-06 13:56:37.338000', 1);
INSERT INTO `log` VALUES (343, 'admin', '管理员', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2022-01-06 13:56:40.494000', 1);
INSERT INTO `log` VALUES (344, 'admin', '管理员', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2022-01-06 13:56:44.614000', 1);
INSERT INTO `log` VALUES (345, 'admin', '管理员', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2022-01-06 13:56:44.736000', 1);
INSERT INTO `log` VALUES (346, 'admin', '管理员', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2022-01-06 13:56:47.109000', 1);
INSERT INTO `log` VALUES (347, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-06 13:56:59.102000', 1);
INSERT INTO `log` VALUES (348, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-06 13:58:43.254000', 1);
INSERT INTO `log` VALUES (349, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-06 13:58:45.661000', 1);
INSERT INTO `log` VALUES (350, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-06 13:59:01.396000', 1);
INSERT INTO `log` VALUES (351, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-06 14:00:23.087000', 1);
INSERT INTO `log` VALUES (352, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-06 14:02:31.484000', 1);
INSERT INTO `log` VALUES (353, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-06 14:02:34.681000', 1);
INSERT INTO `log` VALUES (354, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-06 14:03:50.326000', 1);
INSERT INTO `log` VALUES (355, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-06 14:03:53.663000', 1);
INSERT INTO `log` VALUES (356, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-06 14:05:28.203000', 1);
INSERT INTO `log` VALUES (357, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-06 14:05:31.248000', 1);
INSERT INTO `log` VALUES (358, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-06 14:06:02.612000', 1);
INSERT INTO `log` VALUES (359, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-06 14:06:05.332000', 1);
INSERT INTO `log` VALUES (360, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-06 14:07:00.401000', 1);
INSERT INTO `log` VALUES (361, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-06 14:07:03.277000', 1);
INSERT INTO `log` VALUES (362, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-06 14:10:09.871000', 1);
INSERT INTO `log` VALUES (363, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-06 14:23:00.688000', 1);
INSERT INTO `log` VALUES (364, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-06 14:23:03.943000', 1);
INSERT INTO `log` VALUES (365, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-06 14:23:28.108000', 1);
INSERT INTO `log` VALUES (366, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-06 14:24:47.447000', 1);
INSERT INTO `log` VALUES (367, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-06 14:24:50.617000', 1);
INSERT INTO `log` VALUES (368, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-06 14:25:17.430000', 1);
INSERT INTO `log` VALUES (369, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-06 14:25:21.713000', 1);
INSERT INTO `log` VALUES (370, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-06 14:26:08.199000', 1);
INSERT INTO `log` VALUES (371, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-06 14:26:11.196000', 1);
INSERT INTO `log` VALUES (372, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-06 14:26:41.389000', 1);
INSERT INTO `log` VALUES (373, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-06 14:26:45.616000', 1);
INSERT INTO `log` VALUES (374, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-06 14:30:55.794000', 1);
INSERT INTO `log` VALUES (375, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-06 14:30:58.727000', 1);
INSERT INTO `log` VALUES (376, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-06 14:53:08.411000', 1);
INSERT INTO `log` VALUES (377, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-06 14:59:32.632000', 1);
INSERT INTO `log` VALUES (378, 'admin', '管理员', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2022-01-06 14:59:36.153000', 1);
INSERT INTO `log` VALUES (379, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-06 14:59:38.372000', 1);
INSERT INTO `log` VALUES (380, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-06 15:00:57.367000', 1);
INSERT INTO `log` VALUES (381, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-06 15:01:00.346000', 1);
INSERT INTO `log` VALUES (382, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-06 15:01:57.382000', 1);
INSERT INTO `log` VALUES (383, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-06 15:02:00.646000', 1);
INSERT INTO `log` VALUES (384, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-06 15:02:54.542000', 1);
INSERT INTO `log` VALUES (385, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-06 15:02:57.438000', 1);
INSERT INTO `log` VALUES (386, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-06 15:08:37.040000', 1);
INSERT INTO `log` VALUES (387, 'admin', '管理员', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2022-01-06 15:08:40.303000', 1);
INSERT INTO `log` VALUES (388, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-06 15:08:53.517000', 1);
INSERT INTO `log` VALUES (389, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-06 15:32:18.599000', 1);
INSERT INTO `log` VALUES (390, 'admin', '管理员', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2022-01-06 15:32:22.892000', 1);
INSERT INTO `log` VALUES (391, 'admin', '管理员', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2022-01-06 15:32:26.411000', 1);
INSERT INTO `log` VALUES (392, 'admin', '管理员', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2022-01-06 15:32:29.074000', 1);
INSERT INTO `log` VALUES (393, 'admin', '管理员', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2022-01-06 15:32:32.402000', 1);
INSERT INTO `log` VALUES (394, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-06 15:36:31.272000', 1);
INSERT INTO `log` VALUES (395, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-06 15:36:36.402000', 1);
INSERT INTO `log` VALUES (396, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-06 15:41:52.926000', 1);
INSERT INTO `log` VALUES (397, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-06 15:41:56.090000', 1);
INSERT INTO `log` VALUES (398, 'admin', '管理员', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2022-01-06 15:43:29.621000', 1);
INSERT INTO `log` VALUES (399, 'admin', '管理员', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2022-01-06 15:43:34.149000', 1);
INSERT INTO `log` VALUES (400, 'admin', '管理员', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2022-01-06 15:43:36.710000', 1);
INSERT INTO `log` VALUES (401, 'admin', '管理员', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2022-01-06 15:43:40.160000', 1);
INSERT INTO `log` VALUES (402, 'admin', '管理员', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2022-01-06 15:43:45.413000', 1);
INSERT INTO `log` VALUES (403, 'admin', '管理员', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2022-01-06 15:43:53.444000', 1);
INSERT INTO `log` VALUES (404, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-06 15:49:04.778000', 1);
INSERT INTO `log` VALUES (405, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-06 15:49:08.109000', 1);
INSERT INTO `log` VALUES (406, 'admin', '管理员', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2022-01-06 15:49:12.245000', 1);
INSERT INTO `log` VALUES (407, 'admin', '管理员', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2022-01-06 15:55:55.502000', 1);
INSERT INTO `log` VALUES (408, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-06 15:55:59.307000', 1);
INSERT INTO `log` VALUES (409, 'admin', '管理员', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2022-01-06 15:56:21.018000', 1);
INSERT INTO `log` VALUES (410, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-06 15:56:36.768000', 1);
INSERT INTO `log` VALUES (411, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-06 15:58:27.773000', 1);
INSERT INTO `log` VALUES (412, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-06 15:58:31.853000', 1);
INSERT INTO `log` VALUES (413, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-06 16:40:23.783000', 1);
INSERT INTO `log` VALUES (414, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-06 16:40:28.482000', 1);
INSERT INTO `log` VALUES (415, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-06 16:40:58.649000', 1);
INSERT INTO `log` VALUES (416, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-06 16:48:52.339000', 1);
INSERT INTO `log` VALUES (417, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-06 16:49:03.800000', 1);
INSERT INTO `log` VALUES (418, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-06 16:49:21.029000', 1);
INSERT INTO `log` VALUES (419, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-06 16:50:58.170000', 1);
INSERT INTO `log` VALUES (420, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-06 16:51:02.705000', 1);
INSERT INTO `log` VALUES (421, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-06 16:54:05.795000', 1);
INSERT INTO `log` VALUES (422, 'admin', '管理员', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2022-01-06 16:54:13.760000', 1);
INSERT INTO `log` VALUES (423, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-06 16:54:15.598000', 1);
INSERT INTO `log` VALUES (424, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-06 16:54:29.462000', 1);
INSERT INTO `log` VALUES (425, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-07 13:50:52.682000', 1);
INSERT INTO `log` VALUES (426, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-07 13:50:57.455000', 1);
INSERT INTO `log` VALUES (427, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-07 13:51:30.328000', 1);
INSERT INTO `log` VALUES (428, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-07 13:52:33.354000', 1);
INSERT INTO `log` VALUES (429, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-07 13:58:46.310000', 1);
INSERT INTO `log` VALUES (430, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-07 13:58:56.154000', 1);
INSERT INTO `log` VALUES (431, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-07 14:00:50.639000', 1);
INSERT INTO `log` VALUES (432, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-07 14:03:43.721000', 1);
INSERT INTO `log` VALUES (433, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-07 14:04:05.358000', 1);
INSERT INTO `log` VALUES (434, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-07 14:33:51.645000', 1);
INSERT INTO `log` VALUES (435, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-07 14:33:54.597000', 1);
INSERT INTO `log` VALUES (436, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-07 14:38:24.656000', 1);
INSERT INTO `log` VALUES (437, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-07 14:39:53.844000', 1);
INSERT INTO `log` VALUES (438, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-07 14:39:56.600000', 1);
INSERT INTO `log` VALUES (439, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-07 14:41:38.654000', 1);
INSERT INTO `log` VALUES (440, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-07 14:41:43.203000', 1);
INSERT INTO `log` VALUES (441, 'admin', '管理员', '基本资料', '添加供应商信息', 'http://localhost:8088/info/addSupplier', '127.0.0.1', '2022-01-07 14:42:11.612000', 1);
INSERT INTO `log` VALUES (442, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-07 14:42:13.326000', 1);
INSERT INTO `log` VALUES (443, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-07 14:44:14.533000', 1);
INSERT INTO `log` VALUES (444, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-07 14:44:15.531000', 1);
INSERT INTO `log` VALUES (445, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-07 14:44:16.176000', 1);
INSERT INTO `log` VALUES (446, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-07 14:44:19.292000', 1);
INSERT INTO `log` VALUES (447, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-07 14:44:24.556000', 1);
INSERT INTO `log` VALUES (448, 'admin', '管理员', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2022-01-07 14:44:49.432000', 1);
INSERT INTO `log` VALUES (449, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-07 14:44:56.868000', 1);
INSERT INTO `log` VALUES (450, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-07 14:45:00.835000', 1);
INSERT INTO `log` VALUES (451, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-07 14:45:01.650000', 1);
INSERT INTO `log` VALUES (452, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-07 14:45:04.751000', 1);
INSERT INTO `log` VALUES (453, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-07 14:45:05.299000', 1);
INSERT INTO `log` VALUES (454, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-07 14:45:05.647000', 1);
INSERT INTO `log` VALUES (455, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-07 14:45:05.965000', 1);
INSERT INTO `log` VALUES (456, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-07 14:45:06.245000', 1);
INSERT INTO `log` VALUES (457, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-07 14:45:06.672000', 1);
INSERT INTO `log` VALUES (458, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-07 14:45:07.093000', 1);
INSERT INTO `log` VALUES (459, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-07 14:45:07.419000', 1);
INSERT INTO `log` VALUES (460, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-07 14:45:07.743000', 1);
INSERT INTO `log` VALUES (461, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-07 14:45:08.035000', 1);
INSERT INTO `log` VALUES (462, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-07 14:45:08.216000', 1);
INSERT INTO `log` VALUES (463, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-07 14:45:08.370000', 1);
INSERT INTO `log` VALUES (464, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-07 14:45:08.537000', 1);
INSERT INTO `log` VALUES (465, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-07 14:45:08.877000', 1);
INSERT INTO `log` VALUES (466, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-07 14:45:09.178000', 1);
INSERT INTO `log` VALUES (467, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-07 14:45:09.465000', 1);
INSERT INTO `log` VALUES (468, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-07 14:45:09.653000', 1);
INSERT INTO `log` VALUES (469, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-07 14:45:09.901000', 1);
INSERT INTO `log` VALUES (470, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-07 14:45:10.314000', 1);
INSERT INTO `log` VALUES (471, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-07 14:45:10.767000', 1);
INSERT INTO `log` VALUES (472, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-07 14:45:11.049000', 1);
INSERT INTO `log` VALUES (473, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-07 14:45:11.232000', 1);
INSERT INTO `log` VALUES (474, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-07 14:45:11.647000', 1);
INSERT INTO `log` VALUES (475, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-07 14:45:11.951000', 1);
INSERT INTO `log` VALUES (476, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-07 14:45:12.111000', 1);
INSERT INTO `log` VALUES (477, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-07 14:45:12.390000', 1);
INSERT INTO `log` VALUES (478, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-07 14:45:12.706000', 1);
INSERT INTO `log` VALUES (479, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-07 14:45:12.863000', 1);
INSERT INTO `log` VALUES (480, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-07 14:52:34.955000', 1);
INSERT INTO `log` VALUES (481, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-07 14:52:38.745000', 1);
INSERT INTO `log` VALUES (482, 'admin', '管理员', '基本资料', '添加供应商信息', 'http://localhost:8088/info/addSupplier', '127.0.0.1', '2022-01-07 14:52:45.052000', 1);
INSERT INTO `log` VALUES (483, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-07 14:52:47.337000', 1);
INSERT INTO `log` VALUES (484, 'admin', '管理员', '基本资料', '删除供应商信息', 'http://localhost:8088/info/delSupplier', '127.0.0.1', '2022-01-07 14:52:52.923000', 1);
INSERT INTO `log` VALUES (485, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-07 14:52:57.382000', 1);
INSERT INTO `log` VALUES (486, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-07 15:02:37.640000', 1);
INSERT INTO `log` VALUES (487, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-07 15:02:41.313000', 1);
INSERT INTO `log` VALUES (488, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-07 15:12:00.708000', 1);
INSERT INTO `log` VALUES (489, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-07 15:12:03.900000', 1);
INSERT INTO `log` VALUES (490, 'admin', '管理员', '基本资料', '添加供应商信息', 'http://localhost:8088/info/addSupplier', '127.0.0.1', '2022-01-07 15:12:10.200000', 1);
INSERT INTO `log` VALUES (491, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-07 15:12:11.871000', 1);
INSERT INTO `log` VALUES (492, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-07 15:13:12.889000', 1);
INSERT INTO `log` VALUES (493, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-07 15:13:15.882000', 1);
INSERT INTO `log` VALUES (494, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-07 15:13:53.829000', 1);
INSERT INTO `log` VALUES (495, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-07 15:13:56.631000', 1);
INSERT INTO `log` VALUES (496, 'admin', '管理员', '基本资料', '修改供应商信息', 'http://localhost:8088/info/editSupplier', '127.0.0.1', '2022-01-07 15:14:01.158000', 1);
INSERT INTO `log` VALUES (497, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-07 15:14:02.829000', 1);
INSERT INTO `log` VALUES (498, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-07 15:20:27.697000', 1);
INSERT INTO `log` VALUES (499, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-07 15:20:31.190000', 1);
INSERT INTO `log` VALUES (500, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-07 15:22:59.215000', 1);
INSERT INTO `log` VALUES (501, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-07 15:23:03.861000', 1);
INSERT INTO `log` VALUES (502, 'admin', '管理员', '基本资料', '添加供应商信息', 'http://localhost:8088/info/addSupplier', '127.0.0.1', '2022-01-07 15:23:20.619000', 1);
INSERT INTO `log` VALUES (503, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-07 15:23:22.300000', 1);
INSERT INTO `log` VALUES (504, 'admin', '管理员', '基本资料', '添加供应商信息', 'http://localhost:8088/info/addSupplier', '127.0.0.1', '2022-01-07 15:23:39.492000', 1);
INSERT INTO `log` VALUES (505, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-07 15:23:41.182000', 1);
INSERT INTO `log` VALUES (506, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-07 15:37:10.910000', 1);
INSERT INTO `log` VALUES (507, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-07 15:37:14.872000', 1);
INSERT INTO `log` VALUES (508, 'admin', '管理员', '基本资料', '添加供应商信息', 'http://localhost:8088/info/addSupplier', '127.0.0.1', '2022-01-07 15:37:34.301000', 1);
INSERT INTO `log` VALUES (509, 'admin', '管理员', '基本资料', '添加供应商信息', 'http://localhost:8088/info/addSupplier', '127.0.0.1', '2022-01-07 15:37:34.444000', 1);
INSERT INTO `log` VALUES (510, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-07 15:37:36.029000', 1);
INSERT INTO `log` VALUES (511, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-07 15:37:40.244000', 1);
INSERT INTO `log` VALUES (512, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-07 15:38:22.436000', 1);
INSERT INTO `log` VALUES (513, 'admin', '管理员', '基本资料', '添加供应商信息', 'http://localhost:8088/info/addSupplier', '127.0.0.1', '2022-01-07 15:38:29.507000', 1);
INSERT INTO `log` VALUES (514, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-07 15:38:31.205000', 1);
INSERT INTO `log` VALUES (515, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-07 15:39:51.743000', 1);
INSERT INTO `log` VALUES (516, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-07 15:39:55.244000', 1);
INSERT INTO `log` VALUES (517, 'admin', '管理员', '基本资料', '添加供应商信息', 'http://localhost:8088/info/addSupplier', '127.0.0.1', '2022-01-07 15:40:02.883000', 1);
INSERT INTO `log` VALUES (518, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-07 15:40:05.339000', 1);
INSERT INTO `log` VALUES (519, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-07 15:42:39.789000', 1);
INSERT INTO `log` VALUES (520, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-07 15:42:45.649000', 1);
INSERT INTO `log` VALUES (521, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-07 15:43:27.442000', 1);
INSERT INTO `log` VALUES (522, 'admin', '管理员', '基本资料', '添加供应商信息', 'http://localhost:8088/info/addSupplier', '127.0.0.1', '2022-01-07 15:43:35.939000', 1);
INSERT INTO `log` VALUES (523, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-07 15:43:37.625000', 1);
INSERT INTO `log` VALUES (524, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-07 15:45:36.878000', 1);
INSERT INTO `log` VALUES (525, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-07 15:45:40.905000', 1);
INSERT INTO `log` VALUES (526, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-07 15:47:25.987000', 1);
INSERT INTO `log` VALUES (527, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-07 15:47:28.822000', 1);
INSERT INTO `log` VALUES (528, 'admin', '管理员', '基本资料', '修改供应商信息', 'http://localhost:8088/info/editSupplier', '127.0.0.1', '2022-01-07 15:47:34.521000', 1);
INSERT INTO `log` VALUES (529, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-07 15:47:36.199000', 1);
INSERT INTO `log` VALUES (530, 'admin', '管理员', '基本资料', '修改供应商信息', 'http://localhost:8088/info/editSupplier', '127.0.0.1', '2022-01-07 15:47:49.720000', 1);
INSERT INTO `log` VALUES (531, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-07 15:47:51.388000', 1);
INSERT INTO `log` VALUES (532, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-07 15:49:14.612000', 1);
INSERT INTO `log` VALUES (533, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-07 15:49:17.598000', 1);
INSERT INTO `log` VALUES (534, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-07 15:52:38.072000', 1);
INSERT INTO `log` VALUES (535, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-07 15:52:41.161000', 1);
INSERT INTO `log` VALUES (536, 'admin', '管理员', '基本资料', '修改供应商信息', 'http://localhost:8088/info/editSupplier', '127.0.0.1', '2022-01-07 15:52:46.173000', 1);
INSERT INTO `log` VALUES (537, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-07 15:52:48.582000', 1);
INSERT INTO `log` VALUES (538, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-07 15:53:28.854000', 1);
INSERT INTO `log` VALUES (539, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-07 15:56:17.243000', 1);
INSERT INTO `log` VALUES (540, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-07 15:56:20.109000', 1);
INSERT INTO `log` VALUES (541, 'admin', '管理员', '基本资料', '修改供应商信息', 'http://localhost:8088/info/editSupplier', '127.0.0.1', '2022-01-07 15:56:35.867000', 1);
INSERT INTO `log` VALUES (542, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-07 15:56:37.551000', 1);
INSERT INTO `log` VALUES (543, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-07 16:00:48.058000', 1);
INSERT INTO `log` VALUES (544, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-07 16:00:52.009000', 1);
INSERT INTO `log` VALUES (545, 'admin', '管理员', '基本资料', '添加供应商信息', 'http://localhost:8088/info/addSupplier', '127.0.0.1', '2022-01-07 16:01:01.219000', 1);
INSERT INTO `log` VALUES (546, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-07 16:01:02.950000', 1);
INSERT INTO `log` VALUES (547, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-07 16:07:42.786000', 1);
INSERT INTO `log` VALUES (548, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-07 16:07:45.542000', 1);
INSERT INTO `log` VALUES (549, 'admin', '管理员', '基本资料', '添加供应商信息', 'http://localhost:8088/info/addSupplier', '127.0.0.1', '2022-01-07 16:08:01.114000', 1);
INSERT INTO `log` VALUES (550, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-07 16:08:02.836000', 1);
INSERT INTO `log` VALUES (551, 'admin', '管理员', '基本资料', '修改供应商信息', 'http://localhost:8088/info/editSupplier', '127.0.0.1', '2022-01-07 16:08:23.240000', 1);
INSERT INTO `log` VALUES (552, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-07 16:08:24.948000', 1);
INSERT INTO `log` VALUES (553, 'admin', '管理员', '基本资料', '删除供应商信息', 'http://localhost:8088/info/delAllSupplier', '127.0.0.1', '2022-01-07 16:08:37.058000', 1);
INSERT INTO `log` VALUES (554, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-07 16:08:38.234000', 1);
INSERT INTO `log` VALUES (555, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-07 16:10:06.481000', 1);
INSERT INTO `log` VALUES (556, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-07 16:24:53.023000', 1);
INSERT INTO `log` VALUES (557, 'admin', '管理员', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2022-01-07 16:24:53.872000', 1);
INSERT INTO `log` VALUES (558, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-07 16:30:22.996000', 1);
INSERT INTO `log` VALUES (559, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-07 16:30:26.285000', 1);
INSERT INTO `log` VALUES (560, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-07 16:31:29.992000', 1);
INSERT INTO `log` VALUES (561, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-07 16:31:32.701000', 1);
INSERT INTO `log` VALUES (562, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-07 16:33:52.549000', 1);
INSERT INTO `log` VALUES (563, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-07 16:33:56.033000', 1);
INSERT INTO `log` VALUES (564, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-07 16:38:33.311000', 1);
INSERT INTO `log` VALUES (565, 'admin', '管理员', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2022-01-07 16:38:36.665000', 1);
INSERT INTO `log` VALUES (566, 'admin', '管理员', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2022-01-07 16:38:38.678000', 1);
INSERT INTO `log` VALUES (567, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-07 16:38:39.963000', 1);
INSERT INTO `log` VALUES (568, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-07 16:39:36.676000', 1);
INSERT INTO `log` VALUES (569, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-07 16:39:40.461000', 1);
INSERT INTO `log` VALUES (570, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-07 16:39:58.228000', 1);
INSERT INTO `log` VALUES (571, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-07 16:40:54.621000', 1);
INSERT INTO `log` VALUES (572, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-07 16:40:57.379000', 1);
INSERT INTO `log` VALUES (573, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-07 16:42:23.602000', 1);
INSERT INTO `log` VALUES (574, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-07 16:42:27.177000', 1);
INSERT INTO `log` VALUES (575, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-07 16:42:31.233000', 1);
INSERT INTO `log` VALUES (576, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-07 17:02:03.088000', 1);
INSERT INTO `log` VALUES (577, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-07 17:02:07.329000', 1);
INSERT INTO `log` VALUES (578, 'admin', '管理员', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2022-01-07 17:02:08.816000', 1);
INSERT INTO `log` VALUES (579, 'admin', '管理员', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2022-01-07 17:08:56.012000', 1);
INSERT INTO `log` VALUES (580, 'admin', '管理员', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2022-01-07 17:08:58.598000', 1);
INSERT INTO `log` VALUES (581, 'admin', '管理员', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2022-01-07 17:09:12.515000', 1);
INSERT INTO `log` VALUES (582, 'admin', '管理员', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2022-01-07 17:09:16.981000', 1);
INSERT INTO `log` VALUES (583, 'admin', '管理员', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2022-01-07 17:09:51.858000', 1);
INSERT INTO `log` VALUES (584, 'admin', '管理员', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2022-01-07 17:09:54.151000', 1);
INSERT INTO `log` VALUES (585, 'admin', '管理员', '基本资料', '删除账户信息', 'http://localhost:8088/info/delAccount', '127.0.0.1', '2022-01-07 17:09:58.024000', 1);
INSERT INTO `log` VALUES (586, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-08 15:32:35.986000', 1);
INSERT INTO `log` VALUES (587, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-08 15:45:27.849000', 1);
INSERT INTO `log` VALUES (588, 'admin', '管理员', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2022-01-08 15:45:31.763000', 1);
INSERT INTO `log` VALUES (589, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-08 15:50:47.747000', 1);
INSERT INTO `log` VALUES (590, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-08 16:11:08.114000', 1);
INSERT INTO `log` VALUES (591, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-08 16:14:27.765000', 1);
INSERT INTO `log` VALUES (592, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-08 16:14:30.335000', 1);
INSERT INTO `log` VALUES (593, 'admin', '管理员', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2022-01-08 16:14:30.985000', 1);
INSERT INTO `log` VALUES (594, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-08 16:16:49.716000', 1);
INSERT INTO `log` VALUES (595, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-08 16:16:52.981000', 1);
INSERT INTO `log` VALUES (596, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-10 09:50:31.083000', 1);
INSERT INTO `log` VALUES (597, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-10 10:01:39.241000', 1);
INSERT INTO `log` VALUES (598, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-10 10:15:12.327000', 1);
INSERT INTO `log` VALUES (599, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-10 10:20:09.119000', 1);
INSERT INTO `log` VALUES (600, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-10 12:00:31.140000', 1);
INSERT INTO `log` VALUES (601, 'admin', '管理员', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2022-01-10 12:00:36.260000', 1);
INSERT INTO `log` VALUES (602, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-10 12:02:35.567000', 1);
INSERT INTO `log` VALUES (603, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-10 12:03:41.909000', 1);
INSERT INTO `log` VALUES (604, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-10 13:11:33.179000', 1);
INSERT INTO `log` VALUES (605, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-10 13:14:17.625000', 1);
INSERT INTO `log` VALUES (606, 'admin', '管理员', '基本资料', '查询会员信息', 'http://localhost:8088/info/memberInfo', '127.0.0.1', '2022-01-10 13:14:24.234000', 1);
INSERT INTO `log` VALUES (607, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-10 13:15:22.344000', 1);
INSERT INTO `log` VALUES (608, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-10 13:25:28.839000', 1);
INSERT INTO `log` VALUES (609, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-10 13:35:55.600000', 1);
INSERT INTO `log` VALUES (610, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-10 13:40:26.769000', 1);
INSERT INTO `log` VALUES (611, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-10 14:07:16.581000', 1);
INSERT INTO `log` VALUES (612, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-10 14:09:42.022000', 1);
INSERT INTO `log` VALUES (613, 'admin', '管理员', '基本资料', '查询会员信息', 'http://localhost:8088/info/memberInfo', '127.0.0.1', '2022-01-10 14:09:42.727000', 1);
INSERT INTO `log` VALUES (614, 'admin', '管理员', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2022-01-10 14:09:43.323000', 1);
INSERT INTO `log` VALUES (615, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-10 14:14:10.831000', 1);
INSERT INTO `log` VALUES (616, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-10 14:16:03.377000', 1);
INSERT INTO `log` VALUES (617, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-10 14:19:14.991000', 1);
INSERT INTO `log` VALUES (618, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-10 14:24:01.849000', 1);
INSERT INTO `log` VALUES (619, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-10 14:27:00.669000', 1);
INSERT INTO `log` VALUES (620, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-10 14:28:18.719000', 1);
INSERT INTO `log` VALUES (621, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-10 14:30:36.318000', 1);
INSERT INTO `log` VALUES (622, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-10 14:32:18.241000', 1);
INSERT INTO `log` VALUES (623, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-10 14:35:49.955000', 1);
INSERT INTO `log` VALUES (624, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-10 14:38:10.128000', 1);
INSERT INTO `log` VALUES (625, 'admin', '管理员', '系统管理', '查询用户信息', 'http://localhost:8088/system/userInfo', '127.0.0.1', '2022-01-10 14:38:22.042000', 1);
INSERT INTO `log` VALUES (626, 'admin', '管理员', '系统管理', '查询日志信息', 'http://localhost:8088/system/log', '127.0.0.1', '2022-01-10 14:38:22.600000', 1);
INSERT INTO `log` VALUES (627, 'admin', '管理员', '系统管理', '查询系统功能', 'http://localhost:8088/system/functionInfo', '127.0.0.1', '2022-01-10 14:38:23.721000', 1);
INSERT INTO `log` VALUES (628, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-10 15:40:14.946000', 1);
INSERT INTO `log` VALUES (629, 'admin', '管理员', '系统管理', '查询用户信息', 'http://localhost:8088/system/userInfo', '127.0.0.1', '2022-01-10 15:40:39.225000', 1);
INSERT INTO `log` VALUES (630, 'admin', '管理员', '系统管理', '查询日志信息', 'http://localhost:8088/system/log', '127.0.0.1', '2022-01-10 15:40:40.231000', 1);
INSERT INTO `log` VALUES (631, 'admin', '管理员', '系统管理', '查询系统功能', 'http://localhost:8088/system/functionInfo', '127.0.0.1', '2022-01-10 15:40:41.456000', 1);
INSERT INTO `log` VALUES (632, 'admin', '管理员', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2022-01-10 15:40:46.754000', 1);
INSERT INTO `log` VALUES (633, 'admin', '管理员', '基本资料', '查询会员信息', 'http://localhost:8088/info/memberInfo', '127.0.0.1', '2022-01-10 15:40:47.865000', 1);
INSERT INTO `log` VALUES (634, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-10 15:40:49.096000', 1);
INSERT INTO `log` VALUES (635, 'admin', '管理员', '系统管理', '禁用功能', 'http://localhost:8088/system/banFunctionById', '127.0.0.1', '2022-01-10 16:07:27.579000', 1);
INSERT INTO `log` VALUES (636, 'admin', '管理员', '系统管理', '查询系统功能', 'http://localhost:8088/system/functionInfo', '127.0.0.1', '2022-01-10 16:07:29.280000', 1);
INSERT INTO `log` VALUES (637, 'admin', '管理员', '系统管理', '查询系统功能', 'http://localhost:8088/system/functionInfo', '127.0.0.1', '2022-01-10 16:07:35.708000', 1);
INSERT INTO `log` VALUES (638, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-10 16:23:02.275000', 1);
INSERT INTO `log` VALUES (639, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-10 16:26:41.516000', 1);
INSERT INTO `log` VALUES (640, 'admin', '管理员', '系统管理', '查询系统功能', 'http://localhost:8088/system/functionInfo', '127.0.0.1', '2022-01-10 16:26:46.902000', 1);
INSERT INTO `log` VALUES (641, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-10 16:27:26.088000', 1);
INSERT INTO `log` VALUES (642, 'admin', '管理员', '系统管理', '查询系统功能', 'http://localhost:8088/system/functionInfo', '127.0.0.1', '2022-01-10 16:27:31.159000', 1);
INSERT INTO `log` VALUES (643, 'admin', '管理员', '系统管理', '查询系统功能', 'http://localhost:8088/system/functionInfo', '127.0.0.1', '2022-01-10 16:27:51.242000', 1);
INSERT INTO `log` VALUES (644, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-10 16:30:54.748000', 1);
INSERT INTO `log` VALUES (645, 'admin', '管理员', '系统管理', '查询系统功能', 'http://localhost:8088/system/functionInfo', '127.0.0.1', '2022-01-10 16:30:58.923000', 1);
INSERT INTO `log` VALUES (646, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-10 16:32:52.099000', 1);
INSERT INTO `log` VALUES (647, 'admin', '管理员', '系统管理', '查询系统功能', 'http://localhost:8088/system/functionInfo', '127.0.0.1', '2022-01-10 16:33:01.364000', 1);
INSERT INTO `log` VALUES (648, 'admin', '管理员', '系统管理', '查询系统功能', 'http://localhost:8088/system/functionInfo', '127.0.0.1', '2022-01-10 16:48:17.085000', 1);
INSERT INTO `log` VALUES (649, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-10 16:50:49.280000', 1);
INSERT INTO `log` VALUES (650, 'admin', '管理员', '系统管理', '查询系统功能', 'http://localhost:8088/system/functionInfo', '127.0.0.1', '2022-01-10 16:50:52.854000', 1);
INSERT INTO `log` VALUES (651, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-10 16:58:39.647000', 1);
INSERT INTO `log` VALUES (652, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-10 17:00:15.090000', 1);
INSERT INTO `log` VALUES (653, 'admin', '管理员', '系统管理', '查询系统功能', 'http://localhost:8088/system/functionInfo', '127.0.0.1', '2022-01-10 17:00:19.932000', 1);
INSERT INTO `log` VALUES (654, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-10 17:01:45.244000', 1);
INSERT INTO `log` VALUES (655, 'admin', '管理员', '系统管理', '查询系统功能', 'http://localhost:8088/system/functionInfo', '127.0.0.1', '2022-01-10 17:01:49.126000', 1);
INSERT INTO `log` VALUES (656, 'admin', '管理员', '系统管理', '查询系统功能', 'http://localhost:8088/system/functionInfo', '127.0.0.1', '2022-01-10 17:01:56.461000', 1);
INSERT INTO `log` VALUES (657, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-10 17:49:03.035000', 1);
INSERT INTO `log` VALUES (658, 'admin', '管理员', '系统管理', '查询系统功能', 'http://localhost:8088/system/functionInfo', '127.0.0.1', '2022-01-10 17:49:09.288000', 1);
INSERT INTO `log` VALUES (659, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-10 17:50:52.264000', 1);
INSERT INTO `log` VALUES (660, 'admin', '管理员', '系统管理', '查询系统功能', 'http://localhost:8088/system/functionInfo', '127.0.0.1', '2022-01-10 17:50:56.033000', 1);
INSERT INTO `log` VALUES (661, 'admin', '管理员', '系统管理', '查询系统功能', 'http://localhost:8088/system/functionInfo', '127.0.0.1', '2022-01-10 17:51:02.609000', 1);
INSERT INTO `log` VALUES (662, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-10 17:54:35.000000', 1);
INSERT INTO `log` VALUES (663, 'admin', '管理员', '系统管理', '查询系统功能', 'http://localhost:8088/system/functionInfo', '127.0.0.1', '2022-01-10 17:54:41.736000', 1);
INSERT INTO `log` VALUES (664, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-10 18:01:43.745000', 1);
INSERT INTO `log` VALUES (665, 'admin', '管理员', '系统管理', '查询系统功能', 'http://localhost:8088/system/functionInfo', '127.0.0.1', '2022-01-10 18:01:53.237000', 1);
INSERT INTO `log` VALUES (666, 'admin', '管理员', '系统管理', '查询系统功能', 'http://localhost:8088/system/functionInfo', '127.0.0.1', '2022-01-10 18:05:16.943000', 1);
INSERT INTO `log` VALUES (667, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-10 18:38:36.633000', 1);
INSERT INTO `log` VALUES (668, 'admin', '管理员', '系统管理', '查询系统功能', 'http://localhost:8088/system/functionInfo', '127.0.0.1', '2022-01-10 18:39:39.495000', 1);
INSERT INTO `log` VALUES (669, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-10 18:41:03.483000', 1);
INSERT INTO `log` VALUES (670, 'admin', '管理员', '系统管理', '查询系统功能', 'http://localhost:8088/system/functionInfo', '127.0.0.1', '2022-01-10 18:41:07.681000', 1);
INSERT INTO `log` VALUES (671, 'admin', '管理员', '系统管理', '启用功能', 'http://localhost:8088/system/openFunctionById', '127.0.0.1', '2022-01-10 18:41:21.842000', 1);
INSERT INTO `log` VALUES (672, 'admin', '管理员', '系统管理', '查询系统功能', 'http://localhost:8088/system/functionInfo', '127.0.0.1', '2022-01-10 18:41:23.555000', 1);
INSERT INTO `log` VALUES (673, 'admin', '管理员', '系统管理', '禁用功能', 'http://localhost:8088/system/banFunctionById', '127.0.0.1', '2022-01-10 18:41:23.973000', 1);
INSERT INTO `log` VALUES (674, 'admin', '管理员', '系统管理', '查询系统功能', 'http://localhost:8088/system/functionInfo', '127.0.0.1', '2022-01-10 18:41:25.701000', 1);
INSERT INTO `log` VALUES (675, 'admin', '管理员', '系统管理', '启用功能', 'http://localhost:8088/system/openFunctionById', '127.0.0.1', '2022-01-10 18:41:26.847000', 1);
INSERT INTO `log` VALUES (676, 'admin', '管理员', '系统管理', '查询系统功能', 'http://localhost:8088/system/functionInfo', '127.0.0.1', '2022-01-10 18:41:28.577000', 1);
INSERT INTO `log` VALUES (677, 'admin', '管理员', '系统管理', '禁用功能', 'http://localhost:8088/system/banFunctionById', '127.0.0.1', '2022-01-10 18:41:31.670000', 1);
INSERT INTO `log` VALUES (678, 'admin', '管理员', '系统管理', '查询系统功能', 'http://localhost:8088/system/functionInfo', '127.0.0.1', '2022-01-10 18:41:33.392000', 1);
INSERT INTO `log` VALUES (679, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-11 09:53:31.990000', 1);
INSERT INTO `log` VALUES (680, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-11 10:19:22.488000', 1);
INSERT INTO `log` VALUES (681, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-11 10:19:25.847000', 1);
INSERT INTO `log` VALUES (682, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-11 10:34:55.433000', 1);
INSERT INTO `log` VALUES (683, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-11 10:54:46.572000', 1);
INSERT INTO `log` VALUES (684, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-11 11:00:10.101000', 1);
INSERT INTO `log` VALUES (685, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-11 11:22:03.520000', 1);
INSERT INTO `log` VALUES (686, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-11 11:27:37.908000', 1);
INSERT INTO `log` VALUES (687, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-11 11:31:35.006000', 1);
INSERT INTO `log` VALUES (688, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-11 11:36:05.329000', 1);
INSERT INTO `log` VALUES (689, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-11 11:40:07.577000', 1);
INSERT INTO `log` VALUES (690, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-11 11:52:28.106000', 1);
INSERT INTO `log` VALUES (691, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-11 12:18:45.343000', 1);
INSERT INTO `log` VALUES (692, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-11 13:10:56.665000', 1);
INSERT INTO `log` VALUES (693, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-11 13:12:26.731000', 1);
INSERT INTO `log` VALUES (694, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-11 13:13:26.199000', 1);
INSERT INTO `log` VALUES (695, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-11 13:16:19.823000', 1);
INSERT INTO `log` VALUES (696, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-11 13:16:23.327000', 1);
INSERT INTO `log` VALUES (697, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-11 13:19:43.554000', 1);
INSERT INTO `log` VALUES (698, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-11 13:27:42.873000', 1);
INSERT INTO `log` VALUES (699, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-11 13:35:22.739000', 1);
INSERT INTO `log` VALUES (700, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-11 13:37:15.646000', 1);
INSERT INTO `log` VALUES (701, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-11 13:39:05.434000', 1);
INSERT INTO `log` VALUES (702, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-11 13:49:22.723000', 1);
INSERT INTO `log` VALUES (703, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-11 14:00:38.070000', 1);
INSERT INTO `log` VALUES (704, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-11 14:04:50.540000', 1);
INSERT INTO `log` VALUES (705, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-11 14:10:56.916000', 1);
INSERT INTO `log` VALUES (706, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-11 14:14:24.089000', 1);
INSERT INTO `log` VALUES (707, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-11 14:16:26.620000', 1);
INSERT INTO `log` VALUES (708, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-11 14:23:41.277000', 1);
INSERT INTO `log` VALUES (709, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-11 14:26:45.367000', 1);
INSERT INTO `log` VALUES (710, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-11 14:31:51.946000', 1);
INSERT INTO `log` VALUES (711, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-11 14:32:48.827000', 1);
INSERT INTO `log` VALUES (712, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-11 14:38:45.054000', 1);
INSERT INTO `log` VALUES (713, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-11 14:40:41.824000', 1);
INSERT INTO `log` VALUES (714, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-11 14:45:53.904000', 1);
INSERT INTO `log` VALUES (715, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-11 14:47:29.640000', 1);
INSERT INTO `log` VALUES (716, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-11 16:12:09.553000', 1);
INSERT INTO `log` VALUES (717, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-11 16:13:53.616000', 1);
INSERT INTO `log` VALUES (718, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-12 14:39:08.395000', 1);
INSERT INTO `log` VALUES (719, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-12 15:03:31.436000', 1);
INSERT INTO `log` VALUES (720, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-12 15:27:16.394000', 1);
INSERT INTO `log` VALUES (721, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-12 15:29:54.261000', 1);
INSERT INTO `log` VALUES (722, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-12 18:08:51.114000', 1);
INSERT INTO `log` VALUES (723, 'admin', '管理员', '基本资料', '查询会员信息', 'http://localhost:8088/info/memberInfo', '127.0.0.1', '2022-01-12 18:11:39.159000', 1);
INSERT INTO `log` VALUES (724, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-12 18:11:39.780000', 1);
INSERT INTO `log` VALUES (725, 'admin', '管理员', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2022-01-12 18:11:40.294000', 1);
INSERT INTO `log` VALUES (726, 'admin', '管理员', '基本资料', '查询仓库信息', 'http://localhost:8088/info/storeInfo', '127.0.0.1', '2022-01-12 18:11:40.904000', 1);
INSERT INTO `log` VALUES (727, 'admin', '管理员', '系统管理', '查询用户信息', 'http://localhost:8088/system/userInfo', '127.0.0.1', '2022-01-12 18:11:43.665000', 1);
INSERT INTO `log` VALUES (728, 'admin', '管理员', '系统管理', '查询日志信息', 'http://localhost:8088/system/log', '127.0.0.1', '2022-01-12 18:11:44.002000', 1);
INSERT INTO `log` VALUES (729, 'admin', '管理员', '系统管理', '查询系统功能', 'http://localhost:8088/system/functionInfo', '127.0.0.1', '2022-01-12 18:11:44.771000', 1);
INSERT INTO `log` VALUES (730, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-13 12:25:14.702000', 1);
INSERT INTO `log` VALUES (731, 'admin', '管理员', '系统管理', '查询用户信息', 'http://localhost:8088/system/userInfo', '127.0.0.1', '2022-01-13 12:25:22.678000', 1);
INSERT INTO `log` VALUES (732, 'admin', '管理员', '系统管理', '查询用户信息', 'http://localhost:8088/system/userInfo', '127.0.0.1', '2022-01-13 12:25:45.138000', 1);
INSERT INTO `log` VALUES (733, 'admin', '管理员', '基本资料', '查询会员信息', 'http://localhost:8088/info/memberInfo', '127.0.0.1', '2022-01-13 12:26:07.290000', 1);
INSERT INTO `log` VALUES (734, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-13 12:26:07.884000', 1);
INSERT INTO `log` VALUES (735, 'admin', '管理员', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2022-01-13 12:26:08.284000', 1);
INSERT INTO `log` VALUES (736, 'admin', '管理员', '基本资料', '查询仓库信息', 'http://localhost:8088/info/storeInfo', '127.0.0.1', '2022-01-13 12:26:10.708000', 1);
INSERT INTO `log` VALUES (737, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-13 14:10:49.635000', 1);
INSERT INTO `log` VALUES (738, 'admin', '管理员', '商品管理', '查询商品类别信息', 'http://localhost:8088/commodity/categoryInfo', '127.0.0.1', '2022-01-13 14:10:53.373000', 1);
INSERT INTO `log` VALUES (739, 'admin', '管理员', '计量单位', '查询计量单位信息', 'http://localhost:8088/commodity/measureInfo', '127.0.0.1', '2022-01-13 14:17:43.746000', 1);
INSERT INTO `log` VALUES (740, 'admin', '管理员', '商品类别', '删除商品类别信息', 'http://localhost:8088/commodity/delCategoryById', '127.0.0.1', '2022-01-13 14:21:02.326000', 1);
INSERT INTO `log` VALUES (741, 'admin', '管理员', '商品管理', '查询商品类别信息', 'http://localhost:8088/commodity/categoryInfo', '127.0.0.1', '2022-01-13 14:21:04.022000', 1);
INSERT INTO `log` VALUES (742, 'admin', '管理员', '商品类别', '删除商品类别信息', 'http://localhost:8088/commodity/delCategoryById', '127.0.0.1', '2022-01-13 14:21:04.683000', 1);
INSERT INTO `log` VALUES (743, 'admin', '管理员', '商品管理', '查询商品类别信息', 'http://localhost:8088/commodity/categoryInfo', '127.0.0.1', '2022-01-13 14:21:06.433000', 1);
INSERT INTO `log` VALUES (744, 'admin', '管理员', '商品类别', '添加商品类别信息', 'http://localhost:8088/commodity/addCategory', '127.0.0.1', '2022-01-13 14:21:29.370000', 1);
INSERT INTO `log` VALUES (745, 'admin', '管理员', '商品管理', '查询商品类别信息', 'http://localhost:8088/commodity/categoryInfo', '127.0.0.1', '2022-02-21 16:29:05.988533', 0);
INSERT INTO `log` VALUES (746, 'admin', '管理员', '商品类别', '添加商品类别信息', 'http://localhost:8088/commodity/addCategory', '127.0.0.1', '2022-02-21 16:29:05.984015', 0);
INSERT INTO `log` VALUES (747, 'admin', '管理员', '商品管理', '查询商品类别信息', 'http://localhost:8088/commodity/categoryInfo', '127.0.0.1', '2022-02-21 16:29:05.981174', 0);
INSERT INTO `log` VALUES (748, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-13 15:23:44.953000', 1);
INSERT INTO `log` VALUES (749, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-13 16:44:31.813000', 1);
INSERT INTO `log` VALUES (750, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-13 16:47:38.922000', 1);
INSERT INTO `log` VALUES (751, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-13 17:02:35.863000', 1);
INSERT INTO `log` VALUES (752, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-13 17:56:39.081000', 1);
INSERT INTO `log` VALUES (753, 'admin', '管理员', '商品管理', '查询商品类别信息', 'http://localhost:8088/commodity/categoryInfo', '127.0.0.1', '2022-02-21 16:29:05.977660', 0);
INSERT INTO `log` VALUES (754, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-13 17:56:44.864000', 1);
INSERT INTO `log` VALUES (755, 'admin', '管理员', '计量单位', '查询计量单位信息', 'http://localhost:8088/commodity/measureInfo', '127.0.0.1', '2022-01-13 17:59:35.410000', 1);
INSERT INTO `log` VALUES (756, 'admin', '管理员', '基本资料', '查询会员信息', 'http://localhost:8088/info/memberInfo', '127.0.0.1', '2022-01-13 17:59:40.554000', 1);
INSERT INTO `log` VALUES (757, 'admin', '管理员', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2022-01-13 17:59:42.302000', 1);
INSERT INTO `log` VALUES (758, 'admin', '管理员', '基本资料', '查询仓库信息', 'http://localhost:8088/info/storeInfo', '127.0.0.1', '2022-01-13 17:59:45.166000', 1);
INSERT INTO `log` VALUES (759, 'admin', '管理员', '系统管理', '查询用户信息', 'http://localhost:8088/system/userInfo', '127.0.0.1', '2022-01-13 18:00:09.142000', 1);
INSERT INTO `log` VALUES (760, 'admin', '管理员', '系统管理', '查询日志信息', 'http://localhost:8088/system/log', '127.0.0.1', '2022-01-13 18:00:10.476000', 1);
INSERT INTO `log` VALUES (761, 'admin', '管理员', '系统管理', '查询系统功能', 'http://localhost:8088/system/functionInfo', '127.0.0.1', '2022-01-13 18:00:12.244000', 1);
INSERT INTO `log` VALUES (762, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-13 18:11:06.654000', 1);
INSERT INTO `log` VALUES (763, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-13 18:12:58.676000', 1);
INSERT INTO `log` VALUES (764, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-13 18:14:06.289000', 1);
INSERT INTO `log` VALUES (765, 'admin', '管理员', '计量单位', '查询计量单位信息', 'http://localhost:8088/commodity/measureInfo', '127.0.0.1', '2022-01-13 18:17:23.619000', 1);
INSERT INTO `log` VALUES (766, 'admin', '管理员', '商品管理', '查询商品类别信息', 'http://localhost:8088/commodity/categoryInfo', '127.0.0.1', '2022-02-21 16:29:05.974621', 0);
INSERT INTO `log` VALUES (767, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-13 18:33:03.199000', 1);
INSERT INTO `log` VALUES (768, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-13 18:34:08.362000', 1);
INSERT INTO `log` VALUES (769, 'admin', '管理员', '计量单位', '查询计量单位信息', 'http://localhost:8088/commodity/measureInfo', '127.0.0.1', '2022-01-13 18:34:32.703000', 1);
INSERT INTO `log` VALUES (770, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-13 18:34:34.034000', 1);
INSERT INTO `log` VALUES (771, 'admin', '管理员', '基本资料', '查询会员信息', 'http://localhost:8088/info/memberInfo', '127.0.0.1', '2022-01-13 18:34:34.978000', 1);
INSERT INTO `log` VALUES (772, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-01-13 18:35:47.132000', 1);
INSERT INTO `log` VALUES (773, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-13 18:35:51.675000', 1);
INSERT INTO `log` VALUES (774, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-13 18:35:52.644000', 1);
INSERT INTO `log` VALUES (775, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-13 18:35:59.051000', 1);
INSERT INTO `log` VALUES (776, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-13 18:35:59.195000', 1);
INSERT INTO `log` VALUES (777, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-01-13 18:35:59.332000', 1);
INSERT INTO `log` VALUES (778, 'admin', '管理员', '基本资料', '查询会员信息', 'http://localhost:8088/info/memberInfo', '127.0.0.1', '2022-01-13 18:49:40.753000', 1);
INSERT INTO `log` VALUES (779, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-10 10:29:56.273000', 1);
INSERT INTO `log` VALUES (780, 'admin', '管理员', '商品管理', '查询商品类别信息', 'http://localhost:8088/commodity/categoryInfo', '127.0.0.1', '2022-02-21 16:29:05.970228', 0);
INSERT INTO `log` VALUES (781, 'admin', '管理员', '计量单位', '查询计量单位信息', 'http://localhost:8088/commodity/measureInfo', '127.0.0.1', '2022-02-10 10:30:12.612000', 1);
INSERT INTO `log` VALUES (782, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-19 10:09:29.147000', 1);
INSERT INTO `log` VALUES (783, 'admin', '管理员', '商品管理', '查询商品类别信息', 'http://localhost:8088/commodity/categoryInfo', '127.0.0.1', '2022-02-21 16:29:05.965739', 0);
INSERT INTO `log` VALUES (784, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-19 11:40:01.438000', 1);
INSERT INTO `log` VALUES (785, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-19 14:15:53.498000', 1);
INSERT INTO `log` VALUES (786, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-19 14:19:46.461000', 1);
INSERT INTO `log` VALUES (787, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-19 14:21:43.391000', 1);
INSERT INTO `log` VALUES (788, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-19 14:23:46.919000', 1);
INSERT INTO `log` VALUES (789, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-19 14:25:59.551000', 1);
INSERT INTO `log` VALUES (790, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-02-19 14:26:02.898000', 1);
INSERT INTO `log` VALUES (791, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-02-19 14:26:05.461000', 1);
INSERT INTO `log` VALUES (792, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-02-19 14:26:08.967000', 1);
INSERT INTO `log` VALUES (793, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-02-19 14:26:09.405000', 1);
INSERT INTO `log` VALUES (794, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-02-19 14:26:09.732000', 1);
INSERT INTO `log` VALUES (795, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-02-19 14:26:09.886000', 1);
INSERT INTO `log` VALUES (796, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-02-19 14:26:10.026000', 1);
INSERT INTO `log` VALUES (797, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-02-19 14:26:10.257000', 1);
INSERT INTO `log` VALUES (798, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-02-19 14:26:10.390000', 1);
INSERT INTO `log` VALUES (799, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-02-19 14:26:10.524000', 1);
INSERT INTO `log` VALUES (800, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-02-19 14:26:10.673000', 1);
INSERT INTO `log` VALUES (801, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-02-19 14:26:10.808000', 1);
INSERT INTO `log` VALUES (802, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-02-19 14:26:10.949000', 1);
INSERT INTO `log` VALUES (803, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-02-19 14:26:11.096000', 1);
INSERT INTO `log` VALUES (804, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-02-19 14:26:11.237000', 1);
INSERT INTO `log` VALUES (805, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-02-19 14:26:11.368000', 1);
INSERT INTO `log` VALUES (806, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-02-19 14:26:11.518000', 1);
INSERT INTO `log` VALUES (807, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-02-19 14:26:11.656000', 1);
INSERT INTO `log` VALUES (808, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-02-19 14:26:11.802000', 1);
INSERT INTO `log` VALUES (809, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-02-19 14:26:11.943000', 1);
INSERT INTO `log` VALUES (810, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-02-19 14:26:12.085000', 1);
INSERT INTO `log` VALUES (811, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-02-19 14:26:12.226000', 1);
INSERT INTO `log` VALUES (812, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-02-19 14:26:12.363000', 1);
INSERT INTO `log` VALUES (813, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-02-19 14:26:12.516000', 1);
INSERT INTO `log` VALUES (814, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-02-19 14:26:12.656000', 1);
INSERT INTO `log` VALUES (815, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-02-19 14:26:12.794000', 1);
INSERT INTO `log` VALUES (816, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-02-19 14:26:12.946000', 1);
INSERT INTO `log` VALUES (817, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-02-19 14:26:13.087000', 1);
INSERT INTO `log` VALUES (818, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-02-19 14:26:13.233000', 1);
INSERT INTO `log` VALUES (819, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-02-19 14:26:13.387000', 1);
INSERT INTO `log` VALUES (820, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-02-19 14:26:13.533000', 1);
INSERT INTO `log` VALUES (821, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-02-19 14:26:13.671000', 1);
INSERT INTO `log` VALUES (822, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-02-19 14:26:13.824000', 1);
INSERT INTO `log` VALUES (823, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-02-19 14:26:13.968000', 1);
INSERT INTO `log` VALUES (824, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-02-19 14:26:14.110000', 1);
INSERT INTO `log` VALUES (825, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-02-19 14:26:14.263000', 1);
INSERT INTO `log` VALUES (826, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-02-19 14:26:14.409000', 1);
INSERT INTO `log` VALUES (827, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-02-19 14:26:14.557000', 1);
INSERT INTO `log` VALUES (828, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-02-19 14:26:14.695000', 1);
INSERT INTO `log` VALUES (829, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-02-19 14:26:14.798000', 1);
INSERT INTO `log` VALUES (830, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-02-19 14:26:20.205000', 1);
INSERT INTO `log` VALUES (831, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-02-19 14:26:24.444000', 1);
INSERT INTO `log` VALUES (832, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-19 14:28:50.275000', 1);
INSERT INTO `log` VALUES (833, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-19 14:32:53.732000', 1);
INSERT INTO `log` VALUES (834, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-02-19 14:32:57.217000', 1);
INSERT INTO `log` VALUES (835, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-19 18:46:18.688000', 1);
INSERT INTO `log` VALUES (836, 'admin', '管理员', '商品管理', '查询商品类别信息', 'http://localhost:8088/commodity/categoryInfo', '127.0.0.1', '2022-02-21 16:29:05.961852', 0);
INSERT INTO `log` VALUES (837, 'admin', '管理员', '计量单位', '查询计量单位信息', 'http://localhost:8088/commodity/measureInfo', '127.0.0.1', '2022-02-19 18:46:34.343000', 1);
INSERT INTO `log` VALUES (838, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-19 18:50:22.640000', 1);
INSERT INTO `log` VALUES (839, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-19 18:51:56.414000', 1);
INSERT INTO `log` VALUES (840, 'admin', '管理员', '计量单位', '查询计量单位信息', 'http://localhost:8088/commodity/measureInfo', '127.0.0.1', '2022-02-19 19:00:52.226000', 1);
INSERT INTO `log` VALUES (841, 'admin', '管理员', '商品管理', '查询商品类别信息', 'http://localhost:8088/commodity/categoryInfo', '127.0.0.1', '2022-02-21 16:29:05.959537', 0);
INSERT INTO `log` VALUES (842, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-20 11:25:48.166000', 1);
INSERT INTO `log` VALUES (843, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-20 11:38:49.051000', 1);
INSERT INTO `log` VALUES (844, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-20 11:51:53.350000', 1);
INSERT INTO `log` VALUES (845, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-20 12:33:55.156000', 1);
INSERT INTO `log` VALUES (846, 'admin', '管理员', '计量单位', '查询计量单位信息', 'http://localhost:8088/commodity/measureInfo', '127.0.0.1', '2022-02-20 12:33:58.791000', 1);
INSERT INTO `log` VALUES (847, 'admin', '管理员', '商品管理', '查询商品类别信息', 'http://localhost:8088/commodity/categoryInfo', '127.0.0.1', '2022-02-21 16:29:05.955078', 0);
INSERT INTO `log` VALUES (848, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-02-21 16:29:22.963173', 0);
INSERT INTO `log` VALUES (849, 'admin', '管理员', '基本资料', '查询会员信息', 'http://localhost:8088/info/memberInfo', '127.0.0.1', '2022-02-21 16:29:22.960120', 0);
INSERT INTO `log` VALUES (850, 'admin', '管理员', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2022-02-21 16:29:22.957221', 0);
INSERT INTO `log` VALUES (851, 'admin', '管理员', '基本资料', '查询仓库信息', 'http://localhost:8088/info/storeInfo', '127.0.0.1', '2022-02-21 16:29:22.955688', 0);
INSERT INTO `log` VALUES (852, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-21 16:29:22.952190', 0);
INSERT INTO `log` VALUES (853, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-21 16:29:22.949497', 0);
INSERT INTO `log` VALUES (854, 'admin', '管理员', '商品管理', '查询商品类别信息', 'http://localhost:8088/commodity/categoryInfo', '127.0.0.1', '2022-02-21 16:29:05.953084', 0);
INSERT INTO `log` VALUES (855, 'admin', '管理员', '计量单位', '查询计量单位信息', 'http://localhost:8088/commodity/measureInfo', '127.0.0.1', '2022-02-21 16:29:22.945383', 0);
INSERT INTO `log` VALUES (856, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-21 16:29:22.942642', 0);
INSERT INTO `log` VALUES (857, 'admin', '管理员', '计量单位', '查询计量单位信息', 'http://localhost:8088/commodity/measureInfo', '127.0.0.1', '2022-02-21 16:29:22.939094', 0);
INSERT INTO `log` VALUES (858, 'admin', '管理员', '计量单位', '查询计量单位信息', 'http://localhost:8088/commodity/measureInfo', '127.0.0.1', '2022-02-21 16:29:22.936007', 0);
INSERT INTO `log` VALUES (859, 'admin', '管理员', '计量单位', '查询计量单位信息', 'http://localhost:8088/commodity/measureInfo', '127.0.0.1', '2022-02-21 16:29:22.932937', 0);
INSERT INTO `log` VALUES (860, 'admin', '管理员', '计量单位', '查询计量单位信息', 'http://localhost:8088/commodity/measureInfo', '127.0.0.1', '2022-02-21 16:29:22.930554', 0);
INSERT INTO `log` VALUES (861, 'admin', '管理员', '计量单位', '查询计量单位信息', 'http://localhost:8088/commodity/measureInfo', '127.0.0.1', '2022-02-21 16:29:22.927102', 0);
INSERT INTO `log` VALUES (862, 'admin', '管理员', '计量单位', '查询计量单位信息', 'http://localhost:8088/commodity/measureInfo', '127.0.0.1', '2022-02-21 16:29:22.923836', 0);
INSERT INTO `log` VALUES (863, 'admin', '管理员', '计量单位', '查询计量单位信息', 'http://localhost:8088/commodity/measureInfo', '127.0.0.1', '2022-02-21 16:29:18.540154', 0);
INSERT INTO `log` VALUES (864, 'admin', '管理员', '计量单位', '查询计量单位信息', 'http://localhost:8088/commodity/measureInfo', '127.0.0.1', '2022-02-21 16:29:18.534934', 0);
INSERT INTO `log` VALUES (865, 'admin', '管理员', '商品管理', '查询商品类别信息', 'http://localhost:8088/commodity/categoryInfo', '127.0.0.1', '2022-02-21 16:29:05.947307', 0);
INSERT INTO `log` VALUES (866, 'admin', '管理员', '计量单位', '查询计量单位信息', 'http://localhost:8088/commodity/measureInfo', '127.0.0.1', '2022-02-21 16:29:18.532347', 0);
INSERT INTO `log` VALUES (867, 'admin', '管理员', '计量单位', '查询计量单位信息', 'http://localhost:8088/commodity/measureInfo', '127.0.0.1', '2022-02-21 16:29:18.529423', 0);
INSERT INTO `log` VALUES (868, 'admin', '管理员', '计量单位', '查询计量单位信息', 'http://localhost:8088/commodity/measureInfo', '127.0.0.1', '2022-02-21 16:29:18.526446', 0);
INSERT INTO `log` VALUES (869, 'admin', '管理员', '计量单位', '查询计量单位信息', 'http://localhost:8088/commodity/measureInfo', '127.0.0.1', '2022-02-21 16:29:18.522460', 0);
INSERT INTO `log` VALUES (870, 'admin', '管理员', '计量单位', '查询计量单位信息', 'http://localhost:8088/commodity/measureInfo', '127.0.0.1', '2022-02-21 16:29:18.520043', 0);
INSERT INTO `log` VALUES (871, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-21 16:29:18.517270', 0);
INSERT INTO `log` VALUES (872, 'admin', '管理员', '计量单位', '查询计量单位信息', 'http://localhost:8088/commodity/measureInfo', '127.0.0.1', '2022-02-21 16:29:18.515450', 0);
INSERT INTO `log` VALUES (873, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-21 16:29:18.512507', 0);
INSERT INTO `log` VALUES (874, 'admin', '管理员', '计量单位', '查询计量单位信息', 'http://localhost:8088/commodity/measureInfo', '127.0.0.1', '2022-02-21 16:29:18.510896', 0);
INSERT INTO `log` VALUES (875, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-21 16:29:18.508251', 0);
INSERT INTO `log` VALUES (876, 'admin', '管理员', '计量单位', '查询计量单位信息', 'http://localhost:8088/commodity/measureInfo', '127.0.0.1', '2022-02-21 16:29:18.505693', 0);
INSERT INTO `log` VALUES (877, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-21 16:29:18.502920', 0);
INSERT INTO `log` VALUES (878, 'admin', '管理员', '计量单位', '查询计量单位信息', 'http://localhost:8088/commodity/measureInfo', '127.0.0.1', '2022-02-21 16:29:18.499305', 0);
INSERT INTO `log` VALUES (879, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-21 16:29:18.497693', 0);
INSERT INTO `log` VALUES (880, 'admin', '管理员', '计量单位', '查询计量单位信息', 'http://localhost:8088/commodity/measureInfo', '127.0.0.1', '2022-02-21 16:29:18.495108', 0);
INSERT INTO `log` VALUES (881, 'admin', '管理员', '计量单位', '查询计量单位信息', 'http://localhost:8088/commodity/measureInfo', '127.0.0.1', '2022-02-21 16:29:18.493290', 0);
INSERT INTO `log` VALUES (882, 'admin', '管理员', '计量单位', '查询计量单位信息', 'http://localhost:8088/commodity/measureInfo', '127.0.0.1', '2022-02-21 16:29:18.489776', 0);
INSERT INTO `log` VALUES (883, 'admin', '管理员', '计量单位', '查询计量单位信息', 'http://localhost:8088/commodity/measureInfo', '127.0.0.1', '2022-02-21 16:29:18.488048', 0);
INSERT INTO `log` VALUES (884, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-21 16:29:18.484660', 0);
INSERT INTO `log` VALUES (885, 'admin', '管理员', '计量单位', '查询计量单位信息', 'http://localhost:8088/commodity/measureInfo', '127.0.0.1', '2022-02-21 16:29:18.482967', 0);
INSERT INTO `log` VALUES (886, 'admin', '管理员', '计量单位', '查询计量单位信息', 'http://localhost:8088/commodity/measureInfo', '127.0.0.1', '2022-02-21 16:29:18.480177', 0);
INSERT INTO `log` VALUES (887, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-21 16:29:18.477725', 0);
INSERT INTO `log` VALUES (888, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-02-21 16:29:18.475102', 0);
INSERT INTO `log` VALUES (889, 'admin', '管理员', '基本资料', '查询会员信息', 'http://localhost:8088/info/memberInfo', '127.0.0.1', '2022-02-21 16:29:18.473159', 0);
INSERT INTO `log` VALUES (890, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-21 16:29:18.468658', 0);
INSERT INTO `log` VALUES (891, 'admin', '管理员', '计量单位', '查询计量单位信息', 'http://localhost:8088/commodity/measureInfo', '127.0.0.1', '2022-02-21 16:29:18.466832', 0);
INSERT INTO `log` VALUES (892, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-21 16:29:18.463664', 0);
INSERT INTO `log` VALUES (893, 'admin', '管理员', '计量单位', '查询计量单位信息', 'http://localhost:8088/commodity/measureInfo', '127.0.0.1', '2022-02-21 16:29:18.461763', 0);
INSERT INTO `log` VALUES (894, 'admin', '管理员', '商品管理', '查询商品类别信息', 'http://localhost:8088/commodity/categoryInfo', '127.0.0.1', '2022-02-21 16:29:05.940967', 0);
INSERT INTO `log` VALUES (895, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-21 16:29:18.457622', 0);
INSERT INTO `log` VALUES (896, 'admin', '管理员', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2022-02-21 16:29:18.454738', 0);
INSERT INTO `log` VALUES (897, 'admin', '管理员', '基本资料', '查询会员信息', 'http://localhost:8088/info/memberInfo', '127.0.0.1', '2022-02-21 16:29:18.453154', 0);
INSERT INTO `log` VALUES (898, 'admin', '管理员', '基本资料', '查询仓库信息', 'http://localhost:8088/info/storeInfo', '127.0.0.1', '2022-02-21 16:29:18.449760', 0);
INSERT INTO `log` VALUES (899, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-02-21 16:29:18.447995', 0);
INSERT INTO `log` VALUES (900, 'admin', '管理员', '系统管理', '查询用户信息', 'http://localhost:8088/system/userInfo', '127.0.0.1', '2022-02-21 16:29:18.445038', 0);
INSERT INTO `log` VALUES (901, 'admin', '管理员', '系统管理', '查询日志信息', 'http://localhost:8088/system/log', '127.0.0.1', '2022-02-21 16:29:18.442322', 0);
INSERT INTO `log` VALUES (902, 'admin', '管理员', '系统管理', '查询系统功能', 'http://localhost:8088/system/functionInfo', '127.0.0.1', '2022-02-21 16:29:18.439468', 0);
INSERT INTO `log` VALUES (903, 'admin', '管理员', '系统管理', '禁用功能', 'http://localhost:8088/system/banFunctionById', '127.0.0.1', '2022-02-21 16:29:18.436779', 0);
INSERT INTO `log` VALUES (904, 'admin', '管理员', '系统管理', '查询系统功能', 'http://localhost:8088/system/functionInfo', '127.0.0.1', '2022-02-21 16:29:18.433640', 0);
INSERT INTO `log` VALUES (905, 'admin', '管理员', '系统管理', '启用功能', 'http://localhost:8088/system/openFunctionById', '127.0.0.1', '2022-02-21 16:29:18.432086', 0);
INSERT INTO `log` VALUES (906, 'admin', '管理员', '系统管理', '查询系统功能', 'http://localhost:8088/system/functionInfo', '127.0.0.1', '2022-02-21 16:29:18.428697', 0);
INSERT INTO `log` VALUES (907, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-21 16:29:18.426855', 0);
INSERT INTO `log` VALUES (908, 'admin', '管理员', '计量单位', '查询计量单位信息', 'http://localhost:8088/commodity/measureInfo', '127.0.0.1', '2022-02-21 16:29:18.422150', 0);
INSERT INTO `log` VALUES (909, 'admin', '管理员', '计量单位', '查询计量单位信息', 'http://localhost:8088/commodity/measureInfo', '127.0.0.1', '2022-02-21 16:29:18.419788', 0);
INSERT INTO `log` VALUES (910, 'admin', '管理员', '计量单位', '查询计量单位信息', 'http://localhost:8088/commodity/measureInfo', '127.0.0.1', '2022-02-21 16:29:18.416559', 0);
INSERT INTO `log` VALUES (911, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-21 16:29:18.414087', 0);
INSERT INTO `log` VALUES (912, 'admin', '管理员', '计量单位', '查询计量单位信息', 'http://localhost:8088/commodity/measureInfo', '127.0.0.1', '2022-02-21 16:29:18.409580', 0);
INSERT INTO `log` VALUES (913, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-21 16:29:18.407514', 0);
INSERT INTO `log` VALUES (914, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-21 16:29:18.404497', 0);
INSERT INTO `log` VALUES (915, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-21 16:29:18.401672', 0);
INSERT INTO `log` VALUES (916, 'admin', '管理员', '计量单位', '查询计量单位信息', 'http://localhost:8088/commodity/measureInfo', '127.0.0.1', '2022-02-21 16:29:18.398927', 0);
INSERT INTO `log` VALUES (917, 'admin', '管理员', '计量单位', '查询计量单位信息', 'http://localhost:8088/commodity/measureInfo', '127.0.0.1', '2022-02-21 16:29:18.397377', 0);
INSERT INTO `log` VALUES (918, 'admin', '管理员', '计量单位', '查询计量单位信息', 'http://localhost:8088/commodity/measureInfo', '127.0.0.1', '2022-02-21 16:29:18.393857', 0);
INSERT INTO `log` VALUES (919, 'admin', '管理员', '计量单位', '查询计量单位信息', 'http://localhost:8088/commodity/measureInfo', '127.0.0.1', '2022-02-21 16:29:18.392180', 0);
INSERT INTO `log` VALUES (920, 'admin', '管理员', '计量单位', '查询计量单位信息', 'http://localhost:8088/commodity/measureInfo', '127.0.0.1', '2022-02-21 16:29:18.388592', 0);
INSERT INTO `log` VALUES (921, 'admin', '管理员', '计量单位', '查询计量单位信息', 'http://localhost:8088/commodity/measureInfo', '127.0.0.1', '2022-02-21 16:29:18.386245', 0);
INSERT INTO `log` VALUES (922, 'admin', '管理员', '计量单位', '查询计量单位信息', 'http://localhost:8088/commodity/measureInfo', '127.0.0.1', '2022-02-21 16:29:18.383209', 0);
INSERT INTO `log` VALUES (923, 'admin', '管理员', '计量单位', '查询计量单位信息', 'http://localhost:8088/commodity/measureInfo', '127.0.0.1', '2022-02-21 16:29:18.380045', 0);
INSERT INTO `log` VALUES (924, 'admin', '管理员', '计量单位', '查询计量单位信息', 'http://localhost:8088/commodity/measureInfo', '127.0.0.1', '2022-02-21 16:29:18.376885', 0);
INSERT INTO `log` VALUES (925, 'admin', '管理员', '计量单位', '查询计量单位信息', 'http://localhost:8088/commodity/measureInfo', '127.0.0.1', '2022-02-21 16:29:18.373539', 0);
INSERT INTO `log` VALUES (926, 'admin', '管理员', '计量单位', '查询计量单位信息', 'http://localhost:8088/commodity/measureInfo', '127.0.0.1', '2022-02-21 16:29:18.370508', 0);
INSERT INTO `log` VALUES (927, 'admin', '管理员', '计量单位', '查询计量单位信息', 'http://localhost:8088/commodity/measureInfo', '127.0.0.1', '2022-02-21 16:29:18.367659', 0);
INSERT INTO `log` VALUES (928, 'admin', '管理员', '计量单位', '查询计量单位信息', 'http://localhost:8088/commodity/measureInfo', '127.0.0.1', '2022-02-21 16:29:18.364430', 0);
INSERT INTO `log` VALUES (929, 'admin', '管理员', '计量单位', '查询计量单位信息', 'http://localhost:8088/commodity/measureInfo', '127.0.0.1', '2022-02-21 16:29:18.359845', 0);
INSERT INTO `log` VALUES (930, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-21 16:29:18.356330', 0);
INSERT INTO `log` VALUES (931, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-21 16:29:18.353259', 0);
INSERT INTO `log` VALUES (932, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-21 16:29:18.350332', 0);
INSERT INTO `log` VALUES (933, 'admin', '管理员', '计量单位', '查询计量单位信息', 'http://localhost:8088/commodity/measureInfo', '127.0.0.1', '2022-02-21 16:29:18.348089', 0);
INSERT INTO `log` VALUES (934, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-21 16:29:18.344082', 0);
INSERT INTO `log` VALUES (935, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-21 16:29:18.341102', 0);
INSERT INTO `log` VALUES (936, 'admin', '管理员', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2022-02-21 16:29:18.336819', 0);
INSERT INTO `log` VALUES (937, 'admin', '管理员', '基本资料', '查询会员信息', 'http://localhost:8088/info/memberInfo', '127.0.0.1', '2022-02-21 16:29:18.334575', 0);
INSERT INTO `log` VALUES (938, 'admin', '管理员', '计量单位', '查询计量单位信息', 'http://localhost:8088/commodity/measureInfo', '127.0.0.1', '2022-02-21 16:29:18.330424', 0);
INSERT INTO `log` VALUES (939, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-21 16:29:18.325314', 0);
INSERT INTO `log` VALUES (940, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-21 16:29:18.321936', 0);
INSERT INTO `log` VALUES (941, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-21 16:29:18.319619', 0);
INSERT INTO `log` VALUES (942, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-21 16:29:18.315939', 0);
INSERT INTO `log` VALUES (943, 'admin', '管理员', '计量单位', '查询计量单位信息', 'http://localhost:8088/commodity/measureInfo', '127.0.0.1', '2022-02-21 16:29:18.313594', 0);
INSERT INTO `log` VALUES (944, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-21 16:29:18.309706', 0);
INSERT INTO `log` VALUES (945, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-21 16:29:18.307023', 0);
INSERT INTO `log` VALUES (946, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-21 16:29:18.303364', 0);
INSERT INTO `log` VALUES (947, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-21 16:29:18.299810', 0);
INSERT INTO `log` VALUES (948, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-21 16:29:18.295748', 0);
INSERT INTO `log` VALUES (949, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-21 16:29:18.293187', 0);
INSERT INTO `log` VALUES (950, 'admin', '管理员', '商品管理', '查询商品类别信息', 'http://localhost:8088/commodity/categoryInfo', '127.0.0.1', '2022-02-21 16:29:05.936045', 0);
INSERT INTO `log` VALUES (951, 'admin', '管理员', '计量单位', '查询计量单位信息', 'http://localhost:8088/commodity/measureInfo', '127.0.0.1', '2022-02-21 16:29:18.288671', 0);
INSERT INTO `log` VALUES (952, 'admin', '管理员', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2022-02-21 16:29:18.285651', 0);
INSERT INTO `log` VALUES (953, 'admin', '管理员', '基本资料', '查询会员信息', 'http://localhost:8088/info/memberInfo', '127.0.0.1', '2022-02-21 16:29:18.281765', 0);
INSERT INTO `log` VALUES (954, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-02-21 16:29:18.279548', 0);
INSERT INTO `log` VALUES (955, 'admin', '管理员', '基本资料', '查询仓库信息', 'http://localhost:8088/info/storeInfo', '127.0.0.1', '2022-02-21 16:29:18.275952', 0);
INSERT INTO `log` VALUES (956, 'admin', '管理员', '系统管理', '查询用户信息', 'http://localhost:8088/system/userInfo', '127.0.0.1', '2022-02-21 16:29:18.273810', 0);
INSERT INTO `log` VALUES (957, 'admin', '管理员', '系统管理', '查询日志信息', 'http://localhost:8088/system/log', '127.0.0.1', '2022-02-21 16:29:18.269584', 0);
INSERT INTO `log` VALUES (958, 'admin', '管理员', '系统管理', '查询系统功能', 'http://localhost:8088/system/functionInfo', '127.0.0.1', '2022-02-21 16:29:18.267877', 0);
INSERT INTO `log` VALUES (959, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-21 16:29:18.263874', 0);
INSERT INTO `log` VALUES (960, 'admin', '管理员', '商品信息', '查询商品信息', 'http://localhost:8088/commodity/goodsInfo', '127.0.0.1', '2022-02-21 16:29:05.918132', 0);
INSERT INTO `log` VALUES (961, 'admin', '管理员', '系统管理', '查询日志信息', 'http://localhost:8088/system/log', '127.0.0.1', '2022-02-21 16:29:18.261566', 0);
INSERT INTO `log` VALUES (962, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-02-21 16:29:18.258337', 0);
INSERT INTO `log` VALUES (963, 'admin', '管理员', '基本资料', '查询会员信息', 'http://localhost:8088/info/memberInfo', '127.0.0.1', '2022-02-21 16:29:18.255225', 0);
INSERT INTO `log` VALUES (964, 'admin', '管理员', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2022-02-21 16:29:18.251133', 0);
INSERT INTO `log` VALUES (965, 'admin', '管理员', '基本资料', '查询仓库信息', 'http://localhost:8088/info/storeInfo', '127.0.0.1', '2022-02-21 16:29:18.247104', 0);
INSERT INTO `log` VALUES (966, 'admin', '管理员', '系统管理', '查询日志信息', 'http://localhost:8088/system/log', '127.0.0.1', '2022-02-21 16:29:18.227340', 0);
INSERT INTO `log` VALUES (967, 'admin', '管理员', '系统管理', '查询日志信息', 'http://localhost:8088/system/log', '127.0.0.1', '2022-02-21 16:29:22.899564', 0);
INSERT INTO `log` VALUES (968, 'admin', '管理员', '系统管理', '查询日志信息', 'http://localhost:8088/system/log', '127.0.0.1', '2022-02-21 16:29:23.980000', 1);
INSERT INTO `log` VALUES (969, 'admin', '管理员', '商品管理', '查询商品类别信息', 'http://localhost:8088/commodity/categoryInfo', '127.0.0.1', '2022-02-21 16:29:25.944000', 1);
INSERT INTO `log` VALUES (970, 'admin', '管理员', '计量单位', '查询计量单位信息', 'http://localhost:8088/commodity/measureInfo', '127.0.0.1', '2022-02-21 16:29:28.363000', 1);
INSERT INTO `log` VALUES (971, 'admin', '管理员', '计量单位', '添加计量单位信息', 'http://localhost:8088/commodity/addMeasure', '127.0.0.1', '2022-02-21 16:29:47.387000', 1);
INSERT INTO `log` VALUES (972, 'admin', '管理员', '计量单位', '查询计量单位信息', 'http://localhost:8088/commodity/measureInfo', '127.0.0.1', '2022-02-21 16:29:49.140000', 1);
INSERT INTO `log` VALUES (973, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-21 19:10:37.600000', 1);
INSERT INTO `log` VALUES (974, 'admin', '管理员', '商品管理', '查询商品类别信息', 'http://localhost:8088/commodity/categoryInfo', '127.0.0.1', '2022-02-21 19:10:45.079000', 1);
INSERT INTO `log` VALUES (975, 'admin', '管理员', '商品信息', '查询商品信息', 'http://localhost:8088/commodity/goodsInfo', '127.0.0.1', '2022-02-21 19:10:46.250000', 1);
INSERT INTO `log` VALUES (976, 'admin', '管理员', '计量单位', '查询计量单位信息', 'http://localhost:8088/commodity/measureInfo', '127.0.0.1', '2022-02-21 19:10:46.735000', 1);
INSERT INTO `log` VALUES (977, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-21 22:26:56.956000', 1);
INSERT INTO `log` VALUES (978, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-22 10:12:56.371000', 1);
INSERT INTO `log` VALUES (979, 'admin', '管理员', '商品信息', '查询商品信息', 'http://localhost:8088/commodity/goodsInfo', '127.0.0.1', '2022-02-22 10:13:00.494000', 1);
INSERT INTO `log` VALUES (980, 'admin', '管理员', '计量单位', '查询计量单位信息', 'http://localhost:8088/commodity/measureInfo', '127.0.0.1', '2022-02-22 10:13:17.065000', 1);
INSERT INTO `log` VALUES (981, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-02-22 10:13:18.402000', 1);
INSERT INTO `log` VALUES (982, 'admin', '管理员', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2022-02-22 10:14:42.062000', 1);
INSERT INTO `log` VALUES (983, 'admin', '管理员', '基本资料', '添加账户信息', 'http://localhost:8088/info/addAccount', '127.0.0.1', '2022-02-22 10:15:07.297000', 1);
INSERT INTO `log` VALUES (984, 'admin', '管理员', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2022-02-22 10:15:09.147000', 1);
INSERT INTO `log` VALUES (985, 'admin', '管理员', '基本资料', '添加供应商信息', 'http://localhost:8088/info/addSupplier', '127.0.0.1', '2022-02-22 10:15:30.099000', 1);
INSERT INTO `log` VALUES (986, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-02-22 10:15:31.903000', 1);
INSERT INTO `log` VALUES (987, 'admin', '管理员', '基本资料', '修改供应商信息', 'http://localhost:8088/info/editSupplier', '127.0.0.1', '2022-02-22 10:15:47.949000', 1);
INSERT INTO `log` VALUES (988, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-02-22 10:15:49.794000', 1);
INSERT INTO `log` VALUES (989, 'admin', '管理员', '基本资料', '修改供应商信息', 'http://localhost:8088/info/editSupplier', '127.0.0.1', '2022-02-22 10:15:57.902000', 1);
INSERT INTO `log` VALUES (990, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-02-22 10:15:59.659000', 1);
INSERT INTO `log` VALUES (991, 'admin', '管理员', '计量单位', '查询计量单位信息', 'http://localhost:8088/commodity/measureInfo', '127.0.0.1', '2022-02-22 10:16:23.999000', 1);
INSERT INTO `log` VALUES (992, 'admin', '管理员', '商品信息', '添加商品信息', 'http://localhost:8088/commodity/addGoods', '127.0.0.1', '2022-02-22 10:16:40.425000', 1);
INSERT INTO `log` VALUES (993, 'admin', '管理员', '商品信息', '查询商品信息', 'http://localhost:8088/commodity/goodsInfo', '127.0.0.1', '2022-02-22 10:16:42.192000', 1);
INSERT INTO `log` VALUES (994, 'admin', '管理员', '商品信息', '编辑商品信息', 'http://localhost:8088/commodity/editGoods', '127.0.0.1', '2022-02-22 10:16:59.662000', 1);
INSERT INTO `log` VALUES (995, 'admin', '管理员', '商品信息', '查询商品信息', 'http://localhost:8088/commodity/goodsInfo', '127.0.0.1', '2022-02-22 10:17:01.440000', 1);
INSERT INTO `log` VALUES (996, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-22 10:25:08.244000', 1);
INSERT INTO `log` VALUES (997, 'admin', '管理员', '商品信息', '查询商品信息', 'http://localhost:8088/commodity/goodsInfo', '127.0.0.1', '2022-02-22 10:25:12.474000', 1);
INSERT INTO `log` VALUES (998, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-22 10:30:09.563000', 1);
INSERT INTO `log` VALUES (999, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-22 10:31:54.325000', 1);
INSERT INTO `log` VALUES (1000, 'admin', '管理员', '商品信息', '查询商品信息', 'http://localhost:8088/commodity/goodsInfo', '127.0.0.1', '2022-02-22 10:40:33.958000', 1);
INSERT INTO `log` VALUES (1001, 'admin', '管理员', '商品信息', '查询商品信息', 'http://localhost:8088/commodity/goodsInfo', '127.0.0.1', '2022-02-22 10:40:35.671000', 1);
INSERT INTO `log` VALUES (1002, 'admin', '管理员', '商品信息', '查询商品信息', 'http://localhost:8088/commodity/goodsInfo', '127.0.0.1', '2022-02-22 10:40:38.625000', 1);
INSERT INTO `log` VALUES (1003, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-22 10:42:19.694000', 1);
INSERT INTO `log` VALUES (1004, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-22 10:42:44.688000', 1);
INSERT INTO `log` VALUES (1005, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-22 12:04:37.462000', 1);
INSERT INTO `log` VALUES (1006, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-02-22 12:04:40.966000', 1);
INSERT INTO `log` VALUES (1007, 'admin', '管理员', '基本资料', '查询仓库信息', 'http://localhost:8088/info/storeInfo', '127.0.0.1', '2022-02-22 12:14:47.504000', 1);
INSERT INTO `log` VALUES (1008, 'admin', '管理员', '商品信息', '查询商品信息', 'http://localhost:8088/commodity/goodsInfo', '127.0.0.1', '2022-02-22 12:14:55.825000', 1);
INSERT INTO `log` VALUES (1009, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-22 18:01:44.013000', 1);
INSERT INTO `log` VALUES (1010, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-22 18:02:28.876000', 1);
INSERT INTO `log` VALUES (1011, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-22 18:03:49.208000', 1);
INSERT INTO `log` VALUES (1012, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-22 18:04:39.157000', 1);
INSERT INTO `log` VALUES (1013, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-22 18:05:05.836000', 1);
INSERT INTO `log` VALUES (1014, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-22 18:06:29.203000', 1);
INSERT INTO `log` VALUES (1015, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-22 18:07:01.713000', 1);
INSERT INTO `log` VALUES (1016, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-22 19:13:39.439000', 1);
INSERT INTO `log` VALUES (1017, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-22 19:14:26.411000', 1);
INSERT INTO `log` VALUES (1018, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-22 19:15:45.857000', 1);
INSERT INTO `log` VALUES (1019, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-22 19:19:17.410000', 1);
INSERT INTO `log` VALUES (1020, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-22 19:20:25.303000', 1);
INSERT INTO `log` VALUES (1021, 'test', '测试账号', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-22 19:21:02.539000', 1);
INSERT INTO `log` VALUES (1022, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-22 19:23:16.432000', 1);
INSERT INTO `log` VALUES (1023, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-22 19:25:33.828000', 1);
INSERT INTO `log` VALUES (1024, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-22 19:38:36.264000', 1);
INSERT INTO `log` VALUES (1025, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-23 17:32:06.989000', 1);
INSERT INTO `log` VALUES (1026, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-23 17:33:30.483000', 1);
INSERT INTO `log` VALUES (1027, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-23 17:35:04.855000', 1);
INSERT INTO `log` VALUES (1028, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-23 17:36:45.787000', 1);
INSERT INTO `log` VALUES (1029, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-23 17:51:13.588000', 1);
INSERT INTO `log` VALUES (1030, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-23 17:52:45.110000', 1);
INSERT INTO `log` VALUES (1031, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-23 18:33:41.495000', 1);
INSERT INTO `log` VALUES (1032, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-24 12:11:10.320000', 1);
INSERT INTO `log` VALUES (1033, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-24 12:14:29.577000', 1);
INSERT INTO `log` VALUES (1034, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-24 12:16:18.058000', 1);
INSERT INTO `log` VALUES (1035, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-24 12:21:08.394000', 1);
INSERT INTO `log` VALUES (1036, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-24 12:22:13.279000', 1);
INSERT INTO `log` VALUES (1037, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-24 13:47:49.383000', 1);
INSERT INTO `log` VALUES (1038, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-24 16:43:39.299000', 1);
INSERT INTO `log` VALUES (1039, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-24 16:48:38.413000', 1);
INSERT INTO `log` VALUES (1040, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-24 19:24:22.848000', 1);
INSERT INTO `log` VALUES (1041, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-24 19:35:22.994000', 1);
INSERT INTO `log` VALUES (1042, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-24 19:37:36.688000', 1);
INSERT INTO `log` VALUES (1043, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-24 19:41:44.553000', 1);
INSERT INTO `log` VALUES (1044, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-24 19:51:12.312000', 1);
INSERT INTO `log` VALUES (1045, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-24 19:53:45.838000', 1);
INSERT INTO `log` VALUES (1046, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-24 19:55:18.432000', 1);
INSERT INTO `log` VALUES (1047, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-24 19:56:39.929000', 1);
INSERT INTO `log` VALUES (1048, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-24 19:57:38.038000', 1);
INSERT INTO `log` VALUES (1049, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-24 19:58:32.316000', 1);
INSERT INTO `log` VALUES (1050, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-24 20:00:06.405000', 1);
INSERT INTO `log` VALUES (1051, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-24 20:15:12.137000', 1);
INSERT INTO `log` VALUES (1052, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-24 20:18:37.621000', 1);
INSERT INTO `log` VALUES (1053, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-24 20:19:48.090000', 1);
INSERT INTO `log` VALUES (1054, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-24 20:25:14.940000', 1);
INSERT INTO `log` VALUES (1055, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-24 20:26:41.732000', 1);
INSERT INTO `log` VALUES (1056, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-24 20:27:24.775000', 1);
INSERT INTO `log` VALUES (1057, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-24 20:28:23.521000', 1);
INSERT INTO `log` VALUES (1058, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-24 20:31:03.216000', 1);
INSERT INTO `log` VALUES (1059, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-24 20:38:45.389000', 1);
INSERT INTO `log` VALUES (1060, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-24 20:39:40.257000', 1);
INSERT INTO `log` VALUES (1061, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-24 20:40:30.010000', 1);
INSERT INTO `log` VALUES (1062, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-24 20:40:57.087000', 1);
INSERT INTO `log` VALUES (1063, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-24 20:42:53.742000', 1);
INSERT INTO `log` VALUES (1064, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-24 20:46:09.885000', 1);
INSERT INTO `log` VALUES (1065, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-24 20:46:52.409000', 1);
INSERT INTO `log` VALUES (1066, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-24 20:47:29.517000', 1);
INSERT INTO `log` VALUES (1067, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-24 20:48:10.037000', 1);
INSERT INTO `log` VALUES (1068, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-24 20:49:03.921000', 1);
INSERT INTO `log` VALUES (1069, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-24 20:49:29.275000', 1);
INSERT INTO `log` VALUES (1070, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-24 20:53:12.229000', 1);
INSERT INTO `log` VALUES (1071, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-24 20:56:17.894000', 1);
INSERT INTO `log` VALUES (1072, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-25 09:51:36.458000', 1);
INSERT INTO `log` VALUES (1073, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-25 10:05:05.978000', 1);
INSERT INTO `log` VALUES (1074, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-25 11:16:29.007000', 1);
INSERT INTO `log` VALUES (1075, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-25 11:27:06.137000', 1);
INSERT INTO `log` VALUES (1076, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-25 11:28:49.215000', 1);
INSERT INTO `log` VALUES (1077, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-25 11:30:45.425000', 1);
INSERT INTO `log` VALUES (1078, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-25 11:32:06.286000', 1);
INSERT INTO `log` VALUES (1079, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-25 11:33:08.117000', 1);
INSERT INTO `log` VALUES (1080, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-25 11:34:22.119000', 1);
INSERT INTO `log` VALUES (1081, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-25 11:35:00.772000', 1);
INSERT INTO `log` VALUES (1082, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-25 11:36:32.781000', 1);
INSERT INTO `log` VALUES (1083, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-25 11:37:08.681000', 1);
INSERT INTO `log` VALUES (1084, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-25 13:24:40.729000', 1);
INSERT INTO `log` VALUES (1085, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-25 13:27:43.345000', 1);
INSERT INTO `log` VALUES (1086, 'admin', '管理员', '商品管理', '查询商品类别信息', 'http://localhost:8088/commodity/categoryInfo', '127.0.0.1', '2022-02-25 14:10:58.522000', 1);
INSERT INTO `log` VALUES (1087, 'admin', '管理员', '商品信息', '查询商品信息', 'http://localhost:8088/commodity/goodsInfo', '127.0.0.1', '2022-02-25 14:11:00.242000', 1);
INSERT INTO `log` VALUES (1088, 'admin', '管理员', '计量单位', '查询计量单位信息', 'http://localhost:8088/commodity/measureInfo', '127.0.0.1', '2022-02-25 14:11:01.753000', 1);
INSERT INTO `log` VALUES (1089, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-25 14:13:46.528000', 1);
INSERT INTO `log` VALUES (1090, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-02-25 14:16:57.303000', 1);
INSERT INTO `log` VALUES (1091, 'admin', '管理员', '基本资料', '查询会员信息', 'http://localhost:8088/info/memberInfo', '127.0.0.1', '2022-02-25 14:16:59.252000', 1);
INSERT INTO `log` VALUES (1092, 'admin', '管理员', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2022-02-25 14:17:01.643000', 1);
INSERT INTO `log` VALUES (1093, 'admin', '管理员', '基本资料', '查询仓库信息', 'http://localhost:8088/info/storeInfo', '127.0.0.1', '2022-02-25 14:17:07.025000', 1);
INSERT INTO `log` VALUES (1094, 'admin', '管理员', '商品信息', '查询商品信息', 'http://localhost:8088/commodity/goodsInfo', '127.0.0.1', '2022-02-25 14:26:43.456000', 1);
INSERT INTO `log` VALUES (1095, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-25 14:29:36.474000', 1);
INSERT INTO `log` VALUES (1096, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-02-25 14:29:39.909000', 1);
INSERT INTO `log` VALUES (1097, 'admin', '管理员', '基本资料', '查询仓库信息', 'http://localhost:8088/info/storeInfo', '127.0.0.1', '2022-02-25 14:31:49.980000', 1);
INSERT INTO `log` VALUES (1098, 'admin', '管理员', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2022-02-25 14:31:50.355000', 1);
INSERT INTO `log` VALUES (1099, 'admin', '管理员', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2022-02-25 14:32:08.893000', 1);
INSERT INTO `log` VALUES (1100, 'admin', '管理员', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2022-02-25 14:32:10.774000', 1);
INSERT INTO `log` VALUES (1101, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-25 14:34:07.669000', 1);
INSERT INTO `log` VALUES (1102, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-25 14:35:33.140000', 1);
INSERT INTO `log` VALUES (1103, 'admin', '管理员', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2022-02-25 14:36:46.861000', 1);
INSERT INTO `log` VALUES (1104, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-02-25 14:36:56.754000', 1);
INSERT INTO `log` VALUES (1105, 'admin', '管理员', '基本资料', '查询仓库信息', 'http://localhost:8088/info/storeInfo', '127.0.0.1', '2022-02-25 14:37:23.955000', 1);
INSERT INTO `log` VALUES (1106, 'admin', '管理员', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2022-02-25 14:37:26.747000', 1);
INSERT INTO `log` VALUES (1107, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-25 14:46:04.307000', 1);
INSERT INTO `log` VALUES (1108, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-02-25 14:46:14.644000', 1);
INSERT INTO `log` VALUES (1109, 'admin', '管理员', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2022-02-25 14:46:19.637000', 1);
INSERT INTO `log` VALUES (1110, 'admin', '管理员', '基本资料', '查询仓库信息', 'http://localhost:8088/info/storeInfo', '127.0.0.1', '2022-02-25 14:46:29.258000', 1);
INSERT INTO `log` VALUES (1111, 'admin', '管理员', '系统管理', '查询用户信息', 'http://localhost:8088/system/userInfo', '127.0.0.1', '2022-02-25 14:46:40.751000', 1);
INSERT INTO `log` VALUES (1112, 'admin', '管理员', '系统管理', '查询日志信息', 'http://localhost:8088/system/log', '127.0.0.1', '2022-02-25 14:46:40.997000', 1);
INSERT INTO `log` VALUES (1113, 'admin', '管理员', '系统管理', '查询系统功能', 'http://localhost:8088/system/functionInfo', '127.0.0.1', '2022-02-25 14:46:41.756000', 1);
INSERT INTO `log` VALUES (1114, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-25 16:10:13.251000', 1);
INSERT INTO `log` VALUES (1115, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-25 16:18:17.227000', 1);
INSERT INTO `log` VALUES (1116, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-25 16:22:11.877000', 1);
INSERT INTO `log` VALUES (1117, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-25 16:24:24.156000', 1);
INSERT INTO `log` VALUES (1118, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-25 16:26:16.825000', 1);
INSERT INTO `log` VALUES (1119, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-25 16:28:33.163000', 1);
INSERT INTO `log` VALUES (1120, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-25 16:30:00.243000', 1);
INSERT INTO `log` VALUES (1121, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-25 16:33:58.341000', 1);
INSERT INTO `log` VALUES (1122, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-25 16:41:17.417000', 1);
INSERT INTO `log` VALUES (1123, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-25 16:46:16.599000', 1);
INSERT INTO `log` VALUES (1124, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-25 16:51:24.552000', 1);
INSERT INTO `log` VALUES (1125, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-25 17:01:06.000000', 1);
INSERT INTO `log` VALUES (1126, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-25 17:02:54.624000', 1);
INSERT INTO `log` VALUES (1127, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-25 17:07:14.022000', 1);
INSERT INTO `log` VALUES (1128, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-25 17:08:42.968000', 1);
INSERT INTO `log` VALUES (1129, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-25 20:59:03.655000', 1);
INSERT INTO `log` VALUES (1130, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-25 21:02:01.078000', 1);
INSERT INTO `log` VALUES (1131, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-25 21:16:56.215000', 1);
INSERT INTO `log` VALUES (1132, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-25 21:18:17.967000', 1);
INSERT INTO `log` VALUES (1133, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-25 21:27:21.551000', 1);
INSERT INTO `log` VALUES (1134, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-25 21:30:47.203000', 1);
INSERT INTO `log` VALUES (1135, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-25 21:34:33.591000', 1);
INSERT INTO `log` VALUES (1136, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-26 09:58:10.007000', 1);
INSERT INTO `log` VALUES (1137, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-26 10:19:03.013000', 1);
INSERT INTO `log` VALUES (1138, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-26 10:46:07.960000', 1);
INSERT INTO `log` VALUES (1139, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-26 10:50:52.803000', 1);
INSERT INTO `log` VALUES (1140, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-26 10:59:55.045000', 1);
INSERT INTO `log` VALUES (1141, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-26 11:02:48.000000', 1);
INSERT INTO `log` VALUES (1142, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-26 11:03:42.538000', 1);
INSERT INTO `log` VALUES (1143, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-26 11:07:36.679000', 1);
INSERT INTO `log` VALUES (1144, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-26 11:18:27.681000', 1);
INSERT INTO `log` VALUES (1145, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-26 11:21:21.288000', 1);
INSERT INTO `log` VALUES (1146, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-26 11:22:33.973000', 1);
INSERT INTO `log` VALUES (1147, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-26 11:25:11.975000', 1);
INSERT INTO `log` VALUES (1148, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-26 11:26:05.395000', 1);
INSERT INTO `log` VALUES (1149, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-26 11:27:29.926000', 1);
INSERT INTO `log` VALUES (1150, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-26 11:29:57.982000', 1);
INSERT INTO `log` VALUES (1151, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-26 11:31:41.706000', 1);
INSERT INTO `log` VALUES (1152, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-26 11:34:35.230000', 1);
INSERT INTO `log` VALUES (1153, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-26 11:41:43.875000', 1);
INSERT INTO `log` VALUES (1154, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-26 12:07:31.959000', 1);
INSERT INTO `log` VALUES (1155, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-26 13:40:40.153000', 1);
INSERT INTO `log` VALUES (1156, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-26 13:46:02.920000', 1);
INSERT INTO `log` VALUES (1157, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-26 14:41:16.737000', 1);
INSERT INTO `log` VALUES (1158, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-26 14:44:18.859000', 1);
INSERT INTO `log` VALUES (1159, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-26 14:47:27.102000', 1);
INSERT INTO `log` VALUES (1160, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-26 14:49:39.463000', 1);
INSERT INTO `log` VALUES (1161, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-26 14:55:24.772000', 1);
INSERT INTO `log` VALUES (1162, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-26 14:56:37.764000', 1);
INSERT INTO `log` VALUES (1163, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-26 15:34:35.745000', 1);
INSERT INTO `log` VALUES (1164, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-26 15:43:14.544000', 1);
INSERT INTO `log` VALUES (1165, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-26 15:44:23.053000', 1);
INSERT INTO `log` VALUES (1166, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-26 15:45:42.379000', 1);
INSERT INTO `log` VALUES (1167, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-26 16:00:14.554000', 1);
INSERT INTO `log` VALUES (1168, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-26 16:06:53.981000', 1);
INSERT INTO `log` VALUES (1169, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-26 16:10:51.621000', 1);
INSERT INTO `log` VALUES (1170, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-26 16:21:20.982000', 1);
INSERT INTO `log` VALUES (1171, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-02-26 16:26:20.417000', 1);
INSERT INTO `log` VALUES (1172, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-01 09:44:04.604000', 1);
INSERT INTO `log` VALUES (1173, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-01 09:49:29.796000', 1);
INSERT INTO `log` VALUES (1174, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-01 10:12:52.501000', 1);
INSERT INTO `log` VALUES (1175, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-01 10:19:38.418000', 1);
INSERT INTO `log` VALUES (1176, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-01 10:20:44.184000', 1);
INSERT INTO `log` VALUES (1177, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-01 10:39:02.881000', 1);
INSERT INTO `log` VALUES (1178, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-01 10:41:13.470000', 1);
INSERT INTO `log` VALUES (1179, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-01 11:54:38.338000', 1);
INSERT INTO `log` VALUES (1180, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-01 11:59:24.718000', 1);
INSERT INTO `log` VALUES (1181, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-01 12:07:46.259000', 1);
INSERT INTO `log` VALUES (1182, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-01 12:33:09.309000', 1);
INSERT INTO `log` VALUES (1183, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-01 13:07:55.571000', 1);
INSERT INTO `log` VALUES (1184, 'admin', '管理员', '商品管理', '查询商品类别信息', 'http://localhost:8088/commodity/categoryInfo', '127.0.0.1', '2022-03-01 13:08:10.593000', 1);
INSERT INTO `log` VALUES (1185, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-01 13:09:19.902000', 1);
INSERT INTO `log` VALUES (1186, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-01 13:10:40.757000', 1);
INSERT INTO `log` VALUES (1187, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-01 13:12:01.635000', 1);
INSERT INTO `log` VALUES (1188, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-01 13:17:47.541000', 1);
INSERT INTO `log` VALUES (1189, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-01 13:30:50.090000', 1);
INSERT INTO `log` VALUES (1190, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-01 13:33:04.639000', 1);
INSERT INTO `log` VALUES (1191, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-01 13:34:07.361000', 1);
INSERT INTO `log` VALUES (1192, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-01 13:36:00.532000', 1);
INSERT INTO `log` VALUES (1193, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-01 13:39:12.743000', 1);
INSERT INTO `log` VALUES (1194, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-01 13:41:24.377000', 1);
INSERT INTO `log` VALUES (1195, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-01 13:52:34.213000', 1);
INSERT INTO `log` VALUES (1196, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-01 13:53:36.962000', 1);
INSERT INTO `log` VALUES (1197, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-01 13:54:20.328000', 1);
INSERT INTO `log` VALUES (1198, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-01 13:56:25.466000', 1);
INSERT INTO `log` VALUES (1199, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-01 13:58:03.409000', 1);
INSERT INTO `log` VALUES (1200, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-01 14:03:55.015000', 1);
INSERT INTO `log` VALUES (1201, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-01 14:06:04.259000', 1);
INSERT INTO `log` VALUES (1202, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-01 14:08:35.881000', 1);
INSERT INTO `log` VALUES (1203, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-01 14:15:53.469000', 1);
INSERT INTO `log` VALUES (1204, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-01 14:17:32.223000', 1);
INSERT INTO `log` VALUES (1205, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-01 14:19:30.205000', 1);
INSERT INTO `log` VALUES (1206, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-01 14:21:28.665000', 1);
INSERT INTO `log` VALUES (1207, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-01 14:26:20.584000', 1);
INSERT INTO `log` VALUES (1208, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-01 14:29:00.828000', 1);
INSERT INTO `log` VALUES (1209, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-01 14:31:15.061000', 1);
INSERT INTO `log` VALUES (1210, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-01 14:32:49.615000', 1);
INSERT INTO `log` VALUES (1211, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-01 14:37:46.010000', 1);
INSERT INTO `log` VALUES (1212, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-01 14:39:02.451000', 1);
INSERT INTO `log` VALUES (1213, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-01 14:44:50.180000', 1);
INSERT INTO `log` VALUES (1214, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-01 14:46:58.012000', 1);
INSERT INTO `log` VALUES (1215, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-01 14:49:54.726000', 1);
INSERT INTO `log` VALUES (1216, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-01 14:51:07.146000', 1);
INSERT INTO `log` VALUES (1217, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-01 14:54:09.194000', 1);
INSERT INTO `log` VALUES (1218, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-01 18:52:03.119000', 1);
INSERT INTO `log` VALUES (1219, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-02 12:09:14.657000', 1);
INSERT INTO `log` VALUES (1220, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-02 13:00:16.003000', 1);
INSERT INTO `log` VALUES (1221, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-02 13:07:49.776000', 1);
INSERT INTO `log` VALUES (1222, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-02 13:20:27.821000', 1);
INSERT INTO `log` VALUES (1223, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-02 13:21:13.487000', 1);
INSERT INTO `log` VALUES (1224, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-02 13:22:38.804000', 1);
INSERT INTO `log` VALUES (1225, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-02 13:23:16.410000', 1);
INSERT INTO `log` VALUES (1226, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-02 13:38:32.475000', 1);
INSERT INTO `log` VALUES (1227, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-02 13:44:38.736000', 1);
INSERT INTO `log` VALUES (1228, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-02 13:46:04.475000', 1);
INSERT INTO `log` VALUES (1229, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-02 13:49:06.505000', 1);
INSERT INTO `log` VALUES (1230, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-02 13:50:46.876000', 1);
INSERT INTO `log` VALUES (1231, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-02 14:00:09.130000', 1);
INSERT INTO `log` VALUES (1232, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-03-02 14:01:44.771000', 1);
INSERT INTO `log` VALUES (1233, 'admin', '管理员', '基本资料', '查询仓库信息', 'http://localhost:8088/info/storeInfo', '127.0.0.1', '2022-03-02 14:01:47.026000', 1);
INSERT INTO `log` VALUES (1234, 'admin', '管理员', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2022-03-02 14:01:47.343000', 1);
INSERT INTO `log` VALUES (1235, 'admin', '管理员', '基本资料', '查询会员信息', 'http://localhost:8088/info/memberInfo', '127.0.0.1', '2022-03-02 14:02:20.358000', 1);
INSERT INTO `log` VALUES (1236, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-02 14:10:18.081000', 1);
INSERT INTO `log` VALUES (1237, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-03-02 14:11:14.480000', 1);
INSERT INTO `log` VALUES (1238, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-02 14:13:42.995000', 1);
INSERT INTO `log` VALUES (1239, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-02 14:19:24.753000', 1);
INSERT INTO `log` VALUES (1240, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-02 15:13:26.110000', 1);
INSERT INTO `log` VALUES (1241, 'admin', '管理员', '采购入库', '商品入库审核确认', 'http://localhost:8088/purchase/completeOrder', '127.0.0.1', '2022-03-02 15:13:41.897000', 1);
INSERT INTO `log` VALUES (1242, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-02 15:44:23.994000', 1);
INSERT INTO `log` VALUES (1243, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-04 15:47:28.297000', 1);
INSERT INTO `log` VALUES (1244, 'admin', '管理员', '采购入库', '商品入库审核确认', 'http://localhost:8088/purchase/completeOrder', '127.0.0.1', '2022-03-04 16:13:02.227000', 1);
INSERT INTO `log` VALUES (1245, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-04 16:48:35.879000', 1);
INSERT INTO `log` VALUES (1246, 'admin', '管理员', '采购入库', '商品入库审核确认', 'http://localhost:8088/purchase/completeOrder', '127.0.0.1', '2022-03-04 16:48:40.855000', 1);
INSERT INTO `log` VALUES (1247, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-04 17:36:13.710000', 1);
INSERT INTO `log` VALUES (1248, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-04 20:24:28.680000', 1);
INSERT INTO `log` VALUES (1249, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-04 23:11:55.393000', 1);
INSERT INTO `log` VALUES (1250, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-04 23:13:11.140000', 1);
INSERT INTO `log` VALUES (1251, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-04 23:18:18.426000', 1);
INSERT INTO `log` VALUES (1252, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-04 23:19:56.772000', 1);
INSERT INTO `log` VALUES (1253, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-04 23:21:55.271000', 1);
INSERT INTO `log` VALUES (1254, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-04 23:23:20.498000', 1);
INSERT INTO `log` VALUES (1255, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-04 23:24:50.357000', 1);
INSERT INTO `log` VALUES (1256, 'admin', '管理员', '采购入库', '商品入库审核确认', 'http://localhost:8088/purchase/completeOrder', '127.0.0.1', '2022-03-04 23:24:54.566000', 1);
INSERT INTO `log` VALUES (1257, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-04 23:27:27.077000', 1);
INSERT INTO `log` VALUES (1258, 'admin', '管理员', '采购入库', '商品入库审核确认', 'http://localhost:8088/purchase/completeOrder', '127.0.0.1', '2022-03-04 23:27:38.890000', 1);
INSERT INTO `log` VALUES (1259, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-04 23:31:06.482000', 1);
INSERT INTO `log` VALUES (1260, 'admin', '管理员', '采购入库', '商品入库审核确认', 'http://localhost:8088/purchase/completeOrder', '127.0.0.1', '2022-03-04 23:31:13.523000', 1);
INSERT INTO `log` VALUES (1261, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-05 10:41:56.402000', 1);
INSERT INTO `log` VALUES (1262, 'admin', '管理员', '采购入库', '商品入库审核确认', 'http://localhost:8088/purchase/completeOrder', '127.0.0.1', '2022-03-05 10:42:09.791000', 1);
INSERT INTO `log` VALUES (1263, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-05 10:48:09.242000', 1);
INSERT INTO `log` VALUES (1264, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-05 10:50:03.364000', 1);
INSERT INTO `log` VALUES (1265, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-05 10:51:20.746000', 1);
INSERT INTO `log` VALUES (1266, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-05 10:53:35.095000', 1);
INSERT INTO `log` VALUES (1267, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-05 10:54:08.376000', 1);
INSERT INTO `log` VALUES (1268, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-05 10:54:54.908000', 1);
INSERT INTO `log` VALUES (1269, 'admin', '管理员', '采购入库', '商品入库审核确认', 'http://localhost:8088/purchase/completeOrder', '127.0.0.1', '2022-03-05 10:54:59.124000', 1);
INSERT INTO `log` VALUES (1270, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-05 10:56:15.034000', 1);
INSERT INTO `log` VALUES (1271, 'admin', '管理员', '采购入库', '商品入库审核确认', 'http://localhost:8088/purchase/completeOrder', '127.0.0.1', '2022-03-05 10:56:19.995000', 1);
INSERT INTO `log` VALUES (1272, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-05 10:58:15.827000', 1);
INSERT INTO `log` VALUES (1273, 'admin', '管理员', '采购入库', '商品入库审核确认', 'http://localhost:8088/purchase/completeOrder', '127.0.0.1', '2022-03-05 10:58:19.908000', 1);
INSERT INTO `log` VALUES (1274, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-05 11:03:42.442000', 1);
INSERT INTO `log` VALUES (1275, 'admin', '管理员', '采购入库', '商品入库审核确认', 'http://localhost:8088/purchase/completeOrder', '127.0.0.1', '2022-03-05 11:03:47.294000', 1);
INSERT INTO `log` VALUES (1276, 'admin', '管理员', '商品信息', '查询商品信息', 'http://localhost:8088/commodity/goodsInfo', '127.0.0.1', '2022-03-05 11:07:41.925000', 1);
INSERT INTO `log` VALUES (1277, 'admin', '管理员', '基本资料', '查询仓库信息', 'http://localhost:8088/info/storeInfo', '127.0.0.1', '2022-03-05 11:07:46.675000', 1);
INSERT INTO `log` VALUES (1278, 'admin', '管理员', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2022-03-05 11:07:47.628000', 1);
INSERT INTO `log` VALUES (1279, 'admin', '管理员', '基本资料', '编辑账户信息', 'http://localhost:8088/info/editAccountInfo', '127.0.0.1', '2022-03-05 11:08:33.776000', 1);
INSERT INTO `log` VALUES (1280, 'admin', '管理员', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2022-03-05 11:08:35.415000', 1);
INSERT INTO `log` VALUES (1281, 'admin', '管理员', '基本资料', '编辑账户信息', 'http://localhost:8088/info/editAccountInfo', '127.0.0.1', '2022-03-05 11:08:47.310000', 1);
INSERT INTO `log` VALUES (1282, 'admin', '管理员', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2022-03-05 11:08:48.972000', 1);
INSERT INTO `log` VALUES (1283, 'admin', '管理员', '基本资料', '编辑账户信息', 'http://localhost:8088/info/editAccountInfo', '127.0.0.1', '2022-03-05 11:08:58.820000', 1);
INSERT INTO `log` VALUES (1284, 'admin', '管理员', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2022-03-05 11:09:00.472000', 1);
INSERT INTO `log` VALUES (1285, 'admin', '管理员', '基本资料', '编辑账户信息', 'http://localhost:8088/info/editAccountInfo', '127.0.0.1', '2022-03-05 11:09:12.148000', 1);
INSERT INTO `log` VALUES (1286, 'admin', '管理员', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2022-03-05 11:09:13.833000', 1);
INSERT INTO `log` VALUES (1287, 'admin', '管理员', '采购入库', '商品入库审核确认', 'http://localhost:8088/purchase/completeOrder', '127.0.0.1', '2022-03-05 11:12:21.424000', 1);
INSERT INTO `log` VALUES (1288, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-05 11:21:28.648000', 1);
INSERT INTO `log` VALUES (1289, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-05 14:01:48.344000', 1);
INSERT INTO `log` VALUES (1290, 'admin', '管理员', '商品信息', '查询商品信息', 'http://localhost:8088/commodity/goodsInfo', '127.0.0.1', '2022-03-05 14:13:36.030000', 1);
INSERT INTO `log` VALUES (1291, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-05 14:17:53.638000', 1);
INSERT INTO `log` VALUES (1292, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-05 14:19:49.639000', 1);
INSERT INTO `log` VALUES (1293, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-05 14:21:22.910000', 1);
INSERT INTO `log` VALUES (1294, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-05 14:22:53.705000', 1);
INSERT INTO `log` VALUES (1295, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-05 14:28:29.142000', 1);
INSERT INTO `log` VALUES (1296, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-05 15:01:46.503000', 1);
INSERT INTO `log` VALUES (1297, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-05 15:10:37.107000', 1);
INSERT INTO `log` VALUES (1298, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-05 15:15:30.552000', 1);
INSERT INTO `log` VALUES (1299, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-05 15:19:24.534000', 1);
INSERT INTO `log` VALUES (1300, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-05 15:52:05.478000', 1);
INSERT INTO `log` VALUES (1301, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-05 16:00:05.666000', 1);
INSERT INTO `log` VALUES (1302, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-05 16:09:23.260000', 1);
INSERT INTO `log` VALUES (1303, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-05 16:10:26.660000', 1);
INSERT INTO `log` VALUES (1304, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-05 16:13:40.162000', 1);
INSERT INTO `log` VALUES (1305, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-07 14:06:44.757000', 1);
INSERT INTO `log` VALUES (1306, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-07 14:17:27.510000', 1);
INSERT INTO `log` VALUES (1307, 'admin', '管理员', '采购入库', '商品入库审核确认', 'http://localhost:8088/purchase/completeOrder', '127.0.0.1', '2022-03-07 14:18:05.245000', 1);
INSERT INTO `log` VALUES (1308, 'admin', '管理员', '采购入库', '商品入库审核确认', 'http://localhost:8088/purchase/completeOrder', '127.0.0.1', '2022-03-07 14:29:43.419000', 1);
INSERT INTO `log` VALUES (1309, 'admin', '管理员', '采购入库', '商品入库审核确认', 'http://localhost:8088/purchase/completeOrder', '127.0.0.1', '2022-03-07 14:32:35.970000', 1);
INSERT INTO `log` VALUES (1310, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-07 14:39:57.801000', 1);
INSERT INTO `log` VALUES (1311, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-07 14:41:12.713000', 1);
INSERT INTO `log` VALUES (1312, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-07 14:47:46.917000', 1);
INSERT INTO `log` VALUES (1313, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-07 14:49:18.262000', 1);
INSERT INTO `log` VALUES (1314, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-07 14:51:51.181000', 1);
INSERT INTO `log` VALUES (1315, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-07 15:05:07.584000', 1);
INSERT INTO `log` VALUES (1316, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-07 15:59:46.287000', 1);
INSERT INTO `log` VALUES (1317, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-07 16:02:59.210000', 1);
INSERT INTO `log` VALUES (1318, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-07 16:04:30.152000', 1);
INSERT INTO `log` VALUES (1319, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-07 16:20:43.497000', 1);
INSERT INTO `log` VALUES (1320, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-07 16:36:48.919000', 1);
INSERT INTO `log` VALUES (1321, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-07 16:41:28.972000', 1);
INSERT INTO `log` VALUES (1322, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-07 17:24:36.423000', 1);
INSERT INTO `log` VALUES (1323, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-07 17:30:17.110000', 1);
INSERT INTO `log` VALUES (1324, 'admin', '管理员', '销售出库', '商品出库审核确认', 'http://localhost:8088/out/completeOrder', '127.0.0.1', '2022-03-07 17:31:07.385000', 1);
INSERT INTO `log` VALUES (1325, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-07 17:39:14.290000', 1);
INSERT INTO `log` VALUES (1326, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-07 17:49:17.276000', 1);
INSERT INTO `log` VALUES (1327, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-07 17:54:45.812000', 1);
INSERT INTO `log` VALUES (1328, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-07 17:59:43.577000', 1);
INSERT INTO `log` VALUES (1329, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-07 18:08:48.995000', 1);
INSERT INTO `log` VALUES (1330, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-07 21:21:59.128000', 1);
INSERT INTO `log` VALUES (1331, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-07 21:51:24.510000', 1);
INSERT INTO `log` VALUES (1332, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-07 21:53:30.684000', 1);
INSERT INTO `log` VALUES (1333, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-07 21:55:28.872000', 1);
INSERT INTO `log` VALUES (1334, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-07 21:59:50.081000', 1);
INSERT INTO `log` VALUES (1335, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-08 14:11:34.496000', 1);
INSERT INTO `log` VALUES (1336, 'admin', '管理员', '基本资料', '查询仓库信息', 'http://localhost:8088/info/storeInfo', '127.0.0.1', '2022-03-08 14:43:51.690000', 1);
INSERT INTO `log` VALUES (1337, 'admin', '管理员', '基本资料', '查询仓库信息', 'http://localhost:8088/info/storeInfo', '127.0.0.1', '2022-03-08 14:45:01.267000', 1);
INSERT INTO `log` VALUES (1338, 'admin', '管理员', '基本资料', '查询仓库信息', 'http://localhost:8088/info/storeInfo', '127.0.0.1', '2022-03-08 14:45:02.556000', 1);
INSERT INTO `log` VALUES (1339, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-03-08 14:45:12.509000', 1);
INSERT INTO `log` VALUES (1340, 'admin', '管理员', '基本资料', '查询会员信息', 'http://localhost:8088/info/memberInfo', '127.0.0.1', '2022-03-08 14:45:14.192000', 1);
INSERT INTO `log` VALUES (1341, 'admin', '管理员', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2022-03-08 14:45:14.750000', 1);
INSERT INTO `log` VALUES (1342, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-08 15:29:49.563000', 1);
INSERT INTO `log` VALUES (1343, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-08 15:30:53.200000', 1);
INSERT INTO `log` VALUES (1344, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-09 11:23:41.517000', 1);
INSERT INTO `log` VALUES (1345, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-09 11:31:35.904000', 1);
INSERT INTO `log` VALUES (1346, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-09 11:32:48.217000', 1);
INSERT INTO `log` VALUES (1347, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-09 11:38:02.729000', 1);
INSERT INTO `log` VALUES (1348, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-09 12:02:42.425000', 1);
INSERT INTO `log` VALUES (1349, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-09 12:03:41.537000', 1);
INSERT INTO `log` VALUES (1350, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-09 12:05:43.614000', 1);
INSERT INTO `log` VALUES (1351, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-09 12:08:41.300000', 1);
INSERT INTO `log` VALUES (1352, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-09 12:26:14.481000', 1);
INSERT INTO `log` VALUES (1353, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-09 12:29:28.780000', 1);
INSERT INTO `log` VALUES (1354, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-09 12:33:00.178000', 1);
INSERT INTO `log` VALUES (1355, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-09 14:11:10.618000', 1);
INSERT INTO `log` VALUES (1356, 'admin', '管理员', '基本资料', '查询仓库信息', 'http://localhost:8088/info/storeInfo', '127.0.0.1', '2022-03-09 14:15:29.707000', 1);
INSERT INTO `log` VALUES (1357, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-09 14:22:17.018000', 1);
INSERT INTO `log` VALUES (1358, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-09 14:30:53.060000', 1);
INSERT INTO `log` VALUES (1359, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-09 14:33:36.383000', 1);
INSERT INTO `log` VALUES (1360, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-09 14:38:23.368000', 1);
INSERT INTO `log` VALUES (1361, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-09 14:39:23.401000', 1);
INSERT INTO `log` VALUES (1362, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-09 14:42:16.181000', 1);
INSERT INTO `log` VALUES (1363, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-09 14:44:02.349000', 1);
INSERT INTO `log` VALUES (1364, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-09 15:19:33.355000', 1);
INSERT INTO `log` VALUES (1365, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-09 15:21:23.365000', 1);
INSERT INTO `log` VALUES (1366, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-09 15:21:56.405000', 1);
INSERT INTO `log` VALUES (1367, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-09 15:22:38.313000', 1);
INSERT INTO `log` VALUES (1368, 'admin', '管理员', '商品管理', '查询商品类别信息', 'http://localhost:8088/commodity/categoryInfo', '127.0.0.1', '2022-03-09 15:23:33.406000', 1);
INSERT INTO `log` VALUES (1369, 'admin', '管理员', '商品信息', '查询商品信息', 'http://localhost:8088/commodity/goodsInfo', '127.0.0.1', '2022-03-09 15:23:34.394000', 1);
INSERT INTO `log` VALUES (1370, 'admin', '管理员', '计量单位', '查询计量单位信息', 'http://localhost:8088/commodity/measureInfo', '127.0.0.1', '2022-03-09 15:23:39.294000', 1);
INSERT INTO `log` VALUES (1371, 'admin', '管理员', '计量单位', '修改计量单位信息', 'http://localhost:8088/commodity/editMeasure', '127.0.0.1', '2022-03-09 15:24:02.353000', 1);
INSERT INTO `log` VALUES (1372, 'admin', '管理员', '计量单位', '查询计量单位信息', 'http://localhost:8088/commodity/measureInfo', '127.0.0.1', '2022-03-09 15:24:04.067000', 1);
INSERT INTO `log` VALUES (1373, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-09 17:10:39.530000', 1);
INSERT INTO `log` VALUES (1374, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-09 17:37:50.905000', 1);
INSERT INTO `log` VALUES (1375, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-09 18:06:53.714000', 1);
INSERT INTO `log` VALUES (1376, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-10 11:17:35.807000', 1);
INSERT INTO `log` VALUES (1377, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-10 11:21:01.293000', 1);
INSERT INTO `log` VALUES (1378, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-10 11:30:14.279000', 1);
INSERT INTO `log` VALUES (1379, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-10 11:34:15.951000', 1);
INSERT INTO `log` VALUES (1380, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-10 11:51:07.285000', 1);
INSERT INTO `log` VALUES (1381, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-10 11:54:21.425000', 1);
INSERT INTO `log` VALUES (1382, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-10 12:02:28.195000', 1);
INSERT INTO `log` VALUES (1383, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-10 12:03:59.693000', 1);
INSERT INTO `log` VALUES (1384, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-10 12:06:42.252000', 1);
INSERT INTO `log` VALUES (1385, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-10 12:07:42.490000', 1);
INSERT INTO `log` VALUES (1386, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-10 12:09:35.133000', 1);
INSERT INTO `log` VALUES (1387, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-10 12:10:06.785000', 1);
INSERT INTO `log` VALUES (1388, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-10 12:12:41.113000', 1);
INSERT INTO `log` VALUES (1389, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-10 12:14:15.249000', 1);
INSERT INTO `log` VALUES (1390, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-10 12:18:24.184000', 1);
INSERT INTO `log` VALUES (1391, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-10 12:21:46.046000', 1);
INSERT INTO `log` VALUES (1392, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-10 12:28:18.692000', 1);
INSERT INTO `log` VALUES (1393, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-10 12:30:59.408000', 1);
INSERT INTO `log` VALUES (1394, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-10 12:31:47.882000', 1);
INSERT INTO `log` VALUES (1395, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-10 12:33:19.165000', 1);
INSERT INTO `log` VALUES (1396, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-10 12:34:30.659000', 1);
INSERT INTO `log` VALUES (1397, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-10 12:37:29.295000', 1);
INSERT INTO `log` VALUES (1398, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-10 12:38:29.603000', 1);
INSERT INTO `log` VALUES (1399, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-10 12:39:22.531000', 1);
INSERT INTO `log` VALUES (1400, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-10 12:41:43.589000', 1);
INSERT INTO `log` VALUES (1401, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-10 12:45:55.032000', 1);
INSERT INTO `log` VALUES (1402, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-10 13:29:26.447000', 1);
INSERT INTO `log` VALUES (1403, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-10 13:51:53.346000', 1);
INSERT INTO `log` VALUES (1404, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-10 14:07:23.923000', 1);
INSERT INTO `log` VALUES (1405, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-10 14:11:09.751000', 1);
INSERT INTO `log` VALUES (1406, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-10 14:35:52.446000', 1);
INSERT INTO `log` VALUES (1407, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-10 14:38:28.188000', 1);
INSERT INTO `log` VALUES (1408, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-10 14:44:27.971000', 1);
INSERT INTO `log` VALUES (1409, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-10 14:46:46.955000', 1);
INSERT INTO `log` VALUES (1410, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-10 14:48:44.374000', 1);
INSERT INTO `log` VALUES (1411, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-10 14:51:02.159000', 1);
INSERT INTO `log` VALUES (1412, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-11 09:20:46.667000', 1);
INSERT INTO `log` VALUES (1413, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-11 09:22:42.467000', 1);
INSERT INTO `log` VALUES (1414, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-11 09:37:41.868000', 1);
INSERT INTO `log` VALUES (1415, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-11 09:39:11.933000', 1);
INSERT INTO `log` VALUES (1416, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-11 09:44:14.901000', 1);
INSERT INTO `log` VALUES (1417, 'admin', '管理员', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2022-03-11 09:44:18.067000', 1);
INSERT INTO `log` VALUES (1418, 'admin', '管理员', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2022-03-11 09:44:47.417000', 1);
INSERT INTO `log` VALUES (1419, 'admin', '管理员', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2022-03-11 09:44:48.601000', 1);
INSERT INTO `log` VALUES (1420, 'admin', '管理员', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2022-03-11 09:44:49.701000', 1);
INSERT INTO `log` VALUES (1421, 'admin', '管理员', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2022-03-11 09:45:37.792000', 1);
INSERT INTO `log` VALUES (1422, 'admin', '管理员', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2022-03-11 09:45:39.400000', 1);
INSERT INTO `log` VALUES (1423, 'admin', '管理员', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2022-03-11 09:45:41.714000', 1);
INSERT INTO `log` VALUES (1424, 'admin', '管理员', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2022-03-11 09:45:54.655000', 1);
INSERT INTO `log` VALUES (1425, 'admin', '管理员', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2022-03-11 09:45:56.382000', 1);
INSERT INTO `log` VALUES (1426, 'admin', '管理员', '销售出库', '商品出库审核确认', 'http://localhost:8088/out/completeOrder', '127.0.0.1', '2022-03-11 09:52:25.731000', 1);
INSERT INTO `log` VALUES (1427, 'admin', '管理员', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2022-03-11 10:18:37.129000', 1);
INSERT INTO `log` VALUES (1428, 'admin', '管理员', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2022-03-11 10:18:51.478000', 1);
INSERT INTO `log` VALUES (1429, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-11 10:42:38.428000', 1);
INSERT INTO `log` VALUES (1430, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-11 10:43:15.636000', 1);
INSERT INTO `log` VALUES (1431, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-11 11:04:23.402000', 1);
INSERT INTO `log` VALUES (1432, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-11 11:07:14.911000', 1);
INSERT INTO `log` VALUES (1433, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-11 11:16:21.528000', 1);
INSERT INTO `log` VALUES (1434, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-11 11:19:52.382000', 1);
INSERT INTO `log` VALUES (1435, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-11 11:22:25.924000', 1);
INSERT INTO `log` VALUES (1436, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-11 11:23:41.452000', 1);
INSERT INTO `log` VALUES (1437, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-11 11:26:03.016000', 1);
INSERT INTO `log` VALUES (1438, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-11 11:29:09.245000', 1);
INSERT INTO `log` VALUES (1439, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-11 11:30:55.543000', 1);
INSERT INTO `log` VALUES (1440, 'admin', '管理员', '基本资料', '查询仓库信息', 'http://localhost:8088/info/storeInfo', '127.0.0.1', '2022-03-11 11:32:25.341000', 1);
INSERT INTO `log` VALUES (1441, 'admin', '管理员', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2022-03-11 11:32:26.904000', 1);
INSERT INTO `log` VALUES (1442, 'admin', '管理员', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2022-03-11 11:32:32.189000', 1);
INSERT INTO `log` VALUES (1443, 'admin', '管理员', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2022-03-11 11:32:33.808000', 1);
INSERT INTO `log` VALUES (1444, 'admin', '管理员', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2022-03-11 11:32:35.022000', 1);
INSERT INTO `log` VALUES (1445, 'admin', '管理员', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2022-03-11 11:32:35.235000', 1);
INSERT INTO `log` VALUES (1446, 'admin', '管理员', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2022-03-11 11:32:36.504000', 1);
INSERT INTO `log` VALUES (1447, 'admin', '管理员', '基本资料', '查询会员信息', 'http://localhost:8088/info/memberInfo', '127.0.0.1', '2022-03-11 11:39:44.413000', 1);
INSERT INTO `log` VALUES (1448, 'admin', '管理员', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2022-03-11 11:39:51.049000', 1);
INSERT INTO `log` VALUES (1449, 'admin', '管理员', '基本资料', '查询账户信息', 'http://localhost:8088/info/acountInfo', '127.0.0.1', '2022-03-11 11:39:52.527000', 1);
INSERT INTO `log` VALUES (1450, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-11 11:44:23.495000', 1);
INSERT INTO `log` VALUES (1451, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-11 11:49:08.795000', 1);
INSERT INTO `log` VALUES (1452, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-11 13:23:03.256000', 1);
INSERT INTO `log` VALUES (1453, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-11 13:26:23.175000', 1);
INSERT INTO `log` VALUES (1454, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-11 13:47:09.904000', 1);
INSERT INTO `log` VALUES (1455, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-11 13:54:30.267000', 1);
INSERT INTO `log` VALUES (1456, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-11 13:56:28.788000', 1);
INSERT INTO `log` VALUES (1457, 'admin', '管理员', '商品信息', '查询商品信息', 'http://localhost:8088/commodity/goodsInfo', '127.0.0.1', '2022-03-11 14:14:32.765000', 1);
INSERT INTO `log` VALUES (1458, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-11 15:34:04.968000', 1);
INSERT INTO `log` VALUES (1459, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-11 15:35:09.885000', 1);
INSERT INTO `log` VALUES (1460, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-11 15:37:27.324000', 1);
INSERT INTO `log` VALUES (1461, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-11 15:40:08.656000', 1);
INSERT INTO `log` VALUES (1462, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-11 15:55:22.244000', 1);
INSERT INTO `log` VALUES (1463, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-11 16:05:02.517000', 1);
INSERT INTO `log` VALUES (1464, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-11 16:06:59.313000', 1);
INSERT INTO `log` VALUES (1465, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-11 16:10:30.218000', 1);
INSERT INTO `log` VALUES (1466, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-11 16:24:03.743000', 1);
INSERT INTO `log` VALUES (1467, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-11 16:25:25.265000', 1);
INSERT INTO `log` VALUES (1468, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-11 17:11:57.272000', 1);
INSERT INTO `log` VALUES (1469, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-11 17:13:21.774000', 1);
INSERT INTO `log` VALUES (1470, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-11 17:14:15.147000', 1);
INSERT INTO `log` VALUES (1471, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-11 17:20:58.171000', 1);
INSERT INTO `log` VALUES (1472, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-11 17:26:00.143000', 1);
INSERT INTO `log` VALUES (1473, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-11 17:31:27.608000', 1);
INSERT INTO `log` VALUES (1474, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-11 17:34:13.794000', 1);
INSERT INTO `log` VALUES (1475, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-11 19:30:04.013000', 1);
INSERT INTO `log` VALUES (1476, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-11 19:47:57.026000', 1);
INSERT INTO `log` VALUES (1477, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-11 19:54:20.753000', 1);
INSERT INTO `log` VALUES (1478, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-11 20:58:38.469000', 1);
INSERT INTO `log` VALUES (1479, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-11 20:59:51.165000', 1);
INSERT INTO `log` VALUES (1480, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-11 21:01:55.247000', 1);
INSERT INTO `log` VALUES (1481, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-11 21:29:58.406000', 1);
INSERT INTO `log` VALUES (1482, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-11 21:31:54.916000', 1);
INSERT INTO `log` VALUES (1483, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-11 21:34:08.801000', 1);
INSERT INTO `log` VALUES (1484, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-11 21:36:33.596000', 1);
INSERT INTO `log` VALUES (1485, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-11 21:37:18.350000', 1);
INSERT INTO `log` VALUES (1486, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-11 21:38:31.255000', 1);
INSERT INTO `log` VALUES (1487, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-11 21:39:05.654000', 1);
INSERT INTO `log` VALUES (1488, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-11 21:41:33.236000', 1);
INSERT INTO `log` VALUES (1489, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-11 21:43:24.094000', 1);
INSERT INTO `log` VALUES (1490, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-11 21:45:03.331000', 1);
INSERT INTO `log` VALUES (1491, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-11 21:48:12.640000', 1);
INSERT INTO `log` VALUES (1492, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-11 21:49:20.541000', 1);
INSERT INTO `log` VALUES (1493, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-11 21:52:03.785000', 1);
INSERT INTO `log` VALUES (1494, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-11 21:55:32.823000', 1);
INSERT INTO `log` VALUES (1495, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-11 22:01:49.351000', 1);
INSERT INTO `log` VALUES (1496, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-11 22:04:15.866000', 1);
INSERT INTO `log` VALUES (1497, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-11 22:15:10.956000', 1);
INSERT INTO `log` VALUES (1498, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-12 09:36:00.536000', 1);
INSERT INTO `log` VALUES (1499, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-12 09:59:15.369000', 1);
INSERT INTO `log` VALUES (1500, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-12 10:02:37.381000', 1);
INSERT INTO `log` VALUES (1501, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-12 10:07:43.669000', 1);
INSERT INTO `log` VALUES (1502, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-12 10:09:59.518000', 1);
INSERT INTO `log` VALUES (1503, 'admin', '管理员', '系统管理', '查询系统功能', 'http://localhost:8088/system/functionInfo', '127.0.0.1', '2022-03-12 10:12:42.925000', 1);
INSERT INTO `log` VALUES (1504, 'admin', '管理员', '系统管理', '禁用功能', 'http://localhost:8088/system/banFunctionById', '127.0.0.1', '2022-03-12 10:12:51.450000', 1);
INSERT INTO `log` VALUES (1505, 'admin', '管理员', '系统管理', '查询系统功能', 'http://localhost:8088/system/functionInfo', '127.0.0.1', '2022-03-12 10:12:53.229000', 1);
INSERT INTO `log` VALUES (1506, 'admin', '管理员', '系统管理', '查询系统功能', 'http://localhost:8088/system/functionInfo', '127.0.0.1', '2022-03-12 10:12:55.492000', 1);
INSERT INTO `log` VALUES (1507, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-12 11:54:21.260000', 1);
INSERT INTO `log` VALUES (1508, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-12 11:56:59.755000', 1);
INSERT INTO `log` VALUES (1509, 'admin', '管理员', '计量单位', '查询计量单位信息', 'http://localhost:8088/commodity/measureInfo', '127.0.0.1', '2022-03-12 11:57:03.931000', 1);
INSERT INTO `log` VALUES (1510, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-12 12:01:41.361000', 1);
INSERT INTO `log` VALUES (1511, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-12 12:06:05.945000', 1);
INSERT INTO `log` VALUES (1512, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-12 12:08:39.587000', 1);
INSERT INTO `log` VALUES (1513, 'admin', '管理员', '系统管理', '查询系统功能', 'http://localhost:8088/system/functionInfo', '127.0.0.1', '2022-03-12 12:09:41.913000', 1);
INSERT INTO `log` VALUES (1514, 'admin', '管理员', '系统管理', '查询日志信息', 'http://localhost:8088/system/log', '127.0.0.1', '2022-03-12 12:10:11.795000', 1);
INSERT INTO `log` VALUES (1515, 'admin', '管理员', '系统管理', '查询用户信息', 'http://localhost:8088/system/userInfo', '127.0.0.1', '2022-03-12 12:10:14.263000', 1);
INSERT INTO `log` VALUES (1516, 'admin', '管理员', '系统管理', '添加用户', 'http://localhost:8088/system/addUser', '127.0.0.1', '2022-03-12 12:11:41.376000', 1);
INSERT INTO `log` VALUES (1517, 'admin', '管理员', '系统管理', '查询用户信息', 'http://localhost:8088/system/userInfo', '127.0.0.1', '2022-03-12 12:11:43.095000', 1);
INSERT INTO `log` VALUES (1518, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-12 14:24:12.220000', 1);
INSERT INTO `log` VALUES (1519, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-12 14:26:08.595000', 1);
INSERT INTO `log` VALUES (1520, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-12 14:30:47.777000', 1);
INSERT INTO `log` VALUES (1521, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-12 14:32:03.209000', 1);
INSERT INTO `log` VALUES (1522, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-12 14:32:37.507000', 1);
INSERT INTO `log` VALUES (1523, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-12 14:35:10.722000', 1);
INSERT INTO `log` VALUES (1524, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-12 14:36:09.163000', 1);
INSERT INTO `log` VALUES (1525, 'admin', '管理员', '用户管理', '更新本人信息', 'http://localhost:8088/user/updInfo', '127.0.0.1', '2022-03-12 14:37:02.784000', 1);
INSERT INTO `log` VALUES (1526, 'admin', '管理员', '用户管理', '更新本人信息', 'http://localhost:8088/user/updInfo', '127.0.0.1', '2022-03-12 14:37:15.519000', 1);
INSERT INTO `log` VALUES (1527, 'admin', '管理员', '系统管理', '查询用户信息', 'http://localhost:8088/system/userInfo', '127.0.0.1', '2022-03-12 14:37:32.326000', 1);
INSERT INTO `log` VALUES (1528, 'admin', '管理员', '系统管理', '修改用户信息', 'http://localhost:8088/system/editUserInfo', '127.0.0.1', '2022-03-12 14:39:45.059000', 1);
INSERT INTO `log` VALUES (1529, 'admin', '管理员', '系统管理', '查询用户信息', 'http://localhost:8088/system/userInfo', '127.0.0.1', '2022-03-12 14:39:46.771000', 1);
INSERT INTO `log` VALUES (1530, 'admin', '管理员', '系统管理', '修改用户信息', 'http://localhost:8088/system/editUserInfo', '127.0.0.1', '2022-03-12 14:39:58.054000', 1);
INSERT INTO `log` VALUES (1531, 'admin', '管理员', '系统管理', '查询用户信息', 'http://localhost:8088/system/userInfo', '127.0.0.1', '2022-03-12 14:39:59.760000', 1);
INSERT INTO `log` VALUES (1532, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-12 14:44:16.917000', 1);
INSERT INTO `log` VALUES (1533, 'admin', '管理员', '系统管理', '查询用户信息', 'http://localhost:8088/system/userInfo', '127.0.0.1', '2022-03-12 14:44:20.131000', 1);
INSERT INTO `log` VALUES (1534, 'admin', '管理员', '系统管理', '修改用户信息', 'http://localhost:8088/system/editUserInfo', '127.0.0.1', '2022-03-12 14:44:23.189000', 1);
INSERT INTO `log` VALUES (1535, 'admin', '管理员', '系统管理', '查询用户信息', 'http://localhost:8088/system/userInfo', '127.0.0.1', '2022-03-12 14:44:24.911000', 1);
INSERT INTO `log` VALUES (1536, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-12 14:45:25.045000', 1);
INSERT INTO `log` VALUES (1537, 'admin', '管理员', '系统管理', '查询用户信息', 'http://localhost:8088/system/userInfo', '127.0.0.1', '2022-03-12 14:45:28.419000', 1);
INSERT INTO `log` VALUES (1538, 'admin', '管理员', '系统管理', '修改用户信息', 'http://localhost:8088/system/editUserInfo', '127.0.0.1', '2022-03-12 14:45:32.388000', 1);
INSERT INTO `log` VALUES (1539, 'admin', '管理员', '系统管理', '查询用户信息', 'http://localhost:8088/system/userInfo', '127.0.0.1', '2022-03-12 14:45:34.080000', 1);
INSERT INTO `log` VALUES (1540, 'admin', '管理员', '系统管理', '修改用户信息', 'http://localhost:8088/system/editUserInfo', '127.0.0.1', '2022-03-12 14:45:55.772000', 1);
INSERT INTO `log` VALUES (1541, 'admin', '管理员', '系统管理', '查询用户信息', 'http://localhost:8088/system/userInfo', '127.0.0.1', '2022-03-12 14:45:57.481000', 1);
INSERT INTO `log` VALUES (1542, 'admin', '管理员', '系统管理', '查询日志信息', 'http://localhost:8088/system/log', '127.0.0.1', '2022-03-12 14:46:35.305000', 1);
INSERT INTO `log` VALUES (1543, 'admin', '管理员', '系统管理', '查询系统功能', 'http://localhost:8088/system/functionInfo', '127.0.0.1', '2022-03-12 14:46:36.441000', 1);
INSERT INTO `log` VALUES (1544, 'admin', '管理员', '系统管理', '查询用户信息', 'http://localhost:8088/system/userInfo', '127.0.0.1', '2022-03-12 14:46:37.092000', 1);
INSERT INTO `log` VALUES (1545, 'admin1', '小王', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-12 14:46:52.117000', 1);
INSERT INTO `log` VALUES (1546, 'admin1', '小王', '商品管理', '查询商品类别信息', 'http://localhost:8088/commodity/categoryInfo', '127.0.0.1', '2022-03-12 14:47:00.188000', 1);
INSERT INTO `log` VALUES (1547, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-12 14:47:20.220000', 1);
INSERT INTO `log` VALUES (1548, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-12 14:55:39.989000', 1);
INSERT INTO `log` VALUES (1549, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-12 15:31:18.734000', 1);
INSERT INTO `log` VALUES (1550, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-12 15:31:42.126000', 1);
INSERT INTO `log` VALUES (1551, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-12 15:37:55.174000', 1);
INSERT INTO `log` VALUES (1552, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-12 15:51:56.125000', 1);
INSERT INTO `log` VALUES (1553, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-12 15:55:06.154000', 1);
INSERT INTO `log` VALUES (1554, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-12 15:55:47.622000', 1);
INSERT INTO `log` VALUES (1555, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-12 15:59:48.368000', 1);
INSERT INTO `log` VALUES (1556, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-12 16:02:08.193000', 1);
INSERT INTO `log` VALUES (1557, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-12 16:05:30.904000', 1);
INSERT INTO `log` VALUES (1558, 'admin', '管理员', '基本资料', '查询供应商信息', 'http://localhost:8088/info/supplierInfo', '127.0.0.1', '2022-03-12 16:06:15.521000', 1);
INSERT INTO `log` VALUES (1559, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-12 19:19:15.739000', 1);
INSERT INTO `log` VALUES (1560, 'admin', '管理员', '销售出库', '商品出库审核确认', 'http://localhost:8088/out/completeOrder', '127.0.0.1', '2022-03-12 19:25:17.959000', 1);
INSERT INTO `log` VALUES (1561, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-12 19:32:19.746000', 1);
INSERT INTO `log` VALUES (1562, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-12 19:33:21.482000', 1);
INSERT INTO `log` VALUES (1563, 'admin', '管理员', '用户', '用户登录', 'http://localhost:8088/login', '127.0.0.1', '2022-03-12 22:13:35.503000', 1);
INSERT INTO `log` VALUES (1564, 'admin', '管理员', '商品信息', '查询商品信息', 'http://localhost:8088/commodity/goodsInfo', '127.0.0.1', '2022-03-12 22:14:39.684000', 1);
INSERT INTO `log` VALUES (1565, 'admin', '管理员', '计量单位', '查询计量单位信息', 'http://localhost:8088/commodity/measureInfo', '127.0.0.1', '2022-03-12 22:15:13.930000', 1);
INSERT INTO `log` VALUES (1566, 'admin', '管理员', '商品信息', '添加商品信息', 'http://localhost:8088/commodity/addGoods', '127.0.0.1', '2022-03-12 22:15:34.129000', 1);
INSERT INTO `log` VALUES (1567, 'admin', '管理员', '商品信息', '查询商品信息', 'http://localhost:8088/commodity/goodsInfo', '127.0.0.1', '2022-03-12 22:15:35.793000', 1);
INSERT INTO `log` VALUES (1568, 'admin', '管理员', '商品信息', '查询商品信息', 'http://localhost:8088/commodity/goodsInfo', '127.0.0.1', '2022-03-12 22:16:05.657000', 1);
INSERT INTO `log` VALUES (1569, 'admin', '管理员', '计量单位', '查询计量单位信息', 'http://localhost:8088/commodity/measureInfo', '127.0.0.1', '2022-03-12 22:16:24.822000', 1);
INSERT INTO `log` VALUES (1570, 'admin', '管理员', '商品信息', '添加商品信息', 'http://localhost:8088/commodity/addGoods', '127.0.0.1', '2022-03-12 22:16:43.592000', 1);
INSERT INTO `log` VALUES (1571, 'admin', '管理员', '商品信息', '查询商品信息', 'http://localhost:8088/commodity/goodsInfo', '127.0.0.1', '2022-03-12 22:16:45.258000', 1);
INSERT INTO `log` VALUES (1572, 'admin', '管理员', '商品管理', '查询商品类别信息', 'http://localhost:8088/commodity/categoryInfo', '127.0.0.1', '2022-03-12 22:16:52.705000', 1);
INSERT INTO `log` VALUES (1573, 'admin', '管理员', '商品信息', '查询商品信息', 'http://localhost:8088/commodity/goodsInfo', '127.0.0.1', '2022-03-12 22:16:54.074000', 1);

-- ----------------------------
-- Table structure for measure
-- ----------------------------
DROP TABLE IF EXISTS `measure`;
CREATE TABLE `measure`  (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of measure
-- ----------------------------
INSERT INTO `measure` VALUES (1, '包', 1, 'baobaobaobaobao');
INSERT INTO `measure` VALUES (2, '箱', 1, 'xiangxiangxiang');
INSERT INTO `measure` VALUES (3, '瓶', 1, '饮料、瓶装物');
INSERT INTO `measure` VALUES (4, '只', 1, 'zhizhizhizhizhi\'');
INSERT INTO `measure` VALUES (5, '升', 1, '1L=1000ml\n');
INSERT INTO `measure` VALUES (6, '米', 1, 'm');
INSERT INTO `measure` VALUES (7, '千米', 1, 'km， 1km=1000m');
INSERT INTO `measure` VALUES (8, '包', 1, '一包两包牛奶的包');

-- ----------------------------
-- Table structure for member
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member`  (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `discount` double(10, 2) NULL DEFAULT NULL COMMENT '折扣',
  `status` tinyint(1) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO `member` VALUES (1, '零售', '000', '000', 0.00, 1, '零售专用');
INSERT INTO `member` VALUES (2, '夏丽', '1548444655', '1245132453@qq.com', 0.00, 1, '安安哈哈哈哈');
INSERT INTO `member` VALUES (3, '小张', '1', '1', 1.00, 0, '1');
INSERT INTO `member` VALUES (4, '小李', '11', '1111', 11.00, 0, '1');
INSERT INTO `member` VALUES (5, '小蒋', '22', '2', 2.00, 0, '22');
INSERT INTO `member` VALUES (6, '小王', '13222313212', '1322231321@qq.com', 5.00, 1, '小王小王，周末常来哦！');

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `id` bigint(32) UNSIGNED NOT NULL COMMENT '订单id',
  `type` int(5) NOT NULL COMMENT '订单类型（入库、出库）',
  `list` bigint(32) NULL DEFAULT NULL COMMENT '订单信息',
  `origin` int(5) NULL DEFAULT NULL COMMENT '供应商或会员等信息',
  `accountId` int(20) NULL DEFAULT NULL COMMENT '账户id',
  `moneyAmount` decimal(10, 2) NULL DEFAULT NULL COMMENT '订单总金额',
  `handsPersonId` int(20) NULL DEFAULT NULL COMMENT '经办人',
  `createTime` timestamp(0) NULL DEFAULT NULL COMMENT '创建日期',
  `updateTime` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新日期',
  `status` int(1) NULL DEFAULT NULL COMMENT '订单状态(未审核、已审核)',
  `deleteFlag` int(1) NULL DEFAULT NULL COMMENT '删除标记',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES (251117050209112064, 0, 251117222444011520, 1, 1, 106.70, 1, '2022-02-05 14:02:37', '2022-03-12 16:17:07', 2, 0, '此订单由山东临工联合蒙牛乳业提供');
INSERT INTO `order` VALUES (252514663366004736, 0, 252514706936434688, 2, 1, 0.00, 1, '2022-03-05 10:48:01', '2022-03-07 14:29:43', 2, 0, 'wocao');
INSERT INTO `order` VALUES (253987830471200768, 0, 253987999195467776, 4, 1, 0.00, 1, '2022-03-04 23:26:18', '2022-03-04 23:26:18', 0, 0, '啊大叔');
INSERT INTO `order` VALUES (255112244340330496, 0, 255112278507130880, 3, 10, 0.00, 1, '2022-03-05 16:09:36', '2022-03-09 14:40:03', 2, 0, '103');
INSERT INTO `order` VALUES (255812389247782912, 1, 255812442544803840, 3, 1, 0.00, 1, '2022-03-07 14:31:48', '2022-03-07 17:31:07', 7, 0, '阿达');
INSERT INTO `order` VALUES (255846896940224512, 0, 255846923121070080, 2, 10, 0.00, 1, '2022-03-07 16:48:49', NULL, 0, 0, '');
INSERT INTO `order` VALUES (255853017641914368, 0, 255853063787646976, 2, 10, 0.00, 1, '2022-03-07 17:13:13', '2022-03-07 17:13:36', 1, 0, '010');
INSERT INTO `order` VALUES (255863566702350336, 1, 255863595659825152, 2, 10, 0.00, 1, '2022-03-07 17:55:04', '2022-03-07 17:58:03', 5, 0, '');
INSERT INTO `order` VALUES (255864788003983360, 1, 255864843037446144, 3, 1, 0.00, 1, '2022-03-07 18:00:01', '2022-03-11 09:52:25', 7, 0, '0.0.0.0.0');
INSERT INTO `order` VALUES (255924114936696832, 1, 255924165494837248, 6, 10, 0.00, 1, '2022-03-07 21:55:45', '2022-03-07 21:57:11', 9, 0, '啊啊啊');
INSERT INTO `order` VALUES (256169804342366208, 0, 256169842149822464, 4, 10, 0.00, 1, '2022-03-08 14:11:59', '2022-03-12 10:00:43', 4, 0, '1');
INSERT INTO `order` VALUES (256547276770643968, 1, 256547312959098880, 1, 10, 0.00, 1, '2022-03-09 15:11:55', '2022-03-11 09:51:25', 9, 0, '啊啊啊啊啊');
INSERT INTO `order` VALUES (257556289524207616, 1, 257556327742705664, 1, 1, 0.00, 1, '2022-03-12 10:01:23', '2022-03-12 10:03:32', 8, 0, '11');
INSERT INTO `order` VALUES (257557121581846528, 0, 257557164560879616, 3, 10, 0.00, 1, '2022-03-12 10:04:42', '2022-03-12 10:10:13', 3, 0, '啊啊啊');
INSERT INTO `order` VALUES (257697997402542080, 1, 257698057540472832, 1, 1, 0.00, 1, '2022-03-12 19:24:34', '2022-03-12 19:25:17', 7, 0, '100');

-- ----------------------------
-- Table structure for order_list
-- ----------------------------
DROP TABLE IF EXISTS `order_list`;
CREATE TABLE `order_list`  (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `orderId` bigint(32) NOT NULL COMMENT '订单详情信息id',
  `goodsId` int(20) NULL DEFAULT NULL COMMENT '商品id',
  `number` int(20) NULL DEFAULT NULL COMMENT '商品数量',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '单价',
  `storeId` int(20) NULL DEFAULT NULL COMMENT '仓库id',
  `deleteFlag` int(2) NULL DEFAULT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 55 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_list
-- ----------------------------
INSERT INTO `order_list` VALUES (1, 251117222444011520, 1, 10, 5.50, 1, 0);
INSERT INTO `order_list` VALUES (2, 251117222444011520, 2, 10, 5.17, 1, 0);
INSERT INTO `order_list` VALUES (9, 252514706936434688, 1, 16, 2.50, 2, 0);
INSERT INTO `order_list` VALUES (10, 252514706936434688, 2, 11, 4.80, 2, 0);
INSERT INTO `order_list` VALUES (11, 252514706936434688, 3, 24, 5.00, 2, 0);
INSERT INTO `order_list` VALUES (12, 252514706936434688, 4, 10, 2.50, 2, 0);
INSERT INTO `order_list` VALUES (17, 253987999195467776, 1, 10, 5.00, 1, 0);
INSERT INTO `order_list` VALUES (18, 253987999195467776, 2, NULL, NULL, 1, 0);
INSERT INTO `order_list` VALUES (19, 253987999195467776, 3, NULL, NULL, 1, 0);
INSERT INTO `order_list` VALUES (20, 253987999195467776, 4, NULL, NULL, 1, 0);
INSERT INTO `order_list` VALUES (22, 255097939393908736, 1, NULL, NULL, 1, 0);
INSERT INTO `order_list` VALUES (23, 255099842429325312, 1, 10, 5.00, 2, 0);
INSERT INTO `order_list` VALUES (24, 255104718043484160, 2, NULL, NULL, 1, 0);
INSERT INTO `order_list` VALUES (25, 255107932344160256, 1, 2, 10.00, 2, 0);
INSERT INTO `order_list` VALUES (26, 255109974471086080, 1, 1, 1.00, 1, 0);
INSERT INTO `order_list` VALUES (27, 255112278507130880, 1, 2, 5.50, 1, 0);
INSERT INTO `order_list` VALUES (28, 255812442544803840, 1, 15, 5.00, 1, 0);
INSERT INTO `order_list` VALUES (32, 255846923121070080, 1, NULL, NULL, 1, 0);
INSERT INTO `order_list` VALUES (33, 255846923121070080, 2, NULL, NULL, 1, 0);
INSERT INTO `order_list` VALUES (34, 255846923121070080, 3, NULL, NULL, 1, 0);
INSERT INTO `order_list` VALUES (35, 255846923121070080, 4, NULL, NULL, 1, 0);
INSERT INTO `order_list` VALUES (40, 255853063787646976, 1, 1000, 100000.00, 1, 0);
INSERT INTO `order_list` VALUES (41, 255853063787646976, 2, NULL, NULL, 1, 0);
INSERT INTO `order_list` VALUES (42, 255853063787646976, 3, NULL, NULL, 1, 0);
INSERT INTO `order_list` VALUES (43, 255853063787646976, 4, NULL, NULL, 1, 0);
INSERT INTO `order_list` VALUES (44, 255863595659825152, 1, NULL, NULL, 1, 0);
INSERT INTO `order_list` VALUES (45, 255863595659825152, 2, NULL, NULL, 1, 0);
INSERT INTO `order_list` VALUES (46, 255863595659825152, 3, NULL, NULL, 1, 0);
INSERT INTO `order_list` VALUES (47, 255863595659825152, 4, NULL, NULL, 1, 0);
INSERT INTO `order_list` VALUES (48, 255864843037446144, 1, 10, 2.50, 1, 0);
INSERT INTO `order_list` VALUES (49, 255924165494837248, 1, 1, 3.00, 1, 0);
INSERT INTO `order_list` VALUES (50, 256169842149822464, 1, 1, 1.00, 1, 0);
INSERT INTO `order_list` VALUES (51, 256547312959098880, 1, 1, 1.00, 1, 0);
INSERT INTO `order_list` VALUES (52, 257556327742705664, 1, NULL, NULL, 1, 0);
INSERT INTO `order_list` VALUES (53, 257557164560879616, 1, 0, 0.00, 1, 0);
INSERT INTO `order_list` VALUES (54, 257698057540472832, 1, 1, 5.00, 1, 0);

-- ----------------------------
-- Table structure for order_log
-- ----------------------------
DROP TABLE IF EXISTS `order_log`;
CREATE TABLE `order_log`  (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `type` int(5) NULL DEFAULT NULL,
  `orderId` bigint(32) NULL DEFAULT NULL,
  `money` decimal(20, 2) NULL DEFAULT NULL,
  `account` int(11) NULL DEFAULT NULL,
  `origin` int(20) NULL DEFAULT NULL,
  `date` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_log
-- ----------------------------
INSERT INTO `order_log` VALUES (16, 0, 251117050209112064, 106.70, 1, 1, '2022-03-07 14:18:05');
INSERT INTO `order_log` VALUES (17, 0, 252514663366004736, 237.80, 1, 2, '2022-03-07 14:29:43');
INSERT INTO `order_log` VALUES (18, 0, 255812389247782912, 325.00, 1, 3, '2022-03-07 14:32:36');
INSERT INTO `order_log` VALUES (19, 1, 255112244340330496, 11.00, 10, 3, '2022-03-07 14:40:04');
INSERT INTO `order_log` VALUES (20, 1, 255812389247782912, 325.00, 1, 3, '2022-03-07 14:41:18');
INSERT INTO `order_log` VALUES (21, 1, 255812389247782912, 50.00, 1, 3, '2022-03-07 14:42:55');
INSERT INTO `order_log` VALUES (23, 2, 255812389247782912, 75.00, 1, 3, '2022-03-07 17:31:07');
INSERT INTO `order_log` VALUES (24, 3, 255924114936696832, 3.00, 10, 6, '2022-03-07 21:57:12');
INSERT INTO `order_log` VALUES (25, 3, 256547276770643968, 1.00, 10, 1, '2022-03-11 09:51:25');
INSERT INTO `order_log` VALUES (26, 2, 255864788003983360, 25.00, 1, 3, '2022-03-11 09:52:26');
INSERT INTO `order_log` VALUES (27, 1, 256169804342366208, 1.00, 10, 4, '2022-03-12 10:00:43');
INSERT INTO `order_log` VALUES (29, 1, 257557121581846528, 0.00, 10, 3, '2022-03-12 10:08:05');
INSERT INTO `order_log` VALUES (30, 2, 257697997402542080, 5.00, 1, 1, '2022-03-12 19:25:18');

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `id` int(11) NOT NULL,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES (1, 'ROLE_USER');
INSERT INTO `roles` VALUES (5, 'ROLE_ADMIN');

-- ----------------------------
-- Table structure for roles_admin
-- ----------------------------
DROP TABLE IF EXISTS `roles_admin`;
CREATE TABLE `roles_admin`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roleid` int(11) NULL DEFAULT NULL,
  `adminid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles_admin
-- ----------------------------
INSERT INTO `roles_admin` VALUES (1, 5, 1);
INSERT INTO `roles_admin` VALUES (2, 1, 2);
INSERT INTO `roles_admin` VALUES (3, 1, 3);
INSERT INTO `roles_admin` VALUES (14, 5, 14);
INSERT INTO `roles_admin` VALUES (15, 1, 15);
INSERT INTO `roles_admin` VALUES (16, 1, 16);

-- ----------------------------
-- Table structure for store
-- ----------------------------
DROP TABLE IF EXISTS `store`;
CREATE TABLE `store`  (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '仓库id',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` tinyint(1) NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of store
-- ----------------------------
INSERT INTO `store` VALUES (1, '默认仓库', '山东临沂', 1, '本仓库容量为默认仓库');
INSERT INTO `store` VALUES (2, '仓库一号', '北京四环', 1, '本仓库容量大，可作为中转中心！');

-- ----------------------------
-- Table structure for store_inventory
-- ----------------------------
DROP TABLE IF EXISTS `store_inventory`;
CREATE TABLE `store_inventory`  (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `storeId` int(20) NULL DEFAULT NULL,
  `goodsId` int(20) NULL DEFAULT NULL,
  `inventory` int(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of store_inventory
-- ----------------------------
INSERT INTO `store_inventory` VALUES (32, 1, 1, 8);
INSERT INTO `store_inventory` VALUES (33, 1, 2, 45);
INSERT INTO `store_inventory` VALUES (34, 2, 1, 66);
INSERT INTO `store_inventory` VALUES (35, 2, 2, 55);
INSERT INTO `store_inventory` VALUES (36, 2, 3, 45);
INSERT INTO `store_inventory` VALUES (37, 2, 4, 40);
INSERT INTO `store_inventory` VALUES (40, 1, 4, 5);

-- ----------------------------
-- Table structure for store_log
-- ----------------------------
DROP TABLE IF EXISTS `store_log`;
CREATE TABLE `store_log`  (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `type` int(5) NULL DEFAULT NULL,
  `storeId` int(20) NULL DEFAULT NULL,
  `goodsId` int(20) NULL DEFAULT NULL,
  `number` int(20) NULL DEFAULT NULL,
  `person` int(20) NULL DEFAULT NULL,
  `date` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 75 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of store_log
-- ----------------------------
INSERT INTO `store_log` VALUES (34, 0, 1, 1, 10, 1, '2022-03-07 14:18:05');
INSERT INTO `store_log` VALUES (35, 0, 1, 2, 10, 1, '2022-03-07 14:18:05');
INSERT INTO `store_log` VALUES (36, 0, 2, 1, 16, 1, '2022-03-07 14:29:43');
INSERT INTO `store_log` VALUES (37, 0, 2, 2, 11, 1, '2022-03-07 14:29:43');
INSERT INTO `store_log` VALUES (38, 0, 2, 3, 24, 1, '2022-03-07 14:29:43');
INSERT INTO `store_log` VALUES (39, 0, 2, 4, 10, 1, '2022-03-07 14:29:43');
INSERT INTO `store_log` VALUES (40, 0, 1, 1, 10, 1, '2022-03-07 14:32:36');
INSERT INTO `store_log` VALUES (41, 0, 1, 2, 10, 1, '2022-03-07 14:32:36');
INSERT INTO `store_log` VALUES (42, 0, 2, 3, 10, 1, '2022-03-07 14:32:36');
INSERT INTO `store_log` VALUES (43, 0, 2, 4, 15, 1, '2022-03-07 14:32:36');
INSERT INTO `store_log` VALUES (44, 1, 1, 1, 2, 1, '2022-03-07 14:40:04');
INSERT INTO `store_log` VALUES (45, 1, 1, 1, 10, 1, '2022-03-07 14:41:18');
INSERT INTO `store_log` VALUES (46, 1, 1, 2, 10, 1, '2022-03-07 14:41:18');
INSERT INTO `store_log` VALUES (47, 1, 2, 3, 10, 1, '2022-03-07 14:41:18');
INSERT INTO `store_log` VALUES (48, 1, 2, 4, 15, 1, '2022-03-07 14:41:18');
INSERT INTO `store_log` VALUES (49, 1, 1, 1, 10, 1, '2022-03-07 14:42:55');
INSERT INTO `store_log` VALUES (54, 1, 1, 1, 15, 1, '2022-03-07 17:31:07');
INSERT INTO `store_log` VALUES (55, 0, 1, 1, 1, 1, '2022-03-07 21:57:12');
INSERT INTO `store_log` VALUES (56, 3, 1, 4, 10, 1, '2022-03-09 15:19:51');
INSERT INTO `store_log` VALUES (57, 4, 1, 4, 5, 1, '2022-03-09 15:23:03');
INSERT INTO `store_log` VALUES (58, 3, 1, 1, 1, 1, '2022-03-10 11:22:51');
INSERT INTO `store_log` VALUES (67, 5, 1, 1, 11, 1, '2022-03-10 14:51:07');
INSERT INTO `store_log` VALUES (68, 6, 2, 1, 11, 1, '2022-03-10 14:51:07');
INSERT INTO `store_log` VALUES (69, 0, 1, 1, 1, 1, '2022-03-11 09:51:25');
INSERT INTO `store_log` VALUES (70, 1, 1, 1, 10, 1, '2022-03-11 09:52:26');
INSERT INTO `store_log` VALUES (71, 8, 1, 1, 1, 1, '2022-03-12 10:00:43');
INSERT INTO `store_log` VALUES (74, 1, 1, 1, 1, 1, '2022-03-12 19:25:18');

-- ----------------------------
-- Table structure for store_outin
-- ----------------------------
DROP TABLE IF EXISTS `store_outin`;
CREATE TABLE `store_outin`  (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `storeOut` int(20) NULL DEFAULT NULL,
  `goodsId` int(20) NULL DEFAULT NULL,
  `number` int(20) NULL DEFAULT NULL,
  `storeIn` int(20) NULL DEFAULT NULL,
  `creatTime` datetime(0) NULL DEFAULT NULL,
  `status` int(5) NULL DEFAULT NULL,
  `deleteFlag` int(5) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of store_outin
-- ----------------------------
INSERT INTO `store_outin` VALUES (1, 1, 1, 1, 2, '2022-03-09 18:28:14', 1, 0);
INSERT INTO `store_outin` VALUES (2, 1, 1, 11, 2, '2022-03-10 14:13:12', 0, 1);
INSERT INTO `store_outin` VALUES (3, 1, 1, 11, 2, '2022-03-10 14:36:56', 1, 0);

-- ----------------------------
-- Table structure for supplier
-- ----------------------------
DROP TABLE IF EXISTS `supplier`;
CREATE TABLE `supplier`  (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '供应商名称',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '供应商地址',
  `fax` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '传真',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `account_id` int(255) NULL DEFAULT NULL COMMENT '账户',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `status` int(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of supplier
-- ----------------------------
INSERT INTO `supplier` VALUES (1, '临工', '15649765249', '山东省', '15647-4567', '4567564876@qq.com', 1, '山东临工，可靠承载重托！', 1);
INSERT INTO `supplier` VALUES (2, '鲁南制药集团', '15626589651', '山东省', '58454-5184', '2545645645@qq.com', 2, '制药哈哈哈哈哈哈哈哈还好还好嘿嘿', 1);
INSERT INTO `supplier` VALUES (3, '蒙牛乳业', '1548951647', '内蒙古呼伦贝尔市', '1555-84653', '1548965@qq.com', 10, '蒙牛乳业，棒棒棒！', 1);
INSERT INTO `supplier` VALUES (4, '伊利乳业', '1569846584', '新疆乌鲁木齐', '1564-4878', '156465457@qq.com', 15, '伊利乳业，卡哇伊~', 1);
INSERT INTO `supplier` VALUES (5, '可口可乐公司', '862131301000', '美国佐治亚州', '8621-61928020', '15848548@qq.com', 16, '可口可乐公司(The Coca-Cola Company),成立于1886年5月8日,总部设在美国佐治亚州(Georgia, 简称GA)的亚特兰大,是全球最大的饮料公司。', 1);

-- ----------------------------
-- Table structure for system_menu
-- ----------------------------
DROP TABLE IF EXISTS `system_menu`;
CREATE TABLE `system_menu`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `pid` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '父ID',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '菜单图标',
  `href` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '链接',
  `target` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '_self' COMMENT '链接打开方式',
  `sort` int(11) NULL DEFAULT 0 COMMENT '菜单排序',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态(0:禁用,1:启用)',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  `create_at` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_at` timestamp(0) NULL DEFAULT NULL COMMENT '更新时间',
  `delete_at` timestamp(0) NULL DEFAULT NULL COMMENT '删除时间',
  `roleid` int(2) NOT NULL COMMENT '所需角色id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `title`(`title`) USING BTREE,
  INDEX `href`(`href`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统菜单表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of system_menu
-- ----------------------------
INSERT INTO `system_menu` VALUES (1, 0, '入库管理', 'fa fa-arrow-right', '', '_self', 0, 1, '一级菜单', '2021-11-16 15:09:17', '2021-11-16 15:09:17', NULL, 1);
INSERT INTO `system_menu` VALUES (2, 1, '采购订单', 'fa fa-file-text-o', '/purchase/order', '_self', 0, 1, '', '2021-11-16 15:09:17', '2021-11-16 15:09:17', NULL, 1);
INSERT INTO `system_menu` VALUES (3, 1, '采购入库', 'fa fa-share', '/purchase/enter', '_self', 0, 1, '', '2021-11-16 15:09:17', '2021-11-16 15:09:17', NULL, 1);
INSERT INTO `system_menu` VALUES (4, 1, '采购退货', 'fa fa-reply', '/purchase/back', '_self', 0, 1, '', '2021-11-16 15:09:17', '2021-11-16 15:09:17', NULL, 1);
INSERT INTO `system_menu` VALUES (5, 0, '出库管理', 'fa fa-arrow-left', '', '_self', 0, 1, '一级菜单', '2021-11-16 15:09:17', '2021-11-16 15:09:17', NULL, 1);
INSERT INTO `system_menu` VALUES (6, 5, '出库订单', 'fa fa-file-text-o', '/out/order', '_self', 0, 1, '', '2021-11-16 15:09:17', '2021-11-16 15:09:17', NULL, 1);
INSERT INTO `system_menu` VALUES (7, 5, '销售出库', 'fa fa-mail-reply', '/out/sale', '_self', 0, 1, '', '2021-11-16 15:09:17', '2021-11-16 15:09:17', NULL, 1);
INSERT INTO `system_menu` VALUES (8, 5, '销售退货', 'fa fa-share\r\n', '/out/back', '_self', 0, 1, '', '2021-11-16 15:09:17', '2021-11-16 15:09:17', NULL, 1);
INSERT INTO `system_menu` VALUES (9, 0, '仓储管理', 'fa \r\nfa fa-cubes', '', '_self', 0, 1, '一级菜单', '2021-11-16 15:09:17', '2021-11-16 15:09:17', NULL, 1);
INSERT INTO `system_menu` VALUES (10, 9, '仓库管理', 'fa fa-map-marker', '/depot/manage', '_self', 0, 1, '', '2021-11-16 15:09:17', '2021-11-16 15:09:17', NULL, 1);
INSERT INTO `system_menu` VALUES (11, 9, '调拨出库', 'fa fa-sign-out', '/depot/outin', '_self', 0, 1, NULL, '2021-11-16 15:09:17', '2021-11-16 15:09:17', NULL, 1);
INSERT INTO `system_menu` VALUES (12, 0, '报表查询', 'fa fa-area-chart', '', '_self', 0, 1, '一级菜单', '2021-11-16 15:09:17', '2021-11-16 15:09:17', NULL, 1);
INSERT INTO `system_menu` VALUES (13, 12, '库存状况', 'fa fa-bar-chart', '/report/stock', '_self', 0, 1, NULL, '2021-11-16 15:09:17', '2021-11-16 15:09:17', NULL, 1);
INSERT INTO `system_menu` VALUES (14, 12, '账户统计', 'fa fa-strikethrough', '/report/account', '_self', 0, 1, NULL, '2021-11-16 15:09:17', '2021-11-16 15:09:17', NULL, 1);
INSERT INTO `system_menu` VALUES (15, 12, '进货统计', 'fa fa-sign-in', '/report/purchase', '_self', 0, 1, NULL, '2021-11-16 15:09:17', '2021-11-16 15:09:17', NULL, 1);
INSERT INTO `system_menu` VALUES (16, 12, '销售统计', 'fa fa-line-chart', '/report/sale', '_self', 0, 1, NULL, '2021-11-16 15:09:17', '2021-11-16 15:09:17', NULL, 1);
INSERT INTO `system_menu` VALUES (17, 12, '入库明细', '\r\nfa fa-floppy-o', '/report/in', '_self', 0, 1, NULL, '2021-11-16 15:09:17', '2021-11-16 15:09:17', NULL, 1);
INSERT INTO `system_menu` VALUES (18, 12, '出库明细', 'fa fa-clipboard', '/report/out', '_self', 0, 1, NULL, '2021-11-16 15:09:17', '2021-11-16 15:09:17', NULL, 1);
INSERT INTO `system_menu` VALUES (19, 12, '退货明细', 'fa fa-reply-all', '/report/back', '_self', 0, 1, NULL, '2021-11-16 15:09:17', '2021-11-16 15:09:17', NULL, 1);
INSERT INTO `system_menu` VALUES (20, 12, '供应商对账', 'fa fa-cc-mastercard', '/report/supplier', '_self', 0, 0, NULL, '2021-11-16 15:09:17', '2021-11-16 15:09:17', NULL, 1);
INSERT INTO `system_menu` VALUES (21, 12, '库存预警', 'fa fa-heartbeat', '/report/warning', '_self', 0, 1, NULL, '2021-11-16 15:09:17', '2021-11-16 15:09:17', NULL, 1);
INSERT INTO `system_menu` VALUES (22, 0, '商品管理', 'fa fa-list', '', '_self', 0, 1, '一级菜单', '2021-11-16 15:09:17', '2021-11-16 15:09:17', NULL, 1);
INSERT INTO `system_menu` VALUES (23, 22, '商品类别', 'fa fa-indent', '/commodity/category', '_self', 0, 1, NULL, '2021-11-16 15:09:17', '2021-11-16 15:09:17', NULL, 1);
INSERT INTO `system_menu` VALUES (24, 22, '商品信息', 'fa fa-list-ol', '/commodity/goods', '_self', 0, 1, NULL, '2021-11-16 15:09:17', '2021-11-16 15:09:17', NULL, 1);
INSERT INTO `system_menu` VALUES (25, 22, '计量单位', 'fa fa-superscript', '/commodity/measure', '_self', 0, 1, NULL, '2021-11-16 15:09:17', '2021-11-16 15:09:17', NULL, 1);
INSERT INTO `system_menu` VALUES (26, 0, '基本资料', 'fa fa-th-large', '', '_self', 0, 1, '一级菜单', '2021-11-16 15:09:17', '2021-11-16 15:09:17', NULL, 5);
INSERT INTO `system_menu` VALUES (27, 26, '供应商信息', '\r\nfa fa-th-list', 'info/supplier', '_self', 0, 1, NULL, '2021-11-16 15:09:17', '2021-11-16 15:09:17', NULL, 5);
INSERT INTO `system_menu` VALUES (28, 26, '客户信息', 'fa fa-group', '/info/member', '_self', 0, 1, NULL, '2021-11-16 15:09:17', '2021-11-16 15:09:17', NULL, 5);
INSERT INTO `system_menu` VALUES (29, 26, '员工信息', 'fa fa-male', '/info/staff', '_self', 0, 0, NULL, '2021-11-16 15:09:17', '2021-11-16 15:09:17', NULL, 5);
INSERT INTO `system_menu` VALUES (30, 26, '账户信息', 'fa fa-cc-paypal', '/info/account', '_self', 0, 1, NULL, '2021-11-16 15:09:17', '2021-11-16 15:09:17', NULL, 5);
INSERT INTO `system_menu` VALUES (31, 26, '仓库信息', 'fa fa-th', '/info/store', '_self', 0, 1, NULL, '2021-11-16 15:09:17', '2021-11-16 15:09:17', NULL, 5);
INSERT INTO `system_menu` VALUES (32, 0, '系统管理', 'fa fa-gears', '', '_self', 0, 1, '一级菜单', '2021-11-16 15:09:17', '2021-11-16 15:09:17', NULL, 5);
INSERT INTO `system_menu` VALUES (33, 32, '角色管理', 'fa fa-street-view', '/system/role', '_self', 0, 0, NULL, '2021-11-16 15:09:17', '2021-11-16 15:09:17', NULL, 5);
INSERT INTO `system_menu` VALUES (34, 32, '用户管理', 'fa fa-user', '/system/user', '_self', 0, 1, NULL, '2021-11-16 15:09:17', '2021-11-16 15:09:17', NULL, 5);
INSERT INTO `system_menu` VALUES (35, 32, '日志管理', 'fa fa-pencil-square-o', '/system/log', '_self', 0, 1, NULL, '2021-11-16 15:09:17', '2021-11-16 15:09:17', NULL, 5);
INSERT INTO `system_menu` VALUES (36, 32, '功能管理', 'fa fa-toggle-on', '/system/function', '_self', 0, 1, NULL, '2021-11-16 15:09:17', '2021-11-16 15:09:17', NULL, 5);
INSERT INTO `system_menu` VALUES (37, 32, '系统配置', 'fa fa-cog', '/system/config', '_self', 0, 0, NULL, '2021-11-16 15:09:17', '2021-11-16 15:09:17', NULL, 5);
INSERT INTO `system_menu` VALUES (38, 32, '机构管理', 'fa fa-bank', '/system/agency', '_self', 0, 0, NULL, '2021-11-16 15:09:17', '2021-11-16 15:09:17', NULL, 5);

SET FOREIGN_KEY_CHECKS = 1;
