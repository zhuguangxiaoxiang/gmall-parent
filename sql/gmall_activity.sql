/*
 Navicat Premium Data Transfer

 Source Server         : gmall
 Source Server Type    : MySQL
 Source Server Version : 80028
 Source Host           : 192.168.200.123:3306
 Source Schema         : gmall_activity

 Target Server Type    : MySQL
 Target Server Version : 80028
 File Encoding         : 65001

 Date: 27/05/2023 16:04:08
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for activity_info
-- ----------------------------
DROP TABLE IF EXISTS `activity_info`;
CREATE TABLE `activity_info`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '活动id',
  `activity_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动名称',
  `activity_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动类型（1：满减，2：折扣）',
  `activity_desc` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动描述',
  `start_time` datetime NULL DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime NULL DEFAULT NULL COMMENT '结束时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_deleted` tinyint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '活动表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of activity_info
-- ----------------------------
INSERT INTO `activity_info` VALUES (1, '屯年货', 'FULL_REDUCTION', '过年买年货啦...啦啦...', '2021-01-17 11:53:51', '2021-07-30 00:00:00', '2023-05-27 11:54:08', '2023-05-27 14:28:29', 0);
INSERT INTO `activity_info` VALUES (2, '迎春节', 'FULL_DISCOUNT', '满量就减减减....', '2021-01-17 11:54:37', '2021-07-30 00:00:00', '2023-05-27 11:55:02', '2023-05-27 14:28:34', 0);
INSERT INTO `activity_info` VALUES (8, '惊喜618', 'FULL_REDUCTION', '减减减', '2021-05-19 00:00:00', '2021-07-30 00:00:00', '2023-05-27 12:13:32', '2023-05-27 14:28:38', 0);

-- ----------------------------
-- Table structure for activity_rule
-- ----------------------------
DROP TABLE IF EXISTS `activity_rule`;
CREATE TABLE `activity_rule`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '编号',
  `activity_id` int NULL DEFAULT NULL COMMENT '类型',
  `condition_amount` decimal(16, 2) NULL DEFAULT NULL COMMENT '满减金额',
  `condition_num` bigint NULL DEFAULT NULL COMMENT '满减件数',
  `benefit_amount` decimal(16, 2) NULL DEFAULT NULL COMMENT '优惠金额',
  `benefit_discount` decimal(10, 2) NULL DEFAULT NULL COMMENT '优惠折扣',
  `benefit_level` bigint NULL DEFAULT NULL COMMENT '优惠级别',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_deleted` tinyint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 78 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '优惠规则' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of activity_rule
-- ----------------------------
INSERT INTO `activity_rule` VALUES (16, 2, NULL, 5, NULL, 9.00, NULL, '2023-05-27 05:26:52', '2023-05-27 05:26:52', 0);
INSERT INTO `activity_rule` VALUES (17, 2, NULL, 10, NULL, 7.00, NULL, '2023-05-27 05:26:52', '2023-05-27 05:26:52', 0);
INSERT INTO `activity_rule` VALUES (18, 1, 5000.00, NULL, 800.00, NULL, NULL, '2023-05-27 05:26:52', '2023-05-27 05:26:52', 0);
INSERT INTO `activity_rule` VALUES (19, 1, 2000.00, NULL, 200.00, NULL, NULL, '2023-05-27 05:26:52', '2023-05-27 05:26:52', 0);
INSERT INTO `activity_rule` VALUES (20, 1, 1000.00, NULL, 100.00, NULL, NULL, '2023-05-27 05:26:52', '2023-05-27 05:26:52', 0);
INSERT INTO `activity_rule` VALUES (46, 8, 1000.00, NULL, 100.00, NULL, NULL, '2023-05-27 05:26:52', '2023-05-27 05:26:52', 0);
INSERT INTO `activity_rule` VALUES (47, 8, 2000.00, NULL, 300.00, NULL, NULL, '2023-05-27 05:26:52', '2023-05-27 05:26:52', 0);
INSERT INTO `activity_rule` VALUES (48, 8, 5000.00, NULL, 800.00, NULL, NULL, '2023-05-27 05:26:52', '2023-05-27 05:26:52', 0);

-- ----------------------------
-- Table structure for activity_sku
-- ----------------------------
DROP TABLE IF EXISTS `activity_sku`;
CREATE TABLE `activity_sku`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `activity_id` bigint NULL DEFAULT NULL COMMENT '活动id ',
  `sku_id` bigint NULL DEFAULT NULL COMMENT 'sku_id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_deleted` tinyint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 56 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '活动参与商品' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of activity_sku
-- ----------------------------
INSERT INTO `activity_sku` VALUES (11, 2, 36, '2023-05-27 06:32:03', '2023-05-27 05:29:14', 0);
INSERT INTO `activity_sku` VALUES (12, 2, 37, '2023-05-27 06:32:03', '2023-05-27 05:29:18', 0);
INSERT INTO `activity_sku` VALUES (13, 1, 30, '2023-05-27 06:59:15', '2023-05-27 05:30:13', 0);
INSERT INTO `activity_sku` VALUES (14, 1, 31, '2023-05-27 06:59:15', '2023-05-27 05:30:17', 0);
INSERT INTO `activity_sku` VALUES (15, 1, 32, '2023-05-27 06:59:16', '2023-05-27 05:30:23', 0);
INSERT INTO `activity_sku` VALUES (16, 1, 33, '2023-05-27 06:59:16', '2023-05-27 05:30:25', 0);
INSERT INTO `activity_sku` VALUES (27, 8, 42, '2023-05-27 07:07:07', '2023-05-27 05:29:50', 0);
INSERT INTO `activity_sku` VALUES (28, 8, 43, '2023-05-27 07:07:07', '2023-05-27 05:29:59', 0);

-- ----------------------------
-- Table structure for coupon_info
-- ----------------------------
DROP TABLE IF EXISTS `coupon_info`;
CREATE TABLE `coupon_info`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '购物券编号',
  `coupon_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '购物券名称',
  `coupon_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '购物券类型 1 现金券 2 折扣券 3 满减券 4 满件打折券',
  `condition_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '满额数（3）',
  `condition_num` bigint NULL DEFAULT NULL COMMENT '满件数（4）',
  `activity_id` bigint NULL DEFAULT NULL COMMENT '活动编号',
  `benefit_amount` decimal(16, 2) NULL DEFAULT NULL COMMENT '减金额（1 3）',
  `benefit_discount` decimal(10, 2) NULL DEFAULT NULL COMMENT '折扣（2 4）',
  `range_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '范围类型 1、商品(spuid) 2、品类(三级分类id) 3、品牌',
  `limit_num` int NOT NULL DEFAULT 0 COMMENT '最多领用次数',
  `taken_count` int NOT NULL DEFAULT 0 COMMENT '已领用次数',
  `start_time` datetime NULL DEFAULT NULL COMMENT '可以领取的开始日期',
  `end_time` datetime NULL DEFAULT NULL COMMENT '可以领取的结束日期',
  `operate_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `expire_time` datetime NULL DEFAULT NULL COMMENT '过期时间',
  `range_desc` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '范围描述',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_deleted` tinyint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '优惠券表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of coupon_info
-- ----------------------------
INSERT INTO `coupon_info` VALUES (2, 't01', 'CASH', NULL, NULL, 1, 1000.00, NULL, 'SPU', 10, 0, '2021-01-18 14:57:28', '2021-07-30 00:00:00', NULL, '2022-01-22 00:00:00', '可购买：小米CC9-0522,：华为 HUAWEI Mate 30 5G', '2023-05-27 05:40:05', '2023-05-27 05:40:05', 0);
INSERT INTO `coupon_info` VALUES (3, 't02', 'DISCOUNT', NULL, NULL, NULL, NULL, 9.00, 'TRADEMARK', 10, 0, '2021-01-19 00:00:00', '2021-07-30 00:00:00', NULL, '2022-01-23 00:00:00', '可购买品牌：小米', '2023-05-27 05:40:05', '2023-05-27 05:40:05', 0);
INSERT INTO `coupon_info` VALUES (7, 't03', 'FULL_REDUCTION', 1000.00, NULL, 8, 100.00, NULL, 'SPU', 30, 1, '2021-05-21 00:00:00', '2021-07-29 00:00:00', NULL, '2022-06-30 00:00:00', '可购买：小米CC9手机', '2023-05-27 05:40:05', '2023-05-27 05:40:05', 0);

-- ----------------------------
-- Table structure for coupon_range
-- ----------------------------
DROP TABLE IF EXISTS `coupon_range`;
CREATE TABLE `coupon_range`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '购物券编号',
  `coupon_id` bigint NOT NULL DEFAULT 0 COMMENT '优惠券id',
  `range_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '范围类型 1、商品(spuid) 2、品类(三级分类id) 3、品牌',
  `range_id` bigint NOT NULL DEFAULT 0,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_deleted` tinyint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '优惠券范围表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of coupon_range
-- ----------------------------
INSERT INTO `coupon_range` VALUES (2, 2, 'SPU', 16, '2023-05-27 05:40:43', '2023-05-27 05:40:43', 0);
INSERT INTO `coupon_range` VALUES (3, 2, 'SPU', 2, '2023-05-27 05:40:43', '2023-05-27 05:40:43', 0);
INSERT INTO `coupon_range` VALUES (4, 3, 'TRADEMARK', 4, '2023-05-27 05:40:43', '2023-05-27 05:40:43', 0);
INSERT INTO `coupon_range` VALUES (6, 7, 'SPU', 24, '2023-05-27 05:40:43', '2023-05-27 05:40:43', 0);

-- ----------------------------
-- Table structure for coupon_use
-- ----------------------------
DROP TABLE IF EXISTS `coupon_use`;
CREATE TABLE `coupon_use`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `coupon_id` bigint NULL DEFAULT NULL COMMENT '购物券ID',
  `user_id` bigint NULL DEFAULT NULL COMMENT '用户ID',
  `order_id` bigint NULL DEFAULT NULL COMMENT '订单ID',
  `coupon_status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '购物券状态（1：未使用 2：已使用）',
  `get_time` datetime NULL DEFAULT NULL COMMENT '获取时间',
  `using_time` datetime NULL DEFAULT NULL COMMENT '使用时间',
  `used_time` datetime NULL DEFAULT NULL COMMENT '支付时间',
  `expire_time` datetime NULL DEFAULT NULL COMMENT '过期时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_deleted` tinyint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '优惠券领用表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of coupon_use
-- ----------------------------
INSERT INTO `coupon_use` VALUES (5, 3, 2, 247, 'USED', '2021-01-20 10:51:54', '2021-07-12 16:19:18', NULL, '2021-01-23 00:00:00', '2023-05-27 05:41:21', '2023-05-27 05:41:21', 0);
INSERT INTO `coupon_use` VALUES (6, 2, 2, NULL, 'NOT_USED', '2021-01-21 20:42:15', NULL, NULL, '2021-01-22 00:00:00', '2023-05-27 05:41:21', '2023-05-27 05:41:21', 0);
INSERT INTO `coupon_use` VALUES (7, 7, 2, 248, 'USED', '2021-07-06 17:02:07', '2021-07-13 09:40:41', NULL, '2022-06-30 00:00:00', '2023-05-27 05:41:21', '2023-05-27 05:41:21', 0);

-- ----------------------------
-- Table structure for seckill_goods
-- ----------------------------
DROP TABLE IF EXISTS `seckill_goods`;
CREATE TABLE `seckill_goods`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `spu_id` bigint NULL DEFAULT NULL COMMENT 'spu_id',
  `sku_id` bigint NULL DEFAULT NULL COMMENT 'sku_id',
  `sku_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `sku_default_img` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品图片',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '原价格',
  `cost_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '秒杀价格',
  `check_time` datetime NULL DEFAULT NULL COMMENT '审核日期',
  `status` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核状态',
  `start_time` datetime NULL DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime NULL DEFAULT NULL COMMENT '结束时间',
  `num` int NULL DEFAULT NULL COMMENT '秒杀商品数',
  `stock_count` int NULL DEFAULT NULL COMMENT '剩余库存数',
  `sku_desc` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_deleted` tinyint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of seckill_goods
-- ----------------------------
INSERT INTO `seckill_goods` VALUES (1, 56, 30, 'Apple苹果iPhone 6s 32G金色 移动联通电', 'http://www.gmall.com/img/_/b1.png', 100.00, 0.01, NULL, '1', NULL, NULL, 10, 10, NULL, '2023-05-27 05:53:49', '2023-05-27 05:53:49', 0);
INSERT INTO `seckill_goods` VALUES (2, 13, 20, '荣耀V30 PRO DXO122分 5G双模 麒麟990 5GSOC芯片 双超级快充 游戏手机8GB+256GB幻夜星河 双卡双待', 'http://192.168.200.128:8080/group1/M00/00/01/wKjIgF90ajWETassAAAAAHTzbJo040.png', 3699.00, 100.00, NULL, '1', NULL, NULL, 10, 10, NULL, '2023-05-27 05:54:40', '2023-05-27 05:54:40', 0);
INSERT INTO `seckill_goods` VALUES (3, 16, 31, '0522 小米cc9e手机 蓝色（深蓝星球） 6G+64G 全网通', 'http://192.168.200.128:8080/group1/M00/00/02/wKjIgF-lKCGETWpkAAAAAHx6uAE137.png', 1348.00, 1.00, NULL, '1', NULL, NULL, 10, 8, NULL, '2023-05-27 05:55:28', '2023-05-27 05:55:28', 0);
INSERT INTO `seckill_goods` VALUES (4, 23, 38, '0621 小米CC9 手机 美图定制版 仙女渐变色 全网通(6G+64G)', 'http://192.168.200.128:8080/group1/M00/00/02/wKjIgF_HciCEbs_xAAAAANgmDQ8058.png', 1999.00, 1.00, NULL, '1', NULL, NULL, 10, 8, NULL, '2023-05-27 05:56:08', '2023-05-27 05:56:08', 0);
INSERT INTO `seckill_goods` VALUES (5, 23, 39, '0621 小米CC9 手机 美图定制版 仙女渐变色 全网通(6G+64G)', 'http://192.168.200.128:8080/group1/M00/00/02/wKjIgF_HciCEbs_xAAAAANgmDQ8058.png', 1999.00, 1.00, NULL, '1', NULL, NULL, 10, 8, NULL, '2023-05-27 05:56:42', '2023-05-27 05:56:42', 0);
INSERT INTO `seckill_goods` VALUES (6, 26, 46, '荣耀V30 PRO PLUS 5G双模 麒麟990 5GSOC芯片 双快充 游戏手机 幻夜星河 全网通(8GB 256GB)', 'http://39.99.159.121:9000/gmall/1623051685202b22930ae8ce248e39cce327fcb09d008.png', 4099.00, 50.00, NULL, '1', NULL, NULL, 10, 8, NULL, '2023-05-27 05:57:38', '2023-05-27 05:57:38', 0);

SET FOREIGN_KEY_CHECKS = 1;
