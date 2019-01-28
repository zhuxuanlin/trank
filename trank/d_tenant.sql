
# ===== 以下为系统配置相关信息=====

DROP TABLE IF EXISTS `sr_appliction`;
CREATE TABLE `sr_appliction` (
  `app_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '应用ID',
  `app_name` varchar(60) DEFAULT NULL COMMENT '应用名称',
  `app_code` varchar(50) DEFAULT NULL COMMENT '应用编码',
  `url` varchar(200) DEFAULT NULL COMMENT '应用URL',
  `description` varchar(255) DEFAULT NULL COMMENT '应用描述',
  `icon` varchar(100) DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) DEFAULT '0' COMMENT '排序',
  `is_public` tinyint(4) DEFAULT '0' COMMENT '是否为开放应用 0=不对外开放 1=对外开',
  `type` tinyint(4) DEFAULT '0' COMMENT '应用类型 0=平台应用 1=企业应用',
  `status` tinyint(4) DEFAULT '0' COMMENT '应用状态 0=停用 1=启用',
  PRIMARY KEY (`app_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='应用表';



DROP TABLE IF EXISTS `sr_menu`;
CREATE TABLE `sr_menu` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `app_id` int(11) NOT NULL COMMENT '应用ID',
  `parent_id` int(64) NOT NULL COMMENT '父级编号',
  `menu_type` int(11) NOT NULL COMMENT '菜单类型   0：目录   1：菜单   2：按钮',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `sort` int(11) NOT NULL COMMENT '排序',
  `url` varchar(255) DEFAULT NULL COMMENT '链接',
  `target` varchar(20) DEFAULT NULL COMMENT '目标',
  `icon` varchar(100) DEFAULT NULL COMMENT '图标',
  `is_show` char(1) NOT NULL COMMENT '是否在菜单中显示 0-不展示 1-展示 ',
  `permission` varchar(200) DEFAULT NULL COMMENT '权限标识',
  `status` int(11) DEFAULT NULL COMMENT '0-未启用  1-已启用 3-已删除',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `create_user` varchar(20) NOT NULL DEFAULT '' COMMENT '创建者',
  `update_user` varchar(20) DEFAULT NULL COMMENT '更新人',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`menu_id`),
  KEY `idx_parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='菜单表';


DROP TABLE IF EXISTS `sr_area`;
CREATE TABLE `sr_area` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `parent_id` int(11) NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(255) NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `sort` int(11) NOT NULL COMMENT '排序',
  `code` varchar(100) DEFAULT NULL COMMENT '区域编码',
  `type` char(1) DEFAULT NULL COMMENT '区域类型',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '更新状态 0=使用 1=删除',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `create_user` varchar(20) NOT NULL DEFAULT '' COMMENT '创建者',
  `update_user` varchar(20) DEFAULT NULL COMMENT '更新人',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`),
  KEY `idx_parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='区域表';


DROP TABLE IF EXISTS `sr_dict`;
CREATE TABLE `sr_dict` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `value` varchar(100) NOT NULL COMMENT '数据值',
  `label` varchar(100) NOT NULL COMMENT '标签名',
  `type` varchar(100) NOT NULL COMMENT '类型',
  `description` varchar(100) NOT NULL COMMENT '描述',
  `sort` int(11) NOT NULL COMMENT '排序（升序）',
  `parent_id` varchar(64) DEFAULT '0' COMMENT '父级编号',
  `status` int(4) NOT NULL DEFAULT '1' COMMENT '更新状态 0=使用 1=删除',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `create_user` varchar(20) NOT NULL DEFAULT '' COMMENT '创建者',
  `update_user` varchar(20) DEFAULT NULL COMMENT '更新人',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='字典表';


DROP TABLE IF EXISTS `sr_log`;
CREATE TABLE `sr_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `type` char(1) DEFAULT '1' COMMENT '日志类型',
  `title` varchar(80) DEFAULT '' COMMENT '日志标题',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `remote_addr` varchar(80) DEFAULT NULL COMMENT '操作IP地址',
  `user_agent` varchar(20) DEFAULT NULL COMMENT '用户代理',
  `request_uri` varchar(125) DEFAULT NULL COMMENT '请求URI',
  `method` varchar(5) DEFAULT NULL COMMENT '操作方式',
  `params` text COMMENT '操作提交的数据',
  `exception` text COMMENT '异常信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='日志表';


#=== 以下为租户相关基础信息==========

DROP TABLE IF EXISTS `sr_tenant`;
CREATE TABLE `sr_tenant` (
  `tenant_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '租户ID',
  `owner_id` int(11) NOT NULL DEFAULT '0' COMMENT '租户管理员，统一认证用户ID',
  `tenant_name` varchar(50) NOT NULL DEFAULT '' COMMENT '租户名称',
  `organization_code` varchar(20) NOT NULL DEFAULT '' COMMENT '组织机构代码',
  `city` varchar(20) NOT NULL DEFAULT '' COMMENT '所在城市',
  `address` varchar(80) NOT NULL DEFAULT '' COMMENT '地址',
  `contacts_name` varchar(10) NOT NULL DEFAULT '' COMMENT '联系人姓名',
  `contacts_phone` varchar(11) NOT NULL DEFAULT '' COMMENT '联系人电话',
  `status` int(11) NOT NULL COMMENT '状态（0=待审核 1=使用中 2=停用）',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `create_user` varchar(10) NOT NULL DEFAULT '' COMMENT '创建人',
  `update_user` varchar(10) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`tenant_id`),
  KEY `idx_owner_id` (`owner_id`),
  KEY `idx_tenant_name` (`tenant_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='租户基础信息表';


DROP TABLE IF EXISTS `sr_company`;
CREATE TABLE `sr_company` (
  `company_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '编号',
  `tenant_id` int(11) unsigned NOT NULL COMMENT '租户id',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '父级编号',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `sort` int(11) NOT NULL COMMENT '排序',
  `city_id` varchar(64) NOT NULL COMMENT '城市id',
  `city_name` varchar(64) NOT NULL COMMENT '城市名称',
  `city_code` varchar(100) DEFAULT NULL COMMENT '城市编码',
  `type` int(4) NOT NULL DEFAULT '0' COMMENT '机构类型 1-总公司  2-部门  3-小组 4-其他',
  `address` varchar(255) DEFAULT NULL COMMENT '联系地址',
  `zip_code` varchar(100) DEFAULT NULL COMMENT '邮政编码',
  `master` varchar(100) DEFAULT NULL COMMENT '负责人',
  `status` int(11) DEFAULT NULL COMMENT '0-未启用  1-已启用 3-已删除',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `create_user` varchar(20) NOT NULL DEFAULT '' COMMENT '创建者',
  `update_user` varchar(20) DEFAULT NULL COMMENT '更新人',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`company_id`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='租户-组织机构表';


DROP TABLE IF EXISTS `sr_employee`;
CREATE TABLE `sr_employee` (
  `employee_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '员工ID',
  `tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '租户ID',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID 统一认证用户ID',
  `company_id` int(11) NOT NULL DEFAULT '0' COMMENT '公司ID',
  `dept_id` int(11) NOT NULL DEFAULT '0' COMMENT '部门ID',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '职位名称',
  `employee_no` varchar(50) NOT NULL DEFAULT '' COMMENT '员工编号',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '员工姓名',
  `mobile` varchar(11) NOT NULL DEFAULT '' COMMENT '手机号码',
  `identity_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '证件类型 0=省份证 1=港澳通行证 2=台胞证',
  `identity_id` varchar(20) NOT NULL DEFAULT '' COMMENT '身份证号',
  `email` varchar(80) NOT NULL DEFAULT '' COMMENT '员工邮箱',
  `hiredate` date DEFAULT NULL COMMENT '员工入职日期',
  `leavedate` date DEFAULT NULL COMMENT '离职日期',
  `photo` varchar(100) NOT NULL DEFAULT '' COMMENT '员工头像',
  `remarks` varchar(100) NOT NULL DEFAULT '' COMMENT '备注信息',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态 0=不允许登录 1=允许登录',
  `login_ip` varchar(20) NOT NULL DEFAULT '' COMMENT '最后登录IP',
  `login_time` datetime NOT NULL COMMENT '最后登录时间',
  `create_user` varchar(20) NOT NULL DEFAULT '' COMMENT '创建者',
  `update_user` varchar(20) DEFAULT NULL COMMENT '更新人',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`employee_id`),
  KEY `idx_tenant_id` (`tenant_id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_company_id` (`company_id`),
  KEY `idx_mobile` (`mobile`),
  KEY `idx_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COMMENT='员工基本信息表';


DROP TABLE IF EXISTS `sr_driver`;
CREATE TABLE `sr_driver` (
  `driver_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '司机ID',
  `tenant_id` int(11) unsigned NOT NULL COMMENT '租户id',
  `company_id` int(11) unsigned DEFAULT NULL COMMENT '公司ID',
  `employee_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '职员ID，对应租户员工ID',
  `user_id` int(11) DEFAULT '0' COMMENT '统一中心用户Id',
  `driver_state` tinyint(2) unsigned DEFAULT NULL COMMENT '司机状态，0=下线,1=上线',
  `driver_type` int(11) unsigned DEFAULT '0' COMMENT '司机类型 0=聘用 1=挂靠 2=借调',
  `driver_name` varchar(20) DEFAULT NULL COMMENT '司机姓名',
  `identity_card` varchar(25) DEFAULT NULL COMMENT '身份证号',
  `registered_place` varchar(255) DEFAULT NULL COMMENT '户口所在地',
  `address` varchar(256) DEFAULT '' COMMENT '家庭住址',
  `driving_license_no` varchar(20) DEFAULT NULL COMMENT '驾驶证号',
  `approved_driving_model` varchar(255) DEFAULT NULL COMMENT '准驾车型',
  `driving_license_date` date DEFAULT NULL COMMENT '初次领证日期',
  `driving_license_expiry_time` date DEFAULT NULL COMMENT '驾驶证到期时间',
  `delete_flag` tinyint(2) unsigned DEFAULT '1' COMMENT '删除状态： 0-已删除 1未删除',
  `contract_signing_date` date DEFAULT NULL COMMENT '合同签订日期',
  `contract_expiry_date` date DEFAULT NULL COMMENT '合同截止日期',
  `mobile` varchar(15) DEFAULT NULL COMMENT '手机号',
  `driving_license` varchar(1000) DEFAULT NULL COMMENT '驾驶证照片',
  `certificate` varchar(1000) DEFAULT NULL COMMENT '无犯罪记录证明(照片)',
  `good_review` int(11) unsigned DEFAULT '0' COMMENT '好评数',
  `bad_review` int(11) unsigned DEFAULT '0' COMMENT '差评数',
  `remark` varchar(300) DEFAULT NULL COMMENT '备注',
  `create_user` varchar(20) NOT NULL DEFAULT '' COMMENT '创建者',
  `update_user` varchar(20) DEFAULT NULL COMMENT '更新人',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`driver_id`),
  KEY `idx_tenant_id` (`tenant_id`),
  KEY `idx_company_id` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=292 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='司机基础信息';


DROP TABLE IF EXISTS `sr_customer`;
CREATE TABLE `sr_customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `tenant_id` int(11) unsigned DEFAULT NULL COMMENT '租户id',
  `company_id` int(11) DEFAULT NULL COMMENT '公司ID',
  `source` tinyint(4) unsigned DEFAULT '1' COMMENT '来源： 0-线下 1-线上',
  `customer_type` varchar(32) DEFAULT '' COMMENT '客户类型',
  `banner_id` int(11) DEFAULT NULL COMMENT '在线用户ID',
  `customer_source` tinyint(4) NOT NULL DEFAULT '1' COMMENT '客户来源, 0=业务员,1=自己注册',
  `name` varchar(60) DEFAULT '' COMMENT '客户名',
  `linkman` varchar(20) DEFAULT '' COMMENT '联系人',
  `salesman` varchar(20) DEFAULT '' COMMENT '业务员',
  `mobile` varchar(15) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(200) DEFAULT NULL COMMENT '电子信箱',
  `state` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1可用,  0不可用',
  `sort` int(3) DEFAULT '1' COMMENT '排序',
  `grade` varchar(20) DEFAULT NULL COMMENT '用户等级',
  `invoice_title` varchar(32) DEFAULT '' COMMENT '发票抬头',
  `duty` varchar(16) DEFAULT '' COMMENT '税号',
  `remark` varchar(64) DEFAULT NULL COMMENT '备注',
  `create_name` varchar(32) DEFAULT NULL COMMENT '创建人名称',
  `update_user` varchar(20) DEFAULT NULL COMMENT '更新人',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`customer_id`),
  KEY `idx_tenant_id` (`tenant_id`),
  KEY `idx_company_id` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='租户-客户信息表';


DROP TABLE IF EXISTS `sr_tenant_dict`;
CREATE TABLE `sr_tenant_dict` (
  `id` bigint(16) NOT NULL AUTO_INCREMENT,
  `tenant_id` int(32) DEFAULT '0' COMMENT '租户ID',
  `company_id` int(16) DEFAULT '0' COMMENT '公司ID ',
  `key` int(11) DEFAULT '0' COMMENT '字典类型 1-提车还车',
  `desc` varchar(50) DEFAULT NULL COMMENT '说明',
  `info` varchar(1000) CHARACTER SET utf8 DEFAULT NULL COMMENT '配置项详情',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_tenant_company_key` (`tenant_id`,`company_id`,`key`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='租户-配置表';

DROP TABLE IF EXISTS `sr_station`;
CREATE TABLE `sr_station` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '场站ID',
  `tenant_id` int(32) DEFAULT '0' COMMENT '租户ID',
  `company_id` int(16) DEFAULT '0' COMMENT '公司ID ',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '场站名称',
  `map_info` varchar(200) DEFAULT '' COMMENT '地图坐标',
  PRIMARY KEY (`id`),
  KEY `idx_tenant_id` (`tenant_id`),
  KEY `idx_company_id` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='租户-配置表';

DROP TABLE IF EXISTS `sr_vechile`;
CREATE TABLE `sr_vechile` (
  `vechile_id` int(11) unsigned NOT NULL COMMENT '车辆ID',
  `tenant_id` int(11) unsigned NOT NULL COMMENT '租户id',
  `company_id` int(11) unsigned DEFAULT NULL COMMENT '公司ID',
  `models_id` int(11) unsigned DEFAULT '0' COMMENT '车辆模型id',
  `seniority` tinyint(4) unsigned NOT NULL DEFAULT '1' COMMENT '车辆资历 0周边 1城际 2省际',
  `plate_no` varchar(45) NOT NULL DEFAULT '' COMMENT '车牌号',
  `energy_type` tinyint(4) DEFAULT '0' COMMENT '耗能方式,0电,1油,2油电混合',
  `seats` tinyint(4) DEFAULT '0' COMMENT '座位数',
  `vehicle_colors` varchar(16) DEFAULT NULL COMMENT '车辆颜色',
  `brand` varchar(64) NOT NULL DEFAULT '' COMMENT '品牌',
  `model` varchar(64) NOT NULL DEFAULT '' COMMENT '品牌型号',
  `place_id` int(11) unsigned DEFAULT '0' COMMENT '场站ID',
  `place` varchar(100) DEFAULT '' COMMENT '场站名称',
  `vehicle_type` tinyint(4) unsigned DEFAULT '0' COMMENT '车辆类型 1=大型普通客车 2=中型普通客车,3=小型普通客车,4=运输车',
  `asset_type` tinyint(4) unsigned DEFAULT '0' COMMENT '资产类别: 0=载客车辆,1=运输车辆 ',
  `bus_state` tinyint(4) unsigned DEFAULT '0' COMMENT '车辆状态:0=废弃,1=闲置,2=营运,3=工作中,4=报修,5=维修,6=',
  `use_character` varchar(64) NOT NULL DEFAULT '' COMMENT '使用性质 0=运营,1=非运营',
  `driving_license` varchar(100) DEFAULT NULL COMMENT '行驶证',
  `license_regist_date` date DEFAULT NULL COMMENT '行驶证注册日期',
  `license_issue_date` date DEFAULT NULL COMMENT '行驶证发证日期',
  `license_effective_date` date DEFAULT NULL COMMENT '行驶证有效止日',
  `operating_license` varchar(255) DEFAULT NULL COMMENT '营运许可证',
  `ope_license_init_date` date DEFAULT NULL COMMENT '营运许可证初领日期',
  `ope_license_end_date` date DEFAULT NULL COMMENT '营运许可证到期日期',
  `remark` varchar(300) DEFAULT NULL COMMENT '备注',
  `power` varchar(16) NOT NULL DEFAULT '' COMMENT '排量功率 单位：KW',
  `total_mass` varchar(16) NOT NULL DEFAULT '' COMMENT '总质量 单位：KG',
  `curb_weight` varchar(16) NOT NULL DEFAULT '' COMMENT '整备质量(汽车的自重) 单位：KG',
  `outer_size` varchar(32) DEFAULT NULL COMMENT '车身外轮廓尺寸',
  `create_user` varchar(20) NOT NULL DEFAULT '' COMMENT '创建者',
  `update_user` varchar(20) DEFAULT NULL COMMENT '更新人',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `del_flag` int(11) DEFAULT '1' COMMENT '删除状态 0-已删除 1-未删除',
  PRIMARY KEY (`vechile_id`),
  KEY `idx_tenant_id` (`tenant_id`),
  KEY `idx_place_id` (`place_id`),
  KEY `idx_plate_no` (`plate_no`),
  KEY `idx_company_id` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='车辆信息表';


DROP TABLE IF EXISTS `sr_vechile_device`;
CREATE TABLE `sr_vechile_device` (
  `device_id` int(11) unsigned NOT NULL COMMENT '设备ID',
  `tenant_id` int(11) unsigned NOT NULL COMMENT '租户id',
  `company_id` int(11) unsigned DEFAULT NULL COMMENT '公司ID',
  `vechile_id` int(11) unsigned NOT NULL COMMENT '车辆ID',
  `device_type` tinyint(4) unsigned DEFAULT '0' COMMENT '设备类型: 0=GPS,1=摄像头 ',
  `device_no` varchar(32) DEFAULT '' COMMENT '设备编号',
  `remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `extend` varchar(256) DEFAULT NULL COMMENT '扩展信息',
  `create_user` varchar(20) NOT NULL DEFAULT '' COMMENT '创建者',
  `update_user` varchar(20) DEFAULT NULL COMMENT '更新人',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`device_id`),
  KEY `idx_tenant_id` (`tenant_id`),
  KEY `idx_company_id` (`company_id`),
  KEY `idx_vechile_id` (`vechile_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='车辆设备表';


DROP TABLE IF EXISTS `sr_vechile_extinfo`;
CREATE TABLE `sr_vechile_extinfo` (
  `vechile_id` int(11) unsigned NOT NULL COMMENT '车辆ID',
  `tenant_id` int(11) unsigned NOT NULL COMMENT '租户id',
  `company_id` int(11) unsigned DEFAULT NULL COMMENT '公司ID',
  `engine_number` varchar(32) DEFAULT NULL COMMENT '发动机号',
  `vin` varchar(32) DEFAULT NULL COMMENT 'vin(车架号)',
  `production_date` date DEFAULT NULL COMMENT '生产日期',
  `etc` varchar(100) DEFAULT NULL COMMENT 'ETC信息',
  `wheel_base` int(11) unsigned DEFAULT '0' COMMENT '轴距(mm)',
  `wheel_num` int(11) unsigned DEFAULT '0' COMMENT '轴数',
  `tire_num` int(11) unsigned DEFAULT '0' COMMENT '轮胎数',
  `tire_specification` varchar(32) NOT NULL DEFAULT '' COMMENT '轮胎规格',
  `tow_weight` varchar(20) DEFAULT NULL COMMENT '准牵引总质量',
  `load_capacity` varchar(20) DEFAULT NULL COMMENT '核定载质量',
  `origin` tinyint(4) DEFAULT '0' COMMENT '产地: 0=国产,1=进口 ',
  `mot_date` date DEFAULT NULL COMMENT '车辆年检日期',
  `certification` varchar(100) DEFAULT NULL COMMENT '合格证',
  `on_cards_date` date DEFAULT NULL COMMENT '上牌日期',
  `regist_date` date DEFAULT NULL COMMENT '注册日期',
  `forc_discard_date` date DEFAULT NULL COMMENT '强制报废日期',
  `remark` varchar(300) DEFAULT NULL COMMENT '备注',
  `manufacturer` varchar(64) NOT NULL DEFAULT '' COMMENT '制造厂名称',
  `create_user` varchar(20) NOT NULL DEFAULT '' COMMENT '创建者',
  `update_user` varchar(20) DEFAULT NULL COMMENT '更新人',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`vechile_id`),
  KEY `idx_tenant_id` (`tenant_id`),
  KEY `idx_vechile_id` (`vechile_id`),
  KEY `idx_company_id` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='车辆扩展信息表';


DROP TABLE IF EXISTS `sr_model`;
CREATE TABLE `sr_model` (
  `model_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '车模型ID',
  `tenant_id` int(11) unsigned NOT NULL COMMENT '租户id',
  `company_id` int(11) DEFAULT NULL COMMENT '公司ID',
  `model_name` varchar(125) DEFAULT NULL COMMENT '车模型名称',
  `energy_type` tinyint(4) DEFAULT '0' COMMENT '耗能方式,0电,1油,2油电混合',
  `seats` tinyint(4) DEFAULT '0' COMMENT '座位数',
  `row` tinyint(4) DEFAULT '0' COMMENT '行数',
  `col` tinyint(4) DEFAULT '0' COMMENT '列数',
  `state` tinyint(2) DEFAULT '1' COMMENT '1可用,  0废除',
  `create_user` varchar(20) NOT NULL DEFAULT '' COMMENT '创建者',
  `update_user` varchar(20) DEFAULT NULL COMMENT '更新人',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`model_id`),
  KEY `idx_tenant_id` (`tenant_id`),
  KEY `idx_company_id` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='车型';


# 以下为用户权限相关

DROP TABLE IF EXISTS `sr_user_dict`;
CREATE TABLE `sr_user_dict` (
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户id，与统一认证用户ID保持一致',
  `tenant_id` int(11) DEFAULT '0' COMMENT '租户id',
  `company_id` int(11) DEFAULT '0' COMMENT '最后登录公司id',
  `employee_id` int(11) DEFAULT '0' COMMENT '员工id',
  `app_setting` varchar(1000) DEFAULT '0' COMMENT '丝路巴士商户端app配置',
  `device_info` varchar(255) DEFAULT '0' COMMENT '用户设备信息',
  `create_user` varchar(20) DEFAULT NULL,
  `update_user` varchar(20) DEFAULT NULL,
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户设置表';

DROP TABLE IF EXISTS `sr_role`;
CREATE TABLE `sr_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `tenant_id` varchar(64) NOT NULL COMMENT '租户编号',
  `name` varchar(100) NOT NULL COMMENT '角色名称',
  `role_type` varchar(255) DEFAULT NULL COMMENT '角色类型',
  `data_scope` int(11) DEFAULT NULL COMMENT '数据范围',
  `is_sys` int(11) DEFAULT NULL COMMENT '是否系统数据 0-是 1-不是',
  `useable` int(11) DEFAULT NULL COMMENT '是否可用 0-可用 1-不可用',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '更新状态 0=使用 1=删除',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `create_user` varchar(20) NOT NULL DEFAULT '' COMMENT '创建者',
  `update_user` varchar(20) DEFAULT NULL COMMENT '更新人',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '建立日期',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  PRIMARY KEY (`role_id`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='角色表';



DROP TABLE IF EXISTS `sr_tenant_application`;
CREATE TABLE `sr_tenant_application` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `tenant_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '租户ID',
  `app_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '应用ID',
  `app_name` varchar(100) DEFAULT NULL COMMENT '应用名称',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '应用状态 0=停用 1=启用',
  PRIMARY KEY (`id`),
  KEY `idx_tenant_id` (`tenant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='租户应用列表';


DROP TABLE IF EXISTS `sr_tenant_role_permission`;
CREATE TABLE `sr_tenant_role_permission` (
  `permission_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '许可ID',
  `tenant_id` int(11) NOT NULL DEFAULT '0' COMMENT '租户ID',
  `app_id` int(11) NOT NULL COMMENT '所属应用ID',
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `menu_id` int(11) NOT NULL COMMENT '菜单ID',
  `permission_type` varchar(100) DEFAULT NULL COMMENT '许可类型',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`permission_id`),
  KEY `tenant_id` (`tenant_id`),
  KEY `app_id` (`app_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='角色许可';



DROP TABLE IF EXISTS `sr_user_role`;
CREATE TABLE `sr_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户角色ID',
  `tenant_id` varchar(64) NOT NULL COMMENT '租户编号',
  `employee_id` int(11) unsigned NOT NULL COMMENT '员工ID',
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_tenat_employee_role` (`tenant_id`,`employee_id`,`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='用户角色表';

