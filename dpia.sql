

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for checklist
-- ----------------------------
DROP TABLE IF EXISTS `checklist`;
CREATE TABLE `checklist` (
  `检查项` varchar(255) NOT NULL COMMENT 'xxxx产品个人数据检查项',
  `检查方法` varchar(255) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of checklist
-- ----------------------------
INSERT INTO `checklist` VALUES ('xxxxGDPR字段评估工具', '参考xxxxGDPR字段评估工具，确保红色标识的字段的不收集', '1');
INSERT INTO `checklist` VALUES ('Cookie/Token使用', 'Cookie使用设计案例示意，关注cookie使用的关键点，cookie的形式', '2');
INSERT INTO `checklist` VALUES ('后台数据库管理', '是否启动数据库敏感字段加密', '3');
INSERT INTO `checklist` VALUES ('投诉反馈机制', '用户投诉处理流程是否建立，相关客服人员是否接受了培训', '4');
INSERT INTO `checklist` VALUES ('数据传输', '检查是否使用HTTPS进行传输，不建议使用SSL方式。', '5');
INSERT INTO `checklist` VALUES ('数据泄露预案的准备', '有账号体系的产品需准备', '6');
INSERT INTO `checklist` VALUES ('数据跨境', '检查数据是否传输到境外，是否存储在境外。', '7');
INSERT INTO `checklist` VALUES ('数据跨境-01', '是否存在个人数据跨境', '8');
INSERT INTO `checklist` VALUES ('数据跨境-03', '数据跨境目标国家，是否包含欧盟，是否包括美国', '9');
INSERT INTO `checklist` VALUES ('数据跨境-04', '数据跨境的移动路径描述', '10');
INSERT INTO `checklist` VALUES ('数据跨境-05', '请写明具体情况', '11');
INSERT INTO `checklist` VALUES ('xxxxGDPR字段评估工具', '参考xxxxGDPR字段评估工具，确保红色标识的字段的不收集。如有处理必要，提请数据保护专员（DPO）评估。', '12');
INSERT INTO `checklist` VALUES ('用户同意', '若收集敏感个人数据，用户弹窗功能是否在记录用户同意过程', '13');
INSERT INTO `checklist` VALUES ('隐私策略', '产品隐私策略是否更新在最新产品中，内容是否结合产品功能和数据进行了更新。', '14');
INSERT INTO `checklist` VALUES ('数据流描述', '描述数据在应用系统内部及应用系统之间流转情况，如收集的数据通过何种接口流转到哪一个系统，是否经过加密处理等', '15');

-- ----------------------------
-- Table structure for checklist_result
-- ----------------------------
DROP TABLE IF EXISTS `checklist_result`;
CREATE TABLE `checklist_result` (
  `id` int(11) NOT NULL COMMENT '产品个人数据检查结果',
  `desc_str` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of checklist_result
-- ----------------------------
INSERT INTO `checklist_result` VALUES ('1', '符合');
INSERT INTO `checklist_result` VALUES ('2', '不符合');
INSERT INTO `checklist_result` VALUES ('3', '不适用');

-- ----------------------------
-- Table structure for data_qusetion
-- ----------------------------
DROP TABLE IF EXISTS `data_qusetion`;
CREATE TABLE `data_qusetion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `col_name` varchar(255) NOT NULL,
  `desc_str` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of data_qusetion
-- ----------------------------
INSERT INTO `data_qusetion` VALUES ('1', 'get_ness', '数据收集必要性，是否是业务所需要');
INSERT INTO `data_qusetion` VALUES ('2', 'get_descript', '数据收集用途');
INSERT INTO `data_qusetion` VALUES ('3', 'get_src', '获取来源');
INSERT INTO `data_qusetion` VALUES ('4', 'use_show', '使用该数据的显示方式');
INSERT INTO `data_qusetion` VALUES ('5', 'use_dp', '是否进行用户数据画像');
INSERT INTO `data_qusetion` VALUES ('6', 'use_log', '该字段所关联的操作系统日志保留6个月,主要是指字段自主生成的相关日志。例如用户登录，删除，下线的记录');
INSERT INTO `data_qusetion` VALUES ('7', 'trans_out', '该字段向第三方进行传输，传输方式加密');
INSERT INTO `data_qusetion` VALUES ('8', 'trans_in', '该字段向内部传输，传输方式加密');
INSERT INTO `data_qusetion` VALUES ('9', 'storage_point', '用户数据在服务器内的呈现形式');
INSERT INTO `data_qusetion` VALUES ('10', 'storage_allow', '该数据存储在公司服务器或通过系统接口调用');
INSERT INTO `data_qusetion` VALUES ('11', 'storage_encryp', '存储的数据的是否采用加密算法，是否明文，还是不存储');
INSERT INTO `data_qusetion` VALUES ('12', 'server_log', '关联该字段的服务器的日志记录，主要是指公司后台对于该字段的运维操作日志。例如后台运维人员核查该用户一些账户行为所产生的记录');
INSERT INTO `data_qusetion` VALUES ('13', 'delete_point', '字段删除（一般关联账户一体化删除）');

-- ----------------------------
-- Table structure for data_trans
-- ----------------------------
DROP TABLE IF EXISTS `data_trans`;
CREATE TABLE `data_trans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `desc_str` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of data_trans
-- ----------------------------
INSERT INTO `data_trans` VALUES ('1', '欧盟 <--> 美国');
INSERT INTO `data_trans` VALUES ('2', '欧盟 <--> 中国');
INSERT INTO `data_trans` VALUES ('3', '欧盟 <--> 其他');
INSERT INTO `data_trans` VALUES ('4', '欧盟 <--> 欧盟');
INSERT INTO `data_trans` VALUES ('5', '美国 <--> 中国');
INSERT INTO `data_trans` VALUES ('6', '美国 <--> 其他');
INSERT INTO `data_trans` VALUES ('7', '美国 <--> 美国');
INSERT INTO `data_trans` VALUES ('8', '中国 <--> 其他');
INSERT INTO `data_trans` VALUES ('9', '中国 <--> 中国');

-- ----------------------------
-- Table structure for delete_point
-- ----------------------------
DROP TABLE IF EXISTS `delete_point`;
CREATE TABLE `delete_point` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '销毁关注点',
  `desc_str` varchar(255) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of delete_point
-- ----------------------------
INSERT INTO `delete_point` VALUES ('1', '完全删除，不可恢复，并通知第三方删除。');
INSERT INTO `delete_point` VALUES ('2', '前置删除，系统锁定待销毁状态，用户在一定期限内可以反悔。关联数据和系统生成日志不可恢复');
INSERT INTO `delete_point` VALUES ('3', '不涉及');
INSERT INTO `delete_point` VALUES ('99', '其它（备注中说明）');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for dpia_info
-- ----------------------------
DROP TABLE IF EXISTS `dpia_info`;
CREATE TABLE `dpia_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一主键',
  `manager_email_list` varchar(255) NOT NULL,
  `pro_name` int(11) NOT NULL COMMENT '产品名称',
  `pro_desc` varchar(255) NOT NULL COMMENT '产品介绍',
  `user_country` varchar(255) NOT NULL COMMENT '用户所在国家',
  `data_country` varchar(255) NOT NULL COMMENT '存储数据国家',
  `pro_pri_leader` varchar(255) DEFAULT NULL COMMENT '产品隐私负责人',
  `pro_pri_name` varchar(255) DEFAULT NULL COMMENT '产品隐私专员，默认产品经理',
  `net_id_account` int(11) DEFAULT '0' COMMENT '网络身份标识信息 —— 账户名 1 是 0 否',
  `net_id_api` int(11) DEFAULT '0' COMMENT '网络身份标识信息 社交功能产品,  第三方社交账号：FB, Google, 微信，微博等  : 1是 0 否',
  `net_id_password` int(11) DEFAULT '0' COMMENT '网络身份标识信息——登录密码: 1 是 0 否',
  `asset_password` int(11) DEFAULT '0' COMMENT '个人财产信息——支付密码 ：1 是 0 否',
  `basis_name` int(11) DEFAULT '0' COMMENT '个人基本资料——姓名： 1是 0 否',
  `basis_mobilephone` int(11) DEFAULT '0' COMMENT '个人基本资料——手机号： 1是 0 否',
  `basis_telephone` int(11) DEFAULT '0' COMMENT '个人基本资料——固定电话号： 1是 0 否',
  `basis_address` int(11) DEFAULT '0' COMMENT '个人基本资料——地址： 1是 0 否',
  `basis_email` int(11) DEFAULT '0' COMMENT '个人基本资料——邮箱： 1是 0 否',
  `position_gps` int(11) DEFAULT '0' COMMENT '个人位置信息——经纬度，GPS：1是 0 否',
  `personal_id` int(11) DEFAULT '0' COMMENT '个人身份信息——身份证号码：1是 0 否',
  `biology_face` int(11) DEFAULT '0' COMMENT '个人生物识别信息——面部特征数据：1是 0 否',
  `biology_voice` int(11) DEFAULT '0' COMMENT '个人生物识别信息——声音特征数据：1是 0 否',
  `biology_finger` int(11) DEFAULT '0' COMMENT '个人生物识别信息——指纹：1是 0 否',
  `biology_portrait` int(11) DEFAULT '0' COMMENT '个人生物识别信息——面部肖像数据：1是 0 否',
  `biology_other` int(11) DEFAULT NULL COMMENT '上一列的详细信息表对应id',
  `device_mobile` int(11) DEFAULT '0' COMMENT '个人常用设备信息——手机的品牌，型号，分辨率，CPU型号，内存大小等：1是 0 否',
  `device_imei` int(11) DEFAULT '0' COMMENT '个人常用设备信息——Mac address，IMEI，智能硬件的硬件序列号，aid，推送ID（REGID). 1是 0 否',
  `device_apps` int(11) DEFAULT '0' COMMENT '个人常用设备信息——用户应用使用情况（记录）:1是 0否',
  `device_security` int(11) DEFAULT '0' COMMENT '个人常用设备信息——安全功能产品，提供保险服务：上报的用户保单信息和保单号。:1是 0否',
  `device_pkgs` int(11) DEFAULT '0' COMMENT '个人常用设备信息——用户设备中已经安装的应用包名列表:1是 0否',
  `checklist_dpia_check` int(11) NOT NULL COMMENT 'xxxxGDPR字段评估工具 1 符合 2 不符合 3 其他（备注中填写）',
  `checklist_db_manage` int(11) NOT NULL COMMENT '后台数据库管理',
  `checklist_privacy_policy` int(11) NOT NULL COMMENT '隐私策略',
  `checklist_user_allow` int(11) NOT NULL COMMENT '用户同意',
  `checklist_feedback` int(11) NOT NULL COMMENT '投诉反馈机制',
  `checklist_dataleak` int(11) DEFAULT NULL COMMENT '数据泄露预案的准备',
  `checklist_backinfo` varchar(511) DEFAULT NULL,
  `checklist_dataflow` varchar(511) DEFAULT NULL COMMENT '数据流描述',
  `checklist_dataleak_path` varchar(255) DEFAULT '' COMMENT '数据泄露准备预案存放的文件位置',
  `checklist_dataleak_name` varchar(255) DEFAULT NULL COMMENT '数据泄露准备预案存放的文件名字',
  `add_time` datetime NOT NULL,
  `checklist_api` int(11) NOT NULL,
  `checklist_api_name` varchar(255) DEFAULT NULL,
  `data_trans` varchar(255) NOT NULL,
  `deal_nation` int(11) NOT NULL DEFAULT '0' COMMENT '种族民族出身 1处理了0 未处理',
  `deal_politic` int(11) NOT NULL DEFAULT '0' COMMENT '政治观点 1处理0未处理',
  `deal_religion` int(11) NOT NULL DEFAULT '0' COMMENT '宗教哲学信仰',
  `deal_member` int(11) NOT NULL DEFAULT '0' COMMENT '工会会员资格',
  `deal_biology` int(11) NOT NULL DEFAULT '0' COMMENT '生物学数据（基因数据，个人生物识别信息）',
  `deal_health` int(11) NOT NULL DEFAULT '0' COMMENT '健康数据',
  `deal_sex` int(11) NOT NULL DEFAULT '0' COMMENT '性取向性生活',
  `showid` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for get_ness
-- ----------------------------
DROP TABLE IF EXISTS `get_ness`;
CREATE TABLE `get_ness` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '数据收集必要性',
  `desc_str` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of get_ness
-- ----------------------------
INSERT INTO `get_ness` VALUES ('1', '不许收集');
INSERT INTO `get_ness` VALUES ('2', '如业务所需，可收集，并隐私政策中说明及征得用户同意');
INSERT INTO `get_ness` VALUES ('3', '该数据可能关联Facebook公司，报备公司安全部门；如业务所需，谨慎收集，收集时特别说明及征得用户同意');
INSERT INTO `get_ness` VALUES ('4', '如业务所需，谨慎收集，收集时特别说明及征得用户同意');
INSERT INTO `get_ness` VALUES ('99', '其它（备注中说明）');

-- ----------------------------
-- Table structure for get_src
-- ----------------------------
DROP TABLE IF EXISTS `get_src`;
CREATE TABLE `get_src` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '获取来源',
  `desc_str` varchar(255) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of get_src
-- ----------------------------
INSERT INTO `get_src` VALUES ('1', '埋点');
INSERT INTO `get_src` VALUES ('2', '用户输入');
INSERT INTO `get_src` VALUES ('3', '应用生成');
INSERT INTO `get_src` VALUES ('4', '其它应用');
INSERT INTO `get_src` VALUES ('99', '其它（备注中说明）');

-- ----------------------------
-- Table structure for high_risk
-- ----------------------------
DROP TABLE IF EXISTS `high_risk`;
CREATE TABLE `high_risk` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '高风险数据 特殊种类个人数据',
  `desc_str` varchar(255) NOT NULL COMMENT '字段名称 也即描述信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of high_risk
-- ----------------------------
INSERT INTO `high_risk` VALUES ('1', '种族、民族出身');
INSERT INTO `high_risk` VALUES ('2', '政治观点');
INSERT INTO `high_risk` VALUES ('3', '宗教、哲学信仰');
INSERT INTO `high_risk` VALUES ('4', '工会会员资格');
INSERT INTO `high_risk` VALUES ('5', '基因数据');
INSERT INTO `high_risk` VALUES ('6', '生物学数据');
INSERT INTO `high_risk` VALUES ('7', '健康数据');
INSERT INTO `high_risk` VALUES ('8', '性取向');
INSERT INTO `high_risk` VALUES ('9', '性生活');

-- ----------------------------
-- Table structure for manager
-- ----------------------------
DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager` (
  `id` int(11) NOT NULL COMMENT '产品经理表',
  `name` varchar(255) NOT NULL COMMENT '姓名',
  `email` varchar(255) NOT NULL COMMENT '邮箱',
  `depart` varchar(255) DEFAULT NULL COMMENT '部门',
  `leader` varchar(255) DEFAULT NULL COMMENT '一级部门负责人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of manager
-- ----------------------------

-- ----------------------------
-- Table structure for privacy_info
-- ----------------------------
DROP TABLE IF EXISTS `privacy_info`;
CREATE TABLE `privacy_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '隐私信息详细表项',
  `privacy_type_id` int(11) NOT NULL COMMENT '所属的隐私数据类型',
  `dpia_id` int(11) DEFAULT NULL COMMENT '所属的dpia_info表的id',
  `privacy_backinfo` varchar(511) DEFAULT NULL COMMENT '备注，隐私信息内各项若有备注都填在这里',
  `get_ness` int(11) NOT NULL COMMENT '获取关注点——数据收集必要性：关联描述表的id',
  `get_src` varchar(63) NOT NULL COMMENT '获取关注点——获取来源：关联描述表的id',
  `use_show` int(11) NOT NULL COMMENT '使用关注点——显示：关联描述表的id',
  `use_dp` int(11) NOT NULL COMMENT '使用关注点——是否为敏感的数据处理过程：关联描述表的id',
  `use_log` int(11) NOT NULL COMMENT '使用关注点——处理日志：关联描述表的id',
  `trans_out` int(11) NOT NULL COMMENT '传输关注点——外部传输：关联描述表的id',
  `trans_in` int(11) NOT NULL COMMENT '传输关注点——内部传输：关联描述表的id',
  `storage_point` int(11) NOT NULL COMMENT '存储关注点，数据生成规范',
  `storage_allow` int(11) NOT NULL COMMENT '存储关注点——外部传输：关联描述表的id',
  `storage_encryp` int(11) NOT NULL COMMENT '存储关注点——是否加密存储：关联描述表的id',
  `server_log` int(11) NOT NULL COMMENT '存储关注点，获取服务器的日志记录（包括客户端和运维，系统之间）',
  `delete_point` int(11) NOT NULL COMMENT '删除关注点：关联描述表的id',
  `privacy_infoc` varchar(511) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for privacy_type
-- ----------------------------
DROP TABLE IF EXISTS `privacy_type`;
CREATE TABLE `privacy_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '字段表 隐私数据类型 表',
  `desc_str` varchar(255) NOT NULL,
  `col_name` varchar(255) NOT NULL,
  `get_ness` int(11) NOT NULL,
  `get_src` int(11) NOT NULL,
  `use_show` int(11) NOT NULL,
  `use_dp` int(11) NOT NULL,
  `use_log` int(11) NOT NULL,
  `trans_in` int(11) NOT NULL,
  `trans_out` int(11) NOT NULL,
  `storage_allow` int(11) NOT NULL,
  `storage_encryp` int(11) NOT NULL,
  `delete_point` int(11) NOT NULL,
  `storage_point` int(11) NOT NULL,
  `server_log` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of privacy_type
-- ----------------------------
INSERT INTO `privacy_type` VALUES ('1', '手机的品牌，型号，分辨率，CPU型号，内存大小等', 'device_mobile', '2', '0', '3', '0', '1', '2', '3', '1', '5', '1', '6', '14');
INSERT INTO `privacy_type` VALUES ('2', 'Mac address，IMEI，智能硬件的硬件序列号，aid，推送ID（REGID).', 'device_imei', '2', '0', '5', '0', '1', '2', '3', '1', '4', '1', '6', '2');
INSERT INTO `privacy_type` VALUES ('3', '用户应用使用情况（记录）', 'device_apps', '2', '0', '5', '0', '1', '2', '3', '1', '4', '1', '6', '2');
INSERT INTO `privacy_type` VALUES ('4', '用户设备中已经安装的应用包名列表', 'device_pkgs', '2', '0', '5', '0', '1', '2', '3', '1', '4', '1', '6', '9');
INSERT INTO `privacy_type` VALUES ('5', '社交功能产品,  第三方社交账号：FB, Google, 微信，微博等', 'net_id_api', '3', '0', '7', '0', '1', '2', '3', '1', '3', '1', '2', '2');
INSERT INTO `privacy_type` VALUES ('6', '经纬度，GPS', 'position_gps', '4', '0', '13', '0', '1', '2', '3', '1', '4', '1', '6', '6');
INSERT INTO `privacy_type` VALUES ('7', '邮箱', 'basis_email', '2', '0', '12', '0', '1', '2', '3', '1', '3', '1', '5', '13');
INSERT INTO `privacy_type` VALUES ('8', '账户名', 'net_id_account', '2', '0', '2', '0', '1', '2', '4', '1', '2', '2', '1', '1');
INSERT INTO `privacy_type` VALUES ('9', '登录密码', 'net_id_password', '4', '0', '5', '0', '1', '2', '3', '4', '1', '2', '3', '2');
INSERT INTO `privacy_type` VALUES ('10', '姓名', 'basis_name', '2', '0', '9', '0', '1', '2', '3', '1', '3', '1', '5', '5');
INSERT INTO `privacy_type` VALUES ('11', '手机号', 'basis_mobilephone', '2', '0', '10', '0', '1', '2', '3', '1', '4', '1', '5', '3');
INSERT INTO `privacy_type` VALUES ('12', '电话号码', 'basis_telephone', '2', '0', '11', '0', '1', '2', '3', '1', '4', '1', '5', '4');
INSERT INTO `privacy_type` VALUES ('13', '地址', 'basis_address', '2', '0', '9', '0', '1', '2', '3', '1', '3', '1', '5', '5');
INSERT INTO `privacy_type` VALUES ('14', '身份证号', 'personal_id', '4', '0', '14', '0', '1', '2', '3', '1', '3', '1', '7', '3');
INSERT INTO `privacy_type` VALUES ('15', '指纹', 'biology_finger', '4', '0', '5', '0', '1', '3', '3', '6', '2', '1', '7', '8');
INSERT INTO `privacy_type` VALUES ('16', '面部肖像数据', 'biology_portrait', '4', '0', '5', '0', '1', '2', '3', '6', '2', '1', '7', '8');
INSERT INTO `privacy_type` VALUES ('17', '安全功能产品，提供保险服务：上报的用户保单信息和保单号。', 'device_security', '4', '0', '17', '0', '1', '2', '3', '4', '1', '1', '11', '9');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pro_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=972 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', 'Test1');
INSERT INTO `product` VALUES ('2', 'TEST2');
INSERT INTO `product` VALUES ('3', 'test for 3');


-- ----------------------------
-- Table structure for server_log
-- ----------------------------
DROP TABLE IF EXISTS `server_log`;
CREATE TABLE `server_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '获取服务器的日志记录',
  `desc_str` varchar(255) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of server_log
-- ----------------------------
INSERT INTO `server_log` VALUES ('1', '可完整明文');
INSERT INTO `server_log` VALUES ('2', '打印星号');
INSERT INTO `server_log` VALUES ('3', '显示前3后4');
INSERT INTO `server_log` VALUES ('4', '显示前2后3');
INSERT INTO `server_log` VALUES ('5', '可完整明文');
INSERT INTO `server_log` VALUES ('6', '字段置空');
INSERT INTO `server_log` VALUES ('7', '不涉及');
INSERT INTO `server_log` VALUES ('8', '操作动作可审计');
INSERT INTO `server_log` VALUES ('9', '不显示');
INSERT INTO `server_log` VALUES ('10', '系统中严格控制访问');
INSERT INTO `server_log` VALUES ('11', '系统中严格控制访问，加密字段');
INSERT INTO `server_log` VALUES ('12', '不得存储');
INSERT INTO `server_log` VALUES ('13', '隐藏@前2位，@后1位');
INSERT INTO `server_log` VALUES ('14', 'N/A');

-- ----------------------------
-- Table structure for storage_allow
-- ----------------------------
DROP TABLE IF EXISTS `storage_allow`;
CREATE TABLE `storage_allow` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '是否允许存储',
  `desc_str` varchar(255) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of storage_allow
-- ----------------------------
INSERT INTO `storage_allow` VALUES ('1', '可服务器端存储');
INSERT INTO `storage_allow` VALUES ('2', '仅客户端存储');
INSERT INTO `storage_allow` VALUES ('3', '仅客户端临时存储，关闭后删除');
INSERT INTO `storage_allow` VALUES ('4', '数据透传（不加工不处理）');
INSERT INTO `storage_allow` VALUES ('5', '前端本地不留存，服务器只存Hash');
INSERT INTO `storage_allow` VALUES ('6', '前端本地不留存，客户端和服务器留Hash');
INSERT INTO `storage_allow` VALUES ('7', '系统中严格控制访问');
INSERT INTO `storage_allow` VALUES ('8', '系统中严格控制访问，加密字段');
INSERT INTO `storage_allow` VALUES ('9', '不得存储');
INSERT INTO `storage_allow` VALUES ('99', '其它（备注中说明）');

-- ----------------------------
-- Table structure for storage_encryp
-- ----------------------------
DROP TABLE IF EXISTS `storage_encryp`;
CREATE TABLE `storage_encryp` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '是否加密存储',
  `desc_str` varchar(255) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of storage_encryp
-- ----------------------------
INSERT INTO `storage_encryp` VALUES ('1', '不存储');
INSERT INTO `storage_encryp` VALUES ('2', '可明文存储');
INSERT INTO `storage_encryp` VALUES ('3', '加密存储');
INSERT INTO `storage_encryp` VALUES ('4', '有效加密处理（如无法推导自然人,目前可不采用加密存储）');
INSERT INTO `storage_encryp` VALUES ('5', '可明文存储（无法推导自然人）');
INSERT INTO `storage_encryp` VALUES ('6', '系统中严格控制访问');
INSERT INTO `storage_encryp` VALUES ('7', '系统中严格控制访问，加密字段');
INSERT INTO `storage_encryp` VALUES ('8', '不得存储');
INSERT INTO `storage_encryp` VALUES ('99', '其它（备注中说明）');

-- ----------------------------
-- Table structure for storage_point
-- ----------------------------
DROP TABLE IF EXISTS `storage_point`;
CREATE TABLE `storage_point` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '存储关注点',
  `desc_str` varchar(255) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of storage_point
-- ----------------------------
INSERT INTO `storage_point` VALUES ('1', '账户UID不允许包含任何敏感信息，如手机号、身份信息、邮箱、银行卡类信息等；');
INSERT INTO `storage_point` VALUES ('2', '内部数据所有呈现进行关键的隐藏');
INSERT INTO `storage_point` VALUES ('3', '1)密码长度8-16位2)数字，大写字母，小写字母，特殊符号至少2种');
INSERT INTO `storage_point` VALUES ('4', '1)6位数字不能全部相同2)6位数字不能全部升序/降序');
INSERT INTO `storage_point` VALUES ('5', '用户自助生成');
INSERT INTO `storage_point` VALUES ('6', '用户授权，系统自动生成');
INSERT INTO `storage_point` VALUES ('7', '用户授权，系统通过特定算法生成，只能以HASH存在');
INSERT INTO `storage_point` VALUES ('8', '系统中严格控制访问');
INSERT INTO `storage_point` VALUES ('9', '系统中严格控制访问，加密字段');
INSERT INTO `storage_point` VALUES ('10', '不得存储');
INSERT INTO `storage_point` VALUES ('11', 'N/A ');

-- ----------------------------
-- Table structure for trans_in
-- ----------------------------
DROP TABLE IF EXISTS `trans_in`;
CREATE TABLE `trans_in` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '内部传输',
  `desc_str` varchar(255) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of trans_in
-- ----------------------------
INSERT INTO `trans_in` VALUES ('1', '一般传输');
INSERT INTO `trans_in` VALUES ('2', '加密传输');
INSERT INTO `trans_in` VALUES ('3', '禁止');
INSERT INTO `trans_in` VALUES ('4', '不涉及');
INSERT INTO `trans_in` VALUES ('99', '其它（备注中说明）');

-- ----------------------------
-- Table structure for trans_out
-- ----------------------------
DROP TABLE IF EXISTS `trans_out`;
CREATE TABLE `trans_out` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '第三方传输',
  `desc_str` varchar(255) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of trans_out
-- ----------------------------
INSERT INTO `trans_out` VALUES ('1', '可向第三方一般传输');
INSERT INTO `trans_out` VALUES ('2', '可向第三方加密传输');
INSERT INTO `trans_out` VALUES ('3', '不可向第三方传输');
INSERT INTO `trans_out` VALUES ('4', '有限的外部传输，只可传输账户名');
INSERT INTO `trans_out` VALUES ('5', '禁止');
INSERT INTO `trans_out` VALUES ('6', '不涉及');
INSERT INTO `trans_out` VALUES ('99', '其它（备注中说明）');

-- ----------------------------
-- Table structure for use_dp
-- ----------------------------
DROP TABLE IF EXISTS `use_dp`;
CREATE TABLE `use_dp` (
  `id` int(11) NOT NULL COMMENT '是否遵从了反对权和自动化的个性决策',
  `desc_str` varchar(255) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of use_dp
-- ----------------------------
INSERT INTO `use_dp` VALUES ('1', '是');
INSERT INTO `use_dp` VALUES ('2', '否');

-- ----------------------------
-- Table structure for use_log
-- ----------------------------
DROP TABLE IF EXISTS `use_log`;
CREATE TABLE `use_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '处理日志',
  `desc_str` varchar(255) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of use_log
-- ----------------------------
INSERT INTO `use_log` VALUES ('1', '处理日志保留6个月');
INSERT INTO `use_log` VALUES ('2', '处理日志保留2年（跨境处理）');
INSERT INTO `use_log` VALUES ('3', '不记录');
INSERT INTO `use_log` VALUES ('99', '其它（备注中说明）');

-- ----------------------------
-- Table structure for use_show
-- ----------------------------
DROP TABLE IF EXISTS `use_show`;
CREATE TABLE `use_show` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '显示形式',
  `desc_str` varchar(255) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of use_show
-- ----------------------------
INSERT INTO `use_show` VALUES ('1', '仅登录后可见、可用');
INSERT INTO `use_show` VALUES ('2', '不登录也可用');
INSERT INTO `use_show` VALUES ('3', '不登录也可见');
INSERT INTO `use_show` VALUES ('4', '屏蔽显示，仅二次验证身份后方可显示。');
INSERT INTO `use_show` VALUES ('5', '不可明文显示');
INSERT INTO `use_show` VALUES ('6', '加密处理,前端本地不留存，后端只能留HASH');
INSERT INTO `use_show` VALUES ('7', '（不建议用作商业使用，可用作验证使用）');
INSERT INTO `use_show` VALUES ('8', '不显示，支付密码输入要求使用安全键盘');
INSERT INTO `use_show` VALUES ('9', '可完整显示');
INSERT INTO `use_show` VALUES ('10', '默认显示11位手机号的前3后4，如+8618612345678，不含区号为11位字符，则显示：+86186****678');
INSERT INTO `use_show` VALUES ('11', '区号和分机号不隐藏，数字部分显示前2后3，如010-12345678-00001则显示为：010-12***678-00001');
INSERT INTO `use_show` VALUES ('12', '隐藏@前2位，@后1位');
INSERT INTO `use_show` VALUES ('13', '经纬度的分，秒全部隐藏');
INSERT INTO `use_show` VALUES ('14', '默认显示前3后4');
INSERT INTO `use_show` VALUES ('15', '遮蔽部分显示，如无必要，应尽量减少展示的机会');
INSERT INTO `use_show` VALUES ('16', '不显示，如需展示时，必须遮蔽或密文展示');
INSERT INTO `use_show` VALUES ('17', 'N/A');
INSERT INTO `use_show` VALUES ('99', '其它（备注中说明）');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(32) DEFAULT NULL,
  `email` varchar(32) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `nickname` varchar(32) DEFAULT NULL,
  `role` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------

-- ----------------------------
-- Table structure for user_country
-- ----------------------------
DROP TABLE IF EXISTS `user_country`;
CREATE TABLE `user_country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `desc_str` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_country
-- ----------------------------
INSERT INTO `user_country` VALUES ('1', '欧盟');
INSERT INTO `user_country` VALUES ('2', '美国');
INSERT INTO `user_country` VALUES ('3', '中国');
INSERT INTO `user_country` VALUES ('4', '全球');
INSERT INTO `user_country` VALUES ('5', '其他');
