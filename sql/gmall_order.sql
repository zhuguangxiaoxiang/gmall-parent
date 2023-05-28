/*
 Navicat Premium Data Transfer

 Source Server         : gmall
 Source Server Type    : MySQL
 Source Server Version : 80028
 Source Host           : 192.168.200.123:3306
 Source Schema         : gmall_order

 Target Server Type    : MySQL
 Target Server Version : 80028
 File Encoding         : 65001

 Date: 27/05/2023 16:04:23
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cart_info
-- ----------------------------
DROP TABLE IF EXISTS `cart_info`;
CREATE TABLE `cart_info`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `user_id` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户id',
  `sku_id` bigint NULL DEFAULT NULL COMMENT 'skuid',
  `cart_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '放入购物车时价格',
  `sku_num` int NULL DEFAULT NULL COMMENT '数量',
  `img_url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片文件',
  `sku_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'sku名称 (冗余)',
  `is_checked` int NULL DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_deleted` tinyint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 108 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '购物车表 用户登录系统时更新冗余' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cart_info
-- ----------------------------
INSERT INTO `cart_info` VALUES (86, '1', 47, 3999.00, 4, 'http://39.99.159.121:9000/gmall/1623051685202b22930ae8ce248e39cce327fcb09d008.png', '荣耀V30 PRO PLUS 5G双模 麒麟990 5GSOC芯片 双快充 游戏手机 幻夜星河 全网通(8GB 128GB)', 1, '2023-05-27 06:02:58', '2023-05-27 06:02:58', 0);
INSERT INTO `cart_info` VALUES (88, '1', 46, 4099.00, 1, 'http://39.99.159.121:9000/gmall/1623051685202b22930ae8ce248e39cce327fcb09d008.png', '荣耀V30 PRO PLUS 5G双模 麒麟990 5GSOC芯片 双快充 游戏手机 幻夜星河 全网通(8GB 256GB)', 0, '2023-05-27 06:02:58', '2023-05-27 06:02:58', 0);
INSERT INTO `cart_info` VALUES (89, '1', 45, 1999.00, 2, 'http://39.99.159.121:9000/gmall/1623051371250259ddd7c89704bd19db874fa7906ce0e.png', '小米 CC9 PLUS 手机 美颜自拍 游戏手机 蓝色(深蓝星球) 4G全网通 6GB+128GB', 1, '2023-05-27 06:02:58', '2023-05-27 06:02:58', 0);
INSERT INTO `cart_info` VALUES (90, '1', 44, 2200.00, 2, 'http://39.99.159.121:9000/gmall/16230513636548bd01a398e614d2bab5fd3366883b1b7.png', '小米 CC9 PLUS 手机 美颜自拍 游戏手机 仙女渐变色(美图定制版) 4G全网通 6GB+128GB', 1, '2023-05-27 06:02:58', '2023-05-27 06:02:58', 0);
INSERT INTO `cart_info` VALUES (95, '2', 47, 3999.00, 3, 'http://39.99.159.121:9000/gmall/1623051685202b22930ae8ce248e39cce327fcb09d008.png', '荣耀V30 PRO PLUS 5G双模 麒麟990 5GSOC芯片 双快充 游戏手机 幻夜星河 全网通(8GB 128GB)', 1, '2023-05-27 06:02:58', '2023-05-27 06:02:58', 0);
INSERT INTO `cart_info` VALUES (96, '2', 46, 4099.00, 2, 'http://39.99.159.121:9000/gmall/1623051685202b22930ae8ce248e39cce327fcb09d008.png', '荣耀V30 PRO PLUS 5G双模 麒麟990 5GSOC芯片 双快充 游戏手机 幻夜星河 全网通(8GB 256GB)', 0, '2023-05-27 06:02:58', '2023-05-27 06:02:58', 0);
INSERT INTO `cart_info` VALUES (106, '2', 42, 1943.00, 2, 'http://39.99.159.121:9000/gmall/1623051371250259ddd7c89704bd19db874fa7906ce0e.png', '小米 CC9 手机 美颜自拍 游戏手机 蓝色（深蓝星球） 全网通 6GB+128GB', 1, '2023-05-27 06:02:58', '2023-05-27 06:02:58', 0);
INSERT INTO `cart_info` VALUES (107, '2', 43, 2200.00, 1, 'http://39.99.159.121:9000/gmall/16230513636548bd01a398e614d2bab5fd3366883b1b7.png', '小米 CC9 手机 美颜自拍 游戏手机 仙女渐变色（美图定制版） 全网通 6GB+128GB', 1, '2023-05-27 06:02:58', '2023-05-27 06:02:58', 0);

-- ----------------------------
-- Table structure for order_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `order_id` bigint NULL DEFAULT NULL COMMENT '订单编号',
  `sku_id` bigint NULL DEFAULT NULL COMMENT 'sku_id',
  `sku_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'sku名称（冗余)',
  `img_url` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片名称（冗余)',
  `order_price` decimal(10, 0) NULL DEFAULT NULL COMMENT '购买价格(下单时sku价格）',
  `sku_num` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '购买个数',
  `source_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '来源类型',
  `source_id` bigint NULL DEFAULT NULL COMMENT '来源编号',
  `split_total_amount` decimal(10, 2) NULL DEFAULT NULL,
  `split_activity_amount` decimal(10, 2) NULL DEFAULT NULL,
  `split_coupon_amount` decimal(10, 2) NULL DEFAULT NULL,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_deleted` tinyint NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 397 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单明细表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_detail
-- ----------------------------
INSERT INTO `order_detail` VALUES (317, 197, 42, '小米 CC9 手机 美颜自拍 游戏手机 蓝色（深蓝星球） 全网通 6GB+128GB', 'http://39.99.159.121:9000/gmall/16210458153701.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=admin%2F20210515%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20210515T023015Z&X-Amz-Expires=604800&X-Amz-SignedHeaders=host&X-Amz-Signature=d8d4bb30f4e9c898c129fcf90f8fc40935b3459867bc0b91d1f6f84aca1412bf', 1943, '3', NULL, NULL, NULL, NULL, NULL, '2023-05-27 06:34:04', '2023-05-27 06:34:04', 0);
INSERT INTO `order_detail` VALUES (318, 197, 43, '小米 CC9 手机 美颜自拍 游戏手机 仙女渐变色（美图定制版） 全网通 6GB+128GB', 'http://39.99.159.121:9000/gmall/16210458211101.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=admin%2F20210515%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20210515T023021Z&X-Amz-Expires=604800&X-Amz-SignedHeaders=host&X-Amz-Signature=161460900fe1be3f92e8fcf27db3d14a98533002ad2c78bebf0ed46135f4f50e', 2200, '1', NULL, NULL, NULL, NULL, NULL, '2023-05-27 06:34:04', '2023-05-27 06:34:04', 0);
INSERT INTO `order_detail` VALUES (327, 204, 42, '小米 CC9 手机 美颜自拍 游戏手机 蓝色（深蓝星球） 全网通 6GB+128GB', 'http://39.99.159.121:9000/gmall/16210458153701.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=admin%2F20210515%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20210515T023015Z&X-Amz-Expires=604800&X-Amz-SignedHeaders=host&X-Amz-Signature=d8d4bb30f4e9c898c129fcf90f8fc40935b3459867bc0b91d1f6f84aca1412bf', 1943, '3', NULL, NULL, NULL, NULL, NULL, '2023-05-27 06:34:04', '2023-05-27 06:34:04', 0);
INSERT INTO `order_detail` VALUES (328, 205, 43, '小米 CC9 手机 美颜自拍 游戏手机 仙女渐变色（美图定制版） 全网通 6GB+128GB', 'http://39.99.159.121:9000/gmall/16210458211101.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=admin%2F20210515%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20210515T023021Z&X-Amz-Expires=604800&X-Amz-SignedHeaders=host&X-Amz-Signature=161460900fe1be3f92e8fcf27db3d14a98533002ad2c78bebf0ed46135f4f50e', 2200, '1', NULL, NULL, NULL, NULL, NULL, '2023-05-27 06:34:04', '2023-05-27 06:34:04', 0);
INSERT INTO `order_detail` VALUES (329, 206, 47, '荣耀V30 PRO PLUS 5G双模 麒麟990 5GSOC芯片 双快充 游戏手机 幻夜星河 全网通(8GB 128GB)', 'http://39.99.159.121:9000/gmall/1623051685202b22930ae8ce248e39cce327fcb09d008.png', 3999, '3', NULL, NULL, NULL, NULL, NULL, '2023-05-27 06:34:04', '2023-05-27 06:34:04', 0);
INSERT INTO `order_detail` VALUES (330, 206, 46, '荣耀V30 PRO PLUS 5G双模 麒麟990 5GSOC芯片 双快充 游戏手机 幻夜星河 全网通(8GB 256GB)', 'http://39.99.159.121:9000/gmall/1623051685202b22930ae8ce248e39cce327fcb09d008.png', 4099, '2', NULL, NULL, NULL, NULL, NULL, '2023-05-27 06:34:04', '2023-05-27 06:34:04', 0);
INSERT INTO `order_detail` VALUES (331, 207, 47, '荣耀V30 PRO PLUS 5G双模 麒麟990 5GSOC芯片 双快充 游戏手机 幻夜星河 全网通(8GB 128GB)', 'http://39.99.159.121:9000/gmall/1623051685202b22930ae8ce248e39cce327fcb09d008.png', 3999, '3', NULL, NULL, NULL, NULL, NULL, '2023-05-27 06:34:04', '2023-05-27 06:34:04', 0);
INSERT INTO `order_detail` VALUES (332, 207, 46, '荣耀V30 PRO PLUS 5G双模 麒麟990 5GSOC芯片 双快充 游戏手机 幻夜星河 全网通(8GB 256GB)', 'http://39.99.159.121:9000/gmall/1623051685202b22930ae8ce248e39cce327fcb09d008.png', 4099, '2', NULL, NULL, NULL, NULL, NULL, '2023-05-27 06:34:04', '2023-05-27 06:34:04', 0);
INSERT INTO `order_detail` VALUES (333, 208, 47, '荣耀V30 PRO PLUS 5G双模 麒麟990 5GSOC芯片 双快充 游戏手机 幻夜星河 全网通(8GB 128GB)', 'http://39.99.159.121:9000/gmall/1623051685202b22930ae8ce248e39cce327fcb09d008.png', 3999, '3', NULL, NULL, NULL, NULL, NULL, '2023-05-27 06:34:04', '2023-05-27 06:34:04', 0);
INSERT INTO `order_detail` VALUES (334, 208, 46, '荣耀V30 PRO PLUS 5G双模 麒麟990 5GSOC芯片 双快充 游戏手机 幻夜星河 全网通(8GB 256GB)', 'http://39.99.159.121:9000/gmall/1623051685202b22930ae8ce248e39cce327fcb09d008.png', 4099, '2', NULL, NULL, NULL, NULL, NULL, '2023-05-27 06:34:04', '2023-05-27 06:34:04', 0);
INSERT INTO `order_detail` VALUES (335, 209, 47, '荣耀V30 PRO PLUS 5G双模 麒麟990 5GSOC芯片 双快充 游戏手机 幻夜星河 全网通(8GB 128GB)', 'http://39.99.159.121:9000/gmall/1623051685202b22930ae8ce248e39cce327fcb09d008.png', 3999, '3', NULL, NULL, NULL, NULL, NULL, '2023-05-27 06:34:04', '2023-05-27 06:34:04', 0);
INSERT INTO `order_detail` VALUES (336, 209, 46, '荣耀V30 PRO PLUS 5G双模 麒麟990 5GSOC芯片 双快充 游戏手机 幻夜星河 全网通(8GB 256GB)', 'http://39.99.159.121:9000/gmall/1623051685202b22930ae8ce248e39cce327fcb09d008.png', 4099, '2', NULL, NULL, NULL, NULL, NULL, '2023-05-27 06:34:04', '2023-05-27 06:34:04', 0);
INSERT INTO `order_detail` VALUES (337, 210, 47, '荣耀V30 PRO PLUS 5G双模 麒麟990 5GSOC芯片 双快充 游戏手机 幻夜星河 全网通(8GB 128GB)', 'http://39.99.159.121:9000/gmall/1623051685202b22930ae8ce248e39cce327fcb09d008.png', 3999, '3', NULL, NULL, NULL, NULL, NULL, '2023-05-27 06:34:04', '2023-05-27 06:34:04', 0);
INSERT INTO `order_detail` VALUES (338, 210, 46, '荣耀V30 PRO PLUS 5G双模 麒麟990 5GSOC芯片 双快充 游戏手机 幻夜星河 全网通(8GB 256GB)', 'http://39.99.159.121:9000/gmall/1623051685202b22930ae8ce248e39cce327fcb09d008.png', 4099, '2', NULL, NULL, NULL, NULL, NULL, '2023-05-27 06:34:04', '2023-05-27 06:34:04', 0);
INSERT INTO `order_detail` VALUES (339, 211, 47, '荣耀V30 PRO PLUS 5G双模 麒麟990 5GSOC芯片 双快充 游戏手机 幻夜星河 全网通(8GB 128GB)', 'http://39.99.159.121:9000/gmall/1623051685202b22930ae8ce248e39cce327fcb09d008.png', 3999, '3', NULL, NULL, NULL, NULL, NULL, '2023-05-27 06:34:04', '2023-05-27 06:34:04', 0);
INSERT INTO `order_detail` VALUES (340, 211, 46, '荣耀V30 PRO PLUS 5G双模 麒麟990 5GSOC芯片 双快充 游戏手机 幻夜星河 全网通(8GB 256GB)', 'http://39.99.159.121:9000/gmall/1623051685202b22930ae8ce248e39cce327fcb09d008.png', 4099, '2', NULL, NULL, NULL, NULL, NULL, '2023-05-27 06:34:04', '2023-05-27 06:34:04', 0);
INSERT INTO `order_detail` VALUES (341, 212, 47, '荣耀V30 PRO PLUS 5G双模 麒麟990 5GSOC芯片 双快充 游戏手机 幻夜星河 全网通(8GB 128GB)', 'http://39.99.159.121:9000/gmall/1623051685202b22930ae8ce248e39cce327fcb09d008.png', 3999, '3', NULL, NULL, NULL, NULL, NULL, '2023-05-27 06:34:04', '2023-05-27 06:34:04', 0);
INSERT INTO `order_detail` VALUES (342, 212, 46, '荣耀V30 PRO PLUS 5G双模 麒麟990 5GSOC芯片 双快充 游戏手机 幻夜星河 全网通(8GB 256GB)', 'http://39.99.159.121:9000/gmall/1623051685202b22930ae8ce248e39cce327fcb09d008.png', 4099, '2', NULL, NULL, NULL, NULL, NULL, '2023-05-27 06:34:04', '2023-05-27 06:34:04', 0);
INSERT INTO `order_detail` VALUES (343, 213, 47, '荣耀V30 PRO PLUS 5G双模 麒麟990 5GSOC芯片 双快充 游戏手机 幻夜星河 全网通(8GB 128GB)', 'http://39.99.159.121:9000/gmall/1623051685202b22930ae8ce248e39cce327fcb09d008.png', 4999, '3', NULL, NULL, NULL, NULL, NULL, '2023-05-27 06:34:04', '2023-05-27 06:34:04', 0);
INSERT INTO `order_detail` VALUES (344, 213, 46, '荣耀V30 PRO PLUS 5G双模 麒麟990 5GSOC芯片 双快充 游戏手机 幻夜星河 全网通(8GB 256GB)', 'http://39.99.159.121:9000/gmall/1623051685202b22930ae8ce248e39cce327fcb09d008.png', 4099, '2', NULL, NULL, NULL, NULL, NULL, '2023-05-27 06:34:04', '2023-05-27 06:34:04', 0);
INSERT INTO `order_detail` VALUES (345, 214, 46, '荣耀V30 PRO PLUS 5G双模 麒麟990 5GSOC芯片 双快充 游戏手机 幻夜星河 全网通(8GB 256GB)', 'http://39.99.159.121:9000/gmall/1623051685202b22930ae8ce248e39cce327fcb09d008.png', 4099, '2', NULL, NULL, NULL, NULL, NULL, '2023-05-27 06:34:04', '2023-05-27 06:34:04', 0);
INSERT INTO `order_detail` VALUES (346, 214, 47, '荣耀V30 PRO PLUS 5G双模 麒麟990 5GSOC芯片 双快充 游戏手机 幻夜星河 全网通(8GB 128GB)', 'http://39.99.159.121:9000/gmall/1623051685202b22930ae8ce248e39cce327fcb09d008.png', 4999, '3', NULL, NULL, NULL, NULL, NULL, '2023-05-27 06:34:04', '2023-05-27 06:34:04', 0);
INSERT INTO `order_detail` VALUES (347, 215, 46, '荣耀V30 PRO PLUS 5G双模 麒麟990 5GSOC芯片 双快充 游戏手机 幻夜星河 全网通(8GB 256GB)', 'http://39.99.159.121:9000/gmall/1623051685202b22930ae8ce248e39cce327fcb09d008.png', 4099, '2', NULL, NULL, NULL, NULL, NULL, '2023-05-27 06:34:04', '2023-05-27 06:34:04', 0);
INSERT INTO `order_detail` VALUES (348, 215, 47, '荣耀V30 PRO PLUS 5G双模 麒麟990 5GSOC芯片 双快充 游戏手机 幻夜星河 全网通(8GB 128GB)', 'http://39.99.159.121:9000/gmall/1623051685202b22930ae8ce248e39cce327fcb09d008.png', 4999, '3', NULL, NULL, NULL, NULL, NULL, '2023-05-27 06:34:04', '2023-05-27 06:34:04', 0);
INSERT INTO `order_detail` VALUES (349, 216, 46, '荣耀V30 PRO PLUS 5G双模 麒麟990 5GSOC芯片 双快充 游戏手机 幻夜星河 全网通(8GB 256GB)', 'http://39.99.159.121:9000/gmall/1623051685202b22930ae8ce248e39cce327fcb09d008.png', 4099, '2', NULL, NULL, NULL, NULL, NULL, '2023-05-27 06:34:04', '2023-05-27 06:34:04', 0);
INSERT INTO `order_detail` VALUES (350, 216, 47, '荣耀V30 PRO PLUS 5G双模 麒麟990 5GSOC芯片 双快充 游戏手机 幻夜星河 全网通(8GB 128GB)', 'http://39.99.159.121:9000/gmall/1623051685202b22930ae8ce248e39cce327fcb09d008.png', 4999, '3', NULL, NULL, NULL, NULL, NULL, '2023-05-27 06:34:04', '2023-05-27 06:34:04', 0);
INSERT INTO `order_detail` VALUES (351, 217, 46, '荣耀V30 PRO PLUS 5G双模 麒麟990 5GSOC芯片 双快充 游戏手机 幻夜星河 全网通(8GB 256GB)', 'http://39.99.159.121:9000/gmall/1623051685202b22930ae8ce248e39cce327fcb09d008.png', 4099, '2', NULL, NULL, NULL, NULL, NULL, '2023-05-27 06:34:04', '2023-05-27 06:34:04', 0);
INSERT INTO `order_detail` VALUES (352, 217, 47, '荣耀V30 PRO PLUS 5G双模 麒麟990 5GSOC芯片 双快充 游戏手机 幻夜星河 全网通(8GB 128GB)', 'http://39.99.159.121:9000/gmall/1623051685202b22930ae8ce248e39cce327fcb09d008.png', 4999, '3', NULL, NULL, NULL, NULL, NULL, '2023-05-27 06:34:04', '2023-05-27 06:34:04', 0);
INSERT INTO `order_detail` VALUES (353, 218, 46, '荣耀V30 PRO PLUS 5G双模 麒麟990 5GSOC芯片 双快充 游戏手机 幻夜星河 全网通(8GB 256GB)', 'http://39.99.159.121:9000/gmall/1623051685202b22930ae8ce248e39cce327fcb09d008.png', 4099, '2', NULL, NULL, NULL, NULL, NULL, '2023-05-27 06:34:04', '2023-05-27 06:34:04', 0);
INSERT INTO `order_detail` VALUES (354, 218, 47, '荣耀V30 PRO PLUS 5G双模 麒麟990 5GSOC芯片 双快充 游戏手机 幻夜星河 全网通(8GB 128GB)', 'http://39.99.159.121:9000/gmall/1623051685202b22930ae8ce248e39cce327fcb09d008.png', 4999, '3', NULL, NULL, NULL, NULL, NULL, '2023-05-27 06:34:04', '2023-05-27 06:34:04', 0);
INSERT INTO `order_detail` VALUES (355, 219, 46, '荣耀V30 PRO PLUS 5G双模 麒麟990 5GSOC芯片 双快充 游戏手机 幻夜星河 全网通(8GB 256GB)', 'http://39.99.159.121:9000/gmall/1623051685202b22930ae8ce248e39cce327fcb09d008.png', 4099, '2', NULL, NULL, NULL, NULL, NULL, '2023-05-27 06:34:04', '2023-05-27 06:34:04', 0);
INSERT INTO `order_detail` VALUES (356, 219, 47, '荣耀V30 PRO PLUS 5G双模 麒麟990 5GSOC芯片 双快充 游戏手机 幻夜星河 全网通(8GB 128GB)', 'http://39.99.159.121:9000/gmall/1623051685202b22930ae8ce248e39cce327fcb09d008.png', 4999, '3', NULL, NULL, NULL, NULL, NULL, '2023-05-27 06:34:04', '2023-05-27 06:34:04', 0);
INSERT INTO `order_detail` VALUES (357, 220, 46, '荣耀V30 PRO PLUS 5G双模 麒麟990 5GSOC芯片 双快充 游戏手机 幻夜星河 全网通(8GB 256GB)', 'http://39.99.159.121:9000/gmall/1623051685202b22930ae8ce248e39cce327fcb09d008.png', 4099, '2', NULL, NULL, NULL, NULL, NULL, '2023-05-27 06:34:04', '2023-05-27 06:34:04', 0);
INSERT INTO `order_detail` VALUES (358, 220, 47, '荣耀V30 PRO PLUS 5G双模 麒麟990 5GSOC芯片 双快充 游戏手机 幻夜星河 全网通(8GB 128GB)', 'http://39.99.159.121:9000/gmall/1623051685202b22930ae8ce248e39cce327fcb09d008.png', 4999, '3', NULL, NULL, NULL, NULL, NULL, '2023-05-27 06:34:04', '2023-05-27 06:34:04', 0);
INSERT INTO `order_detail` VALUES (359, 221, 46, '荣耀V30 PRO PLUS 5G双模 麒麟990 5GSOC芯片 双快充 游戏手机 幻夜星河 全网通(8GB 256GB)', 'http://39.99.159.121:9000/gmall/1623051685202b22930ae8ce248e39cce327fcb09d008.png', 4099, '2', NULL, NULL, NULL, NULL, NULL, '2023-05-27 06:34:04', '2023-05-27 06:34:04', 0);
INSERT INTO `order_detail` VALUES (360, 221, 47, '荣耀V30 PRO PLUS 5G双模 麒麟990 5GSOC芯片 双快充 游戏手机 幻夜星河 全网通(8GB 128GB)', 'http://39.99.159.121:9000/gmall/1623051685202b22930ae8ce248e39cce327fcb09d008.png', 4999, '3', NULL, NULL, NULL, NULL, NULL, '2023-05-27 06:34:04', '2023-05-27 06:34:04', 0);
INSERT INTO `order_detail` VALUES (361, 222, 47, '荣耀V30 PRO PLUS 5G双模 麒麟990 5GSOC芯片 双快充 游戏手机 幻夜星河 全网通(8GB 128GB)', 'http://39.99.159.121:9000/gmall/1623051685202b22930ae8ce248e39cce327fcb09d008.png', 4999, '3', NULL, NULL, NULL, NULL, NULL, '2023-05-27 06:34:04', '2023-05-27 06:34:04', 0);
INSERT INTO `order_detail` VALUES (362, 222, 46, '荣耀V30 PRO PLUS 5G双模 麒麟990 5GSOC芯片 双快充 游戏手机 幻夜星河 全网通(8GB 256GB)', 'http://39.99.159.121:9000/gmall/1623051685202b22930ae8ce248e39cce327fcb09d008.png', 4099, '2', NULL, NULL, NULL, NULL, NULL, '2023-05-27 06:34:04', '2023-05-27 06:34:04', 0);
INSERT INTO `order_detail` VALUES (363, 223, 47, '荣耀V30 PRO PLUS 5G双模 麒麟990 5GSOC芯片 双快充 游戏手机 幻夜星河 全网通(8GB 128GB)', 'http://39.99.159.121:9000/gmall/1623051685202b22930ae8ce248e39cce327fcb09d008.png', 4999, '3', NULL, NULL, NULL, NULL, NULL, '2023-05-27 06:34:04', '2023-05-27 06:34:04', 0);
INSERT INTO `order_detail` VALUES (364, 223, 46, '荣耀V30 PRO PLUS 5G双模 麒麟990 5GSOC芯片 双快充 游戏手机 幻夜星河 全网通(8GB 256GB)', 'http://39.99.159.121:9000/gmall/1623051685202b22930ae8ce248e39cce327fcb09d008.png', 4099, '2', NULL, NULL, NULL, NULL, NULL, '2023-05-27 06:34:04', '2023-05-27 06:34:04', 0);
INSERT INTO `order_detail` VALUES (365, 224, 47, '荣耀V30 PRO PLUS 5G双模 麒麟990 5GSOC芯片 双快充 游戏手机 幻夜星河 全网通(8GB 128GB)', 'http://39.99.159.121:9000/gmall/1623051685202b22930ae8ce248e39cce327fcb09d008.png', 4999, '3', NULL, NULL, NULL, NULL, NULL, '2023-05-27 06:34:04', '2023-05-27 06:34:04', 0);
INSERT INTO `order_detail` VALUES (366, 224, 46, '荣耀V30 PRO PLUS 5G双模 麒麟990 5GSOC芯片 双快充 游戏手机 幻夜星河 全网通(8GB 256GB)', 'http://39.99.159.121:9000/gmall/1623051685202b22930ae8ce248e39cce327fcb09d008.png', 4099, '2', NULL, NULL, NULL, NULL, NULL, '2023-05-27 06:34:04', '2023-05-27 06:34:04', 0);
INSERT INTO `order_detail` VALUES (367, 225, 47, '荣耀V30 PRO PLUS 5G双模 麒麟990 5GSOC芯片 双快充 游戏手机 幻夜星河 全网通(8GB 128GB)', 'http://39.99.159.121:9000/gmall/1623051685202b22930ae8ce248e39cce327fcb09d008.png', 4999, '3', NULL, NULL, NULL, NULL, NULL, '2023-05-27 06:34:04', '2023-05-27 06:34:04', 0);
INSERT INTO `order_detail` VALUES (368, 225, 46, '荣耀V30 PRO PLUS 5G双模 麒麟990 5GSOC芯片 双快充 游戏手机 幻夜星河 全网通(8GB 256GB)', 'http://39.99.159.121:9000/gmall/1623051685202b22930ae8ce248e39cce327fcb09d008.png', 4099, '2', NULL, NULL, NULL, NULL, NULL, '2023-05-27 06:34:04', '2023-05-27 06:34:04', 0);
INSERT INTO `order_detail` VALUES (369, 226, 47, '荣耀V30 PRO PLUS 5G双模 麒麟990 5GSOC芯片 双快充 游戏手机 幻夜星河 全网通(8GB 128GB)', 'http://39.99.159.121:9000/gmall/1623051685202b22930ae8ce248e39cce327fcb09d008.png', 4999, '3', NULL, NULL, NULL, NULL, NULL, '2023-05-27 06:34:04', '2023-05-27 06:34:04', 0);
INSERT INTO `order_detail` VALUES (370, 226, 46, '荣耀V30 PRO PLUS 5G双模 麒麟990 5GSOC芯片 双快充 游戏手机 幻夜星河 全网通(8GB 256GB)', 'http://39.99.159.121:9000/gmall/1623051685202b22930ae8ce248e39cce327fcb09d008.png', 4099, '2', NULL, NULL, NULL, NULL, NULL, '2023-05-27 06:34:04', '2023-05-27 06:34:04', 0);
INSERT INTO `order_detail` VALUES (371, 227, 47, '荣耀V30 PRO PLUS 5G双模 麒麟990 5GSOC芯片 双快充 游戏手机 幻夜星河 全网通(8GB 128GB)', 'http://39.99.159.121:9000/gmall/1623051685202b22930ae8ce248e39cce327fcb09d008.png', 4999, '3', NULL, NULL, NULL, NULL, NULL, '2023-05-27 06:34:04', '2023-05-27 06:34:04', 0);
INSERT INTO `order_detail` VALUES (372, 228, 46, '荣耀V30 PRO PLUS 5G双模 麒麟990 5GSOC芯片 双快充 游戏手机 幻夜星河 全网通(8GB 256GB)', 'http://39.99.159.121:9000/gmall/1623051685202b22930ae8ce248e39cce327fcb09d008.png', 4099, '2', NULL, NULL, NULL, NULL, NULL, '2023-05-27 06:34:04', '2023-05-27 06:34:04', 0);
INSERT INTO `order_detail` VALUES (373, 229, 47, '荣耀V30 PRO PLUS 5G双模 麒麟990 5GSOC芯片 双快充 游戏手机 幻夜星河 全网通(8GB 128GB)', 'http://39.99.159.121:9000/gmall/1623051685202b22930ae8ce248e39cce327fcb09d008.png', 4999, '3', NULL, NULL, NULL, NULL, NULL, '2023-05-27 06:34:04', '2023-05-27 06:34:04', 0);
INSERT INTO `order_detail` VALUES (374, 229, 46, '荣耀V30 PRO PLUS 5G双模 麒麟990 5GSOC芯片 双快充 游戏手机 幻夜星河 全网通(8GB 256GB)', 'http://39.99.159.121:9000/gmall/1623051685202b22930ae8ce248e39cce327fcb09d008.png', 4099, '2', NULL, NULL, NULL, NULL, NULL, '2023-05-27 06:34:05', '2023-05-27 06:34:05', 0);
INSERT INTO `order_detail` VALUES (375, 230, 47, '荣耀V30 PRO PLUS 5G双模 麒麟990 5GSOC芯片 双快充 游戏手机 幻夜星河 全网通(8GB 128GB)', 'http://39.99.159.121:9000/gmall/1623051685202b22930ae8ce248e39cce327fcb09d008.png', 4999, '3', NULL, NULL, NULL, NULL, NULL, '2023-05-27 06:34:05', '2023-05-27 06:34:05', 0);
INSERT INTO `order_detail` VALUES (376, 230, 46, '荣耀V30 PRO PLUS 5G双模 麒麟990 5GSOC芯片 双快充 游戏手机 幻夜星河 全网通(8GB 256GB)', 'http://39.99.159.121:9000/gmall/1623051685202b22930ae8ce248e39cce327fcb09d008.png', 4099, '2', NULL, NULL, NULL, NULL, NULL, '2023-05-27 06:34:05', '2023-05-27 06:34:05', 0);
INSERT INTO `order_detail` VALUES (377, 231, 47, '荣耀V30 PRO PLUS 5G双模 麒麟990 5GSOC芯片 双快充 游戏手机 幻夜星河 全网通(8GB 128GB)', 'http://39.99.159.121:9000/gmall/1623051685202b22930ae8ce248e39cce327fcb09d008.png', 4999, '3', NULL, NULL, NULL, NULL, NULL, '2023-05-27 06:34:05', '2023-05-27 06:34:05', 0);
INSERT INTO `order_detail` VALUES (378, 232, 46, '荣耀V30 PRO PLUS 5G双模 麒麟990 5GSOC芯片 双快充 游戏手机 幻夜星河 全网通(8GB 256GB)', 'http://39.99.159.121:9000/gmall/1623051685202b22930ae8ce248e39cce327fcb09d008.png', 4099, '2', NULL, NULL, NULL, NULL, NULL, '2023-05-27 06:34:05', '2023-05-27 06:34:05', 0);
INSERT INTO `order_detail` VALUES (379, 233, 47, '荣耀V30 PRO PLUS 5G双模 麒麟990 5GSOC芯片 双快充 游戏手机 幻夜星河 全网通(8GB 128GB)', 'http://39.99.159.121:9000/gmall/1623051685202b22930ae8ce248e39cce327fcb09d008.png', 4999, '3', NULL, NULL, NULL, NULL, NULL, '2023-05-27 06:34:05', '2023-05-27 06:34:05', 0);
INSERT INTO `order_detail` VALUES (380, 233, 46, '荣耀V30 PRO PLUS 5G双模 麒麟990 5GSOC芯片 双快充 游戏手机 幻夜星河 全网通(8GB 256GB)', 'http://39.99.159.121:9000/gmall/1623051685202b22930ae8ce248e39cce327fcb09d008.png', 4099, '2', NULL, NULL, NULL, NULL, NULL, '2023-05-27 06:34:05', '2023-05-27 06:34:05', 0);
INSERT INTO `order_detail` VALUES (381, 234, 47, '荣耀V30 PRO PLUS 5G双模 麒麟990 5GSOC芯片 双快充 游戏手机 幻夜星河 全网通(8GB 128GB)', 'http://39.99.159.121:9000/gmall/1623051685202b22930ae8ce248e39cce327fcb09d008.png', 4999, '3', NULL, NULL, NULL, NULL, NULL, '2023-05-27 06:34:05', '2023-05-27 06:34:05', 0);
INSERT INTO `order_detail` VALUES (382, 235, 46, '荣耀V30 PRO PLUS 5G双模 麒麟990 5GSOC芯片 双快充 游戏手机 幻夜星河 全网通(8GB 256GB)', 'http://39.99.159.121:9000/gmall/1623051685202b22930ae8ce248e39cce327fcb09d008.png', 4099, '2', NULL, NULL, NULL, NULL, NULL, '2023-05-27 06:34:05', '2023-05-27 06:34:05', 0);
INSERT INTO `order_detail` VALUES (383, 236, 47, '荣耀V30 PRO PLUS 5G双模 麒麟990 5GSOC芯片 双快充 游戏手机 幻夜星河 全网通(8GB 128GB)', 'http://39.99.159.121:9000/gmall/1623051685202b22930ae8ce248e39cce327fcb09d008.png', 4999, '3', NULL, NULL, NULL, NULL, NULL, '2023-05-27 06:34:05', '2023-05-27 06:34:05', 0);
INSERT INTO `order_detail` VALUES (384, 236, 46, '荣耀V30 PRO PLUS 5G双模 麒麟990 5GSOC芯片 双快充 游戏手机 幻夜星河 全网通(8GB 256GB)', 'http://39.99.159.121:9000/gmall/1623051685202b22930ae8ce248e39cce327fcb09d008.png', 4099, '2', NULL, NULL, NULL, NULL, NULL, '2023-05-27 06:34:05', '2023-05-27 06:34:05', 0);
INSERT INTO `order_detail` VALUES (385, 237, 47, '荣耀V30 PRO PLUS 5G双模 麒麟990 5GSOC芯片 双快充 游戏手机 幻夜星河 全网通(8GB 128GB)', 'http://39.99.159.121:9000/gmall/1623051685202b22930ae8ce248e39cce327fcb09d008.png', 4999, '3', NULL, NULL, NULL, NULL, NULL, '2023-05-27 06:34:05', '2023-05-27 06:34:05', 0);
INSERT INTO `order_detail` VALUES (386, 237, 46, '荣耀V30 PRO PLUS 5G双模 麒麟990 5GSOC芯片 双快充 游戏手机 幻夜星河 全网通(8GB 256GB)', 'http://39.99.159.121:9000/gmall/1623051685202b22930ae8ce248e39cce327fcb09d008.png', 4099, '2', NULL, NULL, NULL, NULL, NULL, '2023-05-27 06:34:05', '2023-05-27 06:34:05', 0);
INSERT INTO `order_detail` VALUES (387, 238, 47, '荣耀V30 PRO PLUS 5G双模 麒麟990 5GSOC芯片 双快充 游戏手机 幻夜星河 全网通(8GB 128GB)', 'http://39.99.159.121:9000/gmall/1623051685202b22930ae8ce248e39cce327fcb09d008.png', 4999, '3', NULL, NULL, NULL, NULL, NULL, '2023-05-27 06:34:05', '2023-05-27 06:34:05', 0);
INSERT INTO `order_detail` VALUES (388, 238, 46, '荣耀V30 PRO PLUS 5G双模 麒麟990 5GSOC芯片 双快充 游戏手机 幻夜星河 全网通(8GB 256GB)', 'http://39.99.159.121:9000/gmall/1623051685202b22930ae8ce248e39cce327fcb09d008.png', 4099, '2', NULL, NULL, NULL, NULL, NULL, '2023-05-27 06:34:05', '2023-05-27 06:34:05', 0);
INSERT INTO `order_detail` VALUES (389, 239, 47, '荣耀V30 PRO PLUS 5G双模 麒麟990 5GSOC芯片 双快充 游戏手机 幻夜星河 全网通(8GB 128GB)', 'http://39.99.159.121:9000/gmall/1623051685202b22930ae8ce248e39cce327fcb09d008.png', 4999, '3', NULL, NULL, NULL, NULL, NULL, '2023-05-27 06:34:05', '2023-05-27 06:34:05', 0);
INSERT INTO `order_detail` VALUES (390, 239, 46, '荣耀V30 PRO PLUS 5G双模 麒麟990 5GSOC芯片 双快充 游戏手机 幻夜星河 全网通(8GB 256GB)', 'http://39.99.159.121:9000/gmall/1623051685202b22930ae8ce248e39cce327fcb09d008.png', 4099, '2', NULL, NULL, NULL, NULL, NULL, '2023-05-27 06:34:05', '2023-05-27 06:34:05', 0);
INSERT INTO `order_detail` VALUES (391, 240, 46, '荣耀V30 PRO PLUS 5G双模 麒麟990 5GSOC芯片 双快充 游戏手机 幻夜星河 全网通(8GB 256GB)', 'http://39.99.159.121:9000/gmall/1623051685202b22930ae8ce248e39cce327fcb09d008.png', 50, '1', NULL, NULL, NULL, NULL, NULL, '2023-05-27 06:34:05', '2023-05-27 06:34:05', 0);
INSERT INTO `order_detail` VALUES (392, 241, 46, '荣耀V30 PRO PLUS 5G双模 麒麟990 5GSOC芯片 双快充 游戏手机 幻夜星河 全网通(8GB 256GB)', 'http://39.99.159.121:9000/gmall/1623051685202b22930ae8ce248e39cce327fcb09d008.png', 50, '1', NULL, NULL, NULL, NULL, NULL, '2023-05-27 06:34:05', '2023-05-27 06:34:05', 0);
INSERT INTO `order_detail` VALUES (393, 242, 46, '荣耀V30 PRO PLUS 5G双模 麒麟990 5GSOC芯片 双快充 游戏手机 幻夜星河 全网通(8GB 256GB)', 'http://39.99.159.121:9000/gmall/1623051685202b22930ae8ce248e39cce327fcb09d008.png', 4099, '2', NULL, NULL, NULL, NULL, NULL, '2023-05-27 06:34:05', '2023-05-27 06:34:05', 0);
INSERT INTO `order_detail` VALUES (394, 242, 47, '荣耀V30 PRO PLUS 5G双模 麒麟990 5GSOC芯片 双快充 游戏手机 幻夜星河 全网通(8GB 128GB)', 'http://39.99.159.121:9000/gmall/1623051685202b22930ae8ce248e39cce327fcb09d008.png', 4999, '3', NULL, NULL, NULL, NULL, NULL, '2023-05-27 06:34:05', '2023-05-27 06:34:05', 0);
INSERT INTO `order_detail` VALUES (395, 243, 46, '荣耀V30 PRO PLUS 5G双模 麒麟990 5GSOC芯片 双快充 游戏手机 幻夜星河 全网通(8GB 256GB)', 'http://39.99.159.121:9000/gmall/1623051685202b22930ae8ce248e39cce327fcb09d008.png', 4099, '2', NULL, NULL, NULL, NULL, NULL, '2023-05-27 06:34:05', '2023-05-27 06:34:05', 0);
INSERT INTO `order_detail` VALUES (396, 243, 47, '荣耀V30 PRO PLUS 5G双模 麒麟990 5GSOC芯片 双快充 游戏手机 幻夜星河 全网通(8GB 128GB)', 'http://39.99.159.121:9000/gmall/1623051685202b22930ae8ce248e39cce327fcb09d008.png', 4999, '3', NULL, NULL, NULL, NULL, NULL, '2023-05-27 06:34:05', '2023-05-27 06:34:05', 0);

SET FOREIGN_KEY_CHECKS = 1;
