/*
 Navicat MySQL Data Transfer

 Source Server         : su
 Source Server Type    : MySQL
 Source Server Version : 80019
 Source Host           : localhost:3306
 Source Schema         : applettea

 Target Server Type    : MySQL
 Target Server Version : 80019
 File Encoding         : 65001

 Date: 09/05/2024 10:34:08
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作 sub主子表操作）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (1, 'lb_home_carousel', '首页轮播表', '', NULL, 'LbHomeCarousel', 'crud', 'com.tea.web', 'web', 'carousel', '首页轮播', 'suxuehao', '0', '/', '{\"parentMenuId\":\"2000\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"基本配置\",\"treeCode\":\"\"}', 'admin', '2024-04-13 22:42:23', '', '2024-04-13 23:32:30', '');
INSERT INTO `gen_table` VALUES (2, 'sys_attachment', '文件附件表', '', NULL, 'SysAttachment', 'crud', 'com.tea.web', 'web', 'attachment', '文件附件', 'suxuehao', '0', '/', '{\"parentMenuId\":\"\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"\",\"treeCode\":\"\"}', 'admin', '2024-04-14 16:01:38', '', '2024-04-14 16:03:25', '');

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (1, 1, 'lb_id', '主键id', 'int', 'Long', 'lbId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-04-13 22:42:23', NULL, '2024-04-13 23:32:30');
INSERT INTO `gen_table_column` VALUES (2, 1, 'lb_picture_name', '首页轮播图名称', 'varchar(255)', 'String', 'lbPictureName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2024-04-13 22:42:23', NULL, '2024-04-13 23:32:30');
INSERT INTO `gen_table_column` VALUES (3, 1, 'lb_file_id', '附件ID', 'varchar(255)', 'String', 'lbFileId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-04-13 22:42:23', NULL, '2024-04-13 23:32:30');
INSERT INTO `gen_table_column` VALUES (4, 1, 'lb_create_time', '创建时间', 'datetime', 'Date', 'lbCreateTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 4, 'admin', '2024-04-13 22:42:23', NULL, '2024-04-13 23:32:30');
INSERT INTO `gen_table_column` VALUES (5, 1, 'lb_is_use', '是否可用（1：是，0否）', 'char(10)', 'String', 'lbIsUse', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2024-04-13 22:42:23', NULL, '2024-04-13 23:32:30');
INSERT INTO `gen_table_column` VALUES (6, 2, 'id', '主键id', 'bigint', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-04-14 16:01:38', NULL, '2024-04-14 16:03:25');
INSERT INTO `gen_table_column` VALUES (7, 2, 'file_id', '文件加密UUID', 'varchar(255)', 'String', 'fileId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-04-14 16:01:38', NULL, '2024-04-14 16:03:25');
INSERT INTO `gen_table_column` VALUES (8, 2, 'file_name', '文件名称', 'varchar(255)', 'String', 'fileName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2024-04-14 16:01:38', NULL, '2024-04-14 16:03:25');
INSERT INTO `gen_table_column` VALUES (9, 2, 'file_path', '文件路径', 'varchar(255)', 'String', 'filePath', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2024-04-14 16:01:38', NULL, '2024-04-14 16:03:25');
INSERT INTO `gen_table_column` VALUES (10, 2, 'file_size', '文件大小', 'bigint', 'Long', 'fileSize', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2024-04-14 16:01:38', NULL, '2024-04-14 16:03:25');
INSERT INTO `gen_table_column` VALUES (11, 2, 'file_ext', '文件扩展名', 'varchar(50)', 'String', 'fileExt', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2024-04-14 16:01:38', NULL, '2024-04-14 16:03:25');
INSERT INTO `gen_table_column` VALUES (12, 2, 'upload_time', '上传时间', 'datetime', 'Date', 'uploadTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 7, 'admin', '2024-04-14 16:01:38', NULL, '2024-04-14 16:03:25');
INSERT INTO `gen_table_column` VALUES (13, 2, 'sys_type', '文件上传类型（1：系统上传，2：接口上传，3：其他）', 'varchar(10)', 'String', 'sysType', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 8, 'admin', '2024-04-14 16:01:38', NULL, '2024-04-14 16:03:25');
INSERT INTO `gen_table_column` VALUES (14, 2, 'state', '文件状态（1：有效，0：无效）', 'char(1)', 'String', 'state', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 9, 'admin', '2024-04-14 16:01:38', NULL, '2024-04-14 16:03:25');

-- ----------------------------
-- Table structure for lb_home_carousel
-- ----------------------------
DROP TABLE IF EXISTS `lb_home_carousel`;
CREATE TABLE `lb_home_carousel`  (
  `lb_id` int NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `lb_picture_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '首页轮播图名称',
  `lb_file_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '附件ID',
  `lb_create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `lb_is_use` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否可用（1：是，0否）',
  PRIMARY KEY (`lb_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '首页轮播表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lb_home_carousel
-- ----------------------------
INSERT INTO `lb_home_carousel` VALUES (36, '轮播1', '6831ee95-64c5-40e9-804b-7eebe8a4842f', '2024-04-15 00:00:00', '1');
INSERT INTO `lb_home_carousel` VALUES (37, '轮播2', 'ed1a8478-bf3f-4d0c-ac96-b70d6abe32c6', '2024-04-15 00:00:00', '1');

-- ----------------------------
-- Table structure for sys_attachment
-- ----------------------------
DROP TABLE IF EXISTS `sys_attachment`;
CREATE TABLE `sys_attachment`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `file_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '文件加密UUID',
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文件名称',
  `file_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文件路径',
  `file_size` bigint NULL DEFAULT NULL COMMENT '文件大小',
  `file_ext` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文件扩展名',
  `upload_time` datetime NULL DEFAULT NULL COMMENT '上传时间',
  `sys_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文件上传类型（1：系统上传，2：接口上传，3：其他）',
  `state` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文件状态（1：有效，0：无效）',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `文件唯一索引`(`file_id`) USING BTREE COMMENT '使用范围索引增强查找速度'
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '文件附件表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_attachment
-- ----------------------------
INSERT INTO `sys_attachment` VALUES (35, '6831ee95-64c5-40e9-804b-7eebe8a4842f', 'fl_20240415105503A001.jpg', '/profile/upload/2024/04/15/fl_20240415105503A001.jpg', 27221, 'jpg', '2024-04-15 10:55:03', '1', '1');
INSERT INTO `sys_attachment` VALUES (36, 'ed1a8478-bf3f-4d0c-ac96-b70d6abe32c6', '10002_20240415112907A001.jpg', '/profile/upload/2024/04/15/10002_20240415112907A001.jpg', 55084, 'jpg', '2024-04-15 11:29:08', '1', '1');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-yellow', 'Y', 'admin', '2024-04-13 14:27:32', 'admin', '2024-04-13 20:33:47', '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2024-04-13 14:27:32', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-light', 'Y', 'admin', '2024-04-13 14:27:32', 'admin', '2024-04-13 20:34:00', '深黑主题theme-dark，浅色主题theme-light，深蓝主题theme-blue');
INSERT INTO `sys_config` VALUES (4, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'true', 'Y', 'admin', '2024-04-13 14:27:32', 'admin', '2024-04-13 20:34:26', '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '用户管理-密码字符范围', 'sys.account.chrtype', '0', 'Y', 'admin', '2024-04-13 14:27:32', '', NULL, '默认任意字符范围，0任意（密码可以输入任意字符），1数字（密码只能为0-9数字），2英文字母（密码只能为a-z和A-Z字母），3字母和数字（密码必须包含字母，数字）,4字母数字和特殊字符（目前支持的特殊字符包括：~!@#$%^&*()-=_+）');
INSERT INTO `sys_config` VALUES (6, '用户管理-初始密码修改策略', 'sys.account.initPasswordModify', '1', 'Y', 'admin', '2024-04-13 14:27:32', '', NULL, '0：初始密码修改策略关闭，没有任何提示，1：提醒用户，如果未修改初始密码，则在登录时就会提醒修改密码对话框');
INSERT INTO `sys_config` VALUES (7, '用户管理-账号密码更新周期', 'sys.account.passwordValidateDays', '0', 'Y', 'admin', '2024-04-13 14:27:32', '', NULL, '密码更新周期（填写数字，数据初始化值为0不限制，若修改必须为大于0小于365的正整数），如果超过这个周期登录系统时，则在登录时就会提醒修改密码对话框');
INSERT INTO `sys_config` VALUES (8, '主框架页-菜单导航显示风格', 'sys.index.menuStyle', 'default', 'Y', 'admin', '2024-04-13 14:27:32', '', NULL, '菜单导航显示风格（default为左侧导航菜单，topnav为顶部导航菜单）');
INSERT INTO `sys_config` VALUES (9, '主框架页-是否开启页脚', 'sys.index.footer', 'true', 'Y', 'admin', '2024-04-13 14:27:32', '', NULL, '是否开启底部页脚显示（true显示，false隐藏）');
INSERT INTO `sys_config` VALUES (10, '主框架页-是否开启页签', 'sys.index.tagsView', 'true', 'Y', 'admin', '2024-04-13 14:27:32', '', NULL, '是否开启菜单多页签显示（true显示，false隐藏）');
INSERT INTO `sys_config` VALUES (11, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2024-04-13 14:27:32', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 109 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '云茶盟集团', 0, '苏学豪', '15888888888', 'sxh@qq.com', '0', '0', 'admin', '2024-04-13 14:27:31', 'admin', '2024-04-13 19:11:07');
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '上海总公司', 1, '苏学豪', '15888888888', 'sxh@qq.com', '0', '0', 'admin', '2024-04-13 14:27:31', 'admin', '2024-04-13 19:11:33');
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '武汉分公司', 2, '李四', '15888888888', 'ls@qq.com', '0', '0', 'admin', '2024-04-13 14:27:31', 'admin', '2024-04-13 19:12:31');
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-04-13 14:27:31', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-04-13 14:27:31', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '营销部门', 3, '张三', '15888888888', 'zs@qq.com', '0', '0', 'admin', '2024-04-13 14:27:31', 'admin', '2024-04-13 19:12:04');
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-04-13 14:27:31', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2024-04-13 14:27:31', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-04-13 14:27:31', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-04-13 14:27:31', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2024-04-13 14:27:32', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-04-13 14:27:32', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-04-13 14:27:32', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2024-04-13 14:27:32', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2024-04-13 14:27:32', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2024-04-13 14:27:32', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2024-04-13 14:27:32', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2024-04-13 14:27:32', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2024-04-13 14:27:32', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2024-04-13 14:27:32', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2024-04-13 14:27:32', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2024-04-13 14:27:32', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2024-04-13 14:27:32', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2024-04-13 14:27:32', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2024-04-13 14:27:32', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2024-04-13 14:27:32', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2024-04-13 14:27:32', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-04-13 14:27:32', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-04-13 14:27:32', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-04-13 14:27:32', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-04-13 14:27:32', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2024-04-13 14:27:32', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-04-13 14:27:32', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-04-13 14:27:32', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-04-13 14:27:32', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-04-13 14:27:32', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-04-13 14:27:32', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2024-04-13 14:27:32', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2024-04-13 14:27:32', '', NULL, '停用状态');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2024-04-13 14:27:32', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2024-04-13 14:27:32', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2024-04-13 14:27:32', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2024-04-13 14:27:32', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2024-04-13 14:27:32', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2024-04-13 14:27:32', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2024-04-13 14:27:32', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2024-04-13 14:27:32', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2024-04-13 14:27:32', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2024-04-13 14:27:32', '', NULL, '登录状态列表');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2024-04-13 14:27:32', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2024-04-13 14:27:32', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2024-04-13 14:27:32', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `login_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status`) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 195 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-13 16:43:44');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '密码输入错误1次', '2024-04-13 18:58:21');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-13 18:58:29');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-13 19:02:14');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '密码输入错误1次', '2024-04-13 19:02:17');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-13 19:02:23');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-13 19:33:59');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-13 19:34:10');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-13 20:05:26');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-13 20:11:22');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-13 20:15:49');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-13 20:30:39');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-13 20:30:59');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-13 20:31:10');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-13 20:34:27');
INSERT INTO `sys_logininfor` VALUES (115, 'zs', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '注册成功', '2024-04-13 20:35:02');
INSERT INTO `sys_logininfor` VALUES (116, 'zs', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-13 20:35:11');
INSERT INTO `sys_logininfor` VALUES (117, 'zs', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-13 20:35:17');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-13 20:35:27');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-13 20:37:40');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '密码输入错误1次', '2024-04-13 21:01:47');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-13 21:01:53');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-13 21:10:33');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '密码输入错误1次', '2024-04-13 21:10:39');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-13 21:10:46');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-13 21:11:40');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-13 21:12:19');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-13 21:54:04');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-13 22:41:56');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-04-13 23:05:24');
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-13 23:05:25');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-13 23:10:26');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-13 23:22:41');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-13 23:37:03');
INSERT INTO `sys_logininfor` VALUES (134, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-13 23:44:31');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-13 23:47:53');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-14 00:12:33');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-04-14 00:14:41');
INSERT INTO `sys_logininfor` VALUES (138, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-14 00:14:43');
INSERT INTO `sys_logininfor` VALUES (139, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-14 00:17:51');
INSERT INTO `sys_logininfor` VALUES (140, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-14 00:21:33');
INSERT INTO `sys_logininfor` VALUES (141, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-14 15:13:10');
INSERT INTO `sys_logininfor` VALUES (142, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-04-14 16:01:18');
INSERT INTO `sys_logininfor` VALUES (143, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-14 16:01:24');
INSERT INTO `sys_logininfor` VALUES (144, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-14 16:29:47');
INSERT INTO `sys_logininfor` VALUES (145, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-14 17:13:12');
INSERT INTO `sys_logininfor` VALUES (146, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-14 17:22:35');
INSERT INTO `sys_logininfor` VALUES (147, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-14 17:36:37');
INSERT INTO `sys_logininfor` VALUES (148, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-14 17:45:32');
INSERT INTO `sys_logininfor` VALUES (149, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-14 18:03:18');
INSERT INTO `sys_logininfor` VALUES (150, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-15 10:32:09');
INSERT INTO `sys_logininfor` VALUES (151, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-15 10:36:43');
INSERT INTO `sys_logininfor` VALUES (152, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-15 10:51:50');
INSERT INTO `sys_logininfor` VALUES (153, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-15 10:54:52');
INSERT INTO `sys_logininfor` VALUES (154, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-15 11:28:29');
INSERT INTO `sys_logininfor` VALUES (155, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-04-15 13:46:33');
INSERT INTO `sys_logininfor` VALUES (156, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-15 13:46:35');
INSERT INTO `sys_logininfor` VALUES (157, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-15 15:39:17');
INSERT INTO `sys_logininfor` VALUES (158, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-15 17:35:00');
INSERT INTO `sys_logininfor` VALUES (159, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-18 14:39:28');
INSERT INTO `sys_logininfor` VALUES (160, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-18 15:10:56');
INSERT INTO `sys_logininfor` VALUES (161, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-19 13:47:16');
INSERT INTO `sys_logininfor` VALUES (162, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-19 16:26:12');
INSERT INTO `sys_logininfor` VALUES (163, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-19 16:28:47');
INSERT INTO `sys_logininfor` VALUES (164, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-22 15:20:24');
INSERT INTO `sys_logininfor` VALUES (165, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-23 14:38:46');
INSERT INTO `sys_logininfor` VALUES (166, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-23 15:48:18');
INSERT INTO `sys_logininfor` VALUES (167, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-23 15:49:04');
INSERT INTO `sys_logininfor` VALUES (168, 'test', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '注册成功', '2024-04-23 15:49:18');
INSERT INTO `sys_logininfor` VALUES (169, 'test', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-23 15:49:26');
INSERT INTO `sys_logininfor` VALUES (170, 'test', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-23 15:49:36');
INSERT INTO `sys_logininfor` VALUES (171, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-23 15:49:39');
INSERT INTO `sys_logininfor` VALUES (172, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-24 16:29:51');
INSERT INTO `sys_logininfor` VALUES (173, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-24 16:29:54');
INSERT INTO `sys_logininfor` VALUES (174, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-24 16:30:31');
INSERT INTO `sys_logininfor` VALUES (175, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-24 16:30:33');
INSERT INTO `sys_logininfor` VALUES (176, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-24 16:30:56');
INSERT INTO `sys_logininfor` VALUES (177, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-24 16:30:58');
INSERT INTO `sys_logininfor` VALUES (178, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-24 16:31:13');
INSERT INTO `sys_logininfor` VALUES (179, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-24 16:31:16');
INSERT INTO `sys_logininfor` VALUES (180, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-24 16:39:08');
INSERT INTO `sys_logininfor` VALUES (181, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-24 16:39:10');
INSERT INTO `sys_logininfor` VALUES (182, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-24 16:58:38');
INSERT INTO `sys_logininfor` VALUES (183, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-04-24 16:58:39');
INSERT INTO `sys_logininfor` VALUES (184, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-24 16:58:59');
INSERT INTO `sys_logininfor` VALUES (185, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-29 17:29:06');
INSERT INTO `sys_logininfor` VALUES (186, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-30 13:41:57');
INSERT INTO `sys_logininfor` VALUES (187, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-04-30 16:12:21');
INSERT INTO `sys_logininfor` VALUES (188, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-07 15:14:54');
INSERT INTO `sys_logininfor` VALUES (189, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-07 15:18:09');
INSERT INTO `sys_logininfor` VALUES (190, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-07 15:22:40');
INSERT INTO `sys_logininfor` VALUES (191, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-07 15:25:05');
INSERT INTO `sys_logininfor` VALUES (192, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-07 15:26:18');
INSERT INTO `sys_logininfor` VALUES (193, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-07 15:30:23');
INSERT INTO `sys_logininfor` VALUES (194, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-07 15:32:11');
INSERT INTO `sys_logininfor` VALUES (195, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-05-07 16:02:29');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '#' COMMENT '请求地址',
  `target` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '打开方式（menuItem页签 menuBlank新窗口）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `is_refresh` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '是否刷新（0刷新 1不刷新）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2001 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 101, '#', 'menuItem', 'M', '0', '1', '', 'fa fa-gear', 'admin', '2024-04-13 14:27:31', 'admin', '2024-04-13 23:31:42', '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 102, '#', 'menuItem', 'M', '0', '1', '', 'fa fa-video-camera', 'admin', '2024-04-13 14:27:31', 'admin', '2024-04-13 23:31:47', '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 103, '#', 'menuItem', 'M', '0', '1', '', 'fa fa-bars', 'admin', '2024-04-13 14:27:31', 'admin', '2024-04-13 23:31:52', '系统工具目录');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, '/system/user', '', 'C', '0', '1', 'system:user:view', 'fa fa-user-o', 'admin', '2024-04-13 14:27:31', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, '/system/role', '', 'C', '0', '1', 'system:role:view', 'fa fa-user-secret', 'admin', '2024-04-13 14:27:31', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, '/system/menu', '', 'C', '0', '1', 'system:menu:view', 'fa fa-th-list', 'admin', '2024-04-13 14:27:31', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, '/system/dept', '', 'C', '0', '1', 'system:dept:view', 'fa fa-outdent', 'admin', '2024-04-13 14:27:31', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, '/system/post', '', 'C', '0', '1', 'system:post:view', 'fa fa-address-card-o', 'admin', '2024-04-13 14:27:31', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, '/system/dict', '', 'C', '0', '1', 'system:dict:view', 'fa fa-bookmark-o', 'admin', '2024-04-13 14:27:31', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, '/system/config', '', 'C', '0', '1', 'system:config:view', 'fa fa-sun-o', 'admin', '2024-04-13 14:27:31', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, '/system/notice', '', 'C', '0', '1', 'system:notice:view', 'fa fa-bullhorn', 'admin', '2024-04-13 14:27:31', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, '#', '', 'M', '0', '1', '', 'fa fa-pencil-square-o', 'admin', '2024-04-13 14:27:31', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, '/monitor/online', '', 'C', '0', '1', 'monitor:online:view', 'fa fa-user-circle', 'admin', '2024-04-13 14:27:31', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, '/monitor/job', 'menuItem', 'C', '0', '1', 'monitor:job:view', 'fa fa-tasks', 'admin', '2024-04-13 14:27:31', 'admin', '2024-04-15 14:02:26', '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, '/monitor/data', '', 'C', '0', '1', 'monitor:data:view', 'fa fa-bug', 'admin', '2024-04-13 14:27:31', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, '/monitor/server', '', 'C', '0', '1', 'monitor:server:view', 'fa fa-server', 'admin', '2024-04-13 14:27:31', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, '/monitor/cache', '', 'C', '0', '1', 'monitor:cache:view', 'fa fa-cube', 'admin', '2024-04-13 14:27:31', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '表单构建', 3, 1, '/tool/build', '', 'C', '0', '1', 'tool:build:view', 'fa fa-wpforms', 'admin', '2024-04-13 14:27:31', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (115, '代码生成', 3, 2, '/tool/gen', '', 'C', '0', '1', 'tool:gen:view', 'fa fa-code', 'admin', '2024-04-13 14:27:31', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (116, '系统接口', 3, 3, '/tool/swagger', '', 'C', '0', '1', 'tool:swagger:view', 'fa fa-gg', 'admin', '2024-04-13 14:27:31', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, '/monitor/operlog', '', 'C', '0', '1', 'monitor:operlog:view', 'fa fa-address-book', 'admin', '2024-04-13 14:27:31', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, '/monitor/logininfor', '', 'C', '0', '1', 'monitor:logininfor:view', 'fa fa-file-image-o', 'admin', '2024-04-13 14:27:31', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '#', '', 'F', '0', '1', 'system:user:list', '#', 'admin', '2024-04-13 14:27:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '#', '', 'F', '0', '1', 'system:user:add', '#', 'admin', '2024-04-13 14:27:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '#', '', 'F', '0', '1', 'system:user:edit', '#', 'admin', '2024-04-13 14:27:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '#', '', 'F', '0', '1', 'system:user:remove', '#', 'admin', '2024-04-13 14:27:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '#', '', 'F', '0', '1', 'system:user:export', '#', 'admin', '2024-04-13 14:27:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '#', '', 'F', '0', '1', 'system:user:import', '#', 'admin', '2024-04-13 14:27:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '#', '', 'F', '0', '1', 'system:user:resetPwd', '#', 'admin', '2024-04-13 14:27:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '#', '', 'F', '0', '1', 'system:role:list', '#', 'admin', '2024-04-13 14:27:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '#', '', 'F', '0', '1', 'system:role:add', '#', 'admin', '2024-04-13 14:27:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '#', '', 'F', '0', '1', 'system:role:edit', '#', 'admin', '2024-04-13 14:27:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '#', '', 'F', '0', '1', 'system:role:remove', '#', 'admin', '2024-04-13 14:27:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '#', '', 'F', '0', '1', 'system:role:export', '#', 'admin', '2024-04-13 14:27:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '#', '', 'F', '0', '1', 'system:menu:list', '#', 'admin', '2024-04-13 14:27:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '#', '', 'F', '0', '1', 'system:menu:add', '#', 'admin', '2024-04-13 14:27:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '#', '', 'F', '0', '1', 'system:menu:edit', '#', 'admin', '2024-04-13 14:27:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '#', '', 'F', '0', '1', 'system:menu:remove', '#', 'admin', '2024-04-13 14:27:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '#', '', 'F', '0', '1', 'system:dept:list', '#', 'admin', '2024-04-13 14:27:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '#', '', 'F', '0', '1', 'system:dept:add', '#', 'admin', '2024-04-13 14:27:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '#', '', 'F', '0', '1', 'system:dept:edit', '#', 'admin', '2024-04-13 14:27:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '#', '', 'F', '0', '1', 'system:dept:remove', '#', 'admin', '2024-04-13 14:27:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '#', '', 'F', '0', '1', 'system:post:list', '#', 'admin', '2024-04-13 14:27:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '#', '', 'F', '0', '1', 'system:post:add', '#', 'admin', '2024-04-13 14:27:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '#', '', 'F', '0', '1', 'system:post:edit', '#', 'admin', '2024-04-13 14:27:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '#', '', 'F', '0', '1', 'system:post:remove', '#', 'admin', '2024-04-13 14:27:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '#', '', 'F', '0', '1', 'system:post:export', '#', 'admin', '2024-04-13 14:27:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', 'F', '0', '1', 'system:dict:list', '#', 'admin', '2024-04-13 14:27:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', 'F', '0', '1', 'system:dict:add', '#', 'admin', '2024-04-13 14:27:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', 'F', '0', '1', 'system:dict:edit', '#', 'admin', '2024-04-13 14:27:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', 'F', '0', '1', 'system:dict:remove', '#', 'admin', '2024-04-13 14:27:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', 'F', '0', '1', 'system:dict:export', '#', 'admin', '2024-04-13 14:27:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', 'F', '0', '1', 'system:config:list', '#', 'admin', '2024-04-13 14:27:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', 'F', '0', '1', 'system:config:add', '#', 'admin', '2024-04-13 14:27:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', 'F', '0', '1', 'system:config:edit', '#', 'admin', '2024-04-13 14:27:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', 'F', '0', '1', 'system:config:remove', '#', 'admin', '2024-04-13 14:27:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', 'F', '0', '1', 'system:config:export', '#', 'admin', '2024-04-13 14:27:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', 'F', '0', '1', 'system:notice:list', '#', 'admin', '2024-04-13 14:27:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', 'F', '0', '1', 'system:notice:add', '#', 'admin', '2024-04-13 14:27:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', 'F', '0', '1', 'system:notice:edit', '#', 'admin', '2024-04-13 14:27:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', 'F', '0', '1', 'system:notice:remove', '#', 'admin', '2024-04-13 14:27:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', 'F', '0', '1', 'monitor:operlog:list', '#', 'admin', '2024-04-13 14:27:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', 'F', '0', '1', 'monitor:operlog:remove', '#', 'admin', '2024-04-13 14:27:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '详细信息', 500, 3, '#', '', 'F', '0', '1', 'monitor:operlog:detail', '#', 'admin', '2024-04-13 14:27:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '日志导出', 500, 4, '#', '', 'F', '0', '1', 'monitor:operlog:export', '#', 'admin', '2024-04-13 14:27:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录查询', 501, 1, '#', '', 'F', '0', '1', 'monitor:logininfor:list', '#', 'admin', '2024-04-13 14:27:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '登录删除', 501, 2, '#', '', 'F', '0', '1', 'monitor:logininfor:remove', '#', 'admin', '2024-04-13 14:27:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '日志导出', 501, 3, '#', '', 'F', '0', '1', 'monitor:logininfor:export', '#', 'admin', '2024-04-13 14:27:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '账户解锁', 501, 4, '#', '', 'F', '0', '1', 'monitor:logininfor:unlock', '#', 'admin', '2024-04-13 14:27:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '在线查询', 109, 1, '#', '', 'F', '0', '1', 'monitor:online:list', '#', 'admin', '2024-04-13 14:27:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '批量强退', 109, 2, '#', '', 'F', '0', '1', 'monitor:online:batchForceLogout', '#', 'admin', '2024-04-13 14:27:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '单条强退', 109, 3, '#', '', 'F', '0', '1', 'monitor:online:forceLogout', '#', 'admin', '2024-04-13 14:27:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务查询', 110, 1, '#', '', 'F', '0', '1', 'monitor:job:list', '#', 'admin', '2024-04-13 14:27:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务新增', 110, 2, '#', '', 'F', '0', '1', 'monitor:job:add', '#', 'admin', '2024-04-13 14:27:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务修改', 110, 3, '#', '', 'F', '0', '1', 'monitor:job:edit', '#', 'admin', '2024-04-13 14:27:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '任务删除', 110, 4, '#', '', 'F', '0', '1', 'monitor:job:remove', '#', 'admin', '2024-04-13 14:27:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '状态修改', 110, 5, '#', '', 'F', '0', '1', 'monitor:job:changeStatus', '#', 'admin', '2024-04-13 14:27:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '任务详细', 110, 6, '#', '', 'F', '0', '1', 'monitor:job:detail', '#', 'admin', '2024-04-13 14:27:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '任务导出', 110, 7, '#', '', 'F', '0', '1', 'monitor:job:export', '#', 'admin', '2024-04-13 14:27:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成查询', 115, 1, '#', '', 'F', '0', '1', 'tool:gen:list', '#', 'admin', '2024-04-13 14:27:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '生成修改', 115, 2, '#', '', 'F', '0', '1', 'tool:gen:edit', '#', 'admin', '2024-04-13 14:27:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '生成删除', 115, 3, '#', '', 'F', '0', '1', 'tool:gen:remove', '#', 'admin', '2024-04-13 14:27:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '预览代码', 115, 4, '#', '', 'F', '0', '1', 'tool:gen:preview', '#', 'admin', '2024-04-13 14:27:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1061, '生成代码', 115, 5, '#', '', 'F', '0', '1', 'tool:gen:code', '#', 'admin', '2024-04-13 14:27:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2000, '基本配置', 0, 1, '#', 'menuItem', 'M', '0', '1', NULL, 'fa fa-university', 'admin', '2024-04-13 23:31:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2001, '首页轮播', 2000, 1, '/web/carousel', 'menuItem', 'C', '0', '1', 'web:carousel:view', 'fa fa-file-picture-o', 'admin', '2024-04-13 23:38:52', 'admin', '2024-04-13 23:39:24', '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2024-04-13 14:27:32', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2024-04-13 14:27:32', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (3, '若依开源框架介绍', '1', 0x3C703E3C7370616E207374796C653D22636F6C6F723A20726762283233302C20302C2030293B223EE9A1B9E79BAEE4BB8BE7BB8D3C2F7370616E3E3C2F703E3C703E3C666F6E7420636F6C6F723D2223333333333333223E52756F5969E5BC80E6BA90E9A1B9E79BAEE698AFE4B8BAE4BC81E4B89AE794A8E688B7E5AE9AE588B6E79A84E5908EE58FB0E8849AE6898BE69EB6E6A186E69EB6EFBC8CE4B8BAE4BC81E4B89AE68993E980A0E79A84E4B880E7AB99E5BC8FE8A7A3E586B3E696B9E6A188EFBC8CE9998DE4BD8EE4BC81E4B89AE5BC80E58F91E68890E69CACEFBC8CE68F90E58D87E5BC80E58F91E69588E78E87E38082E4B8BBE8A681E58C85E68BACE794A8E688B7E7AEA1E79086E38081E8A792E889B2E7AEA1E79086E38081E983A8E997A8E7AEA1E79086E38081E88F9CE58D95E7AEA1E79086E38081E58F82E695B0E7AEA1E79086E38081E5AD97E585B8E7AEA1E79086E380813C2F666F6E743E3C7370616E207374796C653D22636F6C6F723A207267622835312C2035312C203531293B223EE5B297E4BD8DE7AEA1E790863C2F7370616E3E3C7370616E207374796C653D22636F6C6F723A207267622835312C2035312C203531293B223EE38081E5AE9AE697B6E4BBBBE58AA13C2F7370616E3E3C7370616E207374796C653D22636F6C6F723A207267622835312C2035312C203531293B223EE380813C2F7370616E3E3C7370616E207374796C653D22636F6C6F723A207267622835312C2035312C203531293B223EE69C8DE58AA1E79B91E68EA7E38081E799BBE5BD95E697A5E5BF97E38081E6938DE4BD9CE697A5E5BF97E38081E4BBA3E7A081E7949FE68890E7AD89E58A9FE883BDE38082E585B6E4B8ADEFBC8CE8BF98E694AFE68C81E5A49AE695B0E68DAEE6BA90E38081E695B0E68DAEE69D83E99990E38081E59BBDE99985E58C96E380815265646973E7BC93E5AD98E38081446F636B6572E983A8E7BDB2E38081E6BB91E58AA8E9AA8CE8AF81E7A081E38081E7ACACE4B889E696B9E8AEA4E8AF81E799BBE5BD95E38081E58886E5B883E5BC8FE4BA8BE58AA1E380813C2F7370616E3E3C666F6E7420636F6C6F723D2223333333333333223EE58886E5B883E5BC8FE69687E4BBB6E5AD98E582A83C2F666F6E743E3C7370616E207374796C653D22636F6C6F723A207267622835312C2035312C203531293B223EE38081E58886E5BA93E58886E8A1A8E5A484E79086E7AD89E68A80E69CAFE789B9E782B9E380823C2F7370616E3E3C2F703E3C703E3C696D67207372633D2268747470733A2F2F666F727564612E67697465652E636F6D2F696D616765732F313730353033303538333937373430313635312F35656435646236615F313135313030342E706E6722207374796C653D2277696474683A20363470783B223E3C62723E3C2F703E3C703E3C7370616E207374796C653D22636F6C6F723A20726762283233302C20302C2030293B223EE5AE98E7BD91E58F8AE6BC94E7A4BA3C2F7370616E3E3C2F703E3C703E3C7370616E207374796C653D22636F6C6F723A207267622835312C2035312C203531293B223EE88BA5E4BE9DE5AE98E7BD91E59CB0E59D80EFBC9A266E6273703B3C2F7370616E3E3C6120687265663D22687474703A2F2F72756F79692E76697022207461726765743D225F626C616E6B223E687474703A2F2F72756F79692E7669703C2F613E3C6120687265663D22687474703A2F2F72756F79692E76697022207461726765743D225F626C616E6B223E3C2F613E3C2F703E3C703E3C7370616E207374796C653D22636F6C6F723A207267622835312C2035312C203531293B223EE88BA5E4BE9DE69687E6A1A3E59CB0E59D80EFBC9A266E6273703B3C2F7370616E3E3C6120687265663D22687474703A2F2F646F632E72756F79692E76697022207461726765743D225F626C616E6B223E687474703A2F2F646F632E72756F79692E7669703C2F613E3C62723E3C2F703E3C703E3C7370616E207374796C653D22636F6C6F723A207267622835312C2035312C203531293B223EE6BC94E7A4BAE59CB0E59D80E38090E4B88DE58886E7A6BBE78988E38091EFBC9A266E6273703B3C2F7370616E3E3C6120687265663D22687474703A2F2F64656D6F2E72756F79692E76697022207461726765743D225F626C616E6B223E687474703A2F2F64656D6F2E72756F79692E7669703C2F613E3C2F703E3C703E3C7370616E207374796C653D22636F6C6F723A207267622835312C2035312C203531293B223EE6BC94E7A4BAE59CB0E59D80E38090E58886E7A6BBE78988E69CACE38091EFBC9A266E6273703B3C2F7370616E3E3C6120687265663D22687474703A2F2F7675652E72756F79692E76697022207461726765743D225F626C616E6B223E687474703A2F2F7675652E72756F79692E7669703C2F613E3C2F703E3C703E3C7370616E207374796C653D22636F6C6F723A207267622835312C2035312C203531293B223EE6BC94E7A4BAE59CB0E59D80E38090E5BEAEE69C8DE58AA1E78988E38091EFBC9A266E6273703B3C2F7370616E3E3C6120687265663D22687474703A2F2F636C6F75642E72756F79692E76697022207461726765743D225F626C616E6B223E687474703A2F2F636C6F75642E72756F79692E7669703C2F613E3C2F703E3C703E3C7370616E207374796C653D22636F6C6F723A207267622835312C2035312C203531293B223EE6BC94E7A4BAE59CB0E59D80E38090E7A7BBE58AA8E7ABAFE78988E38091EFBC9A266E6273703B3C2F7370616E3E3C6120687265663D22687474703A2F2F68352E72756F79692E76697022207461726765743D225F626C616E6B223E687474703A2F2F68352E72756F79692E7669703C2F613E3C2F703E3C703E3C6272207374796C653D22636F6C6F723A207267622834382C2034392C203531293B20666F6E742D66616D696C793A202671756F743B48656C766574696361204E6575652671756F743B2C2048656C7665746963612C20417269616C2C2073616E732D73657269663B20666F6E742D73697A653A20313270783B223E3C2F703E, '0', 'admin', '2024-04-13 14:27:32', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type`) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status`) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 205 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '重置密码', 2, 'com.ruoyi.web.controller.system.SysProfileController.resetPwd()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/resetPwd', '127.0.0.1', '内网IP', '{\"userId\":[\"1\"],\"loginName\":[\"admin\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-13 16:44:07', 116);
INSERT INTO `sys_oper_log` VALUES (101, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/4', '127.0.0.1', '内网IP', '4', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":301}', 0, NULL, '2024-04-13 16:44:40', 10);
INSERT INTO `sys_oper_log` VALUES (102, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"4\"],\"parentId\":[\"0\"],\"menuType\":[\"C\"],\"menuName\":[\"若依官网\"],\"url\":[\"\"],\"target\":[\"menuBlank\"],\"perms\":[\"\"],\"orderNum\":[\"4\"],\"icon\":[\"fa fa-location-arrow\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-13 16:44:51', 26);
INSERT INTO `sys_oper_log` VALUES (103, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通角色\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,1042,501,1043,1044,1045,1046,2,109,1047,1048,1049,110,1050,1051,1052,1053,1054,1055,1056,111,112,113,3,114,115,1057,1058,1059,1060,1061,116\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-13 16:45:18', 68);
INSERT INTO `sys_oper_log` VALUES (104, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/4', '127.0.0.1', '内网IP', '4', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-13 16:45:23', 19);
INSERT INTO `sys_oper_log` VALUES (105, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updateAvatar()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/updateAvatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-13 16:46:47', 103);
INSERT INTO `sys_oper_log` VALUES (106, '个人信息', 2, 'com.tea.web.controller.system.SysProfileController.update()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/update', '127.0.0.1', '内网IP', '{\"id\":[\"\"],\"userName\":[\"苏学豪\"],\"phonenumber\":[\"15888888888\"],\"email\":[\"sxh@163.com\"],\"sex\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-13 19:03:05', 139);
INSERT INTO `sys_oper_log` VALUES (107, '部门管理', 2, 'com.tea.web.controller.system.SysDeptController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dept/edit', '127.0.0.1', '内网IP', '{\"deptId\":[\"100\"],\"parentId\":[\"0\"],\"parentName\":[\"无\"],\"deptName\":[\"云茶盟集团\"],\"orderNum\":[\"0\"],\"leader\":[\"苏学豪\"],\"phone\":[\"15888888888\"],\"email\":[\"sxh@qq.com\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-13 19:11:07', 38);
INSERT INTO `sys_oper_log` VALUES (108, '部门管理', 2, 'com.tea.web.controller.system.SysDeptController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dept/edit', '127.0.0.1', '内网IP', '{\"deptId\":[\"101\"],\"parentId\":[\"100\"],\"parentName\":[\"云茶盟集团\"],\"deptName\":[\"上海总公司\"],\"orderNum\":[\"1\"],\"leader\":[\"苏学豪\"],\"phone\":[\"15888888888\"],\"email\":[\"sxh@qq.com\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-13 19:11:33', 41);
INSERT INTO `sys_oper_log` VALUES (109, '部门管理', 2, 'com.tea.web.controller.system.SysDeptController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dept/edit', '127.0.0.1', '内网IP', '{\"deptId\":[\"105\"],\"parentId\":[\"101\"],\"parentName\":[\"上海总公司\"],\"deptName\":[\"营销部门\"],\"orderNum\":[\"3\"],\"leader\":[\"张三\"],\"phone\":[\"15888888888\"],\"email\":[\"zs@qq.com\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-13 19:12:04', 30);
INSERT INTO `sys_oper_log` VALUES (110, '部门管理', 3, 'com.tea.web.controller.system.SysDeptController.remove()', 'GET', 1, 'admin', '研发部门', '/system/dept/remove/107', '127.0.0.1', '内网IP', '107', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-13 19:12:11', 18);
INSERT INTO `sys_oper_log` VALUES (111, '部门管理', 2, 'com.tea.web.controller.system.SysDeptController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/dept/edit', '127.0.0.1', '内网IP', '{\"deptId\":[\"102\"],\"parentId\":[\"100\"],\"parentName\":[\"云茶盟集团\"],\"deptName\":[\"武汉分公司\"],\"orderNum\":[\"2\"],\"leader\":[\"李四\"],\"phone\":[\"15888888888\"],\"email\":[\"ls@qq.com\"],\"status\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-13 19:12:31', 28);
INSERT INTO `sys_oper_log` VALUES (112, '菜单管理', 2, 'com.tea.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"110\"],\"parentId\":[\"2\"],\"menuType\":[\"C\"],\"menuName\":[\"定时任务\"],\"url\":[\"/monitor/jobs\"],\"target\":[\"menuItem\"],\"perms\":[\"monitor:job:view\"],\"orderNum\":[\"2\"],\"icon\":[\"fa fa-tasks\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-13 20:21:08', 127);
INSERT INTO `sys_oper_log` VALUES (113, '个人信息', 2, 'com.tea.web.controller.system.SysProfileController.updateAvatar()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/updateAvatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-13 20:31:28', 182);
INSERT INTO `sys_oper_log` VALUES (114, '参数管理', 2, 'com.tea.web.controller.system.SysConfigController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/config/edit', '127.0.0.1', '内网IP', '{\"configId\":[\"1\"],\"configName\":[\"主框架页-默认皮肤样式名称\"],\"configKey\":[\"sys.index.skinName\"],\"configValue\":[\"skin-yellow\"],\"configType\":[\"Y\"],\"remark\":[\"蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-13 20:33:40', 24);
INSERT INTO `sys_oper_log` VALUES (115, '参数管理', 2, 'com.tea.web.controller.system.SysConfigController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/config/edit', '127.0.0.1', '内网IP', '{\"configId\":[\"1\"],\"configName\":[\"主框架页-默认皮肤样式名称\"],\"configKey\":[\"sys.index.skinName\"],\"configValue\":[\"skin-yellow\"],\"configType\":[\"Y\"],\"remark\":[\"蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-13 20:33:47', 24);
INSERT INTO `sys_oper_log` VALUES (116, '参数管理', 2, 'com.tea.web.controller.system.SysConfigController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/config/edit', '127.0.0.1', '内网IP', '{\"configId\":[\"3\"],\"configName\":[\"主框架页-侧边栏主题\"],\"configKey\":[\"sys.index.sideTheme\"],\"configValue\":[\"theme-light\"],\"configType\":[\"Y\"],\"remark\":[\"深黑主题theme-dark，浅色主题theme-light，深蓝主题theme-blue\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-13 20:34:00', 14);
INSERT INTO `sys_oper_log` VALUES (117, '参数管理', 2, 'com.tea.web.controller.system.SysConfigController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/config/edit', '127.0.0.1', '内网IP', '{\"configId\":[\"4\"],\"configName\":[\"账号自助-是否开启用户注册功能\"],\"configKey\":[\"sys.account.registerUser\"],\"configValue\":[\"true\"],\"configType\":[\"Y\"],\"remark\":[\"是否开启注册用户功能（true开启，false关闭）\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-13 20:34:26', 17);
INSERT INTO `sys_oper_log` VALUES (118, '重置密码', 2, 'com.tea.web.controller.system.SysProfileController.resetPwd()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/resetPwd', '127.0.0.1', '内网IP', '{\"userId\":[\"1\"],\"loginName\":[\"admin\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-13 21:10:59', 115);
INSERT INTO `sys_oper_log` VALUES (119, '代码生成', 6, 'com.tea.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"lb_home_carousel\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-13 22:42:24', 245);
INSERT INTO `sys_oper_log` VALUES (120, '代码生成', 8, 'com.tea.generator.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/lb_home_carousel', '127.0.0.1', '内网IP', '\"lb_home_carousel\"', NULL, 0, NULL, '2024-04-13 22:43:13', 126);
INSERT INTO `sys_oper_log` VALUES (121, '代码生成', 8, 'com.tea.generator.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/lb_home_carousel', '127.0.0.1', '内网IP', '\"lb_home_carousel\"', NULL, 0, NULL, '2024-04-13 23:24:45', 456);
INSERT INTO `sys_oper_log` VALUES (122, '菜单管理', 1, 'com.tea.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"基本配置\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-university\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-13 23:31:01', 36);
INSERT INTO `sys_oper_log` VALUES (123, '菜单管理', 2, 'com.tea.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"系统管理\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"2\"],\"icon\":[\"fa fa-gear\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-13 23:31:18', 20);
INSERT INTO `sys_oper_log` VALUES (124, '菜单管理', 2, 'com.tea.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"系统监控\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"3\"],\"icon\":[\"fa fa-video-camera\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-13 23:31:28', 13);
INSERT INTO `sys_oper_log` VALUES (125, '菜单管理', 2, 'com.tea.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"3\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"系统工具\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"4\"],\"icon\":[\"fa fa-bars\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-13 23:31:32', 14);
INSERT INTO `sys_oper_log` VALUES (126, '菜单管理', 2, 'com.tea.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"1\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"系统管理\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"101\"],\"icon\":[\"fa fa-gear\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-13 23:31:42', 12);
INSERT INTO `sys_oper_log` VALUES (127, '菜单管理', 2, 'com.tea.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"系统监控\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"102\"],\"icon\":[\"fa fa-video-camera\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-13 23:31:47', 10);
INSERT INTO `sys_oper_log` VALUES (128, '菜单管理', 2, 'com.tea.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"3\"],\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"系统工具\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"103\"],\"icon\":[\"fa fa-bars\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-13 23:31:52', 14);
INSERT INTO `sys_oper_log` VALUES (129, '代码生成', 2, 'com.tea.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"1\"],\"tableName\":[\"lb_home_carousel\"],\"tableComment\":[\"首页轮播表\"],\"className\":[\"LbHomeCarousel\"],\"functionAuthor\":[\"suxuehao\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"1\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键id\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"lbId\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"2\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"首页轮播图名称\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"lbPictureName\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"LIKE\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"3\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"附件ID\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"lbFileId\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"4\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"创建时间\"],\"columns[3].javaType\":[\"Date\"],\"columns[3].javaField\":[\"lbCreateTime\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"datetime\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"5\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"是否可用（1：是，0否）\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"lbIsUse\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"tplCategory\":[\"crud\"],\"packageName\":[\"com.tea.web\"],\"moduleName\":[\"web\"],\"businessName\":[\"carousel\"],\"functionName\":[\"首页轮播\"],\"params[parentMenuId]\"', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-13 23:32:30', 53);
INSERT INTO `sys_oper_log` VALUES (130, '代码生成', 8, 'com.tea.generator.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/lb_home_carousel', '127.0.0.1', '内网IP', '\"lb_home_carousel\"', NULL, 0, NULL, '2024-04-13 23:32:32', 114);
INSERT INTO `sys_oper_log` VALUES (131, '菜单管理', 1, 'com.tea.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"首页轮播\"],\"url\":[\"/web/carousel\"],\"target\":[\"menuItem\"],\"perms\":[\"@RequiresPermissions(\\\"web:carousel:view\\\")\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-file-picture-o\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-13 23:38:53', 134);
INSERT INTO `sys_oper_log` VALUES (132, '菜单管理', 2, 'com.tea.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2001\"],\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"首页轮播\"],\"url\":[\"/web/carousel\"],\"target\":[\"menuItem\"],\"perms\":[\"web:carousel:view\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-file-picture-o\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-13 23:39:24', 16);
INSERT INTO `sys_oper_log` VALUES (133, '首页轮播', 1, 'com.tea.web.controller.LbHomeCarouselController.addSave()', 'POST', 1, 'admin', '研发部门', '/web/carousel/add', '127.0.0.1', '内网IP', '{\"lbPictureName\":[\"产品\"],\"lbCreateTime\":[\"2024-04-14\"],\"lbIsUse\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-14 15:17:43', 68297);
INSERT INTO `sys_oper_log` VALUES (134, '首页轮播', 1, 'com.tea.web.controller.LbHomeCarouselController.addSave()', 'POST', 1, 'admin', '研发部门', '/web/carousel/add', '127.0.0.1', '内网IP', '{\"lbPictureName\":[\"产品\"],\"lbCreateTime\":[\"2024-04-14\"],\"lbIsUse\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-14 15:24:36', 48740);
INSERT INTO `sys_oper_log` VALUES (135, '首页轮播', 1, 'com.tea.web.controller.LbHomeCarouselController.addSave()', 'POST', 1, 'admin', '研发部门', '/web/carousel/add', '127.0.0.1', '内网IP', '{\"lbPictureName\":[\"产品\"],\"lbCreateTime\":[\"2024-04-07\"],\"lbIsUse\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-14 15:29:04', 44474);
INSERT INTO `sys_oper_log` VALUES (136, '首页轮播', 1, 'com.tea.web.controller.LbHomeCarouselController.addSave()', 'POST', 1, 'admin', '研发部门', '/web/carousel/add', '127.0.0.1', '内网IP', '{\"lbPictureName\":[\"产品\"],\"lbCreateTime\":[\"2024-04-02\"],\"lbIsUse\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-14 15:37:23', 9109);
INSERT INTO `sys_oper_log` VALUES (137, '首页轮播', 1, 'com.tea.web.controller.LbHomeCarouselController.addSave()', 'POST', 1, 'admin', '研发部门', '/web/carousel/add', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-14 15:48:17', 39791);
INSERT INTO `sys_oper_log` VALUES (138, '代码生成', 6, 'com.tea.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"sys_attachment\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-14 16:01:38', 161);
INSERT INTO `sys_oper_log` VALUES (139, '代码生成', 2, 'com.tea.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"2\"],\"tableName\":[\"sys_attachment\"],\"tableComment\":[\"文件附件表\"],\"className\":[\"SysAttachment\"],\"functionAuthor\":[\"suxuehao\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"6\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"主键id\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"id\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"7\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"文件加密UUID\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"fileId\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"EQ\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"8\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"文件名称\"],\"columns[2].javaType\":[\"String\"],\"columns[2].javaField\":[\"fileName\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"LIKE\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"9\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"文件路径\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"filePath\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"10\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"文件大小\"],\"columns[4].javaType\":[\"Long\"],\"columns[4].javaField\":[\"fileSize\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"11\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"文件扩展名\"],\"columns[5].javaType\":[\"String\"],\"columns[5].javaFie', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-14 16:03:25', 35);
INSERT INTO `sys_oper_log` VALUES (140, '代码生成', 8, 'com.tea.generator.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/sys_attachment', '127.0.0.1', '内网IP', '\"sys_attachment\"', NULL, 0, NULL, '2024-04-14 16:03:31', 246);
INSERT INTO `sys_oper_log` VALUES (141, '首页轮播', 1, 'com.tea.web.controller.LbHomeCarouselController.addSave()', 'POST', 1, 'admin', '研发部门', '/web/carousel/add', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-14 16:53:39', 67291);
INSERT INTO `sys_oper_log` VALUES (142, '首页轮播', 1, 'com.tea.web.controller.LbHomeCarouselController.addSave()', 'POST', 1, 'admin', '研发部门', '/web/carousel/add', '127.0.0.1', '内网IP', '{\"lbHomeCarousel\":[\"lbPictureName=%E4%BA%A7%E5%93%81&lbCreateTime=2024-04-14&lbIsUse=1\"]}', NULL, 1, 'syntax error, pos 1, line 1, column 2lbPictureName=%E4%BA%A7%E5%93%81&lbCreateTime=2024-04-14&lbIsUse=1', '2024-04-14 16:58:44', 46994);
INSERT INTO `sys_oper_log` VALUES (143, '首页轮播', 1, 'com.tea.web.controller.LbHomeCarouselController.addSave()', 'POST', 1, 'admin', '研发部门', '/web/carousel/add', '127.0.0.1', '内网IP', '{\"lbPictureName\":[\"轮播1\"],\"lbCreateTime\":[\"2024-04-14\"],\"lbIsUse\":[\"1\"]}', NULL, 1, '', '2024-04-14 17:23:13', 76);
INSERT INTO `sys_oper_log` VALUES (144, '首页轮播', 1, 'com.tea.web.controller.LbHomeCarouselController.addSave()', 'POST', 1, 'admin', '研发部门', '/web/carousel/add', '127.0.0.1', '内网IP', '{\"lbPictureName\":[\"产品\"],\"lbCreateTime\":[\"2024-04-14\"],\"lbIsUse\":[\"1\"]}', NULL, 1, '', '2024-04-14 17:25:10', 0);
INSERT INTO `sys_oper_log` VALUES (145, '首页轮播', 1, 'com.tea.web.controller.LbHomeCarouselController.addSave()', 'POST', 1, 'admin', '研发部门', '/web/carousel/add', '127.0.0.1', '内网IP', '{\"lbPictureName\":[\"轮播1\"],\"lbCreateTime\":[\"2024-04-14\"],\"lbIsUse\":[\"1\"]}', NULL, 1, '', '2024-04-14 17:33:03', 15617);
INSERT INTO `sys_oper_log` VALUES (146, '首页轮播', 1, 'com.tea.web.controller.LbHomeCarouselController.addSave()', 'POST', 1, 'admin', '研发部门', '/web/carousel/add', '127.0.0.1', '内网IP', '{\"lbPictureName\":[\"轮播1\"],\"lbCreateTime\":[\"2024-04-02\"],\"lbIsUse\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-14 17:37:37', 40119);
INSERT INTO `sys_oper_log` VALUES (147, '首页轮播', 1, 'com.tea.web.controller.LbHomeCarouselController.addSave()', 'POST', 1, 'admin', '研发部门', '/web/carousel/add', '127.0.0.1', '内网IP', '{\"lbPictureName\":[\"轮播1\"],\"lbCreateTime\":[\"2024-04-14\"],\"lbIsUse\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-14 17:47:09', 8800);
INSERT INTO `sys_oper_log` VALUES (148, '首页轮播', 1, 'com.tea.web.controller.LbHomeCarouselController.addSave()', 'POST', 1, 'admin', '研发部门', '/web/carousel/add', '127.0.0.1', '内网IP', '{\"lbPictureName\":[\"轮播1\"],\"lbCreateTime\":[\"2024-04-14\"],\"lbIsUse\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-14 17:47:09', 208);
INSERT INTO `sys_oper_log` VALUES (149, '首页轮播', 1, 'com.tea.web.controller.LbHomeCarouselController.addSave()', 'POST', 1, 'admin', '研发部门', '/web/carousel/add', '127.0.0.1', '内网IP', '{\"lbPictureName\":[\"轮播1\"],\"lbCreateTime\":[\"2024-04-14\"],\"lbIsUse\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-14 17:47:09', 209);
INSERT INTO `sys_oper_log` VALUES (150, '首页轮播', 3, 'com.tea.web.controller.LbHomeCarouselController.remove()', 'POST', 1, 'admin', '研发部门', '/web/carousel/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-14 17:47:28', 28);
INSERT INTO `sys_oper_log` VALUES (151, '首页轮播', 3, 'com.tea.web.controller.LbHomeCarouselController.remove()', 'POST', 1, 'admin', '研发部门', '/web/carousel/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"3\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-14 17:47:32', 10);
INSERT INTO `sys_oper_log` VALUES (152, '首页轮播', 1, 'com.tea.web.controller.LbHomeCarouselController.addSave()', 'POST', 1, 'admin', '研发部门', '/web/carousel/add', '127.0.0.1', '内网IP', '{\"lbPictureName\":[\"轮播1\"],\"lbCreateTime\":[\"2024-04-14\"],\"lbIsUse\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-14 17:47:46', 23);
INSERT INTO `sys_oper_log` VALUES (153, '首页轮播', 3, 'com.tea.web.controller.LbHomeCarouselController.remove()', 'POST', 1, 'admin', '研发部门', '/web/carousel/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"4\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-14 17:47:49', 6);
INSERT INTO `sys_oper_log` VALUES (154, '首页轮播', 1, 'com.tea.web.controller.LbHomeCarouselController.addSave()', 'POST', 1, 'admin', '研发部门', '/web/carousel/add', '127.0.0.1', '内网IP', '{\"lbPictureName\":[\"轮播1\"],\"lbCreateTime\":[\"2024-04-14\"],\"lbIsUse\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-14 17:49:42', 11284);
INSERT INTO `sys_oper_log` VALUES (155, '首页轮播', 1, 'com.tea.web.controller.LbHomeCarouselController.addSave()', 'POST', 1, 'admin', '研发部门', '/web/carousel/add', '127.0.0.1', '内网IP', '{\"lbPictureName\":[\"轮播1\"],\"lbCreateTime\":[\"2024-04-14\"],\"lbIsUse\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-14 17:49:42', 2947);
INSERT INTO `sys_oper_log` VALUES (156, '首页轮播', 1, 'com.tea.web.controller.LbHomeCarouselController.addSave()', 'POST', 1, 'admin', '研发部门', '/web/carousel/add', '127.0.0.1', '内网IP', '{\"lbPictureName\":[\"轮播1\"],\"lbCreateTime\":[\"2024-04-14\"],\"lbIsUse\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-14 17:49:42', 2947);
INSERT INTO `sys_oper_log` VALUES (157, '首页轮播', 1, 'com.tea.web.controller.LbHomeCarouselController.addSave()', 'POST', 1, 'admin', '研发部门', '/web/carousel/add', '127.0.0.1', '内网IP', '{\"lbPictureName\":[\"轮播1\"],\"lbCreateTime\":[\"2024-04-14\"],\"lbIsUse\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-14 17:49:42', 2945);
INSERT INTO `sys_oper_log` VALUES (158, '首页轮播', 1, 'com.tea.web.controller.LbHomeCarouselController.addSave()', 'POST', 1, 'admin', '研发部门', '/web/carousel/add', '127.0.0.1', '内网IP', '{\"lbPictureName\":[\"轮播1\"],\"lbCreateTime\":[\"2024-04-14\"],\"lbIsUse\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-14 17:49:42', 2943);
INSERT INTO `sys_oper_log` VALUES (159, '首页轮播', 1, 'com.tea.web.controller.LbHomeCarouselController.addSave()', 'POST', 1, 'admin', '研发部门', '/web/carousel/add', '127.0.0.1', '内网IP', '{\"lbPictureName\":[\"轮播1\"],\"lbCreateTime\":[\"2024-04-14\"],\"lbIsUse\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-14 17:49:47', 3665);
INSERT INTO `sys_oper_log` VALUES (160, '首页轮播', 1, 'com.tea.web.controller.LbHomeCarouselController.addSave()', 'POST', 1, 'admin', '研发部门', '/web/carousel/add', '127.0.0.1', '内网IP', '{\"lbPictureName\":[\"轮播1\"],\"lbCreateTime\":[\"2024-04-14\"],\"lbIsUse\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-14 17:49:47', 5222);
INSERT INTO `sys_oper_log` VALUES (161, '首页轮播', 1, 'com.tea.web.controller.LbHomeCarouselController.addSave()', 'POST', 1, 'admin', '研发部门', '/web/carousel/add', '127.0.0.1', '内网IP', '{\"lbPictureName\":[\"轮播1\"],\"lbCreateTime\":[\"2024-04-14\"],\"lbIsUse\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-14 17:49:47', 753);
INSERT INTO `sys_oper_log` VALUES (162, '首页轮播', 1, 'com.tea.web.controller.LbHomeCarouselController.addSave()', 'POST', 1, 'admin', '研发部门', '/web/carousel/add', '127.0.0.1', '内网IP', '{\"lbPictureName\":[\"轮播1\"],\"lbCreateTime\":[\"2024-04-14\"],\"lbIsUse\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-14 17:49:47', 4803);
INSERT INTO `sys_oper_log` VALUES (163, '首页轮播', 1, 'com.tea.web.controller.LbHomeCarouselController.addSave()', 'POST', 1, 'admin', '研发部门', '/web/carousel/add', '127.0.0.1', '内网IP', '{\"lbPictureName\":[\"轮播1\"],\"lbCreateTime\":[\"2024-04-14\"],\"lbIsUse\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-14 17:49:47', 299);
INSERT INTO `sys_oper_log` VALUES (164, '首页轮播', 1, 'com.tea.web.controller.LbHomeCarouselController.addSave()', 'POST', 1, 'admin', '研发部门', '/web/carousel/add', '127.0.0.1', '内网IP', '{\"lbPictureName\":[\"轮播1\"],\"lbCreateTime\":[\"2024-04-14\"],\"lbIsUse\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-14 17:49:47', 539);
INSERT INTO `sys_oper_log` VALUES (165, '首页轮播', 3, 'com.tea.web.controller.LbHomeCarouselController.remove()', 'POST', 1, 'admin', '研发部门', '/web/carousel/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"5\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-14 17:50:02', 10);
INSERT INTO `sys_oper_log` VALUES (166, '首页轮播', 3, 'com.tea.web.controller.LbHomeCarouselController.remove()', 'POST', 1, 'admin', '研发部门', '/web/carousel/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"6,7,8,9,10,11,12,13,14,15\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-14 17:50:07', 7);
INSERT INTO `sys_oper_log` VALUES (167, '首页轮播', 1, 'com.tea.web.controller.LbHomeCarouselController.addSave()', 'POST', 1, 'admin', '研发部门', '/web/carousel/add', '127.0.0.1', '内网IP', '{\"lbPictureName\":[\"轮播1\"],\"lbCreateTime\":[\"\"],\"lbIsUse\":[\"1\"]}', NULL, 1, 'Unparseable date: \"\"', '2024-04-14 17:53:32', 7842);
INSERT INTO `sys_oper_log` VALUES (168, '首页轮播', 1, 'com.tea.web.controller.LbHomeCarouselController.addSave()', 'POST', 1, 'admin', '研发部门', '/web/carousel/add', '127.0.0.1', '内网IP', '{\"lbPictureName\":[\"轮播1\"],\"lbCreateTime\":[\"\"],\"lbIsUse\":[\"1\"]}', NULL, 1, 'Unparseable date: \"\"', '2024-04-14 17:53:32', 1471);
INSERT INTO `sys_oper_log` VALUES (169, '首页轮播', 1, 'com.tea.web.controller.LbHomeCarouselController.addSave()', 'POST', 1, 'admin', '研发部门', '/web/carousel/add', '127.0.0.1', '内网IP', '{\"lbPictureName\":[\"轮播1\"],\"lbCreateTime\":[\"\"],\"lbIsUse\":[\"1\"]}', NULL, 1, 'Unparseable date: \"\"', '2024-04-14 17:53:32', 1471);
INSERT INTO `sys_oper_log` VALUES (170, '首页轮播', 1, 'com.tea.web.controller.LbHomeCarouselController.addSave()', 'POST', 1, 'admin', '研发部门', '/web/carousel/add', '127.0.0.1', '内网IP', '{\"lbPictureName\":[\"轮播1\"],\"lbCreateTime\":[\"2024-04-14\"],\"lbIsUse\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-14 17:54:15', 9937);
INSERT INTO `sys_oper_log` VALUES (171, '首页轮播', 1, 'com.tea.web.controller.LbHomeCarouselController.addSave()', 'POST', 1, 'admin', '研发部门', '/web/carousel/add', '127.0.0.1', '内网IP', '{\"lbPictureName\":[\"轮播1\"],\"lbCreateTime\":[\"2024-04-14\"],\"lbIsUse\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-14 17:54:15', 1063);
INSERT INTO `sys_oper_log` VALUES (172, '首页轮播', 1, 'com.tea.web.controller.LbHomeCarouselController.addSave()', 'POST', 1, 'admin', '研发部门', '/web/carousel/add', '127.0.0.1', '内网IP', '{\"lbPictureName\":[\"轮播1\"],\"lbCreateTime\":[\"2024-04-14\"],\"lbIsUse\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-14 17:54:15', 1064);
INSERT INTO `sys_oper_log` VALUES (173, '首页轮播', 3, 'com.tea.web.controller.LbHomeCarouselController.remove()', 'POST', 1, 'admin', '研发部门', '/web/carousel/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"18\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-14 17:54:25', 7);
INSERT INTO `sys_oper_log` VALUES (174, '首页轮播', 3, 'com.tea.web.controller.LbHomeCarouselController.remove()', 'POST', 1, 'admin', '研发部门', '/web/carousel/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"17\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-14 17:54:28', 10);
INSERT INTO `sys_oper_log` VALUES (175, '首页轮播', 3, 'com.tea.web.controller.LbHomeCarouselController.remove()', 'POST', 1, 'admin', '研发部门', '/web/carousel/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"19\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-14 17:54:31', 5);
INSERT INTO `sys_oper_log` VALUES (176, '首页轮播', 3, 'com.tea.web.controller.LbHomeCarouselController.remove()', 'POST', 1, 'admin', '研发部门', '/web/carousel/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"16\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-14 17:58:12', 10);
INSERT INTO `sys_oper_log` VALUES (177, '首页轮播', 1, 'com.tea.web.controller.LbHomeCarouselController.addSave()', 'POST', 1, 'admin', '研发部门', '/web/carousel/add', '127.0.0.1', '内网IP', '{\"lbPictureName\":[\"轮播1\"],\"lbCreateTime\":[\"2024-04-14\"],\"lbIsUse\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-14 17:58:35', 8364);
INSERT INTO `sys_oper_log` VALUES (178, '首页轮播', 1, 'com.tea.web.controller.LbHomeCarouselController.addSave()', 'POST', 1, 'admin', '研发部门', '/web/carousel/add', '127.0.0.1', '内网IP', '{\"lbPictureName\":[\"轮播1\"],\"lbCreateTime\":[\"2024-04-14\"],\"lbIsUse\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-14 17:58:35', 2476);
INSERT INTO `sys_oper_log` VALUES (179, '首页轮播', 1, 'com.tea.web.controller.LbHomeCarouselController.addSave()', 'POST', 1, 'admin', '研发部门', '/web/carousel/add', '127.0.0.1', '内网IP', '{\"lbPictureName\":[\"轮播1\"],\"lbCreateTime\":[\"2024-04-14\"],\"lbIsUse\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-14 17:58:35', 1676);
INSERT INTO `sys_oper_log` VALUES (180, '首页轮播', 1, 'com.tea.web.controller.LbHomeCarouselController.addSave()', 'POST', 1, 'admin', '研发部门', '/web/carousel/add', '127.0.0.1', '内网IP', '{\"lbPictureName\":[\"轮播1\"],\"lbCreateTime\":[\"2024-04-14\"],\"lbIsUse\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-14 17:58:35', 2479);
INSERT INTO `sys_oper_log` VALUES (181, '首页轮播', 1, 'com.tea.web.controller.LbHomeCarouselController.addSave()', 'POST', 1, 'admin', '研发部门', '/web/carousel/add', '127.0.0.1', '内网IP', '{\"lbPictureName\":[\"轮播1\"],\"lbCreateTime\":[\"2024-04-14\"],\"lbIsUse\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-14 17:58:35', 2479);
INSERT INTO `sys_oper_log` VALUES (182, '首页轮播', 3, 'com.tea.web.controller.LbHomeCarouselController.remove()', 'POST', 1, 'admin', '研发部门', '/web/carousel/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"20\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-14 17:58:41', 6);
INSERT INTO `sys_oper_log` VALUES (183, '首页轮播', 3, 'com.tea.web.controller.LbHomeCarouselController.remove()', 'POST', 1, 'admin', '研发部门', '/web/carousel/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"21\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-14 17:58:44', 6);
INSERT INTO `sys_oper_log` VALUES (184, '首页轮播', 3, 'com.tea.web.controller.LbHomeCarouselController.remove()', 'POST', 1, 'admin', '研发部门', '/web/carousel/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"22\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-14 17:58:46', 10);
INSERT INTO `sys_oper_log` VALUES (185, '首页轮播', 3, 'com.tea.web.controller.LbHomeCarouselController.remove()', 'POST', 1, 'admin', '研发部门', '/web/carousel/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"23\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-14 17:58:49', 10);
INSERT INTO `sys_oper_log` VALUES (186, '首页轮播', 1, 'com.tea.web.controller.LbHomeCarouselController.addSave()', 'POST', 1, 'admin', '研发部门', '/web/carousel/add', '127.0.0.1', '内网IP', '{\"lbPictureName\":[\"轮播1\"],\"lbCreateTime\":[\"2024-04-14\"],\"lbIsUse\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-14 18:03:54', 1276);
INSERT INTO `sys_oper_log` VALUES (187, '首页轮播', 1, 'com.tea.web.controller.LbHomeCarouselController.addSave()', 'POST', 1, 'admin', '研发部门', '/web/carousel/add', '127.0.0.1', '内网IP', '{\"lbPictureName\":[\"轮播1\"],\"lbCreateTime\":[\"2024-04-14\"],\"lbIsUse\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-14 18:03:54', 1276);
INSERT INTO `sys_oper_log` VALUES (188, '首页轮播', 1, 'com.tea.web.controller.LbHomeCarouselController.addSave()', 'POST', 1, 'admin', '研发部门', '/web/carousel/add', '127.0.0.1', '内网IP', '{\"lbPictureName\":[\"轮播1\"],\"lbCreateTime\":[\"2024-04-14\"],\"lbIsUse\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-14 18:03:54', 10221);
INSERT INTO `sys_oper_log` VALUES (189, '首页轮播', 3, 'com.tea.web.controller.LbHomeCarouselController.remove()', 'POST', 1, 'admin', '研发部门', '/web/carousel/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"24\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-14 18:04:00', 13);
INSERT INTO `sys_oper_log` VALUES (190, '首页轮播', 3, 'com.tea.web.controller.LbHomeCarouselController.remove()', 'POST', 1, 'admin', '研发部门', '/web/carousel/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"25\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-14 18:04:03', 11);
INSERT INTO `sys_oper_log` VALUES (191, '首页轮播', 3, 'com.tea.web.controller.LbHomeCarouselController.remove()', 'POST', 1, 'admin', '研发部门', '/web/carousel/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"26\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-14 18:04:07', 11);
INSERT INTO `sys_oper_log` VALUES (192, '首页轮播', 3, 'com.tea.web.controller.LbHomeCarouselController.remove()', 'POST', 1, 'admin', '研发部门', '/web/carousel/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"27\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-14 18:04:41', 6);
INSERT INTO `sys_oper_log` VALUES (193, '首页轮播', 1, 'com.tea.web.controller.LbHomeCarouselController.addSave()', 'POST', 1, 'admin', '研发部门', '/web/carousel/add', '127.0.0.1', '内网IP', '{\"lbPictureName\":[\"轮播1\"],\"lbCreateTime\":[\"2024-04-14\"],\"lbIsUse\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-14 18:04:56', 15);
INSERT INTO `sys_oper_log` VALUES (194, '首页轮播', 1, 'com.tea.web.controller.LbHomeCarouselController.addSave()', 'POST', 1, 'admin', '研发部门', '/web/carousel/add', '127.0.0.1', '内网IP', '{\"lbPictureName\":[\"轮播2\"],\"lbCreateTime\":[\"2024-04-14\"],\"lbIsUse\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-14 18:05:14', 20);
INSERT INTO `sys_oper_log` VALUES (195, '首页轮播', 3, 'com.tea.web.controller.LbHomeCarouselController.remove()', 'POST', 1, 'admin', '研发部门', '/web/carousel/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"28\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-15 10:39:27', 121);
INSERT INTO `sys_oper_log` VALUES (196, '首页轮播', 3, 'com.tea.web.controller.LbHomeCarouselController.remove()', 'POST', 1, 'admin', '研发部门', '/web/carousel/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"29\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-15 10:39:28', 6);
INSERT INTO `sys_oper_log` VALUES (197, '首页轮播', 1, 'com.tea.web.controller.LbHomeCarouselController.addSave()', 'POST', 1, 'admin', '研发部门', '/web/carousel/add', '127.0.0.1', '内网IP', '{\"lbPictureName\":[\"轮播1\"],\"lbCreateTime\":[\"2024-04-15\"],\"lbIsUse\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-15 10:39:37', 82);
INSERT INTO `sys_oper_log` VALUES (198, '首页轮播', 1, 'com.tea.web.controller.LbHomeCarouselController.addSave()', 'POST', 1, 'admin', '研发部门', '/web/carousel/add', '127.0.0.1', '内网IP', '{\"lbPictureName\":[\"轮播2\"],\"lbCreateTime\":[\"2024-04-15\"],\"lbIsUse\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-15 10:39:55', 24);
INSERT INTO `sys_oper_log` VALUES (199, '首页轮播', 1, 'com.tea.web.controller.LbHomeCarouselController.addSave()', 'POST', 1, 'admin', '研发部门', '/web/carousel/add', '127.0.0.1', '内网IP', '{\"lbPictureName\":[\"轮播1\"],\"lbCreateTime\":[\"2024-04-15\"],\"lbIsUse\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-15 10:43:20', 34167);
INSERT INTO `sys_oper_log` VALUES (200, '首页轮播', 1, 'com.tea.web.controller.LbHomeCarouselController.addSave()', 'POST', 1, 'admin', '研发部门', '/web/carousel/add', '127.0.0.1', '内网IP', '{\"lbPictureName\":[\"产品\"],\"lbCreateTime\":[\"2024-04-15\"],\"lbIsUse\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-15 10:50:43', 299894);
INSERT INTO `sys_oper_log` VALUES (201, '首页轮播', 1, 'com.tea.web.controller.LbHomeCarouselController.addSave()', 'POST', 1, 'admin', '研发部门', '/web/carousel/add', '127.0.0.1', '内网IP', '{\"lbPictureName\":[\"轮播1\"],\"lbCreateTime\":[\"2024-04-15\"],\"lbIsUse\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-15 10:52:09', 155);
INSERT INTO `sys_oper_log` VALUES (202, '首页轮播', 1, 'com.tea.web.controller.LbHomeCarouselController.addSave()', 'POST', 1, 'admin', '研发部门', '/web/carousel/add', '127.0.0.1', '内网IP', '{\"lbPictureName\":[\"轮播1\"],\"lbCreateTime\":[\"2024-04-15\"],\"lbIsUse\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-15 10:53:36', 43634);
INSERT INTO `sys_oper_log` VALUES (203, '首页轮播', 1, 'com.tea.web.controller.LbHomeCarouselController.addSave()', 'POST', 1, 'admin', '研发部门', '/web/carousel/add', '127.0.0.1', '内网IP', '{\"lbPictureName\":[\"轮播1\"],\"lbCreateTime\":[\"2024-04-15\"],\"lbIsUse\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-15 10:55:03', 153);
INSERT INTO `sys_oper_log` VALUES (204, '首页轮播', 1, 'com.tea.web.controller.LbHomeCarouselController.addSave()', 'POST', 1, 'admin', '研发部门', '/web/carousel/add', '127.0.0.1', '内网IP', '{\"lbPictureName\":[\"轮播2\"],\"lbCreateTime\":[\"2024-04-15\"],\"lbIsUse\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-15 11:29:07', 153);
INSERT INTO `sys_oper_log` VALUES (205, '菜单管理', 2, 'com.tea.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"110\"],\"parentId\":[\"2\"],\"menuType\":[\"C\"],\"menuName\":[\"定时任务\"],\"url\":[\"/monitor/job\"],\"target\":[\"menuItem\"],\"perms\":[\"monitor:job:view\"],\"orderNum\":[\"2\"],\"icon\":[\"fa fa-tasks\"],\"visible\":[\"0\"],\"isRefresh\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2024-04-15 14:02:26', 31);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2024-04-13 14:27:31', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2024-04-13 14:27:31', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2024-04-13 14:27:31', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2024-04-13 14:27:31', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', '0', '0', 'admin', '2024-04-13 14:27:31', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', '0', '0', 'admin', '2024-04-13 14:27:31', 'admin', '2024-04-13 16:45:17', '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

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
INSERT INTO `sys_role_menu` VALUES (2, 1061);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
  `login_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '登录账号',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户 01注册用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '头像路径',
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '盐加密',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `pwd_update_date` datetime NULL DEFAULT NULL COMMENT '密码最后更新时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '苏学豪', '00', 'sxh@163.com', '15888888888', '0', '/profile/avatar/2024/04/13/blob_20240413203128A001.png', '69ed0ab7d2116191283f2d746d8d8f3c', '1213ed', '0', '0', '127.0.0.1', '2024-05-07 16:02:30', '2024-04-13 21:11:00', 'admin', '2024-04-13 14:27:31', '', '2024-05-07 16:02:29', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '8e6d98b90472783cc73c17047ddccf36', '222222', '0', '0', '127.0.0.1', NULL, NULL, 'admin', '2024-04-13 14:27:31', '', NULL, '测试员');
INSERT INTO `sys_user` VALUES (100, NULL, 'zs', 'zs', '01', '', '', '0', '', 'd6167351f7a349d9af62591e484985b2', '44ae04', '0', '0', '127.0.0.1', '2024-04-13 20:35:11', '2024-04-13 20:35:02', '', '2024-04-13 20:35:02', '', '2024-04-13 20:35:11', NULL);
INSERT INTO `sys_user` VALUES (101, NULL, 'test', 'test', '01', '', '', '0', '', '8afe35663daa0513642df782215e4555', '508332', '0', '0', '127.0.0.1', '2024-04-23 15:49:26', '2024-04-23 15:49:18', '', '2024-04-23 15:49:17', '', '2024-04-23 15:49:26', NULL);

-- ----------------------------
-- Table structure for sys_user_online
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_online`;
CREATE TABLE `sys_user_online`  (
  `sessionId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '用户会话id',
  `login_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录账号',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '在线状态on_line在线off_line离线',
  `start_timestamp` datetime NULL DEFAULT NULL COMMENT 'session创建时间',
  `last_access_time` datetime NULL DEFAULT NULL COMMENT 'session最后访问时间',
  `expire_time` int NULL DEFAULT 0 COMMENT '超时时间，单位为分钟',
  PRIMARY KEY (`sessionId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '在线用户记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_online
-- ----------------------------
INSERT INTO `sys_user_online` VALUES ('c45f1dd5-72d1-48fb-9e26-1eb4ea31c540', 'admin', '研发部门', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', 'on_line', '2024-05-07 16:02:26', '2024-05-07 16:02:30', 1800000);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);

SET FOREIGN_KEY_CHECKS = 1;
