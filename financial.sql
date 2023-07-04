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

 Date: 03/07/2023 07:46:56
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
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '事务（课时任务）表' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '教职工表' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '职务表' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 2197 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '菜单权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
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
) ENGINE = InnoDB AUTO_INCREMENT = 105 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '角色信息表' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 110 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, NULL, 103, 'admin', 'admin', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$qbEWfxyIvSnrF.al7Iv3BujH5.FbbGXgRIqOVuFI3NrRlrzDHFjiW', '0', '0', '127.0.0.1', '2023-06-01 14:34:38', 'admin', '2023-05-28 07:54:27', '', '2023-06-01 14:34:37', '管理员');
INSERT INTO `sys_user` VALUES (100, NULL, NULL, '会计', '会计', '00', '', '', '0', '', '$2a$10$GIAJySInsBxv1mmg9FwDeOzmn.oVTnCGvngbwy0Uye2MJYj2hJsuK', '0', '0', '127.0.0.1', '2023-05-31 08:08:36', 'admin', '2023-05-27 15:16:18', '', '2023-05-31 08:08:35', NULL);
INSERT INTO `sys_user` VALUES (101, 3, NULL, '张三', '张三', '00', '', '', '0', '', '$2a$10$IDvnC7OcqO2h/cIiuyBvwe0iu8VoLH.sL.1htCChn9zdQ3NGhweJe', '0', '0', '127.0.0.1', '2023-06-01 13:16:15', 'admin', '2023-05-27 15:16:43', '', '2023-06-01 13:16:15', NULL);
INSERT INTO `sys_user` VALUES (102, NULL, NULL, '管理员', '管理员', '00', '', '', '0', '', '$2a$10$3qU6MrBmHx1DOD2vGym.cOpsKkuoom/giTLbAenY4BmmE0a2Izc1y', '0', '0', '127.0.0.1', '2023-07-03 07:46:18', 'admin', '2023-05-27 19:22:32', '', '2023-07-03 07:46:18', NULL);
INSERT INTO `sys_user` VALUES (103, NULL, NULL, '银行', '银行', '00', '', '', '0', '', '$2a$10$2.kU9IFrlDDZvxf63yUQEuPTZGeZcsrn99oR0Kf97IzoTS2MloovG', '0', '0', '127.0.0.1', '2023-05-31 08:09:11', 'admin', '2023-05-27 19:23:11', '', '2023-05-31 08:09:11', NULL);
INSERT INTO `sys_user` VALUES (104, 4, NULL, '李四', '李四', '00', '', '', '0', '', '$2a$10$sznQVulcqjy97edpdmzpDuwUfY1aWSHBnv/HI8Hg7L1dY5uVi1w2u', '0', '0', '127.0.0.1', '2023-05-29 13:09:01', 'admin', '2023-05-28 15:15:59', '', '2023-05-29 13:09:01', NULL);
INSERT INTO `sys_user` VALUES (105, 5, NULL, '王五', '王五', '00', '', '', '0', '', '$2a$10$dp312W9GwZDhNFqdmvTkY.gkOtzoo0/sI9eTZ6h5hNNLKqPFaTNa.', '0', '0', '127.0.0.1', '2023-05-29 08:44:08', 'admin', '2023-05-28 15:27:55', '', '2023-05-29 08:44:08', NULL);
INSERT INTO `sys_user` VALUES (106, NULL, NULL, '人事', '人事', '00', '', '', '0', '', '$2a$10$qwhdew0GztrMG.BAtRWgD.6SjXDUGVtaEY0oiFKD6Kz..3iM2Ipce', '0', '0', '127.0.0.1', '2023-05-31 08:09:28', 'admin', '2023-05-31 08:05:25', '', '2023-05-31 08:09:28', NULL);
INSERT INTO `sys_user` VALUES (108, 1, NULL, '小马', '小马', '00', '', '', '0', '', '$2a$10$RNjfG3FgrWwLi4opoF8NDuzhPh/dFizBzUWa5QiOIApBbftclQJ1.', '0', '0', '127.0.0.1', '2023-06-01 15:49:12', 'admin', '2023-06-01 12:18:47', '', '2023-06-01 15:49:11', NULL);
INSERT INTO `sys_user` VALUES (109, 2, NULL, '小王', '小王', '00', '', '', '0', '', '$2a$10$RL2InKEr7uUFRayCug0Z.u/eUBftagUEU6d02wFcipPzKiH9EnNXW', '0', '0', '', NULL, 'admin', '2023-06-01 13:33:29', 'admin', '2023-06-01 13:33:39', NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '职称表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of title
-- ----------------------------
INSERT INTO `title` VALUES (0, '无', 1);
INSERT INTO `title` VALUES (1, '教授', 2);
INSERT INTO `title` VALUES (2, '副教授', 1.7);
INSERT INTO `title` VALUES (3, '讲师', 1.5);
INSERT INTO `title` VALUES (4, '助教', 1.2);

SET FOREIGN_KEY_CHECKS = 1;
