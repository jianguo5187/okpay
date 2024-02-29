CREATE TABLE `sys_user_pay_type_approve` (

  `pay_type_approve_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '承认ID',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `pay_type` varchar(30) DEFAULT NULL COMMENT '支付方式（0支付宝,1微信）',
  `pay_remark` varchar(30) DEFAULT NULL COMMENT '支付方式填充信息',
  `pay_img` varchar(100) DEFAULT NULL COMMENT '收款码图片地址',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0未审核 1审核成功 9否认）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  `login_ip` varchar(128) DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`pay_type_approve_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户支付方式审核表'
;


INSERT INTO sys_menu
(menu_id, menu_name, parent_id, order_num, `path`, component, query, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
VALUES(1068, '支付审核', 1, 10, 'payApprove', 'system/payApprove/index', NULL, 1, 0, 'C', '0', '0', 'system:payApprove:list', 'money', 'admin', '2024-02-29 11:33:46.000', 'admin', '2024-02-29 11:40:35.000', '用户支付方式审核菜单');
INSERT INTO sys_menu
(menu_id, menu_name, parent_id, order_num, `path`, component, query, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
VALUES(1069, '支付审核查询', 1068, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:payApprove:query', '#', 'admin', '2024-02-29 11:34:15.000', '', NULL, '');
INSERT INTO okpay.sys_role_menu
(role_id, menu_id)
VALUES(2, 1068);
INSERT INTO okpay.sys_role_menu
(role_id, menu_id)
VALUES(2, 1069);
INSERT INTO okpay.sys_role_menu
(role_id, menu_id)
VALUES(3, 1068);
INSERT INTO okpay.sys_role_menu
(role_id, menu_id)
VALUES(3, 1069);


INSERT INTO sys_dict_type
(dict_id, dict_name, dict_type, status, create_by, create_time, update_by, update_time, remark)
VALUES(17, '支付方式承认状态', 'pay_type_approve', '0', 'admin', '2024-02-29 11:48:43.000', '', NULL, NULL);
INSERT INTO sys_dict_data
(dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES(51, 1, '未审核', '0', 'pay_type_approve', NULL, 'default', 'N', '0', 'admin', '2024-02-29 11:50:03.000', 'admin', '2024-02-29 11:50:57.000', '未审核');
INSERT INTO sys_dict_data
(dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES(52, 2, '承认成功', '1', 'pay_type_approve', NULL, 'default', 'N', '0', 'admin', '2024-02-29 11:50:25.000', 'admin', '2024-02-29 11:51:07.000', '承认成功');
INSERT INTO sys_dict_data
(dict_code, dict_sort, dict_label, dict_value, dict_type, css_class, list_class, is_default, status, create_by, create_time, update_by, update_time, remark)
VALUES(53, 9, '否认', '9', 'pay_type_approve', NULL, 'default', 'N', '0', 'admin', '2024-02-29 11:50:44.000', 'admin', '2024-02-29 11:51:12.000', '否认');
