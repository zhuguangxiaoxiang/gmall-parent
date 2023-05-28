/*
 Navicat Premium Data Transfer

 Source Server         : gmall
 Source Server Type    : MySQL
 Source Server Version : 80028
 Source Host           : 192.168.200.123:3306
 Source Schema         : gmall_ware

 Target Server Type    : MySQL
 Target Server Version : 80028
 File Encoding         : 65001

 Date: 27/05/2023 16:04:42
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ware_info
-- ----------------------------
DROP TABLE IF EXISTS `ware_info`;
CREATE TABLE `ware_info`  (
  `id` bigint NOT NULL,
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `areacode` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_deleted` tinyint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ware_info
-- ----------------------------
INSERT INTO `ware_info` VALUES (1, '北京大兴仓库', '北京大兴', '110000', '2023-05-27 06:46:51', '2023-05-27 06:46:51', 0);
INSERT INTO `ware_info` VALUES (2, '北京昌平区仓库', '北京昌平', '110100', '2023-05-27 06:46:51', '2023-05-27 06:46:51', 0);

-- ----------------------------
-- Table structure for ware_order_task
-- ----------------------------
DROP TABLE IF EXISTS `ware_order_task`;
CREATE TABLE `ware_order_task`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `order_id` bigint NULL DEFAULT NULL COMMENT '订单编号',
  `consignee` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人',
  `consignee_tel` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收货人电话',
  `delivery_address` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '送货地址',
  `order_comment` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单备注',
  `payment_way` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '付款方式 1:在线付款 2:货到付款',
  `task_status` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工作单状态',
  `order_body` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单描述',
  `tracking_no` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流单号',
  `ware_id` bigint NULL DEFAULT NULL COMMENT '仓库编号',
  `task_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工作单备注',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_deleted` tinyint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 65 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '库存工作单表 库存工作单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ware_order_task
-- ----------------------------
INSERT INTO `ware_order_task` VALUES (52, 197, 'admin', '123456789', '北京市昌平区北七家', '', '2', 'SPLIT', '购买笔记本...', NULL, NULL, NULL, '2023-05-27 06:51:42', '2023-05-27 06:51:42', 0);
INSERT INTO `ware_order_task` VALUES (53, 204, 'admin', '123456789', '北京市昌平区北七家', '', '2', 'DEDUCTED', '购买笔记本...', NULL, 1, NULL, '2023-05-27 06:51:42', '2023-05-27 06:51:42', 0);
INSERT INTO `ware_order_task` VALUES (54, 205, 'admin', '123456789', '北京市昌平区北七家', '', '2', 'DEDUCTED', '购买笔记本...', NULL, 2, NULL, '2023-05-27 06:51:42', '2023-05-27 06:51:42', 0);
INSERT INTO `ware_order_task` VALUES (55, 225, 'admin', '123456789', '北京市昌平区北七家', '', '2', 'DEDUCTED', '荣耀V30 PRO PLUS 5G双模 麒麟990 5GSOC芯片 双快充 游戏手机 幻夜星河 全网通(8GB 128GB)荣耀V30 PRO PLUS 5G双模 麒麟990 5GSOC芯片 双快充 游戏手机 幻夜星河 全网通(8GB 256GB)', NULL, NULL, NULL, '2023-05-27 06:51:42', '2023-05-27 06:51:42', 0);
INSERT INTO `ware_order_task` VALUES (56, 226, 'admin', '123456789', '北京市昌平区北七家', '', '2', 'SPLIT', '荣耀V30 PRO PLUS 5G双模 麒麟990 5GSOC芯片 双快充 游戏手机 幻夜星河 全网通(8GB 128GB)荣耀V30 PRO PLUS 5G双模 麒麟990 5GSOC芯片 双快充 游戏手机 幻夜星河 全网通(8GB 256GB)', NULL, NULL, NULL, '2023-05-27 06:51:42', '2023-05-27 06:51:42', 0);
INSERT INTO `ware_order_task` VALUES (57, 227, 'admin', '123456789', '北京市昌平区北七家', '', '2', 'DEDUCTED', '荣耀V30 PRO PLUS 5G双模 麒麟990 5GSOC芯片 双快充 游戏手机 幻夜星河 全网通(8GB 128GB)', NULL, 1, NULL, '2023-05-27 06:51:42', '2023-05-27 06:51:42', 0);
INSERT INTO `ware_order_task` VALUES (58, 228, 'admin', '123456789', '北京市昌平区北七家', '', '2', 'DEDUCTED', '荣耀V30 PRO PLUS 5G双模 麒麟990 5GSOC芯片 双快充 游戏手机 幻夜星河 全网通(8GB 256GB)', NULL, 2, NULL, '2023-05-27 06:51:42', '2023-05-27 06:51:42', 0);
INSERT INTO `ware_order_task` VALUES (59, 230, 'admin', '123456789', '北京市昌平区北七家', '', '2', 'SPLIT', '荣耀V30 PRO PLUS 5G双模 麒麟990 5GSOC芯片 双快充 游戏手机 幻夜星河 全网通(8GB 128GB)荣耀V30 PRO PLUS 5G双模 麒麟990 5GSOC芯片 双快充 游戏手机 幻夜星河 全网通(8GB 256GB)', NULL, NULL, NULL, '2023-05-27 06:51:42', '2023-05-27 06:51:42', 0);
INSERT INTO `ware_order_task` VALUES (60, 231, 'admin', '123456789', '北京市昌平区北七家', '', '2', 'DEDUCTED', '荣耀V30 PRO PLUS 5G双模 麒麟990 5GSOC芯片 双快充 游戏手机 幻夜星河 全网通(8GB 128GB)', NULL, 1, NULL, '2023-05-27 06:51:42', '2023-05-27 06:51:42', 0);
INSERT INTO `ware_order_task` VALUES (61, 232, 'admin', '123456789', '北京市昌平区北七家', '', '2', 'DEDUCTED', '荣耀V30 PRO PLUS 5G双模 麒麟990 5GSOC芯片 双快充 游戏手机 幻夜星河 全网通(8GB 256GB)', NULL, 2, NULL, '2023-05-27 06:51:43', '2023-05-27 06:51:43', 0);
INSERT INTO `ware_order_task` VALUES (62, 233, 'admin', '123456789', '北京市昌平区北七家', '', '2', 'SPLIT', '荣耀V30 PRO PLUS 5G双模 麒麟990 5GSOC芯片 双快充 游戏手机 幻夜星河 全网通(8GB 128GB)荣耀V30 PRO PLUS 5G双模 麒麟990 5GSOC芯片 双快充 游戏手机 幻夜星河 全网通(8GB 256GB)', NULL, NULL, NULL, '2023-05-27 06:51:43', '2023-05-27 06:51:43', 0);
INSERT INTO `ware_order_task` VALUES (63, 234, 'admin', '123456789', '北京市昌平区北七家', '', '2', 'DEDUCTED', '荣耀V30 PRO PLUS 5G双模 麒麟990 5GSOC芯片 双快充 游戏手机 幻夜星河 全网通(8GB 128GB)', NULL, 1, NULL, '2023-05-27 06:51:43', '2023-05-27 06:51:43', 0);
INSERT INTO `ware_order_task` VALUES (64, 235, 'admin', '123456789', '北京市昌平区北七家', '', '2', 'DEDUCTED', '荣耀V30 PRO PLUS 5G双模 麒麟990 5GSOC芯片 双快充 游戏手机 幻夜星河 全网通(8GB 256GB)', NULL, 2, NULL, '2023-05-27 06:51:43', '2023-05-27 06:51:43', 0);

-- ----------------------------
-- Table structure for ware_order_task_detail
-- ----------------------------
DROP TABLE IF EXISTS `ware_order_task_detail`;
CREATE TABLE `ware_order_task_detail`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `sku_id` bigint NULL DEFAULT NULL COMMENT 'sku_id',
  `sku_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'sku名称',
  `sku_num` int NULL DEFAULT NULL COMMENT '购买个数',
  `task_id` bigint NULL DEFAULT NULL COMMENT '工作单编号',
  `refund_status` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_deleted` tinyint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 95 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '库存工作单明细表 库存工作单明细表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ware_order_task_detail
-- ----------------------------
INSERT INTO `ware_order_task_detail` VALUES (77, 42, '小米 CC9 手机 美颜自拍 游戏手机 蓝色（深蓝星球） 全网通 6GB+128GB', 3, 52, NULL, '2023-05-27 06:52:43', '2023-05-27 06:52:43', 0);
INSERT INTO `ware_order_task_detail` VALUES (78, 43, '小米 CC9 手机 美颜自拍 游戏手机 仙女渐变色（美图定制版） 全网通 6GB+128GB', 1, 52, NULL, '2023-05-27 06:52:43', '2023-05-27 06:52:43', 0);
INSERT INTO `ware_order_task_detail` VALUES (79, 42, '小米 CC9 手机 美颜自拍 游戏手机 蓝色（深蓝星球） 全网通 6GB+128GB', 3, 53, NULL, '2023-05-27 06:52:43', '2023-05-27 06:52:43', 0);
INSERT INTO `ware_order_task_detail` VALUES (80, 43, '小米 CC9 手机 美颜自拍 游戏手机 仙女渐变色（美图定制版） 全网通 6GB+128GB', 1, 54, NULL, '2023-05-27 06:52:44', '2023-05-27 06:52:44', 0);
INSERT INTO `ware_order_task_detail` VALUES (81, 47, '荣耀V30 PRO PLUS 5G双模 麒麟990 5GSOC芯片 双快充 游戏手机 幻夜星河 全网通(8GB 128GB)', 3, 55, NULL, '2023-05-27 06:52:44', '2023-05-27 06:52:44', 0);
INSERT INTO `ware_order_task_detail` VALUES (82, 46, '荣耀V30 PRO PLUS 5G双模 麒麟990 5GSOC芯片 双快充 游戏手机 幻夜星河 全网通(8GB 256GB)', 2, 55, NULL, '2023-05-27 06:52:44', '2023-05-27 06:52:44', 0);
INSERT INTO `ware_order_task_detail` VALUES (83, 47, '荣耀V30 PRO PLUS 5G双模 麒麟990 5GSOC芯片 双快充 游戏手机 幻夜星河 全网通(8GB 128GB)', 3, 56, NULL, '2023-05-27 06:52:44', '2023-05-27 06:52:44', 0);
INSERT INTO `ware_order_task_detail` VALUES (84, 46, '荣耀V30 PRO PLUS 5G双模 麒麟990 5GSOC芯片 双快充 游戏手机 幻夜星河 全网通(8GB 256GB)', 2, 56, NULL, '2023-05-27 06:52:44', '2023-05-27 06:52:44', 0);
INSERT INTO `ware_order_task_detail` VALUES (85, 47, '荣耀V30 PRO PLUS 5G双模 麒麟990 5GSOC芯片 双快充 游戏手机 幻夜星河 全网通(8GB 128GB)', 3, 57, NULL, '2023-05-27 06:52:44', '2023-05-27 06:52:44', 0);
INSERT INTO `ware_order_task_detail` VALUES (86, 46, '荣耀V30 PRO PLUS 5G双模 麒麟990 5GSOC芯片 双快充 游戏手机 幻夜星河 全网通(8GB 256GB)', 2, 58, NULL, '2023-05-27 06:52:44', '2023-05-27 06:52:44', 0);
INSERT INTO `ware_order_task_detail` VALUES (87, 47, '荣耀V30 PRO PLUS 5G双模 麒麟990 5GSOC芯片 双快充 游戏手机 幻夜星河 全网通(8GB 128GB)', 3, 59, NULL, '2023-05-27 06:52:44', '2023-05-27 06:52:44', 0);
INSERT INTO `ware_order_task_detail` VALUES (88, 46, '荣耀V30 PRO PLUS 5G双模 麒麟990 5GSOC芯片 双快充 游戏手机 幻夜星河 全网通(8GB 256GB)', 2, 59, NULL, '2023-05-27 06:52:44', '2023-05-27 06:52:44', 0);
INSERT INTO `ware_order_task_detail` VALUES (89, 47, '荣耀V30 PRO PLUS 5G双模 麒麟990 5GSOC芯片 双快充 游戏手机 幻夜星河 全网通(8GB 128GB)', 3, 60, NULL, '2023-05-27 06:52:44', '2023-05-27 06:52:44', 0);
INSERT INTO `ware_order_task_detail` VALUES (90, 46, '荣耀V30 PRO PLUS 5G双模 麒麟990 5GSOC芯片 双快充 游戏手机 幻夜星河 全网通(8GB 256GB)', 2, 61, NULL, '2023-05-27 06:52:44', '2023-05-27 06:52:44', 0);
INSERT INTO `ware_order_task_detail` VALUES (91, 47, '荣耀V30 PRO PLUS 5G双模 麒麟990 5GSOC芯片 双快充 游戏手机 幻夜星河 全网通(8GB 128GB)', 3, 62, NULL, '2023-05-27 06:52:44', '2023-05-27 06:52:44', 0);
INSERT INTO `ware_order_task_detail` VALUES (92, 46, '荣耀V30 PRO PLUS 5G双模 麒麟990 5GSOC芯片 双快充 游戏手机 幻夜星河 全网通(8GB 256GB)', 2, 62, NULL, '2023-05-27 06:52:44', '2023-05-27 06:52:44', 0);
INSERT INTO `ware_order_task_detail` VALUES (93, 47, '荣耀V30 PRO PLUS 5G双模 麒麟990 5GSOC芯片 双快充 游戏手机 幻夜星河 全网通(8GB 128GB)', 3, 63, NULL, '2023-05-27 06:52:44', '2023-05-27 06:52:44', 0);
INSERT INTO `ware_order_task_detail` VALUES (94, 46, '荣耀V30 PRO PLUS 5G双模 麒麟990 5GSOC芯片 双快充 游戏手机 幻夜星河 全网通(8GB 256GB)', 2, 64, NULL, '2023-05-27 06:52:44', '2023-05-27 06:52:44', 0);

-- ----------------------------
-- Table structure for ware_sku
-- ----------------------------
DROP TABLE IF EXISTS `ware_sku`;
CREATE TABLE `ware_sku`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `sku_id` bigint NULL DEFAULT NULL COMMENT 'skuid',
  `warehouse_id` bigint NULL DEFAULT NULL COMMENT '仓库id',
  `stock` int NULL DEFAULT NULL COMMENT '库存数',
  `stock_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '存货名称',
  `stock_locked` int NULL DEFAULT NULL COMMENT '锁定库存数',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_deleted` tinyint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'sku与仓库关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ware_sku
-- ----------------------------
INSERT INTO `ware_sku` VALUES (1, 43, 1, 10000, '小米 CC9 手机 美颜自拍 游戏手机 仙女渐变色（美图定制版） 全网通 6GB+128GB', 3, '2023-05-27 06:53:32', '2023-05-27 06:53:32', 0);
INSERT INTO `ware_sku` VALUES (2, 42, 1, 10000, '小米 CC9 手机 美颜自拍 游戏手机 蓝色（深蓝星球） 全网通 6GB+128GB', 9, '2023-05-27 06:53:32', '2023-05-27 06:53:32', 0);
INSERT INTO `ware_sku` VALUES (3, 47, 1, 1111, '荣耀V30 PRO PLUS 5G双模 麒麟990 5GSOC芯片 双快充 游戏手机 幻夜星河 全网通(8GB 128GB)', 12, '2023-05-27 06:53:32', '2023-05-27 06:53:32', 0);
INSERT INTO `ware_sku` VALUES (4, 46, 1, 1000, '\r\n荣耀V30 PRO PLUS 5G双模 麒麟990 5GSOC芯片 双快充 游戏手机 幻夜星河 全网通(8GB 256GB)', 8, '2023-05-27 06:55:50', '2023-05-27 06:55:50', 0);

SET FOREIGN_KEY_CHECKS = 1;
