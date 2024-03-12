DROP TABLE IF EXISTS `sys_buy_coin`;
CREATE TABLE `sys_buy_coin` (
  `buy_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '买币ID',
  `sale_id` bigint(20) NOT NULL COMMENT '卖币ID',
  `sale_user_id` bigint(20) NOT NULL COMMENT '卖币用户ID',
  `buy_user_id` bigint(20) NOT NULL COMMENT '买币用户ID',
  `buy_time` datetime DEFAULT NULL COMMENT '买币时间',
  `buy_type` varchar(50) DEFAULT '' COMMENT '支付方式（0支付宝 1微信 2银联）',
  `buy_amount` float(10,2) DEFAULT '0.00' COMMENT '买币金额',
  `buy_voucher` varchar(100) DEFAULT NULL COMMENT '支付凭证',
  `status` char(1) DEFAULT '0' COMMENT '买币状态（0进行中 1买家已付款 2卖家已确认(买币完成) 3卖家已确认 9已取消）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`buy_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='买币表';

DROP TABLE IF EXISTS `sys_recharge`;
CREATE TABLE `sys_recharge` (
  `recharge_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '充值ID',
  `from_user_id` bigint(20) NOT NULL COMMENT '充值用户ID',
  `to_user_id` bigint(20) NOT NULL COMMENT '被充值用户ID',
  `recharge_amount` float(10,2) DEFAULT '0.00' COMMENT '充值金额',
  `recharge_time` datetime DEFAULT NULL COMMENT '充值时间',
  `recharge_type` varchar(50) DEFAULT '' COMMENT '充值方式（0支付宝 1微信 2银联 3余额）',
  `recharge_from_user_remian_amount` float(10,2) DEFAULT '0.00' COMMENT '充值用户充值后余额',
  `recharge_to_user_remian_amount` float(10,2) DEFAULT '0.00' COMMENT '被充值用户充值后余额',
  `status` char(1) DEFAULT '0' COMMENT '充值状态（0进行中 1已确认(充值完成) 9已取消）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`recharge_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='充值表';

DROP TABLE IF EXISTS `sys_sale_coin`;
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
  `split_min_rate` int(3) DEFAULT '0' COMMENT '拆分购买最小金额比例',
  `split_max_rate` int(3) DEFAULT '0' COMMENT '拆分购买最大金额比例',
  `single_buy_max_amount` float(10,2) DEFAULT '0.00' COMMENT '单次购买上限金额',
  `status` char(1) DEFAULT '0' COMMENT '卖币状态（0生成订单 1交易中 2已完成 9已取消）',
  `urgent_sale_flg` char(1) DEFAULT '0' COMMENT '加急状态（0否 1是）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`sale_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='卖币表';

DROP TABLE IF EXISTS `sys_transaction_record`;
CREATE TABLE `sys_transaction_record` (
  `record_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `user_id` bigint(20) NOT NULL COMMENT '交易用户ID',
  `record_time` datetime DEFAULT NULL COMMENT '交易时间',
  `record_type` char(2) DEFAULT '0' COMMENT '交易类型（0买币 1卖币 2商家直充 3充值From方 4充值到商户(提现) 5卖币手续费 6充值To方 7卖币退款 8充值手续费）',
  `buy_id` bigint(20) DEFAULT NULL COMMENT '买币ID',
  `sale_id` bigint(20) DEFAULT NULL COMMENT '卖币ID',
  `recharge_id` bigint(20) DEFAULT NULL COMMENT '充值ID',
  `record_amount` float(10,2) DEFAULT '0.00' COMMENT '交易金额',
  `user_remain_amount` float(10,2) DEFAULT '0.00' COMMENT '交易后余额',
  `status` char(1) DEFAULT '0' COMMENT '记录状态（0正常 1取消 9临时创建）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`record_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='交易记录表';