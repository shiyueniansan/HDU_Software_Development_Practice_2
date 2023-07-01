/*
 Navicat Premium Data Transfer

 Source Server         : laptop
 Source Server Type    : MySQL
 Source Server Version : 80031
 Source Host           : localhost:3306
 Source Schema         : financial

 Target Server Type    : MySQL
 Target Server Version : 80031
 File Encoding         : 65001

 Date: 01/07/2023 17:26:45
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for affair
-- ----------------------------
DROP TABLE IF EXISTS `affair`;
CREATE TABLE `affair`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `faculty_id` bigint NOT NULL COMMENT '教职工编号',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '姓名',
  `month` int NOT NULL COMMENT '月份',
  `des` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '描述',
  `hour` float NOT NULL DEFAULT 0 COMMENT '时长',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '事务（课时任务）表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of affair
-- ----------------------------
INSERT INTO `affair` VALUES (1, 1, '小马', 1, '大学物理', 12);
INSERT INTO `affair` VALUES (2, 1, '小马', 2, '大学物理', 15);
INSERT INTO `affair` VALUES (3, 1, '小马', 3, '大学物理', 15);
INSERT INTO `affair` VALUES (4, 1, '小马', 4, '大学物理', 12);
INSERT INTO `affair` VALUES (5, 1, '小马', 5, '大学物理', 18);
INSERT INTO `affair` VALUES (6, 1, '小马', 6, '大学物理', 15);
INSERT INTO `affair` VALUES (7, 1, '小马', 7, '大学物理', 2);
INSERT INTO `affair` VALUES (8, 1, '小马', 8, '大学物理', 2);
INSERT INTO `affair` VALUES (9, 1, '小马', 9, '大学物理', 12);
INSERT INTO `affair` VALUES (10, 1, '小马', 10, '大学物理', 12);
INSERT INTO `affair` VALUES (11, 1, '小马', 11, '大学物理', 15);
INSERT INTO `affair` VALUES (12, 1, '小马', 12, '大学物理', 2);
INSERT INTO `affair` VALUES (13, 3, '张三', 1, '高等数学', 12);
INSERT INTO `affair` VALUES (14, 3, '张三', 2, '高等数学', 12);
INSERT INTO `affair` VALUES (15, 3, '张三', 3, '高等数学', 12);
INSERT INTO `affair` VALUES (16, 3, '张三', 4, '高等数学', 12);
INSERT INTO `affair` VALUES (17, 3, '张三', 5, '高等数学', 12);
INSERT INTO `affair` VALUES (18, 3, '张三', 6, '高等数学', 12);
INSERT INTO `affair` VALUES (19, 3, '张三', 7, '高等数学', 2);
INSERT INTO `affair` VALUES (20, 3, '张三', 8, '高等数学', 2);
INSERT INTO `affair` VALUES (21, 3, '张三', 9, '高等数学', 12);
INSERT INTO `affair` VALUES (22, 3, '张三', 10, '高等数学', 12);
INSERT INTO `affair` VALUES (23, 3, '张三', 11, '高等数学', 12);
INSERT INTO `affair` VALUES (24, 3, '张三', 12, '高等数学', 2);
INSERT INTO `affair` VALUES (25, 2, '小王', 1, '主持工作', 20);
INSERT INTO `affair` VALUES (26, 2, '小王', 2, '主持工作', 20);
INSERT INTO `affair` VALUES (27, 2, '小王', 3, '主持工作', 16);
INSERT INTO `affair` VALUES (28, 2, '小王', 4, '管理工作', 10);
INSERT INTO `affair` VALUES (29, 2, '小王', 4, '主持工作', 12);

-- ----------------------------
-- Table structure for faculty
-- ----------------------------
DROP TABLE IF EXISTS `faculty`;
CREATE TABLE `faculty`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '姓名',
  `type` int NOT NULL COMMENT '教师/职工',
  `job` int NULL DEFAULT 0 COMMENT '职务',
  `title` int NULL DEFAULT 0 COMMENT '职称',
  `basic_pay` float NULL DEFAULT 0 COMMENT '基本工资',
  `living_subsidy` float NULL DEFAULT 0 COMMENT '生活补贴',
  `reading_subsidy` float NULL DEFAULT 0 COMMENT '书报费',
  `transportation_subsidy` float NULL DEFAULT 0 COMMENT '交通费',
  `washing_subsidy` float NULL DEFAULT 0 COMMENT '洗理费',
  `quota_hour` float NULL DEFAULT 0 COMMENT '定额课时',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `staff_position`(`job` ASC) USING BTREE,
  INDEX `professional_title`(`title` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '教职工表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of faculty
-- ----------------------------
INSERT INTO `faculty` VALUES (1, '小马', 0, 0, 3, 7000, 200, 100, 150, 80, 60);
INSERT INTO `faculty` VALUES (2, '小王', 1, 3, 0, 6000, 200, 100, 150, 100, 0);
INSERT INTO `faculty` VALUES (3, '张三', 0, 0, 1, 8000, 200, 150, 150, 100, 50);
INSERT INTO `faculty` VALUES (4, '李四', 1, 5, 0, 5000, 150, 50, 200, 80, 0);
INSERT INTO `faculty` VALUES (5, '王五', 1, 8, 0, 3000, 100, 50, 120, 80, 0);
INSERT INTO `faculty` VALUES (6, '小李', 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- ----------------------------
-- Table structure for faculty_monthly
-- ----------------------------
DROP TABLE IF EXISTS `faculty_monthly`;
CREATE TABLE `faculty_monthly`  (
  `faculty_id` bigint NOT NULL COMMENT '教职工编号',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '姓名',
  `month` int NOT NULL COMMENT '月份',
  `teacher_pay` float NULL DEFAULT 0 COMMENT '课时费',
  `staff_pay` float NULL DEFAULT 0 COMMENT '岗位津贴',
  `extra_teacher_pay` float NULL DEFAULT 0 COMMENT '超额课时费',
  `total_pay` float NULL DEFAULT 0 COMMENT '工资总额',
  `tax` float NULL DEFAULT 0 COMMENT '个人所得税',
  `housing` float NULL DEFAULT 0 COMMENT '住房公积金',
  `insurance` float NULL DEFAULT 0 COMMENT '保险费',
  `net_pay` float NULL DEFAULT 0 COMMENT '实发工资',
  PRIMARY KEY (`faculty_id`, `month`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '教职工月度表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of faculty_monthly
-- ----------------------------
INSERT INTO `faculty_monthly` VALUES (1, '小马', 1, 900, 0, 0, 8430, 133, 250, 250, 7797);
INSERT INTO `faculty_monthly` VALUES (1, '小马', 2, 1125, 0, 0, 8655, 155.5, 250, 250, 7999.5);
INSERT INTO `faculty_monthly` VALUES (1, '小马', 3, 1125, 0, 0, 8655, 155.5, 250, 250, 7999.5);
INSERT INTO `faculty_monthly` VALUES (1, '小马', 4, 900, 0, 0, 8430, 133, 250, 250, 7797);
INSERT INTO `faculty_monthly` VALUES (1, '小马', 5, 1350, 0, 0, 8880, 178, 250, 250, 8202);
INSERT INTO `faculty_monthly` VALUES (1, '小马', 6, 1125, 0, 0, 8655, 155.5, 250, 250, 7999.5);
INSERT INTO `faculty_monthly` VALUES (1, '小马', 7, 150, 0, 0, 7680, 80.4, 250, 250, 7099.6);
INSERT INTO `faculty_monthly` VALUES (1, '小马', 8, 150, 0, 0, 7680, 80.4, 250, 250, 7099.6);
INSERT INTO `faculty_monthly` VALUES (1, '小马', 9, 900, 0, 0, 8430, 133, 250, 250, 7797);
INSERT INTO `faculty_monthly` VALUES (1, '小马', 10, 900, 0, 0, 8430, 133, 250, 250, 7797);
INSERT INTO `faculty_monthly` VALUES (1, '小马', 11, 1125, 0, 0, 8655, 155.5, 250, 250, 7999.5);
INSERT INTO `faculty_monthly` VALUES (1, '小马', 12, 150, 0, 6480, 14160, 706, 250, 250, 12954);
INSERT INTO `faculty_monthly` VALUES (2, '小王', 1, 0, 1200, 0, 7750, 82.5, 250, 250, 7167.5);
INSERT INTO `faculty_monthly` VALUES (2, '小王', 2, 0, 1200, 0, 7750, 82.5, 250, 250, 7167.5);
INSERT INTO `faculty_monthly` VALUES (2, '小王', 3, 0, 960, 0, 7510, 75.3, 250, 250, 6934.7);
INSERT INTO `faculty_monthly` VALUES (2, '小王', 4, 0, 1320, 0, 7870, 86.1, 250, 250, 7283.9);
INSERT INTO `faculty_monthly` VALUES (2, '小王', 5, 0, 0, 0, 6550, 46.5, 250, 250, 6003.5);
INSERT INTO `faculty_monthly` VALUES (2, '小王', 6, 0, 0, 0, 6550, 46.5, 250, 250, 6003.5);
INSERT INTO `faculty_monthly` VALUES (2, '小王', 7, 0, 0, 0, 6550, 46.5, 250, 250, 6003.5);
INSERT INTO `faculty_monthly` VALUES (2, '小王', 8, 0, 0, 0, 6550, 46.5, 250, 250, 6003.5);
INSERT INTO `faculty_monthly` VALUES (2, '小王', 9, 0, 0, 0, 6550, 46.5, 250, 250, 6003.5);
INSERT INTO `faculty_monthly` VALUES (2, '小王', 10, 0, 0, 0, 6550, 46.5, 250, 250, 6003.5);
INSERT INTO `faculty_monthly` VALUES (2, '小王', 11, 0, 0, 0, 6550, 46.5, 250, 250, 6003.5);
INSERT INTO `faculty_monthly` VALUES (2, '小王', 12, 0, 0, 0, 6550, 46.5, 250, 250, 6003.5);
INSERT INTO `faculty_monthly` VALUES (3, '张三', 1, 1200, 0, 0, 9800, 270, 250, 250, 9030);
INSERT INTO `faculty_monthly` VALUES (3, '张三', 2, 1200, 0, 0, 9800, 270, 250, 250, 9030);
INSERT INTO `faculty_monthly` VALUES (3, '张三', 3, 1200, 0, 0, 9800, 270, 250, 250, 9030);
INSERT INTO `faculty_monthly` VALUES (3, '张三', 4, 1200, 0, 0, 9800, 270, 250, 250, 9030);
INSERT INTO `faculty_monthly` VALUES (3, '张三', 5, 1200, 0, 0, 9800, 270, 250, 250, 9030);
INSERT INTO `faculty_monthly` VALUES (3, '张三', 6, 1200, 0, 0, 9800, 270, 250, 250, 9030);
INSERT INTO `faculty_monthly` VALUES (3, '张三', 7, 200, 0, 0, 8800, 170, 250, 250, 8130);
INSERT INTO `faculty_monthly` VALUES (3, '张三', 8, 200, 0, 0, 8800, 170, 250, 250, 8130);
INSERT INTO `faculty_monthly` VALUES (3, '张三', 9, 1200, 0, 0, 9800, 270, 250, 250, 9030);
INSERT INTO `faculty_monthly` VALUES (3, '张三', 10, 1200, 0, 0, 9800, 270, 250, 250, 9030);
INSERT INTO `faculty_monthly` VALUES (3, '张三', 11, 1200, 0, 0, 9800, 270, 250, 250, 9030);
INSERT INTO `faculty_monthly` VALUES (3, '张三', 12, 200, 0, 7680, 16480, 938, 250, 250, 15042);
INSERT INTO `faculty_monthly` VALUES (4, '李四', 1, 0, 0, 0, 5480, 14.4, 250, 250, 4965.6);
INSERT INTO `faculty_monthly` VALUES (4, '李四', 2, 0, 0, 0, 5480, 14.4, 250, 250, 4965.6);
INSERT INTO `faculty_monthly` VALUES (4, '李四', 3, 0, 0, 0, 5480, 14.4, 250, 250, 4965.6);
INSERT INTO `faculty_monthly` VALUES (4, '李四', 4, 0, 0, 0, 5480, 14.4, 250, 250, 4965.6);
INSERT INTO `faculty_monthly` VALUES (4, '李四', 5, 0, 0, 0, 5480, 14.4, 250, 250, 4965.6);
INSERT INTO `faculty_monthly` VALUES (4, '李四', 6, 0, 0, 0, 5480, 14.4, 250, 250, 4965.6);
INSERT INTO `faculty_monthly` VALUES (4, '李四', 7, 0, 0, 0, 5480, 14.4, 250, 250, 4965.6);
INSERT INTO `faculty_monthly` VALUES (4, '李四', 8, 0, 0, 0, 5480, 14.4, 250, 250, 4965.6);
INSERT INTO `faculty_monthly` VALUES (4, '李四', 9, 0, 0, 0, 5480, 14.4, 250, 250, 4965.6);
INSERT INTO `faculty_monthly` VALUES (4, '李四', 10, 0, 0, 0, 5480, 14.4, 250, 250, 4965.6);
INSERT INTO `faculty_monthly` VALUES (4, '李四', 11, 0, 0, 0, 5480, 14.4, 250, 250, 4965.6);
INSERT INTO `faculty_monthly` VALUES (4, '李四', 12, 0, 0, 0, 5480, 14.4, 250, 250, 4965.6);
INSERT INTO `faculty_monthly` VALUES (5, '王五', 1, 0, 0, 0, 3350, 0, 250, 250, 2850);
INSERT INTO `faculty_monthly` VALUES (5, '王五', 2, 0, 0, 0, 3350, 0, 250, 250, 2850);
INSERT INTO `faculty_monthly` VALUES (5, '王五', 3, 0, 0, 0, 3350, 0, 250, 250, 2850);
INSERT INTO `faculty_monthly` VALUES (5, '王五', 4, 0, 0, 0, 3350, 0, 250, 250, 2850);
INSERT INTO `faculty_monthly` VALUES (5, '王五', 5, 0, 0, 0, 3350, 0, 250, 250, 2850);
INSERT INTO `faculty_monthly` VALUES (5, '王五', 6, 0, 0, 0, 3350, 0, 250, 250, 2850);
INSERT INTO `faculty_monthly` VALUES (5, '王五', 7, 0, 0, 0, 3350, 0, 250, 250, 2850);
INSERT INTO `faculty_monthly` VALUES (5, '王五', 8, 0, 0, 0, 3350, 0, 250, 250, 2850);
INSERT INTO `faculty_monthly` VALUES (5, '王五', 9, 0, 0, 0, 3350, 0, 250, 250, 2850);
INSERT INTO `faculty_monthly` VALUES (5, '王五', 10, 0, 0, 0, 3350, 0, 250, 250, 2850);
INSERT INTO `faculty_monthly` VALUES (5, '王五', 11, 0, 0, 0, 3350, 0, 250, 250, 2850);
INSERT INTO `faculty_monthly` VALUES (5, '王五', 12, 0, 0, 0, 3350, 0, 250, 250, 2850);
INSERT INTO `faculty_monthly` VALUES (6, '小李', 1, 0, 0, 0, 0, 0, 250, 250, -500);
INSERT INTO `faculty_monthly` VALUES (6, '小李', 2, 0, 0, 0, 0, 0, 250, 250, -500);
INSERT INTO `faculty_monthly` VALUES (6, '小李', 3, 0, 0, 0, 0, 0, 250, 250, -500);
INSERT INTO `faculty_monthly` VALUES (6, '小李', 4, 0, 0, 0, 0, 0, 250, 250, -500);
INSERT INTO `faculty_monthly` VALUES (6, '小李', 5, 0, 0, 0, 0, 0, 250, 250, -500);
INSERT INTO `faculty_monthly` VALUES (6, '小李', 6, 0, 0, 0, 0, 0, 250, 250, -500);
INSERT INTO `faculty_monthly` VALUES (6, '小李', 7, 0, 0, 0, 0, 0, 250, 250, -500);
INSERT INTO `faculty_monthly` VALUES (6, '小李', 8, 0, 0, 0, 0, 0, 250, 250, -500);
INSERT INTO `faculty_monthly` VALUES (6, '小李', 9, 0, 0, 0, 0, 0, 250, 250, -500);
INSERT INTO `faculty_monthly` VALUES (6, '小李', 10, 0, 0, 0, 0, 0, 250, 250, -500);
INSERT INTO `faculty_monthly` VALUES (6, '小李', 11, 0, 0, 0, 0, 0, 250, 250, -500);
INSERT INTO `faculty_monthly` VALUES (6, '小李', 12, 0, 0, 0, 0, 0, 250, 250, -500);

-- ----------------------------
-- Table structure for faculty_monthly_pay
-- ----------------------------
DROP TABLE IF EXISTS `faculty_monthly_pay`;
CREATE TABLE `faculty_monthly_pay`  (
  `faculty_id` bigint NOT NULL COMMENT '教职工编号',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '姓名',
  `month` int NOT NULL COMMENT '月份',
  `net_pay` float NULL DEFAULT 0 COMMENT '实发工资',
  PRIMARY KEY (`faculty_id`, `month`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '教职工月度表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of faculty_monthly_pay
-- ----------------------------
INSERT INTO `faculty_monthly_pay` VALUES (1, '龚嘉伦', 1, 18755.2);
INSERT INTO `faculty_monthly_pay` VALUES (2, '叶云熙', 2, 12496.4);
INSERT INTO `faculty_monthly_pay` VALUES (3, '林震南', 3, 12550.2);
INSERT INTO `faculty_monthly_pay` VALUES (4, '吴岚', 4, 7227.57);
INSERT INTO `faculty_monthly_pay` VALUES (5, '刘睿', 5, 18067.9);

-- ----------------------------
-- Table structure for faculty_monthly_pay_detail
-- ----------------------------
DROP TABLE IF EXISTS `faculty_monthly_pay_detail`;
CREATE TABLE `faculty_monthly_pay_detail`  (
  `faculty_id` bigint NOT NULL COMMENT '教职工编号',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '姓名',
  `month` int NOT NULL COMMENT '月份',
  `basic_pay` float NULL DEFAULT 0 COMMENT '基本工资',
  `job` int NULL DEFAULT 0 COMMENT '职务',
  `title` int NULL DEFAULT 0 COMMENT '职称',
  `living_subsidy` float NULL DEFAULT 0 COMMENT '生活补贴',
  `reading_subsidy` float NULL DEFAULT 0 COMMENT '书报费',
  `transportation_subsidy` float NULL DEFAULT 0 COMMENT '交通费',
  `washing_subsidy` float NULL DEFAULT 0 COMMENT '洗理费',
  `teacher_pay` float NULL DEFAULT 0 COMMENT '课时费',
  `staff_pay` float NULL DEFAULT 0 COMMENT '岗位津贴',
  `extra_teacher_pay` float NULL DEFAULT 0 COMMENT '超额课时费',
  `total_pay` float NULL DEFAULT 0 COMMENT '工资总额',
  `tax` float NULL DEFAULT 0 COMMENT '个人所得税',
  `housing` float NULL DEFAULT 0 COMMENT '住房公积金',
  `insurance` float NULL DEFAULT 0 COMMENT '保险费',
  `net_pay` float NULL DEFAULT 0 COMMENT '实发工资',
  PRIMARY KEY (`faculty_id`, `month`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '教职工月度表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of faculty_monthly_pay_detail
-- ----------------------------
INSERT INTO `faculty_monthly_pay_detail` VALUES (1, '龚嘉伦', 1, 0, 0, 0, 0, 0, 0, 0, 5259.73, 2190.32, 3772.36, 10147.2, 762.6, 597.18, 171.17, 18755.2);
INSERT INTO `faculty_monthly_pay_detail` VALUES (2, '叶云熙', 2, 0, 0, 0, 0, 0, 0, 0, 2527.7, 49.56, 2462.93, 15607.1, 593.9, 726.91, 540.07, 12496.4);
INSERT INTO `faculty_monthly_pay_detail` VALUES (3, '林震南', 3, 0, 0, 0, 0, 0, 0, 0, 3228.42, 2802.99, 134.22, 16957.5, 416.39, 298.88, 915.43, 12550.2);
INSERT INTO `faculty_monthly_pay_detail` VALUES (4, '吴岚', 4, 0, 0, 0, 0, 0, 0, 0, 7544.67, 2300.4, 1382.5, 9897.04, 324.55, 27.84, 125.78, 7227.57);
INSERT INTO `faculty_monthly_pay_detail` VALUES (5, '刘睿', 5, 0, 0, 0, 0, 0, 0, 0, 3122.63, 2959.62, 45.56, 18204.2, 123.03, 76.28, 986.48, 18067.9);

-- ----------------------------
-- Table structure for faculty_monthly_pay_detail_test
-- ----------------------------
DROP TABLE IF EXISTS `faculty_monthly_pay_detail_test`;
CREATE TABLE `faculty_monthly_pay_detail_test`  (
  `faculty_id` bigint NOT NULL COMMENT '教职工编号',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '姓名',
  `month` int NOT NULL COMMENT '月份',
  `basic_pay` float NULL DEFAULT 0 COMMENT '基本工资',
  `job` int NULL DEFAULT 0 COMMENT '职务',
  `title` int NULL DEFAULT 0 COMMENT '职称',
  `living_subsidy` float NULL DEFAULT 0 COMMENT '生活补贴',
  `reading_subsidy` float NULL DEFAULT 0 COMMENT '书报费',
  `transportation_subsidy` float NULL DEFAULT 0 COMMENT '交通费',
  `washing_subsidy` float NULL DEFAULT 0 COMMENT '洗理费',
  `teacher_pay` float NULL DEFAULT 0 COMMENT '课时费',
  `staff_pay` float NULL DEFAULT 0 COMMENT '岗位津贴',
  `extra_teacher_pay` float NULL DEFAULT 0 COMMENT '超额课时费',
  `total_pay` float NULL DEFAULT 0 COMMENT '工资总额',
  `tax` float NULL DEFAULT 0 COMMENT '个人所得税',
  `housing` float NULL DEFAULT 0 COMMENT '住房公积金',
  `insurance` float NULL DEFAULT 0 COMMENT '保险费',
  `net_pay` float NULL DEFAULT 0 COMMENT '实发工资',
  PRIMARY KEY (`faculty_id`, `month`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '教职工月度表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of faculty_monthly_pay_detail_test
-- ----------------------------
INSERT INTO `faculty_monthly_pay_detail_test` VALUES (1, '龚嘉伦', 1, 0, 0, 0, 0, 0, 0, 0, 5259.73, 2190.32, 3772.36, 10147.2, 762.6, 597.18, 171.17, 18755.2);
INSERT INTO `faculty_monthly_pay_detail_test` VALUES (2, '叶云熙', 2, 0, 0, 0, 0, 0, 0, 0, 2527.7, 49.56, 2462.93, 15607.1, 593.9, 726.91, 540.07, 12496.4);
INSERT INTO `faculty_monthly_pay_detail_test` VALUES (3, '林震南', 3, 0, 0, 0, 0, 0, 0, 0, 3228.42, 2802.99, 134.22, 16957.5, 416.39, 298.88, 915.43, 12550.2);
INSERT INTO `faculty_monthly_pay_detail_test` VALUES (4, '吴岚', 4, 0, 0, 0, 0, 0, 0, 0, 7544.67, 2300.4, 1382.5, 9897.04, 324.55, 27.84, 125.78, 7227.57);
INSERT INTO `faculty_monthly_pay_detail_test` VALUES (5, '刘睿', 5, 0, 0, 0, 0, 0, 0, 0, 3122.63, 2959.62, 45.56, 18204.2, 123.03, 76.28, 986.48, 18067.9);

-- ----------------------------
-- Table structure for faculty_yearly
-- ----------------------------
DROP TABLE IF EXISTS `faculty_yearly`;
CREATE TABLE `faculty_yearly`  (
  `faculty_id` bigint NOT NULL COMMENT '教职工编号',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '姓名',
  `total_pay` float NULL DEFAULT 0 COMMENT '本年度累计工资总额',
  `hour` float NULL DEFAULT 0 COMMENT '本年度累计授课时数',
  `avg_pay` float NULL DEFAULT 5000 COMMENT '上年度月平均工资',
  `net_pay` float NULL DEFAULT 0 COMMENT '本年度累计实发工资',
  PRIMARY KEY (`faculty_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '教职工年度表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of faculty_yearly
-- ----------------------------
INSERT INTO `faculty_yearly` VALUES (1, '小马', 106740, 132, 5000, 98541.2);
INSERT INTO `faculty_yearly` VALUES (2, '小王', 83280, 78, 5000, 76581.6);
INSERT INTO `faculty_yearly` VALUES (3, '张三', 122280, 114, 5000, 112572);
INSERT INTO `faculty_yearly` VALUES (4, '李四', 65760, 0, 5000, 59587.2);
INSERT INTO `faculty_yearly` VALUES (5, '王五', 40200, 0, 5000, 34200);
INSERT INTO `faculty_yearly` VALUES (6, '小李', 0, 0, 5000, -6000);

-- ----------------------------
-- Table structure for job
-- ----------------------------
DROP TABLE IF EXISTS `job`;
CREATE TABLE `job`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `des` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '职务',
  `factor` float NOT NULL DEFAULT 1 COMMENT '职务系数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '职务表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of job
-- ----------------------------
INSERT INTO `job` VALUES (0, '无', 1);
INSERT INTO `job` VALUES (1, '校长', 2.4);
INSERT INTO `job` VALUES (2, '副校长', 2.2);
INSERT INTO `job` VALUES (3, '处长', 2);
INSERT INTO `job` VALUES (4, '副处长', 1.8);
INSERT INTO `job` VALUES (5, '科长', 1.6);
INSERT INTO `job` VALUES (6, '副科长', 1.4);
INSERT INTO `job` VALUES (7, '主管', 1.2);
INSERT INTO `job` VALUES (8, '职员', 1);

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '参数配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2023-05-28 07:54:27', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2023-05-28 07:54:27', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2023-05-28 07:54:27', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2023-05-28 07:54:27', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2023-05-28 07:54:27', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (6, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2023-05-28 07:54:27', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '部门表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 115 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '字典数据表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (100, 0, '教师', '0', 'faculty_type', NULL, 'default', 'N', '0', 'admin', '2023-05-27 17:51:49', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (101, 1, '职工', '1', 'faculty_type', NULL, 'default', 'N', '0', 'admin', '2023-05-27 17:51:55', 'admin', '2023-05-27 19:04:21', NULL);
INSERT INTO `sys_dict_data` VALUES (102, 0, '校长', '1', 'faculty_job', NULL, 'default', 'N', '0', 'admin', '2023-05-27 18:17:00', 'admin', '2023-05-27 18:19:29', NULL);
INSERT INTO `sys_dict_data` VALUES (103, 1, '副校长', '2', 'faculty_job', NULL, 'default', 'N', '0', 'admin', '2023-05-27 18:19:39', 'admin', '2023-05-27 19:04:36', NULL);
INSERT INTO `sys_dict_data` VALUES (104, 2, '处长', '3', 'faculty_job', NULL, 'default', 'N', '0', 'admin', '2023-05-27 18:20:14', 'admin', '2023-05-27 19:04:53', NULL);
INSERT INTO `sys_dict_data` VALUES (105, 3, '副处长', '4', 'faculty_job', NULL, 'default', 'N', '0', 'admin', '2023-05-27 18:20:22', 'admin', '2023-05-27 19:04:57', NULL);
INSERT INTO `sys_dict_data` VALUES (106, 4, '科长', '5', 'faculty_job', NULL, 'default', 'N', '0', 'admin', '2023-05-27 18:20:36', 'admin', '2023-05-27 19:05:08', NULL);
INSERT INTO `sys_dict_data` VALUES (107, 5, '副科长', '6', 'faculty_job', NULL, 'default', 'N', '0', 'admin', '2023-05-27 18:20:50', 'admin', '2023-05-27 19:05:16', NULL);
INSERT INTO `sys_dict_data` VALUES (108, 6, '主管', '7', 'faculty_job', NULL, 'default', 'N', '0', 'admin', '2023-05-27 18:22:22', 'admin', '2023-05-30 17:44:06', NULL);
INSERT INTO `sys_dict_data` VALUES (109, 7, '职员', '8', 'faculty_job', NULL, 'default', 'N', '0', 'admin', '2023-05-27 18:22:33', 'admin', '2023-05-30 17:44:02', NULL);
INSERT INTO `sys_dict_data` VALUES (110, 9, '无', '0', 'faculty_job', NULL, 'default', 'N', '0', 'admin', '2023-05-27 18:22:43', 'admin', '2023-05-30 17:44:15', NULL);
INSERT INTO `sys_dict_data` VALUES (111, 0, '教授', '1', 'faculty_title', NULL, 'default', 'N', '0', 'admin', '2023-05-27 18:59:11', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (112, 1, '副教授', '2', 'faculty_title', NULL, 'default', 'N', '0', 'admin', '2023-05-27 18:59:28', 'admin', '2023-05-27 19:05:55', NULL);
INSERT INTO `sys_dict_data` VALUES (113, 2, '讲师', '3', 'faculty_title', NULL, 'default', 'N', '0', 'admin', '2023-05-27 18:59:37', 'admin', '2023-05-27 19:06:04', NULL);
INSERT INTO `sys_dict_data` VALUES (114, 3, '助教', '4', 'faculty_title', NULL, 'default', 'N', '0', 'admin', '2023-05-27 18:59:45', 'admin', '2023-05-27 19:06:00', NULL);
INSERT INTO `sys_dict_data` VALUES (115, 4, '无', '0', 'faculty_title', NULL, 'default', 'N', '0', 'admin', '2023-05-27 18:59:54', 'admin', '2023-05-30 17:44:28', NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 102 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '字典类型表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (100, '教师/职工', 'faculty_type', '0', 'admin', '2023-05-27 15:39:15', 'admin', '2023-05-27 17:23:22', NULL);
INSERT INTO `sys_dict_type` VALUES (101, '职工职务', 'faculty_job', '0', 'admin', '2023-05-27 15:40:35', 'admin', '2023-05-30 17:43:25', NULL);
INSERT INTO `sys_dict_type` VALUES (102, '教师职称', 'faculty_title', '0', 'admin', '2023-05-27 15:41:26', 'admin', '2023-05-27 18:16:13', NULL);

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '定时任务调度表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job
-- ----------------------------

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '系统访问记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (1, '管理员', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-15 22:57:25');
INSERT INTO `sys_logininfor` VALUES (2, '管理员', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-07-01 10:02:14');
INSERT INTO `sys_logininfor` VALUES (3, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-07-01 12:18:00');
INSERT INTO `sys_logininfor` VALUES (4, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-07-01 13:35:44');
INSERT INTO `sys_logininfor` VALUES (5, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误1次', '2023-07-01 14:49:11');
INSERT INTO `sys_logininfor` VALUES (6, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-07-01 14:49:11');
INSERT INTO `sys_logininfor` VALUES (7, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-07-01 14:49:19');
INSERT INTO `sys_logininfor` VALUES (8, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误2次', '2023-07-01 14:49:19');
INSERT INTO `sys_logininfor` VALUES (9, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-07-01 14:49:28');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` int NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2196 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '菜单权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2023-05-28 07:54:27', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 1, 'monitor', NULL, '', 1, 0, 'M', '1', '0', '', 'monitor', 'admin', '2023-05-28 07:54:27', 'admin', '2023-05-28 12:00:53', '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 1, 'tool', NULL, '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2023-05-28 07:54:27', 'admin', '2023-05-28 12:01:09', '系统工具目录');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2023-05-28 07:54:27', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2023-05-28 07:54:27', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2023-05-28 07:54:27', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '1', '0', 'system:dept:list', 'tree', 'admin', '2023-05-28 07:54:27', 'admin', '2023-05-28 12:09:48', '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '1', '0', 'system:post:list', 'post', 'admin', '2023-05-28 07:54:27', 'admin', '2023-05-28 12:10:00', '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2023-05-28 07:54:27', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2023-05-28 07:54:27', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', 1, 0, 'C', '1', '0', 'system:notice:list', 'message', 'admin', '2023-05-28 07:54:27', 'admin', '2023-05-28 12:14:49', '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', 1, 0, 'M', '1', '0', '', 'log', 'admin', '2023-05-28 07:54:27', 'admin', '2023-05-28 12:14:25', '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2023-05-28 07:54:27', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2023-05-28 07:54:27', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2023-05-28 07:54:27', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2023-05-28 07:54:27', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2023-05-28 07:54:27', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2023-05-28 07:54:27', '', NULL, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES (115, '表单构建', 3, 1, 'build', 'tool/build/index', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2023-05-28 07:54:27', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2023-05-28 07:54:27', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2023-05-28 07:54:27', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2023-05-28 07:54:27', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2023-05-28 07:54:27', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2023-05-28 07:54:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2023-05-28 07:54:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2023-05-28 07:54:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2023-05-28 07:54:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2023-05-28 07:54:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2023-05-28 07:54:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2023-05-28 07:54:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2023-05-28 07:54:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2023-05-28 07:54:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2023-05-28 07:54:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2023-05-28 07:54:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2023-05-28 07:54:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2023-05-28 07:54:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2023-05-28 07:54:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2023-05-28 07:54:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2023-05-28 07:54:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2023-05-28 07:54:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2023-05-28 07:54:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2023-05-28 07:54:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2023-05-28 07:54:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2023-05-28 07:54:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2023-05-28 07:54:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2023-05-28 07:54:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2023-05-28 07:54:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2023-05-28 07:54:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2023-05-28 07:54:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2023-05-28 07:54:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2023-05-28 07:54:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2023-05-28 07:54:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2023-05-28 07:54:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2023-05-28 07:54:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2023-05-28 07:54:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2023-05-28 07:54:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2023-05-28 07:54:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2023-05-28 07:54:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2023-05-28 07:54:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2023-05-28 07:54:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2023-05-28 07:54:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2023-05-28 07:54:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2023-05-28 07:54:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2023-05-28 07:54:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2023-05-28 07:54:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2023-05-28 07:54:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2023-05-28 07:54:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2023-05-28 07:54:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2023-05-28 07:54:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2023-05-28 07:54:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2023-05-28 07:54:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2023-05-28 07:54:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2023-05-28 07:54:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2023-05-28 07:54:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2023-05-28 07:54:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2023-05-28 07:54:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2023-05-28 07:54:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2023-05-28 07:54:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 116, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2023-05-28 07:54:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 116, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2023-05-28 07:54:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 116, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2023-05-28 07:54:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 116, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2023-05-28 07:54:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 116, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2023-05-28 07:54:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 116, 6, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2023-05-28 07:54:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2052, '人事', 0, 3, 'personnel', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'peoples', 'admin', '2023-05-30 18:03:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2131, '教职工', 2052, 1, 'faculty', 'financial/faculty/index', NULL, 1, 0, 'C', '0', '0', 'financial:faculty:list', 'people', 'admin', '2023-05-30 21:52:11', 'admin', '2023-05-30 22:10:20', '教职工菜单');
INSERT INTO `sys_menu` VALUES (2132, '教职工查询', 2131, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'financial:faculty:query', '#', 'admin', '2023-05-30 21:52:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2133, '教职工新增', 2131, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'financial:faculty:add', '#', 'admin', '2023-05-30 21:52:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2134, '教职工修改', 2131, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'financial:faculty:edit', '#', 'admin', '2023-05-30 21:52:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2135, '教职工删除', 2131, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'financial:faculty:remove', '#', 'admin', '2023-05-30 21:52:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2136, '教职工导出', 2131, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'financial:faculty:export', '#', 'admin', '2023-05-30 21:52:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2137, '职称', 2052, 3, 'title', 'financial/title/index', NULL, 1, 0, 'C', '0', '0', 'financial:title:list', 'post', 'admin', '2023-05-30 21:52:29', 'admin', '2023-05-31 13:35:57', '职称菜单');
INSERT INTO `sys_menu` VALUES (2138, '职称查询', 2137, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'financial:title:query', '#', 'admin', '2023-05-30 21:52:29', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2139, '职称新增', 2137, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'financial:title:add', '#', 'admin', '2023-05-30 21:52:29', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2140, '职称修改', 2137, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'financial:title:edit', '#', 'admin', '2023-05-30 21:52:29', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2141, '职称删除', 2137, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'financial:title:remove', '#', 'admin', '2023-05-30 21:52:29', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2142, '职称导出', 2137, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'financial:title:export', '#', 'admin', '2023-05-30 21:52:29', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2143, '职务', 2052, 2, 'job', 'financial/job/index', NULL, 1, 0, 'C', '0', '0', 'financial:job:list', 'post', 'admin', '2023-05-30 21:52:42', 'admin', '2023-05-31 13:36:02', '职务菜单');
INSERT INTO `sys_menu` VALUES (2144, '职务查询', 2143, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'financial:job:query', '#', 'admin', '2023-05-30 21:52:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2145, '职务新增', 2143, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'financial:job:add', '#', 'admin', '2023-05-30 21:52:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2146, '职务修改', 2143, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'financial:job:edit', '#', 'admin', '2023-05-30 21:52:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2147, '职务删除', 2143, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'financial:job:remove', '#', 'admin', '2023-05-30 21:52:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2148, '职务导出', 2143, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'financial:job:export', '#', 'admin', '2023-05-30 21:52:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2149, '教职工年度', 0, 5, 'yearly', 'financial/yearly/index', NULL, 1, 1, 'C', '0', '0', 'financial:yearly:list', 'build', 'admin', '2023-05-30 21:52:54', 'admin', '2023-06-01 06:55:18', '教职工年度菜单');
INSERT INTO `sys_menu` VALUES (2150, '教职工年度查询', 2149, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'financial:yearly:query', '#', 'admin', '2023-05-30 21:52:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2151, '教职工年度新增', 2149, 2, '#', '', NULL, 1, 0, 'C', '1', '1', 'financial:yearly:add', '#', 'admin', '2023-05-30 21:52:54', 'admin', '2023-05-31 12:47:49', '');
INSERT INTO `sys_menu` VALUES (2152, '教职工年度修改', 2149, 3, '#', '', NULL, 1, 0, 'C', '1', '1', 'financial:yearly:edit', '#', 'admin', '2023-05-30 21:52:54', 'admin', '2023-05-31 12:58:31', '');
INSERT INTO `sys_menu` VALUES (2153, '教职工年度删除', 2149, 4, '#', '', NULL, 1, 0, 'C', '1', '1', 'financial:yearly:remove', '#', 'admin', '2023-05-30 21:52:54', 'admin', '2023-05-31 12:59:00', '');
INSERT INTO `sys_menu` VALUES (2154, '教职工年度导出', 2149, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'financial:yearly:export', '#', 'admin', '2023-05-30 21:52:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2155, '工资明细表', 0, 2, 'payDetail', 'financial/payDetail/index', NULL, 1, 1, 'C', '0', '0', 'financial:payDetail:list', 'money', 'admin', '2023-05-30 21:53:28', 'admin', '2023-06-01 06:55:01', '工资明细表菜单');
INSERT INTO `sys_menu` VALUES (2156, '工资明细表查询', 2155, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'financial:payDetail:query', '#', 'admin', '2023-05-30 21:53:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2157, '工资明细表新增', 2155, 2, '#', '', NULL, 1, 0, 'C', '1', '1', 'financial:payDetail:add', '#', 'admin', '2023-05-30 21:53:28', 'admin', '2023-05-30 22:51:22', '');
INSERT INTO `sys_menu` VALUES (2158, '工资明细表修改', 2155, 3, '#', '', NULL, 1, 0, 'C', '1', '1', 'financial:payDetail:edit', '#', 'admin', '2023-05-30 21:53:28', 'admin', '2023-05-30 22:49:18', '');
INSERT INTO `sys_menu` VALUES (2159, '工资明细表删除', 2155, 4, '#', '', NULL, 1, 0, 'C', '1', '1', 'financial:payDetail:remove', '#', 'admin', '2023-05-30 21:53:28', 'admin', '2023-05-30 22:49:04', '');
INSERT INTO `sys_menu` VALUES (2160, '工资明细表导出', 2155, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'financial:payDetail:export', '#', 'admin', '2023-05-30 21:53:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2161, '工资表', 0, 2, 'pay', 'financial/pay/index', NULL, 1, 1, 'C', '0', '0', 'financial:pay:list', 'money', 'admin', '2023-05-30 21:53:36', 'admin', '2023-06-01 06:55:06', '工资表菜单');
INSERT INTO `sys_menu` VALUES (2162, '工资表查询', 2161, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'financial:pay:query', '#', 'admin', '2023-05-30 21:53:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2163, '工资表新增', 2161, 2, '#', '', NULL, 1, 0, 'C', '1', '1', 'financial:pay:add', '#', 'admin', '2023-05-30 21:53:36', 'admin', '2023-05-30 22:51:47', '');
INSERT INTO `sys_menu` VALUES (2164, '工资表修改', 2161, 3, '#', '', NULL, 1, 0, 'C', '1', '1', 'financial:pay:edit', '#', 'admin', '2023-05-30 21:53:36', 'admin', '2023-05-30 22:51:55', '');
INSERT INTO `sys_menu` VALUES (2165, '工资表删除', 2161, 4, '#', '', NULL, 1, 0, 'C', '1', '1', 'financial:pay:remove', '#', 'admin', '2023-05-30 21:53:36', 'admin', '2023-05-30 22:52:02', '');
INSERT INTO `sys_menu` VALUES (2166, '工资表导出', 2161, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'financial:pay:export', '#', 'admin', '2023-05-30 21:53:36', 'admin', '2023-05-30 22:52:32', '');
INSERT INTO `sys_menu` VALUES (2173, '个人事务', 0, 4, 'affair', 'financial/affair/index', NULL, 1, 0, 'C', '0', '0', 'financial:affair:list', 'education', 'admin', '2023-05-30 23:07:37', 'admin', '2023-05-30 23:29:42', '个人事务菜单');
INSERT INTO `sys_menu` VALUES (2174, '个人事务查询', 2173, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'financial:affair:query', '#', 'admin', '2023-05-30 23:07:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2175, '个人事务新增', 2173, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'financial:affair:add', '#', 'admin', '2023-05-30 23:07:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2176, '个人事务修改', 2173, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'financial:affair:edit', '#', 'admin', '2023-05-30 23:07:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2177, '个人事务删除', 2173, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'financial:affair:remove', '#', 'admin', '2023-05-30 23:07:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2178, '个人事务导出', 2173, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'financial:affair:export', '#', 'admin', '2023-05-30 23:07:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2185, '事务', 0, 4, 'affairs', 'financial/affairs/index', NULL, 1, 1, 'C', '0', '0', 'financial:affairs:list', 'education', 'admin', '2023-05-30 23:21:00', 'admin', '2023-06-01 06:55:13', '事务菜单');
INSERT INTO `sys_menu` VALUES (2186, '事务查询', 2185, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'financial:affairs:query', '#', 'admin', '2023-05-30 23:21:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2187, '事务新增', 2185, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'financial:affairs:add', '#', 'admin', '2023-05-30 23:21:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2188, '事务修改', 2185, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'financial:affairs:edit', '#', 'admin', '2023-05-30 23:21:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2189, '事务删除', 2185, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'financial:affairs:remove', '#', 'admin', '2023-05-30 23:21:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2190, '事务导出', 2185, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'financial:affairs:export', '#', 'admin', '2023-05-30 23:21:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2191, '全部工资明细表', 0, 2, 'payDetails', 'financial/payDetails/index', NULL, 1, 0, 'C', '0', '0', 'financial:payDetails:list', 'money', 'admin', '2023-05-30 23:36:39', 'admin', '2023-05-30 23:39:16', '全部工资明细表菜单');
INSERT INTO `sys_menu` VALUES (2192, '全部工资明细表查询', 2191, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'financial:payDetails:query', '#', 'admin', '2023-05-30 23:36:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2193, '全部工资明细表新增', 2191, 2, '#', '', NULL, 1, 0, 'C', '1', '1', 'financial:payDetails:add', '#', 'admin', '2023-05-30 23:36:39', 'admin', '2023-05-31 08:01:49', '');
INSERT INTO `sys_menu` VALUES (2194, '全部工资明细表修改', 2191, 3, '#', '', NULL, 1, 0, 'C', '1', '1', 'financial:payDetails:edit', '#', 'admin', '2023-05-30 23:36:39', 'admin', '2023-05-31 08:01:58', '');
INSERT INTO `sys_menu` VALUES (2195, '全部工资明细表删除', 2191, 4, '#', '', NULL, 1, 0, 'C', '1', '1', 'financial:payDetails:remove', '#', 'admin', '2023-05-30 23:36:39', 'admin', '2023-05-31 08:02:05', '');
INSERT INTO `sys_menu` VALUES (2196, '全部工资明细表导出', 2191, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'financial:payDetails:export', '#', 'admin', '2023-05-30 23:36:39', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '通知公告表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '操作日志记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '岗位信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2023-05-28 07:54:27', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2023-05-28 07:54:27', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2023-05-28 07:54:27', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2023-05-28 07:54:27', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 104 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '角色信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2023-05-28 07:54:27', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2023-05-28 07:54:27', 'admin', '2023-05-28 12:01:26', '普通角色');
INSERT INTO `sys_role` VALUES (100, '会计', 'finance', 3, '1', 1, 1, '0', '0', 'admin', '2023-05-27 15:14:16', 'admin', '2023-05-31 08:04:01', NULL);
INSERT INTO `sys_role` VALUES (101, '教职工', 'faculty', 4, '1', 1, 1, '0', '0', 'admin', '2023-05-27 15:15:11', 'admin', '2023-05-31 08:04:12', NULL);
INSERT INTO `sys_role` VALUES (102, '管理员', 'root', 5, '1', 1, 1, '0', '0', 'admin', '2023-05-27 19:11:17', 'admin', '2023-05-31 08:03:42', NULL);
INSERT INTO `sys_role` VALUES (103, '银行', 'bank', 6, '1', 1, 1, '0', '0', 'admin', '2023-05-27 19:12:01', 'admin', '2023-05-31 08:02:31', NULL);
INSERT INTO `sys_role` VALUES (104, '人事', 'personnel', 7, '1', 1, 1, '0', '0', 'admin', '2023-05-31 08:01:12', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '角色和部门关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 117);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);
INSERT INTO `sys_role_menu` VALUES (100, 2161);
INSERT INTO `sys_role_menu` VALUES (100, 2162);
INSERT INTO `sys_role_menu` VALUES (100, 2163);
INSERT INTO `sys_role_menu` VALUES (100, 2164);
INSERT INTO `sys_role_menu` VALUES (100, 2165);
INSERT INTO `sys_role_menu` VALUES (100, 2166);
INSERT INTO `sys_role_menu` VALUES (101, 2155);
INSERT INTO `sys_role_menu` VALUES (101, 2156);
INSERT INTO `sys_role_menu` VALUES (101, 2157);
INSERT INTO `sys_role_menu` VALUES (101, 2158);
INSERT INTO `sys_role_menu` VALUES (101, 2159);
INSERT INTO `sys_role_menu` VALUES (101, 2160);
INSERT INTO `sys_role_menu` VALUES (101, 2173);
INSERT INTO `sys_role_menu` VALUES (101, 2174);
INSERT INTO `sys_role_menu` VALUES (101, 2175);
INSERT INTO `sys_role_menu` VALUES (101, 2176);
INSERT INTO `sys_role_menu` VALUES (101, 2177);
INSERT INTO `sys_role_menu` VALUES (101, 2178);
INSERT INTO `sys_role_menu` VALUES (102, 2052);
INSERT INTO `sys_role_menu` VALUES (102, 2131);
INSERT INTO `sys_role_menu` VALUES (102, 2132);
INSERT INTO `sys_role_menu` VALUES (102, 2133);
INSERT INTO `sys_role_menu` VALUES (102, 2134);
INSERT INTO `sys_role_menu` VALUES (102, 2135);
INSERT INTO `sys_role_menu` VALUES (102, 2136);
INSERT INTO `sys_role_menu` VALUES (102, 2137);
INSERT INTO `sys_role_menu` VALUES (102, 2138);
INSERT INTO `sys_role_menu` VALUES (102, 2139);
INSERT INTO `sys_role_menu` VALUES (102, 2140);
INSERT INTO `sys_role_menu` VALUES (102, 2141);
INSERT INTO `sys_role_menu` VALUES (102, 2142);
INSERT INTO `sys_role_menu` VALUES (102, 2143);
INSERT INTO `sys_role_menu` VALUES (102, 2144);
INSERT INTO `sys_role_menu` VALUES (102, 2145);
INSERT INTO `sys_role_menu` VALUES (102, 2146);
INSERT INTO `sys_role_menu` VALUES (102, 2147);
INSERT INTO `sys_role_menu` VALUES (102, 2148);
INSERT INTO `sys_role_menu` VALUES (102, 2149);
INSERT INTO `sys_role_menu` VALUES (102, 2150);
INSERT INTO `sys_role_menu` VALUES (102, 2151);
INSERT INTO `sys_role_menu` VALUES (102, 2152);
INSERT INTO `sys_role_menu` VALUES (102, 2153);
INSERT INTO `sys_role_menu` VALUES (102, 2154);
INSERT INTO `sys_role_menu` VALUES (102, 2161);
INSERT INTO `sys_role_menu` VALUES (102, 2162);
INSERT INTO `sys_role_menu` VALUES (102, 2163);
INSERT INTO `sys_role_menu` VALUES (102, 2164);
INSERT INTO `sys_role_menu` VALUES (102, 2165);
INSERT INTO `sys_role_menu` VALUES (102, 2166);
INSERT INTO `sys_role_menu` VALUES (102, 2185);
INSERT INTO `sys_role_menu` VALUES (102, 2186);
INSERT INTO `sys_role_menu` VALUES (102, 2187);
INSERT INTO `sys_role_menu` VALUES (102, 2188);
INSERT INTO `sys_role_menu` VALUES (102, 2189);
INSERT INTO `sys_role_menu` VALUES (102, 2190);
INSERT INTO `sys_role_menu` VALUES (102, 2191);
INSERT INTO `sys_role_menu` VALUES (102, 2192);
INSERT INTO `sys_role_menu` VALUES (102, 2193);
INSERT INTO `sys_role_menu` VALUES (102, 2194);
INSERT INTO `sys_role_menu` VALUES (102, 2195);
INSERT INTO `sys_role_menu` VALUES (102, 2196);
INSERT INTO `sys_role_menu` VALUES (103, 2161);
INSERT INTO `sys_role_menu` VALUES (103, 2162);
INSERT INTO `sys_role_menu` VALUES (103, 2163);
INSERT INTO `sys_role_menu` VALUES (103, 2164);
INSERT INTO `sys_role_menu` VALUES (103, 2165);
INSERT INTO `sys_role_menu` VALUES (103, 2166);
INSERT INTO `sys_role_menu` VALUES (104, 2052);
INSERT INTO `sys_role_menu` VALUES (104, 2131);
INSERT INTO `sys_role_menu` VALUES (104, 2132);
INSERT INTO `sys_role_menu` VALUES (104, 2133);
INSERT INTO `sys_role_menu` VALUES (104, 2134);
INSERT INTO `sys_role_menu` VALUES (104, 2135);
INSERT INTO `sys_role_menu` VALUES (104, 2136);
INSERT INTO `sys_role_menu` VALUES (104, 2137);
INSERT INTO `sys_role_menu` VALUES (104, 2138);
INSERT INTO `sys_role_menu` VALUES (104, 2139);
INSERT INTO `sys_role_menu` VALUES (104, 2140);
INSERT INTO `sys_role_menu` VALUES (104, 2141);
INSERT INTO `sys_role_menu` VALUES (104, 2142);
INSERT INTO `sys_role_menu` VALUES (104, 2143);
INSERT INTO `sys_role_menu` VALUES (104, 2144);
INSERT INTO `sys_role_menu` VALUES (104, 2145);
INSERT INTO `sys_role_menu` VALUES (104, 2146);
INSERT INTO `sys_role_menu` VALUES (104, 2147);
INSERT INTO `sys_role_menu` VALUES (104, 2148);
INSERT INTO `sys_role_menu` VALUES (104, 2185);
INSERT INTO `sys_role_menu` VALUES (104, 2186);
INSERT INTO `sys_role_menu` VALUES (104, 2187);
INSERT INTO `sys_role_menu` VALUES (104, 2188);
INSERT INTO `sys_role_menu` VALUES (104, 2189);
INSERT INTO `sys_role_menu` VALUES (104, 2190);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `faculty_id` bigint NULL DEFAULT NULL COMMENT '教职工编号',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 109 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, NULL, 103, 'admin', 'admin', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$qbEWfxyIvSnrF.al7Iv3BujH5.FbbGXgRIqOVuFI3NrRlrzDHFjiW', '0', '0', '127.0.0.1', '2023-07-01 14:49:29', 'admin', '2023-05-28 07:54:27', '', '2023-07-01 14:49:28', '管理员');
INSERT INTO `sys_user` VALUES (100, NULL, NULL, '会计', '会计', '00', '', '', '0', '', '$2a$10$GIAJySInsBxv1mmg9FwDeOzmn.oVTnCGvngbwy0Uye2MJYj2hJsuK', '0', '0', '127.0.0.1', '2023-05-31 08:08:36', 'admin', '2023-05-27 15:16:18', '', '2023-05-31 08:08:35', NULL);
INSERT INTO `sys_user` VALUES (101, 3, NULL, '张三', '张三', '00', '', '', '0', '', '$2a$10$IDvnC7OcqO2h/cIiuyBvwe0iu8VoLH.sL.1htCChn9zdQ3NGhweJe', '0', '0', '127.0.0.1', '2023-06-01 13:16:15', 'admin', '2023-05-27 15:16:43', '', '2023-06-01 13:16:15', NULL);
INSERT INTO `sys_user` VALUES (102, NULL, NULL, '管理员', '管理员', '00', '', '', '0', '', '$2a$10$3qU6MrBmHx1DOD2vGym.cOpsKkuoom/giTLbAenY4BmmE0a2Izc1y', '0', '0', '127.0.0.1', '2023-07-01 10:02:15', 'admin', '2023-05-27 19:22:32', '', '2023-07-01 10:02:14', NULL);
INSERT INTO `sys_user` VALUES (103, NULL, NULL, '银行', '银行', '00', '', '', '0', '', '$2a$10$2.kU9IFrlDDZvxf63yUQEuPTZGeZcsrn99oR0Kf97IzoTS2MloovG', '0', '0', '127.0.0.1', '2023-05-31 08:09:11', 'admin', '2023-05-27 19:23:11', '', '2023-05-31 08:09:11', NULL);
INSERT INTO `sys_user` VALUES (104, 4, NULL, '李四', '李四', '00', '', '', '0', '', '$2a$10$sznQVulcqjy97edpdmzpDuwUfY1aWSHBnv/HI8Hg7L1dY5uVi1w2u', '0', '0', '127.0.0.1', '2023-05-29 13:09:01', 'admin', '2023-05-28 15:15:59', '', '2023-05-29 13:09:01', NULL);
INSERT INTO `sys_user` VALUES (105, 5, NULL, '王五', '王五', '00', '', '', '0', '', '$2a$10$dp312W9GwZDhNFqdmvTkY.gkOtzoo0/sI9eTZ6h5hNNLKqPFaTNa.', '0', '0', '127.0.0.1', '2023-05-29 08:44:08', 'admin', '2023-05-28 15:27:55', '', '2023-05-29 08:44:08', NULL);
INSERT INTO `sys_user` VALUES (106, NULL, NULL, '人事', '人事', '00', '', '', '0', '', '$2a$10$qwhdew0GztrMG.BAtRWgD.6SjXDUGVtaEY0oiFKD6Kz..3iM2Ipce', '0', '0', '127.0.0.1', '2023-05-31 08:09:28', 'admin', '2023-05-31 08:05:25', '', '2023-05-31 08:09:28', NULL);
INSERT INTO `sys_user` VALUES (108, 1, NULL, '小马', '小马', '00', '', '', '0', '', '$2a$10$RNjfG3FgrWwLi4opoF8NDuzhPh/dFizBzUWa5QiOIApBbftclQJ1.', '0', '0', '127.0.0.1', '2023-06-01 15:49:12', 'admin', '2023-06-01 12:18:47', '', '2023-06-01 15:49:11', NULL);
INSERT INTO `sys_user` VALUES (109, 2, NULL, '小王', '小王', '00', '', '', '0', '', '$2a$10$RL2InKEr7uUFRayCug0Z.u/eUBftagUEU6d02wFcipPzKiH9EnNXW', '0', '0', '', NULL, 'admin', '2023-06-01 13:33:29', 'admin', '2023-06-01 13:33:39', NULL);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户和角色关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);
INSERT INTO `sys_user_role` VALUES (100, 100);
INSERT INTO `sys_user_role` VALUES (101, 101);
INSERT INTO `sys_user_role` VALUES (102, 102);
INSERT INTO `sys_user_role` VALUES (103, 103);
INSERT INTO `sys_user_role` VALUES (104, 101);
INSERT INTO `sys_user_role` VALUES (105, 101);
INSERT INTO `sys_user_role` VALUES (106, 104);
INSERT INTO `sys_user_role` VALUES (107, 101);
INSERT INTO `sys_user_role` VALUES (108, 101);
INSERT INTO `sys_user_role` VALUES (109, 101);

-- ----------------------------
-- Table structure for title
-- ----------------------------
DROP TABLE IF EXISTS `title`;
CREATE TABLE `title`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `des` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '职称',
  `factor` float NOT NULL DEFAULT 1 COMMENT '职称系数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '职称表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of title
-- ----------------------------
INSERT INTO `title` VALUES (0, '无', 1);
INSERT INTO `title` VALUES (1, '教授', 2);
INSERT INTO `title` VALUES (2, '副教授', 1.7);
INSERT INTO `title` VALUES (3, '讲师', 1.5);
INSERT INTO `title` VALUES (4, '助教', 1.2);

SET FOREIGN_KEY_CHECKS = 1;
