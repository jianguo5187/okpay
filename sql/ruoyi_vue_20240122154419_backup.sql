-- MySQL dump 10.13  Distrib 5.7.26, for Win64 (x86_64)
--
-- Host: localhost    Database: ruoyi_vue
-- ------------------------------------------------------
-- Server version	5.7.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `gen_table`
--

DROP TABLE IF EXISTS `gen_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gen_table` (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `tpl_web_type` varchar(30) DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
  `package_name` varchar(100) DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='代码生成业务表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table`
--

LOCK TABLES `gen_table` WRITE;
/*!40000 ALTER TABLE `gen_table` DISABLE KEYS */;
INSERT INTO `gen_table` VALUES (1,'sys_chat','聊天信息表',NULL,NULL,'SysChat','crud','','com.ruoyi.system','system','chat','聊天信息','ruoyi','0','/',NULL,'admin','2024-01-02 21:33:06','',NULL,NULL),(5,'sys_buy_coin','买币表',NULL,NULL,'SysBuyCoin','crud','element-ui','com.ruoyi.system','system','buyCoin','买币','ruoyi','0','/','{}','admin','2024-01-13 15:35:46','','2024-01-13 15:48:35',NULL),(10,'sys_recharge','充值表',NULL,NULL,'SysRecharge','crud','','com.ruoyi.system','system','recharge','充值','ruoyi','0','/',NULL,'admin','2024-01-20 10:17:20','',NULL,NULL),(13,'sys_notice_user','公告和用户关联表',NULL,NULL,'SysNoticeUser','crud','','com.ruoyi.system','system','user','公告和用户关联','ruoyi','0','/',NULL,'admin','2024-01-21 19:14:31','',NULL,NULL),(14,'sys_transaction_record','交易记录表',NULL,NULL,'SysTransactionRecord','crud','element-ui','com.ruoyi.system','system','transactionRecord','交易记录','ruoyi','0','/','{}','admin','2024-01-22 09:34:49','','2024-01-22 09:35:02',NULL),(15,'sys_sale_coin','卖币表',NULL,NULL,'SysSaleCoin','crud','element-ui','com.ruoyi.system','system','saleCoin','卖币','ruoyi','0','/','{}','admin','2024-01-22 13:31:02','','2024-01-22 13:31:10',NULL);
/*!40000 ALTER TABLE `gen_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gen_table_column`
--

DROP TABLE IF EXISTS `gen_table_column`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gen_table_column` (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint(20) DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) DEFAULT '' COMMENT '字典类型',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=159 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='代码生成业务表字段';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table_column`
--

LOCK TABLES `gen_table_column` WRITE;
/*!40000 ALTER TABLE `gen_table_column` DISABLE KEYS */;
INSERT INTO `gen_table_column` VALUES (1,1,'chat_id','角色ID','bigint(20)','Long','chatId','1','1','0','1',NULL,NULL,NULL,'EQ','input','',1,'admin','2024-01-02 21:33:06','',NULL),(2,1,'from_user_id','信息发送用户ID','bigint(20)','Long','fromUserId','0','0','1','1','1','1','1','EQ','input','',2,'admin','2024-01-02 21:33:06','',NULL),(3,1,'to_user_id','信息接收用户ID','bigint(20)','Long','toUserId','0','0','1','1','1','1','1','EQ','input','',3,'admin','2024-01-02 21:33:06','',NULL),(4,1,'content','信息内容','varchar(3000)','String','content','0','0','0','1','1','1','1','EQ','editor','',4,'admin','2024-01-02 21:33:06','',NULL),(5,1,'is_read','是否已读(0 未读 1已读)','char(1)','String','isRead','0','0','0','1','1','1','1','EQ','input','',5,'admin','2024-01-02 21:33:06','',NULL),(6,1,'del_flag','删除标志（0代表存在 2代表删除）','char(1)','String','delFlag','0','0','0','1',NULL,NULL,NULL,'EQ','input','',6,'admin','2024-01-02 21:33:06','',NULL),(7,1,'create_by','创建者','varchar(64)','String','createBy','0','0','0','1',NULL,NULL,NULL,'EQ','input','',7,'admin','2024-01-02 21:33:06','',NULL),(51,5,'buy_id','买币ID','bigint(20)','Long','buyId','1','1','0','1',NULL,NULL,NULL,'EQ','input','',1,'admin','2024-01-13 15:35:46','','2024-01-13 15:48:35'),(52,5,'sale_id','卖币ID','bigint(20)','Long','saleId','0','0','1','1','1','1','1','EQ','input','',2,'admin','2024-01-13 15:35:46','','2024-01-13 15:48:35'),(53,5,'sale_user_id','卖币用户ID','bigint(20)','Long','saleUserId','0','0','1','1','1','1','1','EQ','input','',3,'admin','2024-01-13 15:35:46','','2024-01-13 15:48:35'),(54,5,'buy_user_id','买币用户ID','bigint(20)','Long','buyUserId','0','0','1','1','1','1','1','EQ','input','',4,'admin','2024-01-13 15:35:46','','2024-01-13 15:48:35'),(55,5,'buy_time','买币时间','datetime','Date','buyTime','0','0','0','1','1','1','1','EQ','datetime','',5,'admin','2024-01-13 15:35:46','','2024-01-13 15:48:35'),(56,5,'buy_type','支付方式（0支付宝 1微信 2银联）','varchar(50)','String','buyType','0','0','0','1','1','1','1','EQ','select','',6,'admin','2024-01-13 15:35:46','','2024-01-13 15:48:35'),(57,5,'buy_amount','买币金额','float(10,2)','BigDecimal','buyAmount','0','0','0','1','1','1','1','EQ','input','',7,'admin','2024-01-13 15:35:46','','2024-01-13 15:48:35'),(58,5,'status','买币状态（0进行中 1买家已付款 2卖家已确认(买币完成) 9已取消）','char(1)','String','status','0','0','0','1','1','1','1','EQ','radio','',8,'admin','2024-01-13 15:35:46','','2024-01-13 15:48:35'),(59,5,'create_by','创建者','varchar(64)','String','createBy','0','0','0','1',NULL,NULL,NULL,'EQ','input','',9,'admin','2024-01-13 15:35:46','','2024-01-13 15:48:35'),(60,5,'create_time','创建时间','datetime','Date','createTime','0','0','0','1',NULL,NULL,NULL,'EQ','datetime','',10,'admin','2024-01-13 15:35:46','','2024-01-13 15:48:35'),(61,5,'update_by','更新者','varchar(64)','String','updateBy','0','0','0','1','1',NULL,NULL,'EQ','input','',11,'admin','2024-01-13 15:35:46','','2024-01-13 15:48:35'),(62,5,'update_time','更新时间','datetime','Date','updateTime','0','0','0','1','1',NULL,NULL,'EQ','datetime','',12,'admin','2024-01-13 15:35:46','','2024-01-13 15:48:35'),(63,5,'remark','备注','varchar(500)','String','remark','0','0','0','1','1','1',NULL,'EQ','textarea','',13,'admin','2024-01-13 15:35:46','','2024-01-13 15:48:35'),(102,10,'recharge_id','充值ID','bigint(20)','Long','rechargeId','1','1','0','1',NULL,NULL,NULL,'EQ','input','',1,'admin','2024-01-20 10:17:20','',NULL),(103,10,'from_user_id','充值用户ID','bigint(20)','Long','fromUserId','0','0','1','1','1','1','1','EQ','input','',2,'admin','2024-01-20 10:17:20','',NULL),(104,10,'to_user_id','被充值用户ID','bigint(20)','Long','toUserId','0','0','1','1','1','1','1','EQ','input','',3,'admin','2024-01-20 10:17:20','',NULL),(105,10,'recharge_amount','充值金额','float(10,2)','BigDecimal','rechargeAmount','0','0','0','1','1','1','1','EQ','input','',4,'admin','2024-01-20 10:17:20','',NULL),(106,10,'recharge_time','充值时间','datetime','Date','rechargeTime','0','0','0','1','1','1','1','EQ','datetime','',5,'admin','2024-01-20 10:17:20','',NULL),(107,10,'recharge_type','充值方式（0支付宝 1微信 2银联）','varchar(50)','String','rechargeType','0','0','0','1','1','1','1','EQ','select','',6,'admin','2024-01-20 10:17:20','',NULL),(108,10,'status','充值状态（0进行中 1已确认(充值完成) 9已取消）','char(1)','String','status','0','0','0','1','1','1','1','EQ','radio','',7,'admin','2024-01-20 10:17:20','',NULL),(109,10,'create_by','创建者','varchar(64)','String','createBy','0','0','0','1',NULL,NULL,NULL,'EQ','input','',8,'admin','2024-01-20 10:17:20','',NULL),(110,10,'create_time','创建时间','datetime','Date','createTime','0','0','0','1',NULL,NULL,NULL,'EQ','datetime','',9,'admin','2024-01-20 10:17:20','',NULL),(111,10,'update_by','更新者','varchar(64)','String','updateBy','0','0','0','1','1',NULL,NULL,'EQ','input','',10,'admin','2024-01-20 10:17:20','',NULL),(112,10,'update_time','更新时间','datetime','Date','updateTime','0','0','0','1','1',NULL,NULL,'EQ','datetime','',11,'admin','2024-01-20 10:17:20','',NULL),(113,10,'remark','备注','varchar(500)','String','remark','0','0','0','1','1','1',NULL,'EQ','textarea','',12,'admin','2024-01-20 10:17:20','',NULL),(126,13,'notice_id','公告ID','bigint(20)','Long','noticeId','1','0','0','1',NULL,NULL,NULL,'EQ','input','',1,'admin','2024-01-21 19:14:31','',NULL),(127,13,'user_id','用户ID','bigint(20)','Long','userId','1','0','0','1',NULL,NULL,NULL,'EQ','input','',2,'admin','2024-01-21 19:14:31','',NULL),(128,14,'record_id','记录ID','bigint(20)','Long','recordId','1','1','0','1',NULL,NULL,NULL,'EQ','input','',1,'admin','2024-01-22 09:34:49','','2024-01-22 09:35:02'),(129,14,'user_id','交易用户ID','bigint(20)','Long','userId','0','0','1','1','1','1','1','EQ','input','',2,'admin','2024-01-22 09:34:49','','2024-01-22 09:35:02'),(130,14,'record_time','交易时间','datetime','Date','recordTime','0','0','0','1','1','1','1','EQ','datetime','',3,'admin','2024-01-22 09:34:49','','2024-01-22 09:35:02'),(131,14,'record_type','交易类型（0买币 1卖币 2商家直充 3代理充值 4充值到商户(提现) 5手续费）','char(1)','String','recordType','0','0','0','1','1','1','1','EQ','select','',4,'admin','2024-01-22 09:34:49','','2024-01-22 09:35:02'),(132,14,'buy_id','买币ID','bigint(20)','Long','buyId','0','0','0','1','1','1','1','EQ','input','',5,'admin','2024-01-22 09:34:49','','2024-01-22 09:35:02'),(133,14,'sale_id','卖币ID','bigint(20)','Long','saleId','0','0','0','1','1','1','1','EQ','input','',6,'admin','2024-01-22 09:34:49','','2024-01-22 09:35:02'),(134,14,'recharge_id','充值ID','bigint(20)','Long','rechargeId','0','0','0','1','1','1','1','EQ','input','',7,'admin','2024-01-22 09:34:49','','2024-01-22 09:35:02'),(135,14,'record_amount','交易金额','float(10,2)','BigDecimal','recordAmount','0','0','0','1','1','1','1','EQ','input','',8,'admin','2024-01-22 09:34:49','','2024-01-22 09:35:02'),(136,14,'status','记录状态（0正常 1取消）','char(1)','String','status','0','0','0','1','1','1','1','EQ','radio','',9,'admin','2024-01-22 09:34:49','','2024-01-22 09:35:02'),(137,14,'create_by','创建者','varchar(64)','String','createBy','0','0','0','1',NULL,NULL,NULL,'EQ','input','',10,'admin','2024-01-22 09:34:49','','2024-01-22 09:35:02'),(138,14,'create_time','创建时间','datetime','Date','createTime','0','0','0','1',NULL,NULL,NULL,'EQ','datetime','',11,'admin','2024-01-22 09:34:49','','2024-01-22 09:35:02'),(139,14,'update_by','更新者','varchar(64)','String','updateBy','0','0','0','1','1',NULL,NULL,'EQ','input','',12,'admin','2024-01-22 09:34:49','','2024-01-22 09:35:02'),(140,14,'update_time','更新时间','datetime','Date','updateTime','0','0','0','1','1',NULL,NULL,'EQ','datetime','',13,'admin','2024-01-22 09:34:49','','2024-01-22 09:35:02'),(141,14,'remark','备注','varchar(500)','String','remark','0','0','0','1','1','1',NULL,'EQ','textarea','',14,'admin','2024-01-22 09:34:49','','2024-01-22 09:35:02'),(142,15,'sale_id','卖币ID','bigint(20)','Long','saleId','1','1','0','1',NULL,NULL,NULL,'EQ','input','',1,'admin','2024-01-22 13:31:02','','2024-01-22 13:31:10'),(143,15,'sale_no','卖币No','varchar(3000)','String','saleNo','0','0','0','1','1','1','1','EQ','textarea','',2,'admin','2024-01-22 13:31:02','','2024-01-22 13:31:10'),(144,15,'sale_time','卖币时间','datetime','Date','saleTime','0','0','0','1','1','1','1','EQ','datetime','',3,'admin','2024-01-22 13:31:02','','2024-01-22 13:31:10'),(145,15,'sale_user_id','卖币用户ID','bigint(20)','Long','saleUserId','0','0','1','1','1','1','1','EQ','input','',4,'admin','2024-01-22 13:31:02','','2024-01-22 13:31:10'),(146,15,'sale_split_type','卖币拆分类型（0不拆分 1拆分）','char(1)','String','saleSplitType','0','0','0','1','1','1','1','EQ','select','',5,'admin','2024-01-22 13:31:02','','2024-01-22 13:31:10'),(147,15,'support_buy_type','支持支付类型','varchar(50)','String','supportBuyType','0','0','0','1','1','1','1','EQ','select','',6,'admin','2024-01-22 13:31:03','','2024-01-22 13:31:10'),(148,15,'sale_amount','卖币金额','float(10,2)','BigDecimal','saleAmount','0','0','0','1','1','1','1','EQ','input','',7,'admin','2024-01-22 13:31:03','','2024-01-22 13:31:10'),(149,15,'sale_amount_without_commission','扣除手续费可交易金额','float(10,2)','BigDecimal','saleAmountWithoutCommission','0','0','0','1','1','1','1','EQ','input','',8,'admin','2024-01-22 13:31:03','','2024-01-22 13:31:10'),(150,15,'commission_amount','手续费','float(10,2)','BigDecimal','commissionAmount','0','0','0','1','1','1','1','EQ','input','',9,'admin','2024-01-22 13:31:03','','2024-01-22 13:31:10'),(151,15,'remain_amount','订单剩余金额','float(10,2)','BigDecimal','remainAmount','0','0','0','1','1','1','1','EQ','input','',10,'admin','2024-01-22 13:31:03','','2024-01-22 13:31:10'),(152,15,'status','卖币状态（0生成订单 1交易中 2已完成 9已取消）','char(1)','String','status','0','0','0','1','1','1','1','EQ','radio','',11,'admin','2024-01-22 13:31:03','','2024-01-22 13:31:10'),(153,15,'urgent_sale_flg','加急状态（0否 1是）','char(1)','String','urgentSaleFlg','0','0','0','1','1','1','1','EQ','input','',12,'admin','2024-01-22 13:31:03','','2024-01-22 13:31:10'),(154,15,'create_by','创建者','varchar(64)','String','createBy','0','0','0','1',NULL,NULL,NULL,'EQ','input','',13,'admin','2024-01-22 13:31:03','','2024-01-22 13:31:10'),(155,15,'create_time','创建时间','datetime','Date','createTime','0','0','0','1',NULL,NULL,NULL,'EQ','datetime','',14,'admin','2024-01-22 13:31:03','','2024-01-22 13:31:10'),(156,15,'update_by','更新者','varchar(64)','String','updateBy','0','0','0','1','1',NULL,NULL,'EQ','input','',15,'admin','2024-01-22 13:31:03','','2024-01-22 13:31:10'),(157,15,'update_time','更新时间','datetime','Date','updateTime','0','0','0','1','1',NULL,NULL,'EQ','datetime','',16,'admin','2024-01-22 13:31:03','','2024-01-22 13:31:10'),(158,15,'remark','备注','varchar(500)','String','remark','0','0','0','1','1','1',NULL,'EQ','textarea','',17,'admin','2024-01-22 13:31:03','','2024-01-22 13:31:10');
/*!40000 ALTER TABLE `gen_table_column` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_blob_triggers`
--

DROP TABLE IF EXISTS `qrtz_blob_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_blob_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Blob类型的触发器表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_blob_triggers`
--

LOCK TABLES `qrtz_blob_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_blob_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_blob_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_calendars`
--

DROP TABLE IF EXISTS `qrtz_calendars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_calendars` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`,`calendar_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='日历信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_calendars`
--

LOCK TABLES `qrtz_calendars` WRITE;
/*!40000 ALTER TABLE `qrtz_calendars` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_calendars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_cron_triggers`
--

DROP TABLE IF EXISTS `qrtz_cron_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_cron_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='Cron类型的触发器表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_cron_triggers`
--

LOCK TABLES `qrtz_cron_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_cron_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_cron_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_fired_triggers`
--

DROP TABLE IF EXISTS `qrtz_fired_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_fired_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint(13) NOT NULL COMMENT '触发的时间',
  `sched_time` bigint(13) NOT NULL COMMENT '定时器制定的时间',
  `priority` int(11) NOT NULL COMMENT '优先级',
  `state` varchar(16) NOT NULL COMMENT '状态',
  `job_name` varchar(200) DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`,`entry_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='已触发的触发器表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_fired_triggers`
--

LOCK TABLES `qrtz_fired_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_fired_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_fired_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_job_details`
--

DROP TABLE IF EXISTS `qrtz_job_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_job_details` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) NOT NULL COMMENT '任务组名',
  `description` varchar(250) DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`,`job_name`,`job_group`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='任务详细信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_job_details`
--

LOCK TABLES `qrtz_job_details` WRITE;
/*!40000 ALTER TABLE `qrtz_job_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_job_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_locks`
--

DROP TABLE IF EXISTS `qrtz_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_locks` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`,`lock_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='存储的悲观锁信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_locks`
--

LOCK TABLES `qrtz_locks` WRITE;
/*!40000 ALTER TABLE `qrtz_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_paused_trigger_grps`
--

DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`,`trigger_group`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='暂停的触发器表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_paused_trigger_grps`
--

LOCK TABLES `qrtz_paused_trigger_grps` WRITE;
/*!40000 ALTER TABLE `qrtz_paused_trigger_grps` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_paused_trigger_grps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_scheduler_state`
--

DROP TABLE IF EXISTS `qrtz_scheduler_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_scheduler_state` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint(13) NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint(13) NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`,`instance_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='调度器状态表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_scheduler_state`
--

LOCK TABLES `qrtz_scheduler_state` WRITE;
/*!40000 ALTER TABLE `qrtz_scheduler_state` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_scheduler_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_simple_triggers`
--

DROP TABLE IF EXISTS `qrtz_simple_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_simple_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint(7) NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint(12) NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint(10) NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='简单触发器的信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_simple_triggers`
--

LOCK TABLES `qrtz_simple_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_simple_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_simple_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_simprop_triggers`
--

DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_simprop_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int(11) DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int(11) DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint(20) DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint(20) DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13,4) DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13,4) DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='同步机制的行锁表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_simprop_triggers`
--

LOCK TABLES `qrtz_simprop_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_simprop_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_simprop_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qrtz_triggers`
--

DROP TABLE IF EXISTS `qrtz_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qrtz_triggers` (
  `sched_name` varchar(120) NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint(13) DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint(13) DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int(11) DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) NOT NULL COMMENT '触发器的类型',
  `start_time` bigint(13) NOT NULL COMMENT '开始时间',
  `end_time` bigint(13) DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint(2) DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE,
  KEY `sched_name` (`sched_name`,`job_name`,`job_group`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='触发器详细信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qrtz_triggers`
--

LOCK TABLES `qrtz_triggers` WRITE;
/*!40000 ALTER TABLE `qrtz_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_buy_coin`
--

DROP TABLE IF EXISTS `sys_buy_coin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_buy_coin` (
  `buy_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '买币ID',
  `sale_id` bigint(20) NOT NULL COMMENT '卖币ID',
  `sale_user_id` bigint(20) NOT NULL COMMENT '卖币用户ID',
  `buy_user_id` bigint(20) NOT NULL COMMENT '买币用户ID',
  `buy_time` datetime DEFAULT NULL COMMENT '买币时间',
  `buy_type` varchar(50) DEFAULT '' COMMENT '支付方式（0支付宝 1微信 2银联）',
  `buy_amount` float(10,2) DEFAULT '0.00' COMMENT '买币金额',
  `status` char(1) DEFAULT '0' COMMENT '买币状态（0进行中 1买家已付款 2卖家已确认(买币完成) 9已取消）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`buy_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='买币表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_buy_coin`
--

LOCK TABLES `sys_buy_coin` WRITE;
/*!40000 ALTER TABLE `sys_buy_coin` DISABLE KEYS */;
INSERT INTO `sys_buy_coin` VALUES (2,3,11,10,'2024-01-17 20:34:44','2',10.10,'1','','2024-01-17 20:34:44','agent1','2024-01-19 20:21:55',NULL),(3,4,11,10,'2024-01-19 20:22:48','2',10.10,'0','','2024-01-19 20:22:48','',NULL,NULL);
/*!40000 ALTER TABLE `sys_buy_coin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_chat`
--

DROP TABLE IF EXISTS `sys_chat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_chat` (
  `chat_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `from_user_id` bigint(20) NOT NULL COMMENT '信息发送用户ID',
  `to_user_id` bigint(20) NOT NULL COMMENT '信息接收用户ID',
  `content` varchar(3000) DEFAULT NULL COMMENT '信息内容',
  `is_read` char(1) DEFAULT '0' COMMENT '是否已读(0 未读 1已读)',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  PRIMARY KEY (`chat_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='聊天信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_chat`
--

LOCK TABLES `sys_chat` WRITE;
/*!40000 ALTER TABLE `sys_chat` DISABLE KEYS */;
INSERT INTO `sys_chat` VALUES (1,3,1,'你好呀2','1','0','2024-01-02 22:11:34'),(2,1,3,'你好呀','1','0','2024-01-02 22:11:35'),(3,1,3,'hello','1','0','2024-01-07 13:08:51'),(4,2,1,'你好呀','1','0','2024-01-07 13:09:20'),(5,2,1,'你好呀44','1','0','2024-01-07 13:46:06'),(6,2,1,'你好呀？','1','0','2024-01-07 13:46:22'),(7,1,2,'你好呀','1','0','2024-01-07 14:02:21'),(8,2,1,'你在干嘛','1','0','2024-01-07 14:59:38'),(9,2,1,'在干嘛','1','0','2024-01-07 15:00:29'),(10,2,1,'在干嘛？','1','0','2024-01-07 15:01:22'),(11,2,1,'在干嘛?？','1','0','2024-01-07 15:02:27'),(12,1,2,'在看书','1','0','2024-01-07 15:04:04'),(13,2,1,'吃饭咯','1','0','2024-01-07 15:28:48'),(14,2,1,'吃饭咯?','1','0','2024-01-07 15:30:32'),(15,2,1,'吃饭','1','0','2024-01-07 15:31:35'),(16,1,2,'laile ','1','0','2024-01-07 15:31:40'),(17,2,1,'吃饭','1','0','2024-01-07 15:53:16'),(18,2,1,'吃饭?','1','0','2024-01-07 15:53:37'),(19,2,1,'吃饭?','1','0','2024-01-07 15:55:07'),(20,2,1,'吃?','1','0','2024-01-07 15:56:17'),(21,2,1,'吃??','1','0','2024-01-07 15:56:41'),(22,2,1,'吃1?','1','0','2024-01-07 16:03:44'),(23,1,2,'buchile','0','0','2024-01-07 16:03:49'),(24,2,1,'吃1?','1','0','2024-01-07 16:05:27'),(25,2,1,'吃ba','1','0','2024-01-07 16:07:02'),(26,2,1,'吃','1','0','2024-01-07 17:49:58'),(27,1,2,'ZOU ','0','0','2024-01-07 17:50:04'),(28,2,7,'你在干嘛','1','0','2024-01-07 18:46:28'),(29,7,2,'测试代码呀','1','0','2024-01-07 18:46:35'),(30,7,2,'你真厉害','1','0','2024-01-07 18:46:46'),(31,7,2,'牛呀','1','0','2024-01-07 18:47:07'),(32,7,11,'你好','0','0','2024-01-21 10:48:00'),(33,11,7,'你好呀','1','0','2024-01-21 10:48:48');
/*!40000 ALTER TABLE `sys_chat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_config`
--

DROP TABLE IF EXISTS `sys_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_config` (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='参数配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_config`
--

LOCK TABLES `sys_config` WRITE;
/*!40000 ALTER TABLE `sys_config` DISABLE KEYS */;
INSERT INTO `sys_config` VALUES (1,'主框架页-默认皮肤样式名称','sys.index.skinName','skin-blue','Y','admin','2024-01-02 21:22:12','',NULL,'蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow'),(2,'用户管理-账号初始密码','sys.user.initPassword','123456','Y','admin','2024-01-02 21:22:12','',NULL,'初始化密码 123456'),(3,'主框架页-侧边栏主题','sys.index.sideTheme','theme-dark','Y','admin','2024-01-02 21:22:12','',NULL,'深色主题theme-dark，浅色主题theme-light'),(4,'账号自助-验证码开关','sys.account.captchaEnabled','false','Y','admin','2024-01-02 21:22:12','',NULL,'是否开启验证码功能（true开启，false关闭）'),(5,'账号自助-是否开启用户注册功能','sys.account.registerUser','false','Y','admin','2024-01-02 21:22:12','',NULL,'是否开启注册用户功能（true开启，false关闭）'),(6,'用户登录-黑名单列表','sys.login.blackIPList','','Y','admin','2024-01-02 21:22:12','',NULL,'设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');
/*!40000 ALTER TABLE `sys_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dept`
--

DROP TABLE IF EXISTS `sys_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父部门id',
  `user_id` bigint(20) DEFAULT '0' COMMENT '商户用户ID',
  `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=222 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='部门表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dept`
--

LOCK TABLES `sys_dept` WRITE;
/*!40000 ALTER TABLE `sys_dept` DISABLE KEYS */;
INSERT INTO `sys_dept` VALUES (100,0,2,'0','OKPAY平台',0,'若依','15888888888','ry@qq.com','0','0','admin','2024-01-02 21:22:08','',NULL),(200,100,3,'0,100','测试商户1',0,NULL,NULL,NULL,'0','0','admin','2024-01-02 22:48:39','admin','2024-01-04 23:26:04'),(201,200,0,'0,100,200','测试商户1代理',0,NULL,NULL,NULL,'0','0','','2024-01-02 22:48:39','',NULL),(202,201,0,'0,100,200,201','测试商户1客户',0,NULL,NULL,NULL,'0','0','','2024-01-04 23:05:25','',NULL),(207,100,4,'0,100','测试商户2',0,NULL,NULL,NULL,'0','0','admin','2024-01-04 23:05:25','',NULL),(208,207,0,'0,100,207','测试商户2代理',0,NULL,NULL,NULL,'0','0','','2024-01-04 23:05:25','',NULL),(209,208,0,'0,100,207,208','测试商户2客户',0,NULL,NULL,NULL,'0','0','','2024-01-04 23:05:25','',NULL),(216,100,7,'0,100','测试商户3',0,NULL,NULL,NULL,'0','0','admin','2024-01-04 23:20:29','admin','2024-01-05 21:44:38'),(217,216,0,'0,100,216','测试商户3代理',0,NULL,NULL,NULL,'0','0','','2024-01-04 23:20:29','',NULL),(218,217,0,'0,100,216,217','测试商户3客户',0,NULL,NULL,NULL,'0','0','','2024-01-04 23:20:29','',NULL),(219,100,12,'0,100','测试商户4',0,NULL,NULL,NULL,'0','0','okadmin','2024-01-19 22:53:21','','2024-01-19 22:53:21'),(220,219,0,'0,100,219','测试商户4代理',0,NULL,NULL,NULL,'0','0','','2024-01-19 22:53:21','',NULL),(221,220,0,'0,100,219,220','测试商户4客户',0,NULL,NULL,NULL,'0','0','','2024-01-19 22:53:21','',NULL);
/*!40000 ALTER TABLE `sys_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_data`
--

DROP TABLE IF EXISTS `sys_dict_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='字典数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_data`
--

LOCK TABLES `sys_dict_data` WRITE;
/*!40000 ALTER TABLE `sys_dict_data` DISABLE KEYS */;
INSERT INTO `sys_dict_data` VALUES (1,1,'男','0','sys_user_sex','','','Y','0','admin','2024-01-02 21:22:11','',NULL,'性别男'),(2,2,'女','1','sys_user_sex','','','N','0','admin','2024-01-02 21:22:11','',NULL,'性别女'),(3,3,'未知','2','sys_user_sex','','','N','0','admin','2024-01-02 21:22:11','',NULL,'性别未知'),(4,1,'显示','0','sys_show_hide','','primary','Y','0','admin','2024-01-02 21:22:11','',NULL,'显示菜单'),(5,2,'隐藏','1','sys_show_hide','','danger','N','0','admin','2024-01-02 21:22:11','',NULL,'隐藏菜单'),(6,1,'正常','0','sys_normal_disable','','primary','Y','0','admin','2024-01-02 21:22:11','',NULL,'正常状态'),(7,2,'停用','1','sys_normal_disable','','danger','N','0','admin','2024-01-02 21:22:11','',NULL,'停用状态'),(8,1,'正常','0','sys_job_status','','primary','Y','0','admin','2024-01-02 21:22:11','',NULL,'正常状态'),(9,2,'暂停','1','sys_job_status','','danger','N','0','admin','2024-01-02 21:22:11','',NULL,'停用状态'),(10,1,'默认','DEFAULT','sys_job_group','','','Y','0','admin','2024-01-02 21:22:11','',NULL,'默认分组'),(11,2,'系统','SYSTEM','sys_job_group','','','N','0','admin','2024-01-02 21:22:11','',NULL,'系统分组'),(12,1,'是','Y','sys_yes_no','','primary','Y','0','admin','2024-01-02 21:22:11','',NULL,'系统默认是'),(13,2,'否','N','sys_yes_no','','danger','N','0','admin','2024-01-02 21:22:11','',NULL,'系统默认否'),(14,1,'通知','1','sys_notice_type','','warning','Y','0','admin','2024-01-02 21:22:11','',NULL,'通知'),(15,2,'公告','2','sys_notice_type','','success','N','0','admin','2024-01-02 21:22:11','',NULL,'公告'),(16,1,'正常','0','sys_notice_status','','primary','Y','0','admin','2024-01-02 21:22:11','',NULL,'正常状态'),(17,2,'关闭','1','sys_notice_status','','danger','N','0','admin','2024-01-02 21:22:11','',NULL,'关闭状态'),(18,99,'其他','0','sys_oper_type','','info','N','0','admin','2024-01-02 21:22:11','',NULL,'其他操作'),(19,1,'新增','1','sys_oper_type','','info','N','0','admin','2024-01-02 21:22:11','',NULL,'新增操作'),(20,2,'修改','2','sys_oper_type','','info','N','0','admin','2024-01-02 21:22:11','',NULL,'修改操作'),(21,3,'删除','3','sys_oper_type','','danger','N','0','admin','2024-01-02 21:22:11','',NULL,'删除操作'),(22,4,'授权','4','sys_oper_type','','primary','N','0','admin','2024-01-02 21:22:11','',NULL,'授权操作'),(23,5,'导出','5','sys_oper_type','','warning','N','0','admin','2024-01-02 21:22:11','',NULL,'导出操作'),(24,6,'导入','6','sys_oper_type','','warning','N','0','admin','2024-01-02 21:22:11','',NULL,'导入操作'),(25,7,'强退','7','sys_oper_type','','danger','N','0','admin','2024-01-02 21:22:11','',NULL,'强退操作'),(26,8,'生成代码','8','sys_oper_type','','warning','N','0','admin','2024-01-02 21:22:11','',NULL,'生成操作'),(27,9,'清空数据','9','sys_oper_type','','danger','N','0','admin','2024-01-02 21:22:11','',NULL,'清空操作'),(28,1,'成功','0','sys_common_status','','primary','N','0','admin','2024-01-02 21:22:11','',NULL,'正常状态'),(29,2,'失败','1','sys_common_status','','danger','N','0','admin','2024-01-02 21:22:11','',NULL,'停用状态');
/*!40000 ALTER TABLE `sys_dict_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_type`
--

DROP TABLE IF EXISTS `sys_dict_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE KEY `dict_type` (`dict_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='字典类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_type`
--

LOCK TABLES `sys_dict_type` WRITE;
/*!40000 ALTER TABLE `sys_dict_type` DISABLE KEYS */;
INSERT INTO `sys_dict_type` VALUES (1,'用户性别','sys_user_sex','0','admin','2024-01-02 21:22:11','',NULL,'用户性别列表'),(2,'菜单状态','sys_show_hide','0','admin','2024-01-02 21:22:11','',NULL,'菜单状态列表'),(3,'系统开关','sys_normal_disable','0','admin','2024-01-02 21:22:11','',NULL,'系统开关列表'),(4,'任务状态','sys_job_status','0','admin','2024-01-02 21:22:11','',NULL,'任务状态列表'),(5,'任务分组','sys_job_group','0','admin','2024-01-02 21:22:11','',NULL,'任务分组列表'),(6,'系统是否','sys_yes_no','0','admin','2024-01-02 21:22:11','',NULL,'系统是否列表'),(7,'通知类型','sys_notice_type','0','admin','2024-01-02 21:22:11','',NULL,'通知类型列表'),(8,'通知状态','sys_notice_status','0','admin','2024-01-02 21:22:11','',NULL,'通知状态列表'),(9,'操作类型','sys_oper_type','0','admin','2024-01-02 21:22:11','',NULL,'操作类型列表'),(10,'系统状态','sys_common_status','0','admin','2024-01-02 21:22:11','',NULL,'登录状态列表');
/*!40000 ALTER TABLE `sys_dict_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_job`
--

DROP TABLE IF EXISTS `sys_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='定时任务调度表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_job`
--

LOCK TABLES `sys_job` WRITE;
/*!40000 ALTER TABLE `sys_job` DISABLE KEYS */;
INSERT INTO `sys_job` VALUES (1,'系统默认（无参）','DEFAULT','ryTask.ryNoParams','0/10 * * * * ?','3','1','1','admin','2024-01-02 21:22:12','',NULL,''),(2,'系统默认（有参）','DEFAULT','ryTask.ryParams(\'ry\')','0/15 * * * * ?','3','1','1','admin','2024-01-02 21:22:12','',NULL,''),(3,'系统默认（多参）','DEFAULT','ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)','0/20 * * * * ?','3','1','1','admin','2024-01-02 21:22:12','',NULL,'');
/*!40000 ALTER TABLE `sys_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_job_log`
--

DROP TABLE IF EXISTS `sys_job_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_job_log` (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
  `status` char(1) DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='定时任务调度日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_job_log`
--

LOCK TABLES `sys_job_log` WRITE;
/*!40000 ALTER TABLE `sys_job_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_job_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_logininfor`
--

DROP TABLE IF EXISTS `sys_logininfor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_logininfor` (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  KEY `idx_sys_logininfor_s` (`status`) USING BTREE,
  KEY `idx_sys_logininfor_lt` (`login_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=218 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统访问记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_logininfor`
--

LOCK TABLES `sys_logininfor` WRITE;
/*!40000 ALTER TABLE `sys_logininfor` DISABLE KEYS */;
INSERT INTO `sys_logininfor` VALUES (100,'admin','127.0.0.1','内网IP','Unknown','Unknown','1','验证码已失效','2024-01-02 21:22:55'),(101,'admin','127.0.0.1','内网IP','Unknown','Unknown','1','验证码已失效','2024-01-02 21:23:58'),(102,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-01-02 21:25:18'),(103,'admin','127.0.0.1','内网IP','Unknown','Unknown','0','登录成功','2024-01-02 21:25:26'),(104,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-01-03 00:05:31'),(105,'liao1','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-01-03 00:05:36'),(106,'liao1','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-01-03 00:06:23'),(107,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-01-03 00:06:27'),(108,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-01-03 00:06:51'),(109,'liao1','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-01-03 00:06:55'),(110,'liao1','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-01-03 00:07:07'),(111,'testadmin','127.0.0.1','内网IP','Chrome 12','Windows 10','1','用户不存在/密码错误','2024-01-03 00:07:12'),(112,'testadmin','127.0.0.1','内网IP','Chrome 12','Windows 10','1','用户不存在/密码错误','2024-01-03 00:07:26'),(113,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-01-03 00:07:34'),(114,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-01-03 00:08:04'),(115,'testadmin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-01-03 00:08:16'),(116,'testadmin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-01-03 00:08:38'),(117,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-01-03 00:08:41'),(118,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-01-03 00:09:01'),(119,'testadmin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-01-03 00:09:05'),(120,'testadmin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-01-03 00:10:45'),(121,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-01-03 00:10:49'),(122,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-01-03 00:11:22'),(123,'testadmin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-01-03 00:11:28'),(124,'testadmin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-01-03 00:12:02'),(125,'okadmin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-01-03 00:12:06'),(126,'okadmin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-01-03 00:12:43'),(127,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-01-04 21:54:36'),(128,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-01-04 23:41:44'),(129,'liao2','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-01-04 23:41:51'),(130,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-01-05 21:03:00'),(131,'admin','127.0.0.1','内网IP','Unknown','Unknown','0','登录成功','2024-01-05 21:54:51'),(132,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-01-05 23:06:47'),(133,'agent1','127.0.0.1','内网IP','Unknown','Unknown','0','注册成功','2024-01-05 23:38:31'),(134,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-01-05 23:39:15'),(135,'agent1','127.0.0.1','内网IP','Unknown','Unknown','0','注册成功','2024-01-06 00:21:17'),(136,'agent1','127.0.0.1','内网IP','Unknown','Unknown','0','注册成功','2024-01-06 00:23:59'),(137,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-01-06 00:24:03'),(138,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-01-06 19:42:13'),(139,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-01-06 19:42:33'),(140,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-01-06 19:42:38'),(141,'agent1','127.0.0.1','内网IP','Unknown','Unknown','0','登录成功','2024-01-06 19:57:11'),(142,'agent1','127.0.0.1','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2024-01-06 19:59:02'),(143,'agent1','127.0.0.1','内网IP','Unknown','Unknown','0','登录成功','2024-01-06 19:59:19'),(144,'agent1','127.0.0.1','内网IP','Unknown','Unknown','0','登录成功','2024-01-06 20:04:09'),(145,'agent1','127.0.0.1','内网IP','Unknown','Unknown','0','退出成功','2024-01-06 20:04:25'),(146,'agent1','127.0.0.1','内网IP','Unknown','Unknown','0','登录成功','2024-01-06 20:11:59'),(147,'agent1','127.0.0.1','内网IP','Unknown','Unknown','0','登录成功','2024-01-06 20:45:07'),(148,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-01-06 20:45:32'),(149,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-01-06 21:17:51'),(150,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-01-06 23:59:23'),(151,'okadmin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-01-06 23:59:28'),(152,'okadmin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-01-07 00:07:38'),(153,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-01-07 09:44:21'),(154,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-01-07 09:45:52'),(155,'okadmin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-01-07 09:46:00'),(156,'okadmin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-01-07 09:47:05'),(157,'liao3','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-01-07 09:47:18'),(158,'liao3','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-01-07 10:59:04'),(159,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-01-07 10:59:08'),(160,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-01-07 11:15:58'),(161,'okadmin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-01-07 11:16:06'),(162,'okadmin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-01-07 11:23:46'),(163,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-01-07 11:23:49'),(164,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-01-07 17:47:36'),(165,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-01-07 17:50:56'),(166,'okadmin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-01-07 17:51:04'),(167,'liao3','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-01-07 17:58:58'),(168,'okadmin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-01-07 18:47:24'),(169,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-01-07 18:47:29'),(170,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-01-13 14:41:51'),(171,'agent1','127.0.0.1','内网IP','Unknown','Unknown','0','登录成功','2024-01-13 21:37:20'),(172,'kehu1','127.0.0.1','内网IP','Unknown','Unknown','0','注册成功','2024-01-13 23:10:17'),(173,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-01-13 23:10:24'),(174,'kehu1','127.0.0.1','内网IP','Unknown','Unknown','0','登录成功','2024-01-13 23:11:02'),(175,'kehu1','127.0.0.1','内网IP','Unknown','Unknown','0','登录成功','2024-01-13 23:15:56'),(176,'kehu1','127.0.0.1','内网IP','Unknown','Unknown','0','登录成功','2024-01-14 16:31:13'),(177,'agent1','127.0.0.1','内网IP','Unknown','Unknown','0','登录成功','2024-01-14 16:42:36'),(178,'agent1','127.0.0.1','内网IP','Unknown','Unknown','0','登录成功','2024-01-17 19:45:34'),(179,'agent1','127.0.0.1','内网IP','Unknown','Unknown','0','登录成功','2024-01-17 20:29:19'),(180,'agent1','127.0.0.1','内网IP','Unknown','Unknown','0','登录成功','2024-01-19 20:15:02'),(181,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-01-19 21:15:02'),(182,'agent1','127.0.0.1','内网IP','Unknown','Unknown','0','登录成功','2024-01-19 22:33:45'),(183,'kehu1','127.0.0.1','内网IP','Unknown','Unknown','0','登录成功','2024-01-19 22:48:55'),(184,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-01-19 22:51:12'),(185,'okadmin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-01-19 22:51:16'),(186,'agent2','127.0.0.1','内网IP','Unknown','Unknown','0','注册成功','2024-01-19 22:54:35'),(187,'kehu2','127.0.0.1','内网IP','Unknown','Unknown','0','注册成功','2024-01-19 22:56:12'),(188,'kehu2','127.0.0.1','内网IP','Unknown','Unknown','0','登录成功','2024-01-19 22:56:37'),(189,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-01-20 10:16:47'),(190,'kehu2','127.0.0.1','内网IP','Unknown','Unknown','0','登录成功','2024-01-20 10:23:17'),(191,'kehu1','127.0.0.1','内网IP','Unknown','Unknown','0','登录成功','2024-01-20 11:11:01'),(192,'okadmin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-01-21 10:45:55'),(193,'liao3','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-01-21 10:46:17'),(194,'liao3','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-01-21 10:46:32'),(195,'okadmin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-01-21 10:47:07'),(196,'liao1','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-01-21 10:47:10'),(197,'liao1','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-01-21 10:47:35'),(198,'liao3','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-01-21 10:47:39'),(199,'liao3','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-01-21 10:57:18'),(200,'okadmin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-01-21 10:57:22'),(201,'okadmin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-01-21 10:59:25'),(202,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-01-21 10:59:28'),(203,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-01-21 10:59:44'),(204,'okadmin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-01-21 10:59:50'),(205,'kehu1','127.0.0.1','内网IP','Unknown','Unknown','0','登录成功','2024-01-21 15:46:49'),(206,'kehu1','127.0.0.1','内网IP','Unknown','Unknown','0','登录成功','2024-01-21 16:52:49'),(207,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-01-21 18:29:52'),(208,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-01-21 18:36:29'),(209,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-01-21 18:37:30'),(210,'admin','127.0.0.1','内网IP','Unknown','Unknown','1','用户不存在/密码错误','2024-01-21 19:07:13'),(211,'admin','127.0.0.1','内网IP','Unknown','Unknown','0','登录成功','2024-01-21 19:07:33'),(212,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-01-21 19:18:25'),(213,'okadmin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-01-21 19:18:30'),(214,'okadmin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','退出成功','2024-01-21 20:22:10'),(215,'okadmin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-01-21 20:23:11'),(216,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-01-22 09:33:59'),(217,'admin','127.0.0.1','内网IP','Chrome 12','Windows 10','0','登录成功','2024-01-22 13:30:39');
/*!40000 ALTER TABLE `sys_logininfor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) DEFAULT NULL COMMENT '路由参数',
  `is_frame` int(1) DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `is_cache` int(1) DEFAULT '0' COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1061 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='菜单权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES (1,'系统管理',0,1,'system',NULL,'',1,0,'M','0','0','','system','admin','2024-01-02 21:22:09','admin','2024-01-21 18:57:18','系统管理目录'),(2,'系统监控',0,2,'monitor',NULL,'',1,0,'M','0','0','','monitor','admin','2024-01-02 21:22:09','',NULL,'系统监控目录'),(3,'系统工具',0,3,'tool',NULL,'',1,0,'M','0','0','','tool','admin','2024-01-02 21:22:09','',NULL,'系统工具目录'),(4,'若依官网',0,4,'http://ruoyi.vip',NULL,'',0,0,'M','0','0','','guide','admin','2024-01-02 21:22:09','',NULL,'若依官网地址'),(100,'用户管理',1,1,'user','system/user/index','',1,0,'C','0','0','system:user:list','user','admin','2024-01-02 21:22:09','',NULL,'用户管理菜单'),(101,'角色管理',1,2,'role','system/role/index','',1,0,'C','0','0','system:role:list','peoples','admin','2024-01-02 21:22:09','',NULL,'角色管理菜单'),(102,'菜单管理',1,3,'menu','system/menu/index','',1,0,'C','0','0','system:menu:list','tree-table','admin','2024-01-02 21:22:09','',NULL,'菜单管理菜单'),(103,'商户管理',1,4,'dept','system/dept/index','',1,0,'C','0','0','system:dept:list','tree','admin','2024-01-02 21:22:09','admin','2024-01-02 22:12:29','部门管理菜单'),(104,'岗位管理',1,5,'post','system/post/index','',1,0,'C','0','0','system:post:list','post','admin','2024-01-02 21:22:09','',NULL,'岗位管理菜单'),(105,'字典管理',1,6,'dict','system/dict/index','',1,0,'C','0','0','system:dict:list','dict','admin','2024-01-02 21:22:09','',NULL,'字典管理菜单'),(106,'参数设置',1,7,'config','system/config/index','',1,0,'C','0','0','system:config:list','edit','admin','2024-01-02 21:22:09','',NULL,'参数设置菜单'),(107,'通知公告',1,8,'notice','system/notice/index','',1,0,'C','0','0','system:notice:list','message','admin','2024-01-02 21:22:09','',NULL,'通知公告菜单'),(108,'日志管理',1,9,'log','','',1,0,'M','0','0','','log','admin','2024-01-02 21:22:09','',NULL,'日志管理菜单'),(109,'在线用户',2,1,'online','monitor/online/index','',1,0,'C','0','0','monitor:online:list','online','admin','2024-01-02 21:22:09','',NULL,'在线用户菜单'),(110,'定时任务',2,2,'job','monitor/job/index','',1,0,'C','0','0','monitor:job:list','job','admin','2024-01-02 21:22:09','',NULL,'定时任务菜单'),(111,'数据监控',2,3,'druid','monitor/druid/index','',1,0,'C','0','0','monitor:druid:list','druid','admin','2024-01-02 21:22:09','',NULL,'数据监控菜单'),(112,'服务监控',2,4,'server','monitor/server/index','',1,0,'C','0','0','monitor:server:list','server','admin','2024-01-02 21:22:09','',NULL,'服务监控菜单'),(113,'缓存监控',2,5,'cache','monitor/cache/index','',1,0,'C','0','0','monitor:cache:list','redis','admin','2024-01-02 21:22:09','',NULL,'缓存监控菜单'),(114,'缓存列表',2,6,'cacheList','monitor/cache/list','',1,0,'C','0','0','monitor:cache:list','redis-list','admin','2024-01-02 21:22:09','',NULL,'缓存列表菜单'),(115,'表单构建',3,1,'build','tool/build/index','',1,0,'C','0','0','tool:build:list','build','admin','2024-01-02 21:22:09','',NULL,'表单构建菜单'),(116,'代码生成',3,2,'gen','tool/gen/index','',1,0,'C','0','0','tool:gen:list','code','admin','2024-01-02 21:22:09','',NULL,'代码生成菜单'),(117,'系统接口',3,3,'swagger','tool/swagger/index','',1,0,'C','0','0','tool:swagger:list','swagger','admin','2024-01-02 21:22:09','',NULL,'系统接口菜单'),(500,'操作日志',108,1,'operlog','monitor/operlog/index','',1,0,'C','0','0','monitor:operlog:list','form','admin','2024-01-02 21:22:09','',NULL,'操作日志菜单'),(501,'登录日志',108,2,'logininfor','monitor/logininfor/index','',1,0,'C','0','0','monitor:logininfor:list','logininfor','admin','2024-01-02 21:22:09','',NULL,'登录日志菜单'),(1000,'用户查询',100,1,'','','',1,0,'F','0','0','system:user:query','#','admin','2024-01-02 21:22:09','',NULL,''),(1001,'用户新增',100,2,'','','',1,0,'F','0','0','system:user:add','#','admin','2024-01-02 21:22:09','',NULL,''),(1002,'用户修改',100,3,'','','',1,0,'F','0','0','system:user:edit','#','admin','2024-01-02 21:22:09','',NULL,''),(1003,'用户删除',100,4,'','','',1,0,'F','0','0','system:user:remove','#','admin','2024-01-02 21:22:09','',NULL,''),(1004,'用户导出',100,5,'','','',1,0,'F','0','0','system:user:export','#','admin','2024-01-02 21:22:09','',NULL,''),(1005,'用户导入',100,6,'','','',1,0,'F','0','0','system:user:import','#','admin','2024-01-02 21:22:09','',NULL,''),(1006,'重置密码',100,7,'','','',1,0,'F','0','0','system:user:resetPwd','#','admin','2024-01-02 21:22:09','',NULL,''),(1007,'角色查询',101,1,'','','',1,0,'F','0','0','system:role:query','#','admin','2024-01-02 21:22:09','',NULL,''),(1008,'角色新增',101,2,'','','',1,0,'F','0','0','system:role:add','#','admin','2024-01-02 21:22:09','',NULL,''),(1009,'角色修改',101,3,'','','',1,0,'F','0','0','system:role:edit','#','admin','2024-01-02 21:22:09','',NULL,''),(1010,'角色删除',101,4,'','','',1,0,'F','0','0','system:role:remove','#','admin','2024-01-02 21:22:09','',NULL,''),(1011,'角色导出',101,5,'','','',1,0,'F','0','0','system:role:export','#','admin','2024-01-02 21:22:09','',NULL,''),(1012,'菜单查询',102,1,'','','',1,0,'F','0','0','system:menu:query','#','admin','2024-01-02 21:22:09','',NULL,''),(1013,'菜单新增',102,2,'','','',1,0,'F','0','0','system:menu:add','#','admin','2024-01-02 21:22:09','',NULL,''),(1014,'菜单修改',102,3,'','','',1,0,'F','0','0','system:menu:edit','#','admin','2024-01-02 21:22:09','',NULL,''),(1015,'菜单删除',102,4,'','','',1,0,'F','0','0','system:menu:remove','#','admin','2024-01-02 21:22:09','',NULL,''),(1016,'部门查询',103,1,'','','',1,0,'F','0','0','system:dept:query','#','admin','2024-01-02 21:22:09','',NULL,''),(1017,'部门新增',103,2,'','','',1,0,'F','0','0','system:dept:add','#','admin','2024-01-02 21:22:09','',NULL,''),(1018,'部门修改',103,3,'','','',1,0,'F','0','0','system:dept:edit','#','admin','2024-01-02 21:22:09','',NULL,''),(1019,'部门删除',103,4,'','','',1,0,'F','0','0','system:dept:remove','#','admin','2024-01-02 21:22:09','',NULL,''),(1020,'岗位查询',104,1,'','','',1,0,'F','0','0','system:post:query','#','admin','2024-01-02 21:22:09','',NULL,''),(1021,'岗位新增',104,2,'','','',1,0,'F','0','0','system:post:add','#','admin','2024-01-02 21:22:09','',NULL,''),(1022,'岗位修改',104,3,'','','',1,0,'F','0','0','system:post:edit','#','admin','2024-01-02 21:22:09','',NULL,''),(1023,'岗位删除',104,4,'','','',1,0,'F','0','0','system:post:remove','#','admin','2024-01-02 21:22:09','',NULL,''),(1024,'岗位导出',104,5,'','','',1,0,'F','0','0','system:post:export','#','admin','2024-01-02 21:22:09','',NULL,''),(1025,'字典查询',105,1,'#','','',1,0,'F','0','0','system:dict:query','#','admin','2024-01-02 21:22:09','',NULL,''),(1026,'字典新增',105,2,'#','','',1,0,'F','0','0','system:dict:add','#','admin','2024-01-02 21:22:09','',NULL,''),(1027,'字典修改',105,3,'#','','',1,0,'F','0','0','system:dict:edit','#','admin','2024-01-02 21:22:09','',NULL,''),(1028,'字典删除',105,4,'#','','',1,0,'F','0','0','system:dict:remove','#','admin','2024-01-02 21:22:09','',NULL,''),(1029,'字典导出',105,5,'#','','',1,0,'F','0','0','system:dict:export','#','admin','2024-01-02 21:22:09','',NULL,''),(1030,'参数查询',106,1,'#','','',1,0,'F','0','0','system:config:query','#','admin','2024-01-02 21:22:09','',NULL,''),(1031,'参数新增',106,2,'#','','',1,0,'F','0','0','system:config:add','#','admin','2024-01-02 21:22:09','',NULL,''),(1032,'参数修改',106,3,'#','','',1,0,'F','0','0','system:config:edit','#','admin','2024-01-02 21:22:09','',NULL,''),(1033,'参数删除',106,4,'#','','',1,0,'F','0','0','system:config:remove','#','admin','2024-01-02 21:22:09','',NULL,''),(1034,'参数导出',106,5,'#','','',1,0,'F','0','0','system:config:export','#','admin','2024-01-02 21:22:09','',NULL,''),(1035,'公告查询',107,1,'#','','',1,0,'F','0','0','system:notice:query','#','admin','2024-01-02 21:22:09','',NULL,''),(1036,'公告新增',107,2,'#','','',1,0,'F','0','0','system:notice:add','#','admin','2024-01-02 21:22:09','',NULL,''),(1037,'公告修改',107,3,'#','','',1,0,'F','0','0','system:notice:edit','#','admin','2024-01-02 21:22:09','',NULL,''),(1038,'公告删除',107,4,'#','','',1,0,'F','0','0','system:notice:remove','#','admin','2024-01-02 21:22:09','',NULL,''),(1039,'操作查询',500,1,'#','','',1,0,'F','0','0','monitor:operlog:query','#','admin','2024-01-02 21:22:09','',NULL,''),(1040,'操作删除',500,2,'#','','',1,0,'F','0','0','monitor:operlog:remove','#','admin','2024-01-02 21:22:09','',NULL,''),(1041,'日志导出',500,3,'#','','',1,0,'F','0','0','monitor:operlog:export','#','admin','2024-01-02 21:22:09','',NULL,''),(1042,'登录查询',501,1,'#','','',1,0,'F','0','0','monitor:logininfor:query','#','admin','2024-01-02 21:22:09','',NULL,''),(1043,'登录删除',501,2,'#','','',1,0,'F','0','0','monitor:logininfor:remove','#','admin','2024-01-02 21:22:09','',NULL,''),(1044,'日志导出',501,3,'#','','',1,0,'F','0','0','monitor:logininfor:export','#','admin','2024-01-02 21:22:09','',NULL,''),(1045,'账户解锁',501,4,'#','','',1,0,'F','0','0','monitor:logininfor:unlock','#','admin','2024-01-02 21:22:09','',NULL,''),(1046,'在线查询',109,1,'#','','',1,0,'F','0','0','monitor:online:query','#','admin','2024-01-02 21:22:09','',NULL,''),(1047,'批量强退',109,2,'#','','',1,0,'F','0','0','monitor:online:batchLogout','#','admin','2024-01-02 21:22:09','',NULL,''),(1048,'单条强退',109,3,'#','','',1,0,'F','0','0','monitor:online:forceLogout','#','admin','2024-01-02 21:22:09','',NULL,''),(1049,'任务查询',110,1,'#','','',1,0,'F','0','0','monitor:job:query','#','admin','2024-01-02 21:22:09','',NULL,''),(1050,'任务新增',110,2,'#','','',1,0,'F','0','0','monitor:job:add','#','admin','2024-01-02 21:22:09','',NULL,''),(1051,'任务修改',110,3,'#','','',1,0,'F','0','0','monitor:job:edit','#','admin','2024-01-02 21:22:09','',NULL,''),(1052,'任务删除',110,4,'#','','',1,0,'F','0','0','monitor:job:remove','#','admin','2024-01-02 21:22:09','',NULL,''),(1053,'状态修改',110,5,'#','','',1,0,'F','0','0','monitor:job:changeStatus','#','admin','2024-01-02 21:22:09','',NULL,''),(1054,'任务导出',110,6,'#','','',1,0,'F','0','0','monitor:job:export','#','admin','2024-01-02 21:22:09','',NULL,''),(1055,'生成查询',116,1,'#','','',1,0,'F','0','0','tool:gen:query','#','admin','2024-01-02 21:22:09','',NULL,''),(1056,'生成修改',116,2,'#','','',1,0,'F','0','0','tool:gen:edit','#','admin','2024-01-02 21:22:09','',NULL,''),(1057,'生成删除',116,3,'#','','',1,0,'F','0','0','tool:gen:remove','#','admin','2024-01-02 21:22:09','',NULL,''),(1058,'导入代码',116,4,'#','','',1,0,'F','0','0','tool:gen:import','#','admin','2024-01-02 21:22:09','',NULL,''),(1059,'预览代码',116,5,'#','','',1,0,'F','0','0','tool:gen:preview','#','admin','2024-01-02 21:22:09','',NULL,''),(1060,'生成代码',116,6,'#','','',1,0,'F','0','0','tool:gen:code','#','admin','2024-01-02 21:22:09','',NULL,'');
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_notice`
--

DROP TABLE IF EXISTS `sys_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_notice` (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) NOT NULL COMMENT '公告标题',
  `notice_type` char(1) NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob COMMENT '公告内容',
  `status` char(1) DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='通知公告表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_notice`
--

LOCK TABLES `sys_notice` WRITE;
/*!40000 ALTER TABLE `sys_notice` DISABLE KEYS */;
INSERT INTO `sys_notice` VALUES (1,'温馨提醒：2018-07-01 若依新版本发布啦','2',_binary '<p><strong>新版本内容</strong></p>','0','admin','2024-01-02 21:22:13','admin','2024-01-21 19:09:54','管理员'),(2,'维护通知：2018-07-01 若依系统凌晨维护','1',_binary '维护内容','0','admin','2024-01-02 21:22:13','',NULL,'管理员'),(3,'测试','1',_binary '<p>是的发送到</p><p>阿斯顿发a</p><p>按时a</p>','0','okadmin','2024-01-21 19:19:05','',NULL,NULL);
/*!40000 ALTER TABLE `sys_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_notice_user`
--

DROP TABLE IF EXISTS `sys_notice_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_notice_user` (
  `notice_id` bigint(20) NOT NULL COMMENT '公告ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  PRIMARY KEY (`notice_id`,`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='公告和用户关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_notice_user`
--

LOCK TABLES `sys_notice_user` WRITE;
/*!40000 ALTER TABLE `sys_notice_user` DISABLE KEYS */;
INSERT INTO `sys_notice_user` VALUES (3,1);
/*!40000 ALTER TABLE `sys_notice_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_oper_log`
--

DROP TABLE IF EXISTS `sys_oper_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) DEFAULT '' COMMENT '返回参数',
  `status` int(1) DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint(20) DEFAULT '0' COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  KEY `idx_sys_oper_log_bt` (`business_type`) USING BTREE,
  KEY `idx_sys_oper_log_s` (`status`) USING BTREE,
  KEY `idx_sys_oper_log_ot` (`oper_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=228 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='操作日志记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_oper_log`
--

LOCK TABLES `sys_oper_log` WRITE;
/*!40000 ALTER TABLE `sys_oper_log` DISABLE KEYS */;
INSERT INTO `sys_oper_log` VALUES (100,'代码生成',6,'com.ruoyi.generator.controller.GenController.importTableSave()','POST',1,'admin','研发部门','/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"sys_chat\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-02 21:33:06',190),(101,'用户管理',2,'com.ruoyi.web.controller.system.SysUserController.edit()','PUT',1,'admin','研发部门','/system/user','127.0.0.1','内网IP','{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-01-02 21:22:09\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"测试部门\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":105,\"email\":\"ry@qq.com\",\"loginDate\":\"2024-01-02 21:22:09\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依\",\"params\":{},\"phonenumber\":\"15666666666\",\"postIds\":[2],\"remark\":\"测试员\",\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"ry\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-02 21:52:26',165),(102,'用户管理',2,'com.ruoyi.web.controller.system.SysUserController.edit()','PUT',1,'admin','研发部门','/system/user','127.0.0.1','内网IP','{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-01-02 21:22:09\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"测试部门\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":105,\"email\":\"ry@qq.com\",\"loginDate\":\"2024-01-02 21:22:09\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依\",\"params\":{},\"phonenumber\":\"15666666666\",\"postIds\":[2],\"remark\":\"测试员\",\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"ry\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-02 21:52:34',446),(103,'用户管理',2,'com.ruoyi.web.controller.system.SysUserController.edit()','PUT',1,'admin','研发部门','/system/user','127.0.0.1','内网IP','{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-01-02 21:22:09\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"测试部门\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":105,\"email\":\"r1@qq.com\",\"loginDate\":\"2024-01-02 21:22:09\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依\",\"params\":{},\"phonenumber\":\"15666666666\",\"postIds\":[2],\"remark\":\"测试员\",\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"ry\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-02 21:52:43',132),(104,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"system/dept/index\",\"createTime\":\"2024-01-02 21:22:09\",\"icon\":\"tree\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":103,\"menuName\":\"商户管理\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":1,\"path\":\"dept\",\"perms\":\"system:dept:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-02 22:12:29',127),(105,'部门管理',3,'com.ruoyi.web.controller.system.SysDeptController.remove()','DELETE',1,'admin','研发部门','/system/dept/109','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-02 22:17:37',92),(106,'部门管理',3,'com.ruoyi.web.controller.system.SysDeptController.remove()','DELETE',1,'admin','研发部门','/system/dept/107','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-02 22:17:40',82),(107,'部门管理',3,'com.ruoyi.web.controller.system.SysDeptController.remove()','DELETE',1,'admin','研发部门','/system/dept/106','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-02 22:17:43',77),(108,'部门管理',3,'com.ruoyi.web.controller.system.SysDeptController.remove()','DELETE',1,'admin','研发部门','/system/dept/105','127.0.0.1','内网IP','{}','{\"msg\":\"部门存在用户,不允许删除\",\"code\":601}',0,NULL,'2024-01-02 22:17:45',15),(109,'用户管理',2,'com.ruoyi.web.controller.system.SysUserController.edit()','PUT',1,'admin','研发部门','/system/user','127.0.0.1','内网IP','{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-01-02 21:22:09\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"测试部门\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":102,\"email\":\"r1@qq.com\",\"loginDate\":\"2024-01-02 21:22:09\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依\",\"params\":{},\"phonenumber\":\"15666666666\",\"postIds\":[2],\"remark\":\"测试员\",\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"ry\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-02 22:18:07',99),(110,'部门管理',3,'com.ruoyi.web.controller.system.SysDeptController.remove()','DELETE',1,'admin','研发部门','/system/dept/105','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-02 22:18:14',74),(111,'部门管理',3,'com.ruoyi.web.controller.system.SysDeptController.remove()','DELETE',1,'admin','研发部门','/system/dept/104','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-02 22:18:17',80),(112,'部门管理',1,'com.ruoyi.web.controller.system.SysDeptController.add()','POST',1,'admin','研发部门','/system/dept','127.0.0.1','内网IP','{\"ancestors\":\"0,100\",\"children\":[],\"createBy\":\"admin\",\"deptId\":200,\"deptName\":\"测试商户1\",\"orderNum\":1,\"params\":{},\"parentId\":100,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-02 22:48:39',451),(113,'部门管理',2,'com.ruoyi.web.controller.system.SysDeptController.edit()','PUT',1,'admin','研发部门','/system/dept','127.0.0.1','内网IP','{\"ancestors\":\"0,100\",\"children\":[],\"deptId\":200,\"deptName\":\"测试商户1\",\"orderNum\":3,\"params\":{},\"parentId\":100,\"parentName\":\"OKPAY平台\",\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-02 22:48:48',368),(114,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.edit()','PUT',1,'admin','研发部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-01-02 21:22:09\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117,4],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"OK平台管理员\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-02 22:49:33',195),(115,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.edit()','PUT',1,'admin','研发部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-01-02 21:22:09\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,114,3,115,116,1055,1056,1057,1058,1059,1060,117,4],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"OK平台管理员\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-02 22:49:33',274),(116,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.edit()','PUT',1,'admin','研发部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-01-02 21:22:09\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,103,1016,1017,1018,1019],\"params\":{},\"remark\":\"OK平台管理员\",\"roleId\":2,\"roleKey\":\"okpayadmin\",\"roleName\":\"OK平台管理员\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-02 22:50:19',374),(117,'角色管理',1,'com.ruoyi.web.controller.system.SysRoleController.add()','POST',1,'admin','研发部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006],\"params\":{},\"roleId\":100,\"roleKey\":\"merchant\",\"roleName\":\"商户\",\"roleSort\":3,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-02 22:50:59',99),(118,'角色管理',1,'com.ruoyi.web.controller.system.SysRoleController.add()','POST',1,'admin','研发部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[],\"params\":{},\"roleId\":101,\"roleKey\":\"agent\",\"roleName\":\"代理\",\"roleSort\":4,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-02 22:51:19',337),(119,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.dataScope()','PUT',1,'admin','研发部门','/system/role/dataScope','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-01-02 21:22:09\",\"dataScope\":\"4\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"params\":{},\"remark\":\"OK平台管理员\",\"roleId\":2,\"roleKey\":\"okpayadmin\",\"roleName\":\"OK平台管理员\",\"roleSort\":2,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-02 22:52:22',3467),(120,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.dataScope()','PUT',1,'admin','研发部门','/system/role/dataScope','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-01-02 21:22:09\",\"dataScope\":\"4\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"params\":{},\"remark\":\"OK平台管理员\",\"roleId\":2,\"roleKey\":\"okpayadmin\",\"roleName\":\"OK平台管理员\",\"roleSort\":2,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-02 22:52:22',1622),(121,'角色管理',3,'com.ruoyi.web.controller.system.SysRoleController.remove()','DELETE',1,'admin','研发部门','/system/role/100','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-02 22:52:38',94),(122,'角色管理',3,'com.ruoyi.web.controller.system.SysRoleController.remove()','DELETE',1,'admin','研发部门','/system/role/101','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-02 22:52:40',43),(123,'角色管理',1,'com.ruoyi.web.controller.system.SysRoleController.add()','POST',1,'admin','研发部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,103,1016,1017,1018,1019],\"params\":{},\"roleId\":3,\"roleKey\":\"merchant\",\"roleName\":\"商户\",\"roleSort\":3,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-02 22:53:21',109),(124,'角色管理',1,'com.ruoyi.web.controller.system.SysRoleController.add()','POST',1,'admin','研发部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[],\"params\":{},\"roleId\":4,\"roleKey\":\"agent\",\"roleName\":\"代理\",\"roleSort\":4,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-02 22:53:36',92),(125,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.edit()','PUT',1,'admin','研发部门','/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-01-02 22:53:21\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006],\"params\":{},\"roleId\":3,\"roleKey\":\"merchant\",\"roleName\":\"商户\",\"roleSort\":3,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-02 22:54:15',976),(126,'用户管理',2,'com.ruoyi.web.controller.system.SysUserController.edit()','PUT',1,'admin','研发部门','/system/user','127.0.0.1','内网IP','{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-01-02 21:22:09\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100\",\"children\":[],\"deptId\":102,\"deptName\":\"长沙分公司\",\"leader\":\"若依\",\"orderNum\":2,\"params\":{},\"parentId\":100,\"status\":\"0\"},\"deptId\":102,\"email\":\"r1@qq.com\",\"inviteCode\":\"789c\",\"loginDate\":\"2024-01-02 21:22:09\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"testadmin\",\"params\":{},\"phonenumber\":\"15666666666\",\"postIds\":[2],\"remark\":\"测试员\",\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"4\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"okpayadmin\",\"roleName\":\"OK平台管理员\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"testadmin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-02 23:28:14',192),(127,'用户管理',2,'com.ruoyi.web.controller.system.SysUserController.edit()','PUT',1,'admin','研发部门','/system/user','127.0.0.1','内网IP','{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-01-02 21:22:09\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100\",\"children\":[],\"deptId\":102,\"deptName\":\"长沙分公司\",\"leader\":\"若依\",\"orderNum\":2,\"params\":{},\"parentId\":100,\"status\":\"0\"},\"deptId\":102,\"email\":\"r1@qq.com\",\"idcardNo\":\"350\",\"inviteCode\":\"789c\",\"loginDate\":\"2024-01-02 21:22:09\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"testadmin\",\"params\":{},\"phonenumber\":\"15666666666\",\"postIds\":[2],\"realName\":\"冷笑话\",\"remark\":\"测试员\",\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"4\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"okpayadmin\",\"roleName\":\"OK平台管理员\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"userId\":2,\"userName\":\"testadmin\"}',NULL,1,'Invalid bound statement (not found): com.ruoyi.system.mapper.SysUserMapper.checkIdcardUnique','2024-01-02 23:34:04',18),(128,'用户管理',2,'com.ruoyi.web.controller.system.SysUserController.edit()','PUT',1,'admin','研发部门','/system/user','127.0.0.1','内网IP','{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-01-02 21:22:09\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100\",\"children\":[],\"deptId\":102,\"deptName\":\"长沙分公司\",\"leader\":\"若依\",\"orderNum\":2,\"params\":{},\"parentId\":100,\"status\":\"0\"},\"deptId\":102,\"email\":\"r1@qq.com\",\"idcardNo\":\"350\",\"inviteCode\":\"789c\",\"loginDate\":\"2024-01-02 21:22:09\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"testadmin\",\"params\":{},\"phonenumber\":\"15666666666\",\"postIds\":[2],\"realName\":\"冷笑话\",\"remark\":\"测试员\",\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"4\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"okpayadmin\",\"roleName\":\"OK平台管理员\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"testadmin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-02 23:36:31',5575),(129,'用户管理',2,'com.ruoyi.web.controller.system.SysUserController.edit()','PUT',1,'admin','研发部门','/system/user','127.0.0.1','内网IP','{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-01-02 21:22:09\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100\",\"children\":[],\"deptId\":102,\"deptName\":\"长沙分公司\",\"leader\":\"若依\",\"orderNum\":2,\"params\":{},\"parentId\":100,\"status\":\"0\"},\"deptId\":102,\"email\":\"r1@qq.com\",\"idcardNo\":\"351\",\"inviteCode\":\"789c\",\"loginDate\":\"2024-01-02 21:22:09\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"testadmin\",\"params\":{},\"phonenumber\":\"15666666666\",\"postIds\":[2],\"realName\":\"冷笑话\",\"remark\":\"测试员\",\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"4\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"okpayadmin\",\"roleName\":\"OK平台管理员\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"userId\":2,\"userName\":\"testadmin\"}','{\"msg\":\"修改用户\'testadmin\'失败，身份证号已存在\",\"code\":500}',0,NULL,'2024-01-02 23:37:06',19),(130,'用户管理',2,'com.ruoyi.web.controller.system.SysUserController.edit()','PUT',1,'admin','研发部门','/system/user','127.0.0.1','内网IP','{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-01-02 21:22:09\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100\",\"children\":[],\"deptId\":102,\"deptName\":\"长沙分公司\",\"leader\":\"若依\",\"orderNum\":2,\"params\":{},\"parentId\":100,\"status\":\"0\"},\"deptId\":102,\"email\":\"r1@qq.com\",\"idcardNo\":\"351\",\"inviteCode\":\"789c\",\"loginDate\":\"2024-01-02 21:22:09\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"testadmin\",\"params\":{},\"phonenumber\":\"15666666666\",\"postIds\":[2],\"realName\":\"冷笑话\",\"remark\":\"测试员\",\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"4\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"okpayadmin\",\"roleName\":\"OK平台管理员\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"userId\":2,\"userName\":\"testadmin\"}','{\"msg\":\"修改用户\'testadmin\'失败，身份证号已存在\",\"code\":500}',0,NULL,'2024-01-02 23:37:11',18),(131,'用户管理',2,'com.ruoyi.web.controller.system.SysUserController.edit()','PUT',1,'admin','研发部门','/system/user','127.0.0.1','内网IP','{\"admin\":false,\"amount\":0.0,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-01-02 21:22:09\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100\",\"children\":[],\"deptId\":102,\"deptName\":\"长沙分公司\",\"leader\":\"若依\",\"orderNum\":2,\"params\":{},\"parentId\":100,\"status\":\"0\"},\"deptId\":102,\"email\":\"r1@qq.com\",\"idcardFrontImg\":\"/profile/upload/2024/01/02/身份证正面_20240102234517A001.png\",\"idcardNo\":\"350\",\"inviteCode\":\"789c\",\"loginDate\":\"2024-01-02 21:22:09\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"testadmin\",\"params\":{},\"phonenumber\":\"15666666666\",\"postIds\":[2],\"realName\":\"冷笑话\",\"remark\":\"测试员\",\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"4\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"okpayadmin\",\"roleName\":\"OK平台管理员\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"testadmin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-02 23:45:22',205),(132,'用户管理',2,'com.ruoyi.web.controller.system.SysUserController.edit()','PUT',1,'admin','研发部门','/system/user','127.0.0.1','内网IP','{\"admin\":false,\"amount\":0.0,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-01-02 21:22:09\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100\",\"children\":[],\"deptId\":102,\"deptName\":\"长沙分公司\",\"leader\":\"若依\",\"orderNum\":2,\"params\":{},\"parentId\":100,\"status\":\"0\"},\"deptId\":102,\"email\":\"r1@qq.com\",\"idcardFrontImg\":\"\",\"idcardNo\":\"350\",\"inviteCode\":\"789c\",\"loginDate\":\"2024-01-02 21:22:09\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"testadmin\",\"params\":{},\"phonenumber\":\"15666666666\",\"postIds\":[2],\"realName\":\"冷笑话\",\"remark\":\"测试员\",\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"4\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"okpayadmin\",\"roleName\":\"OK平台管理员\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"testadmin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-02 23:46:51',854),(133,'用户管理',2,'com.ruoyi.web.controller.system.SysUserController.edit()','PUT',1,'admin','研发部门','/system/user','127.0.0.1','内网IP','{\"admin\":false,\"alipayImg\":\"/profile/upload/2024/01/02/二维码2_20240102235103A004.PNG\",\"amount\":0.0,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-01-02 21:22:09\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100\",\"children\":[],\"deptId\":102,\"deptName\":\"长沙分公司\",\"leader\":\"若依\",\"orderNum\":2,\"params\":{},\"parentId\":100,\"status\":\"0\"},\"deptId\":102,\"email\":\"r1@qq.com\",\"idcardBackImg\":\"/profile/upload/2024/01/02/身份证反面_20240102235056A002.png\",\"idcardFrontImg\":\"/profile/upload/2024/01/02/身份证正面_20240102234517A001.png\",\"idcardNo\":\"350\",\"inviteCode\":\"789c\",\"loginDate\":\"2024-01-02 21:22:09\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"testadmin\",\"params\":{},\"phonenumber\":\"15666666666\",\"postIds\":[2],\"realName\":\"冷笑话\",\"remark\":\"测试员\",\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"4\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"okpayadmin\",\"roleName\":\"OK平台管理员\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"unionpayAccount\":\"1231\",\"unionpayCard\":\"123\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"testadmin\",\"wechatPayImg\":\"/profile/upload/2024/01/02/二维码1_20240102235100A003.PNG\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-02 23:51:11',116),(134,'用户管理',1,'com.ruoyi.web.controller.system.SysUserController.add()','POST',1,'admin','研发部门','/system/user','127.0.0.1','内网IP','{\"admin\":false,\"createBy\":\"admin\",\"deptId\":200,\"inviteCode\":\"e3970c\",\"nickName\":\"测试商户\",\"params\":{},\"postIds\":[],\"roleIds\":[3],\"status\":\"0\",\"userId\":100,\"userName\":\"liao1\",\"walletAddress\":\"c8efd54b8488e1e8\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-03 00:04:42',3617),(135,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.dataScope()','PUT',1,'admin','深圳总公司代理','/system/role/dataScope','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-01-02 22:53:21\",\"dataScope\":\"4\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"params\":{},\"roleId\":3,\"roleKey\":\"merchant\",\"roleName\":\"商户\",\"roleSort\":3,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-03 00:06:38',67),(136,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.dataScope()','PUT',1,'admin','深圳总公司代理','/system/role/dataScope','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-01-02 21:22:09\",\"dataScope\":\"4\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"params\":{},\"remark\":\"OK平台管理员\",\"roleId\":2,\"roleKey\":\"okpayadmin\",\"roleName\":\"OK平台管理员\",\"roleSort\":2,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-03 00:06:43',57),(137,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.dataScope()','PUT',1,'admin','深圳总公司代理','/system/role/dataScope','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-01-02 22:53:36\",\"dataScope\":\"4\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"params\":{},\"roleId\":4,\"roleKey\":\"agent\",\"roleName\":\"代理\",\"roleSort\":4,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-03 00:06:48',120),(138,'用户管理',2,'com.ruoyi.web.controller.system.SysUserController.edit()','PUT',1,'admin','深圳总公司代理','/system/user','127.0.0.1','内网IP','{\"admin\":false,\"alipayImg\":\"/profile/upload/2024/01/02/二维码2_20240102235103A004.PNG\",\"amount\":0.0,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-01-02 21:22:09\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100\",\"children\":[],\"deptId\":102,\"deptName\":\"长沙分公司\",\"leader\":\"若依\",\"orderNum\":2,\"params\":{},\"parentId\":100,\"status\":\"0\"},\"deptId\":100,\"email\":\"r1@qq.com\",\"idcardBackImg\":\"/profile/upload/2024/01/02/身份证反面_20240102235056A002.png\",\"idcardFrontImg\":\"/profile/upload/2024/01/02/身份证正面_20240102234517A001.png\",\"idcardNo\":\"350\",\"inviteCode\":\"789c\",\"loginDate\":\"2024-01-03 00:08:17\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"testadmin\",\"params\":{},\"phonenumber\":\"15666666666\",\"postIds\":[2],\"realName\":\"冷笑话\",\"remark\":\"测试员\",\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"4\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"okpayadmin\",\"roleName\":\"OK平台管理员\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"unionpayAccount\":\"1231\",\"unionpayCard\":\"123\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"testadmin\",\"wechatPayImg\":\"/profile/upload/2024/01/02/二维码1_20240102235100A003.PNG\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-03 00:08:52',489),(139,'用户管理',3,'com.ruoyi.web.controller.system.SysUserController.remove()','DELETE',1,'testadmin','OKPAY平台','/system/user/100','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-03 00:09:29',356),(140,'用户管理',1,'com.ruoyi.web.controller.system.SysUserController.add()','POST',1,'testadmin','OKPAY平台','/system/user','127.0.0.1','内网IP','{\"admin\":false,\"createBy\":\"testadmin\",\"deptId\":200,\"idcardFrontImg\":\"/profile/upload/2024/01/03/身份证正面_20240103001027A005.png\",\"inviteCode\":\"e7afd6\",\"nickName\":\"测试商户\",\"params\":{},\"postIds\":[],\"roleIds\":[3],\"status\":\"0\",\"userId\":3,\"userName\":\"liao1\",\"walletAddress\":\"96dd63595f287715\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-03 00:10:31',176),(141,'用户管理',2,'com.ruoyi.web.controller.system.SysUserController.edit()','PUT',1,'admin',NULL,'/system/user','127.0.0.1','内网IP','{\"admin\":false,\"amount\":0.0,\"avatar\":\"\",\"createBy\":\"testadmin\",\"createTime\":\"2024-01-03 00:10:30\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100\",\"children\":[],\"deptId\":200,\"deptName\":\"测试商户1\",\"orderNum\":3,\"params\":{},\"parentId\":100,\"status\":\"0\"},\"deptId\":200,\"email\":\"\",\"idcardBackImg\":\"/profile/upload/2024/01/04/身份证反面_20240104224213A001.png\",\"idcardFrontImg\":\"/profile/upload/2024/01/03/身份证正面_20240103001027A005.png\",\"inviteCode\":\"e7afd6\",\"loginIp\":\"\",\"nickName\":\"测试商户\",\"normalCommission\":5,\"params\":{},\"parentUserId\":2,\"phonenumber\":\"\",\"postIds\":[],\"roleIds\":[3],\"roles\":[{\"admin\":false,\"dataScope\":\"4\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":3,\"roleKey\":\"merchant\",\"roleName\":\"商户\",\"roleSort\":3,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"ungentCommission\":10,\"updateBy\":\"admin\",\"userId\":3,\"userName\":\"liao1\",\"userType\":\"00\",\"walletAddress\":\"96dd63595f287715\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-04 22:42:15',184),(142,'角色管理',1,'com.ruoyi.web.controller.system.SysRoleController.add()','POST',1,'admin',NULL,'/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[],\"params\":{},\"roleId\":5,\"roleKey\":\"customer\",\"roleName\":\"客户\",\"roleSort\":5,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-04 22:44:35',641),(143,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.dataScope()','PUT',1,'admin',NULL,'/system/role/dataScope','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-01-04 22:44:34\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"params\":{},\"roleId\":5,\"roleKey\":\"customer\",\"roleName\":\"客户\",\"roleSort\":5,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-04 22:45:00',86),(144,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.dataScope()','PUT',1,'admin',NULL,'/system/role/dataScope','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-01-02 22:53:36\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"params\":{},\"roleId\":4,\"roleKey\":\"agent\",\"roleName\":\"代理\",\"roleSort\":4,\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-04 22:45:05',72),(145,'部门管理',1,'com.ruoyi.web.controller.system.SysDeptController.add()','POST',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"children\":[],\"deptName\":\"测试商户2\",\"normalCommission\":5,\"orderNum\":4,\"params\":{},\"parentId\":100,\"status\":\"0\",\"ungentCommission\":10,\"userName\":\"liao2\"}',NULL,1,'\r\n### Error querying database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'del_flag\' in where clause is ambiguous\r\n### The error may exist in file [D:\\projcet\\RuoYi-Vue\\ruoyi-system\\target\\classes\\mapper\\system\\SysDeptMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select d.dept_id, d.parent_id, d.ancestors, d.dept_name, d.order_num, d.leader, d.phone, d.email, d.status, d.del_flag, d.create_by, d.create_time, u.user_id, u.user_name, u.nick_name, u.password, u.ungent_commission, u.normal_commission         from sys_dept d   left join sys_user u on d.user_id = u.user_id         where dept_name=? and parent_id = ? and del_flag = \'0\' limit 1\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'del_flag\' in where clause is ambiguous\n; Column \'del_flag\' in where clause is ambiguous; nested exception is java.sql.SQLIntegrityConstraintViolationException: Column \'del_flag\' in where clause is ambiguous','2024-01-04 22:55:11',61),(146,'部门管理',1,'com.ruoyi.web.controller.system.SysDeptController.add()','POST',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"children\":[],\"deptName\":\"测试商户2\",\"normalCommission\":5,\"orderNum\":4,\"params\":{},\"parentId\":100,\"status\":\"0\",\"ungentCommission\":10,\"userName\":\"liao2\"}',NULL,1,'\r\n### Error querying database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'del_flag\' in where clause is ambiguous\r\n### The error may exist in file [D:\\projcet\\RuoYi-Vue\\ruoyi-system\\target\\classes\\mapper\\system\\SysDeptMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select d.dept_id, d.parent_id, d.ancestors, d.dept_name, d.order_num, d.leader, d.phone, d.email, d.status, d.del_flag, d.create_by, d.create_time, u.user_id, u.user_name, u.nick_name, u.password, u.ungent_commission, u.normal_commission         from sys_dept d   left join sys_user u on d.user_id = u.user_id         where dept_name=? and parent_id = ? and del_flag = \'0\' limit 1\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'del_flag\' in where clause is ambiguous\n; Column \'del_flag\' in where clause is ambiguous; nested exception is java.sql.SQLIntegrityConstraintViolationException: Column \'del_flag\' in where clause is ambiguous','2024-01-04 23:00:35',112),(147,'部门管理',1,'com.ruoyi.web.controller.system.SysDeptController.add()','POST',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"children\":[],\"deptName\":\"测试商户2\",\"normalCommission\":5,\"orderNum\":4,\"params\":{},\"parentId\":100,\"status\":\"0\",\"ungentCommission\":10,\"userName\":\"liao2\"}',NULL,1,'\r\n### Error querying database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'del_flag\' in where clause is ambiguous\r\n### The error may exist in file [D:\\projcet\\RuoYi-Vue\\ruoyi-system\\target\\classes\\mapper\\system\\SysDeptMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select d.dept_id, d.parent_id, d.ancestors, d.dept_name, d.order_num, d.leader, d.phone, d.email, d.status, d.del_flag, d.create_by, d.create_time, u.user_id, u.user_name, u.nick_name, u.password, u.ungent_commission, u.normal_commission         from sys_dept d   left join sys_user u on d.user_id = u.user_id         where dept_name=? and parent_id = ? and del_flag = \'0\' limit 1\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Column \'del_flag\' in where clause is ambiguous\n; Column \'del_flag\' in where clause is ambiguous; nested exception is java.sql.SQLIntegrityConstraintViolationException: Column \'del_flag\' in where clause is ambiguous','2024-01-04 23:00:54',4),(148,'部门管理',1,'com.ruoyi.web.controller.system.SysDeptController.add()','POST',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"ancestors\":\"0,100\",\"children\":[],\"createBy\":\"admin\",\"deptId\":202,\"deptName\":\"测试商户2\",\"normalCommission\":5,\"orderNum\":4,\"params\":{},\"parentId\":100,\"status\":\"0\",\"ungentCommission\":10,\"userName\":\"liao2\"}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'203\' for key \'PRIMARY\'\r\n### The error may exist in file [D:\\projcet\\RuoYi-Vue\\ruoyi-system\\target\\classes\\mapper\\system\\SysDeptMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysDeptMapper.insertDept-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_dept(      dept_id,       parent_id,       dept_name,       ancestors,                                          create_time    )values(      ?,       ?,       ?,       ?,                                          sysdate()    )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'203\' for key \'PRIMARY\'\n; Duplicate entry \'203\' for key \'PRIMARY\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'203\' for key \'PRIMARY\'','2024-01-04 23:02:04',195),(149,'部门管理',1,'com.ruoyi.web.controller.system.SysDeptController.add()','POST',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"ancestors\":\"0,100\",\"children\":[],\"createBy\":\"admin\",\"deptId\":204,\"deptName\":\"测试商户2\",\"normalCommission\":5,\"orderNum\":4,\"params\":{},\"parentId\":100,\"status\":\"0\",\"ungentCommission\":10,\"userName\":\"liao2\"}',NULL,1,'rawPassword cannot be null','2024-01-04 23:03:44',478),(150,'部门管理',1,'com.ruoyi.web.controller.system.SysDeptController.add()','POST',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"ancestors\":\"0,100\",\"children\":[],\"createBy\":\"admin\",\"deptId\":207,\"deptName\":\"测试商户2\",\"normalCommission\":5,\"orderNum\":4,\"params\":{},\"parentId\":100,\"status\":\"0\",\"ungentCommission\":10,\"userName\":\"liao2\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-04 23:05:25',376),(151,'部门管理',1,'com.ruoyi.web.controller.system.SysDeptController.add()','POST',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"ancestors\":\"0,100,207,208\",\"children\":[],\"createBy\":\"admin\",\"deptId\":210,\"deptName\":\"ces\",\"normalCommission\":1,\"orderNum\":0,\"params\":{},\"parentId\":208,\"status\":\"0\",\"ungentCommission\":1,\"userName\":\"liao3\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-04 23:07:37',856),(152,'部门管理',1,'com.ruoyi.web.controller.system.SysDeptController.add()','POST',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"ancestors\":\"0,100\",\"children\":[],\"createBy\":\"admin\",\"deptId\":211,\"deptName\":\"测试商户3\",\"normalCommission\":10,\"orderNum\":0,\"params\":{},\"parentId\":100,\"status\":\"0\",\"ungentCommission\":20,\"userName\":\"liao3\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-04 23:14:00',778),(153,'部门管理',1,'com.ruoyi.web.controller.system.SysDeptController.add()','POST',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"ancestors\":\"0,100\",\"children\":[],\"createBy\":\"admin\",\"deptId\":214,\"deptName\":\"测试商户3\",\"normalCommission\":5,\"orderNum\":0,\"params\":{},\"parentId\":100,\"status\":\"0\",\"ungentCommission\":10,\"userName\":\"liao3\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-04 23:15:52',32682),(154,'部门管理',1,'com.ruoyi.web.controller.system.SysDeptController.add()','POST',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"ancestors\":\"0,100\",\"children\":[],\"createBy\":\"admin\",\"deptId\":210,\"deptName\":\"测试商户3\",\"normalCommission\":5,\"orderNum\":0,\"params\":{},\"parentId\":100,\"status\":\"0\",\"ungentCommission\":10,\"userName\":\"liao3\"}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'5-3\' for key \'PRIMARY\'\r\n### The error may exist in file [D:\\projcet\\RuoYi-Vue\\ruoyi-system\\target\\classes\\mapper\\system\\SysUserRoleMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_user_role(user_id, role_id) values         (?,?)\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'5-3\' for key \'PRIMARY\'\n; Duplicate entry \'5-3\' for key \'PRIMARY\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'5-3\' for key \'PRIMARY\'','2024-01-04 23:18:31',675),(155,'部门管理',1,'com.ruoyi.web.controller.system.SysDeptController.add()','POST',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"ancestors\":\"0,100\",\"children\":[],\"createBy\":\"admin\",\"deptId\":213,\"deptName\":\"测试商户3\",\"normalCommission\":5,\"orderNum\":0,\"params\":{},\"parentId\":100,\"status\":\"0\",\"ungentCommission\":10,\"userName\":\"liao3\"}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'6-3\' for key \'PRIMARY\'\r\n### The error may exist in file [D:\\projcet\\RuoYi-Vue\\ruoyi-system\\target\\classes\\mapper\\system\\SysUserRoleMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_user_role(user_id, role_id) values         (?,?)\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'6-3\' for key \'PRIMARY\'\n; Duplicate entry \'6-3\' for key \'PRIMARY\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'6-3\' for key \'PRIMARY\'','2024-01-04 23:19:12',1196),(156,'部门管理',1,'com.ruoyi.web.controller.system.SysDeptController.add()','POST',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"ancestors\":\"0,100\",\"children\":[],\"createBy\":\"admin\",\"deptId\":216,\"deptName\":\"测试商户3\",\"normalCommission\":5,\"orderNum\":0,\"params\":{},\"parentId\":100,\"status\":\"0\",\"ungentCommission\":10,\"userName\":\"liao3\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-04 23:20:33',4155),(157,'部门管理',2,'com.ruoyi.web.controller.system.SysDeptController.edit()','PUT',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"ancestors\":\"0,100\",\"children\":[],\"deptId\":200,\"deptName\":\"测试商户1\",\"normalCommission\":5,\"orderNum\":0,\"params\":{},\"parentId\":100,\"parentName\":\"OKPAY平台\",\"status\":\"0\",\"ungentCommission\":15,\"updateBy\":\"admin\",\"userId\":3,\"userName\":\"liao1\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-04 23:26:04',516),(158,'部门管理',2,'com.ruoyi.web.controller.system.SysDeptController.edit()','PUT',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"ancestors\":\"0,100\",\"children\":[],\"createAgentFlg\":\"true\",\"deptId\":216,\"deptName\":\"测试商户3\",\"normalCommission\":5,\"orderNum\":0,\"params\":{},\"parentId\":100,\"parentName\":\"OKPAY平台\",\"status\":\"0\",\"ungentCommission\":10,\"updateBy\":\"admin\",\"userId\":7,\"userName\":\"liao3\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-05 21:16:46',267),(159,'部门管理',2,'com.ruoyi.web.controller.system.SysDeptController.edit()','PUT',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"ancestors\":\"0,100\",\"children\":[],\"createAgentFlg\":\"true\",\"deptId\":216,\"deptName\":\"测试商户3\",\"normalCommission\":5,\"orderNum\":0,\"params\":{},\"parentId\":100,\"parentName\":\"OKPAY平台\",\"status\":\"0\",\"ungentCommission\":10,\"updateBy\":\"admin\",\"userId\":7,\"userName\":\"liao3\"}',NULL,1,'\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'create_agent_flg\' at row 1\r\n### The error may exist in file [D:\\projcet\\RuoYi-Vue\\ruoyi-system\\target\\classes\\mapper\\system\\SysUserMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysUserMapper.updateUser-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update sys_user     SET ungent_commission = ?,    normal_commission = ?,    create_agent_flg = ?,                              update_time = sysdate()     where user_id = ?\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'create_agent_flg\' at row 1\n; Data truncation: Data too long for column \'create_agent_flg\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'create_agent_flg\' at row 1','2024-01-05 21:18:26',487),(160,'部门管理',2,'com.ruoyi.web.controller.system.SysDeptController.edit()','PUT',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"ancestors\":\"0,100\",\"children\":[],\"createAgentFlg\":\"true\",\"deptId\":216,\"deptName\":\"测试商户3\",\"normalCommission\":5,\"orderNum\":0,\"params\":{},\"parentId\":100,\"parentName\":\"OKPAY平台\",\"status\":\"0\",\"ungentCommission\":10,\"updateBy\":\"admin\",\"userId\":7,\"userName\":\"liao3\"}',NULL,1,'\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'create_agent_flg\' at row 1\r\n### The error may exist in file [D:\\projcet\\RuoYi-Vue\\ruoyi-system\\target\\classes\\mapper\\system\\SysUserMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysUserMapper.updateUser-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update sys_user     SET ungent_commission = ?,    normal_commission = ?,    create_agent_flg = ?,                              update_time = sysdate()     where user_id = ?\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'create_agent_flg\' at row 1\n; Data truncation: Data too long for column \'create_agent_flg\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'create_agent_flg\' at row 1','2024-01-05 21:19:34',42777),(161,'部门管理',2,'com.ruoyi.web.controller.system.SysDeptController.edit()','PUT',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"ancestors\":\"0,100\",\"children\":[],\"createAgentFlg\":\"1\",\"deptId\":216,\"deptName\":\"测试商户3\",\"normalCommission\":5,\"orderNum\":0,\"params\":{},\"parentId\":100,\"parentName\":\"OKPAY平台\",\"status\":\"0\",\"ungentCommission\":10,\"updateBy\":\"admin\",\"userId\":7,\"userName\":\"liao3\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-05 21:29:02',8404),(162,'部门管理',2,'com.ruoyi.web.controller.system.SysDeptController.edit()','PUT',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"ancestors\":\"0,100\",\"children\":[],\"createAgentFlg\":\"0\",\"deptId\":216,\"deptName\":\"测试商户3\",\"normalCommission\":5,\"orderNum\":0,\"params\":{},\"parentId\":100,\"parentName\":\"OKPAY平台\",\"status\":\"0\",\"ungentCommission\":10,\"updateBy\":\"admin\",\"userId\":7,\"userName\":\"liao3\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-05 21:29:07',189),(163,'商户管理',2,'com.ruoyi.web.controller.system.SysDeptController.edit()','PUT',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"ancestors\":\"0,100\",\"children\":[],\"createAgentFlg\":\"1\",\"deptId\":216,\"deptName\":\"测试商户3\",\"normalCommission\":5,\"orderNum\":0,\"params\":{},\"parentId\":100,\"parentName\":\"OKPAY平台\",\"status\":\"0\",\"ungentCommission\":10,\"userId\":7,\"userName\":\"liao3\"}','{\"msg\":\"该商户包含未停用的其他代理！\",\"code\":500}',0,NULL,'2024-01-05 21:44:28',23),(164,'商户管理',2,'com.ruoyi.web.controller.system.SysDeptController.edit()','PUT',1,'admin',NULL,'/system/dept','127.0.0.1','内网IP','{\"ancestors\":\"0,100\",\"children\":[],\"createAgentFlg\":\"1\",\"deptId\":216,\"deptName\":\"测试商户3\",\"normalCommission\":5,\"orderNum\":0,\"params\":{},\"parentId\":100,\"parentName\":\"OKPAY平台\",\"status\":\"0\",\"ungentCommission\":10,\"updateBy\":\"admin\",\"userId\":7,\"userName\":\"liao3\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-05 21:44:38',196),(165,'个人信息',2,'com.ruoyi.web.controller.system.SysProfileController.updatePwd()','PUT',1,'admin',NULL,'/system/user/profile/updatePwd','127.0.0.1','内网IP','{}','{\"msg\":\"新密码不能与旧密码相同\",\"code\":500}',0,NULL,'2024-01-06 19:44:03',25544),(166,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin',NULL,'/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"sys_chat\"}',NULL,0,NULL,'2024-01-06 23:40:36',399),(167,'用户头像',2,'com.ruoyi.web.controller.system.SysProfileController.avatar()','POST',1,'admin',NULL,'/system/user/profile/avatar','127.0.0.1','内网IP','','{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2024/01/07/头像_20240107111226A001.png\",\"code\":200}',0,NULL,'2024-01-07 11:12:26',204),(168,'用户头像',2,'com.ruoyi.web.controller.system.SysProfileController.avatar()','POST',1,'okadmin','OKPAY平台','/system/user/profile/avatar','127.0.0.1','内网IP','','{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2024/01/07/头像2_20240107111704A002.png\",\"code\":200}',0,NULL,'2024-01-07 11:17:05',716),(169,'代码生成',6,'com.ruoyi.generator.controller.GenController.importTableSave()','POST',1,'admin',NULL,'/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"sale_coin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-13 15:10:01',541),(170,'代码生成',3,'com.ruoyi.generator.controller.GenController.remove()','DELETE',1,'admin',NULL,'/tool/gen/2','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-13 15:10:27',104),(171,'代码生成',6,'com.ruoyi.generator.controller.GenController.importTableSave()','POST',1,'admin',NULL,'/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"sys_sale_coin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-13 15:12:18',119),(172,'代码生成',3,'com.ruoyi.generator.controller.GenController.remove()','DELETE',1,'admin',NULL,'/tool/gen/3','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-13 15:28:35',167),(173,'代码生成',6,'com.ruoyi.generator.controller.GenController.importTableSave()','POST',1,'admin',NULL,'/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"sys_sale_coin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-13 15:35:36',116),(174,'代码生成',6,'com.ruoyi.generator.controller.GenController.importTableSave()','POST',1,'admin',NULL,'/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"sys_buy_coin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-13 15:35:46',185),(175,'代码生成',6,'com.ruoyi.generator.controller.GenController.importTableSave()','POST',1,'admin',NULL,'/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"sys_transaction_record\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-13 15:36:57',114),(176,'代码生成',6,'com.ruoyi.generator.controller.GenController.importTableSave()','POST',1,'admin',NULL,'/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"sys_recharge\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-13 15:37:07',445),(177,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin',NULL,'/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"sys_sale_coin,sys_buy_coin,sys_transaction_record,sys_recharge\"}',NULL,0,NULL,'2024-01-13 15:39:54',3731),(178,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin',NULL,'/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"saleCoin\",\"className\":\"SysSaleCoin\",\"columns\":[{\"capJavaField\":\"SaleId\",\"columnComment\":\"卖币ID\",\"columnId\":36,\"columnName\":\"sale_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-01-13 15:35:36\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"saleId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"SaleNo\",\"columnComment\":\"卖币No\",\"columnId\":37,\"columnName\":\"sale_no\",\"columnType\":\"varchar(3000)\",\"createBy\":\"admin\",\"createTime\":\"2024-01-13 15:35:36\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"saleNo\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"SaleTime\",\"columnComment\":\"卖币时间\",\"columnId\":38,\"columnName\":\"sale_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-01-13 15:35:36\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"saleTime\",\"javaType\":\"Date\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"SaleUserId\",\"columnComment\":\"卖币用户ID\",\"columnId\":39,\"columnName\":\"sale_user_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-01-13 15:35:36\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-13 15:48:24',145),(179,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin',NULL,'/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"buyCoin\",\"className\":\"SysBuyCoin\",\"columns\":[{\"capJavaField\":\"BuyId\",\"columnComment\":\"买币ID\",\"columnId\":51,\"columnName\":\"buy_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-01-13 15:35:46\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"buyId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"SaleId\",\"columnComment\":\"卖币ID\",\"columnId\":52,\"columnName\":\"sale_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-01-13 15:35:46\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"saleId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"SaleUserId\",\"columnComment\":\"卖币用户ID\",\"columnId\":53,\"columnName\":\"sale_user_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-01-13 15:35:46\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"saleUserId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"BuyUserId\",\"columnComment\":\"买币用户ID\",\"columnId\":54,\"columnName\":\"buy_user_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-01-13 15:35:46\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequir','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-13 15:48:36',569),(180,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin',NULL,'/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"transactionRecord\",\"className\":\"SysTransactionRecord\",\"columns\":[{\"capJavaField\":\"RecordId\",\"columnComment\":\"记录ID\",\"columnId\":64,\"columnName\":\"record_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-01-13 15:36:57\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"recordId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"交易用户ID\",\"columnId\":65,\"columnName\":\"user_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-01-13 15:36:57\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"RecordTime\",\"columnComment\":\"交易时间\",\"columnId\":66,\"columnName\":\"record_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-01-13 15:36:57\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"recordTime\",\"javaType\":\"Date\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"RecordType\",\"columnComment\":\"交易类型（0买币 1卖币 2商家直充 3代理充值 4手续费）\",\"columnId\":67,\"columnName\":\"record_type\",\"columnType\":\"char(1)\",\"createBy\":\"admin\",\"createTime\":\"2024-01-13 15:36:57\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-13 15:48:53',85),(181,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin',NULL,'/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"sys_sale_coin,sys_buy_coin,sys_transaction_record\"}',NULL,0,NULL,'2024-01-13 15:49:13',501),(182,'代码生成',3,'com.ruoyi.generator.controller.GenController.remove()','DELETE',1,'admin',NULL,'/tool/gen/6','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-19 21:16:55',206),(183,'代码生成',6,'com.ruoyi.generator.controller.GenController.importTableSave()','POST',1,'admin',NULL,'/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"sys_transaction_record\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-19 21:17:11',264),(184,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin',NULL,'/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"transactionRecord\",\"className\":\"SysTransactionRecord\",\"columns\":[{\"capJavaField\":\"RecordId\",\"columnComment\":\"记录ID\",\"columnId\":81,\"columnName\":\"record_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-01-19 21:17:11\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"recordId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"交易用户ID\",\"columnId\":82,\"columnName\":\"user_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-01-19 21:17:11\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"RecordTime\",\"columnComment\":\"交易时间\",\"columnId\":83,\"columnName\":\"record_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-01-19 21:17:11\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"recordTime\",\"javaType\":\"Date\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"RecordType\",\"columnComment\":\"交易类型（0买币 1卖币 2商家直充 3代理充值 4手续费）\",\"columnId\":84,\"columnName\":\"record_type\",\"columnType\":\"char(1)\",\"createBy\":\"admin\",\"createTime\":\"2024-01-19 21:17:11\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-19 21:17:46',85),(185,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin',NULL,'/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"sys_transaction_record\"}',NULL,0,NULL,'2024-01-19 21:17:52',314),(186,'代码生成',3,'com.ruoyi.generator.controller.GenController.remove()','DELETE',1,'admin',NULL,'/tool/gen/7','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-19 21:35:17',151),(187,'代码生成',6,'com.ruoyi.generator.controller.GenController.importTableSave()','POST',1,'admin',NULL,'/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"sys_recharge\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-19 21:35:22',200),(188,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin',NULL,'/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"sys_recharge\"}',NULL,0,NULL,'2024-01-19 22:23:16',376),(189,'商户管理',1,'com.ruoyi.web.controller.system.SysDeptController.add()','POST',1,'okadmin','OKPAY平台','/system/dept','127.0.0.1','内网IP','{\"ancestors\":\"0,100\",\"children\":[],\"createAgentFlg\":\"0\",\"createBy\":\"okadmin\",\"deptId\":219,\"deptName\":\"测试商户4\",\"normalCommission\":5,\"orderNum\":0,\"params\":{},\"parentId\":100,\"status\":\"0\",\"ungentCommission\":10,\"userName\":\"liao4\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-19 22:53:21',428),(190,'用户管理',2,'com.ruoyi.web.controller.system.SysUserController.edit()','PUT',1,'okadmin','OKPAY平台','/system/user','127.0.0.1','内网IP','{\"admin\":false,\"amount\":0.0,\"avatar\":\"\",\"createAgentFlg\":\"0\",\"createBy\":\"\",\"createTime\":\"2024-01-19 22:54:35\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,219\",\"children\":[],\"deptId\":220,\"deptName\":\"测试商户4代理\",\"orderNum\":0,\"params\":{},\"parentId\":219,\"status\":\"0\"},\"deptId\":220,\"email\":\"\",\"idcardBackImg\":\"/profile/upload/2024/01/19/image_20240119225435A002.jpeg\",\"idcardFrontImg\":\"/profile/upload/2024/01/19/image_20240119225435A001.jpeg\",\"idcardNo\":\"123123121\",\"inviteCode\":\"9b9e1c\",\"loginIp\":\"\",\"nickName\":\"测试客户2\",\"normalCommission\":0,\"params\":{},\"parentUserId\":12,\"payPassword\":\"$2a$10$2TnEyCbt/0u79ec4t91KuuAmY/u0tVCUzo7QeUMQ.b29qvRkF6IdO\",\"phonenumber\":\"15888888882\",\"postIds\":[],\"realName\":\"客\",\"roleIds\":[4],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":4,\"roleKey\":\"agent\",\"roleName\":\"代理\",\"roleSort\":4,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"ungentCommission\":0,\"updateBy\":\"okadmin\",\"userId\":13,\"userName\":\"agent2\",\"userType\":\"03\",\"walletAddress\":\"392a0c09a2d5cbbf\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-19 22:55:03',95),(191,'用户管理',2,'com.ruoyi.web.controller.system.SysUserController.edit()','PUT',1,'okadmin','OKPAY平台','/system/user','127.0.0.1','内网IP','{\"admin\":false,\"amount\":0.0,\"avatar\":\"\",\"createAgentFlg\":\"0\",\"createBy\":\"\",\"createTime\":\"2024-01-19 22:54:35\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,219\",\"children\":[],\"deptId\":220,\"deptName\":\"测试商户4代理\",\"orderNum\":0,\"params\":{},\"parentId\":219,\"status\":\"0\"},\"deptId\":220,\"email\":\"\",\"idcardBackImg\":\"/profile/upload/2024/01/19/image_20240119225435A002.jpeg\",\"idcardFrontImg\":\"/profile/upload/2024/01/19/image_20240119225435A001.jpeg\",\"idcardNo\":\"123123121\",\"inviteCode\":\"9b9e1c\",\"loginIp\":\"\",\"nickName\":\"测试代理2\",\"normalCommission\":0,\"params\":{},\"parentUserId\":12,\"payPassword\":\"$2a$10$2TnEyCbt/0u79ec4t91KuuAmY/u0tVCUzo7QeUMQ.b29qvRkF6IdO\",\"phonenumber\":\"15888888882\",\"postIds\":[],\"realName\":\"客\",\"roleIds\":[4],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":4,\"roleKey\":\"agent\",\"roleName\":\"代理\",\"roleSort\":4,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"ungentCommission\":0,\"updateBy\":\"okadmin\",\"userId\":13,\"userName\":\"agent2\",\"userType\":\"03\",\"walletAddress\":\"392a0c09a2d5cbbf\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-19 22:55:52',3525),(192,'代码生成',3,'com.ruoyi.generator.controller.GenController.remove()','DELETE',1,'admin',NULL,'/tool/gen/9','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-20 10:17:05',135),(193,'代码生成',6,'com.ruoyi.generator.controller.GenController.importTableSave()','POST',1,'admin',NULL,'/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"sys_recharge\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-20 10:17:20',193),(194,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin',NULL,'/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"sys_recharge\"}',NULL,0,NULL,'2024-01-20 10:17:24',321),(195,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin',NULL,'/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"sys_sale_coin,sys_buy_coin,sys_transaction_record,sys_recharge\"}',NULL,0,NULL,'2024-01-20 12:02:19',606),(196,'代码生成',6,'com.ruoyi.generator.controller.GenController.importTableSave()','POST',1,'admin',NULL,'/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"sys_mail_user,sys_mail\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-21 18:30:08',232),(197,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin',NULL,'/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"mailUser\",\"className\":\"SysMailUser\",\"columns\":[{\"capJavaField\":\"MailId\",\"columnComment\":\"站内信ID\",\"columnId\":124,\"columnName\":\"mail_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-01-21 18:30:08\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"mailId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":12,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"用户ID\",\"columnId\":125,\"columnName\":\"user_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-01-21 18:30:08\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":12,\"updateBy\":\"\",\"usableColumn\":false}],\"crud\":true,\"functionAuthor\":\"ruoyi\",\"functionName\":\"站内信和用户关联\",\"genPath\":\"/\",\"genType\":\"0\",\"moduleName\":\"system\",\"options\":\"{}\",\"packageName\":\"com.ruoyi.system\",\"params\":{},\"sub\":false,\"tableComment\":\"站内信和用户关联表\",\"tableId\":12,\"tableName\":\"sys_mail_user\",\"tplCategory\":\"crud\",\"tplWebType\":\"element-ui\",\"tree\":false}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-21 18:30:29',52),(198,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin',NULL,'/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"sys_mail,sys_mail_user\"}',NULL,0,NULL,'2024-01-21 18:30:44',345),(199,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"system/mail/index\",\"createTime\":\"2024-01-21 18:36:03\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1061,\"menuName\":\"站内信\",\"menuType\":\"C\",\"orderNum\":10,\"params\":{},\"parentId\":1,\"path\":\"mail\",\"perms\":\"system:mail:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-21 18:38:00',60),(200,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"system/mail/index\",\"createTime\":\"2024-01-21 18:36:03\",\"icon\":\"email\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1061,\"menuName\":\"站内信\",\"menuType\":\"C\",\"orderNum\":10,\"params\":{},\"parentId\":1,\"path\":\"mail\",\"perms\":\"system:mail:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-21 18:38:21',350),(201,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.edit()','PUT',1,'admin',NULL,'/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-01-02 21:22:09\",\"dataScope\":\"4\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,103,1016,1017,1018,1019,1061,1062,1063,1064,1065,1066],\"params\":{},\"remark\":\"OK平台管理员\",\"roleId\":2,\"roleKey\":\"okpayadmin\",\"roleName\":\"OK平台管理员\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-21 18:39:17',2447),(202,'站内信',1,'com.ruoyi.web.controller.system.SysMailController.add()','POST',1,'admin',NULL,'/system/mail','127.0.0.1','内网IP','{\"createTime\":\"2024-01-21 18:48:28\",\"params\":{},\"status\":\"0\"}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'mail_content\' doesn\'t have a default value\r\n### The error may exist in file [D:\\projcet\\RuoYi-Vue\\ruoyi-system\\target\\classes\\mapper\\system\\SysMailMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysMailMapper.insertSysMail-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_mail          ( status,                          create_time )           values ( ?,                          ? )\r\n### Cause: java.sql.SQLException: Field \'mail_content\' doesn\'t have a default value\n; Field \'mail_content\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'mail_content\' doesn\'t have a default value','2024-01-21 18:48:28',65),(203,'站内信',1,'com.ruoyi.web.controller.system.SysMailController.add()','POST',1,'admin',NULL,'/system/mail','127.0.0.1','内网IP','{\"createTime\":\"2024-01-21 18:51:55\",\"params\":{},\"status\":\"0\"}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'mail_content\' doesn\'t have a default value\r\n### The error may exist in file [D:\\projcet\\RuoYi-Vue\\ruoyi-system\\target\\classes\\mapper\\system\\SysMailMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysMailMapper.insertSysMail-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_mail          ( status,                          create_time )           values ( ?,                          ? )\r\n### Cause: java.sql.SQLException: Field \'mail_content\' doesn\'t have a default value\n; Field \'mail_content\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'mail_content\' doesn\'t have a default value','2024-01-21 18:51:55',4),(204,'站内信',1,'com.ruoyi.web.controller.system.SysMailController.add()','POST',1,'admin',NULL,'/system/mail','127.0.0.1','内网IP','{\"createTime\":\"2024-01-21 18:52:59\",\"params\":{},\"status\":\"0\"}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'mail_content\' doesn\'t have a default value\r\n### The error may exist in file [D:\\projcet\\RuoYi-Vue\\ruoyi-system\\target\\classes\\mapper\\system\\SysMailMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysMailMapper.insertSysMail-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_mail          ( status,                          create_time )           values ( ?,                          ? )\r\n### Cause: java.sql.SQLException: Field \'mail_content\' doesn\'t have a default value\n; Field \'mail_content\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'mail_content\' doesn\'t have a default value','2024-01-21 18:53:00',9),(205,'站内信',1,'com.ruoyi.web.controller.system.SysMailController.add()','POST',1,'admin',NULL,'/system/mail','127.0.0.1','内网IP','{\"createTime\":\"2024-01-21 18:53:25\",\"params\":{},\"status\":\"0\"}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'mail_content\' doesn\'t have a default value\r\n### The error may exist in file [D:\\projcet\\RuoYi-Vue\\ruoyi-system\\target\\classes\\mapper\\system\\SysMailMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysMailMapper.insertSysMail-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_mail          ( status,                          create_time )           values ( ?,                          ? )\r\n### Cause: java.sql.SQLException: Field \'mail_content\' doesn\'t have a default value\n; Field \'mail_content\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'mail_content\' doesn\'t have a default value','2024-01-21 18:53:25',4),(206,'站内信',1,'com.ruoyi.web.controller.system.SysMailController.add()','POST',1,'admin',NULL,'/system/mail','127.0.0.1','内网IP','{\"createTime\":\"2024-01-21 18:53:40\",\"params\":{},\"status\":\"0\"}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'mail_content\' doesn\'t have a default value\r\n### The error may exist in file [D:\\projcet\\RuoYi-Vue\\ruoyi-system\\target\\classes\\mapper\\system\\SysMailMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysMailMapper.insertSysMail-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_mail          ( status,                          create_time )           values ( ?,                          ? )\r\n### Cause: java.sql.SQLException: Field \'mail_content\' doesn\'t have a default value\n; Field \'mail_content\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'mail_content\' doesn\'t have a default value','2024-01-21 18:53:40',5),(207,'站内信',1,'com.ruoyi.web.controller.system.SysMailController.add()','POST',1,'admin',NULL,'/system/mail','127.0.0.1','内网IP','{\"createTime\":\"2024-01-21 18:54:02\",\"params\":{},\"status\":\"0\"}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'mail_content\' doesn\'t have a default value\r\n### The error may exist in file [D:\\projcet\\RuoYi-Vue\\ruoyi-system\\target\\classes\\mapper\\system\\SysMailMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysMailMapper.insertSysMail-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_mail          ( status,                          create_time )           values ( ?,                          ? )\r\n### Cause: java.sql.SQLException: Field \'mail_content\' doesn\'t have a default value\n; Field \'mail_content\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'mail_content\' doesn\'t have a default value','2024-01-21 18:54:02',4),(208,'站内信',1,'com.ruoyi.web.controller.system.SysMailController.add()','POST',1,'admin',NULL,'/system/mail','127.0.0.1','内网IP','{\"createTime\":\"2024-01-21 18:55:10\",\"params\":{},\"status\":\"0\"}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'mail_content\' doesn\'t have a default value\r\n### The error may exist in file [D:\\projcet\\RuoYi-Vue\\ruoyi-system\\target\\classes\\mapper\\system\\SysMailMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysMailMapper.insertSysMail-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_mail          ( status,                          create_time )           values ( ?,                          ? )\r\n### Cause: java.sql.SQLException: Field \'mail_content\' doesn\'t have a default value\n; Field \'mail_content\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'mail_content\' doesn\'t have a default value','2024-01-21 18:55:10',4),(209,'站内信',1,'com.ruoyi.web.controller.system.SysMailController.add()','POST',1,'admin',NULL,'/system/mail','127.0.0.1','内网IP','{\"createTime\":\"2024-01-21 18:55:38\",\"params\":{},\"status\":\"0\"}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'mail_content\' doesn\'t have a default value\r\n### The error may exist in file [D:\\projcet\\RuoYi-Vue\\ruoyi-system\\target\\classes\\mapper\\system\\SysMailMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysMailMapper.insertSysMail-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_mail          ( status,                          create_time )           values ( ?,                          ? )\r\n### Cause: java.sql.SQLException: Field \'mail_content\' doesn\'t have a default value\n; Field \'mail_content\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'mail_content\' doesn\'t have a default value','2024-01-21 18:55:39',19),(210,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin',NULL,'/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2024-01-02 21:22:09\",\"icon\":\"system\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1,\"menuName\":\"系统管理\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"system\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-21 18:57:18',61),(211,'站内信',1,'com.ruoyi.web.controller.system.SysMailController.add()','POST',1,'admin',NULL,'/system/mail','127.0.0.1','内网IP','{\"createTime\":\"2024-01-21 18:58:58\",\"params\":{},\"status\":\"0\"}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'mail_content\' doesn\'t have a default value\r\n### The error may exist in file [D:\\projcet\\RuoYi-Vue\\ruoyi-system\\target\\classes\\mapper\\system\\SysMailMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysMailMapper.insertSysMail-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_mail          ( status,                          create_time )           values ( ?,                          ? )\r\n### Cause: java.sql.SQLException: Field \'mail_content\' doesn\'t have a default value\n; Field \'mail_content\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'mail_content\' doesn\'t have a default value','2024-01-21 18:58:58',4),(212,'站内信',1,'com.ruoyi.web.controller.system.SysMailController.add()','POST',1,'admin',NULL,'/system/mail','127.0.0.1','内网IP','{\"createTime\":\"2024-01-21 19:00:05\",\"params\":{},\"status\":\"0\"}',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'mail_content\' doesn\'t have a default value\r\n### The error may exist in file [D:\\projcet\\RuoYi-Vue\\ruoyi-system\\target\\classes\\mapper\\system\\SysMailMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysMailMapper.insertSysMail-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_mail          ( status,                          create_time )           values ( ?,                          ? )\r\n### Cause: java.sql.SQLException: Field \'mail_content\' doesn\'t have a default value\n; Field \'mail_content\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'mail_content\' doesn\'t have a default value','2024-01-21 19:00:05',6),(213,'站内信',1,'com.ruoyi.web.controller.system.SysMailController.add()','POST',1,'admin',NULL,'/system/mail','127.0.0.1','内网IP','{\"createTime\":\"2024-01-21 19:02:19\",\"mailContent\":\"<strong>阿斯蒂芬阿斯蒂芬阿萨德发顺丰</strong><strong>阿斯顿发12</strong>\",\"mailId\":1,\"mailTitle\":\"测试\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-21 19:02:19',70),(214,'通知公告',2,'com.ruoyi.web.controller.system.SysNoticeController.edit()','PUT',1,'admin',NULL,'/system/notice','127.0.0.1','内网IP','{\"createBy\":\"admin\",\"createTime\":\"2024-01-02 21:22:13\",\"noticeContent\":\"<p><strong>新版本内容</strong></p>\",\"noticeId\":1,\"noticeTitle\":\"温馨提醒：2018-07-01 若依新版本发布啦\",\"noticeType\":\"2\",\"params\":{},\"remark\":\"管理员\",\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-21 19:09:54',32),(215,'角色管理',2,'com.ruoyi.web.controller.system.SysRoleController.edit()','PUT',1,'admin',NULL,'/system/role','127.0.0.1','内网IP','{\"admin\":false,\"createTime\":\"2024-01-02 21:22:09\",\"dataScope\":\"4\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,103,1016,1017,1018,1019,107,1035,1036,1037,1038],\"params\":{},\"remark\":\"OK平台管理员\",\"roleId\":2,\"roleKey\":\"okpayadmin\",\"roleName\":\"OK平台管理员\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-21 19:11:25',3491),(216,'代码生成',3,'com.ruoyi.generator.controller.GenController.remove()','DELETE',1,'admin',NULL,'/tool/gen/12,11','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-21 19:12:34',137),(217,'代码生成',6,'com.ruoyi.generator.controller.GenController.importTableSave()','POST',1,'admin',NULL,'/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"sys_notice_user\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-21 19:14:31',124),(218,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin',NULL,'/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"sys_notice_user\"}',NULL,0,NULL,'2024-01-21 19:14:36',362),(219,'通知公告',1,'com.ruoyi.web.controller.system.SysNoticeController.add()','POST',1,'okadmin','OKPAY平台','/system/notice','127.0.0.1','内网IP','{\"createBy\":\"okadmin\",\"noticeContent\":\"<p>是的发送到</p><p>阿斯顿发a</p><p>按时a</p>\",\"noticeTitle\":\"测试\",\"noticeType\":\"1\",\"params\":{},\"status\":\"0\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-21 19:19:07',2308),(220,'代码生成',3,'com.ruoyi.generator.controller.GenController.remove()','DELETE',1,'admin',NULL,'/tool/gen/8','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-22 09:34:36',13),(221,'代码生成',6,'com.ruoyi.generator.controller.GenController.importTableSave()','POST',1,'admin',NULL,'/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"sys_transaction_record\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-22 09:34:49',42),(222,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin',NULL,'/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"transactionRecord\",\"className\":\"SysTransactionRecord\",\"columns\":[{\"capJavaField\":\"RecordId\",\"columnComment\":\"记录ID\",\"columnId\":128,\"columnName\":\"record_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-01-22 09:34:49\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"recordId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":14,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"交易用户ID\",\"columnId\":129,\"columnName\":\"user_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-01-22 09:34:49\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":14,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"RecordTime\",\"columnComment\":\"交易时间\",\"columnId\":130,\"columnName\":\"record_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-01-22 09:34:49\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"recordTime\",\"javaType\":\"Date\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":14,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"RecordType\",\"columnComment\":\"交易类型（0买币 1卖币 2商家直充 3代理充值 4充值到商户(提现) 5手续费）\",\"columnId\":131,\"columnName\":\"record_type\",\"columnType\":\"char(1)\",\"createBy\":\"admin\",\"createTime\":\"2024-01-22 09:34:49\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrem','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-22 09:35:02',28),(223,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin',NULL,'/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"sys_transaction_record\"}',NULL,0,NULL,'2024-01-22 09:35:08',885),(224,'代码生成',3,'com.ruoyi.generator.controller.GenController.remove()','DELETE',1,'admin',NULL,'/tool/gen/4','127.0.0.1','内网IP','{}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-22 13:30:53',62),(225,'代码生成',6,'com.ruoyi.generator.controller.GenController.importTableSave()','POST',1,'admin',NULL,'/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"sys_sale_coin\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-22 13:31:03',160),(226,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin',NULL,'/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"saleCoin\",\"className\":\"SysSaleCoin\",\"columns\":[{\"capJavaField\":\"SaleId\",\"columnComment\":\"卖币ID\",\"columnId\":142,\"columnName\":\"sale_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-01-22 13:31:02\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"saleId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":15,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"SaleNo\",\"columnComment\":\"卖币No\",\"columnId\":143,\"columnName\":\"sale_no\",\"columnType\":\"varchar(3000)\",\"createBy\":\"admin\",\"createTime\":\"2024-01-22 13:31:02\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"textarea\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"saleNo\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":15,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"SaleTime\",\"columnComment\":\"卖币时间\",\"columnId\":144,\"columnName\":\"sale_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-01-22 13:31:02\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"saleTime\",\"javaType\":\"Date\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":15,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"SaleUserId\",\"columnComment\":\"卖币用户ID\",\"columnId\":145,\"columnName\":\"sale_user_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2024-01-22 13:31:02\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuer','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2024-01-22 13:31:10',114),(227,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin',NULL,'/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"sys_sale_coin\"}',NULL,0,NULL,'2024-01-22 13:47:18',2386);
/*!40000 ALTER TABLE `sys_oper_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_post`
--

DROP TABLE IF EXISTS `sys_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_post` (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='岗位信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_post`
--

LOCK TABLES `sys_post` WRITE;
/*!40000 ALTER TABLE `sys_post` DISABLE KEYS */;
INSERT INTO `sys_post` VALUES (1,'ceo','董事长',1,'0','admin','2024-01-02 21:22:09','',NULL,''),(2,'se','项目经理',2,'0','admin','2024-01-02 21:22:09','',NULL,''),(3,'hr','人力资源',3,'0','admin','2024-01-02 21:22:09','',NULL,''),(4,'user','普通员工',4,'0','admin','2024-01-02 21:22:09','',NULL,'');
/*!40000 ALTER TABLE `sys_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_recharge`
--

DROP TABLE IF EXISTS `sys_recharge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_recharge` (
  `recharge_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '充值ID',
  `from_user_id` bigint(20) NOT NULL COMMENT '充值用户ID',
  `to_user_id` bigint(20) NOT NULL COMMENT '被充值用户ID',
  `recharge_amount` float(10,2) DEFAULT '0.00' COMMENT '充值金额',
  `recharge_time` datetime DEFAULT NULL COMMENT '充值时间',
  `recharge_type` varchar(50) DEFAULT '' COMMENT '充值方式（0支付宝 1微信 2银联）',
  `status` char(1) DEFAULT '0' COMMENT '充值状态（0进行中 1已确认(充值完成) 9已取消）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`recharge_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='充值表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_recharge`
--

LOCK TABLES `sys_recharge` WRITE;
/*!40000 ALTER TABLE `sys_recharge` DISABLE KEYS */;
INSERT INTO `sys_recharge` VALUES (2,11,7,1.10,'2024-01-20 11:50:05','','1','','2024-01-20 11:50:05','kehu1','2024-01-20 11:51:09',NULL);
/*!40000 ALTER TABLE `sys_recharge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) DEFAULT '1' COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) DEFAULT '1' COMMENT '部门树选择项是否关联显示',
  `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='角色信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES (1,'超级管理员','admin',1,'1',1,1,'0','0','admin','2024-01-02 21:22:09','',NULL,'超级管理员'),(2,'OK平台管理员','okpayadmin',2,'4',1,1,'0','0','admin','2024-01-02 21:22:09','admin','2024-01-21 19:11:22','OK平台管理员'),(3,'商户','merchant',3,'4',1,1,'0','0','admin','2024-01-02 22:53:21','admin','2024-01-03 00:06:38',NULL),(4,'代理','agent',4,'1',1,1,'0','0','admin','2024-01-02 22:53:36','','2024-01-04 22:45:05',NULL),(5,'客户','customer',5,'1',1,1,'0','0','admin','2024-01-04 22:44:34','','2024-01-04 22:44:59',NULL);
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_dept`
--

DROP TABLE IF EXISTS `sys_role_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='角色和部门关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_dept`
--

LOCK TABLES `sys_role_dept` WRITE;
/*!40000 ALTER TABLE `sys_role_dept` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_role_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_menu`
--

DROP TABLE IF EXISTS `sys_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='角色和菜单关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_menu`
--

LOCK TABLES `sys_role_menu` WRITE;
/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;
INSERT INTO `sys_role_menu` VALUES (2,1),(2,100),(2,103),(2,107),(2,1000),(2,1001),(2,1002),(2,1003),(2,1004),(2,1005),(2,1006),(2,1016),(2,1017),(2,1018),(2,1019),(2,1035),(2,1036),(2,1037),(2,1038),(3,1),(3,100),(3,1000),(3,1001),(3,1002),(3,1003),(3,1004),(3,1005),(3,1006);
/*!40000 ALTER TABLE `sys_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_sale_coin`
--

DROP TABLE IF EXISTS `sys_sale_coin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_sale_coin` (
  `sale_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '卖币ID',
  `sale_no` varchar(3000) DEFAULT NULL COMMENT '卖币No',
  `sale_time` datetime DEFAULT NULL COMMENT '卖币时间',
  `sale_user_id` bigint(20) NOT NULL COMMENT '卖币用户ID',
  `sale_split_type` char(1) DEFAULT '0' COMMENT '卖币拆分类型（0不拆分 1拆分）',
  `support_buy_type` varchar(50) DEFAULT '' COMMENT '支持支付类型',
  `sale_amount` float(10,2) DEFAULT '0.00' COMMENT '卖币金额',
  `sale_amount_without_commission` float(10,2) DEFAULT '0.00' COMMENT '扣除手续费可交易金额',
  `commission_amount` float(10,2) DEFAULT '0.00' COMMENT '手续费',
  `remain_amount` float(10,2) DEFAULT '0.00' COMMENT '订单剩余金额',
  `status` char(1) DEFAULT '0' COMMENT '卖币状态（0生成订单 1交易中 2已完成 9已取消）',
  `urgent_sale_flg` char(1) DEFAULT '0' COMMENT '加急状态（0否 1是）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`sale_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='卖币表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_sale_coin`
--

LOCK TABLES `sys_sale_coin` WRITE;
/*!40000 ALTER TABLE `sys_sale_coin` DISABLE KEYS */;
INSERT INTO `sys_sale_coin` VALUES (3,'OK20240113233714961','2024-01-13 23:37:14',11,'0','0,2',10.10,0.00,0.00,0.00,'1','1','kehu1','2024-01-13 23:37:14','kehu1','2024-01-17 20:34:44',NULL),(4,'OK20240113233826314','2024-01-13 23:38:26',11,'0','1,2',10.10,0.00,0.00,0.00,'2','1','kehu1','2024-01-13 23:38:26','','2024-01-19 20:22:46',NULL);
/*!40000 ALTER TABLE `sys_sale_coin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_transaction_record`
--

DROP TABLE IF EXISTS `sys_transaction_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_transaction_record` (
  `record_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `user_id` bigint(20) NOT NULL COMMENT '交易用户ID',
  `record_time` datetime DEFAULT NULL COMMENT '交易时间',
  `record_type` char(1) DEFAULT '0' COMMENT '交易类型（0买币 1卖币 2商家直充 3代理充值 4充值到商户(提现) 5手续费）',
  `buy_id` bigint(20) DEFAULT NULL COMMENT '买币ID',
  `sale_id` bigint(20) DEFAULT NULL COMMENT '卖币ID',
  `recharge_id` bigint(20) DEFAULT NULL COMMENT '充值ID',
  `record_amount` float(10,2) DEFAULT '0.00' COMMENT '交易金额',
  `status` char(1) DEFAULT '0' COMMENT '记录状态（0正常 1取消 9临时创建）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`record_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='交易记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_transaction_record`
--

LOCK TABLES `sys_transaction_record` WRITE;
/*!40000 ALTER TABLE `sys_transaction_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_transaction_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户,01平台管理员,02商户,03代理,04客户）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) DEFAULT '' COMMENT '密码',
  `pay_password` varchar(100) DEFAULT NULL COMMENT '支付密码',
  `real_name` varchar(3) DEFAULT NULL COMMENT '真实姓名',
  `idcard_no` varchar(18) DEFAULT NULL COMMENT '身份证号码',
  `idcard_front_img` varchar(100) DEFAULT NULL COMMENT '身份证正面图片路径',
  `idcard_back_img` varchar(100) DEFAULT NULL COMMENT '身份证反面图片路径',
  `face_img` varchar(100) DEFAULT NULL COMMENT '人脸图片路径',
  `wallet_address` varchar(20) DEFAULT NULL COMMENT '钱包地址',
  `amount` float(10,2) DEFAULT '0.00' COMMENT '余额',
  `invite_code` varchar(20) DEFAULT NULL COMMENT '邀请码',
  `wechat_pay_remark` varchar(2000) DEFAULT NULL COMMENT '微信收款填充信息',
  `wechat_pay_img` varchar(100) DEFAULT NULL COMMENT '微信收款码图片地址',
  `alipay_remark` varchar(2000) DEFAULT NULL COMMENT '支付宝收款填充信息',
  `alipay_img` varchar(100) DEFAULT NULL COMMENT '支付宝收款码图片地址',
  `unionpay_remark` varchar(2000) DEFAULT NULL COMMENT '银联填充信息',
  `unionpay_account` varchar(30) DEFAULT NULL COMMENT '银联收款户名',
  `unionpay_card` varchar(20) DEFAULT NULL COMMENT '银联收款卡号',
  `parent_user_id` bigint(20) DEFAULT '0' COMMENT '上级用户ID',
  `ungent_commission` int(3) DEFAULT '0' COMMENT '加急手续费',
  `normal_commission` int(3) DEFAULT '0' COMMENT '普通手续费',
  `create_agent_flg` char(1) DEFAULT '0' COMMENT '是否可以创建代理（0可以 1不行）',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (1,NULL,'admin','若依','00','ry@163.com','15888888888','1','/profile/avatar/2024/01/07/头像_20240107111226A001.png','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2',NULL,NULL,'351',NULL,NULL,NULL,NULL,0.00,'a12c',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,'0','0','0','127.0.0.1','2024-01-22 13:30:39','admin','2024-01-02 21:22:09','','2024-01-22 13:30:39','管理员'),(2,100,'okadmin','OK平台管理员','00','r1@qq.com','15666666666','0','/profile/avatar/2024/01/07/头像2_20240107111704A002.png','$2a$10$drG84FUnSUmIpfYgmGu4SO4JRAofckH0Tu8jrLk6iUB7us3QCTmNO',NULL,'冷笑话','350','/profile/upload/2024/01/02/身份证正面_20240102234517A001.png','/profile/upload/2024/01/02/身份证反面_20240102235056A002.png',NULL,NULL,0.00,'789c',NULL,'/profile/upload/2024/01/02/二维码1_20240102235100A003.PNG',NULL,'/profile/upload/2024/01/02/二维码2_20240102235103A004.PNG',NULL,'1231','123',0,0,0,'0','0','0','127.0.0.1','2024-01-21 20:23:12','admin','2024-01-02 21:22:09','admin','2024-01-21 20:23:11','测试员'),(3,200,'liao1','测试商户','02','','','0','','$2a$10$hcDdKFCeyLfYAB6vOVwzV.pTBfgv7HHC//RG7hgeN5fcJfW7M43WC',NULL,NULL,NULL,'/profile/upload/2024/01/03/身份证正面_20240103001027A005.png','/profile/upload/2024/01/04/身份证反面_20240104224213A001.png',NULL,'96dd63595f287715',0.00,'e7afd6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,15,5,'0','0','0','127.0.0.1','2024-01-21 10:47:11','testadmin','2024-01-03 00:10:30','admin','2024-01-21 10:47:10',NULL),(4,207,'liao2','测试商户2','02','','','0','','$2a$10$HU03gJI4V9HyUaXG83UmB.KYhPWLTucXF4wkQYTZwoicJjC8UA7py',NULL,NULL,NULL,NULL,NULL,NULL,'31dfd5da15491918',0.00,'52541b',NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,10,5,'0','0','0','127.0.0.1','2024-01-04 23:41:52','admin','2024-01-04 23:05:25','','2024-01-04 23:41:51',NULL),(7,216,'liao3','测试商户3','02','','','0','','$2a$10$toRIxcMdTCYcPwmVwBNFTe/0gjep7mSU315FdsShpJeTmWucbZtAm',NULL,NULL,NULL,NULL,NULL,NULL,'bda658a8deaeb84f',0.00,'506309',NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,10,5,'1','0','0','127.0.0.1','2024-01-21 10:47:40','admin','2024-01-04 23:20:30','','2024-01-21 10:47:39',NULL),(10,217,'agent1','代理用户1','03','','15888888880','0','','$2a$10$aGG1i82MoMh2TZggFFh/e.ho8nRbFs3O4y9z/GMJHnK8DTHpHW3Hm','$2a$10$UMHjQIZ9kGS/ZDESAO1DXuLR886dKJ6iK11X2I7vKhSQavvAvpwxa','李敖','465798','/profile/upload/2024/01/06/image_20240106002359A001.jpeg','/profile/upload/2024/01/06/image_20240106002359A002.jpeg',NULL,'f81b23c69b951622',500.00,'834d02',NULL,'/profile/upload/2024/01/06/image_20240106204519A001.jpeg',NULL,NULL,NULL,NULL,NULL,7,0,0,'0','0','0','127.0.0.1','2024-01-19 22:33:45','','2024-01-06 00:23:59','','2024-01-19 22:33:45',NULL),(11,218,'kehu1','测试客户new1','04','','15888888881','0','/profile/upload/2024/01/21/image_20240121170818A001.jpeg','$2a$10$eCHngkkX93fWTLmH4iX0cu/WA.RiuQokpXft7ypl7NJ/KknX4KJey','$2a$10$uZN0un1.OehgLTfm5y1AMuJhNNMPJ6YCNrd8dG1mEqpgaLs9DT.DO','客','12312312','/profile/upload/2024/01/13/image_20240113231017A001.jpeg','/profile/upload/2024/01/13/image_20240113231017A002.jpeg',NULL,'640a5d739e2e3fd0',100.00,'0e9ace','微信支付补充信息','/profile/upload/2024/01/21/image_20240121165650A001.jpeg',NULL,NULL,NULL,NULL,NULL,10,0,0,'0','0','0','127.0.0.1','2024-01-21 15:46:49','','2024-01-13 23:10:17','','2024-01-21 17:08:18','hello'),(12,219,'liao4','测试商户4','02','','','0','','$2a$10$wkffx1ddD7D3FXPh9FKTJeao8Zzzqbt0u9wmiEyze8v8nNKWmdr4S',NULL,NULL,NULL,NULL,NULL,NULL,'21648c3fabab84c3',0.00,'750e5f',NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,10,5,'0','0','0','',NULL,'okadmin','2024-01-19 22:53:21','',NULL,NULL),(13,220,'agent2','测试代理2','03','','15888888882','0','','$2a$10$SGV242RHmdUlb15eH4xBp.HxGQoy2CRHqsMaMPrOMVuN1oWvlG.Wy','$2a$10$2TnEyCbt/0u79ec4t91KuuAmY/u0tVCUzo7QeUMQ.b29qvRkF6IdO','客','123123121','/profile/upload/2024/01/19/image_20240119225435A001.jpeg','/profile/upload/2024/01/19/image_20240119225435A002.jpeg',NULL,'392a0c09a2d5cbbf',0.00,'9b9e1c',NULL,NULL,NULL,NULL,NULL,NULL,NULL,12,0,0,'0','0','0','',NULL,'','2024-01-19 22:54:35','okadmin','2024-01-19 22:55:49',NULL),(14,221,'kehu2','测试客户2','04','','15888888883','0','','$2a$10$JzhQ5X2k9YpDofOx0PdZ/enIJexzZ8DBLL9ngT5ulbm2rPP2MO29u','$2a$10$gWqK.tYlf42quKXwTjabkunaL9nUYxx.XYA0WnsJiiYqS0SXFZA7y','客2','1231231211','/profile/upload/2024/01/19/image_20240119225611A003.jpeg','/profile/upload/2024/01/19/image_20240119225611A004.jpeg',NULL,'609c28593886f5a4',0.00,'7df77f',NULL,NULL,NULL,NULL,NULL,NULL,NULL,13,0,0,'0','0','0','127.0.0.1','2024-01-20 10:23:18','','2024-01-19 22:56:12','','2024-01-20 10:23:17',NULL);
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_post`
--

DROP TABLE IF EXISTS `sys_user_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user_post` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户与岗位关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_post`
--

LOCK TABLES `sys_user_post` WRITE;
/*!40000 ALTER TABLE `sys_user_post` DISABLE KEYS */;
INSERT INTO `sys_user_post` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `sys_user_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_role`
--

DROP TABLE IF EXISTS `sys_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user_role` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户和角色关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_role`
--

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
INSERT INTO `sys_user_role` VALUES (1,1),(2,2),(3,3),(4,3),(7,3),(10,4),(12,3),(13,4),(14,5);
/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-22 15:44:19
