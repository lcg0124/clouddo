/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50721
Source Host           : localhost:3306
Source Database       : clouddo

Target Server Type    : MYSQL
Target Server Version : 50721
File Encoding         : 65001

Date: 2018-04-09 18:13:51
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `sys_dept`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '上级部门ID，一级部门为0',
  `name` varchar(50) DEFAULT NULL COMMENT '部门名称',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  `del_flag` tinyint(4) DEFAULT '0' COMMENT '是否删除  -1：已删除  0：正常',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='部门管理';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('6', '0', '研发部', '1', '1');
INSERT INTO `sys_dept` VALUES ('7', '6', '研發一部', '1', '1');
INSERT INTO `sys_dept` VALUES ('8', '6', '研发二部', '2', '1');
INSERT INTO `sys_dept` VALUES ('9', '0', '销售部', '2', '1');
INSERT INTO `sys_dept` VALUES ('10', '9', '销售一部', '1', '1');
INSERT INTO `sys_dept` VALUES ('11', '0', '产品部', '3', '1');
INSERT INTO `sys_dept` VALUES ('12', '11', '产品一部', '1', '1');
INSERT INTO `sys_dept` VALUES ('13', '0', '测试部', '5', '1');
INSERT INTO `sys_dept` VALUES ('14', '13', '测试一部', '1', '1');
INSERT INTO `sys_dept` VALUES ('15', '13', '测试二部', '2', '1');

-- ----------------------------
-- Table structure for `sys_dict`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '标签名',
  `value` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '数据值',
  `type` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '类型',
  `description` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '描述',
  `sort` decimal(10,0) DEFAULT NULL COMMENT '排序（升序）',
  `parent_id` bigint(64) DEFAULT '0' COMMENT '父级编号',
  `create_by` int(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` bigint(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) COLLATE utf8_bin DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_dict_value` (`value`),
  KEY `sys_dict_label` (`name`),
  KEY `sys_dict_del_flag` (`del_flag`)
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='字典表';

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES ('1', '正常', '0', 'del_flag', '删除标记', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('3', '显示', '1', 'show_hide', '显示/隐藏', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('4', '隐藏', '0', 'show_hide', '显示/隐藏', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('5', '是', '1', 'yes_no', '是/否', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('6', '否', '0', 'yes_no', '是/否', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('7', '红色', 'red', 'color', '颜色值', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('8', '绿色', 'green', 'color', '颜色值', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('9', '蓝色', 'blue', 'color', '颜色值', '30', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('10', '黄色', 'yellow', 'color', '颜色值', '40', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('11', '橙色', 'orange', 'color', '颜色值', '50', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('12', '默认主题', 'default', 'theme', '主题方案', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('13', '天蓝主题', 'cerulean', 'theme', '主题方案', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('14', '橙色主题', 'readable', 'theme', '主题方案', '30', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('15', '红色主题', 'united', 'theme', '主题方案', '40', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('16', 'Flat主题', 'flat', 'theme', '主题方案', '60', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('17', '国家', '1', 'sys_area_type', '区域类型', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('18', '省份、直辖市', '2', 'sys_area_type', '区域类型', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('19', '地市', '3', 'sys_area_type', '区域类型', '30', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('20', '区县', '4', 'sys_area_type', '区域类型', '40', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('21', '公司', '1', 'sys_office_type', '机构类型', '60', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('22', '部门', '2', 'sys_office_type', '机构类型', '70', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('23', '小组', '3', 'sys_office_type', '机构类型', '80', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('24', '其它', '4', 'sys_office_type', '机构类型', '90', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('25', '综合部', '1', 'sys_office_common', '快捷通用部门', '30', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('26', '开发部', '2', 'sys_office_common', '快捷通用部门', '40', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('27', '人力部', '3', 'sys_office_common', '快捷通用部门', '50', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('28', '一级', '1', 'sys_office_grade', '机构等级', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('29', '二级', '2', 'sys_office_grade', '机构等级', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('30', '三级', '3', 'sys_office_grade', '机构等级', '30', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('31', '四级', '4', 'sys_office_grade', '机构等级', '40', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('32', '所有数据', '1', 'sys_data_scope', '数据范围', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('33', '所在公司及以下数据', '2', 'sys_data_scope', '数据范围', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('34', '所在公司数据', '3', 'sys_data_scope', '数据范围', '30', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('35', '所在部门及以下数据', '4', 'sys_data_scope', '数据范围', '40', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('36', '所在部门数据', '5', 'sys_data_scope', '数据范围', '50', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('37', '仅本人数据', '8', 'sys_data_scope', '数据范围', '90', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('38', '按明细设置', '9', 'sys_data_scope', '数据范围', '100', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('39', '系统管理', '1', 'sys_user_type', '用户类型', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('40', '部门经理', '2', 'sys_user_type', '用户类型', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('41', '普通用户', '3', 'sys_user_type', '用户类型', '30', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('42', '基础主题', 'basic', 'cms_theme', '站点主题', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('43', '蓝色主题', 'blue', 'cms_theme', '站点主题', '20', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('44', '红色主题', 'red', 'cms_theme', '站点主题', '30', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('45', '文章模型', 'article', 'cms_module', '栏目模型', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('46', '图片模型', 'picture', 'cms_module', '栏目模型', '20', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('47', '下载模型', 'download', 'cms_module', '栏目模型', '30', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('48', '链接模型', 'link', 'cms_module', '栏目模型', '40', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('49', '专题模型', 'special', 'cms_module', '栏目模型', '50', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('50', '默认展现方式', '0', 'cms_show_modes', '展现方式', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('51', '首栏目内容列表', '1', 'cms_show_modes', '展现方式', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('52', '栏目第一条内容', '2', 'cms_show_modes', '展现方式', '30', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('53', '发布', '0', 'cms_del_flag', '内容状态', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('54', '删除', '1', 'cms_del_flag', '内容状态', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('55', '审核', '2', 'cms_del_flag', '内容状态', '15', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('56', '首页焦点图', '1', 'cms_posid', '推荐位', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('57', '栏目页文章推荐', '2', 'cms_posid', '推荐位', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('58', '咨询', '1', 'cms_guestbook', '留言板分类', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('59', '建议', '2', 'cms_guestbook', '留言板分类', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('60', '投诉', '3', 'cms_guestbook', '留言板分类', '30', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('61', '其它', '4', 'cms_guestbook', '留言板分类', '40', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('62', '公休', '1', 'oa_leave_type', '请假类型', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('63', '病假', '2', 'oa_leave_type', '请假类型', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('64', '事假', '3', 'oa_leave_type', '请假类型', '30', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('65', '调休', '4', 'oa_leave_type', '请假类型', '40', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('66', '婚假', '5', 'oa_leave_type', '请假类型', '60', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('67', '接入日志', '1', 'sys_log_type', '日志类型', '30', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('68', '异常日志', '2', 'sys_log_type', '日志类型', '40', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('69', '请假流程', 'leave', 'act_type', '流程类型', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('70', '审批测试流程', 'test_audit', 'act_type', '流程类型', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('71', '分类1', '1', 'act_category', '流程分类', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('72', '分类2', '2', 'act_category', '流程分类', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('73', '增删改查', 'crud', 'gen_category', '代码生成分类', '10', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('74', '增删改查（包含从表）', 'crud_many', 'gen_category', '代码生成分类', '20', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('75', '树结构', 'tree', 'gen_category', '代码生成分类', '30', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('76', '=', '=', 'gen_query_type', '查询方式', '10', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('77', '!=', '!=', 'gen_query_type', '查询方式', '20', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('78', '&gt;', '&gt;', 'gen_query_type', '查询方式', '30', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('79', '&lt;', '&lt;', 'gen_query_type', '查询方式', '40', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('80', 'Between', 'between', 'gen_query_type', '查询方式', '50', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('81', 'Like', 'like', 'gen_query_type', '查询方式', '60', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('82', 'Left Like', 'left_like', 'gen_query_type', '查询方式', '70', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('83', 'Right Like', 'right_like', 'gen_query_type', '查询方式', '80', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('84', '文本框', 'input', 'gen_show_type', '字段生成方案', '10', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('85', '文本域', 'textarea', 'gen_show_type', '字段生成方案', '20', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('86', '下拉框', 'select', 'gen_show_type', '字段生成方案', '30', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('87', '复选框', 'checkbox', 'gen_show_type', '字段生成方案', '40', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('88', '单选框', 'radiobox', 'gen_show_type', '字段生成方案', '50', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('89', '日期选择', 'dateselect', 'gen_show_type', '字段生成方案', '60', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('90', '人员选择', 'userselect', 'gen_show_type', '字段生成方案', '70', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('91', '部门选择', 'officeselect', 'gen_show_type', '字段生成方案', '80', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('92', '区域选择', 'areaselect', 'gen_show_type', '字段生成方案', '90', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('93', 'String', 'String', 'gen_java_type', 'Java类型', '10', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('94', 'Long', 'Long', 'gen_java_type', 'Java类型', '20', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('95', '仅持久层', 'dao', 'gen_category', '代码生成分类', '40', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('96', '男', '1', 'sex', '性别', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('97', '女', '2', 'sex', '性别', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('98', 'Integer', 'Integer', 'gen_java_type', 'Java类型', '30', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('99', 'Double', 'Double', 'gen_java_type', 'Java类型', '40', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('100', 'Date', 'java.util.Date', 'gen_java_type', 'Java类型', '50', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('104', 'Custom', 'Custom', 'gen_java_type', 'Java类型', '90', '0', '1', null, '1', null, null, '1');
INSERT INTO `sys_dict` VALUES ('105', '会议通告', '1', 'oa_notify_type', '通知通告类型', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('106', '奖惩通告', '2', 'oa_notify_type', '通知通告类型', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('107', '活动通告', '3', 'oa_notify_type', '通知通告类型', '30', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('108', '草稿', '0', 'oa_notify_status', '通知通告状态', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('109', '发布', '1', 'oa_notify_status', '通知通告状态', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('110', '未读', '0', 'oa_notify_read', '通知通告状态', '10', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('111', '已读', '1', 'oa_notify_read', '通知通告状态', '20', '0', '1', null, '1', null, null, '0');
INSERT INTO `sys_dict` VALUES ('112', '草稿', '0', 'oa_notify_status', '通知通告状态', '10', '0', '1', null, '1', null, '', '0');
INSERT INTO `sys_dict` VALUES ('113', '删除', '0', 'del_flag', '删除标记', null, null, null, null, null, null, '', '');
INSERT INTO `sys_dict` VALUES ('118', '关于', 'about', 'blog_type', '博客类型', null, null, null, null, null, null, '全url是:/blog/open/page/about', '');
INSERT INTO `sys_dict` VALUES ('119', '交流', 'communication', 'blog_type', '博客类型', null, null, null, null, null, null, '', '');
INSERT INTO `sys_dict` VALUES ('120', '文章', 'article', 'blog_type', '博客类型', null, null, null, null, null, null, '', '');
INSERT INTO `sys_dict` VALUES ('121', '编码', 'code', 'hobby', '爱好', null, null, null, null, null, null, '', '');

-- ----------------------------
-- Table structure for `sys_file`
-- ----------------------------
DROP TABLE IF EXISTS `sys_file`;
CREATE TABLE `sys_file` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT NULL COMMENT '文件类型',
  `url` varchar(200) DEFAULT NULL COMMENT 'URL地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=utf8 COMMENT='文件上传';

-- ----------------------------
-- Records of sys_file
-- ----------------------------
INSERT INTO `sys_file` VALUES ('110', '0', '/files/d64a62e3-6821-48f1-bac6-a1b9945f4afb.jpg', '2017-10-14 16:20:17');
INSERT INTO `sys_file` VALUES ('111', '0', '/files/aa2c3dc6-495f-48cc-8e12-446eceb2535e.jpg', '2017-10-14 16:20:21');
INSERT INTO `sys_file` VALUES ('114', '0', '/files/84c29777-11bc-44b9-818d-859f2d04d417.jpg', '2017-10-20 09:27:18');
INSERT INTO `sys_file` VALUES ('117', '0', '/files/40073f7e-82ec-43f2-b9d3-fd9068916d4b.jpg', '2017-10-20 11:53:47');
INSERT INTO `sys_file` VALUES ('118', '0', '/files/a973499e-3ec7-4d43-8a52-b6f6517c77e3.jpg', '2017-10-20 11:53:52');
INSERT INTO `sys_file` VALUES ('125', '0', '/files/e2901e59-2e65-45a0-9fd8-284c88133cdd.jpg', '2017-10-20 11:54:20');
INSERT INTO `sys_file` VALUES ('127', '0', '/files/1a42a630-5186-44c1-8378-5f974652d7c8.jpg', '2017-10-20 13:20:49');
INSERT INTO `sys_file` VALUES ('132', '0', '/files/e6f13526-e31c-4ebe-a3cf-5fd88dd10be6.jpg', '2017-12-18 20:19:51');
INSERT INTO `sys_file` VALUES ('134', '0', '/files/cd016e72-77f7-4425-afe2-b79dfbdc3ae9.jpeg', '2017-12-18 22:44:07');
INSERT INTO `sys_file` VALUES ('138', '0', '/files/9ec12ee7-65b5-4cc5-9900-d2ec6185b336.jpg', '2017-12-19 19:55:27');

-- ----------------------------
-- Table structure for `sys_log`
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) DEFAULT NULL COMMENT '用户操作',
  `time` int(11) DEFAULT NULL COMMENT '响应时间',
  `method` varchar(200) DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) DEFAULT NULL COMMENT '请求参数',
  `ip` varchar(64) DEFAULT NULL COMMENT 'IP地址',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='系统日志';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('1', '2', 'test', '登录', '0', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2017-12-26 11:33:58');
INSERT INTO `sys_log` VALUES ('2', '2', 'test', '请求访问主页', '286', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-26 11:33:59');
INSERT INTO `sys_log` VALUES ('3', '1', 'admin', '登录', '3', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2017-12-26 11:55:59');
INSERT INTO `sys_log` VALUES ('4', '1', 'admin', '请求访问主页', '32', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-26 11:55:59');
INSERT INTO `sys_log` VALUES ('5', '1', 'admin', '请求访问主页', '11', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-26 11:56:56');
INSERT INTO `sys_log` VALUES ('6', '2', 'test', '登录', '22', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2017-12-26 12:00:43');
INSERT INTO `sys_log` VALUES ('7', '2', 'test', '请求访问主页', '79', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-26 12:00:43');
INSERT INTO `sys_log` VALUES ('8', '2', 'test', '请求访问主页', '15', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-26 12:00:52');
INSERT INTO `sys_log` VALUES ('9', '1', 'admin', '登录', '8', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2017-12-26 12:01:03');
INSERT INTO `sys_log` VALUES ('10', '1', 'admin', '请求访问主页', '17', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-26 12:01:03');
INSERT INTO `sys_log` VALUES ('11', '1', 'admin', '请求访问主页', '17', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-26 12:01:22');
INSERT INTO `sys_log` VALUES ('12', '1', 'admin', '请求访问主页', '10', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-26 12:16:26');
INSERT INTO `sys_log` VALUES ('13', '1', 'admin', '登录', '8', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2017-12-26 12:23:19');
INSERT INTO `sys_log` VALUES ('14', '1', 'admin', '请求访问主页', '32', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-26 12:23:20');
INSERT INTO `sys_log` VALUES ('15', '1', 'admin', '登录', '10', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2017-12-26 12:34:03');
INSERT INTO `sys_log` VALUES ('16', '1', 'admin', '请求访问主页', '81', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-26 12:34:04');
INSERT INTO `sys_log` VALUES ('17', '-1', '获取用户信息为空', '登录', '16', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2017-12-26 20:26:22');
INSERT INTO `sys_log` VALUES ('18', '1', 'admin', '登录', '4', 'com.bootdo.system.controller.LoginController.ajaxLogin()', null, '127.0.0.1', '2017-12-26 20:26:28');
INSERT INTO `sys_log` VALUES ('19', '1', 'admin', '请求访问主页', '52', 'com.bootdo.system.controller.LoginController.index()', null, '127.0.0.1', '2017-12-26 20:26:29');

-- ----------------------------
-- Table structure for `sys_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int(11) DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `component` varchar(20) DEFAULT NULL,
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  `redirect` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8 COMMENT='菜单管理';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('2', '3', '系统菜单', '/admin/menu', 'admin:menu:menu', '1', 'fa fa-th-list', '2', '2017-08-09 22:55:15', null, null, null);
INSERT INTO `sys_menu` VALUES ('3', '0', '系统管理', null, null, '0', 'fa fa-desktop', '1', '2017-08-09 23:06:55', null, '2017-08-14 14:13:43', null);
INSERT INTO `sys_menu` VALUES ('6', '3', '用户管理', '/admin/user', 'admin:user:user', '1', 'fa fa-user', '0', '2017-08-10 00:00:00', null, null, null);
INSERT INTO `sys_menu` VALUES ('7', '3', '角色管理', '/admin/role', 'admin:role:role', '1', 'fa fa-paw', '1', '2017-08-10 00:00:00', null, null, null);
INSERT INTO `sys_menu` VALUES ('12', '6', '新增', '', 'sys:user:add', '2', '', '0', '2017-08-14 10:51:35', null, null, null);
INSERT INTO `sys_menu` VALUES ('13', '6', '编辑', '', 'sys:user:edit', '2', '', '0', '2017-08-14 10:52:06', null, null, null);
INSERT INTO `sys_menu` VALUES ('14', '6', '删除', null, 'sys:user:remove', '2', null, '0', '2017-08-14 10:52:24', null, null, null);
INSERT INTO `sys_menu` VALUES ('15', '7', '新增', '', 'sys:role:add', '2', '', '0', '2017-08-14 10:56:37', null, null, null);
INSERT INTO `sys_menu` VALUES ('20', '2', '新增', '/api-admin/menu', 'admin:menu:add', '2', '', '0', '2017-08-14 00:00:00', null, null, null);
INSERT INTO `sys_menu` VALUES ('21', '2', '编辑', '/api-admin/menu', 'admin:menu:edit', '2', '', '0', '2017-08-14 00:00:00', null, null, null);
INSERT INTO `sys_menu` VALUES ('22', '2', '删除', '/api-admin/menu', 'admin:menu:remove', '2', '', '0', '2017-08-14 00:00:00', null, null, null);
INSERT INTO `sys_menu` VALUES ('24', '6', '批量删除', '', 'sys:user:batchRemove', '2', '', '0', '2017-08-14 17:27:18', null, null, null);
INSERT INTO `sys_menu` VALUES ('25', '6', '停用', null, 'sys:user:disable', '2', null, '0', '2017-08-14 17:27:43', null, null, null);
INSERT INTO `sys_menu` VALUES ('26', '6', '重置密码', '', 'sys:user:resetPwd', '2', '', '0', '2017-08-14 17:28:34', null, null, null);
INSERT INTO `sys_menu` VALUES ('55', '7', '编辑', '', 'sys:role:edit', '2', '', null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('56', '7', '删除', '', 'sys:role:remove', '2', null, null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('61', '2', '批量删除', '/api-admin/menu/batchRemove', 'admin:menu:batchRemove', '2', null, null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('62', '7', '批量删除', '', 'sys:role:batchRemove', '2', null, null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('73', '3', '部门管理', '/admin/api/user/currentUser', 'admin:dept:dept', '1', 'fa fa-users', '3', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('74', '73', '清除缓存', '/admin/api/menu/clearCache', 'system:sysDept:add', '1', null, '1', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('75', '73', '刪除', 'system/sysDept/remove', 'system:sysDept:remove', '2', null, '2', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('76', '73', '编辑', '/admin/api/user/currentUser', 'system:sysDept:edit', '2', null, '3', null, null, null, null);
INSERT INTO `sys_menu` VALUES ('77', '2', '列表', '/api-admin/menu', 'admin:menu:list', '2', null, null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('78', '0', '内容管理', null, null, '0', null, null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('79', '0', '基础信息', null, null, '0', null, null, null, null, null, null);
INSERT INTO `sys_menu` VALUES ('80', '79', '数据字典', '/a', null, '1', null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `role_sign` varchar(100) DEFAULT NULL COMMENT '角色标识',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `user_id_create` bigint(255) DEFAULT NULL COMMENT '创建用户id',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 COMMENT='角色';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '管理员角色', 'admin', '拥有最高权限', '2', '2017-08-12 00:00:00', '2017-08-12 00:00:00');
INSERT INTO `sys_role` VALUES ('48', '钻石会员', null, '高级用户', null, null, null);
INSERT INTO `sys_role` VALUES ('56', '普通用户', null, '普通用户，没啥权限', null, null, null);

-- ----------------------------
-- Table structure for `sys_role_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2998 DEFAULT CHARSET=utf8 COMMENT='角色与菜单对应关系';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('367', '44', '1');
INSERT INTO `sys_role_menu` VALUES ('368', '44', '32');
INSERT INTO `sys_role_menu` VALUES ('369', '44', '33');
INSERT INTO `sys_role_menu` VALUES ('370', '44', '34');
INSERT INTO `sys_role_menu` VALUES ('371', '44', '35');
INSERT INTO `sys_role_menu` VALUES ('372', '44', '28');
INSERT INTO `sys_role_menu` VALUES ('373', '44', '29');
INSERT INTO `sys_role_menu` VALUES ('374', '44', '30');
INSERT INTO `sys_role_menu` VALUES ('375', '44', '38');
INSERT INTO `sys_role_menu` VALUES ('376', '44', '4');
INSERT INTO `sys_role_menu` VALUES ('377', '44', '27');
INSERT INTO `sys_role_menu` VALUES ('378', '45', '38');
INSERT INTO `sys_role_menu` VALUES ('379', '46', '3');
INSERT INTO `sys_role_menu` VALUES ('380', '46', '20');
INSERT INTO `sys_role_menu` VALUES ('381', '46', '21');
INSERT INTO `sys_role_menu` VALUES ('382', '46', '22');
INSERT INTO `sys_role_menu` VALUES ('383', '46', '23');
INSERT INTO `sys_role_menu` VALUES ('384', '46', '11');
INSERT INTO `sys_role_menu` VALUES ('385', '46', '12');
INSERT INTO `sys_role_menu` VALUES ('386', '46', '13');
INSERT INTO `sys_role_menu` VALUES ('387', '46', '14');
INSERT INTO `sys_role_menu` VALUES ('388', '46', '24');
INSERT INTO `sys_role_menu` VALUES ('389', '46', '25');
INSERT INTO `sys_role_menu` VALUES ('390', '46', '26');
INSERT INTO `sys_role_menu` VALUES ('391', '46', '15');
INSERT INTO `sys_role_menu` VALUES ('392', '46', '2');
INSERT INTO `sys_role_menu` VALUES ('393', '46', '6');
INSERT INTO `sys_role_menu` VALUES ('394', '46', '7');
INSERT INTO `sys_role_menu` VALUES ('598', '50', '38');
INSERT INTO `sys_role_menu` VALUES ('632', '38', '42');
INSERT INTO `sys_role_menu` VALUES ('737', '51', '38');
INSERT INTO `sys_role_menu` VALUES ('738', '51', '39');
INSERT INTO `sys_role_menu` VALUES ('739', '51', '40');
INSERT INTO `sys_role_menu` VALUES ('740', '51', '41');
INSERT INTO `sys_role_menu` VALUES ('741', '51', '4');
INSERT INTO `sys_role_menu` VALUES ('742', '51', '32');
INSERT INTO `sys_role_menu` VALUES ('743', '51', '33');
INSERT INTO `sys_role_menu` VALUES ('744', '51', '34');
INSERT INTO `sys_role_menu` VALUES ('745', '51', '35');
INSERT INTO `sys_role_menu` VALUES ('746', '51', '27');
INSERT INTO `sys_role_menu` VALUES ('747', '51', '28');
INSERT INTO `sys_role_menu` VALUES ('748', '51', '29');
INSERT INTO `sys_role_menu` VALUES ('749', '51', '30');
INSERT INTO `sys_role_menu` VALUES ('750', '51', '1');
INSERT INTO `sys_role_menu` VALUES ('1064', '54', '53');
INSERT INTO `sys_role_menu` VALUES ('1095', '55', '2');
INSERT INTO `sys_role_menu` VALUES ('1096', '55', '6');
INSERT INTO `sys_role_menu` VALUES ('1097', '55', '7');
INSERT INTO `sys_role_menu` VALUES ('1098', '55', '3');
INSERT INTO `sys_role_menu` VALUES ('1099', '55', '50');
INSERT INTO `sys_role_menu` VALUES ('1100', '55', '49');
INSERT INTO `sys_role_menu` VALUES ('1101', '55', '1');
INSERT INTO `sys_role_menu` VALUES ('1856', '53', '28');
INSERT INTO `sys_role_menu` VALUES ('1857', '53', '29');
INSERT INTO `sys_role_menu` VALUES ('1858', '53', '30');
INSERT INTO `sys_role_menu` VALUES ('1859', '53', '27');
INSERT INTO `sys_role_menu` VALUES ('1860', '53', '57');
INSERT INTO `sys_role_menu` VALUES ('1861', '53', '71');
INSERT INTO `sys_role_menu` VALUES ('1862', '53', '48');
INSERT INTO `sys_role_menu` VALUES ('1863', '53', '72');
INSERT INTO `sys_role_menu` VALUES ('1864', '53', '1');
INSERT INTO `sys_role_menu` VALUES ('1865', '53', '7');
INSERT INTO `sys_role_menu` VALUES ('1866', '53', '55');
INSERT INTO `sys_role_menu` VALUES ('1867', '53', '56');
INSERT INTO `sys_role_menu` VALUES ('1868', '53', '62');
INSERT INTO `sys_role_menu` VALUES ('1869', '53', '15');
INSERT INTO `sys_role_menu` VALUES ('1870', '53', '2');
INSERT INTO `sys_role_menu` VALUES ('1871', '53', '61');
INSERT INTO `sys_role_menu` VALUES ('1872', '53', '20');
INSERT INTO `sys_role_menu` VALUES ('1873', '53', '21');
INSERT INTO `sys_role_menu` VALUES ('1874', '53', '22');
INSERT INTO `sys_role_menu` VALUES ('2084', '56', '68');
INSERT INTO `sys_role_menu` VALUES ('2085', '56', '60');
INSERT INTO `sys_role_menu` VALUES ('2086', '56', '59');
INSERT INTO `sys_role_menu` VALUES ('2087', '56', '58');
INSERT INTO `sys_role_menu` VALUES ('2088', '56', '51');
INSERT INTO `sys_role_menu` VALUES ('2089', '56', '50');
INSERT INTO `sys_role_menu` VALUES ('2090', '56', '49');
INSERT INTO `sys_role_menu` VALUES ('2247', '63', '-1');
INSERT INTO `sys_role_menu` VALUES ('2248', '63', '84');
INSERT INTO `sys_role_menu` VALUES ('2249', '63', '85');
INSERT INTO `sys_role_menu` VALUES ('2250', '63', '88');
INSERT INTO `sys_role_menu` VALUES ('2251', '63', '87');
INSERT INTO `sys_role_menu` VALUES ('2252', '64', '84');
INSERT INTO `sys_role_menu` VALUES ('2253', '64', '89');
INSERT INTO `sys_role_menu` VALUES ('2254', '64', '88');
INSERT INTO `sys_role_menu` VALUES ('2255', '64', '87');
INSERT INTO `sys_role_menu` VALUES ('2256', '64', '86');
INSERT INTO `sys_role_menu` VALUES ('2257', '64', '85');
INSERT INTO `sys_role_menu` VALUES ('2258', '65', '89');
INSERT INTO `sys_role_menu` VALUES ('2259', '65', '88');
INSERT INTO `sys_role_menu` VALUES ('2260', '65', '86');
INSERT INTO `sys_role_menu` VALUES ('2262', '67', '48');
INSERT INTO `sys_role_menu` VALUES ('2263', '68', '88');
INSERT INTO `sys_role_menu` VALUES ('2264', '68', '87');
INSERT INTO `sys_role_menu` VALUES ('2265', '69', '89');
INSERT INTO `sys_role_menu` VALUES ('2266', '69', '88');
INSERT INTO `sys_role_menu` VALUES ('2267', '69', '86');
INSERT INTO `sys_role_menu` VALUES ('2268', '69', '87');
INSERT INTO `sys_role_menu` VALUES ('2269', '69', '85');
INSERT INTO `sys_role_menu` VALUES ('2270', '69', '84');
INSERT INTO `sys_role_menu` VALUES ('2271', '70', '85');
INSERT INTO `sys_role_menu` VALUES ('2272', '70', '89');
INSERT INTO `sys_role_menu` VALUES ('2273', '70', '88');
INSERT INTO `sys_role_menu` VALUES ('2274', '70', '87');
INSERT INTO `sys_role_menu` VALUES ('2275', '70', '86');
INSERT INTO `sys_role_menu` VALUES ('2276', '70', '84');
INSERT INTO `sys_role_menu` VALUES ('2277', '71', '87');
INSERT INTO `sys_role_menu` VALUES ('2278', '72', '59');
INSERT INTO `sys_role_menu` VALUES ('2279', '73', '48');
INSERT INTO `sys_role_menu` VALUES ('2280', '74', '88');
INSERT INTO `sys_role_menu` VALUES ('2281', '74', '87');
INSERT INTO `sys_role_menu` VALUES ('2282', '75', '88');
INSERT INTO `sys_role_menu` VALUES ('2283', '75', '87');
INSERT INTO `sys_role_menu` VALUES ('2284', '76', '85');
INSERT INTO `sys_role_menu` VALUES ('2285', '76', '89');
INSERT INTO `sys_role_menu` VALUES ('2286', '76', '88');
INSERT INTO `sys_role_menu` VALUES ('2287', '76', '87');
INSERT INTO `sys_role_menu` VALUES ('2288', '76', '86');
INSERT INTO `sys_role_menu` VALUES ('2289', '76', '84');
INSERT INTO `sys_role_menu` VALUES ('2292', '78', '88');
INSERT INTO `sys_role_menu` VALUES ('2293', '78', '87');
INSERT INTO `sys_role_menu` VALUES ('2294', '78', null);
INSERT INTO `sys_role_menu` VALUES ('2295', '78', null);
INSERT INTO `sys_role_menu` VALUES ('2296', '78', null);
INSERT INTO `sys_role_menu` VALUES ('2308', '80', '87');
INSERT INTO `sys_role_menu` VALUES ('2309', '80', '86');
INSERT INTO `sys_role_menu` VALUES ('2310', '80', '-1');
INSERT INTO `sys_role_menu` VALUES ('2311', '80', '84');
INSERT INTO `sys_role_menu` VALUES ('2312', '80', '85');
INSERT INTO `sys_role_menu` VALUES ('2328', '79', '72');
INSERT INTO `sys_role_menu` VALUES ('2329', '79', '48');
INSERT INTO `sys_role_menu` VALUES ('2330', '79', '77');
INSERT INTO `sys_role_menu` VALUES ('2331', '79', '84');
INSERT INTO `sys_role_menu` VALUES ('2332', '79', '89');
INSERT INTO `sys_role_menu` VALUES ('2333', '79', '88');
INSERT INTO `sys_role_menu` VALUES ('2334', '79', '87');
INSERT INTO `sys_role_menu` VALUES ('2335', '79', '86');
INSERT INTO `sys_role_menu` VALUES ('2336', '79', '85');
INSERT INTO `sys_role_menu` VALUES ('2337', '79', '-1');
INSERT INTO `sys_role_menu` VALUES ('2338', '77', '89');
INSERT INTO `sys_role_menu` VALUES ('2339', '77', '88');
INSERT INTO `sys_role_menu` VALUES ('2340', '77', '87');
INSERT INTO `sys_role_menu` VALUES ('2341', '77', '86');
INSERT INTO `sys_role_menu` VALUES ('2342', '77', '85');
INSERT INTO `sys_role_menu` VALUES ('2343', '77', '84');
INSERT INTO `sys_role_menu` VALUES ('2344', '77', '72');
INSERT INTO `sys_role_menu` VALUES ('2345', '77', '-1');
INSERT INTO `sys_role_menu` VALUES ('2346', '77', '77');
INSERT INTO `sys_role_menu` VALUES ('2974', '1', '78');
INSERT INTO `sys_role_menu` VALUES ('2975', '1', '3');
INSERT INTO `sys_role_menu` VALUES ('2976', '1', '73');
INSERT INTO `sys_role_menu` VALUES ('2977', '1', '76');
INSERT INTO `sys_role_menu` VALUES ('2978', '1', '75');
INSERT INTO `sys_role_menu` VALUES ('2979', '1', '74');
INSERT INTO `sys_role_menu` VALUES ('2980', '1', '7');
INSERT INTO `sys_role_menu` VALUES ('2981', '1', '62');
INSERT INTO `sys_role_menu` VALUES ('2982', '1', '56');
INSERT INTO `sys_role_menu` VALUES ('2983', '1', '55');
INSERT INTO `sys_role_menu` VALUES ('2984', '1', '15');
INSERT INTO `sys_role_menu` VALUES ('2985', '1', '6');
INSERT INTO `sys_role_menu` VALUES ('2986', '1', '26');
INSERT INTO `sys_role_menu` VALUES ('2987', '1', '25');
INSERT INTO `sys_role_menu` VALUES ('2988', '1', '24');
INSERT INTO `sys_role_menu` VALUES ('2989', '1', '14');
INSERT INTO `sys_role_menu` VALUES ('2990', '1', '13');
INSERT INTO `sys_role_menu` VALUES ('2991', '1', '12');
INSERT INTO `sys_role_menu` VALUES ('2992', '1', '2');
INSERT INTO `sys_role_menu` VALUES ('2993', '1', '77');
INSERT INTO `sys_role_menu` VALUES ('2994', '1', '61');
INSERT INTO `sys_role_menu` VALUES ('2995', '1', '22');
INSERT INTO `sys_role_menu` VALUES ('2996', '1', '21');
INSERT INTO `sys_role_menu` VALUES ('2997', '1', '20');

-- ----------------------------
-- Table structure for `sys_task`
-- ----------------------------
DROP TABLE IF EXISTS `sys_task`;
CREATE TABLE `sys_task` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cron_expression` varchar(255) DEFAULT NULL COMMENT 'cron表达式',
  `method_name` varchar(255) DEFAULT NULL COMMENT '任务调用的方法名',
  `is_concurrent` varchar(255) DEFAULT NULL COMMENT '任务是否有状态',
  `description` varchar(255) DEFAULT NULL COMMENT '任务描述',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `bean_class` varchar(255) DEFAULT NULL COMMENT '任务执行时调用哪个类的方法 包名+类名',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `job_status` varchar(255) DEFAULT NULL COMMENT '任务状态',
  `job_group` varchar(255) DEFAULT NULL COMMENT '任务分组',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `spring_bean` varchar(255) DEFAULT NULL COMMENT 'Spring bean',
  `job_name` varchar(255) DEFAULT NULL COMMENT '任务名',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_task
-- ----------------------------
INSERT INTO `sys_task` VALUES ('2', '0/10 * * * * ?', 'run1', '1', '', '4028ea815a3d2a8c015a3d2f8d2a0002', 'com.bootdo.common.task.WelcomeJob', '2017-05-19 18:30:56', '0', 'group1', '2017-05-19 18:31:07', null, '', 'welcomJob');

-- ----------------------------
-- Table structure for `sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `name` varchar(100) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL COMMENT '密码',
  `dept_id` bigint(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) DEFAULT NULL COMMENT '手机号',
  `status` tinyint(255) DEFAULT NULL COMMENT '状态 0:禁用，1:正常',
  `user_id_create` bigint(255) DEFAULT NULL COMMENT '创建用户id',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL COMMENT '修改时间',
  `sex` bigint(32) DEFAULT NULL COMMENT '性别',
  `birth` datetime DEFAULT NULL COMMENT '出身日期',
  `pic_id` bigint(32) DEFAULT NULL,
  `live_address` varchar(500) DEFAULT NULL COMMENT '现居住地',
  `hobby` varchar(255) DEFAULT NULL COMMENT '爱好',
  `province` varchar(255) DEFAULT NULL COMMENT '省份',
  `city` varchar(255) DEFAULT NULL COMMENT '所在城市',
  `district` varchar(255) DEFAULT NULL COMMENT '所在地区',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=158 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', '超级管理员', 'd0af8fa1272ef5a152d9e27763eea293', '6', 'admin@example.com', '17699999999', '1', '1', '2017-08-15 21:40:39', '2017-08-15 21:41:00', '96', '2017-12-14 00:00:00', '138', 'ccc', '', '北京市', '北京市市辖区', '东城区');
INSERT INTO `sys_user` VALUES ('2', 'test', '临时用户', '6cf3bb3deba2aadbd41ec9a22511084e', '6', 'test@bootdo.com', null, '1', '1', '2017-08-14 13:43:05', '2017-08-14 21:15:36', null, null, null, null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('36', 'ldh', '刘德华', 'bfd9394475754fbe45866eba97738c36', '7', 'ldh@bootdo.com', null, '1', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('123', 'zxy', '张学友', '35174ba93f5fe7267f1fb3c1bf903781', '6', 'zxy@bootdo', null, '0', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('124', 'wyf', '吴亦凡', 'e179e6f687bbd57b9d7efc4746c8090a', '6', 'wyf@bootdo.com', null, '1', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('130', 'lh', '鹿晗', '7924710cd673f68967cde70e188bb097', '9', 'lh@bootdo.com', null, '1', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('131', 'lhc', '令狐冲', 'd515538e17ecb570ba40344b5618f5d4', '6', 'lhc@bootdo.com', null, '0', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('132', 'lyf', '刘亦菲', '7fdb1d9008f45950c1620ba0864e5fbd', '13', 'lyf@bootdo.com', null, '1', null, null, null, null, '2018-03-15 00:00:00', null, null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('134', 'lyh', '李彦宏', 'dc26092b3244d9d432863f2738180e19', '8', 'lyh@bootdo.com', null, '1', null, null, null, null, '2018-03-18 00:00:00', null, null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('135', 'wjl', '王健林', '3967697dfced162cf6a34080259b83aa', '6', 'wjl@bootod.com', null, '1', null, null, null, null, '2018-03-19 00:00:00', null, null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('136', 'gdg2', '郭德纲', '3bb1bda86bc02bf6478cd91e42135d2f', '9', 'gdg@bootdo.com', null, '1', null, null, null, null, '2018-03-07 00:00:00', null, null, null, null, null, null);
INSERT INTO `sys_user` VALUES ('156', 'test2', '测试二', '9f411bc8445132fba6bef0ee865f9d08', null, 'test2@bootdo', null, null, null, null, null, null, '2018-03-06 00:00:00', null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `sys_user_plus`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_plus`;
CREATE TABLE `sys_user_plus` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `payment` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_plus
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=158 DEFAULT CHARSET=utf8 COMMENT='用户与角色对应关系';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('73', '30', '48');
INSERT INTO `sys_user_role` VALUES ('74', '30', '49');
INSERT INTO `sys_user_role` VALUES ('75', '30', '50');
INSERT INTO `sys_user_role` VALUES ('76', '31', '48');
INSERT INTO `sys_user_role` VALUES ('77', '31', '49');
INSERT INTO `sys_user_role` VALUES ('78', '31', '52');
INSERT INTO `sys_user_role` VALUES ('79', '32', '48');
INSERT INTO `sys_user_role` VALUES ('80', '32', '49');
INSERT INTO `sys_user_role` VALUES ('81', '32', '50');
INSERT INTO `sys_user_role` VALUES ('82', '32', '51');
INSERT INTO `sys_user_role` VALUES ('83', '32', '52');
INSERT INTO `sys_user_role` VALUES ('84', '33', '38');
INSERT INTO `sys_user_role` VALUES ('85', '33', '49');
INSERT INTO `sys_user_role` VALUES ('86', '33', '52');
INSERT INTO `sys_user_role` VALUES ('87', '34', '50');
INSERT INTO `sys_user_role` VALUES ('88', '34', '51');
INSERT INTO `sys_user_role` VALUES ('89', '34', '52');
INSERT INTO `sys_user_role` VALUES ('106', '124', '1');
INSERT INTO `sys_user_role` VALUES ('110', '1', '1');
INSERT INTO `sys_user_role` VALUES ('111', '2', '1');
INSERT INTO `sys_user_role` VALUES ('123', '130', '1');
INSERT INTO `sys_user_role` VALUES ('124', null, '48');
INSERT INTO `sys_user_role` VALUES ('127', '123', '48');
INSERT INTO `sys_user_role` VALUES ('132', '36', '48');
INSERT INTO `sys_user_role` VALUES ('150', '156', '1');
INSERT INTO `sys_user_role` VALUES ('151', '136', '1');
INSERT INTO `sys_user_role` VALUES ('152', '135', '1');
INSERT INTO `sys_user_role` VALUES ('153', '134', '1');
INSERT INTO `sys_user_role` VALUES ('154', '134', '48');
INSERT INTO `sys_user_role` VALUES ('155', '134', '56');
INSERT INTO `sys_user_role` VALUES ('156', '131', '48');
INSERT INTO `sys_user_role` VALUES ('157', '131', '1');

-- ----------------------------
-- Table structure for `sys_user_token`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_token`;
CREATE TABLE `sys_user_token` (
  `user_id` bigint(20) NOT NULL,
  `token` varchar(100) NOT NULL COMMENT 'token',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统用户Token';

-- ----------------------------
-- Records of sys_user_token
-- ----------------------------
INSERT INTO `sys_user_token` VALUES ('1', 'b87fcf0a-1139-4079-a34f-5bc27957e458', '2018-01-18 11:29:29', '2018-01-18 10:59:29');
