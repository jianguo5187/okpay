/*
 Navicat Premium Data Transfer

 Source Server         : localhost(okpay)
 Source Server Type    : MySQL
 Source Server Version : 50726 (5.7.26)
 Source Host           : localhost:3306
 Source Schema         : okpay

 Target Server Type    : MySQL
 Target Server Version : 50726 (5.7.26)
 File Encoding         : 65001

 Date: 02/03/2024 16:40:22
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `tpl_web_type` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
  `package_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (1, 'sys_chat', '聊天信息表', NULL, NULL, 'SysChat', 'crud', '', 'com.ruoyi.system', 'system', 'chat', '聊天信息', 'ruoyi', '0', '/', NULL, 'admin', '2024-01-02 21:33:06', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (5, 'sys_buy_coin', '买币表', NULL, NULL, 'SysBuyCoin', 'crud', 'element-ui', 'com.ruoyi.system', 'system', 'buyCoin', '买币', 'ruoyi', '0', '/', '{}', 'admin', '2024-01-13 15:35:46', '', '2024-01-13 15:48:35', NULL);
INSERT INTO `gen_table` VALUES (13, 'sys_notice_user', '公告和用户关联表', NULL, NULL, 'SysNoticeUser', 'crud', '', 'com.ruoyi.system', 'system', 'user', '公告和用户关联', 'ruoyi', '0', '/', NULL, 'admin', '2024-01-21 19:14:31', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (15, 'sys_sale_coin', '卖币表', NULL, NULL, 'SysSaleCoin', 'crud', 'element-ui', 'com.ruoyi.system', 'system', 'saleCoin', '卖币', 'ruoyi', '0', '/', '{}', 'admin', '2024-01-22 13:31:02', '', '2024-01-22 13:31:10', NULL);
INSERT INTO `gen_table` VALUES (17, 'sys_recharge', '充值表', NULL, NULL, 'SysRecharge', 'crud', '', 'com.ruoyi.system', 'system', 'recharge', '充值', 'ruoyi', '0', '/', NULL, 'admin', '2024-02-02 23:28:53', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (18, 'sys_transaction_record', '交易记录表', NULL, NULL, 'SysTransactionRecord', 'crud', 'element-ui', 'com.ruoyi.system', 'system', 'transactionRecord', '交易记录', 'ruoyi', '0', '/', '{}', 'admin', '2024-02-02 23:29:12', '', '2024-02-02 23:29:17', NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint(20) NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 202 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (1, 1, 'chat_id', '角色ID', 'bigint(20)', 'Long', 'chatId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-01-02 21:33:06', '', NULL);
INSERT INTO `gen_table_column` VALUES (2, 1, 'from_user_id', '信息发送用户ID', 'bigint(20)', 'Long', 'fromUserId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-01-02 21:33:06', '', NULL);
INSERT INTO `gen_table_column` VALUES (3, 1, 'to_user_id', '信息接收用户ID', 'bigint(20)', 'Long', 'toUserId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-01-02 21:33:06', '', NULL);
INSERT INTO `gen_table_column` VALUES (4, 1, 'content', '信息内容', 'varchar(3000)', 'String', 'content', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'editor', '', 4, 'admin', '2024-01-02 21:33:06', '', NULL);
INSERT INTO `gen_table_column` VALUES (5, 1, 'is_read', '是否已读(0 未读 1已读)', 'char(1)', 'String', 'isRead', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2024-01-02 21:33:06', '', NULL);
INSERT INTO `gen_table_column` VALUES (6, 1, 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 6, 'admin', '2024-01-02 21:33:06', '', NULL);
INSERT INTO `gen_table_column` VALUES (7, 1, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 7, 'admin', '2024-01-02 21:33:06', '', NULL);
INSERT INTO `gen_table_column` VALUES (51, 5, 'buy_id', '买币ID', 'bigint(20)', 'Long', 'buyId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-01-13 15:35:46', '', '2024-01-13 15:48:35');
INSERT INTO `gen_table_column` VALUES (52, 5, 'sale_id', '卖币ID', 'bigint(20)', 'Long', 'saleId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-01-13 15:35:46', '', '2024-01-13 15:48:35');
INSERT INTO `gen_table_column` VALUES (53, 5, 'sale_user_id', '卖币用户ID', 'bigint(20)', 'Long', 'saleUserId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-01-13 15:35:46', '', '2024-01-13 15:48:35');
INSERT INTO `gen_table_column` VALUES (54, 5, 'buy_user_id', '买币用户ID', 'bigint(20)', 'Long', 'buyUserId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2024-01-13 15:35:46', '', '2024-01-13 15:48:35');
INSERT INTO `gen_table_column` VALUES (55, 5, 'buy_time', '买币时间', 'datetime', 'Date', 'buyTime', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 5, 'admin', '2024-01-13 15:35:46', '', '2024-01-13 15:48:35');
INSERT INTO `gen_table_column` VALUES (56, 5, 'buy_type', '支付方式（0支付宝 1微信 2银联）', 'varchar(50)', 'String', 'buyType', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', '', 6, 'admin', '2024-01-13 15:35:46', '', '2024-01-13 15:48:35');
INSERT INTO `gen_table_column` VALUES (57, 5, 'buy_amount', '买币金额', 'float(10,2)', 'BigDecimal', 'buyAmount', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2024-01-13 15:35:46', '', '2024-01-13 15:48:35');
INSERT INTO `gen_table_column` VALUES (58, 5, 'status', '买币状态（0进行中 1买家已付款 2卖家已确认(买币完成) 9已取消）', 'char(1)', 'String', 'status', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', '', 8, 'admin', '2024-01-13 15:35:46', '', '2024-01-13 15:48:35');
INSERT INTO `gen_table_column` VALUES (59, 5, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 9, 'admin', '2024-01-13 15:35:46', '', '2024-01-13 15:48:35');
INSERT INTO `gen_table_column` VALUES (60, 5, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 10, 'admin', '2024-01-13 15:35:46', '', '2024-01-13 15:48:35');
INSERT INTO `gen_table_column` VALUES (61, 5, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 11, 'admin', '2024-01-13 15:35:46', '', '2024-01-13 15:48:35');
INSERT INTO `gen_table_column` VALUES (62, 5, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 12, 'admin', '2024-01-13 15:35:46', '', '2024-01-13 15:48:35');
INSERT INTO `gen_table_column` VALUES (63, 5, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'textarea', '', 13, 'admin', '2024-01-13 15:35:46', '', '2024-01-13 15:48:35');
INSERT INTO `gen_table_column` VALUES (126, 13, 'notice_id', '公告ID', 'bigint(20)', 'Long', 'noticeId', '1', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-01-21 19:14:31', '', NULL);
INSERT INTO `gen_table_column` VALUES (127, 13, 'user_id', '用户ID', 'bigint(20)', 'Long', 'userId', '1', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 2, 'admin', '2024-01-21 19:14:31', '', NULL);
INSERT INTO `gen_table_column` VALUES (142, 15, 'sale_id', '卖币ID', 'bigint(20)', 'Long', 'saleId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-01-22 13:31:02', '', '2024-01-22 13:31:10');
INSERT INTO `gen_table_column` VALUES (143, 15, 'sale_no', '卖币No', 'varchar(3000)', 'String', 'saleNo', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 2, 'admin', '2024-01-22 13:31:02', '', '2024-01-22 13:31:10');
INSERT INTO `gen_table_column` VALUES (144, 15, 'sale_time', '卖币时间', 'datetime', 'Date', 'saleTime', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 3, 'admin', '2024-01-22 13:31:02', '', '2024-01-22 13:31:10');
INSERT INTO `gen_table_column` VALUES (145, 15, 'sale_user_id', '卖币用户ID', 'bigint(20)', 'Long', 'saleUserId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2024-01-22 13:31:02', '', '2024-01-22 13:31:10');
INSERT INTO `gen_table_column` VALUES (146, 15, 'sale_split_type', '卖币拆分类型（0不拆分 1拆分）', 'char(1)', 'String', 'saleSplitType', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', '', 5, 'admin', '2024-01-22 13:31:02', '', '2024-01-22 13:31:10');
INSERT INTO `gen_table_column` VALUES (147, 15, 'support_buy_type', '支持支付类型', 'varchar(50)', 'String', 'supportBuyType', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', '', 6, 'admin', '2024-01-22 13:31:03', '', '2024-01-22 13:31:10');
INSERT INTO `gen_table_column` VALUES (148, 15, 'sale_amount', '卖币金额', 'float(10,2)', 'BigDecimal', 'saleAmount', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2024-01-22 13:31:03', '', '2024-01-22 13:31:10');
INSERT INTO `gen_table_column` VALUES (149, 15, 'sale_amount_without_commission', '扣除手续费可交易金额', 'float(10,2)', 'BigDecimal', 'saleAmountWithoutCommission', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2024-01-22 13:31:03', '', '2024-01-22 13:31:10');
INSERT INTO `gen_table_column` VALUES (150, 15, 'commission_amount', '手续费', 'float(10,2)', 'BigDecimal', 'commissionAmount', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2024-01-22 13:31:03', '', '2024-01-22 13:31:10');
INSERT INTO `gen_table_column` VALUES (151, 15, 'remain_amount', '订单剩余金额', 'float(10,2)', 'BigDecimal', 'remainAmount', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2024-01-22 13:31:03', '', '2024-01-22 13:31:10');
INSERT INTO `gen_table_column` VALUES (152, 15, 'status', '卖币状态（0生成订单 1交易中 2已完成 9已取消）', 'char(1)', 'String', 'status', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', '', 11, 'admin', '2024-01-22 13:31:03', '', '2024-01-22 13:31:10');
INSERT INTO `gen_table_column` VALUES (153, 15, 'urgent_sale_flg', '加急状态（0否 1是）', 'char(1)', 'String', 'urgentSaleFlg', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 12, 'admin', '2024-01-22 13:31:03', '', '2024-01-22 13:31:10');
INSERT INTO `gen_table_column` VALUES (154, 15, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 13, 'admin', '2024-01-22 13:31:03', '', '2024-01-22 13:31:10');
INSERT INTO `gen_table_column` VALUES (155, 15, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 14, 'admin', '2024-01-22 13:31:03', '', '2024-01-22 13:31:10');
INSERT INTO `gen_table_column` VALUES (156, 15, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 15, 'admin', '2024-01-22 13:31:03', '', '2024-01-22 13:31:10');
INSERT INTO `gen_table_column` VALUES (157, 15, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 16, 'admin', '2024-01-22 13:31:03', '', '2024-01-22 13:31:10');
INSERT INTO `gen_table_column` VALUES (158, 15, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'textarea', '', 17, 'admin', '2024-01-22 13:31:03', '', '2024-01-22 13:31:10');
INSERT INTO `gen_table_column` VALUES (173, 17, 'recharge_id', '充值ID', 'bigint(20)', 'Long', 'rechargeId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-02-02 23:28:53', '', NULL);
INSERT INTO `gen_table_column` VALUES (174, 17, 'from_user_id', '充值用户ID', 'bigint(20)', 'Long', 'fromUserId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-02-02 23:28:53', '', NULL);
INSERT INTO `gen_table_column` VALUES (175, 17, 'to_user_id', '被充值用户ID', 'bigint(20)', 'Long', 'toUserId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2024-02-02 23:28:53', '', NULL);
INSERT INTO `gen_table_column` VALUES (176, 17, 'recharge_amount', '充值金额', 'float(10,2)', 'BigDecimal', 'rechargeAmount', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2024-02-02 23:28:53', '', NULL);
INSERT INTO `gen_table_column` VALUES (177, 17, 'recharge_time', '充值时间', 'datetime', 'Date', 'rechargeTime', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 5, 'admin', '2024-02-02 23:28:53', '', NULL);
INSERT INTO `gen_table_column` VALUES (178, 17, 'recharge_type', '充值方式（0支付宝 1微信 2银联 3余额）', 'varchar(50)', 'String', 'rechargeType', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', '', 6, 'admin', '2024-02-02 23:28:53', '', NULL);
INSERT INTO `gen_table_column` VALUES (179, 17, 'recharge_from_user_remian_amount', '充值用户充值后余额', 'float(10,2)', 'BigDecimal', 'rechargeFromUserRemianAmount', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2024-02-02 23:28:53', '', NULL);
INSERT INTO `gen_table_column` VALUES (180, 17, 'recharge_to_user_remian_amount', '被充值用户充值后余额', 'float(10,2)', 'BigDecimal', 'rechargeToUserRemianAmount', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2024-02-02 23:28:53', '', NULL);
INSERT INTO `gen_table_column` VALUES (181, 17, 'status', '充值状态（0进行中 1已确认(充值完成) 9已取消）', 'char(1)', 'String', 'status', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', '', 9, 'admin', '2024-02-02 23:28:53', '', NULL);
INSERT INTO `gen_table_column` VALUES (182, 17, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 10, 'admin', '2024-02-02 23:28:53', '', NULL);
INSERT INTO `gen_table_column` VALUES (183, 17, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 11, 'admin', '2024-02-02 23:28:53', '', NULL);
INSERT INTO `gen_table_column` VALUES (184, 17, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 12, 'admin', '2024-02-02 23:28:53', '', NULL);
INSERT INTO `gen_table_column` VALUES (185, 17, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 13, 'admin', '2024-02-02 23:28:53', '', NULL);
INSERT INTO `gen_table_column` VALUES (186, 17, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'textarea', '', 14, 'admin', '2024-02-02 23:28:53', '', NULL);
INSERT INTO `gen_table_column` VALUES (187, 18, 'record_id', '记录ID', 'bigint(20)', 'Long', 'recordId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2024-02-02 23:29:12', '', '2024-02-02 23:29:17');
INSERT INTO `gen_table_column` VALUES (188, 18, 'user_id', '交易用户ID', 'bigint(20)', 'Long', 'userId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2024-02-02 23:29:12', '', '2024-02-02 23:29:17');
INSERT INTO `gen_table_column` VALUES (189, 18, 'record_time', '交易时间', 'datetime', 'Date', 'recordTime', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 3, 'admin', '2024-02-02 23:29:12', '', '2024-02-02 23:29:17');
INSERT INTO `gen_table_column` VALUES (190, 18, 'record_type', '交易类型（0买币 1卖币 2商家直充 3充值From方 4充值到商户(提现) 5手续费 6充值To方）', 'char(1)', 'String', 'recordType', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', '', 4, 'admin', '2024-02-02 23:29:12', '', '2024-02-02 23:29:17');
INSERT INTO `gen_table_column` VALUES (191, 18, 'buy_id', '买币ID', 'bigint(20)', 'Long', 'buyId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2024-02-02 23:29:12', '', '2024-02-02 23:29:17');
INSERT INTO `gen_table_column` VALUES (192, 18, 'sale_id', '卖币ID', 'bigint(20)', 'Long', 'saleId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2024-02-02 23:29:12', '', '2024-02-02 23:29:17');
INSERT INTO `gen_table_column` VALUES (193, 18, 'recharge_id', '充值ID', 'bigint(20)', 'Long', 'rechargeId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2024-02-02 23:29:12', '', '2024-02-02 23:29:17');
INSERT INTO `gen_table_column` VALUES (194, 18, 'record_amount', '交易金额', 'float(10,2)', 'BigDecimal', 'recordAmount', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2024-02-02 23:29:12', '', '2024-02-02 23:29:17');
INSERT INTO `gen_table_column` VALUES (195, 18, 'user_remain_amount', '交易后余额', 'float(10,2)', 'BigDecimal', 'userRemainAmount', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2024-02-02 23:29:12', '', '2024-02-02 23:29:17');
INSERT INTO `gen_table_column` VALUES (196, 18, 'status', '记录状态（0正常 1取消 9临时创建）', 'char(1)', 'String', 'status', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', '', 10, 'admin', '2024-02-02 23:29:12', '', '2024-02-02 23:29:17');
INSERT INTO `gen_table_column` VALUES (197, 18, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 11, 'admin', '2024-02-02 23:29:12', '', '2024-02-02 23:29:17');
INSERT INTO `gen_table_column` VALUES (198, 18, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 12, 'admin', '2024-02-02 23:29:12', '', '2024-02-02 23:29:17');
INSERT INTO `gen_table_column` VALUES (199, 18, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 13, 'admin', '2024-02-02 23:29:12', '', '2024-02-02 23:29:17');
INSERT INTO `gen_table_column` VALUES (200, 18, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 14, 'admin', '2024-02-02 23:29:12', '', '2024-02-02 23:29:17');
INSERT INTO `gen_table_column` VALUES (201, 18, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'textarea', '', 15, 'admin', '2024-02-02 23:29:12', '', '2024-02-02 23:29:17');

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '日历信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint(13) NOT NULL COMMENT '触发的时间',
  `sched_time` bigint(13) NOT NULL COMMENT '定时器制定的时间',
  `priority` int(11) NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '已触发的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '任务详细信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '暂停的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint(13) NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint(13) NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '调度器状态表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint(7) NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint(12) NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint(10) NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int(11) NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int(11) NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint(20) NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint(20) NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint(13) NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint(13) NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int(11) NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint(13) NOT NULL COMMENT '开始时间',
  `end_time` bigint(13) NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint(2) NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name`, `job_name`, `job_group`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '触发器详细信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for sys_buy_coin
-- ----------------------------
DROP TABLE IF EXISTS `sys_buy_coin`;
CREATE TABLE `sys_buy_coin`  (
  `buy_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '买币ID',
  `sale_id` bigint(20) NOT NULL COMMENT '卖币ID',
  `sale_user_id` bigint(20) NOT NULL COMMENT '卖币用户ID',
  `buy_user_id` bigint(20) NOT NULL COMMENT '买币用户ID',
  `buy_time` datetime NULL DEFAULT NULL COMMENT '买币时间',
  `buy_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '支付方式（0支付宝 1微信 2银联）',
  `buy_amount` float(10, 2) NULL DEFAULT 0.00 COMMENT '买币金额',
  `buy_voucher` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付凭证',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '买币状态（0进行中 1买家已付款 2卖家已确认(买币完成) 3卖家已确认 9已取消）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`buy_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '买币表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_buy_coin
-- ----------------------------
INSERT INTO `sys_buy_coin` VALUES (4, 9, 7, 11, '2024-01-23 15:17:23', '2', 100.00, NULL, '2', '', '2024-01-23 15:17:23', 'liao3', '2024-01-23 15:24:14', NULL);
INSERT INTO `sys_buy_coin` VALUES (5, 10, 11, 7, '2024-01-23 15:31:36', '0', 47.50, NULL, '2', 'liao3', '2024-01-23 15:31:36', '', NULL, NULL);
INSERT INTO `sys_buy_coin` VALUES (6, 13, 7, 11, '2024-01-23 18:53:31', '1', 180.00, '/profile/avatar/2024/01/07/头像2_20240107111704A002.png', '2', 'kehu1', '2024-01-23 18:53:31', 'liao3', '2024-02-27 21:17:09', NULL);
INSERT INTO `sys_buy_coin` VALUES (10, 11, 11, 7, '2024-01-23 19:36:55', '0', 10.00, NULL, '2', 'liao3', '2024-01-23 19:36:55', '', NULL, NULL);
INSERT INTO `sys_buy_coin` VALUES (11, 15, 10, 11, '2024-02-27 21:42:30', '1', 70.00, '/profile/avatar/2024/01/07/头像2_20240107111704A002.png', '2', 'kehu1', '2024-02-27 21:42:30', 'admin', '2024-02-27 22:25:24', NULL);
INSERT INTO `sys_buy_coin` VALUES (12, 14, 11, 10, '2024-02-28 22:30:25', '1', 20.00, NULL, '9', 'agent1', '2024-02-28 22:30:25', 'agent1', '2024-02-28 23:53:55', NULL);
INSERT INTO `sys_buy_coin` VALUES (13, 14, 11, 10, '2024-02-28 23:54:05', '1', 20.00, NULL, '9', 'agent1', '2024-02-28 23:54:05', 'agent1', '2024-02-28 23:57:28', NULL);
INSERT INTO `sys_buy_coin` VALUES (14, 14, 11, 10, '2024-02-28 23:57:33', '1', 20.00, NULL, '9', 'agent1', '2024-02-28 23:57:33', 'agent1', '2024-02-28 23:57:39', NULL);
INSERT INTO `sys_buy_coin` VALUES (15, 15, 10, 11, '2024-02-29 20:02:10', '1', 20.00, NULL, '9', 'kehu1', '2024-02-29 20:02:10', 'agent1', '2024-02-29 20:11:21', NULL);
INSERT INTO `sys_buy_coin` VALUES (16, 15, 10, 11, '2024-02-29 20:10:50', '1', 20.00, NULL, '9', 'kehu1', '2024-02-29 20:10:50', 'AUTO', '2024-02-29 20:14:00', NULL);
INSERT INTO `sys_buy_coin` VALUES (17, 15, 10, 11, '2024-02-29 20:21:01', '1', 15.00, '/profile/upload/2024/02/29/image_20240229202252A001.jpeg', '2', 'kehu1', '2024-02-29 20:21:01', 'kehu1', '2024-02-29 20:22:52', NULL);
INSERT INTO `sys_buy_coin` VALUES (18, 15, 10, 11, '2024-02-29 20:38:36', '1', 5.00, '/profile/upload/2024/02/29/image_20240229203954A001.jpeg', '2', 'kehu1', '2024-02-29 20:38:36', 'AUTO', '2024-02-29 20:41:54', NULL);
INSERT INTO `sys_buy_coin` VALUES (19, 18, 10, 11, '2024-02-29 20:50:59', '1', 90.00, '/profile/upload/2024/02/29/image_20240229205157A001.jpeg', '2', 'kehu1', '2024-02-29 20:50:59', 'AUTO_FINISH', '2024-02-29 20:53:42', NULL);
INSERT INTO `sys_buy_coin` VALUES (20, 19, 10, 11, '2024-02-29 20:56:56', '1', 20.00, '/profile/upload/2024/02/29/image_20240229210319A001.jpeg', '2', 'kehu1', '2024-02-29 20:56:56', 'agent1', '2024-02-29 21:04:02', NULL);

-- ----------------------------
-- Table structure for sys_chat
-- ----------------------------
DROP TABLE IF EXISTS `sys_chat`;
CREATE TABLE `sys_chat`  (
  `chat_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `from_user_id` bigint(20) NOT NULL COMMENT '信息发送用户ID',
  `to_user_id` bigint(20) NOT NULL COMMENT '信息接收用户ID',
  `content` varchar(3000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '信息内容',
  `is_read` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '是否已读(0 未读 1已读)',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  PRIMARY KEY (`chat_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '聊天信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_chat
-- ----------------------------
INSERT INTO `sys_chat` VALUES (1, 3, 1, '你好呀2', '1', '0', '2024-01-02 22:11:34');
INSERT INTO `sys_chat` VALUES (2, 1, 3, '你好呀', '1', '0', '2024-01-02 22:11:35');
INSERT INTO `sys_chat` VALUES (3, 1, 3, 'hello', '1', '0', '2024-01-07 13:08:51');
INSERT INTO `sys_chat` VALUES (4, 2, 1, '你好呀', '1', '0', '2024-01-07 13:09:20');
INSERT INTO `sys_chat` VALUES (5, 2, 1, '你好呀44', '1', '0', '2024-01-07 13:46:06');
INSERT INTO `sys_chat` VALUES (6, 2, 1, '你好呀？', '1', '0', '2024-01-07 13:46:22');
INSERT INTO `sys_chat` VALUES (7, 1, 2, '你好呀', '1', '0', '2024-01-07 14:02:21');
INSERT INTO `sys_chat` VALUES (8, 2, 1, '你在干嘛', '1', '0', '2024-01-07 14:59:38');
INSERT INTO `sys_chat` VALUES (9, 2, 1, '在干嘛', '1', '0', '2024-01-07 15:00:29');
INSERT INTO `sys_chat` VALUES (10, 2, 1, '在干嘛？', '1', '0', '2024-01-07 15:01:22');
INSERT INTO `sys_chat` VALUES (11, 2, 1, '在干嘛?？', '1', '0', '2024-01-07 15:02:27');
INSERT INTO `sys_chat` VALUES (12, 1, 2, '在看书', '1', '0', '2024-01-07 15:04:04');
INSERT INTO `sys_chat` VALUES (13, 2, 1, '吃饭咯', '1', '0', '2024-01-07 15:28:48');
INSERT INTO `sys_chat` VALUES (14, 2, 1, '吃饭咯?', '1', '0', '2024-01-07 15:30:32');
INSERT INTO `sys_chat` VALUES (15, 2, 1, '吃饭', '1', '0', '2024-01-07 15:31:35');
INSERT INTO `sys_chat` VALUES (16, 1, 2, 'laile ', '1', '0', '2024-01-07 15:31:40');
INSERT INTO `sys_chat` VALUES (17, 2, 1, '吃饭', '1', '0', '2024-01-07 15:53:16');
INSERT INTO `sys_chat` VALUES (18, 2, 1, '吃饭?', '1', '0', '2024-01-07 15:53:37');
INSERT INTO `sys_chat` VALUES (19, 2, 1, '吃饭?', '1', '0', '2024-01-07 15:55:07');
INSERT INTO `sys_chat` VALUES (20, 2, 1, '吃?', '1', '0', '2024-01-07 15:56:17');
INSERT INTO `sys_chat` VALUES (21, 2, 1, '吃??', '1', '0', '2024-01-07 15:56:41');
INSERT INTO `sys_chat` VALUES (22, 2, 1, '吃1?', '1', '0', '2024-01-07 16:03:44');
INSERT INTO `sys_chat` VALUES (23, 1, 2, 'buchile', '0', '0', '2024-01-07 16:03:49');
INSERT INTO `sys_chat` VALUES (24, 2, 1, '吃1?', '1', '0', '2024-01-07 16:05:27');
INSERT INTO `sys_chat` VALUES (25, 2, 1, '吃ba', '1', '0', '2024-01-07 16:07:02');
INSERT INTO `sys_chat` VALUES (26, 2, 1, '吃', '1', '0', '2024-01-07 17:49:58');
INSERT INTO `sys_chat` VALUES (27, 1, 2, 'ZOU ', '0', '0', '2024-01-07 17:50:04');
INSERT INTO `sys_chat` VALUES (28, 2, 7, '你在干嘛', '1', '0', '2024-01-07 18:46:28');
INSERT INTO `sys_chat` VALUES (29, 7, 2, '测试代码呀', '1', '0', '2024-01-07 18:46:35');
INSERT INTO `sys_chat` VALUES (30, 7, 2, '你真厉害', '1', '0', '2024-01-07 18:46:46');
INSERT INTO `sys_chat` VALUES (31, 7, 2, '牛呀', '1', '0', '2024-01-07 18:47:07');
INSERT INTO `sys_chat` VALUES (32, 7, 11, '你好', '1', '0', '2024-01-21 10:48:00');
INSERT INTO `sys_chat` VALUES (33, 11, 7, '你好呀', '1', '0', '2024-01-21 10:48:48');
INSERT INTO `sys_chat` VALUES (34, 3, 2, '1231', '0', '0', '2024-01-31 21:32:04');
INSERT INTO `sys_chat` VALUES (35, 2, 3, '`12', '0', '0', '2024-01-31 21:32:19');
INSERT INTO `sys_chat` VALUES (36, 2, 3, '4444', '0', '0', '2024-01-31 21:32:28');
INSERT INTO `sys_chat` VALUES (37, 1, 2, '12312', '0', '0', '2024-02-03 00:09:58');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '参数配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2024-01-02 21:22:12', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2024-01-02 21:22:12', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2024-01-02 21:22:12', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'false', 'Y', 'admin', '2024-01-02 21:22:12', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2024-01-02 21:22:12', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (6, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2024-01-02 21:22:12', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父部门id',
  `user_id` bigint(20) NULL DEFAULT 0 COMMENT '商户用户ID',
  `ancestors` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 222 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, 2, '0', 'OKPAY平台', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-01-02 21:22:08', '', NULL);
INSERT INTO `sys_dept` VALUES (200, 100, 3, '0,100', '测试商户1', 0, NULL, NULL, NULL, '0', '0', 'admin', '2024-01-02 22:48:39', 'admin', '2024-02-26 22:51:31');
INSERT INTO `sys_dept` VALUES (201, 200, 0, '0,100,200', '测试商户1代理', 0, NULL, NULL, NULL, '0', '0', '', '2024-01-02 22:48:39', '', NULL);
INSERT INTO `sys_dept` VALUES (202, 201, 0, '0,100,200,201', '测试商户1客户', 0, NULL, NULL, NULL, '0', '0', '', '2024-01-04 23:05:25', '', NULL);
INSERT INTO `sys_dept` VALUES (207, 100, 4, '0,100', '测试商户2', 0, NULL, NULL, NULL, '0', '0', 'admin', '2024-01-04 23:05:25', '', NULL);
INSERT INTO `sys_dept` VALUES (208, 207, 0, '0,100,207', '测试商户2代理', 0, NULL, NULL, NULL, '0', '0', '', '2024-01-04 23:05:25', '', NULL);
INSERT INTO `sys_dept` VALUES (209, 208, 0, '0,100,207,208', '测试商户2客户', 0, NULL, NULL, NULL, '0', '0', '', '2024-01-04 23:05:25', '', NULL);
INSERT INTO `sys_dept` VALUES (216, 100, 7, '0,100', '测试商户3', 0, NULL, NULL, NULL, '0', '0', 'admin', '2024-01-04 23:20:29', 'admin', '2024-01-05 21:44:38');
INSERT INTO `sys_dept` VALUES (217, 216, 0, '0,100,216', '测试商户3代理', 0, NULL, NULL, NULL, '0', '0', '', '2024-01-04 23:20:29', '', NULL);
INSERT INTO `sys_dept` VALUES (218, 217, 0, '0,100,216,217', '测试商户3客户', 0, NULL, NULL, NULL, '0', '0', '', '2024-01-04 23:20:29', '', NULL);
INSERT INTO `sys_dept` VALUES (219, 100, 12, '0,100', '测试商户4', 0, NULL, NULL, NULL, '0', '0', 'okadmin', '2024-01-19 22:53:21', '', '2024-01-19 22:53:21');
INSERT INTO `sys_dept` VALUES (220, 219, 0, '0,100,219', '测试商户4代理', 0, NULL, NULL, NULL, '0', '0', '', '2024-01-19 22:53:21', '', NULL);
INSERT INTO `sys_dept` VALUES (221, 220, 0, '0,100,219,220', '测试商户4客户', 0, NULL, NULL, NULL, '0', '0', '', '2024-01-19 22:53:21', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 62 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典数据表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2024-01-02 21:22:11', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-01-02 21:22:11', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-01-02 21:22:11', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2024-01-02 21:22:11', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2024-01-02 21:22:11', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2024-01-02 21:22:11', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2024-01-02 21:22:11', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2024-01-02 21:22:11', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2024-01-02 21:22:11', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2024-01-02 21:22:11', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2024-01-02 21:22:11', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2024-01-02 21:22:11', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2024-01-02 21:22:11', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2024-01-02 21:22:11', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2024-01-02 21:22:11', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2024-01-02 21:22:11', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2024-01-02 21:22:11', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-01-02 21:22:11', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-01-02 21:22:11', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-01-02 21:22:11', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-01-02 21:22:11', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2024-01-02 21:22:11', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-01-02 21:22:11', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-01-02 21:22:11', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-01-02 21:22:11', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-01-02 21:22:11', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-01-02 21:22:11', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2024-01-02 21:22:11', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2024-01-02 21:22:11', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (30, 0, '不拆分', '0', 'sale_split_type', NULL, 'default', 'N', '0', 'admin', '2024-01-23 10:03:58', '', NULL, '不拆分');
INSERT INTO `sys_dict_data` VALUES (31, 1, '拆分', '1', 'sale_split_type', NULL, 'default', 'N', '0', 'admin', '2024-01-23 10:04:14', 'admin', '2024-01-23 10:04:19', '拆分');
INSERT INTO `sys_dict_data` VALUES (32, 0, '否', '0', 'urgent_sale_status', NULL, 'default', 'N', '0', 'admin', '2024-01-23 10:04:52', '', NULL, '不加急');
INSERT INTO `sys_dict_data` VALUES (33, 1, '是', '1', 'urgent_sale_status', NULL, 'default', 'N', '0', 'admin', '2024-01-23 10:05:03', 'admin', '2024-01-23 10:06:39', '加急');
INSERT INTO `sys_dict_data` VALUES (34, 0, '支付宝', '0', 'pay_type', NULL, 'default', 'N', '0', 'admin', '2024-01-23 10:05:57', '', NULL, '支付宝付款');
INSERT INTO `sys_dict_data` VALUES (35, 1, '微信', '1', 'pay_type', NULL, 'default', 'N', '0', 'admin', '2024-01-23 10:06:08', 'admin', '2024-01-23 10:06:28', '微信付款');
INSERT INTO `sys_dict_data` VALUES (36, 2, '银联', '2', 'pay_type', NULL, 'default', 'N', '0', 'admin', '2024-01-23 10:06:23', 'admin', '2024-01-23 10:09:52', '银联付款');
INSERT INTO `sys_dict_data` VALUES (37, 1, '交易中', '1', 'sale_status', NULL, 'default', 'N', '0', 'admin', '2024-01-23 12:22:58', 'admin', '2024-01-23 12:23:57', '卖币状态(交易中)');
INSERT INTO `sys_dict_data` VALUES (38, 2, '已完成', '2', 'sale_status', NULL, 'default', 'N', '0', 'admin', '2024-01-23 12:23:18', 'admin', '2024-01-23 12:23:49', '卖币状态(已完成)');
INSERT INTO `sys_dict_data` VALUES (39, 9, '已取消', '9', 'sale_status', NULL, 'default', 'N', '0', 'admin', '2024-01-23 12:23:44', '', NULL, '卖币状态(已取消)');
INSERT INTO `sys_dict_data` VALUES (40, 0, '买家未付款', '0', 'buy_status', NULL, 'default', 'N', '0', 'admin', '2024-01-23 17:58:45', 'admin', '2024-01-23 17:59:34', '买币状态(买家未付款)');
INSERT INTO `sys_dict_data` VALUES (41, 2, '买家已付款', '1', 'buy_status', NULL, 'default', 'N', '0', 'admin', '2024-01-23 17:59:17', 'admin', '2024-02-29 19:54:07', '买币状态(买家已付款)');
INSERT INTO `sys_dict_data` VALUES (42, 3, '卖家已收款', '2', 'buy_status', NULL, 'default', 'N', '0', 'admin', '2024-01-23 18:01:42', 'admin', '2024-02-29 19:54:16', '买币状态(卖家已收款)');
INSERT INTO `sys_dict_data` VALUES (43, 9, '已取消', '9', 'buy_status', NULL, 'default', 'N', '0', 'admin', '2024-01-23 18:02:22', '', NULL, '买币状态(已取消)');
INSERT INTO `sys_dict_data` VALUES (44, 0, '买币', '0', 'transaction_record_type', NULL, 'default', 'N', '0', 'admin', '2024-01-24 20:47:21', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (45, 1, '卖币', '1', 'transaction_record_type', NULL, 'default', 'N', '0', 'admin', '2024-01-24 20:47:29', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (46, 2, '商家直充', '2', 'transaction_record_type', NULL, 'default', 'N', '0', 'admin', '2024-01-24 20:47:52', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (47, 3, '充值扣款', '3', 'transaction_record_type', NULL, 'default', 'N', '0', 'admin', '2024-01-24 20:48:05', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (48, 4, '充值到商户', '4', 'transaction_record_type', NULL, 'default', 'N', '0', 'admin', '2024-01-24 20:48:19', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (49, 5, '卖币手续费', '5', 'transaction_record_type', NULL, 'default', 'N', '0', 'admin', '2024-01-24 20:48:32', 'admin', '2024-03-01 22:47:17', NULL);
INSERT INTO `sys_dict_data` VALUES (50, 6, '余额充值', '6', 'transaction_record_type', NULL, 'default', 'N', '0', 'admin', '2024-01-24 20:49:08', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (51, 1, '未审核', '0', 'pay_type_approve', NULL, 'default', 'N', '0', 'admin', '2024-02-29 11:50:03', 'admin', '2024-02-29 11:50:57', '未审核');
INSERT INTO `sys_dict_data` VALUES (52, 2, '承认成功', '1', 'pay_type_approve', NULL, 'default', 'N', '0', 'admin', '2024-02-29 11:50:25', 'admin', '2024-02-29 11:51:07', '承认成功');
INSERT INTO `sys_dict_data` VALUES (53, 9, '否认', '9', 'pay_type_approve', NULL, 'default', 'N', '0', 'admin', '2024-02-29 11:50:44', 'admin', '2024-02-29 11:51:12', '否认');
INSERT INTO `sys_dict_data` VALUES (54, 1, '卖家已确认', '3', 'buy_status', NULL, 'default', 'N', '0', 'admin', '2024-02-29 19:53:47', 'admin', '2024-02-29 19:54:25', '买币状态(买家已确认)');
INSERT INTO `sys_dict_data` VALUES (55, 1, '超级管理员', '00', 'user_type', NULL, 'default', 'N', '0', 'admin', '2024-03-01 22:08:30', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (56, 2, '平台管理员', '01', 'user_type', NULL, 'default', 'N', '0', 'admin', '2024-03-01 22:08:49', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (57, 3, '商户', '02', 'user_type', NULL, 'default', 'N', '0', 'admin', '2024-03-01 22:09:02', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (58, 4, '代理', '03', 'user_type', NULL, 'default', 'N', '0', 'admin', '2024-03-01 22:09:14', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (59, 5, '客户', '04', 'user_type', NULL, 'default', 'N', '0', 'admin', '2024-03-01 22:09:24', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (60, 7, '卖币取消退款', '7', 'transaction_record_type', NULL, 'default', 'N', '0', 'admin', '2024-03-01 22:47:01', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (61, 8, '充值手续费', '8', 'transaction_record_type', NULL, 'default', 'N', '0', 'admin', '2024-03-01 22:47:31', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典类型表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2024-01-02 21:22:11', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2024-01-02 21:22:11', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2024-01-02 21:22:11', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2024-01-02 21:22:11', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2024-01-02 21:22:11', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2024-01-02 21:22:11', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2024-01-02 21:22:11', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2024-01-02 21:22:11', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2024-01-02 21:22:11', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2024-01-02 21:22:11', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (11, '拆分类型', 'sale_split_type', '0', 'admin', '2024-01-23 09:55:05', '', NULL, '拆分列表');
INSERT INTO `sys_dict_type` VALUES (12, '支付方式', 'pay_type', '0', 'admin', '2024-01-23 10:02:16', '', NULL, '支付方式列表');
INSERT INTO `sys_dict_type` VALUES (13, '卖币加急状态', 'urgent_sale_status', '0', 'admin', '2024-01-23 10:02:45', '', NULL, '卖币加急状态列表');
INSERT INTO `sys_dict_type` VALUES (14, '卖币状态', 'sale_status', '0', 'admin', '2024-01-23 11:43:05', 'admin', '2024-01-23 11:43:15', '卖币状态列表');
INSERT INTO `sys_dict_type` VALUES (15, '买币状态', 'buy_status', '0', 'admin', '2024-01-23 17:57:51', '', NULL, '买币状态列表');
INSERT INTO `sys_dict_type` VALUES (16, '交易类型', 'transaction_record_type', '0', 'admin', '2024-01-24 20:46:20', 'admin', '2024-01-24 20:46:47', '交易类型列表');
INSERT INTO `sys_dict_type` VALUES (17, '支付方式承认状态', 'pay_type_approve', '0', 'admin', '2024-02-29 11:48:43', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (18, '用户类型', 'user_type', '0', 'admin', '2024-03-01 22:07:39', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2024-01-02 21:22:12', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2024-01-02 21:22:12', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2024-01-02 21:22:12', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status`) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 290 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统访问记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '1', '验证码已失效', '2024-01-02 21:22:55');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '1', '验证码已失效', '2024-01-02 21:23:58');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-02 21:25:18');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2024-01-02 21:25:26');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-01-03 00:05:31');
INSERT INTO `sys_logininfor` VALUES (105, 'liao1', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-03 00:05:36');
INSERT INTO `sys_logininfor` VALUES (106, 'liao1', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-01-03 00:06:23');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-03 00:06:27');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-01-03 00:06:51');
INSERT INTO `sys_logininfor` VALUES (109, 'liao1', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-03 00:06:55');
INSERT INTO `sys_logininfor` VALUES (110, 'liao1', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-01-03 00:07:07');
INSERT INTO `sys_logininfor` VALUES (111, 'testadmin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-01-03 00:07:12');
INSERT INTO `sys_logininfor` VALUES (112, 'testadmin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-01-03 00:07:26');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-03 00:07:34');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-01-03 00:08:04');
INSERT INTO `sys_logininfor` VALUES (115, 'testadmin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-03 00:08:16');
INSERT INTO `sys_logininfor` VALUES (116, 'testadmin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-01-03 00:08:38');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-03 00:08:41');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-01-03 00:09:01');
INSERT INTO `sys_logininfor` VALUES (119, 'testadmin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-03 00:09:05');
INSERT INTO `sys_logininfor` VALUES (120, 'testadmin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-01-03 00:10:45');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-03 00:10:49');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-01-03 00:11:22');
INSERT INTO `sys_logininfor` VALUES (123, 'testadmin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-03 00:11:28');
INSERT INTO `sys_logininfor` VALUES (124, 'testadmin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-01-03 00:12:02');
INSERT INTO `sys_logininfor` VALUES (125, 'okadmin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-03 00:12:06');
INSERT INTO `sys_logininfor` VALUES (126, 'okadmin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-01-03 00:12:43');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-04 21:54:36');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-01-04 23:41:44');
INSERT INTO `sys_logininfor` VALUES (129, 'liao2', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-04 23:41:51');
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-05 21:03:00');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2024-01-05 21:54:51');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-05 23:06:47');
INSERT INTO `sys_logininfor` VALUES (133, 'agent1', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '注册成功', '2024-01-05 23:38:31');
INSERT INTO `sys_logininfor` VALUES (134, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-05 23:39:15');
INSERT INTO `sys_logininfor` VALUES (135, 'agent1', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '注册成功', '2024-01-06 00:21:17');
INSERT INTO `sys_logininfor` VALUES (136, 'agent1', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '注册成功', '2024-01-06 00:23:59');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-06 00:24:03');
INSERT INTO `sys_logininfor` VALUES (138, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-06 19:42:13');
INSERT INTO `sys_logininfor` VALUES (139, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-01-06 19:42:33');
INSERT INTO `sys_logininfor` VALUES (140, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-06 19:42:38');
INSERT INTO `sys_logininfor` VALUES (141, 'agent1', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2024-01-06 19:57:11');
INSERT INTO `sys_logininfor` VALUES (142, 'agent1', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '1', '用户不存在/密码错误', '2024-01-06 19:59:02');
INSERT INTO `sys_logininfor` VALUES (143, 'agent1', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2024-01-06 19:59:19');
INSERT INTO `sys_logininfor` VALUES (144, 'agent1', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2024-01-06 20:04:09');
INSERT INTO `sys_logininfor` VALUES (145, 'agent1', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '退出成功', '2024-01-06 20:04:25');
INSERT INTO `sys_logininfor` VALUES (146, 'agent1', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2024-01-06 20:11:59');
INSERT INTO `sys_logininfor` VALUES (147, 'agent1', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2024-01-06 20:45:07');
INSERT INTO `sys_logininfor` VALUES (148, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-06 20:45:32');
INSERT INTO `sys_logininfor` VALUES (149, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-06 21:17:51');
INSERT INTO `sys_logininfor` VALUES (150, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-01-06 23:59:23');
INSERT INTO `sys_logininfor` VALUES (151, 'okadmin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-06 23:59:28');
INSERT INTO `sys_logininfor` VALUES (152, 'okadmin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-01-07 00:07:38');
INSERT INTO `sys_logininfor` VALUES (153, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-07 09:44:21');
INSERT INTO `sys_logininfor` VALUES (154, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-01-07 09:45:52');
INSERT INTO `sys_logininfor` VALUES (155, 'okadmin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-07 09:46:00');
INSERT INTO `sys_logininfor` VALUES (156, 'okadmin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-01-07 09:47:05');
INSERT INTO `sys_logininfor` VALUES (157, 'liao3', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-07 09:47:18');
INSERT INTO `sys_logininfor` VALUES (158, 'liao3', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-01-07 10:59:04');
INSERT INTO `sys_logininfor` VALUES (159, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-07 10:59:08');
INSERT INTO `sys_logininfor` VALUES (160, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-01-07 11:15:58');
INSERT INTO `sys_logininfor` VALUES (161, 'okadmin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-07 11:16:06');
INSERT INTO `sys_logininfor` VALUES (162, 'okadmin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-01-07 11:23:46');
INSERT INTO `sys_logininfor` VALUES (163, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-07 11:23:49');
INSERT INTO `sys_logininfor` VALUES (164, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-07 17:47:36');
INSERT INTO `sys_logininfor` VALUES (165, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-01-07 17:50:56');
INSERT INTO `sys_logininfor` VALUES (166, 'okadmin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-07 17:51:04');
INSERT INTO `sys_logininfor` VALUES (167, 'liao3', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-07 17:58:58');
INSERT INTO `sys_logininfor` VALUES (168, 'okadmin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-01-07 18:47:24');
INSERT INTO `sys_logininfor` VALUES (169, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-07 18:47:29');
INSERT INTO `sys_logininfor` VALUES (170, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-13 14:41:51');
INSERT INTO `sys_logininfor` VALUES (171, 'agent1', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2024-01-13 21:37:20');
INSERT INTO `sys_logininfor` VALUES (172, 'kehu1', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '注册成功', '2024-01-13 23:10:17');
INSERT INTO `sys_logininfor` VALUES (173, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-13 23:10:24');
INSERT INTO `sys_logininfor` VALUES (174, 'kehu1', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2024-01-13 23:11:02');
INSERT INTO `sys_logininfor` VALUES (175, 'kehu1', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2024-01-13 23:15:56');
INSERT INTO `sys_logininfor` VALUES (176, 'kehu1', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2024-01-14 16:31:13');
INSERT INTO `sys_logininfor` VALUES (177, 'agent1', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2024-01-14 16:42:36');
INSERT INTO `sys_logininfor` VALUES (178, 'agent1', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2024-01-17 19:45:34');
INSERT INTO `sys_logininfor` VALUES (179, 'agent1', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2024-01-17 20:29:19');
INSERT INTO `sys_logininfor` VALUES (180, 'agent1', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2024-01-19 20:15:02');
INSERT INTO `sys_logininfor` VALUES (181, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-19 21:15:02');
INSERT INTO `sys_logininfor` VALUES (182, 'agent1', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2024-01-19 22:33:45');
INSERT INTO `sys_logininfor` VALUES (183, 'kehu1', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2024-01-19 22:48:55');
INSERT INTO `sys_logininfor` VALUES (184, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-01-19 22:51:12');
INSERT INTO `sys_logininfor` VALUES (185, 'okadmin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-19 22:51:16');
INSERT INTO `sys_logininfor` VALUES (186, 'agent2', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '注册成功', '2024-01-19 22:54:35');
INSERT INTO `sys_logininfor` VALUES (187, 'kehu2', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '注册成功', '2024-01-19 22:56:12');
INSERT INTO `sys_logininfor` VALUES (188, 'kehu2', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2024-01-19 22:56:37');
INSERT INTO `sys_logininfor` VALUES (189, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-20 10:16:47');
INSERT INTO `sys_logininfor` VALUES (190, 'kehu2', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2024-01-20 10:23:17');
INSERT INTO `sys_logininfor` VALUES (191, 'kehu1', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2024-01-20 11:11:01');
INSERT INTO `sys_logininfor` VALUES (192, 'okadmin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-21 10:45:55');
INSERT INTO `sys_logininfor` VALUES (193, 'liao3', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-21 10:46:17');
INSERT INTO `sys_logininfor` VALUES (194, 'liao3', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-01-21 10:46:32');
INSERT INTO `sys_logininfor` VALUES (195, 'okadmin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-01-21 10:47:07');
INSERT INTO `sys_logininfor` VALUES (196, 'liao1', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-21 10:47:10');
INSERT INTO `sys_logininfor` VALUES (197, 'liao1', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-01-21 10:47:35');
INSERT INTO `sys_logininfor` VALUES (198, 'liao3', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-21 10:47:39');
INSERT INTO `sys_logininfor` VALUES (199, 'liao3', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-01-21 10:57:18');
INSERT INTO `sys_logininfor` VALUES (200, 'okadmin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-21 10:57:22');
INSERT INTO `sys_logininfor` VALUES (201, 'okadmin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-01-21 10:59:25');
INSERT INTO `sys_logininfor` VALUES (202, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-21 10:59:28');
INSERT INTO `sys_logininfor` VALUES (203, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-01-21 10:59:44');
INSERT INTO `sys_logininfor` VALUES (204, 'okadmin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-21 10:59:50');
INSERT INTO `sys_logininfor` VALUES (205, 'kehu1', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2024-01-21 15:46:49');
INSERT INTO `sys_logininfor` VALUES (206, 'kehu1', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2024-01-21 16:52:49');
INSERT INTO `sys_logininfor` VALUES (207, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-21 18:29:52');
INSERT INTO `sys_logininfor` VALUES (208, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-01-21 18:36:29');
INSERT INTO `sys_logininfor` VALUES (209, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-21 18:37:30');
INSERT INTO `sys_logininfor` VALUES (210, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '1', '用户不存在/密码错误', '2024-01-21 19:07:13');
INSERT INTO `sys_logininfor` VALUES (211, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2024-01-21 19:07:33');
INSERT INTO `sys_logininfor` VALUES (212, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-01-21 19:18:25');
INSERT INTO `sys_logininfor` VALUES (213, 'okadmin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-21 19:18:30');
INSERT INTO `sys_logininfor` VALUES (214, 'okadmin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-01-21 20:22:10');
INSERT INTO `sys_logininfor` VALUES (215, 'okadmin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-21 20:23:11');
INSERT INTO `sys_logininfor` VALUES (216, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-22 09:33:59');
INSERT INTO `sys_logininfor` VALUES (217, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-22 13:30:39');
INSERT INTO `sys_logininfor` VALUES (218, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-22 22:16:06');
INSERT INTO `sys_logininfor` VALUES (219, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-23 08:04:09');
INSERT INTO `sys_logininfor` VALUES (220, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2024-01-23 09:00:16');
INSERT INTO `sys_logininfor` VALUES (221, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-01-23 09:17:15');
INSERT INTO `sys_logininfor` VALUES (222, 'okadmin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2024-01-23 09:17:24');
INSERT INTO `sys_logininfor` VALUES (223, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2024-01-23 09:24:05');
INSERT INTO `sys_logininfor` VALUES (224, 'okadmin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-23 09:35:00');
INSERT INTO `sys_logininfor` VALUES (225, 'okadmin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-01-23 09:35:12');
INSERT INTO `sys_logininfor` VALUES (226, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-23 09:35:14');
INSERT INTO `sys_logininfor` VALUES (227, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-01-23 14:20:04');
INSERT INTO `sys_logininfor` VALUES (228, 'liao3', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-23 14:20:59');
INSERT INTO `sys_logininfor` VALUES (229, 'kehu1', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2024-01-23 14:56:32');
INSERT INTO `sys_logininfor` VALUES (230, 'liao3', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-01-23 15:05:34');
INSERT INTO `sys_logininfor` VALUES (231, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-23 15:05:37');
INSERT INTO `sys_logininfor` VALUES (232, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-01-23 15:16:34');
INSERT INTO `sys_logininfor` VALUES (233, 'liao3', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-23 15:16:40');
INSERT INTO `sys_logininfor` VALUES (234, 'liao3', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2024-01-23 15:20:47');
INSERT INTO `sys_logininfor` VALUES (235, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-23 17:55:29');
INSERT INTO `sys_logininfor` VALUES (236, 'kehu1', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2024-01-23 18:50:51');
INSERT INTO `sys_logininfor` VALUES (237, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-01-23 18:52:34');
INSERT INTO `sys_logininfor` VALUES (238, 'liao3', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-23 18:52:39');
INSERT INTO `sys_logininfor` VALUES (239, 'kehu1', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2024-01-24 18:48:21');
INSERT INTO `sys_logininfor` VALUES (240, 'kehu1', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2024-01-24 19:16:12');
INSERT INTO `sys_logininfor` VALUES (241, 'agent1', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2024-01-24 19:19:22');
INSERT INTO `sys_logininfor` VALUES (242, 'kehu1', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2024-01-24 19:23:08');
INSERT INTO `sys_logininfor` VALUES (243, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-24 19:28:44');
INSERT INTO `sys_logininfor` VALUES (244, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-01-24 21:02:37');
INSERT INTO `sys_logininfor` VALUES (245, 'liao3', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-01-24 21:02:42');
INSERT INTO `sys_logininfor` VALUES (246, 'liao3', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-01-24 22:52:33');
INSERT INTO `sys_logininfor` VALUES (247, 'kehu1', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2024-01-30 21:08:56');
INSERT INTO `sys_logininfor` VALUES (248, 'kehu1', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2024-01-31 20:48:03');
INSERT INTO `sys_logininfor` VALUES (249, 'okadmin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2024-01-31 21:34:10');
INSERT INTO `sys_logininfor` VALUES (250, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-02 23:01:32');
INSERT INTO `sys_logininfor` VALUES (251, 'kehu1', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2024-02-02 23:14:04');
INSERT INTO `sys_logininfor` VALUES (252, 'agent1', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2024-02-02 23:15:02');
INSERT INTO `sys_logininfor` VALUES (253, 'kehu1', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2024-02-04 18:13:25');
INSERT INTO `sys_logininfor` VALUES (254, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-26 22:47:57');
INSERT INTO `sys_logininfor` VALUES (255, 'kehu1', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2024-02-27 20:15:07');
INSERT INTO `sys_logininfor` VALUES (256, 'kehu1', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2024-02-27 20:17:31');
INSERT INTO `sys_logininfor` VALUES (257, 'agent1', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2024-02-27 20:21:44');
INSERT INTO `sys_logininfor` VALUES (258, 'kehu1', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2024-02-27 21:11:45');
INSERT INTO `sys_logininfor` VALUES (259, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-27 21:30:43');
INSERT INTO `sys_logininfor` VALUES (260, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-27 21:31:03');
INSERT INTO `sys_logininfor` VALUES (261, 'okadmin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-27 21:31:16');
INSERT INTO `sys_logininfor` VALUES (262, 'okadmin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-02-27 21:33:15');
INSERT INTO `sys_logininfor` VALUES (263, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-27 21:33:21');
INSERT INTO `sys_logininfor` VALUES (264, 'kehu1', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2024-02-27 21:34:43');
INSERT INTO `sys_logininfor` VALUES (265, 'agent1', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2024-02-27 21:35:18');
INSERT INTO `sys_logininfor` VALUES (266, 'kehu1', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2024-02-27 23:14:01');
INSERT INTO `sys_logininfor` VALUES (267, 'kehu1', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2024-02-27 23:14:15');
INSERT INTO `sys_logininfor` VALUES (268, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-27 23:15:39');
INSERT INTO `sys_logininfor` VALUES (269, 'kehu1', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2024-02-27 23:16:10');
INSERT INTO `sys_logininfor` VALUES (270, 'kehu1', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2024-02-27 23:17:12');
INSERT INTO `sys_logininfor` VALUES (271, 'kehu1', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2024-02-27 23:20:31');
INSERT INTO `sys_logininfor` VALUES (272, 'agent1', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2024-02-28 18:35:57');
INSERT INTO `sys_logininfor` VALUES (273, 'agent1', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2024-02-28 18:56:35');
INSERT INTO `sys_logininfor` VALUES (274, 'agent1', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2024-02-28 21:48:59');
INSERT INTO `sys_logininfor` VALUES (275, 'agent1', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2024-02-28 22:48:37');
INSERT INTO `sys_logininfor` VALUES (276, 'agent1', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2024-02-28 22:54:11');
INSERT INTO `sys_logininfor` VALUES (277, 'agent1', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2024-02-28 23:51:45');
INSERT INTO `sys_logininfor` VALUES (278, 'agent2', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2024-02-28 23:54:52');
INSERT INTO `sys_logininfor` VALUES (279, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-02-29 19:52:04');
INSERT INTO `sys_logininfor` VALUES (280, 'kehu1', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2024-02-29 20:01:22');
INSERT INTO `sys_logininfor` VALUES (281, 'agent1', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2024-02-29 20:02:48');
INSERT INTO `sys_logininfor` VALUES (282, 'okadmin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-01 22:05:41');
INSERT INTO `sys_logininfor` VALUES (283, 'okadmin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-03-01 22:06:55');
INSERT INTO `sys_logininfor` VALUES (284, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-01 22:06:59');
INSERT INTO `sys_logininfor` VALUES (285, 'kehu1', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2024-03-01 22:21:47');
INSERT INTO `sys_logininfor` VALUES (286, 'agent3', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '注册成功', '2024-03-01 22:58:29');
INSERT INTO `sys_logininfor` VALUES (287, 'kehu3', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '注册成功', '2024-03-01 22:59:10');
INSERT INTO `sys_logininfor` VALUES (288, 'kehu4', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '注册成功', '2024-03-01 22:59:28');
INSERT INTO `sys_logininfor` VALUES (289, 'kehu3', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '0', '登录成功', '2024-03-01 23:00:46');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` int(1) NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int(1) NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1070 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2024-01-02 21:22:09', 'admin', '2024-01-21 18:57:18', '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 3, 'monitor', NULL, '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2024-01-02 21:22:09', 'admin', '2024-01-23 08:08:27', '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 4, 'tool', NULL, '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2024-01-02 21:22:09', 'admin', '2024-01-23 08:08:24', '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, '若依官网', 0, 5, 'http://ruoyi.vip', NULL, '', 0, 0, 'M', '0', '0', '', 'guide', 'admin', '2024-01-02 21:22:09', 'admin', '2024-01-23 08:08:20', '若依官网地址');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2024-01-02 21:22:09', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2024-01-02 21:22:09', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2024-01-02 21:22:09', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '商户管理', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2024-01-02 21:22:09', 'admin', '2024-01-02 22:12:29', '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2024-01-02 21:22:09', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2024-01-02 21:22:09', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2024-01-02 21:22:09', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2024-01-02 21:22:09', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2024-01-02 21:22:09', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2024-01-02 21:22:09', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2024-01-02 21:22:09', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2024-01-02 21:22:09', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2024-01-02 21:22:09', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2024-01-02 21:22:09', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2024-01-02 21:22:09', '', NULL, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES (115, '表单构建', 3, 1, 'build', 'tool/build/index', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2024-01-02 21:22:09', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2024-01-02 21:22:09', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2024-01-02 21:22:09', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2024-01-02 21:22:09', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2024-01-02 21:22:09', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2024-01-02 21:22:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2024-01-02 21:22:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2024-01-02 21:22:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2024-01-02 21:22:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2024-01-02 21:22:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2024-01-02 21:22:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2024-01-02 21:22:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2024-01-02 21:22:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2024-01-02 21:22:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2024-01-02 21:22:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2024-01-02 21:22:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2024-01-02 21:22:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2024-01-02 21:22:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2024-01-02 21:22:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2024-01-02 21:22:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2024-01-02 21:22:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2024-01-02 21:22:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2024-01-02 21:22:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2024-01-02 21:22:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2024-01-02 21:22:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2024-01-02 21:22:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2024-01-02 21:22:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2024-01-02 21:22:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2024-01-02 21:22:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2024-01-02 21:22:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2024-01-02 21:22:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2024-01-02 21:22:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2024-01-02 21:22:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2024-01-02 21:22:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2024-01-02 21:22:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2024-01-02 21:22:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2024-01-02 21:22:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2024-01-02 21:22:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2024-01-02 21:22:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2024-01-02 21:22:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2024-01-02 21:22:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2024-01-02 21:22:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2024-01-02 21:22:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2024-01-02 21:22:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2024-01-02 21:22:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2024-01-02 21:22:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2024-01-02 21:22:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2024-01-02 21:22:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2024-01-02 21:22:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2024-01-02 21:22:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2024-01-02 21:22:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2024-01-02 21:22:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2024-01-02 21:22:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2024-01-02 21:22:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2024-01-02 21:22:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2024-01-02 21:22:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2024-01-02 21:22:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2024-01-02 21:22:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2024-01-02 21:22:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2024-01-02 21:22:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 116, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2024-01-02 21:22:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 116, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2024-01-02 21:22:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 116, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2024-01-02 21:22:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 116, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2024-01-02 21:22:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 116, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2024-01-02 21:22:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 116, 6, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2024-01-02 21:22:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1061, '交易市场', 1063, 1, 'saleCoin', 'system/saleCoin/index', NULL, 1, 0, 'C', '0', '0', 'system:saleCoin:list', 'list', 'admin', '2024-01-23 08:05:33', 'admin', '2024-01-23 10:38:51', '交易市场');
INSERT INTO `sys_menu` VALUES (1062, '卖币查询', 1061, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:saleCoin:query', '#', 'admin', '2024-01-23 08:05:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1063, '交易中心', 0, 2, 'shopping', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'shopping', 'admin', '2024-01-23 08:07:11', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1064, '买币列表', 1063, 2, 'buyCoin', 'system/buyCoin/index', NULL, 1, 0, 'C', '0', '0', 'system:buyCoin:list', 'drag', 'admin', '2024-01-23 18:04:44', 'admin', '2024-01-23 18:32:08', '买币菜单');
INSERT INTO `sys_menu` VALUES (1065, '买币查询', 1064, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:buyCoin:query', '#', 'admin', '2024-01-23 18:04:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1066, '交易记录', 1063, 3, 'transactionRecord', 'system/transactionRecord/index', NULL, 1, 0, 'C', '0', '0', 'system:transactionRecord:list', 'skill', 'admin', '2024-01-24 19:30:23', 'admin', '2024-01-24 19:31:03', '交易记录菜单');
INSERT INTO `sys_menu` VALUES (1067, '交易记录查询', 1066, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:transactionRecord:query', '#', 'admin', '2024-01-24 19:30:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1068, '支付审核', 1, 10, 'payApprove', 'system/payApprove/index', NULL, 1, 0, 'C', '0', '0', 'system:payApprove:list', 'money', 'admin', '2024-02-29 11:33:46', 'admin', '2024-02-29 11:40:35', '用户支付方式审核菜单');
INSERT INTO `sys_menu` VALUES (1069, '支付审核查询', 1068, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:payApprove:query', '#', 'admin', '2024-02-29 11:34:15', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '通知公告表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0x3C703E3C7374726F6E673EE696B0E78988E69CACE58685E5AEB93C2F7374726F6E673E3C2F703E, '0', 'admin', '2024-01-02 21:22:13', 'admin', '2024-01-21 19:09:54', '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2024-01-02 21:22:13', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (3, '测试', '1', 0x3C703EE698AFE79A84E58F91E98081E588B03C2F703E3C703EE998BFE696AFE9A1BFE58F91613C2F703E3C703EE68C89E697B6613C2F703E, '0', 'okadmin', '2024-01-21 19:19:05', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_notice_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice_user`;
CREATE TABLE `sys_notice_user`  (
  `notice_id` bigint(20) NOT NULL COMMENT '公告ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  PRIMARY KEY (`notice_id`, `user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '公告和用户关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_notice_user
-- ----------------------------
INSERT INTO `sys_notice_user` VALUES (3, 1);

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int(1) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint(20) NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type`) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status`) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 317 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"sys_chat\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-02 21:33:06', 190);
INSERT INTO `sys_oper_log` VALUES (101, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-01-02 21:22:09\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"测试部门\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":105,\"email\":\"ry@qq.com\",\"loginDate\":\"2024-01-02 21:22:09\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依\",\"params\":{},\"phonenumber\":\"15666666666\",\"postIds\":[2],\"remark\":\"测试员\",\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"ry\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-02 21:52:26', 165);
INSERT INTO `sys_oper_log` VALUES (102, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-01-02 21:22:09\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"测试部门\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":105,\"email\":\"ry@qq.com\",\"loginDate\":\"2024-01-02 21:22:09\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依\",\"params\":{},\"phonenumber\":\"15666666666\",\"postIds\":[2],\"remark\":\"测试员\",\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"ry\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-02 21:52:34', 446);
INSERT INTO `sys_oper_log` VALUES (103, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-01-02 21:22:09\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"测试部门\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":105,\"email\":\"r1@qq.com\",\"loginDate\":\"2024-01-02 21:22:09\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依\",\"params\":{},\"phonenumber\":\"15666666666\",\"postIds\":[2],\"remark\":\"测试员\",\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"ry\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-02 21:52:43', 132);
INSERT INTO `sys_oper_log` VALUES (104, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/dept/index\",\"createTime\":\"2024-01-02 21:22:09\",\"icon\":\"tree\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":103,\"menuName\":\"商户管理\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":1,\"path\":\"dept\",\"perms\":\"system:dept:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-02 22:12:29', 127);
INSERT INTO `sys_oper_log` VALUES (105, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dept/109', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-02 22:17:37', 92);
INSERT INTO `sys_oper_log` VALUES (106, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dept/107', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-02 22:17:40', 82);
INSERT INTO `sys_oper_log` VALUES (107, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dept/106', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-02 22:17:43', 77);
INSERT INTO `sys_oper_log` VALUES (108, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dept/105', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"部门存在用户,不允许删除\",\"code\":601}', 0, NULL, '2024-01-02 22:17:45', 15);
INSERT INTO `sys_oper_log` VALUES (109, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-01-02 21:22:09\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"测试部门\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":102,\"email\":\"r1@qq.com\",\"loginDate\":\"2024-01-02 21:22:09\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依\",\"params\":{},\"phonenumber\":\"15666666666\",\"postIds\":[2],\"remark\":\"测试员\",\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"ry\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-02 22:18:07', 99);
INSERT INTO `sys_oper_log` VALUES (110, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dept/105', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-02 22:18:14', 74);
INSERT INTO `sys_oper_log` VALUES (111, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dept/104', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-02 22:18:17', 80);
INSERT INTO `sys_oper_log` VALUES (112, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100\",\"children\":[],\"createBy\":\"admin\",\"deptId\":200,\"deptName\":\"测试商户1\",\"orderNum\":1,\"params\":{},\"parentId\":100,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-02 22:48:39', 451);
INSERT INTO `sys_oper_log` VALUES (113, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100\",\"children\":[],\"deptId\":200,\"deptName\":\"测试商户1\",\"orderNum\":3,\"params\":{},\"parentId\":100,\"parentName\":\"OKPAY平台\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-02 22:48:48', 368);
INSERT INTO `sys_oper_log` VALUES (114, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-01-02 21:22:09\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117,4],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"OK平台管理员\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-02 22:49:33', 195);
INSERT INTO `sys_oper_log` VALUES (115, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-01-02 21:22:09\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117,4],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"OK平台管理员\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-02 22:49:33', 274);
INSERT INTO `sys_oper_log` VALUES (116, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-01-02 21:22:09\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,103,1016,1017,1018,1019],\"params\":{},\"remark\":\"OK平台管理员\",\"roleId\":2,\"roleKey\":\"okpayadmin\",\"roleName\":\"OK平台管理员\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-02 22:50:19', 374);
INSERT INTO `sys_oper_log` VALUES (117, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006],\"params\":{},\"roleId\":100,\"roleKey\":\"merchant\",\"roleName\":\"商户\",\"roleSort\":3,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-02 22:50:59', 99);
INSERT INTO `sys_oper_log` VALUES (118, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[],\"params\":{},\"roleId\":101,\"roleKey\":\"agent\",\"roleName\":\"代理\",\"roleSort\":4,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-02 22:51:19', 337);
INSERT INTO `sys_oper_log` VALUES (119, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.dataScope()', 'PUT', 1, 'admin', '研发部门', '/system/role/dataScope', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-01-02 21:22:09\",\"dataScope\":\"4\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"params\":{},\"remark\":\"OK平台管理员\",\"roleId\":2,\"roleKey\":\"okpayadmin\",\"roleName\":\"OK平台管理员\",\"roleSort\":2,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-02 22:52:22', 3467);
INSERT INTO `sys_oper_log` VALUES (120, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.dataScope()', 'PUT', 1, 'admin', '研发部门', '/system/role/dataScope', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-01-02 21:22:09\",\"dataScope\":\"4\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"params\":{},\"remark\":\"OK平台管理员\",\"roleId\":2,\"roleKey\":\"okpayadmin\",\"roleName\":\"OK平台管理员\",\"roleSort\":2,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-02 22:52:22', 1622);
INSERT INTO `sys_oper_log` VALUES (121, '角色管理', 3, 'com.ruoyi.web.controller.system.SysRoleController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/role/100', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-02 22:52:38', 94);
INSERT INTO `sys_oper_log` VALUES (122, '角色管理', 3, 'com.ruoyi.web.controller.system.SysRoleController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/role/101', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-02 22:52:40', 43);
INSERT INTO `sys_oper_log` VALUES (123, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,103,1016,1017,1018,1019],\"params\":{},\"roleId\":3,\"roleKey\":\"merchant\",\"roleName\":\"商户\",\"roleSort\":3,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-02 22:53:21', 109);
INSERT INTO `sys_oper_log` VALUES (124, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[],\"params\":{},\"roleId\":4,\"roleKey\":\"agent\",\"roleName\":\"代理\",\"roleSort\":4,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-02 22:53:36', 92);
INSERT INTO `sys_oper_log` VALUES (125, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-01-02 22:53:21\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006],\"params\":{},\"roleId\":3,\"roleKey\":\"merchant\",\"roleName\":\"商户\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-02 22:54:15', 976);
INSERT INTO `sys_oper_log` VALUES (126, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-01-02 21:22:09\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100\",\"children\":[],\"deptId\":102,\"deptName\":\"长沙分公司\",\"leader\":\"若依\",\"orderNum\":2,\"params\":{},\"parentId\":100,\"status\":\"0\"},\"deptId\":102,\"email\":\"r1@qq.com\",\"inviteCode\":\"789c\",\"loginDate\":\"2024-01-02 21:22:09\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"testadmin\",\"params\":{},\"phonenumber\":\"15666666666\",\"postIds\":[2],\"remark\":\"测试员\",\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"4\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"okpayadmin\",\"roleName\":\"OK平台管理员\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"testadmin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-02 23:28:14', 192);
INSERT INTO `sys_oper_log` VALUES (127, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-01-02 21:22:09\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100\",\"children\":[],\"deptId\":102,\"deptName\":\"长沙分公司\",\"leader\":\"若依\",\"orderNum\":2,\"params\":{},\"parentId\":100,\"status\":\"0\"},\"deptId\":102,\"email\":\"r1@qq.com\",\"idcardNo\":\"350\",\"inviteCode\":\"789c\",\"loginDate\":\"2024-01-02 21:22:09\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"testadmin\",\"params\":{},\"phonenumber\":\"15666666666\",\"postIds\":[2],\"realName\":\"冷笑话\",\"remark\":\"测试员\",\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"4\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"okpayadmin\",\"roleName\":\"OK平台管理员\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"userId\":2,\"userName\":\"testadmin\"}', NULL, 1, 'Invalid bound statement (not found): com.ruoyi.system.mapper.SysUserMapper.checkIdcardUnique', '2024-01-02 23:34:04', 18);
INSERT INTO `sys_oper_log` VALUES (128, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-01-02 21:22:09\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100\",\"children\":[],\"deptId\":102,\"deptName\":\"长沙分公司\",\"leader\":\"若依\",\"orderNum\":2,\"params\":{},\"parentId\":100,\"status\":\"0\"},\"deptId\":102,\"email\":\"r1@qq.com\",\"idcardNo\":\"350\",\"inviteCode\":\"789c\",\"loginDate\":\"2024-01-02 21:22:09\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"testadmin\",\"params\":{},\"phonenumber\":\"15666666666\",\"postIds\":[2],\"realName\":\"冷笑话\",\"remark\":\"测试员\",\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"4\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"okpayadmin\",\"roleName\":\"OK平台管理员\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"testadmin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-02 23:36:31', 5575);
INSERT INTO `sys_oper_log` VALUES (129, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-01-02 21:22:09\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100\",\"children\":[],\"deptId\":102,\"deptName\":\"长沙分公司\",\"leader\":\"若依\",\"orderNum\":2,\"params\":{},\"parentId\":100,\"status\":\"0\"},\"deptId\":102,\"email\":\"r1@qq.com\",\"idcardNo\":\"351\",\"inviteCode\":\"789c\",\"loginDate\":\"2024-01-02 21:22:09\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"testadmin\",\"params\":{},\"phonenumber\":\"15666666666\",\"postIds\":[2],\"realName\":\"冷笑话\",\"remark\":\"测试员\",\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"4\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"okpayadmin\",\"roleName\":\"OK平台管理员\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"userId\":2,\"userName\":\"testadmin\"}', '{\"msg\":\"修改用户\'testadmin\'失败，身份证号已存在\",\"code\":500}', 0, NULL, '2024-01-02 23:37:06', 19);
INSERT INTO `sys_oper_log` VALUES (130, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-01-02 21:22:09\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100\",\"children\":[],\"deptId\":102,\"deptName\":\"长沙分公司\",\"leader\":\"若依\",\"orderNum\":2,\"params\":{},\"parentId\":100,\"status\":\"0\"},\"deptId\":102,\"email\":\"r1@qq.com\",\"idcardNo\":\"351\",\"inviteCode\":\"789c\",\"loginDate\":\"2024-01-02 21:22:09\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"testadmin\",\"params\":{},\"phonenumber\":\"15666666666\",\"postIds\":[2],\"realName\":\"冷笑话\",\"remark\":\"测试员\",\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"4\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"okpayadmin\",\"roleName\":\"OK平台管理员\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"userId\":2,\"userName\":\"testadmin\"}', '{\"msg\":\"修改用户\'testadmin\'失败，身份证号已存在\",\"code\":500}', 0, NULL, '2024-01-02 23:37:11', 18);
INSERT INTO `sys_oper_log` VALUES (131, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"amount\":0.0,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-01-02 21:22:09\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100\",\"children\":[],\"deptId\":102,\"deptName\":\"长沙分公司\",\"leader\":\"若依\",\"orderNum\":2,\"params\":{},\"parentId\":100,\"status\":\"0\"},\"deptId\":102,\"email\":\"r1@qq.com\",\"idcardFrontImg\":\"/profile/upload/2024/01/02/身份证正面_20240102234517A001.png\",\"idcardNo\":\"350\",\"inviteCode\":\"789c\",\"loginDate\":\"2024-01-02 21:22:09\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"testadmin\",\"params\":{},\"phonenumber\":\"15666666666\",\"postIds\":[2],\"realName\":\"冷笑话\",\"remark\":\"测试员\",\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"4\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"okpayadmin\",\"roleName\":\"OK平台管理员\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"testadmin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-02 23:45:22', 205);
INSERT INTO `sys_oper_log` VALUES (132, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"amount\":0.0,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-01-02 21:22:09\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100\",\"children\":[],\"deptId\":102,\"deptName\":\"长沙分公司\",\"leader\":\"若依\",\"orderNum\":2,\"params\":{},\"parentId\":100,\"status\":\"0\"},\"deptId\":102,\"email\":\"r1@qq.com\",\"idcardFrontImg\":\"\",\"idcardNo\":\"350\",\"inviteCode\":\"789c\",\"loginDate\":\"2024-01-02 21:22:09\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"testadmin\",\"params\":{},\"phonenumber\":\"15666666666\",\"postIds\":[2],\"realName\":\"冷笑话\",\"remark\":\"测试员\",\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"4\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"okpayadmin\",\"roleName\":\"OK平台管理员\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"testadmin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-02 23:46:51', 854);
INSERT INTO `sys_oper_log` VALUES (133, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"alipayImg\":\"/profile/upload/2024/01/02/二维码2_20240102235103A004.PNG\",\"amount\":0.0,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-01-02 21:22:09\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100\",\"children\":[],\"deptId\":102,\"deptName\":\"长沙分公司\",\"leader\":\"若依\",\"orderNum\":2,\"params\":{},\"parentId\":100,\"status\":\"0\"},\"deptId\":102,\"email\":\"r1@qq.com\",\"idcardBackImg\":\"/profile/upload/2024/01/02/身份证反面_20240102235056A002.png\",\"idcardFrontImg\":\"/profile/upload/2024/01/02/身份证正面_20240102234517A001.png\",\"idcardNo\":\"350\",\"inviteCode\":\"789c\",\"loginDate\":\"2024-01-02 21:22:09\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"testadmin\",\"params\":{},\"phonenumber\":\"15666666666\",\"postIds\":[2],\"realName\":\"冷笑话\",\"remark\":\"测试员\",\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"4\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"okpayadmin\",\"roleName\":\"OK平台管理员\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"unionpayAccount\":\"1231\",\"unionpayCard\":\"123\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"testadmin\",\"wechatPayImg\":\"/profile/upload/2024/01/02/二维码1_20240102235100A003.PNG\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-02 23:51:11', 116);
INSERT INTO `sys_oper_log` VALUES (134, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":200,\"inviteCode\":\"e3970c\",\"nickName\":\"测试商户\",\"params\":{},\"postIds\":[],\"roleIds\":[3],\"status\":\"0\",\"userId\":100,\"userName\":\"liao1\",\"walletAddress\":\"c8efd54b8488e1e8\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-03 00:04:42', 3617);
INSERT INTO `sys_oper_log` VALUES (135, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.dataScope()', 'PUT', 1, 'admin', '深圳总公司代理', '/system/role/dataScope', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-01-02 22:53:21\",\"dataScope\":\"4\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"params\":{},\"roleId\":3,\"roleKey\":\"merchant\",\"roleName\":\"商户\",\"roleSort\":3,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-03 00:06:38', 67);
INSERT INTO `sys_oper_log` VALUES (136, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.dataScope()', 'PUT', 1, 'admin', '深圳总公司代理', '/system/role/dataScope', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-01-02 21:22:09\",\"dataScope\":\"4\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"params\":{},\"remark\":\"OK平台管理员\",\"roleId\":2,\"roleKey\":\"okpayadmin\",\"roleName\":\"OK平台管理员\",\"roleSort\":2,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-03 00:06:43', 57);
INSERT INTO `sys_oper_log` VALUES (137, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.dataScope()', 'PUT', 1, 'admin', '深圳总公司代理', '/system/role/dataScope', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-01-02 22:53:36\",\"dataScope\":\"4\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"params\":{},\"roleId\":4,\"roleKey\":\"agent\",\"roleName\":\"代理\",\"roleSort\":4,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-03 00:06:48', 120);
INSERT INTO `sys_oper_log` VALUES (138, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '深圳总公司代理', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"alipayImg\":\"/profile/upload/2024/01/02/二维码2_20240102235103A004.PNG\",\"amount\":0.0,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-01-02 21:22:09\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100\",\"children\":[],\"deptId\":102,\"deptName\":\"长沙分公司\",\"leader\":\"若依\",\"orderNum\":2,\"params\":{},\"parentId\":100,\"status\":\"0\"},\"deptId\":100,\"email\":\"r1@qq.com\",\"idcardBackImg\":\"/profile/upload/2024/01/02/身份证反面_20240102235056A002.png\",\"idcardFrontImg\":\"/profile/upload/2024/01/02/身份证正面_20240102234517A001.png\",\"idcardNo\":\"350\",\"inviteCode\":\"789c\",\"loginDate\":\"2024-01-03 00:08:17\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"testadmin\",\"params\":{},\"phonenumber\":\"15666666666\",\"postIds\":[2],\"realName\":\"冷笑话\",\"remark\":\"测试员\",\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"4\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"okpayadmin\",\"roleName\":\"OK平台管理员\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"unionpayAccount\":\"1231\",\"unionpayCard\":\"123\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"testadmin\",\"wechatPayImg\":\"/profile/upload/2024/01/02/二维码1_20240102235100A003.PNG\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-03 00:08:52', 489);
INSERT INTO `sys_oper_log` VALUES (139, '用户管理', 3, 'com.ruoyi.web.controller.system.SysUserController.remove()', 'DELETE', 1, 'testadmin', 'OKPAY平台', '/system/user/100', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-03 00:09:29', 356);
INSERT INTO `sys_oper_log` VALUES (140, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'testadmin', 'OKPAY平台', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"testadmin\",\"deptId\":200,\"idcardFrontImg\":\"/profile/upload/2024/01/03/身份证正面_20240103001027A005.png\",\"inviteCode\":\"e7afd6\",\"nickName\":\"测试商户\",\"params\":{},\"postIds\":[],\"roleIds\":[3],\"status\":\"0\",\"userId\":3,\"userName\":\"liao1\",\"walletAddress\":\"96dd63595f287715\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-03 00:10:31', 176);
INSERT INTO `sys_oper_log` VALUES (141, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"amount\":0.0,\"avatar\":\"\",\"createBy\":\"testadmin\",\"createTime\":\"2024-01-03 00:10:30\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100\",\"children\":[],\"deptId\":200,\"deptName\":\"测试商户1\",\"orderNum\":3,\"params\":{},\"parentId\":100,\"status\":\"0\"},\"deptId\":200,\"email\":\"\",\"idcardBackImg\":\"/profile/upload/2024/01/04/身份证反面_20240104224213A001.png\",\"idcardFrontImg\":\"/profile/upload/2024/01/03/身份证正面_20240103001027A005.png\",\"inviteCode\":\"e7afd6\",\"loginIp\":\"\",\"nickName\":\"测试商户\",\"normalCommission\":5,\"params\":{},\"parentUserId\":2,\"phonenumber\":\"\",\"postIds\":[],\"roleIds\":[3],\"roles\":[{\"admin\":false,\"dataScope\":\"4\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":3,\"roleKey\":\"merchant\",\"roleName\":\"商户\",\"roleSort\":3,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"ungentCommission\":10,\"updateBy\":\"admin\",\"userId\":3,\"userName\":\"liao1\",\"userType\":\"00\",\"walletAddress\":\"96dd63595f287715\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-04 22:42:15', 184);
INSERT INTO `sys_oper_log` VALUES (142, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[],\"params\":{},\"roleId\":5,\"roleKey\":\"customer\",\"roleName\":\"客户\",\"roleSort\":5,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-04 22:44:35', 641);
INSERT INTO `sys_oper_log` VALUES (143, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.dataScope()', 'PUT', 1, 'admin', NULL, '/system/role/dataScope', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-01-04 22:44:34\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"params\":{},\"roleId\":5,\"roleKey\":\"customer\",\"roleName\":\"客户\",\"roleSort\":5,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-04 22:45:00', 86);
INSERT INTO `sys_oper_log` VALUES (144, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.dataScope()', 'PUT', 1, 'admin', NULL, '/system/role/dataScope', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-01-02 22:53:36\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"params\":{},\"roleId\":4,\"roleKey\":\"agent\",\"roleName\":\"代理\",\"roleSort\":4,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-04 22:45:05', 72);
INSERT INTO `sys_oper_log` VALUES (145, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"children\":[],\"deptName\":\"测试商户2\",\"normalCommission\":5,\"orderNum\":4,\"params\":{},\"parentId\":100,\"status\":\"0\",\"ungentCommission\":10,\"userName\":\"liao2\"}', NULL, 1, '\r\n### Error querying database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'del_flag\' in where clause is ambiguous\r\n### The error may exist in file [D:\\projcet\\RuoYi-Vue\\ruoyi-system\\target\\classes\\mapper\\system\\SysDeptMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select d.dept_id, d.parent_id, d.ancestors, d.dept_name, d.order_num, d.leader, d.phone, d.email, d.status, d.del_flag, d.create_by, d.create_time, u.user_id, u.user_name, u.nick_name, u.password, u.ungent_commission, u.normal_commission         from sys_dept d   left join sys_user u on d.user_id = u.user_id         where dept_name=? and parent_id = ? and del_flag = \'0\' limit 1\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'del_flag\' in where clause is ambiguous\n; Column \'del_flag\' in where clause is ambiguous; nested exception is java.sql.SQLIntegrityConstraintViolationException: Column \'del_flag\' in where clause is ambiguous', '2024-01-04 22:55:11', 61);
INSERT INTO `sys_oper_log` VALUES (146, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"children\":[],\"deptName\":\"测试商户2\",\"normalCommission\":5,\"orderNum\":4,\"params\":{},\"parentId\":100,\"status\":\"0\",\"ungentCommission\":10,\"userName\":\"liao2\"}', NULL, 1, '\r\n### Error querying database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'del_flag\' in where clause is ambiguous\r\n### The error may exist in file [D:\\projcet\\RuoYi-Vue\\ruoyi-system\\target\\classes\\mapper\\system\\SysDeptMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select d.dept_id, d.parent_id, d.ancestors, d.dept_name, d.order_num, d.leader, d.phone, d.email, d.status, d.del_flag, d.create_by, d.create_time, u.user_id, u.user_name, u.nick_name, u.password, u.ungent_commission, u.normal_commission         from sys_dept d   left join sys_user u on d.user_id = u.user_id         where dept_name=? and parent_id = ? and del_flag = \'0\' limit 1\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'del_flag\' in where clause is ambiguous\n; Column \'del_flag\' in where clause is ambiguous; nested exception is java.sql.SQLIntegrityConstraintViolationException: Column \'del_flag\' in where clause is ambiguous', '2024-01-04 23:00:35', 112);
INSERT INTO `sys_oper_log` VALUES (147, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"children\":[],\"deptName\":\"测试商户2\",\"normalCommission\":5,\"orderNum\":4,\"params\":{},\"parentId\":100,\"status\":\"0\",\"ungentCommission\":10,\"userName\":\"liao2\"}', NULL, 1, '\r\n### Error querying database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'del_flag\' in where clause is ambiguous\r\n### The error may exist in file [D:\\projcet\\RuoYi-Vue\\ruoyi-system\\target\\classes\\mapper\\system\\SysDeptMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select d.dept_id, d.parent_id, d.ancestors, d.dept_name, d.order_num, d.leader, d.phone, d.email, d.status, d.del_flag, d.create_by, d.create_time, u.user_id, u.user_name, u.nick_name, u.password, u.ungent_commission, u.normal_commission         from sys_dept d   left join sys_user u on d.user_id = u.user_id         where dept_name=? and parent_id = ? and del_flag = \'0\' limit 1\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'del_flag\' in where clause is ambiguous\n; Column \'del_flag\' in where clause is ambiguous; nested exception is java.sql.SQLIntegrityConstraintViolationException: Column \'del_flag\' in where clause is ambiguous', '2024-01-04 23:00:54', 4);
INSERT INTO `sys_oper_log` VALUES (148, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100\",\"children\":[],\"createBy\":\"admin\",\"deptId\":202,\"deptName\":\"测试商户2\",\"normalCommission\":5,\"orderNum\":4,\"params\":{},\"parentId\":100,\"status\":\"0\",\"ungentCommission\":10,\"userName\":\"liao2\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'203\' for key \'PRIMARY\'\r\n### The error may exist in file [D:\\projcet\\RuoYi-Vue\\ruoyi-system\\target\\classes\\mapper\\system\\SysDeptMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysDeptMapper.insertDept-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_dept(      dept_id,       parent_id,       dept_name,       ancestors,                                          create_time    )values(      ?,       ?,       ?,       ?,                                          sysdate()    )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'203\' for key \'PRIMARY\'\n; Duplicate entry \'203\' for key \'PRIMARY\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'203\' for key \'PRIMARY\'', '2024-01-04 23:02:04', 195);
INSERT INTO `sys_oper_log` VALUES (149, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100\",\"children\":[],\"createBy\":\"admin\",\"deptId\":204,\"deptName\":\"测试商户2\",\"normalCommission\":5,\"orderNum\":4,\"params\":{},\"parentId\":100,\"status\":\"0\",\"ungentCommission\":10,\"userName\":\"liao2\"}', NULL, 1, 'rawPassword cannot be null', '2024-01-04 23:03:44', 478);
INSERT INTO `sys_oper_log` VALUES (150, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100\",\"children\":[],\"createBy\":\"admin\",\"deptId\":207,\"deptName\":\"测试商户2\",\"normalCommission\":5,\"orderNum\":4,\"params\":{},\"parentId\":100,\"status\":\"0\",\"ungentCommission\":10,\"userName\":\"liao2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-04 23:05:25', 376);
INSERT INTO `sys_oper_log` VALUES (151, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,207,208\",\"children\":[],\"createBy\":\"admin\",\"deptId\":210,\"deptName\":\"ces\",\"normalCommission\":1,\"orderNum\":0,\"params\":{},\"parentId\":208,\"status\":\"0\",\"ungentCommission\":1,\"userName\":\"liao3\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-04 23:07:37', 856);
INSERT INTO `sys_oper_log` VALUES (152, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100\",\"children\":[],\"createBy\":\"admin\",\"deptId\":211,\"deptName\":\"测试商户3\",\"normalCommission\":10,\"orderNum\":0,\"params\":{},\"parentId\":100,\"status\":\"0\",\"ungentCommission\":20,\"userName\":\"liao3\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-04 23:14:00', 778);
INSERT INTO `sys_oper_log` VALUES (153, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100\",\"children\":[],\"createBy\":\"admin\",\"deptId\":214,\"deptName\":\"测试商户3\",\"normalCommission\":5,\"orderNum\":0,\"params\":{},\"parentId\":100,\"status\":\"0\",\"ungentCommission\":10,\"userName\":\"liao3\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-04 23:15:52', 32682);
INSERT INTO `sys_oper_log` VALUES (154, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100\",\"children\":[],\"createBy\":\"admin\",\"deptId\":210,\"deptName\":\"测试商户3\",\"normalCommission\":5,\"orderNum\":0,\"params\":{},\"parentId\":100,\"status\":\"0\",\"ungentCommission\":10,\"userName\":\"liao3\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'5-3\' for key \'PRIMARY\'\r\n### The error may exist in file [D:\\projcet\\RuoYi-Vue\\ruoyi-system\\target\\classes\\mapper\\system\\SysUserRoleMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_user_role(user_id, role_id) values         (?,?)\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'5-3\' for key \'PRIMARY\'\n; Duplicate entry \'5-3\' for key \'PRIMARY\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'5-3\' for key \'PRIMARY\'', '2024-01-04 23:18:31', 675);
INSERT INTO `sys_oper_log` VALUES (155, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100\",\"children\":[],\"createBy\":\"admin\",\"deptId\":213,\"deptName\":\"测试商户3\",\"normalCommission\":5,\"orderNum\":0,\"params\":{},\"parentId\":100,\"status\":\"0\",\"ungentCommission\":10,\"userName\":\"liao3\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'6-3\' for key \'PRIMARY\'\r\n### The error may exist in file [D:\\projcet\\RuoYi-Vue\\ruoyi-system\\target\\classes\\mapper\\system\\SysUserRoleMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_user_role(user_id, role_id) values         (?,?)\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'6-3\' for key \'PRIMARY\'\n; Duplicate entry \'6-3\' for key \'PRIMARY\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'6-3\' for key \'PRIMARY\'', '2024-01-04 23:19:12', 1196);
INSERT INTO `sys_oper_log` VALUES (156, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100\",\"children\":[],\"createBy\":\"admin\",\"deptId\":216,\"deptName\":\"测试商户3\",\"normalCommission\":5,\"orderNum\":0,\"params\":{},\"parentId\":100,\"status\":\"0\",\"ungentCommission\":10,\"userName\":\"liao3\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-04 23:20:33', 4155);
INSERT INTO `sys_oper_log` VALUES (157, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100\",\"children\":[],\"deptId\":200,\"deptName\":\"测试商户1\",\"normalCommission\":5,\"orderNum\":0,\"params\":{},\"parentId\":100,\"parentName\":\"OKPAY平台\",\"status\":\"0\",\"ungentCommission\":15,\"updateBy\":\"admin\",\"userId\":3,\"userName\":\"liao1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-04 23:26:04', 516);
INSERT INTO `sys_oper_log` VALUES (158, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100\",\"children\":[],\"createAgentFlg\":\"true\",\"deptId\":216,\"deptName\":\"测试商户3\",\"normalCommission\":5,\"orderNum\":0,\"params\":{},\"parentId\":100,\"parentName\":\"OKPAY平台\",\"status\":\"0\",\"ungentCommission\":10,\"updateBy\":\"admin\",\"userId\":7,\"userName\":\"liao3\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-05 21:16:46', 267);
INSERT INTO `sys_oper_log` VALUES (159, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100\",\"children\":[],\"createAgentFlg\":\"true\",\"deptId\":216,\"deptName\":\"测试商户3\",\"normalCommission\":5,\"orderNum\":0,\"params\":{},\"parentId\":100,\"parentName\":\"OKPAY平台\",\"status\":\"0\",\"ungentCommission\":10,\"updateBy\":\"admin\",\"userId\":7,\"userName\":\"liao3\"}', NULL, 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'create_agent_flg\' at row 1\r\n### The error may exist in file [D:\\projcet\\RuoYi-Vue\\ruoyi-system\\target\\classes\\mapper\\system\\SysUserMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysUserMapper.updateUser-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update sys_user     SET ungent_commission = ?,    normal_commission = ?,    create_agent_flg = ?,                              update_time = sysdate()     where user_id = ?\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'create_agent_flg\' at row 1\n; Data truncation: Data too long for column \'create_agent_flg\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'create_agent_flg\' at row 1', '2024-01-05 21:18:26', 487);
INSERT INTO `sys_oper_log` VALUES (160, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100\",\"children\":[],\"createAgentFlg\":\"true\",\"deptId\":216,\"deptName\":\"测试商户3\",\"normalCommission\":5,\"orderNum\":0,\"params\":{},\"parentId\":100,\"parentName\":\"OKPAY平台\",\"status\":\"0\",\"ungentCommission\":10,\"updateBy\":\"admin\",\"userId\":7,\"userName\":\"liao3\"}', NULL, 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'create_agent_flg\' at row 1\r\n### The error may exist in file [D:\\projcet\\RuoYi-Vue\\ruoyi-system\\target\\classes\\mapper\\system\\SysUserMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysUserMapper.updateUser-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update sys_user     SET ungent_commission = ?,    normal_commission = ?,    create_agent_flg = ?,                              update_time = sysdate()     where user_id = ?\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'create_agent_flg\' at row 1\n; Data truncation: Data too long for column \'create_agent_flg\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'create_agent_flg\' at row 1', '2024-01-05 21:19:34', 42777);
INSERT INTO `sys_oper_log` VALUES (161, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100\",\"children\":[],\"createAgentFlg\":\"1\",\"deptId\":216,\"deptName\":\"测试商户3\",\"normalCommission\":5,\"orderNum\":0,\"params\":{},\"parentId\":100,\"parentName\":\"OKPAY平台\",\"status\":\"0\",\"ungentCommission\":10,\"updateBy\":\"admin\",\"userId\":7,\"userName\":\"liao3\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-05 21:29:02', 8404);
INSERT INTO `sys_oper_log` VALUES (162, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100\",\"children\":[],\"createAgentFlg\":\"0\",\"deptId\":216,\"deptName\":\"测试商户3\",\"normalCommission\":5,\"orderNum\":0,\"params\":{},\"parentId\":100,\"parentName\":\"OKPAY平台\",\"status\":\"0\",\"ungentCommission\":10,\"updateBy\":\"admin\",\"userId\":7,\"userName\":\"liao3\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-05 21:29:07', 189);
INSERT INTO `sys_oper_log` VALUES (163, '商户管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100\",\"children\":[],\"createAgentFlg\":\"1\",\"deptId\":216,\"deptName\":\"测试商户3\",\"normalCommission\":5,\"orderNum\":0,\"params\":{},\"parentId\":100,\"parentName\":\"OKPAY平台\",\"status\":\"0\",\"ungentCommission\":10,\"userId\":7,\"userName\":\"liao3\"}', '{\"msg\":\"该商户包含未停用的其他代理！\",\"code\":500}', 0, NULL, '2024-01-05 21:44:28', 23);
INSERT INTO `sys_oper_log` VALUES (164, '商户管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100\",\"children\":[],\"createAgentFlg\":\"1\",\"deptId\":216,\"deptName\":\"测试商户3\",\"normalCommission\":5,\"orderNum\":0,\"params\":{},\"parentId\":100,\"parentName\":\"OKPAY平台\",\"status\":\"0\",\"ungentCommission\":10,\"updateBy\":\"admin\",\"userId\":7,\"userName\":\"liao3\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-05 21:44:38', 196);
INSERT INTO `sys_oper_log` VALUES (165, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updatePwd()', 'PUT', 1, 'admin', NULL, '/system/user/profile/updatePwd', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"新密码不能与旧密码相同\",\"code\":500}', 0, NULL, '2024-01-06 19:44:03', 25544);
INSERT INTO `sys_oper_log` VALUES (166, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"sys_chat\"}', NULL, 0, NULL, '2024-01-06 23:40:36', 399);
INSERT INTO `sys_oper_log` VALUES (167, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2024/01/07/头像_20240107111226A001.png\",\"code\":200}', 0, NULL, '2024-01-07 11:12:26', 204);
INSERT INTO `sys_oper_log` VALUES (168, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'okadmin', 'OKPAY平台', '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2024/01/07/头像2_20240107111704A002.png\",\"code\":200}', 0, NULL, '2024-01-07 11:17:05', 716);
INSERT INTO `sys_oper_log` VALUES (169, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"sale_coin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-13 15:10:01', 541);
INSERT INTO `sys_oper_log` VALUES (170, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/2', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-13 15:10:27', 104);
INSERT INTO `sys_oper_log` VALUES (171, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"sys_sale_coin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-13 15:12:18', 119);
INSERT INTO `sys_oper_log` VALUES (172, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/3', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-13 15:28:35', 167);
INSERT INTO `sys_oper_log` VALUES (173, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"sys_sale_coin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-13 15:35:36', 116);
INSERT INTO `sys_oper_log` VALUES (174, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"sys_buy_coin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-13 15:35:46', 185);
INSERT INTO `sys_oper_log` VALUES (175, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"sys_transaction_record\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-13 15:36:57', 114);
INSERT INTO `sys_oper_log` VALUES (176, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"sys_recharge\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-13 15:37:07', 445);
INSERT INTO `sys_oper_log` VALUES (177, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"sys_sale_coin,sys_buy_coin,sys_transaction_record,sys_recharge\"}', NULL, 0, NULL, '2024-01-13 15:39:54', 3731);
INSERT INTO `sys_oper_log` VALUES (178, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"saleCoin\",\"className\":\"SysSaleCoin\",\"columns\":[{\"capJavaField\":\"SaleId\",\"columnComment\":\"卖币ID\",\"columnId\":36,\"columnName\":\"sale_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-01-13 15:35:36\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"saleId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"SaleNo\",\"columnComment\":\"卖币No\",\"columnId\":37,\"columnName\":\"sale_no\",\"columnType\":\"varchar(3000)\",\"createBy\":\"admin\",\"createTime\":\"2024-01-13 15:35:36\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"saleNo\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"SaleTime\",\"columnComment\":\"卖币时间\",\"columnId\":38,\"columnName\":\"sale_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-01-13 15:35:36\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"saleTime\",\"javaType\":\"Date\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"SaleUserId\",\"columnComment\":\"卖币用户ID\",\"columnId\":39,\"columnName\":\"sale_user_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-01-13 15:35:36\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-13 15:48:24', 145);
INSERT INTO `sys_oper_log` VALUES (179, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"buyCoin\",\"className\":\"SysBuyCoin\",\"columns\":[{\"capJavaField\":\"BuyId\",\"columnComment\":\"买币ID\",\"columnId\":51,\"columnName\":\"buy_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-01-13 15:35:46\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"buyId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"SaleId\",\"columnComment\":\"卖币ID\",\"columnId\":52,\"columnName\":\"sale_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-01-13 15:35:46\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"saleId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"SaleUserId\",\"columnComment\":\"卖币用户ID\",\"columnId\":53,\"columnName\":\"sale_user_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-01-13 15:35:46\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"saleUserId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"BuyUserId\",\"columnComment\":\"买币用户ID\",\"columnId\":54,\"columnName\":\"buy_user_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-01-13 15:35:46\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequir', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-13 15:48:36', 569);
INSERT INTO `sys_oper_log` VALUES (180, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"transactionRecord\",\"className\":\"SysTransactionRecord\",\"columns\":[{\"capJavaField\":\"RecordId\",\"columnComment\":\"记录ID\",\"columnId\":64,\"columnName\":\"record_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-01-13 15:36:57\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"recordId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"交易用户ID\",\"columnId\":65,\"columnName\":\"user_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-01-13 15:36:57\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"RecordTime\",\"columnComment\":\"交易时间\",\"columnId\":66,\"columnName\":\"record_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-01-13 15:36:57\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"recordTime\",\"javaType\":\"Date\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"RecordType\",\"columnComment\":\"交易类型（0买币 1卖币 2商家直充 3代理充值 4手续费）\",\"columnId\":67,\"columnName\":\"record_type\",\"columnType\":\"char(1)\",\"createBy\":\"admin\",\"createTime\":\"2024-01-13 15:36:57\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-13 15:48:53', 85);
INSERT INTO `sys_oper_log` VALUES (181, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"sys_sale_coin,sys_buy_coin,sys_transaction_record\"}', NULL, 0, NULL, '2024-01-13 15:49:13', 501);
INSERT INTO `sys_oper_log` VALUES (182, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/6', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-19 21:16:55', 206);
INSERT INTO `sys_oper_log` VALUES (183, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"sys_transaction_record\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-19 21:17:11', 264);
INSERT INTO `sys_oper_log` VALUES (184, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"transactionRecord\",\"className\":\"SysTransactionRecord\",\"columns\":[{\"capJavaField\":\"RecordId\",\"columnComment\":\"记录ID\",\"columnId\":81,\"columnName\":\"record_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-01-19 21:17:11\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"recordId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"交易用户ID\",\"columnId\":82,\"columnName\":\"user_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-01-19 21:17:11\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"RecordTime\",\"columnComment\":\"交易时间\",\"columnId\":83,\"columnName\":\"record_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-01-19 21:17:11\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"recordTime\",\"javaType\":\"Date\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"RecordType\",\"columnComment\":\"交易类型（0买币 1卖币 2商家直充 3代理充值 4手续费）\",\"columnId\":84,\"columnName\":\"record_type\",\"columnType\":\"char(1)\",\"createBy\":\"admin\",\"createTime\":\"2024-01-19 21:17:11\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-19 21:17:46', 85);
INSERT INTO `sys_oper_log` VALUES (185, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"sys_transaction_record\"}', NULL, 0, NULL, '2024-01-19 21:17:52', 314);
INSERT INTO `sys_oper_log` VALUES (186, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/7', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-19 21:35:17', 151);
INSERT INTO `sys_oper_log` VALUES (187, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"sys_recharge\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-19 21:35:22', 200);
INSERT INTO `sys_oper_log` VALUES (188, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"sys_recharge\"}', NULL, 0, NULL, '2024-01-19 22:23:16', 376);
INSERT INTO `sys_oper_log` VALUES (189, '商户管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', 1, 'okadmin', 'OKPAY平台', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100\",\"children\":[],\"createAgentFlg\":\"0\",\"createBy\":\"okadmin\",\"deptId\":219,\"deptName\":\"测试商户4\",\"normalCommission\":5,\"orderNum\":0,\"params\":{},\"parentId\":100,\"status\":\"0\",\"ungentCommission\":10,\"userName\":\"liao4\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-19 22:53:21', 428);
INSERT INTO `sys_oper_log` VALUES (190, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'okadmin', 'OKPAY平台', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"amount\":0.0,\"avatar\":\"\",\"createAgentFlg\":\"0\",\"createBy\":\"\",\"createTime\":\"2024-01-19 22:54:35\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,219\",\"children\":[],\"deptId\":220,\"deptName\":\"测试商户4代理\",\"orderNum\":0,\"params\":{},\"parentId\":219,\"status\":\"0\"},\"deptId\":220,\"email\":\"\",\"idcardBackImg\":\"/profile/upload/2024/01/19/image_20240119225435A002.jpeg\",\"idcardFrontImg\":\"/profile/upload/2024/01/19/image_20240119225435A001.jpeg\",\"idcardNo\":\"123123121\",\"inviteCode\":\"9b9e1c\",\"loginIp\":\"\",\"nickName\":\"测试客户2\",\"normalCommission\":0,\"params\":{},\"parentUserId\":12,\"payPassword\":\"$2a$10$2TnEyCbt/0u79ec4t91KuuAmY/u0tVCUzo7QeUMQ.b29qvRkF6IdO\",\"phonenumber\":\"15888888882\",\"postIds\":[],\"realName\":\"客\",\"roleIds\":[4],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":4,\"roleKey\":\"agent\",\"roleName\":\"代理\",\"roleSort\":4,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"ungentCommission\":0,\"updateBy\":\"okadmin\",\"userId\":13,\"userName\":\"agent2\",\"userType\":\"03\",\"walletAddress\":\"392a0c09a2d5cbbf\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-19 22:55:03', 95);
INSERT INTO `sys_oper_log` VALUES (191, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'okadmin', 'OKPAY平台', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"amount\":0.0,\"avatar\":\"\",\"createAgentFlg\":\"0\",\"createBy\":\"\",\"createTime\":\"2024-01-19 22:54:35\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,219\",\"children\":[],\"deptId\":220,\"deptName\":\"测试商户4代理\",\"orderNum\":0,\"params\":{},\"parentId\":219,\"status\":\"0\"},\"deptId\":220,\"email\":\"\",\"idcardBackImg\":\"/profile/upload/2024/01/19/image_20240119225435A002.jpeg\",\"idcardFrontImg\":\"/profile/upload/2024/01/19/image_20240119225435A001.jpeg\",\"idcardNo\":\"123123121\",\"inviteCode\":\"9b9e1c\",\"loginIp\":\"\",\"nickName\":\"测试代理2\",\"normalCommission\":0,\"params\":{},\"parentUserId\":12,\"payPassword\":\"$2a$10$2TnEyCbt/0u79ec4t91KuuAmY/u0tVCUzo7QeUMQ.b29qvRkF6IdO\",\"phonenumber\":\"15888888882\",\"postIds\":[],\"realName\":\"客\",\"roleIds\":[4],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":4,\"roleKey\":\"agent\",\"roleName\":\"代理\",\"roleSort\":4,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"ungentCommission\":0,\"updateBy\":\"okadmin\",\"userId\":13,\"userName\":\"agent2\",\"userType\":\"03\",\"walletAddress\":\"392a0c09a2d5cbbf\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-19 22:55:52', 3525);
INSERT INTO `sys_oper_log` VALUES (192, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/9', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-20 10:17:05', 135);
INSERT INTO `sys_oper_log` VALUES (193, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"sys_recharge\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-20 10:17:20', 193);
INSERT INTO `sys_oper_log` VALUES (194, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"sys_recharge\"}', NULL, 0, NULL, '2024-01-20 10:17:24', 321);
INSERT INTO `sys_oper_log` VALUES (195, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"sys_sale_coin,sys_buy_coin,sys_transaction_record,sys_recharge\"}', NULL, 0, NULL, '2024-01-20 12:02:19', 606);
INSERT INTO `sys_oper_log` VALUES (196, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"sys_mail_user,sys_mail\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-21 18:30:08', 232);
INSERT INTO `sys_oper_log` VALUES (197, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"mailUser\",\"className\":\"SysMailUser\",\"columns\":[{\"capJavaField\":\"MailId\",\"columnComment\":\"站内信ID\",\"columnId\":124,\"columnName\":\"mail_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-01-21 18:30:08\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"mailId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":12,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"用户ID\",\"columnId\":125,\"columnName\":\"user_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-01-21 18:30:08\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":12,\"updateBy\":\"\",\"usableColumn\":false}],\"crud\":true,\"functionAuthor\":\"ruoyi\",\"functionName\":\"站内信和用户关联\",\"genPath\":\"/\",\"genType\":\"0\",\"moduleName\":\"system\",\"options\":\"{}\",\"packageName\":\"com.ruoyi.system\",\"params\":{},\"sub\":false,\"tableComment\":\"站内信和用户关联表\",\"tableId\":12,\"tableName\":\"sys_mail_user\",\"tplCategory\":\"crud\",\"tplWebType\":\"element-ui\",\"tree\":false}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-21 18:30:29', 52);
INSERT INTO `sys_oper_log` VALUES (198, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"sys_mail,sys_mail_user\"}', NULL, 0, NULL, '2024-01-21 18:30:44', 345);
INSERT INTO `sys_oper_log` VALUES (199, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/mail/index\",\"createTime\":\"2024-01-21 18:36:03\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1061,\"menuName\":\"站内信\",\"menuType\":\"C\",\"orderNum\":10,\"params\":{},\"parentId\":1,\"path\":\"mail\",\"perms\":\"system:mail:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-21 18:38:00', 60);
INSERT INTO `sys_oper_log` VALUES (200, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/mail/index\",\"createTime\":\"2024-01-21 18:36:03\",\"icon\":\"email\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1061,\"menuName\":\"站内信\",\"menuType\":\"C\",\"orderNum\":10,\"params\":{},\"parentId\":1,\"path\":\"mail\",\"perms\":\"system:mail:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-21 18:38:21', 350);
INSERT INTO `sys_oper_log` VALUES (201, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-01-02 21:22:09\",\"dataScope\":\"4\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,103,1016,1017,1018,1019,1061,1062,1063,1064,1065,1066],\"params\":{},\"remark\":\"OK平台管理员\",\"roleId\":2,\"roleKey\":\"okpayadmin\",\"roleName\":\"OK平台管理员\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-21 18:39:17', 2447);
INSERT INTO `sys_oper_log` VALUES (202, '站内信', 1, 'com.ruoyi.web.controller.system.SysMailController.add()', 'POST', 1, 'admin', NULL, '/system/mail', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-01-21 18:48:28\",\"params\":{},\"status\":\"0\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'mail_content\' doesn\'t have a default value\r\n### The error may exist in file [D:\\projcet\\RuoYi-Vue\\ruoyi-system\\target\\classes\\mapper\\system\\SysMailMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysMailMapper.insertSysMail-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_mail          ( status,                          create_time )           values ( ?,                          ? )\r\n### Cause: java.sql.SQLException: Field \'mail_content\' doesn\'t have a default value\n; Field \'mail_content\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'mail_content\' doesn\'t have a default value', '2024-01-21 18:48:28', 65);
INSERT INTO `sys_oper_log` VALUES (203, '站内信', 1, 'com.ruoyi.web.controller.system.SysMailController.add()', 'POST', 1, 'admin', NULL, '/system/mail', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-01-21 18:51:55\",\"params\":{},\"status\":\"0\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'mail_content\' doesn\'t have a default value\r\n### The error may exist in file [D:\\projcet\\RuoYi-Vue\\ruoyi-system\\target\\classes\\mapper\\system\\SysMailMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysMailMapper.insertSysMail-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_mail          ( status,                          create_time )           values ( ?,                          ? )\r\n### Cause: java.sql.SQLException: Field \'mail_content\' doesn\'t have a default value\n; Field \'mail_content\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'mail_content\' doesn\'t have a default value', '2024-01-21 18:51:55', 4);
INSERT INTO `sys_oper_log` VALUES (204, '站内信', 1, 'com.ruoyi.web.controller.system.SysMailController.add()', 'POST', 1, 'admin', NULL, '/system/mail', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-01-21 18:52:59\",\"params\":{},\"status\":\"0\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'mail_content\' doesn\'t have a default value\r\n### The error may exist in file [D:\\projcet\\RuoYi-Vue\\ruoyi-system\\target\\classes\\mapper\\system\\SysMailMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysMailMapper.insertSysMail-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_mail          ( status,                          create_time )           values ( ?,                          ? )\r\n### Cause: java.sql.SQLException: Field \'mail_content\' doesn\'t have a default value\n; Field \'mail_content\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'mail_content\' doesn\'t have a default value', '2024-01-21 18:53:00', 9);
INSERT INTO `sys_oper_log` VALUES (205, '站内信', 1, 'com.ruoyi.web.controller.system.SysMailController.add()', 'POST', 1, 'admin', NULL, '/system/mail', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-01-21 18:53:25\",\"params\":{},\"status\":\"0\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'mail_content\' doesn\'t have a default value\r\n### The error may exist in file [D:\\projcet\\RuoYi-Vue\\ruoyi-system\\target\\classes\\mapper\\system\\SysMailMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysMailMapper.insertSysMail-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_mail          ( status,                          create_time )           values ( ?,                          ? )\r\n### Cause: java.sql.SQLException: Field \'mail_content\' doesn\'t have a default value\n; Field \'mail_content\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'mail_content\' doesn\'t have a default value', '2024-01-21 18:53:25', 4);
INSERT INTO `sys_oper_log` VALUES (206, '站内信', 1, 'com.ruoyi.web.controller.system.SysMailController.add()', 'POST', 1, 'admin', NULL, '/system/mail', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-01-21 18:53:40\",\"params\":{},\"status\":\"0\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'mail_content\' doesn\'t have a default value\r\n### The error may exist in file [D:\\projcet\\RuoYi-Vue\\ruoyi-system\\target\\classes\\mapper\\system\\SysMailMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysMailMapper.insertSysMail-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_mail          ( status,                          create_time )           values ( ?,                          ? )\r\n### Cause: java.sql.SQLException: Field \'mail_content\' doesn\'t have a default value\n; Field \'mail_content\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'mail_content\' doesn\'t have a default value', '2024-01-21 18:53:40', 5);
INSERT INTO `sys_oper_log` VALUES (207, '站内信', 1, 'com.ruoyi.web.controller.system.SysMailController.add()', 'POST', 1, 'admin', NULL, '/system/mail', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-01-21 18:54:02\",\"params\":{},\"status\":\"0\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'mail_content\' doesn\'t have a default value\r\n### The error may exist in file [D:\\projcet\\RuoYi-Vue\\ruoyi-system\\target\\classes\\mapper\\system\\SysMailMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysMailMapper.insertSysMail-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_mail          ( status,                          create_time )           values ( ?,                          ? )\r\n### Cause: java.sql.SQLException: Field \'mail_content\' doesn\'t have a default value\n; Field \'mail_content\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'mail_content\' doesn\'t have a default value', '2024-01-21 18:54:02', 4);
INSERT INTO `sys_oper_log` VALUES (208, '站内信', 1, 'com.ruoyi.web.controller.system.SysMailController.add()', 'POST', 1, 'admin', NULL, '/system/mail', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-01-21 18:55:10\",\"params\":{},\"status\":\"0\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'mail_content\' doesn\'t have a default value\r\n### The error may exist in file [D:\\projcet\\RuoYi-Vue\\ruoyi-system\\target\\classes\\mapper\\system\\SysMailMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysMailMapper.insertSysMail-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_mail          ( status,                          create_time )           values ( ?,                          ? )\r\n### Cause: java.sql.SQLException: Field \'mail_content\' doesn\'t have a default value\n; Field \'mail_content\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'mail_content\' doesn\'t have a default value', '2024-01-21 18:55:10', 4);
INSERT INTO `sys_oper_log` VALUES (209, '站内信', 1, 'com.ruoyi.web.controller.system.SysMailController.add()', 'POST', 1, 'admin', NULL, '/system/mail', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-01-21 18:55:38\",\"params\":{},\"status\":\"0\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'mail_content\' doesn\'t have a default value\r\n### The error may exist in file [D:\\projcet\\RuoYi-Vue\\ruoyi-system\\target\\classes\\mapper\\system\\SysMailMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysMailMapper.insertSysMail-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_mail          ( status,                          create_time )           values ( ?,                          ? )\r\n### Cause: java.sql.SQLException: Field \'mail_content\' doesn\'t have a default value\n; Field \'mail_content\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'mail_content\' doesn\'t have a default value', '2024-01-21 18:55:39', 19);
INSERT INTO `sys_oper_log` VALUES (210, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-01-02 21:22:09\",\"icon\":\"system\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1,\"menuName\":\"系统管理\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"system\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-21 18:57:18', 61);
INSERT INTO `sys_oper_log` VALUES (211, '站内信', 1, 'com.ruoyi.web.controller.system.SysMailController.add()', 'POST', 1, 'admin', NULL, '/system/mail', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-01-21 18:58:58\",\"params\":{},\"status\":\"0\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'mail_content\' doesn\'t have a default value\r\n### The error may exist in file [D:\\projcet\\RuoYi-Vue\\ruoyi-system\\target\\classes\\mapper\\system\\SysMailMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysMailMapper.insertSysMail-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_mail          ( status,                          create_time )           values ( ?,                          ? )\r\n### Cause: java.sql.SQLException: Field \'mail_content\' doesn\'t have a default value\n; Field \'mail_content\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'mail_content\' doesn\'t have a default value', '2024-01-21 18:58:58', 4);
INSERT INTO `sys_oper_log` VALUES (212, '站内信', 1, 'com.ruoyi.web.controller.system.SysMailController.add()', 'POST', 1, 'admin', NULL, '/system/mail', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-01-21 19:00:05\",\"params\":{},\"status\":\"0\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'mail_content\' doesn\'t have a default value\r\n### The error may exist in file [D:\\projcet\\RuoYi-Vue\\ruoyi-system\\target\\classes\\mapper\\system\\SysMailMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysMailMapper.insertSysMail-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_mail          ( status,                          create_time )           values ( ?,                          ? )\r\n### Cause: java.sql.SQLException: Field \'mail_content\' doesn\'t have a default value\n; Field \'mail_content\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'mail_content\' doesn\'t have a default value', '2024-01-21 19:00:05', 6);
INSERT INTO `sys_oper_log` VALUES (213, '站内信', 1, 'com.ruoyi.web.controller.system.SysMailController.add()', 'POST', 1, 'admin', NULL, '/system/mail', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-01-21 19:02:19\",\"mailContent\":\"<strong>阿斯蒂芬阿斯蒂芬阿萨德发顺丰</strong><strong>阿斯顿发12</strong>\",\"mailId\":1,\"mailTitle\":\"测试\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-21 19:02:19', 70);
INSERT INTO `sys_oper_log` VALUES (214, '通知公告', 2, 'com.ruoyi.web.controller.system.SysNoticeController.edit()', 'PUT', 1, 'admin', NULL, '/system/notice', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-01-02 21:22:13\",\"noticeContent\":\"<p><strong>新版本内容</strong></p>\",\"noticeId\":1,\"noticeTitle\":\"温馨提醒：2018-07-01 若依新版本发布啦\",\"noticeType\":\"2\",\"params\":{},\"remark\":\"管理员\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-21 19:09:54', 32);
INSERT INTO `sys_oper_log` VALUES (215, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-01-02 21:22:09\",\"dataScope\":\"4\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,103,1016,1017,1018,1019,107,1035,1036,1037,1038],\"params\":{},\"remark\":\"OK平台管理员\",\"roleId\":2,\"roleKey\":\"okpayadmin\",\"roleName\":\"OK平台管理员\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-21 19:11:25', 3491);
INSERT INTO `sys_oper_log` VALUES (216, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/12,11', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-21 19:12:34', 137);
INSERT INTO `sys_oper_log` VALUES (217, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"sys_notice_user\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-21 19:14:31', 124);
INSERT INTO `sys_oper_log` VALUES (218, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"sys_notice_user\"}', NULL, 0, NULL, '2024-01-21 19:14:36', 362);
INSERT INTO `sys_oper_log` VALUES (219, '通知公告', 1, 'com.ruoyi.web.controller.system.SysNoticeController.add()', 'POST', 1, 'okadmin', 'OKPAY平台', '/system/notice', '127.0.0.1', '内网IP', '{\"createBy\":\"okadmin\",\"noticeContent\":\"<p>是的发送到</p><p>阿斯顿发a</p><p>按时a</p>\",\"noticeTitle\":\"测试\",\"noticeType\":\"1\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-21 19:19:07', 2308);
INSERT INTO `sys_oper_log` VALUES (220, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/8', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-22 09:34:36', 13);
INSERT INTO `sys_oper_log` VALUES (221, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"sys_transaction_record\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-22 09:34:49', 42);
INSERT INTO `sys_oper_log` VALUES (222, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"transactionRecord\",\"className\":\"SysTransactionRecord\",\"columns\":[{\"capJavaField\":\"RecordId\",\"columnComment\":\"记录ID\",\"columnId\":128,\"columnName\":\"record_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-01-22 09:34:49\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"recordId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":14,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"交易用户ID\",\"columnId\":129,\"columnName\":\"user_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-01-22 09:34:49\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":14,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"RecordTime\",\"columnComment\":\"交易时间\",\"columnId\":130,\"columnName\":\"record_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-01-22 09:34:49\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"recordTime\",\"javaType\":\"Date\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":14,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"RecordType\",\"columnComment\":\"交易类型（0买币 1卖币 2商家直充 3代理充值 4充值到商户(提现) 5手续费）\",\"columnId\":131,\"columnName\":\"record_type\",\"columnType\":\"char(1)\",\"createBy\":\"admin\",\"createTime\":\"2024-01-22 09:34:49\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrem', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-22 09:35:02', 28);
INSERT INTO `sys_oper_log` VALUES (223, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"sys_transaction_record\"}', NULL, 0, NULL, '2024-01-22 09:35:08', 885);
INSERT INTO `sys_oper_log` VALUES (224, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/4', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-22 13:30:53', 62);
INSERT INTO `sys_oper_log` VALUES (225, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"sys_sale_coin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-22 13:31:03', 160);
INSERT INTO `sys_oper_log` VALUES (226, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"saleCoin\",\"className\":\"SysSaleCoin\",\"columns\":[{\"capJavaField\":\"SaleId\",\"columnComment\":\"卖币ID\",\"columnId\":142,\"columnName\":\"sale_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-01-22 13:31:02\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"saleId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":15,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"SaleNo\",\"columnComment\":\"卖币No\",\"columnId\":143,\"columnName\":\"sale_no\",\"columnType\":\"varchar(3000)\",\"createBy\":\"admin\",\"createTime\":\"2024-01-22 13:31:02\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"saleNo\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":15,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"SaleTime\",\"columnComment\":\"卖币时间\",\"columnId\":144,\"columnName\":\"sale_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-01-22 13:31:02\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"saleTime\",\"javaType\":\"Date\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":15,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"SaleUserId\",\"columnComment\":\"卖币用户ID\",\"columnId\":145,\"columnName\":\"sale_user_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-01-22 13:31:02\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuer', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-22 13:31:10', 114);
INSERT INTO `sys_oper_log` VALUES (227, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"sys_sale_coin\"}', NULL, 0, NULL, '2024-01-22 13:47:18', 2386);
INSERT INTO `sys_oper_log` VALUES (228, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"sys_sale_coin\"}', NULL, 0, NULL, '2024-01-23 08:04:33', 396);
INSERT INTO `sys_oper_log` VALUES (229, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"shopping\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"交易中心\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"shopping\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-23 08:07:11', 39);
INSERT INTO `sys_oper_log` VALUES (230, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/saleCoin/index\",\"createTime\":\"2024-01-23 08:05:33\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1061,\"menuName\":\"交易市场\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1063,\"path\":\"saleCoin\",\"perms\":\"system:saleCoin:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-23 08:07:32', 805);
INSERT INTO `sys_oper_log` VALUES (231, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-01-02 21:22:09\",\"dataScope\":\"4\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,103,1016,1017,1018,1019,107,1035,1036,1037,1038,1063,1061,1062],\"params\":{},\"remark\":\"OK平台管理员\",\"roleId\":2,\"roleKey\":\"okpayadmin\",\"roleName\":\"OK平台管理员\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-23 08:08:02', 117);
INSERT INTO `sys_oper_log` VALUES (232, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-01-02 22:53:21\",\"dataScope\":\"4\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,1063,1061,1062],\"params\":{},\"roleId\":3,\"roleKey\":\"merchant\",\"roleName\":\"商户\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-23 08:08:08', 70);
INSERT INTO `sys_oper_log` VALUES (233, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-01-02 21:22:09\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":4,\"menuName\":\"若依官网\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"http://ruoyi.vip\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-23 08:08:20', 36);
INSERT INTO `sys_oper_log` VALUES (234, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-01-02 21:22:09\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3,\"menuName\":\"系统工具\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"tool\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-23 08:08:24', 54);
INSERT INTO `sys_oper_log` VALUES (235, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-01-02 21:22:09\",\"icon\":\"monitor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2,\"menuName\":\"系统监控\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"monitor\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-23 08:08:28', 62);
INSERT INTO `sys_oper_log` VALUES (236, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"拆分类型\",\"dictType\":\"sale_split_type\",\"params\":{},\"remark\":\"拆分列表\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-23 09:55:05', 349);
INSERT INTO `sys_oper_log` VALUES (237, '字典类型', 9, 'com.ruoyi.web.controller.system.SysDictTypeController.refreshCache()', 'DELETE', 1, 'admin', NULL, '/system/dict/type/refreshCache', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-23 09:55:14', 49);
INSERT INTO `sys_oper_log` VALUES (238, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"支付方式\",\"dictType\":\"pay_type\",\"params\":{},\"remark\":\"支付方式列表\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-23 10:02:19', 3322);
INSERT INTO `sys_oper_log` VALUES (239, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"卖币加急状态\",\"dictType\":\"urgent_sale_status\",\"params\":{},\"remark\":\"卖币加急状态列表\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-23 10:02:46', 314);
INSERT INTO `sys_oper_log` VALUES (240, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"不拆分\",\"dictSort\":0,\"dictType\":\"sale_split_type\",\"dictValue\":\"0\",\"listClass\":\"default\",\"params\":{},\"remark\":\"不拆分\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-23 10:03:58', 49);
INSERT INTO `sys_oper_log` VALUES (241, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"拆分\",\"dictSort\":1,\"dictType\":\"sale_split_type\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-23 10:04:14', 58);
INSERT INTO `sys_oper_log` VALUES (242, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-01-23 10:04:14\",\"default\":false,\"dictCode\":31,\"dictLabel\":\"拆分\",\"dictSort\":1,\"dictType\":\"sale_split_type\",\"dictValue\":\"1\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"remark\":\"拆分\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-23 10:04:19', 74);
INSERT INTO `sys_oper_log` VALUES (243, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"否\",\"dictSort\":0,\"dictType\":\"urgent_sale_status\",\"dictValue\":\"0\",\"listClass\":\"default\",\"params\":{},\"remark\":\"不加急\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-23 10:04:52', 74);
INSERT INTO `sys_oper_log` VALUES (244, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"是\",\"dictSort\":0,\"dictType\":\"urgent_sale_status\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"remark\":\"加急\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-23 10:05:03', 66);
INSERT INTO `sys_oper_log` VALUES (245, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"支付宝\",\"dictSort\":0,\"dictType\":\"pay_type\",\"dictValue\":\"0\",\"listClass\":\"default\",\"params\":{},\"remark\":\"支付宝付款\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-23 10:05:57', 301);
INSERT INTO `sys_oper_log` VALUES (246, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"微信\",\"dictSort\":0,\"dictType\":\"pay_type\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"remark\":\"微信付款\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-23 10:06:08', 323);
INSERT INTO `sys_oper_log` VALUES (247, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"2\",\"dictSort\":2,\"dictType\":\"pay_type\",\"dictValue\":\"银联\",\"listClass\":\"default\",\"params\":{},\"remark\":\"银联付款\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-23 10:06:23', 305);
INSERT INTO `sys_oper_log` VALUES (248, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-01-23 10:06:08\",\"default\":false,\"dictCode\":35,\"dictLabel\":\"微信\",\"dictSort\":1,\"dictType\":\"pay_type\",\"dictValue\":\"1\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"remark\":\"微信付款\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-23 10:06:28', 58);
INSERT INTO `sys_oper_log` VALUES (249, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-01-23 10:05:03\",\"default\":false,\"dictCode\":33,\"dictLabel\":\"是\",\"dictSort\":1,\"dictType\":\"urgent_sale_status\",\"dictValue\":\"1\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"remark\":\"加急\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-23 10:06:40', 308);
INSERT INTO `sys_oper_log` VALUES (250, '字典类型', 9, 'com.ruoyi.web.controller.system.SysDictTypeController.refreshCache()', 'DELETE', 1, 'admin', NULL, '/system/dict/type/refreshCache', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-23 10:06:44', 13);
INSERT INTO `sys_oper_log` VALUES (251, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-01-23 10:06:23\",\"default\":false,\"dictCode\":36,\"dictLabel\":\"银联\",\"dictSort\":2,\"dictType\":\"pay_type\",\"dictValue\":\"2\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"remark\":\"银联付款\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-23 10:09:52', 74);
INSERT INTO `sys_oper_log` VALUES (252, '字典类型', 9, 'com.ruoyi.web.controller.system.SysDictTypeController.refreshCache()', 'DELETE', 1, 'admin', NULL, '/system/dict/type/refreshCache', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-23 10:09:58', 11);
INSERT INTO `sys_oper_log` VALUES (253, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/saleCoin/index\",\"createTime\":\"2024-01-23 08:05:33\",\"icon\":\"list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1061,\"menuName\":\"交易市场\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1063,\"path\":\"saleCoin\",\"perms\":\"system:saleCoin:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-23 10:38:51', 73);
INSERT INTO `sys_oper_log` VALUES (254, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"卖币状态\",\"dictType\":\"sale_status\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-23 11:43:06', 354);
INSERT INTO `sys_oper_log` VALUES (255, '字典类型', 2, 'com.ruoyi.web.controller.system.SysDictTypeController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-01-23 11:43:05\",\"dictId\":14,\"dictName\":\"卖币状态\",\"dictType\":\"sale_status\",\"params\":{},\"remark\":\"卖币状态列表\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-23 11:43:15', 402);
INSERT INTO `sys_oper_log` VALUES (256, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"交易中\",\"dictSort\":0,\"dictType\":\"sale_status\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"remark\":\"卖币状态(交易中)\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-23 12:23:01', 3374);
INSERT INTO `sys_oper_log` VALUES (257, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"已完成\",\"dictSort\":1,\"dictType\":\"sale_status\",\"dictValue\":\"2\",\"listClass\":\"default\",\"params\":{},\"remark\":\"卖币状态(已完成)\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-23 12:23:18', 68);
INSERT INTO `sys_oper_log` VALUES (258, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"已取消\",\"dictSort\":9,\"dictType\":\"sale_status\",\"dictValue\":\"9\",\"listClass\":\"default\",\"params\":{},\"remark\":\"卖币状态(已取消)\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-23 12:23:44', 566);
INSERT INTO `sys_oper_log` VALUES (259, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-01-23 12:23:18\",\"default\":false,\"dictCode\":38,\"dictLabel\":\"已完成\",\"dictSort\":2,\"dictType\":\"sale_status\",\"dictValue\":\"2\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"remark\":\"卖币状态(已完成)\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-23 12:23:49', 69);
INSERT INTO `sys_oper_log` VALUES (260, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-01-23 12:22:58\",\"default\":false,\"dictCode\":37,\"dictLabel\":\"交易中\",\"dictSort\":1,\"dictType\":\"sale_status\",\"dictValue\":\"1\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"remark\":\"卖币状态(交易中)\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-23 12:23:57', 354);
INSERT INTO `sys_oper_log` VALUES (261, '字典类型', 9, 'com.ruoyi.web.controller.system.SysDictTypeController.refreshCache()', 'DELETE', 1, 'admin', NULL, '/system/dict/type/refreshCache', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-23 12:25:55', 30);
INSERT INTO `sys_oper_log` VALUES (262, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"买币状态\",\"dictType\":\"buy_status\",\"params\":{},\"remark\":\"买币状态列表\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-23 17:57:51', 55);
INSERT INTO `sys_oper_log` VALUES (263, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"买家未付款\",\"dictSort\":0,\"dictType\":\"buy_status\",\"dictValue\":\"0\",\"listClass\":\"default\",\"params\":{},\"remark\":\"买家未付款(买家未付款)\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-23 17:58:45', 41);
INSERT INTO `sys_oper_log` VALUES (264, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"买家已付款\",\"dictSort\":1,\"dictType\":\"buy_status\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"remark\":\"卖币状态(买家已付款)\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-23 17:59:19', 2366);
INSERT INTO `sys_oper_log` VALUES (265, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-01-23 17:58:45\",\"default\":false,\"dictCode\":40,\"dictLabel\":\"买家未付款\",\"dictSort\":0,\"dictType\":\"buy_status\",\"dictValue\":\"0\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"remark\":\"卖币状态(买家未付款)\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-23 17:59:26', 74);
INSERT INTO `sys_oper_log` VALUES (266, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-01-23 17:58:45\",\"default\":false,\"dictCode\":40,\"dictLabel\":\"买家未付款\",\"dictSort\":0,\"dictType\":\"buy_status\",\"dictValue\":\"0\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"remark\":\"买币状态(买家未付款)\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-23 17:59:35', 331);
INSERT INTO `sys_oper_log` VALUES (267, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-01-23 17:59:17\",\"default\":false,\"dictCode\":41,\"dictLabel\":\"买家已付款\",\"dictSort\":1,\"dictType\":\"buy_status\",\"dictValue\":\"1\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"remark\":\"买币状态(买家已付款)\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-23 17:59:41', 66);
INSERT INTO `sys_oper_log` VALUES (268, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"卖家已打币\",\"dictSort\":2,\"dictType\":\"buy_status\",\"dictValue\":\"2\",\"listClass\":\"default\",\"params\":{},\"remark\":\"买币状态(卖家已打币)\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-23 18:01:45', 3518);
INSERT INTO `sys_oper_log` VALUES (269, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"已取消\",\"dictSort\":9,\"dictType\":\"buy_status\",\"dictValue\":\"9\",\"listClass\":\"default\",\"params\":{},\"remark\":\"买币状态(已取消)\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-23 18:02:25', 2476);
INSERT INTO `sys_oper_log` VALUES (270, '字典类型', 9, 'com.ruoyi.web.controller.system.SysDictTypeController.refreshCache()', 'DELETE', 1, 'admin', NULL, '/system/dict/type/refreshCache', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-23 18:02:32', 35);
INSERT INTO `sys_oper_log` VALUES (271, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"sys_buy_coin\"}', NULL, 0, NULL, '2024-01-23 18:03:25', 342);
INSERT INTO `sys_oper_log` VALUES (272, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/buyCoin/index\",\"createTime\":\"2024-01-23 18:04:44\",\"icon\":\"drag\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1064,\"menuName\":\"买币\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":1063,\"path\":\"buyCoin\",\"perms\":\"system:buyCoin:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-23 18:05:25', 37);
INSERT INTO `sys_oper_log` VALUES (273, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-01-02 21:22:09\",\"dataScope\":\"4\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,103,1016,1017,1018,1019,107,1035,1036,1037,1038,1063,1061,1062,1064,1065],\"params\":{},\"remark\":\"OK平台管理员\",\"roleId\":2,\"roleKey\":\"okpayadmin\",\"roleName\":\"OK平台管理员\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-23 18:05:49', 101);
INSERT INTO `sys_oper_log` VALUES (274, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-01-02 22:53:21\",\"dataScope\":\"4\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,1063,1061,1062,1064,1065],\"params\":{},\"roleId\":3,\"roleKey\":\"merchant\",\"roleName\":\"商户\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-23 18:05:54', 76);
INSERT INTO `sys_oper_log` VALUES (275, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/buyCoin/index\",\"createTime\":\"2024-01-23 18:04:44\",\"icon\":\"drag\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1064,\"menuName\":\"买币列表\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":1063,\"path\":\"buyCoin\",\"perms\":\"system:buyCoin:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-23 18:32:09', 330);
INSERT INTO `sys_oper_log` VALUES (276, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"sys_transaction_record\"}', NULL, 0, NULL, '2024-01-24 19:29:27', 307);
INSERT INTO `sys_oper_log` VALUES (277, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/transactionRecord/index\",\"createTime\":\"2024-01-24 19:30:23\",\"icon\":\"skill\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1066,\"menuName\":\"交易记录\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":1063,\"path\":\"transactionRecord\",\"perms\":\"system:transactionRecord:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-24 19:31:03', 41);
INSERT INTO `sys_oper_log` VALUES (278, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-01-02 21:22:09\",\"dataScope\":\"4\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,103,1016,1017,1018,1019,107,1035,1036,1037,1038,1063,1061,1062,1064,1065,1066,1067],\"params\":{},\"remark\":\"OK平台管理员\",\"roleId\":2,\"roleKey\":\"okpayadmin\",\"roleName\":\"OK平台管理员\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-24 19:31:22', 173);
INSERT INTO `sys_oper_log` VALUES (279, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-01-02 22:53:21\",\"dataScope\":\"4\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,1063,1061,1062,1064,1065,1066,1067],\"params\":{},\"roleId\":3,\"roleKey\":\"merchant\",\"roleName\":\"商户\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-24 19:31:28', 80);
INSERT INTO `sys_oper_log` VALUES (280, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"交易类型\",\"dictType\":\"transaction_record_type\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-24 20:46:21', 74);
INSERT INTO `sys_oper_log` VALUES (281, '字典类型', 2, 'com.ruoyi.web.controller.system.SysDictTypeController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-01-24 20:46:20\",\"dictId\":16,\"dictName\":\"交易类型\",\"dictType\":\"transaction_record_type\",\"params\":{},\"remark\":\"交易类型列表\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-24 20:46:48', 812);
INSERT INTO `sys_oper_log` VALUES (282, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"买币\",\"dictSort\":0,\"dictType\":\"transaction_record_type\",\"dictValue\":\"0\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-24 20:47:21', 49);
INSERT INTO `sys_oper_log` VALUES (283, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"卖币\",\"dictSort\":1,\"dictType\":\"transaction_record_type\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-24 20:47:30', 343);
INSERT INTO `sys_oper_log` VALUES (284, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"商家直充\",\"dictSort\":2,\"dictType\":\"transaction_record_type\",\"dictValue\":\"2\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-24 20:47:52', 66);
INSERT INTO `sys_oper_log` VALUES (285, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"充值扣款\",\"dictSort\":3,\"dictType\":\"transaction_record_type\",\"dictValue\":\"3\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-24 20:48:06', 340);
INSERT INTO `sys_oper_log` VALUES (286, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"充值到商户\",\"dictSort\":4,\"dictType\":\"transaction_record_type\",\"dictValue\":\"4\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-24 20:48:19', 71);
INSERT INTO `sys_oper_log` VALUES (287, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"手续费\",\"dictSort\":5,\"dictType\":\"transaction_record_type\",\"dictValue\":\"5\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-24 20:48:32', 82);
INSERT INTO `sys_oper_log` VALUES (288, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"余额充值\",\"dictSort\":6,\"dictType\":\"transaction_record_type\",\"dictValue\":\"6\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-24 20:49:09', 802);
INSERT INTO `sys_oper_log` VALUES (289, '字典类型', 9, 'com.ruoyi.web.controller.system.SysDictTypeController.refreshCache()', 'DELETE', 1, 'admin', NULL, '/system/dict/type/refreshCache', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-01-24 20:49:12', 121);
INSERT INTO `sys_oper_log` VALUES (290, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/14', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-02 23:02:10', 168);
INSERT INTO `sys_oper_log` VALUES (291, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"sys_transaction_record\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-02 23:02:15', 125);
INSERT INTO `sys_oper_log` VALUES (292, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"transactionRecord\",\"className\":\"SysTransactionRecord\",\"columns\":[{\"capJavaField\":\"RecordId\",\"columnComment\":\"记录ID\",\"columnId\":159,\"columnName\":\"record_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-02-02 23:02:15\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"recordId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":16,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"交易用户ID\",\"columnId\":160,\"columnName\":\"user_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-02-02 23:02:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":16,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"RecordTime\",\"columnComment\":\"交易时间\",\"columnId\":161,\"columnName\":\"record_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-02-02 23:02:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"recordTime\",\"javaType\":\"Date\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":16,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"RecordType\",\"columnComment\":\"交易类型（0买币 1卖币 2商家直充 3充值From方 4充值到商户(提现) 5手续费 6充值To方）\",\"columnId\":162,\"columnName\":\"record_type\",\"columnType\":\"char(1)\",\"createBy\":\"admin\",\"createTime\":\"2024-02-02 23:02:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-02 23:02:24', 374);
INSERT INTO `sys_oper_log` VALUES (293, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/10', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-02 23:28:50', 150);
INSERT INTO `sys_oper_log` VALUES (294, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"sys_recharge\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-02 23:28:53', 198);
INSERT INTO `sys_oper_log` VALUES (295, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/16', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-02 23:29:07', 63);
INSERT INTO `sys_oper_log` VALUES (296, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"sys_transaction_record\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-02 23:29:12', 119);
INSERT INTO `sys_oper_log` VALUES (297, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"transactionRecord\",\"className\":\"SysTransactionRecord\",\"columns\":[{\"capJavaField\":\"RecordId\",\"columnComment\":\"记录ID\",\"columnId\":187,\"columnName\":\"record_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-02-02 23:29:12\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"recordId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":18,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"交易用户ID\",\"columnId\":188,\"columnName\":\"user_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-02-02 23:29:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":18,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"RecordTime\",\"columnComment\":\"交易时间\",\"columnId\":189,\"columnName\":\"record_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-02-02 23:29:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"recordTime\",\"javaType\":\"Date\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":18,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"RecordType\",\"columnComment\":\"交易类型（0买币 1卖币 2商家直充 3充值From方 4充值到商户(提现) 5手续费 6充值To方）\",\"columnId\":190,\"columnName\":\"record_type\",\"columnType\":\"char(1)\",\"createBy\":\"admin\",\"createTime\":\"2024-02-02 23:29:12\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-02 23:29:18', 78);
INSERT INTO `sys_oper_log` VALUES (298, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"sys_recharge\"}', NULL, 0, NULL, '2024-02-02 23:29:21', 385);
INSERT INTO `sys_oper_log` VALUES (299, '商户管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100\",\"children\":[],\"createAgentFlg\":\"0\",\"deptId\":200,\"deptName\":\"测试商户1\",\"normalCommission\":5,\"orderNum\":0,\"params\":{},\"parentId\":100,\"parentName\":\"OKPAY平台\",\"singleBuyMaxAmount\":1000.0,\"splitMaxRate\":80,\"splitMinRate\":10,\"status\":\"0\",\"ungentCommission\":15,\"updateBy\":\"admin\",\"userId\":3,\"userName\":\"liao1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-26 22:49:16', 258);
INSERT INTO `sys_oper_log` VALUES (300, '商户管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100\",\"children\":[],\"createAgentFlg\":\"0\",\"deptId\":200,\"deptName\":\"测试商户1\",\"normalCommission\":5,\"orderNum\":0,\"params\":{},\"parentId\":100,\"parentName\":\"OKPAY平台\",\"singleBuyMaxAmount\":1000.0,\"splitMaxRate\":80,\"splitMinRate\":10,\"status\":\"0\",\"ungentCommission\":15,\"updateBy\":\"admin\",\"userId\":3,\"userName\":\"liao1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-26 22:51:31', 271);
INSERT INTO `sys_oper_log` VALUES (301, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-01-23 18:01:42\",\"default\":false,\"dictCode\":42,\"dictLabel\":\"卖家已收款\",\"dictSort\":2,\"dictType\":\"buy_status\",\"dictValue\":\"2\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"remark\":\"买币状态(卖家已收款)\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-29 19:53:17', 73);
INSERT INTO `sys_oper_log` VALUES (302, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"卖家已确认\",\"dictSort\":2,\"dictType\":\"buy_status\",\"dictValue\":\"3\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-29 19:53:47', 66);
INSERT INTO `sys_oper_log` VALUES (303, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-02-29 19:53:47\",\"default\":false,\"dictCode\":54,\"dictLabel\":\"卖家已确认\",\"dictSort\":1,\"dictType\":\"buy_status\",\"dictValue\":\"3\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-29 19:53:58', 76);
INSERT INTO `sys_oper_log` VALUES (304, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-01-23 17:59:17\",\"default\":false,\"dictCode\":41,\"dictLabel\":\"买家已付款\",\"dictSort\":2,\"dictType\":\"buy_status\",\"dictValue\":\"1\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"remark\":\"买币状态(买家已付款)\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-29 19:54:07', 60);
INSERT INTO `sys_oper_log` VALUES (305, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-01-23 18:01:42\",\"default\":false,\"dictCode\":42,\"dictLabel\":\"卖家已收款\",\"dictSort\":3,\"dictType\":\"buy_status\",\"dictValue\":\"2\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"remark\":\"买币状态(卖家已收款)\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-29 19:54:16', 74);
INSERT INTO `sys_oper_log` VALUES (306, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-02-29 19:53:47\",\"default\":false,\"dictCode\":54,\"dictLabel\":\"卖家已确认\",\"dictSort\":1,\"dictType\":\"buy_status\",\"dictValue\":\"3\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"remark\":\"买币状态(买家已确认)\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-02-29 19:54:25', 66);
INSERT INTO `sys_oper_log` VALUES (307, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'okadmin', 'OKPAY平台', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"alipayApproveFlg\":\"2\",\"amount\":1276.9,\"avatar\":\"\",\"createAgentFlg\":\"0\",\"createBy\":\"\",\"createTime\":\"2024-01-06 00:23:59\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,216\",\"children\":[],\"deptId\":217,\"deptName\":\"测试商户3代理\",\"orderNum\":0,\"params\":{},\"parentId\":216,\"status\":\"0\"},\"deptId\":217,\"email\":\"\",\"idcardBackImg\":\"/profile/upload/2024/01/06/image_20240106002359A002.jpeg\",\"idcardFrontImg\":\"/profile/upload/2024/01/06/image_20240106002359A001.jpeg\",\"idcardNo\":\"465798\",\"inviteCode\":\"834d02\",\"loginDate\":\"2024-02-29 20:02:49\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"代理用户1\",\"normalCommission\":0,\"params\":{},\"parentUserId\":7,\"payPassword\":\"$2a$10$pW2NE3JbntUj/kcF5rXX5.Oaz717hc4C0.iCAJorsbwO6tt6y7lrW\",\"phonenumber\":\"15888888880\",\"postIds\":[],\"realName\":\"李敖\",\"rechargeCommission\":10,\"roleIds\":[4],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":4,\"roleKey\":\"agent\",\"roleName\":\"代理\",\"roleSort\":4,\"status\":\"0\"}],\"sex\":\"0\",\"singleBuyMaxAmount\":0.0,\"splitMaxRate\":0,\"splitMinRate\":0,\"status\":\"0\",\"ungentCommission\":0,\"updateBy\":\"okadmin\",\"userId\":10,\"userName\":\"agent1\",\"userType\":\"03\",\"walletAddress\":\"f81b23c69b951622\",\"wechatPayApproveFlg\":\"2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-01 22:06:26', 173);
INSERT INTO `sys_oper_log` VALUES (308, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"用户类型\",\"dictType\":\"user_type\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-01 22:07:39', 49);
INSERT INTO `sys_oper_log` VALUES (309, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"超级管理员\",\"dictSort\":1,\"dictType\":\"user_type\",\"dictValue\":\"00\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-01 22:08:31', 35);
INSERT INTO `sys_oper_log` VALUES (310, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"平台管理员\",\"dictSort\":2,\"dictType\":\"user_type\",\"dictValue\":\"01\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-01 22:08:49', 58);
INSERT INTO `sys_oper_log` VALUES (311, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"商户\",\"dictSort\":3,\"dictType\":\"user_type\",\"dictValue\":\"02\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-01 22:09:02', 649);
INSERT INTO `sys_oper_log` VALUES (312, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"代理\",\"dictSort\":4,\"dictType\":\"user_type\",\"dictValue\":\"03\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-01 22:09:14', 82);
INSERT INTO `sys_oper_log` VALUES (313, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"客户\",\"dictSort\":5,\"dictType\":\"user_type\",\"dictValue\":\"04\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-01 22:09:24', 312);
INSERT INTO `sys_oper_log` VALUES (314, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"卖币取消退款\",\"dictSort\":7,\"dictType\":\"transaction_record_type\",\"dictValue\":\"7\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-01 22:47:01', 76);
INSERT INTO `sys_oper_log` VALUES (315, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-01-24 20:48:32\",\"default\":false,\"dictCode\":49,\"dictLabel\":\"卖币手续费\",\"dictSort\":5,\"dictType\":\"transaction_record_type\",\"dictValue\":\"5\",\"isDefault\":\"N\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-01 22:47:17', 329);
INSERT INTO `sys_oper_log` VALUES (316, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"充值手续费\",\"dictSort\":8,\"dictType\":\"transaction_record_type\",\"dictValue\":\"8\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-01 22:47:32', 331);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '岗位信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2024-01-02 21:22:09', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2024-01-02 21:22:09', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2024-01-02 21:22:09', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2024-01-02 21:22:09', '', NULL, '');

-- ----------------------------
-- Table structure for sys_recharge
-- ----------------------------
DROP TABLE IF EXISTS `sys_recharge`;
CREATE TABLE `sys_recharge`  (
  `recharge_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '充值ID',
  `from_user_id` bigint(20) NOT NULL COMMENT '充值用户ID',
  `to_user_id` bigint(20) NOT NULL COMMENT '被充值用户ID',
  `recharge_amount` float(10, 2) NULL DEFAULT 0.00 COMMENT '充值金额',
  `recharge_time` datetime NULL DEFAULT NULL COMMENT '充值时间',
  `recharge_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '充值方式（0支付宝 1微信 2银联 3余额）',
  `recharge_from_user_remian_amount` float(10, 2) NULL DEFAULT 0.00 COMMENT '充值用户充值后余额',
  `recharge_to_user_remian_amount` float(10, 2) NULL DEFAULT 0.00 COMMENT '被充值用户充值后余额',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '充值状态（0进行中 1已确认(充值完成) 9已取消）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`recharge_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '充值表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_recharge
-- ----------------------------
INSERT INTO `sys_recharge` VALUES (4, 10, 11, 1.10, '2024-01-24 19:26:37', '3', 0.00, 0.00, '1', 'agent1', '2024-01-24 19:26:37', '', NULL, NULL);
INSERT INTO `sys_recharge` VALUES (5, 10, 11, 50.00, '2024-01-24 19:28:02', '3', 0.00, 0.00, '1', 'agent1', '2024-01-24 19:28:02', '', NULL, NULL);
INSERT INTO `sys_recharge` VALUES (6, 10, 11, 50.00, '2024-02-02 23:15:35', '3', 0.00, 0.00, '1', 'agent1', '2024-02-02 23:15:35', '', NULL, NULL);
INSERT INTO `sys_recharge` VALUES (7, 10, 11, 50.00, '2024-02-02 23:21:46', '3', 0.00, 0.00, '1', 'agent1', '2024-02-02 23:21:46', '', NULL, NULL);
INSERT INTO `sys_recharge` VALUES (8, 10, 11, 50.00, '2024-02-02 23:37:29', '3', 298.90, 3.40, '1', 'agent1', '2024-02-02 23:37:29', '', NULL, NULL);
INSERT INTO `sys_recharge` VALUES (9, 11, 10, 20.00, '2024-03-01 22:51:22', '3', 1298.40, 1256.90, '1', 'kehu1', '2024-03-01 22:51:22', '', NULL, NULL);
INSERT INTO `sys_recharge` VALUES (10, 11, 10, 50.00, '2024-03-01 23:17:36', '3', 1248.40, 1301.90, '1', 'kehu1', '2024-03-01 23:17:36', '', NULL, NULL);
INSERT INTO `sys_recharge` VALUES (11, 11, 10, 50.00, '2024-03-01 23:18:44', '3', 1198.40, 1346.90, '1', 'kehu1', '2024-03-01 23:18:44', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2024-01-02 21:22:09', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, 'OK平台管理员', 'okpayadmin', 2, '4', 1, 1, '0', '0', 'admin', '2024-01-02 21:22:09', 'admin', '2024-01-24 19:31:21', 'OK平台管理员');
INSERT INTO `sys_role` VALUES (3, '商户', 'merchant', 3, '4', 1, 1, '0', '0', 'admin', '2024-01-02 22:53:21', 'admin', '2024-01-24 19:31:28', NULL);
INSERT INTO `sys_role` VALUES (4, '代理', 'agent', 4, '1', 1, 1, '0', '0', 'admin', '2024-01-02 22:53:36', '', '2024-01-04 22:45:05', NULL);
INSERT INTO `sys_role` VALUES (5, '客户', 'customer', 5, '1', 1, 1, '0', '0', 'admin', '2024-01-04 22:44:34', '', '2024-01-04 22:44:59', NULL);

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1061);
INSERT INTO `sys_role_menu` VALUES (2, 1062);
INSERT INTO `sys_role_menu` VALUES (2, 1063);
INSERT INTO `sys_role_menu` VALUES (2, 1064);
INSERT INTO `sys_role_menu` VALUES (2, 1065);
INSERT INTO `sys_role_menu` VALUES (2, 1066);
INSERT INTO `sys_role_menu` VALUES (2, 1067);
INSERT INTO `sys_role_menu` VALUES (2, 1068);
INSERT INTO `sys_role_menu` VALUES (2, 1069);
INSERT INTO `sys_role_menu` VALUES (3, 1);
INSERT INTO `sys_role_menu` VALUES (3, 100);
INSERT INTO `sys_role_menu` VALUES (3, 1000);
INSERT INTO `sys_role_menu` VALUES (3, 1001);
INSERT INTO `sys_role_menu` VALUES (3, 1002);
INSERT INTO `sys_role_menu` VALUES (3, 1003);
INSERT INTO `sys_role_menu` VALUES (3, 1004);
INSERT INTO `sys_role_menu` VALUES (3, 1005);
INSERT INTO `sys_role_menu` VALUES (3, 1006);
INSERT INTO `sys_role_menu` VALUES (3, 1061);
INSERT INTO `sys_role_menu` VALUES (3, 1062);
INSERT INTO `sys_role_menu` VALUES (3, 1063);
INSERT INTO `sys_role_menu` VALUES (3, 1064);
INSERT INTO `sys_role_menu` VALUES (3, 1065);
INSERT INTO `sys_role_menu` VALUES (3, 1066);
INSERT INTO `sys_role_menu` VALUES (3, 1067);
INSERT INTO `sys_role_menu` VALUES (3, 1068);
INSERT INTO `sys_role_menu` VALUES (3, 1069);

-- ----------------------------
-- Table structure for sys_sale_coin
-- ----------------------------
DROP TABLE IF EXISTS `sys_sale_coin`;
CREATE TABLE `sys_sale_coin`  (
  `sale_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '卖币ID',
  `sale_no` varchar(3000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '卖币No',
  `sale_time` datetime NULL DEFAULT NULL COMMENT '卖币时间',
  `sale_user_id` bigint(20) NOT NULL COMMENT '卖币用户ID',
  `sale_split_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '卖币拆分类型（0不拆分 1拆分）',
  `support_buy_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '支持支付类型',
  `sale_amount` float(10, 2) NULL DEFAULT 0.00 COMMENT '卖币金额',
  `sale_amount_without_commission` float(10, 2) NULL DEFAULT 0.00 COMMENT '扣除手续费可交易金额',
  `commission_amount` float(10, 2) NULL DEFAULT 0.00 COMMENT '手续费',
  `remain_amount` float(10, 2) NULL DEFAULT 0.00 COMMENT '订单剩余金额',
  `split_min_rate` int(3) NULL DEFAULT 0 COMMENT '拆分购买最小金额比例',
  `split_max_rate` int(3) NULL DEFAULT 0 COMMENT '拆分购买最大金额比例',
  `single_buy_max_amount` float(10, 2) NULL DEFAULT 0.00 COMMENT '单次购买上限金额',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '卖币状态（0生成订单 1交易中 2已完成 9已取消）',
  `urgent_sale_flg` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '加急状态（0否 1是）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`sale_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '卖币表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_sale_coin
-- ----------------------------
INSERT INTO `sys_sale_coin` VALUES (7, 'OK20240123145552604', '2024-01-23 14:55:52', 7, '0', '0,1,2', 500.00, 500.00, 0.00, 500.00, 0, 0, 0.00, '1', '0', 'liao3', '2024-01-23 14:55:52', '', NULL, NULL);
INSERT INTO `sys_sale_coin` VALUES (8, 'OK20240123145602799', '2024-01-23 14:56:02', 7, '1', '1,2', 1200.00, 1200.00, 0.00, 1200.00, 0, 0, 0.00, '1', '0', 'liao3', '2024-01-23 14:56:02', '', NULL, NULL);
INSERT INTO `sys_sale_coin` VALUES (9, 'OK20240123145622622', '2024-01-23 14:56:22', 7, '0', '2,1', 100.00, 100.00, 0.00, 100.00, 0, 0, 0.00, '2', '1', 'liao3', '2024-01-23 14:56:22', '', '2024-01-23 15:17:21', NULL);
INSERT INTO `sys_sale_coin` VALUES (10, 'OK20240123152607140', '2024-01-23 15:26:07', 11, '0', '0,2', 50.00, 47.50, 2.50, 47.50, 0, 0, 0.00, '2', '0', 'kehu1', '2024-01-23 15:26:07', 'kehu1', '2024-01-23 15:31:36', NULL);
INSERT INTO `sys_sale_coin` VALUES (11, 'OK20240123153942443', '2024-01-23 15:39:42', 11, '1', '0,1,2', 20.00, 18.00, 2.00, 8.00, 0, 0, 0.00, '1', '1', 'kehu1', '2024-01-23 15:39:42', 'kehu1', '2024-01-23 19:36:55', NULL);
INSERT INTO `sys_sale_coin` VALUES (13, 'OK20240123185252742', '2024-01-23 18:52:52', 7, '0', '0,1', 180.00, 180.00, 0.00, 180.00, 0, 0, 0.00, '2', '0', 'liao3', '2024-01-23 18:52:52', '', '2024-01-23 18:53:30', NULL);
INSERT INTO `sys_sale_coin` VALUES (14, 'OK20240227201741924', '2024-02-27 20:17:41', 11, '1', '0,1,2', 100.00, 90.00, 10.00, 90.00, 15, 0, 2000.00, '1', '1', 'kehu1', '2024-02-27 20:17:41', 'agent1', '2024-02-28 23:57:39', NULL);
INSERT INTO `sys_sale_coin` VALUES (15, 'OK20240227213538654', '2024-02-27 21:35:38', 10, '1', '0,1,2', 100.00, 90.00, 10.00, 0.00, 15, 0, 2000.00, '2', '1', 'agent1', '2024-02-27 21:35:38', 'AUTO', '2024-02-29 20:38:36', NULL);
INSERT INTO `sys_sale_coin` VALUES (16, 'OK20240228222147130', '2024-02-28 22:21:47', 10, '1', '0,1,2', 100.00, 90.00, 10.00, 90.00, 15, 0, 2000.00, '9', '1', 'agent1', '2024-02-28 22:21:47', 'agent1', '2024-02-28 22:25:42', NULL);
INSERT INTO `sys_sale_coin` VALUES (17, 'OK20240228222553001', '2024-02-28 22:26:16', 10, '1', '0,1,2', 100.00, 90.00, 10.00, 90.00, 15, 0, 2000.00, '9', '1', 'agent1', '2024-02-28 22:26:16', 'agent1', '2024-02-28 22:26:51', NULL);
INSERT INTO `sys_sale_coin` VALUES (18, 'OK20240229204213688', '2024-02-29 20:42:13', 10, '1', '0,1,2', 100.00, 90.00, 10.00, 0.00, 15, 0, 2000.00, '2', '1', 'agent1', '2024-02-29 20:42:13', 'AUTO_FINISH', '2024-02-29 20:53:42', NULL);
INSERT INTO `sys_sale_coin` VALUES (19, 'OK20240229205633909', '2024-02-29 20:56:33', 10, '1', '0,1,2', 100.00, 90.00, 10.00, 70.00, 15, 0, 2000.00, '1', '1', 'agent1', '2024-02-29 20:56:33', 'agent1', '2024-02-29 20:56:56', NULL);

-- ----------------------------
-- Table structure for sys_transaction_record
-- ----------------------------
DROP TABLE IF EXISTS `sys_transaction_record`;
CREATE TABLE `sys_transaction_record`  (
  `record_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `user_id` bigint(20) NOT NULL COMMENT '交易用户ID',
  `record_time` datetime NULL DEFAULT NULL COMMENT '交易时间',
  `record_type` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '交易类型（0买币 1卖币 2商家直充 3充值From方 4充值到商户(提现) 5卖币手续费 6充值To方 7卖币退款 8充值手续费）',
  `buy_id` bigint(20) NULL DEFAULT NULL COMMENT '买币ID',
  `sale_id` bigint(20) NULL DEFAULT NULL COMMENT '卖币ID',
  `recharge_id` bigint(20) NULL DEFAULT NULL COMMENT '充值ID',
  `record_amount` float(10, 2) NULL DEFAULT 0.00 COMMENT '交易金额',
  `user_remain_amount` float(10, 2) NULL DEFAULT 0.00 COMMENT '交易后余额',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '记录状态（0正常 1取消 9临时创建）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`record_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 60 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '交易记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_transaction_record
-- ----------------------------
INSERT INTO `sys_transaction_record` VALUES (3, 7, '2024-01-23 14:55:52', '1', NULL, 7, NULL, 500.00, 0.00, '0', '', '2024-01-23 14:55:52', '', NULL, NULL);
INSERT INTO `sys_transaction_record` VALUES (4, 7, '2024-01-23 14:56:02', '1', NULL, 8, NULL, 1200.00, 0.00, '0', '', '2024-01-23 14:56:02', '', NULL, NULL);
INSERT INTO `sys_transaction_record` VALUES (5, 7, '2024-01-23 14:56:22', '1', NULL, 9, NULL, 100.00, 0.00, '0', '', '2024-01-23 14:56:22', '', NULL, NULL);
INSERT INTO `sys_transaction_record` VALUES (8, 11, '2024-01-23 15:24:14', '0', 4, NULL, NULL, 100.00, 0.00, '0', '', '2024-01-23 15:24:14', '', NULL, NULL);
INSERT INTO `sys_transaction_record` VALUES (9, 11, '2024-01-23 15:26:07', '1', NULL, 10, NULL, 50.00, 0.00, '0', '', '2024-01-23 15:26:07', 'kehu1', '2024-01-23 15:26:30', NULL);
INSERT INTO `sys_transaction_record` VALUES (10, 7, '2024-01-23 15:26:31', '5', NULL, 10, NULL, 2.50, 0.00, '0', '', '2024-01-23 15:26:31', '', NULL, NULL);
INSERT INTO `sys_transaction_record` VALUES (11, 7, '2024-01-23 15:31:36', '0', 5, NULL, NULL, 47.50, 0.00, '0', 'liao3', '2024-01-23 15:31:36', '', NULL, NULL);
INSERT INTO `sys_transaction_record` VALUES (12, 11, '2024-01-23 15:39:42', '1', NULL, 11, NULL, 20.00, 0.00, '0', 'kehu1', '2024-01-23 15:39:42', 'kehu1', '2024-01-23 15:39:48', NULL);
INSERT INTO `sys_transaction_record` VALUES (13, 7, '2024-01-23 15:39:48', '5', NULL, 11, NULL, 2.00, 0.00, '0', 'kehu1', '2024-01-23 15:39:48', '', NULL, NULL);
INSERT INTO `sys_transaction_record` VALUES (15, 7, '2024-01-23 18:52:53', '1', NULL, 13, NULL, 180.00, 0.00, '0', '', '2024-01-23 18:52:53', '', NULL, NULL);
INSERT INTO `sys_transaction_record` VALUES (20, 7, '2024-01-23 19:36:56', '0', 10, NULL, NULL, 10.00, 0.00, '0', 'liao3', '2024-01-23 19:36:56', '', NULL, NULL);
INSERT INTO `sys_transaction_record` VALUES (27, 10, '2024-01-24 19:26:37', '3', NULL, NULL, 4, 1.10, 0.00, '0', 'agent1', '2024-01-24 19:26:37', '', NULL, NULL);
INSERT INTO `sys_transaction_record` VALUES (28, 11, '2024-01-24 19:26:37', '6', NULL, NULL, 4, 1.10, 0.00, '0', 'agent1', '2024-01-24 19:26:37', '', NULL, NULL);
INSERT INTO `sys_transaction_record` VALUES (29, 10, '2024-01-24 19:28:02', '3', NULL, NULL, 5, 50.00, 0.00, '0', 'agent1', '2024-01-24 19:28:02', '', NULL, NULL);
INSERT INTO `sys_transaction_record` VALUES (30, 11, '2024-01-24 19:28:02', '6', NULL, NULL, 5, 50.00, 0.00, '0', 'agent1', '2024-01-24 19:28:02', '', NULL, NULL);
INSERT INTO `sys_transaction_record` VALUES (31, 10, '2024-02-02 23:15:35', '3', NULL, NULL, 6, 50.00, 0.00, '0', 'agent1', '2024-02-02 23:15:35', '', NULL, NULL);
INSERT INTO `sys_transaction_record` VALUES (32, 10, '2024-02-02 23:21:47', '3', NULL, NULL, 7, 50.00, 0.00, '0', 'agent1', '2024-02-02 23:21:47', '', NULL, NULL);
INSERT INTO `sys_transaction_record` VALUES (33, 11, '2024-02-02 23:21:53', '6', NULL, NULL, 7, 50.00, 348.90, '0', 'agent1', '2024-02-02 23:21:53', '', NULL, NULL);
INSERT INTO `sys_transaction_record` VALUES (34, 10, '2024-02-02 23:37:29', '3', NULL, NULL, 8, 50.00, 0.00, '0', 'agent1', '2024-02-02 23:37:29', '', NULL, NULL);
INSERT INTO `sys_transaction_record` VALUES (35, 11, '2024-02-02 23:37:29', '6', NULL, NULL, 8, 50.00, 298.90, '0', 'agent1', '2024-02-02 23:37:29', '', NULL, NULL);
INSERT INTO `sys_transaction_record` VALUES (36, 11, '2024-02-27 20:17:42', '1', NULL, 14, NULL, 100.00, 1103.40, '0', 'kehu1', '2024-02-27 20:17:42', 'kehu1', '2024-02-27 20:18:03', NULL);
INSERT INTO `sys_transaction_record` VALUES (37, 7, '2024-02-27 20:18:03', '5', NULL, 14, NULL, 10.00, 0.00, '0', 'kehu1', '2024-02-27 20:18:03', '', NULL, NULL);
INSERT INTO `sys_transaction_record` VALUES (38, 10, '2024-02-27 21:35:38', '1', NULL, 15, NULL, 100.00, 198.90, '0', 'agent1', '2024-02-27 21:35:38', 'agent1', '2024-02-27 21:36:00', NULL);
INSERT INTO `sys_transaction_record` VALUES (39, 7, '2024-02-27 21:36:00', '5', NULL, 15, NULL, 10.00, 0.00, '0', 'agent1', '2024-02-27 21:36:00', '', NULL, NULL);
INSERT INTO `sys_transaction_record` VALUES (40, 11, '2024-02-27 22:25:24', '0', 11, NULL, NULL, 70.00, 1173.40, '0', 'admin', '2024-02-27 22:25:24', '', NULL, NULL);
INSERT INTO `sys_transaction_record` VALUES (41, 10, '2024-02-28 22:21:47', '1', NULL, 16, NULL, 100.00, 98.90, '9', 'agent1', '2024-02-28 22:21:47', 'agent1', '2024-02-28 22:25:41', NULL);
INSERT INTO `sys_transaction_record` VALUES (42, 10, '2024-02-28 22:26:16', '1', NULL, 17, NULL, 100.00, 98.90, '9', 'agent1', '2024-02-28 22:26:16', 'agent1', '2024-02-28 22:26:51', NULL);
INSERT INTO `sys_transaction_record` VALUES (43, 11, '2024-02-29 20:24:35', '0', 17, NULL, NULL, 15.00, 1188.40, '0', 'AUTO', '2024-02-29 20:24:35', '', NULL, NULL);
INSERT INTO `sys_transaction_record` VALUES (44, 11, '2024-02-29 20:41:54', '0', 18, NULL, NULL, 5.00, 1208.40, '0', 'AUTO', '2024-02-29 20:41:54', '', NULL, NULL);
INSERT INTO `sys_transaction_record` VALUES (45, 10, '2024-02-29 20:42:13', '1', NULL, 18, NULL, 100.00, 98.90, '0', 'agent1', '2024-02-29 20:42:13', 'agent1', '2024-02-29 20:44:28', NULL);
INSERT INTO `sys_transaction_record` VALUES (46, 7, '2024-02-29 20:44:31', '5', NULL, 18, NULL, 10.00, 0.00, '0', 'agent1', '2024-02-29 20:44:31', '', NULL, NULL);
INSERT INTO `sys_transaction_record` VALUES (47, 11, '2024-02-29 20:53:42', '0', 19, NULL, NULL, 90.00, 1298.40, '0', 'AUTO_FINISH', '2024-02-29 20:53:42', '', NULL, NULL);
INSERT INTO `sys_transaction_record` VALUES (48, 10, '2024-02-29 20:56:37', '1', NULL, 19, NULL, 100.00, 1198.90, '0', 'agent1', '2024-02-29 20:56:37', 'agent1', '2024-02-29 20:56:43', NULL);
INSERT INTO `sys_transaction_record` VALUES (49, 7, '2024-02-29 20:56:43', '5', NULL, 19, NULL, 10.00, 0.00, '0', 'agent1', '2024-02-29 20:56:43', '', NULL, NULL);
INSERT INTO `sys_transaction_record` VALUES (50, 11, '2024-02-29 21:04:02', '0', 20, NULL, NULL, 20.00, 1318.40, '0', 'agent1', '2024-02-29 21:04:02', '', NULL, NULL);
INSERT INTO `sys_transaction_record` VALUES (51, 10, '2024-02-29 22:06:59', '7', NULL, 19, NULL, 78.00, 1276.90, '0', 'agent1', '2024-02-29 22:06:59', '', NULL, NULL);
INSERT INTO `sys_transaction_record` VALUES (52, 11, '2024-03-01 22:51:22', '3', NULL, NULL, 9, 20.00, 0.00, '0', 'kehu1', '2024-03-01 22:51:22', '', NULL, NULL);
INSERT INTO `sys_transaction_record` VALUES (53, 10, '2024-03-01 22:51:22', '6', NULL, NULL, 9, 20.00, 1298.40, '0', 'kehu1', '2024-03-01 22:51:22', '', NULL, NULL);
INSERT INTO `sys_transaction_record` VALUES (54, 11, '2024-03-01 23:17:36', '3', NULL, NULL, 10, 50.00, 0.00, '0', 'kehu1', '2024-03-01 23:17:36', '', NULL, NULL);
INSERT INTO `sys_transaction_record` VALUES (55, 10, '2024-03-01 23:17:36', '6', NULL, NULL, 10, 45.00, 1248.40, '0', 'kehu1', '2024-03-01 23:17:36', '', NULL, NULL);
INSERT INTO `sys_transaction_record` VALUES (56, 10, '2024-03-01 23:17:36', '8', NULL, NULL, 10, 5.00, 203.90, '0', 'kehu1', '2024-03-01 23:17:36', '', NULL, NULL);
INSERT INTO `sys_transaction_record` VALUES (57, 11, '2024-03-01 23:18:44', '3', NULL, NULL, 11, 50.00, 0.00, '0', 'kehu1', '2024-03-01 23:18:44', '', NULL, NULL);
INSERT INTO `sys_transaction_record` VALUES (58, 10, '2024-03-01 23:18:44', '6', NULL, NULL, 11, 45.00, 1198.40, '0', 'kehu1', '2024-03-01 23:18:44', '', NULL, NULL);
INSERT INTO `sys_transaction_record` VALUES (59, 7, '2024-03-01 23:18:44', '8', NULL, NULL, 11, 5.00, 208.90, '0', 'kehu1', '2024-03-01 23:18:44', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户,01平台管理员,02商户,03代理,04客户）',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '密码',
  `pay_password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付密码',
  `real_name` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `idcard_no` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号码',
  `idcard_front_img` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证正面图片路径',
  `idcard_back_img` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证反面图片路径',
  `face_img` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '人脸图片路径',
  `wallet_address` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '钱包地址',
  `amount` float(10, 2) NULL DEFAULT 0.00 COMMENT '余额',
  `invite_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邀请码',
  `wechat_pay_remark` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信收款填充信息',
  `wechat_pay_img` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信收款码图片地址',
  `alipay_remark` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付宝收款填充信息',
  `alipay_img` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付宝收款码图片地址',
  `unionpay_remark` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '银联填充信息',
  `unionpay_account` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '银联收款户名',
  `unionpay_card` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '银联收款卡号',
  `parent_user_id` bigint(20) NULL DEFAULT 0 COMMENT '上级用户ID',
  `ungent_commission` int(3) NULL DEFAULT 0 COMMENT '加急手续费',
  `normal_commission` int(3) NULL DEFAULT 0 COMMENT '普通手续费',
  `recharge_commission` int(3) NULL DEFAULT 0 COMMENT '转账手续费',
  `create_agent_flg` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '是否可以创建代理（0可以 1不行）',
  `split_min_rate` int(3) NULL DEFAULT 0 COMMENT '拆分购买最小金额比例',
  `split_max_rate` int(3) NULL DEFAULT 0 COMMENT '拆分购买最大金额比例',
  `single_buy_max_amount` float NULL DEFAULT 0 COMMENT '单次购买上限金额',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, NULL, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '/profile/avatar/2024/01/07/头像_20240107111226A001.png', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', NULL, NULL, '351', NULL, NULL, NULL, NULL, 0.00, 'a12c', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 0, '0', 0, 0, 0, '0', '0', '127.0.0.1', '2024-03-01 22:06:59', 'admin', '2024-01-02 21:22:09', '', '2024-03-01 22:06:59', '管理员');
INSERT INTO `sys_user` VALUES (2, 100, 'okadmin', 'OK平台管理员', '01', 'r1@qq.com', '15666666666', '0', '/profile/avatar/2024/01/07/头像2_20240107111704A002.png', '$2a$10$drG84FUnSUmIpfYgmGu4SO4JRAofckH0Tu8jrLk6iUB7us3QCTmNO', NULL, '冷笑话', '350', '/profile/upload/2024/01/02/身份证正面_20240102234517A001.png', '/profile/upload/2024/01/02/身份证反面_20240102235056A002.png', NULL, NULL, 0.00, '789c', NULL, '/profile/upload/2024/01/02/二维码1_20240102235100A003.PNG', NULL, '/profile/upload/2024/01/02/二维码2_20240102235103A004.PNG', NULL, '1231', '123', 0, 0, 0, 0, '0', 0, 0, 0, '0', '0', '127.0.0.1', '2024-03-01 22:05:41', 'admin', '2024-01-02 21:22:09', 'admin', '2024-03-01 22:05:41', '测试员');
INSERT INTO `sys_user` VALUES (3, 200, 'liao1', '测试商户', '02', '', '', '0', '', '$2a$10$hcDdKFCeyLfYAB6vOVwzV.pTBfgv7HHC//RG7hgeN5fcJfW7M43WC', NULL, NULL, NULL, '/profile/upload/2024/01/03/身份证正面_20240103001027A005.png', '/profile/upload/2024/01/04/身份证反面_20240104224213A001.png', NULL, '96dd63595f287715', 0.00, 'e7afd6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 15, 5, 0, '0', 10, 0, 1000, '0', '0', '127.0.0.1', '2024-01-21 10:47:11', 'testadmin', '2024-01-03 00:10:30', 'admin', '2024-02-26 22:51:31', NULL);
INSERT INTO `sys_user` VALUES (4, 207, 'liao2', '测试商户2', '02', '', '', '0', '', '$2a$10$HU03gJI4V9HyUaXG83UmB.KYhPWLTucXF4wkQYTZwoicJjC8UA7py', NULL, NULL, NULL, NULL, NULL, NULL, '31dfd5da15491918', 0.00, '52541b', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 10, 5, 0, '0', 0, 0, 0, '0', '0', '127.0.0.1', '2024-01-04 23:41:52', 'admin', '2024-01-04 23:05:25', '', '2024-01-04 23:41:51', NULL);
INSERT INTO `sys_user` VALUES (7, 216, 'liao3', '测试商户3', '02', '', '', '0', '', '$2a$10$toRIxcMdTCYcPwmVwBNFTe/0gjep7mSU315FdsShpJeTmWucbZtAm', NULL, NULL, NULL, NULL, NULL, NULL, 'bda658a8deaeb84f', 208.90, '506309', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 10, 5, 0, '1', 15, 0, 2000, '0', '0', '127.0.0.1', '2024-01-24 21:02:43', 'admin', '2024-01-04 23:20:30', '', '2024-01-24 21:02:42', NULL);
INSERT INTO `sys_user` VALUES (10, 217, 'agent1', '代理用户1', '03', '', '15888888880', '0', '', '$2a$10$VC.K8bUrw/VOw8lHiTzIW.gRzNgTuUa23QbVEcrCGsGLPReRRN/su', '$2a$10$xlssbvg5snLtsU5IH1bOa.katjFBryMYf20QkN1t95Aq0sJ61x4Ea', '李敖', '465798', '/profile/upload/2024/01/06/image_20240106002359A001.jpeg', '/profile/upload/2024/01/06/image_20240106002359A002.jpeg', NULL, 'f81b23c69b951622', 1346.90, '834d02', NULL, '/profile/upload/2024/01/06/image_20240106204519A001.jpeg', NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 10, '0', 0, 0, 0, '0', '0', '127.0.0.1', '2024-02-29 20:02:49', '', '2024-01-06 00:23:59', 'admin', '2024-03-01 22:23:04', NULL);
INSERT INTO `sys_user` VALUES (11, 218, 'kehu1', '测试客户new1', '04', '', '15888888881', '0', '/profile/upload/2024/01/21/image_20240121170818A001.jpeg', '$2a$10$eCHngkkX93fWTLmH4iX0cu/WA.RiuQokpXft7ypl7NJ/KknX4KJey', '$2a$10$no4ZDhvNT7prNN8PF3w3reRdww7S.sdm1PA3/B0ak8bVZd2UKn7pW', '客', '12312312', '/profile/upload/2024/01/13/image_20240113231017A001.jpeg', '/profile/upload/2024/01/13/image_20240113231017A002.jpeg', NULL, '640a5d739e2e3fd0', 1198.40, '0e9ace', '微信支付补充信息', '/profile/upload/2024/01/21/image_20240121165650A001.jpeg', NULL, NULL, NULL, NULL, NULL, 10, 0, 0, 0, '0', 0, 0, 0, '0', '0', '127.0.0.1', '2024-03-01 22:21:47', '', '2024-01-13 23:10:17', 'admin', '2024-03-01 22:22:20', 'hello');
INSERT INTO `sys_user` VALUES (12, 219, 'liao4', '测试商户4', '02', '', '', '0', '', '$2a$10$wkffx1ddD7D3FXPh9FKTJeao8Zzzqbt0u9wmiEyze8v8nNKWmdr4S', NULL, NULL, NULL, NULL, NULL, NULL, '21648c3fabab84c3', 0.00, '750e5f', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 10, 5, 0, '0', 0, 0, 0, '0', '0', '', NULL, 'okadmin', '2024-01-19 22:53:21', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (13, 220, 'agent2', '测试代理2', '03', '', '15888888882', '0', '', '$2a$10$SGV242RHmdUlb15eH4xBp.HxGQoy2CRHqsMaMPrOMVuN1oWvlG.Wy', '$2a$10$2TnEyCbt/0u79ec4t91KuuAmY/u0tVCUzo7QeUMQ.b29qvRkF6IdO', '客', '123123121', '/profile/upload/2024/01/19/image_20240119225435A001.jpeg', '/profile/upload/2024/01/19/image_20240119225435A002.jpeg', NULL, '392a0c09a2d5cbbf', 0.00, '9b9e1c', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 12, 0, 0, 0, '0', 0, 0, 0, '0', '0', '127.0.0.1', '2024-02-28 23:54:52', '', '2024-01-19 22:54:35', 'okadmin', '2024-02-28 23:54:52', NULL);
INSERT INTO `sys_user` VALUES (14, 221, 'kehu2', '测试客户2', '04', '', '15888888883', '0', '', '$2a$10$JzhQ5X2k9YpDofOx0PdZ/enIJexzZ8DBLL9ngT5ulbm2rPP2MO29u', '$2a$10$gWqK.tYlf42quKXwTjabkunaL9nUYxx.XYA0WnsJiiYqS0SXFZA7y', '客2', '1231231211', '/profile/upload/2024/01/19/image_20240119225611A003.jpeg', '/profile/upload/2024/01/19/image_20240119225611A004.jpeg', NULL, '609c28593886f5a4', 0.00, '7df77f', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 13, 0, 0, 0, '0', 0, 0, 0, '0', '0', '127.0.0.1', '2024-01-20 10:23:18', '', '2024-01-19 22:56:12', '', '2024-01-20 10:23:17', NULL);
INSERT INTO `sys_user` VALUES (15, 217, 'agent3', '代理3', '03', '', '18788888880', '0', '', '$2a$10$7qHO4ZzBip/vbsf3Y2Nq4uBC5AFYUomh2SIeA30pfeASV62nIUoLC', '$2a$10$RFMljx1IMrTqrQECPJeWz.Xrq1VK3YZdY49i.lPPsebmTIYXfu0EC', '客2', '1231231211', '/profile/upload/2024/03/01/image_20240301225825A001.jpeg', '/profile/upload/2024/03/01/image_20240301225829A002.jpeg', NULL, '4be5ab4eec46ff66', 0.00, '6d9ae2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 7, 0, 0, 0, '0', 0, 0, 0, '0', '0', '', NULL, '', '2024-03-01 22:58:29', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (16, 218, 'kehu3', '客户3', '04', '', '18788888881', '0', '', '$2a$10$n6irqgjs2kqqSNtFxVFb6eGlkeUAzK5Fejo0cu4/OzfnN/3cQFnlK', '$2a$10$5MXDmPdMyXOIxf0sLDrmte/KHUsaVPvK5zTjDfXE5x1vPOnYzepRW', '客2', '1231231211', '/profile/upload/2024/03/01/image_20240301225909A003.jpeg', '/profile/upload/2024/03/01/image_20240301225909A004.jpeg', NULL, '65cf4f1546abebe5', 0.00, 'fc6777', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15, 0, 0, 0, '0', 0, 0, 0, '0', '0', '127.0.0.1', '2024-03-01 23:00:47', '', '2024-03-01 22:59:10', '', '2024-03-01 23:00:46', NULL);
INSERT INTO `sys_user` VALUES (17, 218, 'kehu4', '客户4', '04', '', '18788888882', '0', '', '$2a$10$1IeKVledGhFpOXNGr3QFPedyzR/iBMLz.lr2Ze2NluqnI9flX28qS', '$2a$10$4W8QIOFsheVYkBs0gE2sBeHfTnIdYgps5VCQJZHX0Lkd4YBXc6uu2', '客2', '1231231211', '/profile/upload/2024/03/01/image_20240301225927A005.jpeg', '/profile/upload/2024/03/01/image_20240301225928A006.jpeg', NULL, '5fd4d9ef3162f964', 0.00, 'f58cbc', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15, 0, 0, 0, '0', 0, 0, 0, '0', '0', '', NULL, '', '2024-03-01 22:59:28', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_user_pay_type_approve
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_pay_type_approve`;
CREATE TABLE `sys_user_pay_type_approve`  (
  `pay_type_approve_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '承认ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `pay_type` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付方式（0支付宝,1微信）',
  `pay_remark` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付方式填充信息',
  `pay_img` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收款码图片地址',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0未审核 1审核成功 9否认）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`pay_type_approve_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户支付方式审核表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_pay_type_approve
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = DYNAMIC;

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
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);
INSERT INTO `sys_user_role` VALUES (3, 3);
INSERT INTO `sys_user_role` VALUES (4, 3);
INSERT INTO `sys_user_role` VALUES (7, 3);
INSERT INTO `sys_user_role` VALUES (10, 4);
INSERT INTO `sys_user_role` VALUES (11, 5);
INSERT INTO `sys_user_role` VALUES (12, 3);
INSERT INTO `sys_user_role` VALUES (13, 4);
INSERT INTO `sys_user_role` VALUES (14, 5);
INSERT INTO `sys_user_role` VALUES (15, 4);
INSERT INTO `sys_user_role` VALUES (16, 5);
INSERT INTO `sys_user_role` VALUES (17, 5);

SET FOREIGN_KEY_CHECKS = 1;
