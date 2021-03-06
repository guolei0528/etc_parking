SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS cf_column_enum;
DROP TABLE IF EXISTS INIT_PROPERTIES;
DROP TABLE IF EXISTS T_ROLE;
DROP TABLE IF EXISTS T_ROLE_MENU;
DROP TABLE IF EXISTS T_ROLE_USER;
DROP TABLE IF EXISTS T_ROLE_WXPAGE;
DROP TABLE IF EXISTS T_SYSUSER;
DROP TABLE IF EXISTS T_SYS_MENU;




/* Create Tables */

-- 枚举值数据表
CREATE TABLE cf_column_enum
(
	COLTYPE varchar(32) COMMENT 'COLTYPE',
	KEYNAME varchar(32) COMMENT 'KEYNAME',
	KEYVALUE int COMMENT 'KEYVALUE',
	KEYTEXT varchar(32) COMMENT 'KEYTEXT',
	CSS varchar(32) COMMENT 'CSS',
	SHOWORDER int COMMENT 'SHOWORDER',
	DETAILS varchar(32) COMMENT 'DETAILS',
	ATTR1 varchar(32) COMMENT 'ATTR1',
	ATTR2 varchar(32) COMMENT 'ATTR2',
	ATTR3 varchar(32) COMMENT 'ATTR3'
) COMMENT = '枚举值数据表';


-- 配置表信息
CREATE TABLE INIT_PROPERTIES
(
	PROP_KEY varchar(32) NOT NULL COMMENT '键值',
	PROP_VALUE varchar(128) NOT NULL COMMENT '值'
) COMMENT = '配置表信息';


-- 用户角色
CREATE TABLE T_ROLE
(
	ID varchar(32) NOT NULL COMMENT '流水号',
	NAME varchar(32) NOT NULL COMMENT '角色名称',
	REMARK varchar(512) COMMENT '备注',
	USER_TYPE int NOT NULL COMMENT '用户类型',
	OWNER_ID varchar(32) NOT NULL COMMENT '所有者ID',
	CREATE_TIME datetime NOT NULL COMMENT '创建时间',
	LAST_MODIFY_TIME datetime NOT NULL COMMENT '最后修改时间',
	DELETE_FLAG int NOT NULL COMMENT '删除标志位',
	PRIMARY KEY (ID)
) COMMENT = '用户角色';


-- 角色关联的菜单
CREATE TABLE T_ROLE_MENU
(
	ID int NOT NULL AUTO_INCREMENT COMMENT '流水号',
	ROLE_ID varchar(32) NOT NULL COMMENT '角色流水号',
	MENU_ID int NOT NULL COMMENT '菜单流水号',
	PRIMARY KEY (ID)
) COMMENT = '角色关联的菜单';


-- 用户关联的角色
CREATE TABLE T_ROLE_USER
(
	ID int NOT NULL AUTO_INCREMENT COMMENT '流水号',
	ROLE_ID varchar(32) NOT NULL COMMENT '角色流水号',
	USER_ID varchar(32) NOT NULL COMMENT '用户流水号',
	RELATED_TIME datetime NOT NULL COMMENT '关联时间',
	PRIMARY KEY (ID)
) COMMENT = '用户关联的角色';


-- 角色关联的微信首页
CREATE TABLE T_ROLE_WXPAGE
(
	ID int NOT NULL AUTO_INCREMENT COMMENT '流水号',
	ROLE_ID varchar(32) NOT NULL COMMENT '角色流水号',
	PAGE_ID int NOT NULL COMMENT '页面ID',
	PRIMARY KEY (ID)
) COMMENT = '角色关联的微信首页';


-- 系统用户 : 可管理后台系统的用户信息
CREATE TABLE T_SYSUSER
(
	ID int NOT NULL COMMENT '流水号',
	LOGIN_NAME varchar(32) NOT NULL COMMENT '用户名',
	PASSWORD varchar(32) NOT NULL COMMENT '密码',
	-- 1系统用户0普通用户
	USER_TYPE int NOT NULL COMMENT '用户类型 : 1系统用户0普通用户',
	PRIMARY KEY (ID)
) COMMENT = '系统用户 : 可管理后台系统的用户信息';


-- 系统菜单表
CREATE TABLE T_SYS_MENU
(
	ID int NOT NULL COMMENT '流水号',
	NAME varchar(32) NOT NULL COMMENT '名称',
	URL varchar(256) COMMENT '菜单对应的URL地址',
	PARENT_ID int COMMENT '父ID',
	SHOW_ORDER int NOT NULL COMMENT '显示顺序',
	USER_TYPE int NOT NULL COMMENT '用户类型',
	PRIMARY KEY (ID)
) COMMENT = '系统菜单表';



