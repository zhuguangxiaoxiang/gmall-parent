/*
 Navicat Premium Data Transfer

 Source Server         : gmall
 Source Server Type    : MySQL
 Source Server Version : 80028
 Source Host           : 192.168.200.123:3306
 Source Schema         : gmall_product

 Target Server Type    : MySQL
 Target Server Version : 80028
 File Encoding         : 65001

 Date: 27/05/2023 16:04:33
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for base_attr_info
-- ----------------------------
DROP TABLE IF EXISTS `base_attr_info`;
CREATE TABLE `base_attr_info`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `attr_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '属性名称',
  `category_id` bigint NULL DEFAULT NULL COMMENT '分类id',
  `category_level` int NULL DEFAULT NULL COMMENT '分类层级',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_deleted` tinyint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 111 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '属性表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of base_attr_info
-- ----------------------------
INSERT INTO `base_attr_info` VALUES (1, '价格', 61, 3, '2023-05-27 03:41:16', '2023-05-27 03:41:16', 0);
INSERT INTO `base_attr_info` VALUES (2, '屏幕尺寸', 61, 3, '2023-05-27 03:41:16', '2023-05-27 03:41:16', 0);
INSERT INTO `base_attr_info` VALUES (3, '运行内存', 61, 3, '2023-05-27 03:41:16', '2023-05-27 03:41:16', 0);
INSERT INTO `base_attr_info` VALUES (4, '机身存储', 61, 3, '2023-05-27 03:41:16', '2023-05-27 03:41:16', 0);
INSERT INTO `base_attr_info` VALUES (5, 'CPU型号', 61, 3, '2023-05-27 03:41:16', '2023-05-27 03:41:16', 0);
INSERT INTO `base_attr_info` VALUES (6, 'ts011', 285, 1, '2023-05-27 03:41:16', '2023-05-27 03:41:16', 0);
INSERT INTO `base_attr_info` VALUES (7, 's1', 1, 1, '2023-05-27 03:41:16', '2023-05-27 03:41:16', 0);
INSERT INTO `base_attr_info` VALUES (10, '价格', 63, 3, '2023-05-27 03:41:16', '2023-05-27 03:41:16', 0);

-- ----------------------------
-- Table structure for base_attr_value
-- ----------------------------
DROP TABLE IF EXISTS `base_attr_value`;
CREATE TABLE `base_attr_value`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `value_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '属性值名称',
  `attr_id` bigint NULL DEFAULT NULL COMMENT '属性id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_deleted` tinyint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 180 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '属性值表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of base_attr_value
-- ----------------------------
INSERT INTO `base_attr_value` VALUES (1, '0-499', 1, '2023-05-27 03:41:49', '2023-05-27 03:41:49', 0);
INSERT INTO `base_attr_value` VALUES (2, '500-999', 1, '2023-05-27 03:41:49', '2023-05-27 03:41:49', 0);
INSERT INTO `base_attr_value` VALUES (3, '1000-1699', 1, '2023-05-27 03:41:49', '2023-05-27 03:41:49', 0);
INSERT INTO `base_attr_value` VALUES (4, '1700-2799', 1, '2023-05-27 03:41:49', '2023-05-27 03:41:49', 0);
INSERT INTO `base_attr_value` VALUES (5, '2800-4499', 1, '2023-05-27 03:41:49', '2023-05-27 03:41:49', 0);
INSERT INTO `base_attr_value` VALUES (6, '4500-11999', 1, '2023-05-27 03:41:49', '2023-05-27 03:41:49', 0);
INSERT INTO `base_attr_value` VALUES (7, '12000以上', 1, '2023-05-27 03:41:49', '2023-05-27 03:41:49', 0);
INSERT INTO `base_attr_value` VALUES (8, ' 6.95英寸及以上', 2, '2023-05-27 03:41:49', '2023-05-27 03:41:49', 0);
INSERT INTO `base_attr_value` VALUES (9, '6.85-6.94英寸', 2, '2023-05-27 03:41:49', '2023-05-27 03:41:49', 0);
INSERT INTO `base_attr_value` VALUES (10, '6.75-6.84英寸', 2, '2023-05-27 03:41:49', '2023-05-27 03:41:49', 0);
INSERT INTO `base_attr_value` VALUES (11, '6.65-6.74英寸', 2, '2023-05-27 03:41:49', '2023-05-27 03:41:49', 0);
INSERT INTO `base_attr_value` VALUES (12, '6.55-6.64英寸', 2, '2023-05-27 03:41:49', '2023-05-27 03:41:49', 0);
INSERT INTO `base_attr_value` VALUES (13, '6.45-6.54英寸', 2, '2023-05-27 03:41:49', '2023-05-27 03:41:49', 0);
INSERT INTO `base_attr_value` VALUES (14, '6.35-6.44英寸', 2, '2023-05-27 03:41:49', '2023-05-27 03:41:49', 0);
INSERT INTO `base_attr_value` VALUES (15, '6.25-6.34英寸', 2, '2023-05-27 03:41:49', '2023-05-27 03:41:49', 0);
INSERT INTO `base_attr_value` VALUES (16, '6.0～6.24英寸', 2, '2023-05-27 03:41:49', '2023-05-27 03:41:49', 0);
INSERT INTO `base_attr_value` VALUES (17, '12GB', 3, '2023-05-27 03:41:49', '2023-05-27 03:41:49', 0);
INSERT INTO `base_attr_value` VALUES (18, '10GB', 3, '2023-05-27 03:41:49', '2023-05-27 03:41:49', 0);
INSERT INTO `base_attr_value` VALUES (19, '8GB', 3, '2023-05-27 03:41:49', '2023-05-27 03:41:49', 0);
INSERT INTO `base_attr_value` VALUES (20, '6GB', 3, '2023-05-27 03:41:49', '2023-05-27 03:41:49', 0);
INSERT INTO `base_attr_value` VALUES (21, '4GB', 3, '2023-05-27 03:41:49', '2023-05-27 03:41:49', 0);
INSERT INTO `base_attr_value` VALUES (22, '3GB', 3, '2023-05-27 03:41:49', '2023-05-27 03:41:49', 0);
INSERT INTO `base_attr_value` VALUES (23, '2GB', 3, '2023-05-27 03:41:49', '2023-05-27 03:41:49', 0);
INSERT INTO `base_attr_value` VALUES (24, '2GB以下', 3, '2023-05-27 03:41:49', '2023-05-27 03:41:49', 0);
INSERT INTO `base_attr_value` VALUES (25, '512GB', 4, '2023-05-27 03:41:49', '2023-05-27 03:41:49', 0);
INSERT INTO `base_attr_value` VALUES (26, '256GB', 4, '2023-05-27 03:41:49', '2023-05-27 03:41:49', 0);
INSERT INTO `base_attr_value` VALUES (27, '128GB', 4, '2023-05-27 03:41:49', '2023-05-27 03:41:49', 0);
INSERT INTO `base_attr_value` VALUES (28, '64GB', 4, '2023-05-27 03:41:49', '2023-05-27 03:41:49', 0);
INSERT INTO `base_attr_value` VALUES (29, '32GB', 4, '2023-05-27 03:41:49', '2023-05-27 03:41:49', 0);
INSERT INTO `base_attr_value` VALUES (30, '16GB', 4, '2023-05-27 03:41:49', '2023-05-27 03:41:49', 0);
INSERT INTO `base_attr_value` VALUES (31, '8GB', 4, '2023-05-27 03:41:49', '2023-05-27 03:41:49', 0);
INSERT INTO `base_attr_value` VALUES (32, '8GB以下', 4, '2023-05-27 03:41:49', '2023-05-27 03:41:49', 0);
INSERT INTO `base_attr_value` VALUES (33, '其它存储', 4, '2023-05-27 03:41:49', '2023-05-27 03:41:49', 0);
INSERT INTO `base_attr_value` VALUES (34, '骁龙855', 5, '2023-05-27 03:41:49', '2023-05-27 03:41:49', 0);
INSERT INTO `base_attr_value` VALUES (35, '骁龙845', 5, '2023-05-27 03:41:49', '2023-05-27 03:41:49', 0);
INSERT INTO `base_attr_value` VALUES (36, '骁龙835', 5, '2023-05-27 03:41:49', '2023-05-27 03:41:49', 0);
INSERT INTO `base_attr_value` VALUES (37, '骁龙730G', 5, '2023-05-27 03:41:50', '2023-05-27 03:41:50', 0);
INSERT INTO `base_attr_value` VALUES (38, '骁龙730', 5, '2023-05-27 03:41:50', '2023-05-27 03:41:50', 0);
INSERT INTO `base_attr_value` VALUES (39, '骁龙712', 5, '2023-05-27 03:41:50', '2023-05-27 03:41:50', 0);
INSERT INTO `base_attr_value` VALUES (40, '骁龙710', 5, '2023-05-27 03:41:50', '2023-05-27 03:41:50', 0);
INSERT INTO `base_attr_value` VALUES (41, '骁龙675', 5, '2023-05-27 03:41:50', '2023-05-27 03:41:50', 0);
INSERT INTO `base_attr_value` VALUES (42, '骁龙660', 5, '2023-05-27 03:41:50', '2023-05-27 03:41:50', 0);
INSERT INTO `base_attr_value` VALUES (43, '骁龙665', 5, '2023-05-27 03:41:50', '2023-05-27 03:41:50', 0);
INSERT INTO `base_attr_value` VALUES (44, '麒麟990', 5, '2023-05-27 03:41:50', '2023-05-27 03:41:50', 0);
INSERT INTO `base_attr_value` VALUES (45, '麒麟980', 5, '2023-05-27 03:41:50', '2023-05-27 03:41:50', 0);
INSERT INTO `base_attr_value` VALUES (46, '其它', 5, '2023-05-27 03:41:50', '2023-05-27 03:41:50', 0);
INSERT INTO `base_attr_value` VALUES (49, 't1', 6, '2023-05-27 03:41:50', '2023-05-27 03:41:50', 0);
INSERT INTO `base_attr_value` VALUES (50, 't2', 6, '2023-05-27 03:41:50', '2023-05-27 03:41:50', 0);
INSERT INTO `base_attr_value` VALUES (51, 't3', 6, '2023-05-27 03:41:50', '2023-05-27 03:41:50', 0);
INSERT INTO `base_attr_value` VALUES (52, 'ss', 7, '2023-05-27 03:41:50', '2023-05-27 03:41:50', 0);
INSERT INTO `base_attr_value` VALUES (57, '1000-2999', 10, '2023-05-27 03:41:50', '2023-05-27 03:41:50', 0);
INSERT INTO `base_attr_value` VALUES (58, '3000-9999', 10, '2023-05-27 03:41:50', '2023-05-27 03:41:50', 0);

-- ----------------------------
-- Table structure for base_category1
-- ----------------------------
DROP TABLE IF EXISTS `base_category1`;
CREATE TABLE `base_category1`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类名称',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_deleted` tinyint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '一级分类表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of base_category1
-- ----------------------------
INSERT INTO `base_category1` VALUES (1, '图书、音像、电子书刊', '2023-05-27 03:42:24', '2023-05-27 03:42:24', 0);
INSERT INTO `base_category1` VALUES (2, '手机', '2023-05-27 03:42:24', '2023-05-27 03:42:24', 0);
INSERT INTO `base_category1` VALUES (3, '家用电器', '2023-05-27 03:42:24', '2023-05-27 03:42:24', 0);
INSERT INTO `base_category1` VALUES (4, '数码', '2023-05-27 03:42:24', '2023-05-27 03:42:24', 0);
INSERT INTO `base_category1` VALUES (5, '家居家装', '2023-05-27 03:42:24', '2023-05-27 03:42:24', 0);
INSERT INTO `base_category1` VALUES (6, '电脑办公', '2023-05-27 03:42:24', '2023-05-27 03:42:24', 0);
INSERT INTO `base_category1` VALUES (7, '厨具', '2023-05-27 03:42:24', '2023-05-27 03:42:24', 0);
INSERT INTO `base_category1` VALUES (8, '个护化妆', '2023-05-27 03:42:24', '2023-05-27 03:42:24', 0);
INSERT INTO `base_category1` VALUES (9, '服饰内衣', '2023-05-27 03:42:24', '2023-05-27 03:42:24', 0);
INSERT INTO `base_category1` VALUES (10, '钟表', '2023-05-27 03:42:24', '2023-05-27 03:42:24', 0);
INSERT INTO `base_category1` VALUES (11, '鞋靴', '2023-05-27 03:42:24', '2023-05-27 03:42:24', 0);
INSERT INTO `base_category1` VALUES (12, '母婴', '2023-05-27 03:42:24', '2023-05-27 03:42:24', 0);
INSERT INTO `base_category1` VALUES (13, '礼品箱包', '2023-05-27 03:42:24', '2023-05-27 03:42:24', 0);
INSERT INTO `base_category1` VALUES (14, '食品饮料、保健食品', '2023-05-27 03:42:24', '2023-05-27 03:42:24', 0);
INSERT INTO `base_category1` VALUES (15, '珠宝', '2023-05-27 03:42:24', '2023-05-27 03:42:24', 0);
INSERT INTO `base_category1` VALUES (16, '汽车用品', '2023-05-27 03:42:24', '2023-05-27 03:42:24', 0);
INSERT INTO `base_category1` VALUES (17, '运动健康', '2023-05-27 03:42:24', '2023-05-27 03:42:24', 0);

-- ----------------------------
-- Table structure for base_category2
-- ----------------------------
DROP TABLE IF EXISTS `base_category2`;
CREATE TABLE `base_category2`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '二级分类名称',
  `category1_id` bigint NULL DEFAULT NULL COMMENT '一级分类编号',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_deleted` tinyint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 127 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '二级分类表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of base_category2
-- ----------------------------
INSERT INTO `base_category2` VALUES (1, '电子书刊', 1, '2023-05-27 03:43:16', '2023-05-27 03:43:16', 0);
INSERT INTO `base_category2` VALUES (2, '音像', 1, '2023-05-27 03:43:16', '2023-05-27 03:43:16', 0);
INSERT INTO `base_category2` VALUES (3, '英文原版', 1, '2023-05-27 03:43:16', '2023-05-27 03:43:16', 0);
INSERT INTO `base_category2` VALUES (4, '文艺', 1, '2023-05-27 03:43:16', '2023-05-27 03:43:16', 0);
INSERT INTO `base_category2` VALUES (5, '少儿', 1, '2023-05-27 03:43:16', '2023-05-27 03:43:16', 0);
INSERT INTO `base_category2` VALUES (6, '人文社科', 1, '2023-05-27 03:43:16', '2023-05-27 03:43:16', 0);
INSERT INTO `base_category2` VALUES (7, '经管励志', 1, '2023-05-27 03:43:16', '2023-05-27 03:43:16', 0);
INSERT INTO `base_category2` VALUES (8, '生活', 1, '2023-05-27 03:43:16', '2023-05-27 03:43:16', 0);
INSERT INTO `base_category2` VALUES (9, '科技', 1, '2023-05-27 03:43:16', '2023-05-27 03:43:16', 0);
INSERT INTO `base_category2` VALUES (10, '教育', 1, '2023-05-27 03:43:16', '2023-05-27 03:43:16', 0);
INSERT INTO `base_category2` VALUES (11, '港台图书', 1, '2023-05-27 03:43:16', '2023-05-27 03:43:16', 0);
INSERT INTO `base_category2` VALUES (12, '其他', 1, '2023-05-27 03:43:16', '2023-05-27 03:43:16', 0);
INSERT INTO `base_category2` VALUES (13, '手机通讯', 2, '2023-05-27 03:43:16', '2023-05-27 03:43:16', 0);
INSERT INTO `base_category2` VALUES (14, '运营商', 2, '2023-05-27 03:43:16', '2023-05-27 03:43:16', 0);
INSERT INTO `base_category2` VALUES (15, '手机配件', 2, '2023-05-27 03:43:16', '2023-05-27 03:43:16', 0);
INSERT INTO `base_category2` VALUES (16, '大 家 电', 3, '2023-05-27 03:43:16', '2023-05-27 03:43:16', 0);
INSERT INTO `base_category2` VALUES (17, '厨卫大电', 3, '2023-05-27 03:43:16', '2023-05-27 03:43:16', 0);
INSERT INTO `base_category2` VALUES (18, '厨房小电', 3, '2023-05-27 03:43:16', '2023-05-27 03:43:16', 0);
INSERT INTO `base_category2` VALUES (19, '生活电器', 3, '2023-05-27 03:43:16', '2023-05-27 03:43:16', 0);
INSERT INTO `base_category2` VALUES (20, '个护健康', 3, '2023-05-27 03:43:16', '2023-05-27 03:43:16', 0);
INSERT INTO `base_category2` VALUES (21, '五金家装', 3, '2023-05-27 03:43:16', '2023-05-27 03:43:16', 0);
INSERT INTO `base_category2` VALUES (22, '摄影摄像', 4, '2023-05-27 03:43:16', '2023-05-27 03:43:16', 0);
INSERT INTO `base_category2` VALUES (23, '数码配件', 4, '2023-05-27 03:43:16', '2023-05-27 03:43:16', 0);
INSERT INTO `base_category2` VALUES (24, '智能设备', 4, '2023-05-27 03:43:16', '2023-05-27 03:43:16', 0);
INSERT INTO `base_category2` VALUES (25, '影音娱乐', 4, '2023-05-27 03:43:16', '2023-05-27 03:43:16', 0);
INSERT INTO `base_category2` VALUES (26, '电子教育', 4, '2023-05-27 03:43:16', '2023-05-27 03:43:16', 0);
INSERT INTO `base_category2` VALUES (27, '虚拟商品', 4, '2023-05-27 03:43:16', '2023-05-27 03:43:16', 0);
INSERT INTO `base_category2` VALUES (28, '家纺', 5, '2023-05-27 03:43:16', '2023-05-27 03:43:16', 0);
INSERT INTO `base_category2` VALUES (29, '灯具', 5, '2023-05-27 03:43:16', '2023-05-27 03:43:16', 0);
INSERT INTO `base_category2` VALUES (30, '生活日用', 5, '2023-05-27 03:43:16', '2023-05-27 03:43:16', 0);
INSERT INTO `base_category2` VALUES (31, '家装软饰', 5, '2023-05-27 03:43:16', '2023-05-27 03:43:16', 0);
INSERT INTO `base_category2` VALUES (32, '宠物生活', 5, '2023-05-27 03:43:16', '2023-05-27 03:43:16', 0);
INSERT INTO `base_category2` VALUES (33, '电脑整机', 6, '2023-05-27 03:43:16', '2023-05-27 03:43:16', 0);
INSERT INTO `base_category2` VALUES (34, '电脑配件', 6, '2023-05-27 03:43:16', '2023-05-27 03:43:16', 0);
INSERT INTO `base_category2` VALUES (35, '外设产品', 6, '2023-05-27 03:43:16', '2023-05-27 03:43:16', 0);
INSERT INTO `base_category2` VALUES (36, '游戏设备', 6, '2023-05-27 03:43:16', '2023-05-27 03:43:16', 0);
INSERT INTO `base_category2` VALUES (37, '网络产品', 6, '2023-05-27 03:43:16', '2023-05-27 03:43:16', 0);
INSERT INTO `base_category2` VALUES (38, '办公设备', 6, '2023-05-27 03:43:16', '2023-05-27 03:43:16', 0);
INSERT INTO `base_category2` VALUES (39, '文具/耗材', 6, '2023-05-27 03:43:16', '2023-05-27 03:43:16', 0);
INSERT INTO `base_category2` VALUES (40, '服务产品', 6, '2023-05-27 03:43:16', '2023-05-27 03:43:16', 0);
INSERT INTO `base_category2` VALUES (41, '烹饪锅具', 7, '2023-05-27 03:43:16', '2023-05-27 03:43:16', 0);
INSERT INTO `base_category2` VALUES (42, '刀剪菜板', 7, '2023-05-27 03:43:16', '2023-05-27 03:43:16', 0);
INSERT INTO `base_category2` VALUES (43, '厨房配件', 7, '2023-05-27 03:43:16', '2023-05-27 03:43:16', 0);
INSERT INTO `base_category2` VALUES (44, '水具酒具', 7, '2023-05-27 03:43:16', '2023-05-27 03:43:16', 0);
INSERT INTO `base_category2` VALUES (45, '餐具', 7, '2023-05-27 03:43:16', '2023-05-27 03:43:16', 0);
INSERT INTO `base_category2` VALUES (46, '酒店用品', 7, '2023-05-27 03:43:16', '2023-05-27 03:43:16', 0);
INSERT INTO `base_category2` VALUES (47, '茶具/咖啡具', 7, '2023-05-27 03:43:16', '2023-05-27 03:43:16', 0);
INSERT INTO `base_category2` VALUES (48, '清洁用品', 8, '2023-05-27 03:43:16', '2023-05-27 03:43:16', 0);
INSERT INTO `base_category2` VALUES (49, '面部护肤', 8, '2023-05-27 03:43:16', '2023-05-27 03:43:16', 0);
INSERT INTO `base_category2` VALUES (50, '身体护理', 8, '2023-05-27 03:43:16', '2023-05-27 03:43:16', 0);
INSERT INTO `base_category2` VALUES (51, '口腔护理', 8, '2023-05-27 03:43:16', '2023-05-27 03:43:16', 0);
INSERT INTO `base_category2` VALUES (52, '女性护理', 8, '2023-05-27 03:43:16', '2023-05-27 03:43:16', 0);
INSERT INTO `base_category2` VALUES (53, '洗发护发', 8, '2023-05-27 03:43:16', '2023-05-27 03:43:16', 0);
INSERT INTO `base_category2` VALUES (54, '香水彩妆', 8, '2023-05-27 03:43:16', '2023-05-27 03:43:16', 0);
INSERT INTO `base_category2` VALUES (55, '女装', 9, '2023-05-27 03:43:16', '2023-05-27 03:43:16', 0);
INSERT INTO `base_category2` VALUES (56, '男装', 9, '2023-05-27 03:43:16', '2023-05-27 03:43:16', 0);
INSERT INTO `base_category2` VALUES (57, '内衣', 9, '2023-05-27 03:43:16', '2023-05-27 03:43:16', 0);
INSERT INTO `base_category2` VALUES (58, '洗衣服务', 9, '2023-05-27 03:43:16', '2023-05-27 03:43:16', 0);
INSERT INTO `base_category2` VALUES (59, '服饰配件', 9, '2023-05-27 03:43:16', '2023-05-27 03:43:16', 0);
INSERT INTO `base_category2` VALUES (60, '钟表', 10, '2023-05-27 03:43:16', '2023-05-27 03:43:16', 0);
INSERT INTO `base_category2` VALUES (61, '流行男鞋', 11, '2023-05-27 03:43:16', '2023-05-27 03:43:16', 0);
INSERT INTO `base_category2` VALUES (62, '时尚女鞋', 11, '2023-05-27 03:43:16', '2023-05-27 03:43:16', 0);
INSERT INTO `base_category2` VALUES (63, '奶粉', 12, '2023-05-27 03:43:16', '2023-05-27 03:43:16', 0);
INSERT INTO `base_category2` VALUES (64, '营养辅食', 12, '2023-05-27 03:43:17', '2023-05-27 03:43:17', 0);
INSERT INTO `base_category2` VALUES (65, '尿裤湿巾', 12, '2023-05-27 03:43:17', '2023-05-27 03:43:17', 0);
INSERT INTO `base_category2` VALUES (66, '喂养用品', 12, '2023-05-27 03:43:17', '2023-05-27 03:43:17', 0);
INSERT INTO `base_category2` VALUES (67, '洗护用品', 12, '2023-05-27 03:43:17', '2023-05-27 03:43:17', 0);
INSERT INTO `base_category2` VALUES (68, '童车童床', 12, '2023-05-27 03:43:17', '2023-05-27 03:43:17', 0);
INSERT INTO `base_category2` VALUES (69, '寝居服饰', 12, '2023-05-27 03:43:17', '2023-05-27 03:43:17', 0);
INSERT INTO `base_category2` VALUES (70, '妈妈专区', 12, '2023-05-27 03:43:17', '2023-05-27 03:43:17', 0);
INSERT INTO `base_category2` VALUES (71, '童装童鞋', 12, '2023-05-27 03:43:17', '2023-05-27 03:43:17', 0);
INSERT INTO `base_category2` VALUES (72, '安全座椅', 12, '2023-05-27 03:43:17', '2023-05-27 03:43:17', 0);
INSERT INTO `base_category2` VALUES (73, '潮流女包', 13, '2023-05-27 03:43:17', '2023-05-27 03:43:17', 0);
INSERT INTO `base_category2` VALUES (74, '精品男包', 13, '2023-05-27 03:43:17', '2023-05-27 03:43:17', 0);
INSERT INTO `base_category2` VALUES (75, '功能箱包', 13, '2023-05-27 03:43:17', '2023-05-27 03:43:17', 0);
INSERT INTO `base_category2` VALUES (76, '礼品', 13, '2023-05-27 03:43:17', '2023-05-27 03:43:17', 0);
INSERT INTO `base_category2` VALUES (77, '奢侈品', 13, '2023-05-27 03:43:17', '2023-05-27 03:43:17', 0);
INSERT INTO `base_category2` VALUES (78, '婚庆', 13, '2023-05-27 03:43:17', '2023-05-27 03:43:17', 0);
INSERT INTO `base_category2` VALUES (79, '进口食品', 14, '2023-05-27 03:43:17', '2023-05-27 03:43:17', 0);
INSERT INTO `base_category2` VALUES (80, '地方特产', 14, '2023-05-27 03:43:17', '2023-05-27 03:43:17', 0);
INSERT INTO `base_category2` VALUES (81, '休闲食品', 14, '2023-05-27 03:43:17', '2023-05-27 03:43:17', 0);
INSERT INTO `base_category2` VALUES (82, '粮油调味', 14, '2023-05-27 03:43:17', '2023-05-27 03:43:17', 0);
INSERT INTO `base_category2` VALUES (83, '饮料冲调', 14, '2023-05-27 03:43:17', '2023-05-27 03:43:17', 0);
INSERT INTO `base_category2` VALUES (84, '食品礼券', 14, '2023-05-27 03:43:17', '2023-05-27 03:43:17', 0);
INSERT INTO `base_category2` VALUES (85, '茗茶', 14, '2023-05-27 03:43:17', '2023-05-27 03:43:17', 0);
INSERT INTO `base_category2` VALUES (86, '时尚饰品', 15, '2023-05-27 03:43:17', '2023-05-27 03:43:17', 0);
INSERT INTO `base_category2` VALUES (87, '黄金', 15, '2023-05-27 03:43:17', '2023-05-27 03:43:17', 0);
INSERT INTO `base_category2` VALUES (88, 'K金饰品', 15, '2023-05-27 03:43:17', '2023-05-27 03:43:17', 0);
INSERT INTO `base_category2` VALUES (89, '金银投资', 15, '2023-05-27 03:43:17', '2023-05-27 03:43:17', 0);
INSERT INTO `base_category2` VALUES (90, '银饰', 15, '2023-05-27 03:43:17', '2023-05-27 03:43:17', 0);
INSERT INTO `base_category2` VALUES (91, '钻石', 15, '2023-05-27 03:43:17', '2023-05-27 03:43:17', 0);
INSERT INTO `base_category2` VALUES (92, '翡翠玉石', 15, '2023-05-27 03:43:17', '2023-05-27 03:43:17', 0);
INSERT INTO `base_category2` VALUES (93, '水晶玛瑙', 15, '2023-05-27 03:43:17', '2023-05-27 03:43:17', 0);
INSERT INTO `base_category2` VALUES (94, '彩宝', 15, '2023-05-27 03:43:17', '2023-05-27 03:43:17', 0);
INSERT INTO `base_category2` VALUES (95, '铂金', 15, '2023-05-27 03:43:17', '2023-05-27 03:43:17', 0);
INSERT INTO `base_category2` VALUES (96, '木手串/把件', 15, '2023-05-27 03:43:17', '2023-05-27 03:43:17', 0);
INSERT INTO `base_category2` VALUES (97, '珍珠', 15, '2023-05-27 03:43:17', '2023-05-27 03:43:17', 0);
INSERT INTO `base_category2` VALUES (98, '维修保养', 16, '2023-05-27 03:43:17', '2023-05-27 03:43:17', 0);
INSERT INTO `base_category2` VALUES (99, '车载电器', 16, '2023-05-27 03:43:17', '2023-05-27 03:43:17', 0);
INSERT INTO `base_category2` VALUES (100, '美容清洗', 16, '2023-05-27 03:43:17', '2023-05-27 03:43:17', 0);
INSERT INTO `base_category2` VALUES (101, '汽车装饰', 16, '2023-05-27 03:43:17', '2023-05-27 03:43:17', 0);
INSERT INTO `base_category2` VALUES (102, '安全自驾', 16, '2023-05-27 03:43:17', '2023-05-27 03:43:17', 0);
INSERT INTO `base_category2` VALUES (103, '汽车服务', 16, '2023-05-27 03:43:17', '2023-05-27 03:43:17', 0);
INSERT INTO `base_category2` VALUES (104, '赛事改装', 16, '2023-05-27 03:43:17', '2023-05-27 03:43:17', 0);
INSERT INTO `base_category2` VALUES (105, '运动鞋包', 17, '2023-05-27 03:43:17', '2023-05-27 03:43:17', 0);
INSERT INTO `base_category2` VALUES (106, '运动服饰', 17, '2023-05-27 03:43:17', '2023-05-27 03:43:17', 0);
INSERT INTO `base_category2` VALUES (107, '骑行运动', 17, '2023-05-27 03:43:17', '2023-05-27 03:43:17', 0);
INSERT INTO `base_category2` VALUES (108, '垂钓用品', 17, '2023-05-27 03:43:17', '2023-05-27 03:43:17', 0);
INSERT INTO `base_category2` VALUES (109, '游泳用品', 17, '2023-05-27 03:43:17', '2023-05-27 03:43:17', 0);
INSERT INTO `base_category2` VALUES (110, '户外鞋服', 17, '2023-05-27 03:43:17', '2023-05-27 03:43:17', 0);
INSERT INTO `base_category2` VALUES (111, '户外装备', 17, '2023-05-27 03:43:17', '2023-05-27 03:43:17', 0);
INSERT INTO `base_category2` VALUES (112, '健身训练', 17, '2023-05-27 03:43:17', '2023-05-27 03:43:17', 0);
INSERT INTO `base_category2` VALUES (113, '体育用品', 17, '2023-05-27 03:43:17', '2023-05-27 03:43:17', 0);

-- ----------------------------
-- Table structure for base_category3
-- ----------------------------
DROP TABLE IF EXISTS `base_category3`;
CREATE TABLE `base_category3`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '三级分类名称',
  `category2_id` bigint NULL DEFAULT NULL COMMENT '二级分类编号',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_deleted` tinyint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1114 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '三级分类表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of base_category3
-- ----------------------------
INSERT INTO `base_category3` VALUES (1, '电子书', 1, '2023-05-27 03:45:59', '2023-05-27 03:45:59', 0);
INSERT INTO `base_category3` VALUES (2, '网络原创', 1, '2023-05-27 03:45:59', '2023-05-27 03:45:59', 0);
INSERT INTO `base_category3` VALUES (3, '数字杂志', 1, '2023-05-27 03:45:59', '2023-05-27 03:45:59', 0);
INSERT INTO `base_category3` VALUES (4, '多媒体图书', 1, '2023-05-27 03:45:59', '2023-05-27 03:45:59', 0);
INSERT INTO `base_category3` VALUES (5, '音乐', 2, '2023-05-27 03:45:59', '2023-05-27 03:45:59', 0);
INSERT INTO `base_category3` VALUES (6, '影视', 2, '2023-05-27 03:45:59', '2023-05-27 03:45:59', 0);
INSERT INTO `base_category3` VALUES (7, '教育音像', 2, '2023-05-27 03:45:59', '2023-05-27 03:45:59', 0);
INSERT INTO `base_category3` VALUES (8, '少儿', 3, '2023-05-27 03:45:59', '2023-05-27 03:45:59', 0);
INSERT INTO `base_category3` VALUES (9, '商务投资', 3, '2023-05-27 03:45:59', '2023-05-27 03:45:59', 0);
INSERT INTO `base_category3` VALUES (10, '英语学习与考试', 3, '2023-05-27 03:45:59', '2023-05-27 03:45:59', 0);
INSERT INTO `base_category3` VALUES (11, '文学', 3, '2023-05-27 03:45:59', '2023-05-27 03:45:59', 0);
INSERT INTO `base_category3` VALUES (12, '传记', 3, '2023-05-27 03:45:59', '2023-05-27 03:45:59', 0);
INSERT INTO `base_category3` VALUES (13, '励志', 3, '2023-05-27 03:45:59', '2023-05-27 03:45:59', 0);
INSERT INTO `base_category3` VALUES (14, '小说', 4, '2023-05-27 03:45:59', '2023-05-27 03:45:59', 0);
INSERT INTO `base_category3` VALUES (15, '文学', 4, '2023-05-27 03:45:59', '2023-05-27 03:45:59', 0);
INSERT INTO `base_category3` VALUES (16, '青春文学', 4, '2023-05-27 03:45:59', '2023-05-27 03:45:59', 0);
INSERT INTO `base_category3` VALUES (17, '传记', 4, '2023-05-27 03:45:59', '2023-05-27 03:45:59', 0);
INSERT INTO `base_category3` VALUES (18, '艺术', 4, '2023-05-27 03:45:59', '2023-05-27 03:45:59', 0);
INSERT INTO `base_category3` VALUES (19, '少儿', 5, '2023-05-27 03:45:59', '2023-05-27 03:45:59', 0);
INSERT INTO `base_category3` VALUES (20, '0-2岁', 5, '2023-05-27 03:45:59', '2023-05-27 03:45:59', 0);
INSERT INTO `base_category3` VALUES (21, '3-6岁', 5, '2023-05-27 03:45:59', '2023-05-27 03:45:59', 0);
INSERT INTO `base_category3` VALUES (22, '7-10岁', 5, '2023-05-27 03:45:59', '2023-05-27 03:45:59', 0);
INSERT INTO `base_category3` VALUES (23, '11-14岁', 5, '2023-05-27 03:45:59', '2023-05-27 03:45:59', 0);
INSERT INTO `base_category3` VALUES (24, '历史', 6, '2023-05-27 03:45:59', '2023-05-27 03:45:59', 0);
INSERT INTO `base_category3` VALUES (25, '哲学', 6, '2023-05-27 03:45:59', '2023-05-27 03:45:59', 0);
INSERT INTO `base_category3` VALUES (26, '国学', 6, '2023-05-27 03:45:59', '2023-05-27 03:45:59', 0);
INSERT INTO `base_category3` VALUES (27, '政治/军事', 6, '2023-05-27 03:45:59', '2023-05-27 03:45:59', 0);
INSERT INTO `base_category3` VALUES (28, '法律', 6, '2023-05-27 03:45:59', '2023-05-27 03:45:59', 0);
INSERT INTO `base_category3` VALUES (29, '人文社科', 6, '2023-05-27 03:45:59', '2023-05-27 03:45:59', 0);
INSERT INTO `base_category3` VALUES (30, '心理学', 6, '2023-05-27 03:45:59', '2023-05-27 03:45:59', 0);
INSERT INTO `base_category3` VALUES (31, '文化', 6, '2023-05-27 03:45:59', '2023-05-27 03:45:59', 0);
INSERT INTO `base_category3` VALUES (32, '社会科学', 6, '2023-05-27 03:45:59', '2023-05-27 03:45:59', 0);
INSERT INTO `base_category3` VALUES (33, '经济', 7, '2023-05-27 03:45:59', '2023-05-27 03:45:59', 0);
INSERT INTO `base_category3` VALUES (34, '金融与投资', 7, '2023-05-27 03:45:59', '2023-05-27 03:45:59', 0);
INSERT INTO `base_category3` VALUES (35, '管理', 7, '2023-05-27 03:45:59', '2023-05-27 03:45:59', 0);
INSERT INTO `base_category3` VALUES (36, '励志与成功', 7, '2023-05-27 03:45:59', '2023-05-27 03:45:59', 0);
INSERT INTO `base_category3` VALUES (37, '生活', 8, '2023-05-27 03:45:59', '2023-05-27 03:45:59', 0);
INSERT INTO `base_category3` VALUES (38, '健身与保健', 8, '2023-05-27 03:45:59', '2023-05-27 03:45:59', 0);
INSERT INTO `base_category3` VALUES (39, '家庭与育儿', 8, '2023-05-27 03:45:59', '2023-05-27 03:45:59', 0);
INSERT INTO `base_category3` VALUES (40, '旅游', 8, '2023-05-27 03:45:59', '2023-05-27 03:45:59', 0);
INSERT INTO `base_category3` VALUES (41, '烹饪美食', 8, '2023-05-27 03:45:59', '2023-05-27 03:45:59', 0);
INSERT INTO `base_category3` VALUES (42, '工业技术', 9, '2023-05-27 03:45:59', '2023-05-27 03:45:59', 0);
INSERT INTO `base_category3` VALUES (43, '科普读物', 9, '2023-05-27 03:45:59', '2023-05-27 03:45:59', 0);
INSERT INTO `base_category3` VALUES (44, '建筑', 9, '2023-05-27 03:45:59', '2023-05-27 03:45:59', 0);
INSERT INTO `base_category3` VALUES (45, '医学', 9, '2023-05-27 03:45:59', '2023-05-27 03:45:59', 0);
INSERT INTO `base_category3` VALUES (46, '科学与自然', 9, '2023-05-27 03:45:59', '2023-05-27 03:45:59', 0);
INSERT INTO `base_category3` VALUES (47, '计算机与互联网', 9, '2023-05-27 03:45:59', '2023-05-27 03:45:59', 0);
INSERT INTO `base_category3` VALUES (48, '电子通信', 9, '2023-05-27 03:45:59', '2023-05-27 03:45:59', 0);
INSERT INTO `base_category3` VALUES (49, '中小学教辅', 10, '2023-05-27 03:45:59', '2023-05-27 03:45:59', 0);
INSERT INTO `base_category3` VALUES (50, '教育与考试', 10, '2023-05-27 03:45:59', '2023-05-27 03:45:59', 0);
INSERT INTO `base_category3` VALUES (51, '外语学习', 10, '2023-05-27 03:45:59', '2023-05-27 03:45:59', 0);
INSERT INTO `base_category3` VALUES (52, '大中专教材', 10, '2023-05-27 03:45:59', '2023-05-27 03:45:59', 0);
INSERT INTO `base_category3` VALUES (53, '字典词典', 10, '2023-05-27 03:45:59', '2023-05-27 03:45:59', 0);
INSERT INTO `base_category3` VALUES (54, '艺术/设计/收藏', 11, '2023-05-27 03:45:59', '2023-05-27 03:45:59', 0);
INSERT INTO `base_category3` VALUES (55, '经济管理', 11, '2023-05-27 03:45:59', '2023-05-27 03:45:59', 0);
INSERT INTO `base_category3` VALUES (56, '文化/学术', 11, '2023-05-27 03:45:59', '2023-05-27 03:45:59', 0);
INSERT INTO `base_category3` VALUES (57, '少儿', 11, '2023-05-27 03:45:59', '2023-05-27 03:45:59', 0);
INSERT INTO `base_category3` VALUES (58, '工具书', 12, '2023-05-27 03:45:59', '2023-05-27 03:45:59', 0);
INSERT INTO `base_category3` VALUES (59, '杂志/期刊', 12, '2023-05-27 03:45:59', '2023-05-27 03:45:59', 0);
INSERT INTO `base_category3` VALUES (60, '套装书', 12, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (61, '手机', 13, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (62, '对讲机', 13, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (63, '合约机', 14, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (64, '选号中心', 14, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (65, '装宽带', 14, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (66, '办套餐', 14, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (67, '移动电源', 15, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (68, '电池/移动电源', 15, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (69, '蓝牙耳机', 15, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (70, '充电器/数据线', 15, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (71, '苹果周边', 15, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (72, '手机耳机', 15, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (73, '手机贴膜', 15, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (74, '手机存储卡', 15, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (75, '充电器', 15, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (76, '数据线', 15, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (77, '手机保护套', 15, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (78, '车载配件', 15, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (79, 'iPhone 配件', 15, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (80, '手机电池', 15, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (81, '创意配件', 15, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (82, '便携/无线音响', 15, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (83, '手机饰品', 15, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (84, '拍照配件', 15, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (85, '手机支架', 15, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (86, '平板电视', 16, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (87, '空调', 16, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (88, '冰箱', 16, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (89, '洗衣机', 16, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (90, '家庭影院', 16, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (91, 'DVD/电视盒子', 16, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (92, '迷你音响', 16, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (93, '冷柜/冰吧', 16, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (94, '家电配件', 16, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (95, '功放', 16, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (96, '回音壁/Soundbar', 16, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (97, 'Hi-Fi专区', 16, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (98, '电视盒子', 16, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (99, '酒柜', 16, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (100, '燃气灶', 17, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (101, '油烟机', 17, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (102, '热水器', 17, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (103, '消毒柜', 17, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (104, '洗碗机', 17, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (105, '料理机', 18, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (106, '榨汁机', 18, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (107, '电饭煲', 18, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (108, '电压力锅', 18, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (109, '豆浆机', 18, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (110, '咖啡机', 18, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (111, '微波炉', 18, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (112, '电烤箱', 18, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (113, '电磁炉', 18, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (114, '面包机', 18, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (115, '煮蛋器', 18, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (116, '酸奶机', 18, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (117, '电炖锅', 18, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (118, '电水壶/热水瓶', 18, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (119, '电饼铛', 18, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (120, '多用途锅', 18, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (121, '电烧烤炉', 18, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (122, '果蔬解毒机', 18, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (123, '其它厨房电器', 18, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (124, '养生壶/煎药壶', 18, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (125, '电热饭盒', 18, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (126, '取暖电器', 19, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (127, '净化器', 19, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (128, '加湿器', 19, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (129, '扫地机器人', 19, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (130, '吸尘器', 19, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (131, '挂烫机/熨斗', 19, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (132, '插座', 19, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (133, '电话机', 19, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (134, '清洁机', 19, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (135, '除湿机', 19, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (136, '干衣机', 19, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (137, '收录/音机', 19, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (138, '电风扇', 19, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (139, '冷风扇', 19, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (140, '其它生活电器', 19, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (141, '生活电器配件', 19, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (142, '净水器', 19, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (143, '饮水机', 19, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (144, '剃须刀', 20, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (145, '剃/脱毛器', 20, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (146, '口腔护理', 20, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (147, '电吹风', 20, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (148, '美容器', 20, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (149, '理发器', 20, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (150, '卷/直发器', 20, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (151, '按摩椅', 20, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (152, '按摩器', 20, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (153, '足浴盆', 20, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (154, '血压计', 20, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (155, '电子秤/厨房秤', 20, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (156, '血糖仪', 20, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (157, '体温计', 20, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (158, '其它健康电器', 20, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (159, '计步器/脂肪检测仪', 20, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (160, '电动工具', 21, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (161, '手动工具', 21, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (162, '仪器仪表', 21, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (163, '浴霸/排气扇', 21, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (164, '灯具', 21, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (165, 'LED灯', 21, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (166, '洁身器', 21, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (167, '水槽', 21, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (168, '龙头', 21, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (169, '淋浴花洒', 21, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (170, '厨卫五金', 21, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (171, '家具五金', 21, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (172, '门铃', 21, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (173, '电气开关', 21, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (174, '插座', 21, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (175, '电工电料', 21, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (176, '监控安防', 21, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (177, '电线/线缆', 21, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (178, '数码相机', 22, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (179, '单电/微单相机', 22, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (180, '单反相机', 22, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (181, '摄像机', 22, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (182, '拍立得', 22, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (183, '运动相机', 22, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (184, '镜头', 22, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (185, '户外器材', 22, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (186, '影棚器材', 22, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (187, '冲印服务', 22, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (188, '数码相框', 22, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (189, '存储卡', 23, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (190, '读卡器', 23, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (191, '滤镜', 23, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (192, '闪光灯/手柄', 23, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (193, '相机包', 23, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (194, '三脚架/云台', 23, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (195, '相机清洁/贴膜', 23, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (196, '机身附件', 23, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (197, '镜头附件', 23, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (198, '电池/充电器', 23, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (199, '移动电源', 23, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (200, '数码支架', 23, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (201, '智能手环', 24, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (202, '智能手表', 24, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (203, '智能眼镜', 24, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (204, '运动跟踪器', 24, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (205, '健康监测', 24, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (206, '智能配饰', 24, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (207, '智能家居', 24, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (208, '体感车', 24, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (209, '其他配件', 24, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (210, '智能机器人', 24, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (211, '无人机', 24, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (212, 'MP3/MP4', 25, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (213, '智能设备', 25, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (214, '耳机/耳麦', 25, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (215, '便携/无线音箱', 25, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (216, '音箱/音响', 25, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (217, '高清播放器', 25, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (218, '收音机', 25, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (219, 'MP3/MP4配件', 25, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (220, '麦克风', 25, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (221, '专业音频', 25, '2023-05-27 03:46:00', '2023-05-27 03:46:00', 0);
INSERT INTO `base_category3` VALUES (222, '苹果配件', 25, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (223, '学生平板', 26, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (224, '点读机/笔', 26, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (225, '早教益智', 26, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (226, '录音笔', 26, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (227, '电纸书', 26, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (228, '电子词典', 26, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (229, '复读机', 26, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (230, '延保服务', 27, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (231, '杀毒软件', 27, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (232, '积分商品', 27, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (233, '桌布/罩件', 28, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (234, '地毯地垫', 28, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (235, '沙发垫套/椅垫', 28, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (236, '床品套件', 28, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (237, '被子', 28, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (238, '枕芯', 28, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (239, '床单被罩', 28, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (240, '毯子', 28, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (241, '床垫/床褥', 28, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (242, '蚊帐', 28, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (243, '抱枕靠垫', 28, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (244, '毛巾浴巾', 28, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (245, '电热毯', 28, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (246, '窗帘/窗纱', 28, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (247, '布艺软饰', 28, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (248, '凉席', 28, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (249, '台灯', 29, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (250, '节能灯', 29, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (251, '装饰灯', 29, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (252, '落地灯', 29, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (253, '应急灯/手电', 29, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (254, 'LED灯', 29, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (255, '吸顶灯', 29, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (256, '五金电器', 29, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (257, '筒灯射灯', 29, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (258, '吊灯', 29, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (259, '氛围照明', 29, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (260, '保暖防护', 30, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (261, '收纳用品', 30, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (262, '雨伞雨具', 30, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (263, '浴室用品', 30, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (264, '缝纫/针织用品', 30, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (265, '洗晒/熨烫', 30, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (266, '净化除味', 30, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (267, '相框/照片墙', 31, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (268, '装饰字画', 31, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (269, '节庆饰品', 31, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (270, '手工/十字绣', 31, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (271, '装饰摆件', 31, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (272, '帘艺隔断', 31, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (273, '墙贴/装饰贴', 31, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (274, '钟饰', 31, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (275, '花瓶花艺', 31, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (276, '香薰蜡烛', 31, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (277, '创意家居', 31, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (278, '宠物主粮', 32, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (279, '宠物零食', 32, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (280, '医疗保健', 32, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (281, '家居日用', 32, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (282, '宠物玩具', 32, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (283, '出行装备', 32, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (284, '洗护美容', 32, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (285, '笔记本', 33, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (286, '超极本', 33, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (287, '游戏本', 33, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (288, '平板电脑', 33, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (289, '平板电脑配件', 33, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (290, '台式机', 33, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (291, '服务器/工作站', 33, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (292, '笔记本配件', 33, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (293, '一体机', 33, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (294, 'CPU', 34, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (295, '主板', 34, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (296, '显卡', 34, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (297, '硬盘', 34, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (298, 'SSD固态硬盘', 34, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (299, '内存', 34, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (300, '机箱', 34, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (301, '电源', 34, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (302, '显示器', 34, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (303, '刻录机/光驱', 34, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (304, '散热器', 34, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (305, '声卡/扩展卡', 34, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (306, '装机配件', 34, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (307, '组装电脑', 34, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (308, '移动硬盘', 35, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (309, 'U盘', 35, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (310, '鼠标', 35, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (311, '键盘', 35, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (312, '鼠标垫', 35, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (313, '摄像头', 35, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (314, '手写板', 35, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (315, '硬盘盒', 35, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (316, '插座', 35, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (317, '线缆', 35, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (318, 'UPS电源', 35, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (319, '电脑工具', 35, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (320, '游戏设备', 35, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (321, '电玩', 35, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (322, '电脑清洁', 35, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (323, '网络仪表仪器', 35, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (324, '游戏机', 36, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (325, '游戏耳机', 36, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (326, '手柄/方向盘', 36, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (327, '游戏软件', 36, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (328, '游戏周边', 36, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (329, '路由器', 37, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (330, '网卡', 37, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (331, '交换机', 37, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (332, '网络存储', 37, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (333, '4G/3G上网', 37, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (334, '网络盒子', 37, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (335, '网络配件', 37, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (336, '投影机', 38, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (337, '投影配件', 38, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (338, '多功能一体机', 38, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (339, '打印机', 38, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (340, '传真设备', 38, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (341, '验钞/点钞机', 38, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (342, '扫描设备', 38, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (343, '复合机', 38, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (344, '碎纸机', 38, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (345, '考勤机', 38, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (346, '收款/POS机', 38, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (347, '会议音频视频', 38, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (348, '保险柜', 38, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (349, '装订/封装机', 38, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (350, '安防监控', 38, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (351, '办公家具', 38, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (352, '白板', 38, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (353, '硒鼓/墨粉', 39, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (354, '墨盒', 39, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (355, '色带', 39, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (356, '纸类', 39, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (357, '办公文具', 39, '2023-05-27 03:46:01', '2023-05-27 03:46:01', 0);
INSERT INTO `base_category3` VALUES (358, '学生文具', 39, '2023-05-27 03:46:02', '2023-05-27 03:46:02', 0);
INSERT INTO `base_category3` VALUES (359, '财会用品', 39, '2023-05-27 03:46:02', '2023-05-27 03:46:02', 0);
INSERT INTO `base_category3` VALUES (360, '文件管理', 39, '2023-05-27 03:46:02', '2023-05-27 03:46:02', 0);
INSERT INTO `base_category3` VALUES (361, '本册/便签', 39, '2023-05-27 03:46:02', '2023-05-27 03:46:02', 0);
INSERT INTO `base_category3` VALUES (362, '计算器', 39, '2023-05-27 03:46:02', '2023-05-27 03:46:02', 0);
INSERT INTO `base_category3` VALUES (363, '笔类', 39, '2023-05-27 03:46:02', '2023-05-27 03:46:02', 0);
INSERT INTO `base_category3` VALUES (364, '画具画材', 39, '2023-05-27 03:46:02', '2023-05-27 03:46:02', 0);
INSERT INTO `base_category3` VALUES (365, '刻录碟片/附件', 39, '2023-05-27 03:46:02', '2023-05-27 03:46:02', 0);
INSERT INTO `base_category3` VALUES (366, '上门安装', 40, '2023-05-27 03:46:02', '2023-05-27 03:46:02', 0);
INSERT INTO `base_category3` VALUES (367, '延保服务', 40, '2023-05-27 03:46:02', '2023-05-27 03:46:02', 0);
INSERT INTO `base_category3` VALUES (368, '维修保养', 40, '2023-05-27 03:46:02', '2023-05-27 03:46:02', 0);
INSERT INTO `base_category3` VALUES (369, '电脑软件', 40, '2023-05-27 03:46:02', '2023-05-27 03:46:02', 0);
INSERT INTO `base_category3` VALUES (370, '京东服务', 40, '2023-05-27 03:46:02', '2023-05-27 03:46:02', 0);
INSERT INTO `base_category3` VALUES (371, '炒锅', 41, '2023-05-27 03:46:02', '2023-05-27 03:46:02', 0);
INSERT INTO `base_category3` VALUES (372, '煎锅', 41, '2023-05-27 03:46:02', '2023-05-27 03:46:02', 0);
INSERT INTO `base_category3` VALUES (373, '压力锅', 41, '2023-05-27 03:46:02', '2023-05-27 03:46:02', 0);
INSERT INTO `base_category3` VALUES (374, '蒸锅', 41, '2023-05-27 03:46:02', '2023-05-27 03:46:02', 0);
INSERT INTO `base_category3` VALUES (375, '汤锅', 41, '2023-05-27 03:46:02', '2023-05-27 03:46:02', 0);
INSERT INTO `base_category3` VALUES (376, '奶锅', 41, '2023-05-27 03:46:02', '2023-05-27 03:46:02', 0);
INSERT INTO `base_category3` VALUES (377, '锅具套装', 41, '2023-05-27 03:46:02', '2023-05-27 03:46:02', 0);
INSERT INTO `base_category3` VALUES (378, '煲类', 41, '2023-05-27 03:46:02', '2023-05-27 03:46:02', 0);
INSERT INTO `base_category3` VALUES (379, '水壶', 41, '2023-05-27 03:46:02', '2023-05-27 03:46:02', 0);
INSERT INTO `base_category3` VALUES (380, '火锅', 41, '2023-05-27 03:46:02', '2023-05-27 03:46:02', 0);
INSERT INTO `base_category3` VALUES (381, '菜刀', 42, '2023-05-27 03:46:02', '2023-05-27 03:46:02', 0);
INSERT INTO `base_category3` VALUES (382, '剪刀', 42, '2023-05-27 03:46:02', '2023-05-27 03:46:02', 0);
INSERT INTO `base_category3` VALUES (383, '刀具套装', 42, '2023-05-27 03:46:02', '2023-05-27 03:46:02', 0);
INSERT INTO `base_category3` VALUES (384, '砧板', 42, '2023-05-27 03:46:02', '2023-05-27 03:46:02', 0);
INSERT INTO `base_category3` VALUES (385, '瓜果刀/刨', 42, '2023-05-27 03:46:02', '2023-05-27 03:46:02', 0);
INSERT INTO `base_category3` VALUES (386, '多功能刀', 42, '2023-05-27 03:46:02', '2023-05-27 03:46:02', 0);
INSERT INTO `base_category3` VALUES (387, '保鲜盒', 43, '2023-05-27 03:46:02', '2023-05-27 03:46:02', 0);
INSERT INTO `base_category3` VALUES (388, '烘焙/烧烤', 43, '2023-05-27 03:46:02', '2023-05-27 03:46:02', 0);
INSERT INTO `base_category3` VALUES (389, '饭盒/提锅', 43, '2023-05-27 03:46:02', '2023-05-27 03:46:02', 0);
INSERT INTO `base_category3` VALUES (390, '储物/置物架', 43, '2023-05-27 03:46:02', '2023-05-27 03:46:02', 0);
INSERT INTO `base_category3` VALUES (391, '厨房DIY/小工具', 43, '2023-05-27 03:46:02', '2023-05-27 03:46:02', 0);
INSERT INTO `base_category3` VALUES (392, '塑料杯', 44, '2023-05-27 03:46:02', '2023-05-27 03:46:02', 0);
INSERT INTO `base_category3` VALUES (393, '运动水壶', 44, '2023-05-27 03:46:02', '2023-05-27 03:46:02', 0);
INSERT INTO `base_category3` VALUES (394, '玻璃杯', 44, '2023-05-27 03:46:02', '2023-05-27 03:46:02', 0);
INSERT INTO `base_category3` VALUES (395, '陶瓷/马克杯', 44, '2023-05-27 03:46:02', '2023-05-27 03:46:02', 0);
INSERT INTO `base_category3` VALUES (396, '保温杯', 44, '2023-05-27 03:46:02', '2023-05-27 03:46:02', 0);
INSERT INTO `base_category3` VALUES (397, '保温壶', 44, '2023-05-27 03:46:02', '2023-05-27 03:46:02', 0);
INSERT INTO `base_category3` VALUES (398, '酒杯/酒具', 44, '2023-05-27 03:46:02', '2023-05-27 03:46:02', 0);
INSERT INTO `base_category3` VALUES (399, '杯具套装', 44, '2023-05-27 03:46:02', '2023-05-27 03:46:02', 0);
INSERT INTO `base_category3` VALUES (400, '餐具套装', 45, '2023-05-27 03:46:02', '2023-05-27 03:46:02', 0);
INSERT INTO `base_category3` VALUES (401, '碗/碟/盘', 45, '2023-05-27 03:46:02', '2023-05-27 03:46:02', 0);
INSERT INTO `base_category3` VALUES (402, '筷勺/刀叉', 45, '2023-05-27 03:46:02', '2023-05-27 03:46:02', 0);
INSERT INTO `base_category3` VALUES (403, '一次性用品', 45, '2023-05-27 03:46:02', '2023-05-27 03:46:02', 0);
INSERT INTO `base_category3` VALUES (404, '果盘/果篮', 45, '2023-05-27 03:46:02', '2023-05-27 03:46:02', 0);
INSERT INTO `base_category3` VALUES (405, '自助餐炉', 46, '2023-05-27 03:46:02', '2023-05-27 03:46:02', 0);
INSERT INTO `base_category3` VALUES (406, '酒店餐具', 46, '2023-05-27 03:46:02', '2023-05-27 03:46:02', 0);
INSERT INTO `base_category3` VALUES (407, '酒店水具', 46, '2023-05-27 03:46:02', '2023-05-27 03:46:02', 0);
INSERT INTO `base_category3` VALUES (408, '整套茶具', 47, '2023-05-27 03:46:02', '2023-05-27 03:46:02', 0);
INSERT INTO `base_category3` VALUES (409, '茶杯', 47, '2023-05-27 03:46:02', '2023-05-27 03:46:02', 0);
INSERT INTO `base_category3` VALUES (410, '茶壶', 47, '2023-05-27 03:46:02', '2023-05-27 03:46:02', 0);
INSERT INTO `base_category3` VALUES (411, '茶盘茶托', 47, '2023-05-27 03:46:02', '2023-05-27 03:46:02', 0);
INSERT INTO `base_category3` VALUES (412, '茶叶罐', 47, '2023-05-27 03:46:02', '2023-05-27 03:46:02', 0);
INSERT INTO `base_category3` VALUES (413, '茶具配件', 47, '2023-05-27 03:46:02', '2023-05-27 03:46:02', 0);
INSERT INTO `base_category3` VALUES (414, '茶宠摆件', 47, '2023-05-27 03:46:02', '2023-05-27 03:46:02', 0);
INSERT INTO `base_category3` VALUES (415, '咖啡具', 47, '2023-05-27 03:46:02', '2023-05-27 03:46:02', 0);
INSERT INTO `base_category3` VALUES (416, '其他', 47, '2023-05-27 03:46:02', '2023-05-27 03:46:02', 0);
INSERT INTO `base_category3` VALUES (417, '纸品湿巾', 48, '2023-05-27 03:46:02', '2023-05-27 03:46:02', 0);
INSERT INTO `base_category3` VALUES (418, '衣物清洁', 48, '2023-05-27 03:46:02', '2023-05-27 03:46:02', 0);
INSERT INTO `base_category3` VALUES (419, '清洁工具', 48, '2023-05-27 03:46:02', '2023-05-27 03:46:02', 0);
INSERT INTO `base_category3` VALUES (420, '驱虫用品', 48, '2023-05-27 03:46:02', '2023-05-27 03:46:02', 0);
INSERT INTO `base_category3` VALUES (421, '家庭清洁', 48, '2023-05-27 03:46:02', '2023-05-27 03:46:02', 0);
INSERT INTO `base_category3` VALUES (422, '皮具护理', 48, '2023-05-27 03:46:02', '2023-05-27 03:46:02', 0);
INSERT INTO `base_category3` VALUES (423, '一次性用品', 48, '2023-05-27 03:46:02', '2023-05-27 03:46:02', 0);
INSERT INTO `base_category3` VALUES (424, '洁面', 49, '2023-05-27 03:46:02', '2023-05-27 03:46:02', 0);
INSERT INTO `base_category3` VALUES (425, '乳液面霜', 49, '2023-05-27 03:46:02', '2023-05-27 03:46:02', 0);
INSERT INTO `base_category3` VALUES (426, '面膜', 49, '2023-05-27 03:46:02', '2023-05-27 03:46:02', 0);
INSERT INTO `base_category3` VALUES (427, '剃须', 49, '2023-05-27 03:46:02', '2023-05-27 03:46:02', 0);
INSERT INTO `base_category3` VALUES (428, '套装', 49, '2023-05-27 03:46:02', '2023-05-27 03:46:02', 0);
INSERT INTO `base_category3` VALUES (429, '精华', 49, '2023-05-27 03:46:02', '2023-05-27 03:46:02', 0);
INSERT INTO `base_category3` VALUES (430, '眼霜', 49, '2023-05-27 03:46:02', '2023-05-27 03:46:02', 0);
INSERT INTO `base_category3` VALUES (431, '卸妆', 49, '2023-05-27 03:46:02', '2023-05-27 03:46:02', 0);
INSERT INTO `base_category3` VALUES (432, '防晒', 49, '2023-05-27 03:46:02', '2023-05-27 03:46:02', 0);
INSERT INTO `base_category3` VALUES (433, '防晒隔离', 49, '2023-05-27 03:46:02', '2023-05-27 03:46:02', 0);
INSERT INTO `base_category3` VALUES (434, 'T区护理', 49, '2023-05-27 03:46:02', '2023-05-27 03:46:02', 0);
INSERT INTO `base_category3` VALUES (435, '眼部护理', 49, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (436, '精华露', 49, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (437, '爽肤水', 49, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (438, '沐浴', 50, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (439, '润肤', 50, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (440, '颈部', 50, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (441, '手足', 50, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (442, '纤体塑形', 50, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (443, '美胸', 50, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (444, '套装', 50, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (445, '精油', 50, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (446, '洗发护发', 50, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (447, '染发/造型', 50, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (448, '香薰精油', 50, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (449, '磨砂/浴盐', 50, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (450, '手工/香皂', 50, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (451, '洗发', 50, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (452, '护发', 50, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (453, '染发', 50, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (454, '磨砂膏', 50, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (455, '香皂', 50, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (456, '牙膏/牙粉', 51, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (457, '牙刷/牙线', 51, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (458, '漱口水', 51, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (459, '套装', 51, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (460, '卫生巾', 52, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (461, '卫生护垫', 52, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (462, '私密护理', 52, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (463, '脱毛膏', 52, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (464, '其他', 52, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (465, '洗发', 53, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (466, '护发', 53, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (467, '染发', 53, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (468, '造型', 53, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (469, '假发', 53, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (470, '套装', 53, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (471, '美发工具', 53, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (472, '脸部护理', 53, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (473, '香水', 54, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (474, '底妆', 54, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (475, '腮红', 54, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (476, '眼影', 54, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (477, '唇部', 54, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (478, '美甲', 54, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (479, '眼线', 54, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (480, '美妆工具', 54, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (481, '套装', 54, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (482, '防晒隔离', 54, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (483, '卸妆', 54, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (484, '眉笔', 54, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (485, '睫毛膏', 54, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (486, 'T恤', 55, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (487, '衬衫', 55, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (488, '针织衫', 55, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (489, '雪纺衫', 55, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (490, '卫衣', 55, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (491, '马甲', 55, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (492, '连衣裙', 55, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (493, '半身裙', 55, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (494, '牛仔裤', 55, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (495, '休闲裤', 55, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (496, '打底裤', 55, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (497, '正装裤', 55, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (498, '小西装', 55, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (499, '短外套', 55, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (500, '风衣', 55, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (501, '毛呢大衣', 55, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (502, '真皮皮衣', 55, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (503, '棉服', 55, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (504, '羽绒服', 55, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (505, '大码女装', 55, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (506, '中老年女装', 55, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (507, '婚纱', 55, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (508, '打底衫', 55, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (509, '旗袍/唐装', 55, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (510, '加绒裤', 55, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (511, '吊带/背心', 55, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (512, '羊绒衫', 55, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (513, '短裤', 55, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (514, '皮草', 55, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (515, '礼服', 55, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (516, '仿皮皮衣', 55, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (517, '羊毛衫', 55, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (518, '设计师/潮牌', 55, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (519, '衬衫', 56, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (520, 'T恤', 56, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (521, 'POLO衫', 56, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (522, '针织衫', 56, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (523, '羊绒衫', 56, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (524, '卫衣', 56, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (525, '马甲/背心', 56, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (526, '夹克', 56, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (527, '风衣', 56, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (528, '毛呢大衣', 56, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (529, '仿皮皮衣', 56, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (530, '西服', 56, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (531, '棉服', 56, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (532, '羽绒服', 56, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (533, '牛仔裤', 56, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (534, '休闲裤', 56, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (535, '西裤', 56, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (536, '西服套装', 56, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (537, '大码男装', 56, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (538, '中老年男装', 56, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (539, '唐装/中山装', 56, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (540, '工装', 56, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (541, '真皮皮衣', 56, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (542, '加绒裤', 56, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (543, '卫裤/运动裤', 56, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (544, '短裤', 56, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (545, '设计师/潮牌', 56, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (546, '羊毛衫', 56, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (547, '文胸', 57, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (548, '女式内裤', 57, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (549, '男式内裤', 57, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (550, '睡衣/家居服', 57, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (551, '塑身美体', 57, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (552, '泳衣', 57, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (553, '吊带/背心', 57, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (554, '抹胸', 57, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (555, '连裤袜/丝袜', 57, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (556, '美腿袜', 57, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (557, '商务男袜', 57, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (558, '保暖内衣', 57, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (559, '情侣睡衣', 57, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (560, '文胸套装', 57, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (561, '少女文胸', 57, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (562, '休闲棉袜', 57, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (563, '大码内衣', 57, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (564, '内衣配件', 57, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (565, '打底裤袜', 57, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (566, '打底衫', 57, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (567, '秋衣秋裤', 57, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (568, '情趣内衣', 57, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (569, '服装洗护', 58, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (570, '太阳镜', 59, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (571, '光学镜架/镜片', 59, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (572, '围巾/手套/帽子套装', 59, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (573, '袖扣', 59, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (574, '棒球帽', 59, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (575, '毛线帽', 59, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (576, '遮阳帽', 59, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (577, '老花镜', 59, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (578, '装饰眼镜', 59, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (579, '防辐射眼镜', 59, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (580, '游泳镜', 59, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (581, '女士丝巾/围巾/披肩', 59, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (582, '男士丝巾/围巾', 59, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (583, '鸭舌帽', 59, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (584, '贝雷帽', 59, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (585, '礼帽', 59, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (586, '真皮手套', 59, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (587, '毛线手套', 59, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (588, '防晒手套', 59, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (589, '男士腰带/礼盒', 59, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (590, '女士腰带/礼盒', 59, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (591, '钥匙扣', 59, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (592, '遮阳伞/雨伞', 59, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (593, '口罩', 59, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (594, '耳罩/耳包', 59, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (595, '假领', 59, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (596, '毛线/布面料', 59, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (597, '领带/领结/领带夹', 59, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (598, '男表', 60, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (599, '瑞表', 60, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (600, '女表', 60, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (601, '国表', 60, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (602, '日韩表', 60, '2023-05-27 03:46:03', '2023-05-27 03:46:03', 0);
INSERT INTO `base_category3` VALUES (603, '欧美表', 60, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (604, '德表', 60, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (605, '儿童手表', 60, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (606, '智能手表', 60, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (607, '闹钟', 60, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (608, '座钟挂钟', 60, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (609, '钟表配件', 60, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (610, '商务休闲鞋', 61, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (611, '正装鞋', 61, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (612, '休闲鞋', 61, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (613, '凉鞋/沙滩鞋', 61, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (614, '男靴', 61, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (615, '功能鞋', 61, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (616, '拖鞋/人字拖', 61, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (617, '雨鞋/雨靴', 61, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (618, '传统布鞋', 61, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (619, '鞋配件', 61, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (620, '帆布鞋', 61, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (621, '增高鞋', 61, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (622, '工装鞋', 61, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (623, '定制鞋', 61, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (624, '高跟鞋', 62, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (625, '单鞋', 62, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (626, '休闲鞋', 62, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (627, '凉鞋', 62, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (628, '女靴', 62, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (629, '雪地靴', 62, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (630, '拖鞋/人字拖', 62, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (631, '踝靴', 62, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (632, '筒靴', 62, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (633, '帆布鞋', 62, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (634, '雨鞋/雨靴', 62, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (635, '妈妈鞋', 62, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (636, '鞋配件', 62, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (637, '特色鞋', 62, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (638, '鱼嘴鞋', 62, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (639, '布鞋/绣花鞋', 62, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (640, '马丁靴', 62, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (641, '坡跟鞋', 62, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (642, '松糕鞋', 62, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (643, '内增高', 62, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (644, '防水台', 62, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (645, '婴幼奶粉', 63, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (646, '孕妈奶粉', 63, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (647, '益生菌/初乳', 64, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (648, '米粉/菜粉', 64, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (649, '果泥/果汁', 64, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (650, 'DHA', 64, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (651, '宝宝零食', 64, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (652, '钙铁锌/维生素', 64, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (653, '清火/开胃', 64, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (654, '面条/粥', 64, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (655, '婴儿尿裤', 65, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (656, '拉拉裤', 65, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (657, '婴儿湿巾', 65, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (658, '成人尿裤', 65, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (659, '奶瓶奶嘴', 66, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (660, '吸奶器', 66, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (661, '暖奶消毒', 66, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (662, '儿童餐具', 66, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (663, '水壶/水杯', 66, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (664, '牙胶安抚', 66, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (665, '围兜/防溅衣', 66, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (666, '辅食料理机', 66, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (667, '食物存储', 66, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (668, '宝宝护肤', 67, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (669, '洗发沐浴', 67, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (670, '奶瓶清洗', 67, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (671, '驱蚊防晒', 67, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (672, '理发器', 67, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (673, '洗澡用具', 67, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (674, '婴儿口腔清洁', 67, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (675, '洗衣液/皂', 67, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (676, '日常护理', 67, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (677, '座便器', 67, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (678, '婴儿推车', 68, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (679, '餐椅摇椅', 68, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (680, '婴儿床', 68, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (681, '学步车', 68, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (682, '三轮车', 68, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (683, '自行车', 68, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (684, '电动车', 68, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (685, '扭扭车', 68, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (686, '滑板车', 68, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (687, '婴儿床垫', 68, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (688, '婴儿外出服', 69, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (689, '婴儿内衣', 69, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (690, '婴儿礼盒', 69, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (691, '婴儿鞋帽袜', 69, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (692, '安全防护', 69, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (693, '家居床品', 69, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (694, '睡袋/抱被', 69, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (695, '爬行垫', 69, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (696, '妈咪包/背婴带', 70, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (697, '产后塑身', 70, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (698, '文胸/内裤', 70, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (699, '防辐射服', 70, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (700, '孕妈装', 70, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (701, '孕期营养', 70, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (702, '孕妇护肤', 70, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (703, '待产护理', 70, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (704, '月子装', 70, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (705, '防溢乳垫', 70, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (706, '套装', 71, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (707, '上衣', 71, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (708, '裤子', 71, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (709, '裙子', 71, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (710, '内衣/家居服', 71, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (711, '羽绒服/棉服', 71, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (712, '亲子装', 71, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (713, '儿童配饰', 71, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (714, '礼服/演出服', 71, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (715, '运动鞋', 71, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (716, '皮鞋/帆布鞋', 71, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (717, '靴子', 71, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (718, '凉鞋', 71, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (719, '功能鞋', 71, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (720, '户外/运动服', 71, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (721, '提篮式', 72, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (722, '安全座椅', 72, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (723, '增高垫', 72, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (724, '钱包', 73, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (725, '手拿包', 73, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (726, '单肩包', 73, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (727, '双肩包', 73, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (728, '手提包', 73, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (729, '斜挎包', 73, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (730, '钥匙包', 73, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (731, '卡包/零钱包', 73, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (732, '男士钱包', 74, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (733, '男士手包', 74, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (734, '卡包名片夹', 74, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (735, '商务公文包', 74, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (736, '双肩包', 74, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (737, '单肩/斜挎包', 74, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (738, '钥匙包', 74, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (739, '电脑包', 75, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (740, '拉杆箱', 75, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (741, '旅行包', 75, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (742, '旅行配件', 75, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (743, '休闲运动包', 75, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (744, '拉杆包', 75, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (745, '登山包', 75, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (746, '妈咪包', 75, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (747, '书包', 75, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (748, '相机包', 75, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (749, '腰包/胸包', 75, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (750, '火机烟具', 76, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (751, '礼品文具', 76, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (752, '军刀军具', 76, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (753, '收藏品', 76, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (754, '工艺礼品', 76, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (755, '创意礼品', 76, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (756, '礼盒礼券', 76, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (757, '鲜花绿植', 76, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (758, '婚庆节庆', 76, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (759, '京东卡', 76, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (760, '美妆礼品', 76, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (761, '礼品定制', 76, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (762, '京东福卡', 76, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (763, '古董文玩', 76, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (764, '箱包', 77, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (765, '钱包', 77, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (766, '服饰', 77, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (767, '腰带', 77, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (768, '太阳镜/眼镜框', 77, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (769, '配件', 77, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (770, '鞋靴', 77, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (771, '饰品', 77, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (772, '名品腕表', 77, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (773, '高档化妆品', 77, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (774, '婚嫁首饰', 78, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (775, '婚纱摄影', 78, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (776, '婚纱礼服', 78, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (777, '婚庆服务', 78, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (778, '婚庆礼品/用品', 78, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (779, '婚宴', 78, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (780, '饼干蛋糕', 79, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (781, '糖果/巧克力', 79, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (782, '休闲零食', 79, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (783, '冲调饮品', 79, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (784, '粮油调味', 79, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (785, '牛奶', 79, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (786, '其他特产', 80, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (787, '新疆', 80, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (788, '北京', 80, '2023-05-27 03:46:04', '2023-05-27 03:46:04', 0);
INSERT INTO `base_category3` VALUES (789, '山西', 80, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (790, '内蒙古', 80, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (791, '福建', 80, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (792, '湖南', 80, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (793, '四川', 80, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (794, '云南', 80, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (795, '东北', 80, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (796, '休闲零食', 81, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (797, '坚果炒货', 81, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (798, '肉干肉脯', 81, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (799, '蜜饯果干', 81, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (800, '糖果/巧克力', 81, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (801, '饼干蛋糕', 81, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (802, '无糖食品', 81, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (803, '米面杂粮', 82, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (804, '食用油', 82, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (805, '调味品', 82, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (806, '南北干货', 82, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (807, '方便食品', 82, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (808, '有机食品', 82, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (809, '饮用水', 83, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (810, '饮料', 83, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (811, '牛奶乳品', 83, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (812, '咖啡/奶茶', 83, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (813, '冲饮谷物', 83, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (814, '蜂蜜/柚子茶', 83, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (815, '成人奶粉', 83, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (816, '月饼', 84, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (817, '大闸蟹', 84, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (818, '粽子', 84, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (819, '卡券', 84, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (820, '铁观音', 85, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (821, '普洱', 85, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (822, '龙井', 85, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (823, '绿茶', 85, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (824, '红茶', 85, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (825, '乌龙茶', 85, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (826, '花草茶', 85, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (827, '花果茶', 85, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (828, '养生茶', 85, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (829, '黑茶', 85, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (830, '白茶', 85, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (831, '其它茶', 85, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (832, '项链', 86, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (833, '手链/脚链', 86, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (834, '戒指', 86, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (835, '耳饰', 86, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (836, '毛衣链', 86, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (837, '发饰/发卡', 86, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (838, '胸针', 86, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (839, '饰品配件', 86, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (840, '婚庆饰品', 86, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (841, '黄金吊坠', 87, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (842, '黄金项链', 87, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (843, '黄金转运珠', 87, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (844, '黄金手镯/手链/脚链', 87, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (845, '黄金耳饰', 87, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (846, '黄金戒指', 87, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (847, 'K金吊坠', 88, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (848, 'K金项链', 88, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (849, 'K金手镯/手链/脚链', 88, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (850, 'K金戒指', 88, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (851, 'K金耳饰', 88, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (852, '投资金', 89, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (853, '投资银', 89, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (854, '投资收藏', 89, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (855, '银吊坠/项链', 90, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (856, '银手镯/手链/脚链', 90, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (857, '银戒指', 90, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (858, '银耳饰', 90, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (859, '足银手镯', 90, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (860, '宝宝银饰', 90, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (861, '裸钻', 91, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (862, '钻戒', 91, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (863, '钻石项链/吊坠', 91, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (864, '钻石耳饰', 91, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (865, '钻石手镯/手链', 91, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (866, '项链/吊坠', 92, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (867, '手镯/手串', 92, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (868, '戒指', 92, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (869, '耳饰', 92, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (870, '挂件/摆件/把件', 92, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (871, '玉石孤品', 92, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (872, '项链/吊坠', 93, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (873, '耳饰', 93, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (874, '手镯/手链/脚链', 93, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (875, '戒指', 93, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (876, '头饰/胸针', 93, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (877, '摆件/挂件', 93, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (878, '琥珀/蜜蜡', 94, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (879, '碧玺', 94, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (880, '红宝石/蓝宝石', 94, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (881, '坦桑石', 94, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (882, '珊瑚', 94, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (883, '祖母绿', 94, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (884, '葡萄石', 94, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (885, '其他天然宝石', 94, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (886, '项链/吊坠', 94, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (887, '耳饰', 94, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (888, '手镯/手链', 94, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (889, '戒指', 94, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (890, '铂金项链/吊坠', 95, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (891, '铂金手镯/手链/脚链', 95, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (892, '铂金戒指', 95, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (893, '铂金耳饰', 95, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (894, '小叶紫檀', 96, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (895, '黄花梨', 96, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (896, '沉香木', 96, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (897, '金丝楠', 96, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (898, '菩提', 96, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (899, '其他', 96, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (900, '橄榄核/核桃', 96, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (901, '檀香', 96, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (902, '珍珠项链', 97, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (903, '珍珠吊坠', 97, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (904, '珍珠耳饰', 97, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (905, '珍珠手链', 97, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (906, '珍珠戒指', 97, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (907, '珍珠胸针', 97, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (908, '机油', 98, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (909, '正时皮带', 98, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (910, '添加剂', 98, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (911, '汽车喇叭', 98, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (912, '防冻液', 98, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (913, '汽车玻璃', 98, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (914, '滤清器', 98, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (915, '火花塞', 98, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (916, '减震器', 98, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (917, '柴机油/辅助油', 98, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (918, '雨刷', 98, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (919, '车灯', 98, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (920, '后视镜', 98, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (921, '轮胎', 98, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (922, '轮毂', 98, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (923, '刹车片/盘', 98, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (924, '维修配件', 98, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (925, '蓄电池', 98, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (926, '底盘装甲/护板', 98, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (927, '贴膜', 98, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (928, '汽修工具', 98, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (929, '改装配件', 98, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (930, '导航仪', 99, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (931, '安全预警仪', 99, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (932, '行车记录仪', 99, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (933, '倒车雷达', 99, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (934, '蓝牙设备', 99, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (935, '车载影音', 99, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (936, '净化器', 99, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (937, '电源', 99, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (938, '智能驾驶', 99, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (939, '车载电台', 99, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (940, '车载电器配件', 99, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (941, '吸尘器', 99, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (942, '智能车机', 99, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (943, '冰箱', 99, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (944, '汽车音响', 99, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (945, '车载生活电器', 99, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (946, '车蜡', 100, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (947, '补漆笔', 100, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (948, '玻璃水', 100, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (949, '清洁剂', 100, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (950, '洗车工具', 100, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (951, '镀晶镀膜', 100, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (952, '打蜡机', 100, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (953, '洗车配件', 100, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (954, '洗车机', 100, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (955, '洗车水枪', 100, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (956, '毛巾掸子', 100, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (957, '脚垫', 101, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (958, '座垫', 101, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (959, '座套', 101, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (960, '后备箱垫', 101, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (961, '头枕腰靠', 101, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (962, '方向盘套', 101, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (963, '香水', 101, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (964, '空气净化', 101, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (965, '挂件摆件', 101, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (966, '功能小件', 101, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (967, '车身装饰件', 101, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (968, '车衣', 101, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (969, '安全座椅', 102, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (970, '胎压监测', 102, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (971, '防盗设备', 102, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (972, '应急救援', 102, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (973, '保温箱', 102, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (974, '地锁', 102, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (975, '摩托车', 102, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (976, '充气泵', 102, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (977, '储物箱', 102, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (978, '自驾野营', 102, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (979, '摩托车装备', 102, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (980, '清洗美容', 103, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (981, '功能升级', 103, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (982, '保养维修', 103, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (983, '油卡充值', 103, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (984, '车险', 103, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (985, '加油卡', 103, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (986, 'ETC', 103, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (987, '驾驶培训', 103, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (988, '赛事服装', 104, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (989, '赛事用品', 104, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (990, '制动系统', 104, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (991, '悬挂系统', 104, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (992, '进气系统', 104, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (993, '排气系统', 104, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (994, '电子管理', 104, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (995, '车身强化', 104, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (996, '赛事座椅', 104, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (997, '跑步鞋', 105, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (998, '休闲鞋', 105, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (999, '篮球鞋', 105, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (1000, '板鞋', 105, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (1001, '帆布鞋', 105, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (1002, '足球鞋', 105, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (1003, '乒羽网鞋', 105, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (1004, '专项运动鞋', 105, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (1005, '训练鞋', 105, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (1006, '拖鞋', 105, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (1007, '运动包', 105, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (1008, '羽绒服', 106, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (1009, '棉服', 106, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (1010, '运动裤', 106, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (1011, '夹克/风衣', 106, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (1012, '卫衣/套头衫', 106, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (1013, 'T恤', 106, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (1014, '套装', 106, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (1015, '乒羽网服', 106, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (1016, '健身服', 106, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (1017, '运动背心', 106, '2023-05-27 03:46:05', '2023-05-27 03:46:05', 0);
INSERT INTO `base_category3` VALUES (1018, '毛衫/线衫', 106, '2023-05-27 03:46:06', '2023-05-27 03:46:06', 0);
INSERT INTO `base_category3` VALUES (1019, '运动配饰', 106, '2023-05-27 03:46:06', '2023-05-27 03:46:06', 0);
INSERT INTO `base_category3` VALUES (1020, '折叠车', 107, '2023-05-27 03:46:06', '2023-05-27 03:46:06', 0);
INSERT INTO `base_category3` VALUES (1021, '山地车/公路车', 107, '2023-05-27 03:46:06', '2023-05-27 03:46:06', 0);
INSERT INTO `base_category3` VALUES (1022, '电动车', 107, '2023-05-27 03:46:06', '2023-05-27 03:46:06', 0);
INSERT INTO `base_category3` VALUES (1023, '其他整车', 107, '2023-05-27 03:46:06', '2023-05-27 03:46:06', 0);
INSERT INTO `base_category3` VALUES (1024, '骑行服', 107, '2023-05-27 03:46:06', '2023-05-27 03:46:06', 0);
INSERT INTO `base_category3` VALUES (1025, '骑行装备', 107, '2023-05-27 03:46:06', '2023-05-27 03:46:06', 0);
INSERT INTO `base_category3` VALUES (1026, '平衡车', 107, '2023-05-27 03:46:06', '2023-05-27 03:46:06', 0);
INSERT INTO `base_category3` VALUES (1027, '鱼竿鱼线', 108, '2023-05-27 03:46:06', '2023-05-27 03:46:06', 0);
INSERT INTO `base_category3` VALUES (1028, '浮漂鱼饵', 108, '2023-05-27 03:46:06', '2023-05-27 03:46:06', 0);
INSERT INTO `base_category3` VALUES (1029, '钓鱼桌椅', 108, '2023-05-27 03:46:06', '2023-05-27 03:46:06', 0);
INSERT INTO `base_category3` VALUES (1030, '钓鱼配件', 108, '2023-05-27 03:46:06', '2023-05-27 03:46:06', 0);
INSERT INTO `base_category3` VALUES (1031, '钓箱鱼包', 108, '2023-05-27 03:46:06', '2023-05-27 03:46:06', 0);
INSERT INTO `base_category3` VALUES (1032, '其它', 108, '2023-05-27 03:46:06', '2023-05-27 03:46:06', 0);
INSERT INTO `base_category3` VALUES (1033, '泳镜', 109, '2023-05-27 03:46:06', '2023-05-27 03:46:06', 0);
INSERT INTO `base_category3` VALUES (1034, '泳帽', 109, '2023-05-27 03:46:06', '2023-05-27 03:46:06', 0);
INSERT INTO `base_category3` VALUES (1035, '游泳包防水包', 109, '2023-05-27 03:46:06', '2023-05-27 03:46:06', 0);
INSERT INTO `base_category3` VALUES (1036, '女士泳衣', 109, '2023-05-27 03:46:06', '2023-05-27 03:46:06', 0);
INSERT INTO `base_category3` VALUES (1037, '男士泳衣', 109, '2023-05-27 03:46:06', '2023-05-27 03:46:06', 0);
INSERT INTO `base_category3` VALUES (1038, '比基尼', 109, '2023-05-27 03:46:06', '2023-05-27 03:46:06', 0);
INSERT INTO `base_category3` VALUES (1039, '其它', 109, '2023-05-27 03:46:06', '2023-05-27 03:46:06', 0);
INSERT INTO `base_category3` VALUES (1040, '冲锋衣裤', 110, '2023-05-27 03:46:06', '2023-05-27 03:46:06', 0);
INSERT INTO `base_category3` VALUES (1041, '速干衣裤', 110, '2023-05-27 03:46:06', '2023-05-27 03:46:06', 0);
INSERT INTO `base_category3` VALUES (1042, '滑雪服', 110, '2023-05-27 03:46:06', '2023-05-27 03:46:06', 0);
INSERT INTO `base_category3` VALUES (1043, '羽绒服/棉服', 110, '2023-05-27 03:46:06', '2023-05-27 03:46:06', 0);
INSERT INTO `base_category3` VALUES (1044, '休闲衣裤', 110, '2023-05-27 03:46:06', '2023-05-27 03:46:06', 0);
INSERT INTO `base_category3` VALUES (1045, '抓绒衣裤', 110, '2023-05-27 03:46:06', '2023-05-27 03:46:06', 0);
INSERT INTO `base_category3` VALUES (1046, '软壳衣裤', 110, '2023-05-27 03:46:06', '2023-05-27 03:46:06', 0);
INSERT INTO `base_category3` VALUES (1047, 'T恤', 110, '2023-05-27 03:46:06', '2023-05-27 03:46:06', 0);
INSERT INTO `base_category3` VALUES (1048, '户外风衣', 110, '2023-05-27 03:46:06', '2023-05-27 03:46:06', 0);
INSERT INTO `base_category3` VALUES (1049, '功能内衣', 110, '2023-05-27 03:46:06', '2023-05-27 03:46:06', 0);
INSERT INTO `base_category3` VALUES (1050, '军迷服饰', 110, '2023-05-27 03:46:06', '2023-05-27 03:46:06', 0);
INSERT INTO `base_category3` VALUES (1051, '登山鞋', 110, '2023-05-27 03:46:06', '2023-05-27 03:46:06', 0);
INSERT INTO `base_category3` VALUES (1052, '雪地靴', 110, '2023-05-27 03:46:06', '2023-05-27 03:46:06', 0);
INSERT INTO `base_category3` VALUES (1053, '徒步鞋', 110, '2023-05-27 03:46:06', '2023-05-27 03:46:06', 0);
INSERT INTO `base_category3` VALUES (1054, '越野跑鞋', 110, '2023-05-27 03:46:06', '2023-05-27 03:46:06', 0);
INSERT INTO `base_category3` VALUES (1055, '休闲鞋', 110, '2023-05-27 03:46:06', '2023-05-27 03:46:06', 0);
INSERT INTO `base_category3` VALUES (1056, '工装鞋', 110, '2023-05-27 03:46:06', '2023-05-27 03:46:06', 0);
INSERT INTO `base_category3` VALUES (1057, '溯溪鞋', 110, '2023-05-27 03:46:06', '2023-05-27 03:46:06', 0);
INSERT INTO `base_category3` VALUES (1058, '沙滩/凉拖', 110, '2023-05-27 03:46:06', '2023-05-27 03:46:06', 0);
INSERT INTO `base_category3` VALUES (1059, '户外袜', 110, '2023-05-27 03:46:06', '2023-05-27 03:46:06', 0);
INSERT INTO `base_category3` VALUES (1060, '帐篷/垫子', 111, '2023-05-27 03:46:06', '2023-05-27 03:46:06', 0);
INSERT INTO `base_category3` VALUES (1061, '睡袋/吊床', 111, '2023-05-27 03:46:06', '2023-05-27 03:46:06', 0);
INSERT INTO `base_category3` VALUES (1062, '登山攀岩', 111, '2023-05-27 03:46:06', '2023-05-27 03:46:06', 0);
INSERT INTO `base_category3` VALUES (1063, '户外配饰', 111, '2023-05-27 03:46:06', '2023-05-27 03:46:06', 0);
INSERT INTO `base_category3` VALUES (1064, '背包', 111, '2023-05-27 03:46:06', '2023-05-27 03:46:06', 0);
INSERT INTO `base_category3` VALUES (1065, '户外照明', 111, '2023-05-27 03:46:06', '2023-05-27 03:46:06', 0);
INSERT INTO `base_category3` VALUES (1066, '户外仪表', 111, '2023-05-27 03:46:06', '2023-05-27 03:46:06', 0);
INSERT INTO `base_category3` VALUES (1067, '户外工具', 111, '2023-05-27 03:46:06', '2023-05-27 03:46:06', 0);
INSERT INTO `base_category3` VALUES (1068, '望远镜', 111, '2023-05-27 03:46:06', '2023-05-27 03:46:06', 0);
INSERT INTO `base_category3` VALUES (1069, '旅游用品', 111, '2023-05-27 03:46:06', '2023-05-27 03:46:06', 0);
INSERT INTO `base_category3` VALUES (1070, '便携桌椅床', 111, '2023-05-27 03:46:06', '2023-05-27 03:46:06', 0);
INSERT INTO `base_category3` VALUES (1071, '野餐烧烤', 111, '2023-05-27 03:46:06', '2023-05-27 03:46:06', 0);
INSERT INTO `base_category3` VALUES (1072, '军迷用品', 111, '2023-05-27 03:46:06', '2023-05-27 03:46:06', 0);
INSERT INTO `base_category3` VALUES (1073, '救援装备', 111, '2023-05-27 03:46:06', '2023-05-27 03:46:06', 0);
INSERT INTO `base_category3` VALUES (1074, '滑雪装备', 111, '2023-05-27 03:46:06', '2023-05-27 03:46:06', 0);
INSERT INTO `base_category3` VALUES (1075, '极限户外', 111, '2023-05-27 03:46:06', '2023-05-27 03:46:06', 0);
INSERT INTO `base_category3` VALUES (1076, '冲浪潜水', 111, '2023-05-27 03:46:06', '2023-05-27 03:46:06', 0);
INSERT INTO `base_category3` VALUES (1077, '综合训练器', 112, '2023-05-27 03:46:06', '2023-05-27 03:46:06', 0);
INSERT INTO `base_category3` VALUES (1078, '其他大型器械', 112, '2023-05-27 03:46:06', '2023-05-27 03:46:06', 0);
INSERT INTO `base_category3` VALUES (1079, '哑铃', 112, '2023-05-27 03:46:06', '2023-05-27 03:46:06', 0);
INSERT INTO `base_category3` VALUES (1080, '仰卧板/收腹机', 112, '2023-05-27 03:46:06', '2023-05-27 03:46:06', 0);
INSERT INTO `base_category3` VALUES (1081, '其他中小型器材', 112, '2023-05-27 03:46:06', '2023-05-27 03:46:06', 0);
INSERT INTO `base_category3` VALUES (1082, '瑜伽舞蹈', 112, '2023-05-27 03:46:06', '2023-05-27 03:46:06', 0);
INSERT INTO `base_category3` VALUES (1083, '甩脂机', 112, '2023-05-27 03:46:06', '2023-05-27 03:46:06', 0);
INSERT INTO `base_category3` VALUES (1084, '踏步机', 112, '2023-05-27 03:46:06', '2023-05-27 03:46:06', 0);
INSERT INTO `base_category3` VALUES (1085, '武术搏击', 112, '2023-05-27 03:46:06', '2023-05-27 03:46:06', 0);
INSERT INTO `base_category3` VALUES (1086, '健身车/动感单车', 112, '2023-05-27 03:46:06', '2023-05-27 03:46:06', 0);
INSERT INTO `base_category3` VALUES (1087, '跑步机', 112, '2023-05-27 03:46:06', '2023-05-27 03:46:06', 0);
INSERT INTO `base_category3` VALUES (1088, '运动护具', 112, '2023-05-27 03:46:06', '2023-05-27 03:46:06', 0);
INSERT INTO `base_category3` VALUES (1089, '羽毛球', 113, '2023-05-27 03:46:06', '2023-05-27 03:46:06', 0);
INSERT INTO `base_category3` VALUES (1090, '乒乓球', 113, '2023-05-27 03:46:06', '2023-05-27 03:46:06', 0);
INSERT INTO `base_category3` VALUES (1091, '篮球', 113, '2023-05-27 03:46:06', '2023-05-27 03:46:06', 0);
INSERT INTO `base_category3` VALUES (1092, '足球', 113, '2023-05-27 03:46:06', '2023-05-27 03:46:06', 0);
INSERT INTO `base_category3` VALUES (1093, '网球', 113, '2023-05-27 03:46:06', '2023-05-27 03:46:06', 0);
INSERT INTO `base_category3` VALUES (1094, '排球', 113, '2023-05-27 03:46:06', '2023-05-27 03:46:06', 0);
INSERT INTO `base_category3` VALUES (1095, '高尔夫', 113, '2023-05-27 03:46:06', '2023-05-27 03:46:06', 0);
INSERT INTO `base_category3` VALUES (1096, '台球', 113, '2023-05-27 03:46:06', '2023-05-27 03:46:06', 0);
INSERT INTO `base_category3` VALUES (1097, '棋牌麻将', 113, '2023-05-27 03:46:06', '2023-05-27 03:46:06', 0);
INSERT INTO `base_category3` VALUES (1098, '轮滑滑板', 113, '2023-05-27 03:46:06', '2023-05-27 03:46:06', 0);
INSERT INTO `base_category3` VALUES (1099, '其他', 113, '2023-05-27 03:46:06', '2023-05-27 03:46:06', 0);

-- ----------------------------
-- Table structure for base_frontend_param
-- ----------------------------
DROP TABLE IF EXISTS `base_frontend_param`;
CREATE TABLE `base_frontend_param`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '属性名称',
  `delete_id` bigint NULL DEFAULT NULL COMMENT '分类id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '前端数据保护表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of base_frontend_param
-- ----------------------------

-- ----------------------------
-- Table structure for base_sale_attr
-- ----------------------------
DROP TABLE IF EXISTS `base_sale_attr`;
CREATE TABLE `base_sale_attr`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '销售属性名称',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_deleted` tinyint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '基本销售属性表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of base_sale_attr
-- ----------------------------
INSERT INTO `base_sale_attr` VALUES (1, '选择颜色', '2023-05-27 03:47:16', '2023-05-27 03:47:16', 0);
INSERT INTO `base_sale_attr` VALUES (2, '选择版本', '2023-05-27 03:47:16', '2023-05-27 03:47:16', 0);
INSERT INTO `base_sale_attr` VALUES (3, '选择套装', '2023-05-27 03:47:16', '2023-05-27 03:47:16', 0);

-- ----------------------------
-- Table structure for base_trademark
-- ----------------------------
DROP TABLE IF EXISTS `base_trademark`;
CREATE TABLE `base_trademark`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `tm_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '属性值',
  `logo_url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '品牌logo的图片路径',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_deleted` tinyint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '品牌表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of base_trademark
-- ----------------------------
INSERT INTO `base_trademark` VALUES (2, '华为', 'http://39.99.159.121:9000/gmall/1623030108745png', '2023-05-27 03:48:17', '2023-05-27 03:48:17', 0);
INSERT INTO `base_trademark` VALUES (3, '三星', 'http://39.99.159.121:9000/gmall/1623030102415png', '2023-05-27 03:48:17', '2023-05-27 03:48:17', 0);
INSERT INTO `base_trademark` VALUES (4, '小米', 'http://39.99.159.121:9000/gmall/1623030095364png', '2023-05-27 03:48:17', '2023-05-27 03:48:17', 0);
INSERT INTO `base_trademark` VALUES (5, 'oppo', 'http://39.99.159.121:9000/gmall/1623030089451png', '2023-05-27 03:48:17', '2023-05-27 03:48:17', 0);
INSERT INTO `base_trademark` VALUES (6, 'vivo', 'http://39.99.159.121:9000/gmall/1623030082836png', '2023-05-27 03:48:17', '2023-05-27 03:48:17', 0);
INSERT INTO `base_trademark` VALUES (12, '苹果', 'http://39.99.159.121:9000/gmall/1623030075465png', '2023-05-27 03:48:17', '2023-05-27 03:48:17', 0);

-- ----------------------------
-- Table structure for sku_attr_value
-- ----------------------------
DROP TABLE IF EXISTS `sku_attr_value`;
CREATE TABLE `sku_attr_value`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `attr_id` bigint NULL DEFAULT NULL COMMENT '属性id（冗余)',
  `value_id` bigint NULL DEFAULT NULL COMMENT '属性值id',
  `sku_id` bigint NULL DEFAULT NULL COMMENT 'skuid',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_deleted` tinyint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 241 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'sku平台属性值关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sku_attr_value
-- ----------------------------
INSERT INTO `sku_attr_value` VALUES (196, 1, 5, 40, '2023-05-27 03:55:00', '2023-05-27 03:55:00', 0);
INSERT INTO `sku_attr_value` VALUES (197, 2, 8, 40, '2023-05-27 03:55:00', '2023-05-27 03:55:00', 0);
INSERT INTO `sku_attr_value` VALUES (198, 3, 19, 40, '2023-05-27 03:55:00', '2023-05-27 03:55:00', 0);
INSERT INTO `sku_attr_value` VALUES (199, 4, 26, 40, '2023-05-27 03:55:00', '2023-05-27 03:55:00', 0);
INSERT INTO `sku_attr_value` VALUES (200, 5, 44, 40, '2023-05-27 03:55:00', '2023-05-27 03:55:00', 0);
INSERT INTO `sku_attr_value` VALUES (201, 1, 5, 41, '2023-05-27 03:55:00', '2023-05-27 03:55:00', 0);
INSERT INTO `sku_attr_value` VALUES (202, 2, 8, 41, '2023-05-27 03:55:00', '2023-05-27 03:55:00', 0);
INSERT INTO `sku_attr_value` VALUES (203, 3, 19, 41, '2023-05-27 03:55:00', '2023-05-27 03:55:00', 0);
INSERT INTO `sku_attr_value` VALUES (204, 4, 26, 41, '2023-05-27 03:55:00', '2023-05-27 03:55:00', 0);
INSERT INTO `sku_attr_value` VALUES (205, 5, 44, 41, '2023-05-27 03:55:00', '2023-05-27 03:55:00', 0);
INSERT INTO `sku_attr_value` VALUES (206, 1, 4, 42, '2023-05-27 03:55:00', '2023-05-27 03:55:00', 0);
INSERT INTO `sku_attr_value` VALUES (207, 2, 10, 42, '2023-05-27 03:55:00', '2023-05-27 03:55:00', 0);
INSERT INTO `sku_attr_value` VALUES (208, 3, 20, 42, '2023-05-27 03:55:00', '2023-05-27 03:55:00', 0);
INSERT INTO `sku_attr_value` VALUES (209, 4, 27, 42, '2023-05-27 03:55:00', '2023-05-27 03:55:00', 0);
INSERT INTO `sku_attr_value` VALUES (210, 5, 46, 42, '2023-05-27 03:55:00', '2023-05-27 03:55:00', 0);
INSERT INTO `sku_attr_value` VALUES (211, 1, 4, 43, '2023-05-27 03:55:00', '2023-05-27 03:55:00', 0);
INSERT INTO `sku_attr_value` VALUES (212, 2, 13, 43, '2023-05-27 03:55:00', '2023-05-27 03:55:00', 0);
INSERT INTO `sku_attr_value` VALUES (213, 3, 20, 43, '2023-05-27 03:55:00', '2023-05-27 03:55:00', 0);
INSERT INTO `sku_attr_value` VALUES (214, 4, 27, 43, '2023-05-27 03:55:00', '2023-05-27 03:55:00', 0);
INSERT INTO `sku_attr_value` VALUES (215, 5, 46, 43, '2023-05-27 03:55:00', '2023-05-27 03:55:00', 0);
INSERT INTO `sku_attr_value` VALUES (216, 1, 4, 44, '2023-05-27 03:55:00', '2023-05-27 03:55:00', 0);
INSERT INTO `sku_attr_value` VALUES (217, 2, 11, 44, '2023-05-27 03:55:00', '2023-05-27 03:55:00', 0);
INSERT INTO `sku_attr_value` VALUES (218, 3, 20, 44, '2023-05-27 03:55:00', '2023-05-27 03:55:00', 0);
INSERT INTO `sku_attr_value` VALUES (219, 4, 27, 44, '2023-05-27 03:55:00', '2023-05-27 03:55:00', 0);
INSERT INTO `sku_attr_value` VALUES (220, 5, 38, 44, '2023-05-27 03:55:01', '2023-05-27 03:55:01', 0);
INSERT INTO `sku_attr_value` VALUES (221, 1, 4, 45, '2023-05-27 03:55:01', '2023-05-27 03:55:01', 0);
INSERT INTO `sku_attr_value` VALUES (222, 2, 16, 45, '2023-05-27 03:55:01', '2023-05-27 03:55:01', 0);
INSERT INTO `sku_attr_value` VALUES (223, 3, 20, 45, '2023-05-27 03:55:01', '2023-05-27 03:55:01', 0);
INSERT INTO `sku_attr_value` VALUES (224, 4, 27, 45, '2023-05-27 03:55:01', '2023-05-27 03:55:01', 0);
INSERT INTO `sku_attr_value` VALUES (225, 5, 35, 45, '2023-05-27 03:55:01', '2023-05-27 03:55:01', 0);
INSERT INTO `sku_attr_value` VALUES (226, 1, 5, 46, '2023-05-27 03:55:01', '2023-05-27 03:55:01', 0);
INSERT INTO `sku_attr_value` VALUES (227, 2, 8, 46, '2023-05-27 03:55:01', '2023-05-27 03:55:01', 0);
INSERT INTO `sku_attr_value` VALUES (228, 3, 19, 46, '2023-05-27 03:55:01', '2023-05-27 03:55:01', 0);
INSERT INTO `sku_attr_value` VALUES (229, 4, 26, 46, '2023-05-27 03:55:01', '2023-05-27 03:55:01', 0);
INSERT INTO `sku_attr_value` VALUES (230, 5, 44, 46, '2023-05-27 03:55:01', '2023-05-27 03:55:01', 0);
INSERT INTO `sku_attr_value` VALUES (231, 1, 5, 47, '2023-05-27 03:55:01', '2023-05-27 03:55:01', 0);
INSERT INTO `sku_attr_value` VALUES (232, 2, 10, 47, '2023-05-27 03:55:01', '2023-05-27 03:55:01', 0);
INSERT INTO `sku_attr_value` VALUES (233, 3, 19, 47, '2023-05-27 03:55:01', '2023-05-27 03:55:01', 0);
INSERT INTO `sku_attr_value` VALUES (234, 4, 27, 47, '2023-05-27 03:55:01', '2023-05-27 03:55:01', 0);
INSERT INTO `sku_attr_value` VALUES (235, 5, 44, 47, '2023-05-27 03:55:01', '2023-05-27 03:55:01', 0);
INSERT INTO `sku_attr_value` VALUES (236, 1, 3, 48, '2023-05-27 03:55:01', '2023-05-27 03:55:01', 0);
INSERT INTO `sku_attr_value` VALUES (237, 2, 12, 48, '2023-05-27 03:55:01', '2023-05-27 03:55:01', 0);
INSERT INTO `sku_attr_value` VALUES (238, 3, 20, 48, '2023-05-27 03:55:01', '2023-05-27 03:55:01', 0);
INSERT INTO `sku_attr_value` VALUES (239, 4, 28, 48, '2023-05-27 03:55:01', '2023-05-27 03:55:01', 0);
INSERT INTO `sku_attr_value` VALUES (240, 5, 34, 48, '2023-05-27 03:55:01', '2023-05-27 03:55:01', 0);

-- ----------------------------
-- Table structure for sku_image
-- ----------------------------
DROP TABLE IF EXISTS `sku_image`;
CREATE TABLE `sku_image`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `sku_id` bigint NULL DEFAULT NULL COMMENT '商品id',
  `img_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片名称（冗余）',
  `img_url` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片路径(冗余)',
  `spu_img_id` bigint NULL DEFAULT NULL COMMENT '商品图片id',
  `is_default` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否默认',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_deleted` tinyint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2338 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '库存单元图片表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sku_image
-- ----------------------------
INSERT INTO `sku_image` VALUES (214, 40, '4.png', 'http://39.99.159.121:9000/gmall/16210460331034.png', 249, '0', '2023-05-27 03:55:32', '2023-05-27 03:55:32', 0);
INSERT INTO `sku_image` VALUES (215, 40, '3.png', 'http://39.99.159.121:9000/gmall/16210460331043.png', 250, '0', '2023-05-27 03:55:32', '2023-05-27 03:55:32', 0);
INSERT INTO `sku_image` VALUES (216, 40, '5.png', 'http://39.99.159.121:9000/gmall/16210460331075.png', 251, '0', '2023-05-27 03:55:32', '2023-05-27 03:55:32', 0);
INSERT INTO `sku_image` VALUES (217, 40, '2.png', 'http://39.99.159.121:9000/gmall/16210460331042.png', 252, '0', '2023-05-27 03:55:32', '2023-05-27 03:55:32', 0);
INSERT INTO `sku_image` VALUES (218, 40, '1.png', 'http://39.99.159.121:9000/gmall/16210460331111.png', 253, '1', '2023-05-27 03:55:32', '2023-05-27 03:55:32', 0);
INSERT INTO `sku_image` VALUES (219, 41, '2.png', 'http://39.99.159.121:9000/gmall/16210460385292.png', 255, '0', '2023-05-27 03:55:32', '2023-05-27 03:55:32', 0);
INSERT INTO `sku_image` VALUES (220, 41, '3.png', 'http://39.99.159.121:9000/gmall/16210460385313.png', 256, '0', '2023-05-27 03:55:32', '2023-05-27 03:55:32', 0);
INSERT INTO `sku_image` VALUES (221, 41, '5.png', 'http://39.99.159.121:9000/gmall/16210460385335.png', 257, '0', '2023-05-27 03:55:32', '2023-05-27 03:55:32', 0);
INSERT INTO `sku_image` VALUES (222, 41, '1.png', 'http://39.99.159.121:9000/gmall/16210460385411.png', 258, '1', '2023-05-27 03:55:32', '2023-05-27 03:55:32', 0);
INSERT INTO `sku_image` VALUES (223, 41, '4.png', 'http://39.99.159.121:9000/gmall/16210460385304.png', 254, '0', '2023-05-27 03:55:32', '2023-05-27 03:55:32', 0);
INSERT INTO `sku_image` VALUES (224, 42, '4.png', 'http://39.99.159.121:9000/gmall/16210458153734.png', 239, '0', '2023-05-27 03:55:32', '2023-05-27 03:55:32', 0);
INSERT INTO `sku_image` VALUES (225, 42, '1.png', 'http://39.99.159.121:9000/gmall/16210458153701.png', 240, '1', '2023-05-27 03:55:32', '2023-05-27 03:55:32', 0);
INSERT INTO `sku_image` VALUES (226, 42, '3.png', 'http://39.99.159.121:9000/gmall/16210458153753.png', 241, '0', '2023-05-27 03:55:32', '2023-05-27 03:55:32', 0);
INSERT INTO `sku_image` VALUES (227, 42, '2.png', 'http://39.99.159.121:9000/gmall/16210458153762.png', 242, '0', '2023-05-27 03:55:32', '2023-05-27 03:55:32', 0);
INSERT INTO `sku_image` VALUES (228, 42, '5.png', 'http://39.99.159.121:9000/gmall/16210458153855.png', 243, '0', '2023-05-27 03:55:32', '2023-05-27 03:55:32', 0);
INSERT INTO `sku_image` VALUES (229, 43, '2.png', 'http://39.99.159.121:9000/gmall/16210458211072.png', 244, '0', '2023-05-27 03:55:32', '2023-05-27 03:55:32', 0);
INSERT INTO `sku_image` VALUES (230, 43, '3.png', 'http://39.99.159.121:9000/gmall/16210458211113.png', 245, '0', '2023-05-27 03:55:32', '2023-05-27 03:55:32', 0);
INSERT INTO `sku_image` VALUES (231, 43, '4.png', 'http://39.99.159.121:9000/gmall/16210458211134.png', 246, '0', '2023-05-27 03:55:32', '2023-05-27 03:55:32', 0);
INSERT INTO `sku_image` VALUES (232, 43, '1.png', 'http://39.99.159.121:9000/gmall/16210458211101.png', 247, '1', '2023-05-27 03:55:32', '2023-05-27 03:55:32', 0);
INSERT INTO `sku_image` VALUES (233, 43, '5.png', 'http://39.99.159.121:9000/gmall/16210458211155.png', 248, '0', '2023-05-27 03:55:32', '2023-05-27 03:55:32', 0);
INSERT INTO `sku_image` VALUES (234, 44, '2.png', 'http://39.99.159.121:9000/gmall/1623051363654c82ff5154cbd4988933cb69b650205ec.png', 269, '0', '2023-05-27 03:55:32', '2023-05-27 03:55:32', 0);
INSERT INTO `sku_image` VALUES (235, 44, '3.png', 'http://39.99.159.121:9000/gmall/16230513636549daa0c8ec470428ab29fe9a46b5c8921.png', 270, '0', '2023-05-27 03:55:32', '2023-05-27 03:55:32', 0);
INSERT INTO `sku_image` VALUES (236, 44, '4.png', 'http://39.99.159.121:9000/gmall/16230513636549530d71bcf5d47619f67b40a0fa142af.png', 271, '0', '2023-05-27 03:55:32', '2023-05-27 03:55:32', 0);
INSERT INTO `sku_image` VALUES (237, 44, '1.png', 'http://39.99.159.121:9000/gmall/16230513636548bd01a398e614d2bab5fd3366883b1b7.png', 272, '1', '2023-05-27 03:55:32', '2023-05-27 03:55:32', 0);
INSERT INTO `sku_image` VALUES (238, 44, '5.png', 'http://39.99.159.121:9000/gmall/16230513636545ebe176304674bb9b9f7850cb81ce151.png', 273, '0', '2023-05-27 03:55:32', '2023-05-27 03:55:32', 0);
INSERT INTO `sku_image` VALUES (239, 45, '2.png', 'http://39.99.159.121:9000/gmall/1623051371250b8c95c2eb87142ee96935f500f848867.png', 274, '0', '2023-05-27 03:55:32', '2023-05-27 03:55:32', 0);
INSERT INTO `sku_image` VALUES (240, 45, '3.png', 'http://39.99.159.121:9000/gmall/1623051371250e2e3418fcc564f0384484339a8926517.png', 275, '0', '2023-05-27 03:55:32', '2023-05-27 03:55:32', 0);
INSERT INTO `sku_image` VALUES (241, 45, '1.png', 'http://39.99.159.121:9000/gmall/1623051371250c1cc035df5b14e87a56de916e07dc9f8.png', 276, '0', '2023-05-27 03:55:32', '2023-05-27 03:55:32', 0);
INSERT INTO `sku_image` VALUES (242, 45, '5.png', 'http://39.99.159.121:9000/gmall/1623051371250259ddd7c89704bd19db874fa7906ce0e.png', 277, '1', '2023-05-27 03:55:32', '2023-05-27 03:55:32', 0);
INSERT INTO `sku_image` VALUES (243, 45, '4.png', 'http://39.99.159.121:9000/gmall/1623051372128f86865820d2349b3909de2beea287819.png', 278, '0', '2023-05-27 03:55:32', '2023-05-27 03:55:32', 0);
INSERT INTO `sku_image` VALUES (244, 46, '4.png', 'http://39.99.159.121:9000/gmall/1623051685204554578e1e83844638d771762bfc2d894.png', 264, '0', '2023-05-27 03:55:32', '2023-05-27 03:55:32', 0);
INSERT INTO `sku_image` VALUES (245, 46, '2.png', 'http://39.99.159.121:9000/gmall/1623051685201207fce10d024480b980f9d476e489fd7.png', 265, '0', '2023-05-27 03:55:32', '2023-05-27 03:55:32', 0);
INSERT INTO `sku_image` VALUES (246, 46, '1.png', 'http://39.99.159.121:9000/gmall/1623051685202b22930ae8ce248e39cce327fcb09d008.png', 266, '1', '2023-05-27 03:55:32', '2023-05-27 03:55:32', 0);
INSERT INTO `sku_image` VALUES (247, 46, '5.png', 'http://39.99.159.121:9000/gmall/1623051685425e1a5ee7faec242dfa83663f2a296c544.png', 267, '0', '2023-05-27 03:55:32', '2023-05-27 03:55:32', 0);
INSERT INTO `sku_image` VALUES (248, 46, '3.png', 'http://39.99.159.121:9000/gmall/16230516856397c7bafae027d48f3a42a6ec0e67b6df6.png', 268, '0', '2023-05-27 03:55:32', '2023-05-27 03:55:32', 0);
INSERT INTO `sku_image` VALUES (249, 47, '4.png', 'http://39.99.159.121:9000/gmall/1623051685204554578e1e83844638d771762bfc2d894.png', 264, '0', '2023-05-27 03:55:32', '2023-05-27 03:55:32', 0);
INSERT INTO `sku_image` VALUES (250, 47, '2.png', 'http://39.99.159.121:9000/gmall/1623051685201207fce10d024480b980f9d476e489fd7.png', 265, '0', '2023-05-27 03:55:32', '2023-05-27 03:55:32', 0);
INSERT INTO `sku_image` VALUES (251, 47, '1.png', 'http://39.99.159.121:9000/gmall/1623051685202b22930ae8ce248e39cce327fcb09d008.png', 266, '1', '2023-05-27 03:55:32', '2023-05-27 03:55:32', 0);
INSERT INTO `sku_image` VALUES (252, 47, '5.png', 'http://39.99.159.121:9000/gmall/1623051685425e1a5ee7faec242dfa83663f2a296c544.png', 267, '0', '2023-05-27 03:55:32', '2023-05-27 03:55:32', 0);
INSERT INTO `sku_image` VALUES (253, 47, '3.png', 'http://39.99.159.121:9000/gmall/16230516856397c7bafae027d48f3a42a6ec0e67b6df6.png', 268, '0', '2023-05-27 03:55:32', '2023-05-27 03:55:32', 0);
INSERT INTO `sku_image` VALUES (254, 48, '2.png', 'http://39.99.159.121:9000/gmall/1623051371250b8c95c2eb87142ee96935f500f848867.png', 274, '1', '2023-05-27 03:55:32', '2023-05-27 03:55:32', 0);
INSERT INTO `sku_image` VALUES (255, 48, '3.png', 'http://39.99.159.121:9000/gmall/1623051371250e2e3418fcc564f0384484339a8926517.png', 275, '0', '2023-05-27 03:55:32', '2023-05-27 03:55:32', 0);
INSERT INTO `sku_image` VALUES (256, 48, '1.png', 'http://39.99.159.121:9000/gmall/1623051371250c1cc035df5b14e87a56de916e07dc9f8.png', 276, '0', '2023-05-27 03:55:32', '2023-05-27 03:55:32', 0);
INSERT INTO `sku_image` VALUES (257, 48, '5.png', 'http://39.99.159.121:9000/gmall/1623051371250259ddd7c89704bd19db874fa7906ce0e.png', 277, '0', '2023-05-27 03:55:32', '2023-05-27 03:55:32', 0);
INSERT INTO `sku_image` VALUES (258, 48, '4.png', 'http://39.99.159.121:9000/gmall/1623051372128f86865820d2349b3909de2beea287819.png', 278, '0', '2023-05-27 03:55:32', '2023-05-27 03:55:32', 0);

-- ----------------------------
-- Table structure for sku_info
-- ----------------------------
DROP TABLE IF EXISTS `sku_info`;
CREATE TABLE `sku_info`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '库存id(itemID)',
  `spu_id` bigint NULL DEFAULT NULL COMMENT '商品id',
  `price` decimal(10, 0) NULL DEFAULT NULL COMMENT '价格',
  `sku_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'sku名称',
  `sku_desc` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品规格描述',
  `weight` decimal(10, 2) NULL DEFAULT NULL COMMENT '重量',
  `tm_id` bigint NULL DEFAULT NULL COMMENT '品牌(冗余)',
  `category3_id` bigint NULL DEFAULT NULL COMMENT '三级分类id（冗余)',
  `sku_default_img` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '默认显示图片(冗余)',
  `is_sale` tinyint NOT NULL DEFAULT 0 COMMENT '是否销售（1：是 0：否）',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_deleted` tinyint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 49 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '库存单元表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sku_info
-- ----------------------------
INSERT INTO `sku_info` VALUES (40, 25, 4399, '荣耀V30 V30Pro 5G手机 华为麒麟990芯片 V30pro 冰岛幻境 全网通（8+256G）', '主体	        首销日期	以官网信息为准\n		产品名称	荣耀V30PRO\n		上市月份	12月\n		入网型号	OXF-AN10\n		上市年份	2019年', 0.67, 2, 61, 'http://39.99.159.121:9000/gmall/16210460331111.png', 1, '2023-05-27 03:56:13', '2023-05-27 03:56:13', 0);
INSERT INTO `sku_info` VALUES (41, 25, 4499, '荣耀V30 V30Pro 5G手机 华为麒麟990芯片 V30pro 幻夜星河 全网通（8+256G）', '主体	        首销日期	以官网信息为准\n		产品名称	荣耀V30PRO\n		上市月份	12月\n		入网型号	OXF-AN10\n		上市年份	2019年', 0.67, 2, 61, 'http://39.99.159.121:9000/gmall/1623051685202b22930ae8ce248e39cce327fcb09d008.png', 1, '2023-05-27 03:56:13', '2023-05-27 03:56:13', 0);
INSERT INTO `sku_info` VALUES (42, 24, 1943, '小米 CC9 手机 美颜自拍 游戏手机 蓝色（深蓝星球） 全网通 6GB+128GB', '主体	         产品名称	小米 CC9\n		上市月份	以官网信息为准\n		上市年份	2019年\n		品牌		小米（MI）\n		首销日期	以官网信息为准\n		入网型号	以官网信息为准', 0.66, 4, 61, 'http://39.99.159.121:9000/gmall/1623051371250259ddd7c89704bd19db874fa7906ce0e.png', 1, '2023-05-27 03:56:13', '2023-05-27 03:56:13', 0);
INSERT INTO `sku_info` VALUES (43, 24, 2200, '小米 CC9 手机 美颜自拍 游戏手机 仙女渐变色（美图定制版） 全网通 6GB+128GB', '主体	         产品名称	小米 CC9\n		上市月份	以官网信息为准\n		上市年份	2019年\n		品牌		小米（MI）\n		首销日期	以官网信息为准\n		入网型号	以官网信息为准', 0.78, 4, 61, 'http://39.99.159.121:9000/gmall/16230513636548bd01a398e614d2bab5fd3366883b1b7.png', 1, '2023-05-27 03:56:13', '2023-05-27 03:56:13', 0);
INSERT INTO `sku_info` VALUES (44, 27, 2200, '小米 CC9 PLUS 手机 美颜自拍 游戏手机 仙女渐变色(美图定制版) 4G全网通 6GB+128GB', '主体	         产品名称	小米 CC9PLUS\n		上市月份	以官网信息为准\n		上市年份	2021年\n		品牌		小米（MI）\n		首销日期	以官网信息为准\n		入网型号	以官网信息为准', 0.66, 4, 61, 'http://39.99.159.121:9000/gmall/16230513636548bd01a398e614d2bab5fd3366883b1b7.png', 1, '2023-05-27 03:56:13', '2023-05-27 03:56:13', 0);
INSERT INTO `sku_info` VALUES (45, 27, 1999, '小米 CC9 PLUS 手机 美颜自拍 游戏手机 蓝色(深蓝星球) 4G全网通 6GB+128GB', '主体	         产品名称	小米 CC9PLUS\n		上市月份	以官网信息为准\n		上市年份	2021年\n		品牌		小米（MI）\n		首销日期	以官网信息为准\n		入网型号	以官网信息为准', 0.66, 4, 61, 'http://39.99.159.121:9000/gmall/1623051371250259ddd7c89704bd19db874fa7906ce0e.png', 1, '2023-05-27 03:56:13', '2023-05-27 03:56:13', 0);
INSERT INTO `sku_info` VALUES (46, 26, 4099, '荣耀V30 PRO PLUS 5G双模 麒麟990 5GSOC芯片 双快充 游戏手机 幻夜星河 全网通(8GB 256GB)', '主体	        首销日期	以官网信息为准\n		产品名称	荣耀V30PRO\n		上市月份	12月\n		入网型号	OXF-AN10\n		上市年份	2019年', 0.77, 2, 61, 'http://39.99.159.121:9000/gmall/1623051685202b22930ae8ce248e39cce327fcb09d008.png', 1, '2023-05-27 03:56:13', '2023-05-27 03:56:13', 0);
INSERT INTO `sku_info` VALUES (47, 26, 4999, '荣耀V30 PRO PLUS 5G双模 麒麟990 5GSOC芯片 双快充 游戏手机 幻夜星河 全网通(8GB 128GB)', '主体	        首销日期	以官网信息为准\n		产品名称	荣耀V30PRO\n		上市月份	12月\n		入网型号	OXF-AN10\n		上市年份	2019年', 0.78, 2, 61, 'http://39.99.159.121:9000/gmall/1623051685202b22930ae8ce248e39cce327fcb09d008.png', 1, '2023-05-27 03:56:13', '2023-05-27 03:56:13', 0);
INSERT INTO `sku_info` VALUES (48, 27, 1488, '小米CC9 多功能NFC全网通4G手机 深蓝星球（蓝色） 6+64G', '不错，很好，good！nice！perfect！', 0.66, 4, 61, 'http://39.99.159.121:9000/gmall/1623051371250b8c95c2eb87142ee96935f500f848867.png', 0, '2023-05-27 03:56:13', '2023-05-27 03:56:13', 0);

-- ----------------------------
-- Table structure for sku_sale_attr_value
-- ----------------------------
DROP TABLE IF EXISTS `sku_sale_attr_value`;
CREATE TABLE `sku_sale_attr_value`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `sku_id` bigint NULL DEFAULT NULL COMMENT '库存单元id',
  `spu_id` int NULL DEFAULT NULL COMMENT 'spu_id(冗余)',
  `sale_attr_value_id` bigint NULL DEFAULT NULL COMMENT '销售属性值id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_deleted` tinyint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 922 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'sku销售属性值' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sku_sale_attr_value
-- ----------------------------
INSERT INTO `sku_sale_attr_value` VALUES (89, 40, 25, 106, '2023-05-27 03:57:49', '2023-05-27 03:57:49', 0);
INSERT INTO `sku_sale_attr_value` VALUES (90, 40, 25, 109, '2023-05-27 03:57:49', '2023-05-27 03:57:49', 0);
INSERT INTO `sku_sale_attr_value` VALUES (91, 41, 25, 107, '2023-05-27 03:57:49', '2023-05-27 03:57:49', 0);
INSERT INTO `sku_sale_attr_value` VALUES (92, 41, 25, 109, '2023-05-27 03:57:49', '2023-05-27 03:57:49', 0);
INSERT INTO `sku_sale_attr_value` VALUES (93, 42, 24, 102, '2023-05-27 03:57:49', '2023-05-27 03:57:49', 0);
INSERT INTO `sku_sale_attr_value` VALUES (94, 42, 24, 105, '2023-05-27 03:57:49', '2023-05-27 03:57:49', 0);
INSERT INTO `sku_sale_attr_value` VALUES (95, 43, 24, 103, '2023-05-27 03:57:49', '2023-05-27 03:57:49', 0);
INSERT INTO `sku_sale_attr_value` VALUES (96, 43, 24, 105, '2023-05-27 03:57:49', '2023-05-27 03:57:49', 0);
INSERT INTO `sku_sale_attr_value` VALUES (97, 44, 27, 115, '2023-05-27 03:57:49', '2023-05-27 03:57:49', 0);
INSERT INTO `sku_sale_attr_value` VALUES (98, 44, 27, 117, '2023-05-27 03:57:49', '2023-05-27 03:57:49', 0);
INSERT INTO `sku_sale_attr_value` VALUES (99, 45, 27, 114, '2023-05-27 03:57:49', '2023-05-27 03:57:49', 0);
INSERT INTO `sku_sale_attr_value` VALUES (100, 45, 27, 117, '2023-05-27 03:57:49', '2023-05-27 03:57:49', 0);
INSERT INTO `sku_sale_attr_value` VALUES (101, 46, 26, 111, '2023-05-27 03:57:49', '2023-05-27 03:57:49', 0);
INSERT INTO `sku_sale_attr_value` VALUES (102, 46, 26, 113, '2023-05-27 03:57:49', '2023-05-27 03:57:49', 0);
INSERT INTO `sku_sale_attr_value` VALUES (103, 47, 26, 111, '2023-05-27 03:57:49', '2023-05-27 03:57:49', 0);
INSERT INTO `sku_sale_attr_value` VALUES (104, 47, 26, 112, '2023-05-27 03:57:49', '2023-05-27 03:57:49', 0);
INSERT INTO `sku_sale_attr_value` VALUES (105, 48, 27, 114, '2023-05-27 03:57:49', '2023-05-27 03:57:49', 0);
INSERT INTO `sku_sale_attr_value` VALUES (106, 48, 27, 116, '2023-05-27 03:57:49', '2023-05-27 03:57:49', 0);

-- ----------------------------
-- Table structure for spu_image
-- ----------------------------
DROP TABLE IF EXISTS `spu_image`;
CREATE TABLE `spu_image`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `spu_id` bigint NULL DEFAULT NULL COMMENT '商品id',
  `img_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片名称',
  `img_url` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片路径',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_deleted` tinyint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5495 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品图片表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of spu_image
-- ----------------------------
INSERT INTO `spu_image` VALUES (219, 22, '1.png', 'http://192.168.200.128:8080/group1/M00/00/02/wKjIgF_HcWCETxFsAAAAAHTzbJo097.png', '2023-05-27 04:20:59', '2023-05-27 04:20:59', 0);
INSERT INTO `spu_image` VALUES (220, 22, '2.png', 'http://192.168.200.128:8080/group1/M00/00/02/wKjIgF_HcWCEDdfMAAAAANrzfsE147.png', '2023-05-27 04:20:59', '2023-05-27 04:20:59', 0);
INSERT INTO `spu_image` VALUES (221, 22, '5.png', 'http://192.168.200.128:8080/group1/M00/00/02/wKjIgF_HcWCEWxwwAAAAANWD20w941.png', '2023-05-27 04:20:59', '2023-05-27 04:20:59', 0);
INSERT INTO `spu_image` VALUES (222, 22, '3.png', 'http://192.168.200.128:8080/group1/M00/00/02/wKjIgF_HcWCEFKyZAAAAAPLGmZI643.png', '2023-05-27 04:20:59', '2023-05-27 04:20:59', 0);
INSERT INTO `spu_image` VALUES (223, 22, '4.png', 'http://192.168.200.128:8080/group1/M00/00/02/wKjIgF_HcWCEO1kKAAAAAAnfeE0604.png', '2023-05-27 04:20:59', '2023-05-27 04:20:59', 0);
INSERT INTO `spu_image` VALUES (224, 22, '5.png', 'http://192.168.200.128:8080/group1/M00/00/02/wKjIgF_HcWaECyl6AAAAAPZjCzw047.png', '2023-05-27 04:20:59', '2023-05-27 04:20:59', 0);
INSERT INTO `spu_image` VALUES (225, 22, '2.png', 'http://192.168.200.128:8080/group1/M00/00/02/wKjIgF_HcWaERVf2AAAAAA3Op6U081.png', '2023-05-27 04:20:59', '2023-05-27 04:20:59', 0);
INSERT INTO `spu_image` VALUES (226, 22, '1.png', 'http://192.168.200.128:8080/group1/M00/00/02/wKjIgF_HcWaEIu80AAAAAMBMksY661.png', '2023-05-27 04:20:59', '2023-05-27 04:20:59', 0);
INSERT INTO `spu_image` VALUES (227, 22, '3.png', 'http://192.168.200.128:8080/group1/M00/00/02/wKjIgF_HcWaEWgSQAAAAAJMMOPA462.png', '2023-05-27 04:20:59', '2023-05-27 04:20:59', 0);
INSERT INTO `spu_image` VALUES (228, 22, '4.png', 'http://192.168.200.128:8080/group1/M00/00/02/wKjIgF_HcWaEDK2FAAAAAM93W9k239.png', '2023-05-27 04:20:59', '2023-05-27 04:20:59', 0);
INSERT INTO `spu_image` VALUES (229, 23, '4.png', 'http://192.168.200.128:8080/group1/M00/00/02/wKjIgF_HchmEFR2yAAAAAKpkihY501.png', '2023-05-27 04:20:59', '2023-05-27 04:20:59', 0);
INSERT INTO `spu_image` VALUES (230, 23, '2.png', 'http://192.168.200.128:8080/group1/M00/00/02/wKjIgF_HchmEKxgAAAAAAHJhDj4156.png', '2023-05-27 04:20:59', '2023-05-27 04:20:59', 0);
INSERT INTO `spu_image` VALUES (231, 23, '1.png', 'http://192.168.200.128:8080/group1/M00/00/02/wKjIgF_HchmEDjzYAAAAACcuFyA477.png', '2023-05-27 04:20:59', '2023-05-27 04:20:59', 0);
INSERT INTO `spu_image` VALUES (232, 23, '3.png', 'http://192.168.200.128:8080/group1/M00/00/02/wKjIgF_HchmEExUkAAAAAETiDa8771.png', '2023-05-27 04:20:59', '2023-05-27 04:20:59', 0);
INSERT INTO `spu_image` VALUES (233, 23, '5.png', 'http://192.168.200.128:8080/group1/M00/00/02/wKjIgF_HchmEDjFbAAAAAFgXhW8632.png', '2023-05-27 04:20:59', '2023-05-27 04:20:59', 0);
INSERT INTO `spu_image` VALUES (234, 23, '2.png', 'http://192.168.200.128:8080/group1/M00/00/02/wKjIgF_HciCEGShvAAAAAE4D_C0816.png', '2023-05-27 04:20:59', '2023-05-27 04:20:59', 0);
INSERT INTO `spu_image` VALUES (235, 23, '1.png', 'http://192.168.200.128:8080/group1/M00/00/02/wKjIgF_HciCEbs_xAAAAANgmDQ8058.png', '2023-05-27 04:20:59', '2023-05-27 04:20:59', 0);
INSERT INTO `spu_image` VALUES (236, 23, '5.png', 'http://192.168.200.128:8080/group1/M00/00/02/wKjIgF_HciCEXK30AAAAAC2RaeU221.png', '2023-05-27 04:20:59', '2023-05-27 04:20:59', 0);
INSERT INTO `spu_image` VALUES (237, 23, '3.png', 'http://192.168.200.128:8080/group1/M00/00/03/wKjIgF_HciCEM8-uAAAAAKulkhI361.png', '2023-05-27 04:20:59', '2023-05-27 04:20:59', 0);
INSERT INTO `spu_image` VALUES (238, 23, '4.png', 'http://192.168.200.128:8080/group1/M00/00/03/wKjIgF_HciCEXRCqAAAAAACnP3w083.png', '2023-05-27 04:20:59', '2023-05-27 04:20:59', 0);
INSERT INTO `spu_image` VALUES (239, 24, '4.png', 'http://39.99.159.121:9000/gmall/16210458153734.png', '2023-05-27 04:20:59', '2023-05-27 04:20:59', 0);
INSERT INTO `spu_image` VALUES (240, 24, '1.png', 'http://39.99.159.121:9000/gmall/16210458153701.png', '2023-05-27 04:20:59', '2023-05-27 04:20:59', 0);
INSERT INTO `spu_image` VALUES (241, 24, '3.png', 'http://39.99.159.121:9000/gmall/16210458153753.png', '2023-05-27 04:20:59', '2023-05-27 04:20:59', 0);
INSERT INTO `spu_image` VALUES (242, 24, '2.png', 'http://39.99.159.121:9000/gmall/16210458153762.png', '2023-05-27 04:20:59', '2023-05-27 04:20:59', 0);
INSERT INTO `spu_image` VALUES (243, 24, '5.png', 'http://39.99.159.121:9000/gmall/16210458153855.png', '2023-05-27 04:20:59', '2023-05-27 04:20:59', 0);
INSERT INTO `spu_image` VALUES (244, 24, '2.png', 'http://39.99.159.121:9000/gmall/16210458211072.png', '2023-05-27 04:20:59', '2023-05-27 04:20:59', 0);

-- ----------------------------
-- Table structure for spu_info
-- ----------------------------
DROP TABLE IF EXISTS `spu_info`;
CREATE TABLE `spu_info`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `spu_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `description` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品描述(后台简述）',
  `category3_id` bigint NULL DEFAULT NULL COMMENT '三级分类id',
  `tm_id` bigint NULL DEFAULT NULL COMMENT '品牌id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_deleted` tinyint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of spu_info
-- ----------------------------
INSERT INTO `spu_info` VALUES (24, '小米CC9手机', '品牌： 小米（MI）\n商品名称：小米（MI）CC9商品编号：51614902082商品毛重：500.00gCPU型号：其他运行内存：其他机身存储：其他存储卡：其他摄像头数量：其他后摄主摄像素：其他前摄主摄像素：其他主屏幕尺寸（英寸）：其他英寸分辨率：其他屏幕比例：其他屏幕前摄组合：其他充电器：其他操作系统：其他OS', 61, 4, '2023-05-27 04:21:40', '2023-05-27 04:21:40', 0);
INSERT INTO `spu_info` VALUES (25, '荣耀V30 Pro手机', '品牌： 荣耀（HONOR）\n商品名称：荣耀（HONOR）荣耀V30 PRO (5G)商品编号：62923086436商品毛重：0.6kgCPU型号：麒麟990运行内存：8GB机身存储：256GB存储卡：其他摄像头数量：后置三摄后摄主摄像素：4000万像素前摄主摄像素：3200万像素主屏幕尺寸（英寸）：6.57英寸分辨率：全高清FHD+屏幕比例：其他屏幕前摄组合：极点屏充电器：其他热点：人脸识别，快速充电，无线充电，NFC，5G，超高屏占比操作系统：Android(安卓)', 61, 2, '2023-05-27 04:21:40', '2023-05-27 04:21:40', 0);
INSERT INTO `spu_info` VALUES (26, '荣耀V30 PRO PLUS', '品牌： 荣耀（HONOR）\n商品名称：荣耀（HONOR）荣耀V30 PRO (5G)商品编号：62923086436商品毛重：0.6kgCPU型号：麒麟990运行内存：8GB机身存储：256GB存储卡：其他摄像头数量：后置三摄后摄主摄像素：4000万像素前摄主摄像素：3200万像素主屏幕尺寸（英寸）：6.57英寸分辨率：全高清FHD+屏幕比例：其他屏幕前摄组合：极点屏充电器：其他热点：人脸识别，快速充电，无线充电，NFC，5G，超高屏占比操作系统：Android(安卓)', 61, 2, '2023-05-27 04:21:40', '2023-05-27 04:21:40', 0);
INSERT INTO `spu_info` VALUES (27, '小米CC9 PLUS', '品牌： 小米（MI）\n商品名称：小米（MI）CC9商品编号：51614902082商品毛重：500.00gCPU型号：其他运行内存：其他机身存储：其他存储卡：其他摄像头数量：其他后摄主摄像素：其他前摄主摄像素：其他主屏幕尺寸（英寸）：其他英寸分辨率：其他屏幕比例：其他屏幕前摄组合：其他充电器：其他操作系统：其他OS', 61, 4, '2023-05-27 04:21:40', '2023-05-27 04:21:40', 0);

-- ----------------------------
-- Table structure for spu_poster
-- ----------------------------
DROP TABLE IF EXISTS `spu_poster`;
CREATE TABLE `spu_poster`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `spu_id` bigint NULL DEFAULT NULL COMMENT '商品id',
  `img_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件名称',
  `img_url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件路径',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_deleted` tinyint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品海报表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of spu_poster
-- ----------------------------

-- ----------------------------
-- Table structure for spu_sale_attr
-- ----------------------------
DROP TABLE IF EXISTS `spu_sale_attr`;
CREATE TABLE `spu_sale_attr`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号(业务中无关联)',
  `spu_id` bigint NULL DEFAULT NULL COMMENT '商品id',
  `base_sale_attr_id` bigint NULL DEFAULT NULL COMMENT '销售属性id',
  `sale_attr_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '销售属性名称(冗余)',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_deleted` tinyint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5204 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'spu销售属性' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of spu_sale_attr
-- ----------------------------
INSERT INTO `spu_sale_attr` VALUES (49, 24, 1, '选择颜色', '2023-05-27 04:24:17', '2023-05-27 04:24:17', 0);
INSERT INTO `spu_sale_attr` VALUES (50, 24, 2, '选择版本', '2023-05-27 04:24:17', '2023-05-27 04:24:17', 0);
INSERT INTO `spu_sale_attr` VALUES (51, 25, 1, '选择颜色', '2023-05-27 04:24:17', '2023-05-27 04:24:17', 0);
INSERT INTO `spu_sale_attr` VALUES (52, 25, 2, '选择版本', '2023-05-27 04:24:17', '2023-05-27 04:24:17', 0);
INSERT INTO `spu_sale_attr` VALUES (53, 26, 1, '选择颜色', '2023-05-27 04:24:17', '2023-05-27 04:24:17', 0);
INSERT INTO `spu_sale_attr` VALUES (54, 26, 2, '选择版本', '2023-05-27 04:24:17', '2023-05-27 04:24:17', 0);
INSERT INTO `spu_sale_attr` VALUES (55, 27, 1, '选择颜色', '2023-05-27 04:24:17', '2023-05-27 04:24:17', 0);
INSERT INTO `spu_sale_attr` VALUES (56, 27, 2, '选择版本', '2023-05-27 04:24:17', '2023-05-27 04:24:17', 0);

-- ----------------------------
-- Table structure for spu_sale_attr_value
-- ----------------------------
DROP TABLE IF EXISTS `spu_sale_attr_value`;
CREATE TABLE `spu_sale_attr_value`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '销售属性值编号',
  `spu_id` bigint NULL DEFAULT NULL COMMENT '商品id',
  `base_sale_attr_id` bigint NULL DEFAULT NULL COMMENT '销售属性id',
  `sale_attr_value_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '销售属性值名称',
  `sale_attr_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '销售属性名称(冗余)',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_deleted` tinyint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3716 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'spu销售属性值' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of spu_sale_attr_value
-- ----------------------------
INSERT INTO `spu_sale_attr_value` VALUES (102, 24, 1, '深蓝星球', '选择颜色', '2023-05-27 04:25:22', '2023-05-27 04:25:22', 0);
INSERT INTO `spu_sale_attr_value` VALUES (103, 24, 1, '仙女渐变色', '选择颜色', '2023-05-27 04:25:22', '2023-05-27 04:25:22', 0);
INSERT INTO `spu_sale_attr_value` VALUES (104, 24, 2, '6G+64G', '选择版本', '2023-05-27 04:25:23', '2023-05-27 04:25:23', 0);
INSERT INTO `spu_sale_attr_value` VALUES (105, 24, 2, '6G+128G', '选择版本', '2023-05-27 04:25:23', '2023-05-27 04:25:23', 0);
INSERT INTO `spu_sale_attr_value` VALUES (106, 25, 1, '冰岛幻境', '选择颜色', '2023-05-27 04:25:23', '2023-05-27 04:25:23', 0);
INSERT INTO `spu_sale_attr_value` VALUES (107, 25, 1, '幻夜星河', '选择颜色', '2023-05-27 04:25:23', '2023-05-27 04:25:23', 0);
INSERT INTO `spu_sale_attr_value` VALUES (108, 25, 2, '8G+128G', '选择版本', '2023-05-27 04:25:23', '2023-05-27 04:25:23', 0);
INSERT INTO `spu_sale_attr_value` VALUES (109, 25, 2, '8G+256G', '选择版本', '2023-05-27 04:25:23', '2023-05-27 04:25:23', 0);
INSERT INTO `spu_sale_attr_value` VALUES (110, 26, 1, '冰岛幻境', '选择颜色', '2023-05-27 04:25:23', '2023-05-27 04:25:23', 0);
INSERT INTO `spu_sale_attr_value` VALUES (111, 26, 1, '幻夜星河', '选择颜色', '2023-05-27 04:25:23', '2023-05-27 04:25:23', 0);
INSERT INTO `spu_sale_attr_value` VALUES (112, 26, 2, '8G+128G', '选择版本', '2023-05-27 04:25:23', '2023-05-27 04:25:23', 0);
INSERT INTO `spu_sale_attr_value` VALUES (113, 26, 2, '8G+256G', '选择版本', '2023-05-27 04:25:23', '2023-05-27 04:25:23', 0);
INSERT INTO `spu_sale_attr_value` VALUES (114, 27, 1, '深蓝星球', '选择颜色', '2023-05-27 04:25:23', '2023-05-27 04:25:23', 0);
INSERT INTO `spu_sale_attr_value` VALUES (115, 27, 1, '仙女渐变色', '选择颜色', '2023-05-27 04:25:23', '2023-05-27 04:25:23', 0);
INSERT INTO `spu_sale_attr_value` VALUES (116, 27, 2, '6G+64G', '选择版本', '2023-05-27 04:25:23', '2023-05-27 04:25:23', 0);
INSERT INTO `spu_sale_attr_value` VALUES (117, 27, 2, '6G+128G', '选择版本', '2023-05-27 04:25:23', '2023-05-27 04:25:23', 0);

-- ----------------------------
-- View structure for base_category_view
-- ----------------------------
DROP VIEW IF EXISTS `base_category_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `base_category_view` AS select `base_category3`.`id` AS `id`,`base_category1`.`id` AS `category1_id`,`base_category1`.`name` AS `category1_name`,`base_category2`.`id` AS `category2_id`,`base_category2`.`name` AS `category2_name`,`base_category3`.`id` AS `category3_id`,`base_category3`.`name` AS `category3_name` from ((`base_category1` join `base_category2` on((`base_category1`.`id` = `base_category2`.`category1_id`))) join `base_category3` on((`base_category2`.`id` = `base_category3`.`category2_id`)));

SET FOREIGN_KEY_CHECKS = 1;
