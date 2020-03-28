/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.5.56 : Database - oa
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`oa` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `oa`;

/*Table structure for table `act_evt_log` */

DROP TABLE IF EXISTS `act_evt_log`;

CREATE TABLE `act_evt_log` (
  `LOG_NR_` bigint(20) NOT NULL AUTO_INCREMENT,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_STAMP_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DATA_` longblob,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp NULL DEFAULT NULL,
  `IS_PROCESSED_` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`LOG_NR_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_evt_log` */

/*Table structure for table `act_ge_bytearray` */

DROP TABLE IF EXISTS `act_ge_bytearray`;

CREATE TABLE `act_ge_bytearray` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTES_` longblob,
  `GENERATED_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_BYTEARR_DEPL` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_BYTEARR_DEPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ge_bytearray` */

/*Table structure for table `act_ge_property` */

DROP TABLE IF EXISTS `act_ge_property`;

CREATE TABLE `act_ge_property` (
  `NAME_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `VALUE_` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  PRIMARY KEY (`NAME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ge_property` */

insert  into `act_ge_property`(`NAME_`,`VALUE_`,`REV_`) values ('cfg.execution-related-entities-count','false',1),('next.dbid','1',1),('schema.history','create(6.0.0.4)',1),('schema.version','6.0.0.4',1);

/*Table structure for table `act_hi_actinst` */

DROP TABLE IF EXISTS `act_hi_actinst`;

CREATE TABLE `act_hi_actinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ACT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime NOT NULL,
  `END_TIME_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_ACT_INST_START` (`START_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_PROCINST` (`PROC_INST_ID_`,`ACT_ID_`),
  KEY `ACT_IDX_HI_ACT_INST_EXEC` (`EXECUTION_ID_`,`ACT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_actinst` */

/*Table structure for table `act_hi_attachment` */

DROP TABLE IF EXISTS `act_hi_attachment`;

CREATE TABLE `act_hi_attachment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `URL_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CONTENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_attachment` */

/*Table structure for table `act_hi_comment` */

DROP TABLE IF EXISTS `act_hi_comment`;

CREATE TABLE `act_hi_comment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime NOT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `MESSAGE_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `FULL_MSG_` longblob,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_comment` */

/*Table structure for table `act_hi_detail` */

DROP TABLE IF EXISTS `act_hi_detail`;

CREATE TABLE `act_hi_detail` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TIME_` datetime NOT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_DETAIL_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_ACT_INST` (`ACT_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_TIME` (`TIME_`),
  KEY `ACT_IDX_HI_DETAIL_NAME` (`NAME_`),
  KEY `ACT_IDX_HI_DETAIL_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_detail` */

/*Table structure for table `act_hi_identitylink` */

DROP TABLE IF EXISTS `act_hi_identitylink`;

CREATE TABLE `act_hi_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_TASK` (`TASK_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_identitylink` */

/*Table structure for table `act_hi_procinst` */

DROP TABLE IF EXISTS `act_hi_procinst`;

CREATE TABLE `act_hi_procinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `START_TIME_` datetime NOT NULL,
  `END_TIME_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `END_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `PROC_INST_ID_` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PRO_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_PRO_I_BUSKEY` (`BUSINESS_KEY_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_procinst` */

/*Table structure for table `act_hi_taskinst` */

DROP TABLE IF EXISTS `act_hi_taskinst`;

CREATE TABLE `act_hi_taskinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime NOT NULL,
  `CLAIM_TIME_` datetime DEFAULT NULL,
  `END_TIME_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `DUE_DATE_` datetime DEFAULT NULL,
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_TASK_INST_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_taskinst` */

/*Table structure for table `act_hi_varinst` */

DROP TABLE IF EXISTS `act_hi_varinst`;

CREATE TABLE `act_hi_varinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime DEFAULT NULL,
  `LAST_UPDATED_TIME_` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_PROCVAR_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PROCVAR_NAME_TYPE` (`NAME_`,`VAR_TYPE_`),
  KEY `ACT_IDX_HI_PROCVAR_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_hi_varinst` */

/*Table structure for table `act_id_group` */

DROP TABLE IF EXISTS `act_id_group`;

CREATE TABLE `act_id_group` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_group` */

/*Table structure for table `act_id_info` */

DROP TABLE IF EXISTS `act_id_info`;

CREATE TABLE `act_id_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `VALUE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PASSWORD_` longblob,
  `PARENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_info` */

/*Table structure for table `act_id_membership` */

DROP TABLE IF EXISTS `act_id_membership`;

CREATE TABLE `act_id_membership` (
  `USER_ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `GROUP_ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`USER_ID_`,`GROUP_ID_`),
  KEY `ACT_FK_MEMB_GROUP` (`GROUP_ID_`),
  CONSTRAINT `ACT_FK_MEMB_GROUP` FOREIGN KEY (`GROUP_ID_`) REFERENCES `act_id_group` (`ID_`),
  CONSTRAINT `ACT_FK_MEMB_USER` FOREIGN KEY (`USER_ID_`) REFERENCES `act_id_user` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_membership` */

/*Table structure for table `act_id_user` */

DROP TABLE IF EXISTS `act_id_user`;

CREATE TABLE `act_id_user` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `FIRST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LAST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EMAIL_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PWD_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PICTURE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_id_user` */

/*Table structure for table `act_procdef_info` */

DROP TABLE IF EXISTS `act_procdef_info`;

CREATE TABLE `act_procdef_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `INFO_JSON_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_IDX_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_INFO_JSON_BA` (`INFO_JSON_ID_`),
  CONSTRAINT `ACT_FK_INFO_JSON_BA` FOREIGN KEY (`INFO_JSON_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_INFO_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_procdef_info` */

/*Table structure for table `act_re_deployment` */

DROP TABLE IF EXISTS `act_re_deployment`;

CREATE TABLE `act_re_deployment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `DEPLOY_TIME_` timestamp NULL DEFAULT NULL,
  `ENGINE_VERSION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_re_deployment` */

/*Table structure for table `act_re_model` */

DROP TABLE IF EXISTS `act_re_model`;

CREATE TABLE `act_re_model` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp NULL DEFAULT NULL,
  `LAST_UPDATE_TIME_` timestamp NULL DEFAULT NULL,
  `VERSION_` int(11) DEFAULT NULL,
  `META_INFO_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_EXTRA_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_MODEL_SOURCE` (`EDITOR_SOURCE_VALUE_ID_`),
  KEY `ACT_FK_MODEL_SOURCE_EXTRA` (`EDITOR_SOURCE_EXTRA_VALUE_ID_`),
  KEY `ACT_FK_MODEL_DEPLOYMENT` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_MODEL_DEPLOYMENT` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE` FOREIGN KEY (`EDITOR_SOURCE_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE_EXTRA` FOREIGN KEY (`EDITOR_SOURCE_EXTRA_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_re_model` */

/*Table structure for table `act_re_procdef` */

DROP TABLE IF EXISTS `act_re_procdef`;

CREATE TABLE `act_re_procdef` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DGRM_RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `HAS_START_FORM_KEY_` tinyint(4) DEFAULT NULL,
  `HAS_GRAPHICAL_NOTATION_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `ENGINE_VERSION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_PROCDEF` (`KEY_`,`VERSION_`,`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_re_procdef` */

/*Table structure for table `act_ru_deadletter_job` */

DROP TABLE IF EXISTS `act_ru_deadletter_job`;

CREATE TABLE `act_ru_deadletter_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_DEADLETTER_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_DEADLETTER_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_DEADLETTER_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_DEADLETTER_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_DEADLETTER_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_deadletter_job` */

/*Table structure for table `act_ru_event_subscr` */

DROP TABLE IF EXISTS `act_ru_event_subscr`;

CREATE TABLE `act_ru_event_subscr` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `EVENT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EVENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTIVITY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CONFIGURATION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATED_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EVENT_SUBSCR_CONFIG_` (`CONFIGURATION_`),
  KEY `ACT_FK_EVENT_EXEC` (`EXECUTION_ID_`),
  CONSTRAINT `ACT_FK_EVENT_EXEC` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_event_subscr` */

/*Table structure for table `act_ru_execution` */

DROP TABLE IF EXISTS `act_ru_execution`;

CREATE TABLE `act_ru_execution` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_EXEC_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ROOT_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `IS_ACTIVE_` tinyint(4) DEFAULT NULL,
  `IS_CONCURRENT_` tinyint(4) DEFAULT NULL,
  `IS_SCOPE_` tinyint(4) DEFAULT NULL,
  `IS_EVENT_SCOPE_` tinyint(4) DEFAULT NULL,
  `IS_MI_ROOT_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `CACHED_ENT_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp NULL DEFAULT NULL,
  `IS_COUNT_ENABLED_` tinyint(4) DEFAULT NULL,
  `EVT_SUBSCR_COUNT_` int(11) DEFAULT NULL,
  `TASK_COUNT_` int(11) DEFAULT NULL,
  `JOB_COUNT_` int(11) DEFAULT NULL,
  `TIMER_JOB_COUNT_` int(11) DEFAULT NULL,
  `SUSP_JOB_COUNT_` int(11) DEFAULT NULL,
  `DEADLETTER_JOB_COUNT_` int(11) DEFAULT NULL,
  `VAR_COUNT_` int(11) DEFAULT NULL,
  `ID_LINK_COUNT_` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EXEC_BUSKEY` (`BUSINESS_KEY_`),
  KEY `ACT_IDC_EXEC_ROOT` (`ROOT_PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PARENT` (`PARENT_ID_`),
  KEY `ACT_FK_EXE_SUPER` (`SUPER_EXEC_`),
  KEY `ACT_FK_EXE_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_EXE_PARENT` FOREIGN KEY (`PARENT_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE,
  CONSTRAINT `ACT_FK_EXE_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ACT_FK_EXE_SUPER` FOREIGN KEY (`SUPER_EXEC_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_execution` */

/*Table structure for table `act_ru_identitylink` */

DROP TABLE IF EXISTS `act_ru_identitylink`;

CREATE TABLE `act_ru_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_IDENT_LNK_GROUP` (`GROUP_ID_`),
  KEY `ACT_IDX_ATHRZ_PROCEDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_TSKASS_TASK` (`TASK_ID_`),
  KEY `ACT_FK_IDL_PROCINST` (`PROC_INST_ID_`),
  CONSTRAINT `ACT_FK_ATHRZ_PROCEDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_IDL_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TSKASS_TASK` FOREIGN KEY (`TASK_ID_`) REFERENCES `act_ru_task` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_identitylink` */

/*Table structure for table `act_ru_job` */

DROP TABLE IF EXISTS `act_ru_job`;

CREATE TABLE `act_ru_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_job` */

/*Table structure for table `act_ru_suspended_job` */

DROP TABLE IF EXISTS `act_ru_suspended_job`;

CREATE TABLE `act_ru_suspended_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_SUSPENDED_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_SUSPENDED_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_SUSPENDED_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_SUSPENDED_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_SUSPENDED_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_suspended_job` */

/*Table structure for table `act_ru_task` */

DROP TABLE IF EXISTS `act_ru_task`;

CREATE TABLE `act_ru_task` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DELEGATION_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `CREATE_TIME_` timestamp NULL DEFAULT NULL,
  `DUE_DATE_` datetime DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CLAIM_TIME_` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_TASK_CREATE` (`CREATE_TIME_`),
  KEY `ACT_FK_TASK_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_TASK_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_TASK_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_TASK_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_task` */

/*Table structure for table `act_ru_timer_job` */

DROP TABLE IF EXISTS `act_ru_timer_job`;

CREATE TABLE `act_ru_timer_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_TIMER_JOB_EXECUTION` (`EXECUTION_ID_`),
  KEY `ACT_FK_TIMER_JOB_PROCESS_INSTANCE` (`PROCESS_INSTANCE_ID_`),
  KEY `ACT_FK_TIMER_JOB_PROC_DEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_TIMER_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_EXECUTION` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_PROCESS_INSTANCE` FOREIGN KEY (`PROCESS_INSTANCE_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TIMER_JOB_PROC_DEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_timer_job` */

/*Table structure for table `act_ru_variable` */

DROP TABLE IF EXISTS `act_ru_variable`;

CREATE TABLE `act_ru_variable` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_VARIABLE_TASK_ID` (`TASK_ID_`),
  KEY `ACT_FK_VAR_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_VAR_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_VAR_BYTEARRAY` (`BYTEARRAY_ID_`),
  CONSTRAINT `ACT_FK_VAR_BYTEARRAY` FOREIGN KEY (`BYTEARRAY_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

/*Data for the table `act_ru_variable` */

/*Table structure for table `sys_dept` */

DROP TABLE IF EXISTS `sys_dept`;

CREATE TABLE `sys_dept` (
  `DEPT_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `PID` bigint(20) DEFAULT NULL COMMENT '父部门id',
  `PIDS` varchar(512) DEFAULT NULL COMMENT '父级ids',
  `SIMPLE_NAME` varchar(45) DEFAULT NULL COMMENT '简称',
  `FULL_NAME` varchar(255) DEFAULT NULL COMMENT '全称',
  `DESCRIPTION` varchar(255) DEFAULT NULL COMMENT '描述',
  `VERSION` int(11) DEFAULT NULL COMMENT '版本（乐观锁保留字段）',
  `SORT` int(11) DEFAULT NULL COMMENT '排序',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `UPDATE_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`DEPT_ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='部门表';

/*Data for the table `sys_dept` */

insert  into `sys_dept`(`DEPT_ID`,`PID`,`PIDS`,`SIMPLE_NAME`,`FULL_NAME`,`DESCRIPTION`,`VERSION`,`SORT`,`CREATE_TIME`,`UPDATE_TIME`,`CREATE_USER`,`UPDATE_USER`) values (24,0,'[0],','公司董事会','公司董事会','',NULL,1,NULL,NULL,NULL,NULL),(25,24,'[0],[24],','总经办','总经办','',NULL,2,NULL,NULL,NULL,NULL),(26,24,'[0],[24],','行政办公室','行政办公室','',NULL,3,NULL,NULL,NULL,NULL),(27,24,'[0],[24],','销售部','销售部','',NULL,4,NULL,NULL,NULL,NULL),(29,24,'[0],[24],','人力资源部','人力资源部','',NULL,5,NULL,NULL,NULL,NULL);

/*Table structure for table `sys_dict` */

DROP TABLE IF EXISTS `sys_dict`;

CREATE TABLE `sys_dict` (
  `DICT_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `PID` bigint(20) DEFAULT NULL COMMENT '父级字典id',
  `NAME` varchar(255) DEFAULT NULL COMMENT '字典名称',
  `CODE` varchar(255) DEFAULT NULL COMMENT '字典的编码',
  `DESCRIPTION` varchar(255) DEFAULT NULL COMMENT '字典描述',
  `SORT` int(11) DEFAULT NULL COMMENT '排序',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `UPDATE_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`DICT_ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='字典表';

/*Data for the table `sys_dict` */

insert  into `sys_dict`(`DICT_ID`,`PID`,`NAME`,`CODE`,`DESCRIPTION`,`SORT`,`CREATE_TIME`,`UPDATE_TIME`,`CREATE_USER`,`UPDATE_USER`) values (50,0,'性别','SEX','',0,NULL,NULL,NULL,NULL),(51,50,'男','M',NULL,1,NULL,NULL,NULL,NULL),(52,50,'女','F',NULL,2,NULL,NULL,NULL,NULL),(53,0,'状态','STATUS','',0,NULL,NULL,NULL,NULL),(54,53,'启用','ENABLE',NULL,1,NULL,NULL,NULL,NULL),(55,53,'禁用','DISABLE',NULL,2,NULL,NULL,NULL,NULL),(56,0,'账号状态','ACCOUNT_STATUS','',0,NULL,NULL,NULL,NULL),(57,56,'启用','ENABLE',NULL,1,NULL,NULL,NULL,NULL),(58,56,'冻结','FREEZE',NULL,2,NULL,NULL,NULL,NULL),(59,56,'已删除','DELETED',NULL,3,NULL,NULL,NULL,NULL),(60,0,'是否删除','DEL_FLAG','用于数据库中是否删除的标记',NULL,'2018-12-09 11:43:51',NULL,1,NULL),(61,60,'已经删除','Y','',NULL,'2018-12-09 11:44:07',NULL,1,NULL),(62,61,'未删除','N','',NULL,'2018-12-09 11:44:16',NULL,1,NULL);

/*Table structure for table `sys_file_info` */

DROP TABLE IF EXISTS `sys_file_info`;

CREATE TABLE `sys_file_info` (
  `FILE_ID` varchar(50) NOT NULL COMMENT '主键id',
  `FILE_DATA` text COMMENT 'base64编码的文件',
  `FILE_NAME` varchar(500) DEFAULT NULL COMMENT '图片名字',
  `LEAVE_ID` bigint(20) DEFAULT NULL COMMENT '请假信息ID',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `UPDATE_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建用户',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '修改用户',
  PRIMARY KEY (`FILE_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='文件信息表\r\n';

/*Data for the table `sys_file_info` */

insert  into `sys_file_info`(`FILE_ID`,`FILE_DATA`,`FILE_NAME`,`LEAVE_ID`,`CREATE_TIME`,`UPDATE_TIME`,`CREATE_USER`,`UPDATE_USER`) values ('1240453763198619649','/assets/common/upload/1240453763106344961QQ头像.png','1240453763106344961QQ头像.png',0,'2020-03-19 09:43:18',NULL,NULL,NULL),('1241297445049188355','/assets/common/upload/12412974450491883541222078390371172359女歌手.jpg','12412974450491883541222078390371172359女歌手.jpg',1241297445040799746,'2020-03-21 17:35:47',NULL,NULL,NULL);

/*Table structure for table `sys_leave_request` */

DROP TABLE IF EXISTS `sys_leave_request`;

CREATE TABLE `sys_leave_request` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '请假编号',
  `title` varchar(500) NOT NULL COMMENT '请假标题',
  `startDate` datetime NOT NULL COMMENT '开始时间',
  `endDate` datetime NOT NULL COMMENT '结束时间',
  `dates` varchar(500) NOT NULL COMMENT '请假天数',
  `note` text NOT NULL COMMENT '请假备注',
  `uid` bigint(20) NOT NULL COMMENT '请假用户',
  `status` varchar(2) DEFAULT '0' COMMENT '状态（0：未审批，1：已审批,2：已结束）',
  PRIMARY KEY (`id`),
  KEY `uid_user_id` (`uid`),
  CONSTRAINT `uid_user_id` FOREIGN KEY (`uid`) REFERENCES `sys_user` (`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1241297445040799747 DEFAULT CHARSET=utf8;

/*Data for the table `sys_leave_request` */

insert  into `sys_leave_request`(`id`,`title`,`startDate`,`endDate`,`dates`,`note`,`uid`,`status`) values (1232165909745897473,'急急急','2020-02-26 00:00:00','2020-02-28 00:00:00','2天整','<img src=\"/assets/common/upload/12321659306461143061222078390371172353朴树.jpg\" alt=\"12321659306461143061222078390371172353朴树.jpg\">',1,'1'),(1232166685847326721,'急急急','2020-02-27 00:00:00','2020-02-29 00:00:00','2天整','<img src=\"http://localhost:51/assets/common/layui/images/face/70.gif\" alt=\"[蜡烛]\">',1206115250404966404,'1'),(1232170861587333121,'急急急','2020-02-26 00:00:00','2020-02-28 00:00:00','2天整','<img src=\"/assets/common/upload/12321708827434024971222078390371172359女歌手.jpg\" alt=\"12321708827434024971222078390371172359女歌手.jpg\">',1206115250404966404,'0'),(1239090278221017089,'仅供测试','2020-03-16 00:00:00','2020-03-21 00:00:00','5天整','<img src=\"/assets/common/upload/1239090948953141249S00310-16315658.jpg\" alt=\"1239090948953141249S00310-16315658.jpg\">',1206115250404966402,'2'),(1239173827657789441,'测试','2020-03-16 00:00:00','2020-03-18 00:00:00','2天整','<img src=\"http://yxin.shop/assets/common/layui/images/face/1.gif\" alt=\"[嘻嘻]\">',1206115250404966407,'1'),(1239176962048585730,'测试病假','2020-03-16 00:00:00','2020-03-19 00:00:00','3天整','<img src=\"http://yxin.shop/assets/common/layui/images/face/0.gif\" alt=\"[微笑]\">',2,'1'),(1239177625981743106,'病假','2020-03-16 00:00:00','2020-03-27 00:00:00','11天整','<img src=\"http://yxin.shop/assets/common/layui/images/face/0.gif\" alt=\"[微笑]\">',1,'1'),(1241297445040799746,'151','2020-03-22 00:00:00','2020-03-23 00:00:00','1天整','<img src=\"http://yxin.shop/assets/common/layui/images/face/0.gif\" alt=\"[微笑]\">',2,'1');

/*Table structure for table `sys_login_log` */

DROP TABLE IF EXISTS `sys_login_log`;

CREATE TABLE `sys_login_log` (
  `LOGIN_LOG_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `LOG_NAME` varchar(255) DEFAULT NULL COMMENT '日志名称',
  `USER_ID` bigint(20) DEFAULT NULL COMMENT '管理员id',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `SUCCEED` varchar(255) DEFAULT NULL COMMENT '是否执行成功',
  `MESSAGE` text COMMENT '具体消息',
  `IP_ADDRESS` varchar(255) DEFAULT NULL COMMENT '登录ip',
  PRIMARY KEY (`LOGIN_LOG_ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1243796114021335042 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='登录记录';

/*Data for the table `sys_login_log` */

insert  into `sys_login_log`(`LOGIN_LOG_ID`,`LOG_NAME`,`USER_ID`,`CREATE_TIME`,`SUCCEED`,`MESSAGE`,`IP_ADDRESS`) values (1241323998608998402,'退出日志',1,'2020-03-21 19:21:18','成功',NULL,'0:0:0:0:0:0:0:1'),(1241327823231217666,'退出日志',1206115250404966406,'2020-03-21 19:36:30','成功',NULL,'0:0:0:0:0:0:0:1'),(1241330394196963330,'退出日志',1206115250404966406,'2020-03-21 19:46:43','成功',NULL,'0:0:0:0:0:0:0:1'),(1242289752644808706,'登录日志',1,'2020-03-24 11:18:52','成功',NULL,'0:0:0:0:0:0:0:1'),(1242292303775690754,'退出日志',1,'2020-03-24 11:29:00','成功',NULL,'0:0:0:0:0:0:0:1'),(1242292349791399937,'登录失败日志',NULL,'2020-03-24 11:29:11','成功','账号:dlam,账号密码错误','0:0:0:0:0:0:0:1'),(1242292379994583042,'登录日志',1206115250404966402,'2020-03-24 11:29:18','成功',NULL,'0:0:0:0:0:0:0:1'),(1242294440832299009,'退出日志',1206115250404966402,'2020-03-24 11:37:30','成功',NULL,'0:0:0:0:0:0:0:1'),(1242294473069719553,'登录失败日志',NULL,'2020-03-24 11:37:37','成功','账号:admin,账号密码错误','0:0:0:0:0:0:0:1'),(1242294494339035137,'登录失败日志',NULL,'2020-03-24 11:37:42','成功','账号:admin,账号密码错误','0:0:0:0:0:0:0:1'),(1242294540048560129,'登录失败日志',NULL,'2020-03-24 11:37:53','成功','账号:admin,账号密码错误','0:0:0:0:0:0:0:1'),(1242294566061633538,'登录失败日志',NULL,'2020-03-24 11:37:59','成功','账号:admin,账号密码错误','0:0:0:0:0:0:0:1'),(1242294587926540290,'登录日志',1,'2020-03-24 11:38:05','成功',NULL,'0:0:0:0:0:0:0:1'),(1242301873185136641,'退出日志',1,'2020-03-24 12:07:02','成功',NULL,'0:0:0:0:0:0:0:1'),(1242957610265718785,'退出日志',1,'2020-03-26 07:32:41','成功',NULL,'127.0.0.1'),(1242980658679185410,'登录日志',1,'2020-03-26 09:04:17','成功',NULL,'127.0.0.1'),(1243747647592906754,'登录日志',1,'2020-03-28 11:52:01','成功',NULL,'127.0.0.1'),(1243796114021335041,'登录日志',1,'2020-03-28 15:04:36','成功',NULL,'127.0.0.1');

/*Table structure for table `sys_menu` */

DROP TABLE IF EXISTS `sys_menu`;

CREATE TABLE `sys_menu` (
  `MENU_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `CODE` varchar(255) DEFAULT NULL COMMENT '菜单编号',
  `PCODE` varchar(255) DEFAULT NULL COMMENT '菜单父编号',
  `PCODES` varchar(255) DEFAULT NULL COMMENT '当前菜单的所有父菜单编号',
  `NAME` varchar(255) DEFAULT NULL COMMENT '菜单名称',
  `ICON` varchar(255) DEFAULT NULL COMMENT '菜单图标',
  `URL` varchar(255) DEFAULT NULL COMMENT 'url地址',
  `SORT` int(65) DEFAULT NULL COMMENT '菜单排序号',
  `LEVELS` int(65) DEFAULT NULL COMMENT '菜单层级',
  `MENU_FLAG` varchar(32) DEFAULT NULL COMMENT '是否是菜单(字典)',
  `DESCRIPTION` varchar(255) DEFAULT NULL COMMENT '备注',
  `STATUS` varchar(32) DEFAULT 'ENABLE' COMMENT '菜单状态(字典)',
  `NEW_PAGE_FLAG` varchar(32) DEFAULT NULL COMMENT '是否打开新页面的标识(字典)',
  `OPEN_FLAG` varchar(32) DEFAULT NULL COMMENT '是否打开(字典)',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `UPDATE_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`MENU_ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1203356119329644550 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='菜单表';

/*Data for the table `sys_menu` */

insert  into `sys_menu`(`MENU_ID`,`CODE`,`PCODE`,`PCODES`,`NAME`,`ICON`,`URL`,`SORT`,`LEVELS`,`MENU_FLAG`,`DESCRIPTION`,`STATUS`,`NEW_PAGE_FLAG`,`OPEN_FLAG`,`CREATE_TIME`,`UPDATE_TIME`,`CREATE_USER`,`UPDATE_USER`) values (105,'system','0','[0],','系统管理','layui-icon layui-icon-snowflake','#',30,1,'Y',NULL,'ENABLE',NULL,'1',NULL,NULL,NULL,NULL),(106,'mgr','system','[0],[system],','用户管理','','/mgr',1,2,'Y',NULL,'ENABLE',NULL,'0',NULL,NULL,NULL,NULL),(107,'mgr_add','mgr','[0],[system],[mgr],','添加用户',NULL,'/mgr/add',1,3,'N',NULL,'ENABLE',NULL,'0',NULL,NULL,NULL,NULL),(108,'mgr_edit','mgr','[0],[system],[mgr],','修改用户',NULL,'/mgr/edit',2,3,'N',NULL,'ENABLE',NULL,'0',NULL,NULL,NULL,NULL),(109,'mgr_delete','mgr','[0],[system],[mgr],','删除用户',NULL,'/mgr/delete',3,3,'N',NULL,'ENABLE',NULL,'0',NULL,NULL,NULL,NULL),(110,'mgr_reset','mgr','[0],[system],[mgr],','重置密码',NULL,'/mgr/reset',4,3,'N',NULL,'ENABLE',NULL,'0',NULL,NULL,NULL,NULL),(111,'mgr_freeze','mgr','[0],[system],[mgr],','冻结用户',NULL,'/mgr/freeze',5,3,'N',NULL,'ENABLE',NULL,'0',NULL,NULL,NULL,NULL),(112,'mgr_unfreeze','mgr','[0],[system],[mgr],','解除冻结用户',NULL,'/mgr/unfreeze',6,3,'N',NULL,'ENABLE',NULL,'0',NULL,NULL,NULL,NULL),(113,'mgr_setRole','mgr','[0],[system],[mgr],','分配角色',NULL,'/mgr/setRole',7,3,'N',NULL,'ENABLE',NULL,'0',NULL,NULL,NULL,NULL),(114,'role','system','[0],[system],','角色管理',NULL,'/role',2,2,'Y',NULL,'ENABLE',NULL,'0',NULL,NULL,NULL,NULL),(115,'role_add','role','[0],[system],[role],','添加角色',NULL,'/role/add',1,3,'N',NULL,'ENABLE',NULL,'0',NULL,NULL,NULL,NULL),(116,'role_edit','role','[0],[system],[role],','修改角色',NULL,'/role/edit',2,3,'N',NULL,'ENABLE',NULL,'0',NULL,NULL,NULL,NULL),(117,'role_remove','role','[0],[system],[role],','删除角色',NULL,'/role/remove',3,3,'N',NULL,'ENABLE',NULL,'0',NULL,NULL,NULL,NULL),(118,'role_setAuthority','role','[0],[system],[role],','配置权限',NULL,'/role/setAuthority',4,3,'N',NULL,'ENABLE',NULL,'0',NULL,NULL,NULL,NULL),(119,'menu','system','[0],[system],','菜单管理',NULL,'/menu',4,2,'Y',NULL,'ENABLE',NULL,'0',NULL,NULL,NULL,NULL),(120,'menu_add','menu','[0],[system],[menu],','添加菜单',NULL,'/menu/add',1,3,'N',NULL,'ENABLE',NULL,'0',NULL,NULL,NULL,NULL),(121,'menu_edit','menu','[0],[system],[menu],','修改菜单',NULL,'/menu/edit',2,3,'N',NULL,'ENABLE',NULL,'0',NULL,NULL,NULL,NULL),(122,'menu_remove','menu','[0],[system],[menu],','删除菜单',NULL,'/menu/remove',3,3,'N',NULL,'ENABLE',NULL,'0',NULL,NULL,NULL,NULL),(128,'log','system','[0],[system],','业务日志',NULL,'/log',6,2,'Y',NULL,'ENABLE',NULL,'0',NULL,NULL,NULL,NULL),(130,'druid','system','[0],[system],','监控管理',NULL,'/druid',7,2,'Y',NULL,'ENABLE',NULL,NULL,NULL,NULL,NULL,NULL),(131,'dept','system','[0],[system],','部门管理',NULL,'/dept',3,2,'Y',NULL,'ENABLE',NULL,NULL,NULL,NULL,NULL,NULL),(132,'dict','system','[0],[system],','字典管理',NULL,'/dict',4,2,'Y',NULL,'ENABLE',NULL,NULL,NULL,NULL,NULL,NULL),(133,'loginLog','system','[0],[system],','登录日志',NULL,'/loginLog',6,2,'Y',NULL,'ENABLE',NULL,NULL,NULL,NULL,NULL,NULL),(134,'log_clean','log','[0],[system],[log],','清空日志',NULL,'/log/delLog',3,3,'N',NULL,'ENABLE',NULL,NULL,NULL,NULL,NULL,NULL),(135,'dept_add','dept','[0],[system],[dept],','添加部门',NULL,'/dept/add',1,3,'N',NULL,'ENABLE',NULL,NULL,NULL,NULL,NULL,NULL),(136,'dept_update','dept','[0],[system],[dept],','修改部门',NULL,'/dept/update',1,3,'N',NULL,'ENABLE',NULL,NULL,NULL,NULL,NULL,NULL),(137,'dept_delete','dept','[0],[system],[dept],','删除部门',NULL,'/dept/delete',1,3,'N',NULL,'ENABLE',NULL,NULL,NULL,NULL,NULL,NULL),(138,'dict_add','dict','[0],[system],[dict],','添加字典',NULL,'/dict/add',1,3,'N',NULL,'ENABLE',NULL,NULL,NULL,NULL,NULL,NULL),(139,'dict_update','dict','[0],[system],[dict],','修改字典',NULL,'/dict/update',1,3,'N',NULL,'ENABLE',NULL,NULL,NULL,NULL,NULL,NULL),(140,'dict_delete','dict','[0],[system],[dict],','删除字典',NULL,'/dict/delete',1,3,'N',NULL,'ENABLE',NULL,NULL,NULL,NULL,NULL,NULL),(141,'notice','system','[0],[system],','通知管理',NULL,'/notice',9,2,'Y',NULL,'ENABLE',NULL,NULL,NULL,NULL,NULL,NULL),(142,'notice_add','notice','[0],[system],[notice],','添加通知',NULL,'/notice/add',1,3,'N',NULL,'ENABLE',NULL,NULL,NULL,NULL,NULL,NULL),(143,'notice_update','notice','[0],[system],[notice],','修改通知',NULL,'/notice/update',2,3,'N',NULL,'ENABLE',NULL,NULL,NULL,NULL,NULL,NULL),(144,'notice_delete','notice','[0],[system],[notice],','删除通知',NULL,'/notice/delete',3,3,'N',NULL,'ENABLE',NULL,NULL,NULL,NULL,NULL,NULL),(149,'api_mgr','dev_tools','[0],[dev_tools],','接口文档','fa-leaf','/swagger-ui.html',2,2,'Y',NULL,'ENABLE',NULL,NULL,NULL,NULL,NULL,NULL),(150,'to_menu_edit','menu','[0],[system],[menu],','菜单编辑跳转','','/menu/menu_edit',4,3,'N',NULL,'ENABLE',NULL,NULL,NULL,NULL,NULL,NULL),(151,'menu_list','menu','[0],[system],[menu],','菜单列表','layui-icon layui-icon-rate-half','/menu/list',5,3,'N',NULL,'ENABLE',NULL,NULL,NULL,NULL,NULL,NULL),(152,'to_dept_update','dept','[0],[system],[dept],','修改部门跳转','','/dept/dept_update',4,3,'N',NULL,'ENABLE',NULL,NULL,NULL,NULL,NULL,NULL),(153,'dept_list','dept','[0],[system],[dept],','部门列表','','/dept/list',5,3,'N',NULL,'ENABLE',NULL,NULL,NULL,NULL,NULL,NULL),(154,'dept_detail','dept','[0],[system],[dept],','部门详情','','/dept/detail',6,3,'N',NULL,'ENABLE',NULL,NULL,NULL,NULL,NULL,NULL),(155,'to_dict_edit','dict','[0],[system],[dict],','修改菜单跳转','','/dict/dict_edit',4,3,'N',NULL,'ENABLE',NULL,NULL,NULL,NULL,NULL,NULL),(156,'dict_list','dict','[0],[system],[dict],','字典列表','','/dict/list',5,3,'N',NULL,'ENABLE',NULL,NULL,NULL,NULL,NULL,NULL),(157,'dict_detail','dict','[0],[system],[dict],','字典详情','','/dict/detail',6,3,'N',NULL,'ENABLE',NULL,NULL,NULL,NULL,NULL,NULL),(158,'log_list','log','[0],[system],[log],','日志列表','','/log/list',2,3,'N',NULL,'ENABLE',NULL,NULL,NULL,NULL,NULL,NULL),(159,'log_detail','log','[0],[system],[log],','日志详情','','/log/detail',3,3,'N',NULL,'ENABLE',NULL,NULL,NULL,NULL,NULL,NULL),(160,'del_login_log','loginLog','[0],[system],[loginLog],','清空登录日志','','/loginLog/delLoginLog',1,3,'N',NULL,'ENABLE',NULL,NULL,NULL,NULL,NULL,NULL),(161,'login_log_list','loginLog','[0],[system],[loginLog],','登录日志列表','','/loginLog/list',2,3,'N',NULL,'ENABLE',NULL,NULL,NULL,NULL,NULL,NULL),(162,'to_role_edit','role','[0],[system],[role],','修改角色跳转','','/role/role_edit',5,3,'N',NULL,'ENABLE',NULL,NULL,NULL,NULL,NULL,NULL),(163,'to_role_assign','role','[0],[system],[role],','角色分配跳转','','/role/role_assign',6,3,'N',NULL,'ENABLE',NULL,NULL,NULL,NULL,NULL,NULL),(164,'role_list','role','[0],[system],[role],','角色列表','','/role/list',7,3,'N',NULL,'ENABLE',NULL,NULL,NULL,NULL,NULL,NULL),(165,'to_assign_role','mgr','[0],[system],[mgr],','分配角色跳转','','/mgr/role_assign',8,3,'N',NULL,'ENABLE',NULL,NULL,NULL,NULL,NULL,NULL),(166,'to_user_edit','mgr','[0],[system],[mgr],','编辑用户跳转','','/mgr/user_edit',9,3,'N',NULL,'ENABLE',NULL,NULL,NULL,NULL,NULL,NULL),(167,'mgr_list','mgr','[0],[system],[mgr],','用户列表','','/mgr/list',10,3,'N',NULL,'ENABLE',NULL,NULL,NULL,NULL,NULL,NULL),(171,'dev_tools','0','[0],','开发工具','layui-icon layui-icon-app','#',20,1,'Y',NULL,'ENABLE',NULL,NULL,NULL,'2019-02-11 15:49:25',NULL,1),(1203350645813256194,'public administration','0','[0],','行政管理','layui-icon layui-icon-dollar','#',15,1,'Y',NULL,'ENABLE',NULL,NULL,NULL,NULL,NULL,NULL),(1203351078816423938,'leave request','public administration','[0],[public administration],','请假申请','layui-icon layui-icon-survey','#',1,2,'Y',NULL,'ENABLE',NULL,NULL,NULL,NULL,NULL,NULL),(1203351677297467393,'expense claim','public administration','[0],[public administration],','报销申请','','#',2,2,'Y',NULL,'ENABLE',NULL,NULL,NULL,NULL,NULL,NULL),(1203351904469360642,'Post management','public administration','[0],[public administration],','发文管理','','#',3,2,'Y',NULL,'ENABLE',NULL,NULL,NULL,NULL,NULL,NULL),(1203352300428435458,'leave undeclared','leave request','[0],[public administration],[leave request],','未申报','layui-icon layui-icon layui-icon layui-icon layui-icon layui-icon layui-icon layui-icon-close','/leave/home/0',1,3,'Y',NULL,'ENABLE',NULL,NULL,NULL,NULL,NULL,NULL),(1203353047022936066,'expense unexpense','expense claim','[0],[public administration],[expense claim],','未申报','','#',1,3,'Y',NULL,'ENABLE',NULL,NULL,NULL,NULL,NULL,NULL),(1203353625954328577,'leave Have to declare','leave request','[0],[public administration],[leave request],','已申报','layui-icon layui-icon ','/leave/home/1',2,3,'Y',NULL,'ENABLE',NULL,NULL,NULL,NULL,NULL,NULL),(1203354119250616321,'expense Have to declare','expense claim','[0],[public administration],[expense claim],','已申报','','#',2,3,'Y',NULL,'ENABLE',NULL,NULL,NULL,NULL,NULL,NULL),(1203355169290428418,'leave finished','leave request','[0],[public administration],[leave request],','已结束','layui-icon layui-icon layui-icon ','/leave/home/2',3,3,'Y',NULL,'ENABLE',NULL,NULL,NULL,NULL,NULL,NULL),(1203355394625216514,'expense finished','expense claim','[0],[public administration],[expense claim],','已结束','','#',3,3,'Y',NULL,'ENABLE',NULL,NULL,NULL,NULL,NULL,NULL),(1203355627685912578,'Post undeclared','Post management','[0],[public administration],[Post management],','未申报','','#',1,3,'Y',NULL,'ENABLE',NULL,NULL,NULL,NULL,NULL,NULL),(1203355803876040706,'Post Have to declare','Post management','[0],[public administration],[Post management],','已申报','','#',2,3,'Y',NULL,'ENABLE',NULL,NULL,NULL,NULL,NULL,NULL),(1203356119329644545,'Post finished','Post management','[0],[public administration],[Post management],','已结束','','#',3,3,'Y',NULL,'ENABLE',NULL,NULL,NULL,NULL,NULL,NULL),(1203356119329644546,'Task agents','My Task','[0],[personal affairs],[My Task],','代办任务','layui-icon layui-icon layui-icon layui-icon layui-icon layui-icon-username','task',0,3,'Y',NULL,'ENABLE',NULL,NULL,NULL,NULL,NULL,NULL),(1203356119329644547,'My Task','personal affairs','[0],[personal affairs],','我的任务','layui-icon layui-icon-rate-half','#',1,2,'Y',NULL,'ENABLE',NULL,NULL,NULL,NULL,NULL,NULL),(1203356119329644548,'personal affairs','0','[0],','个人事务','layui-icon layui-icon layui-icon-vercode','/personal',1,1,'Y',NULL,'ENABLE',NULL,NULL,NULL,NULL,NULL,NULL),(1203356119329644549,'my_cloud_storage','0','[0],','我的云盘','layui-icon layui-icon layui-icon layui-icon-note','/cloud',0,1,'Y',NULL,'ENABLE',NULL,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `sys_notice` */

DROP TABLE IF EXISTS `sys_notice`;

CREATE TABLE `sys_notice` (
  `NOTICE_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `TITLE` varchar(255) DEFAULT NULL COMMENT '标题',
  `CONTENT` text COMMENT '内容',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '修改人',
  PRIMARY KEY (`NOTICE_ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1203211691937009667 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='通知表';

/*Data for the table `sys_notice` */

insert  into `sys_notice`(`NOTICE_ID`,`TITLE`,`CONTENT`,`CREATE_TIME`,`CREATE_USER`,`UPDATE_TIME`,`UPDATE_USER`) values (8,'你好','你好，世界！','2017-05-10 19:28:57',1,'2018-12-28 23:28:26',1),(1203211691937009666,'1531351','126516','2019-12-07 15:16:36',1203211018084323329,NULL,NULL);

/*Table structure for table `sys_operation_log` */

DROP TABLE IF EXISTS `sys_operation_log`;

CREATE TABLE `sys_operation_log` (
  `OPERATION_LOG_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `LOG_TYPE` varchar(32) DEFAULT NULL COMMENT '日志类型(字典)',
  `LOG_NAME` varchar(255) DEFAULT NULL COMMENT '日志名称',
  `USER_ID` bigint(65) DEFAULT NULL COMMENT '用户id',
  `CLASS_NAME` varchar(255) DEFAULT NULL COMMENT '类名称',
  `METHOD` text COMMENT '方法名称',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `SUCCEED` varchar(32) DEFAULT NULL COMMENT '是否成功(字典)',
  `MESSAGE` text COMMENT '备注',
  PRIMARY KEY (`OPERATION_LOG_ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1241327696202526722 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='操作日志';

/*Data for the table `sys_operation_log` */

insert  into `sys_operation_log`(`OPERATION_LOG_ID`,`LOG_TYPE`,`LOG_NAME`,`USER_ID`,`CLASS_NAME`,`METHOD`,`CREATE_TIME`,`SUCCEED`,`MESSAGE`) values (1240456161963020290,'业务日志','清空业务日志',1,'com.oa.modular.system.controller.LogController','delLog','2020-03-19 09:52:50','成功','主键id=null'),(1240456927276699649,'业务日志','删除菜单',1,'com.oa.modular.system.controller.MenuController','remove','2020-03-19 09:55:52','成功','菜单名称=系统消息'),(1241300899586961409,'异常日志','',2,NULL,NULL,'2020-03-21 17:49:31','失败','java.lang.NullPointerException\r\n	at com.oa.modular.system.service.RoleService.selectDeptNameRolePName(RoleService.java:199)\r\n	at com.oa.modular.system.service.RoleServiceTTFastClassBySpringCGLIBTTcf291d9a.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\r\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:769)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\r\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.proceed(CglibAopProxy.java:747)\r\n	at com.alibaba.druid.support.spring.stat.DruidStatInterceptor.invoke(DruidStatInterceptor.java:72)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\r\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.proceed(CglibAopProxy.java:747)\r\n	at org.springframework.aop.framework.CglibAopProxyTDynamicAdvisedInterceptor.intercept(CglibAopProxy.java:689)\r\n	at com.oa.modular.system.service.RoleServiceTTEnhancerBySpringCGLIBTT440ae7e9.selectDeptNameRolePName(<generated>)\r\n	at com.oa.modular.system.controller.LeaveRequestController.LeaveApproval(LeaveRequestController.java:117)\r\n	at com.oa.modular.system.controller.LeaveRequestControllerTTFastClassBySpringCGLIBTTa82035a.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\r\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:769)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\r\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.proceed(CglibAopProxy.java:747)\r\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:88)\r\n	at com.oa.core.interceptor.SessionHolderInterceptor.sessionKit(SessionHolderInterceptor.java:44)\r\n	at sun.reflect.GeneratedMethodAccessor102.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:644)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:633)\r\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:70)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\r\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.proceed(CglibAopProxy.java:747)\r\n	at org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:93)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\r\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.proceed(CglibAopProxy.java:747)\r\n	at org.springframework.aop.framework.CglibAopProxyTDynamicAdvisedInterceptor.intercept(CglibAopProxy.java:689)\r\n	at com.oa.modular.system.controller.LeaveRequestControllerTTEnhancerBySpringCGLIBTT5d746013.LeaveApproval(<generated>)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:190)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:138)\r\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:106)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:888)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:793)\r\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1040)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:943)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:1006)\r\n	at org.springframework.web.servlet.FrameworkServlet.doPost(FrameworkServlet.java:909)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:660)\r\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:883)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:741)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:231)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:53)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:449)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilterT1.call(AbstractShiroFilter.java:365)\r\n	at org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\r\n	at org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\r\n	at org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:387)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:362)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at cn.stylefeng.roses.core.xss.XssFilter.doFilter(XssFilter.java:31)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at com.alibaba.druid.support.http.WebStatFilter.doFilter(WebStatFilter.java:123)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:100)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:119)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.FormContentFilter.doFilterInternal(FormContentFilter.java:93)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:119)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:201)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:119)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:202)\r\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:96)\r\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:526)\r\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:139)\r\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:92)\r\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:74)\r\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:343)\r\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:408)\r\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:66)\r\n	at org.apache.coyote.AbstractProtocolTConnectionHandler.process(AbstractProtocol.java:861)\r\n	at org.apache.tomcat.util.net.NioEndpointTSocketProcessor.doRun(NioEndpoint.java:1579)\r\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\r\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149)\r\n	at java.util.concurrent.ThreadPoolExecutorTWorker.run(ThreadPoolExecutor.java:624)\r\n	at org.apache.tomcat.util.threads.TaskThreadTWrappingRunnable.run(TaskThread.java:61)\r\n	at java.lang.Thread.run(Thread.java:748)\r\n'),(1241300916250931201,'异常日志','',2,NULL,NULL,'2020-03-21 17:49:35','失败','java.lang.NullPointerException\r\n	at com.oa.modular.system.service.RoleService.selectDeptNameRolePName(RoleService.java:199)\r\n	at com.oa.modular.system.service.RoleServiceTTFastClassBySpringCGLIBTTcf291d9a.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\r\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:769)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\r\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.proceed(CglibAopProxy.java:747)\r\n	at com.alibaba.druid.support.spring.stat.DruidStatInterceptor.invoke(DruidStatInterceptor.java:72)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\r\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.proceed(CglibAopProxy.java:747)\r\n	at org.springframework.aop.framework.CglibAopProxyTDynamicAdvisedInterceptor.intercept(CglibAopProxy.java:689)\r\n	at com.oa.modular.system.service.RoleServiceTTEnhancerBySpringCGLIBTT440ae7e9.selectDeptNameRolePName(<generated>)\r\n	at com.oa.modular.system.controller.LeaveRequestController.LeaveApproval(LeaveRequestController.java:117)\r\n	at com.oa.modular.system.controller.LeaveRequestControllerTTFastClassBySpringCGLIBTTa82035a.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\r\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:769)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\r\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.proceed(CglibAopProxy.java:747)\r\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:88)\r\n	at com.oa.core.interceptor.SessionHolderInterceptor.sessionKit(SessionHolderInterceptor.java:44)\r\n	at sun.reflect.GeneratedMethodAccessor102.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:644)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:633)\r\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:70)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\r\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.proceed(CglibAopProxy.java:747)\r\n	at org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:93)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\r\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.proceed(CglibAopProxy.java:747)\r\n	at org.springframework.aop.framework.CglibAopProxyTDynamicAdvisedInterceptor.intercept(CglibAopProxy.java:689)\r\n	at com.oa.modular.system.controller.LeaveRequestControllerTTEnhancerBySpringCGLIBTT5d746013.LeaveApproval(<generated>)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:190)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:138)\r\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:106)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:888)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:793)\r\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1040)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:943)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:1006)\r\n	at org.springframework.web.servlet.FrameworkServlet.doPost(FrameworkServlet.java:909)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:660)\r\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:883)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:741)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:231)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:53)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:449)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilterT1.call(AbstractShiroFilter.java:365)\r\n	at org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\r\n	at org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\r\n	at org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:387)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:362)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at cn.stylefeng.roses.core.xss.XssFilter.doFilter(XssFilter.java:31)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at com.alibaba.druid.support.http.WebStatFilter.doFilter(WebStatFilter.java:123)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:100)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:119)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.FormContentFilter.doFilterInternal(FormContentFilter.java:93)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:119)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:201)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:119)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:202)\r\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:96)\r\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:526)\r\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:139)\r\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:92)\r\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:74)\r\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:343)\r\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:408)\r\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:66)\r\n	at org.apache.coyote.AbstractProtocolTConnectionHandler.process(AbstractProtocol.java:861)\r\n	at org.apache.tomcat.util.net.NioEndpointTSocketProcessor.doRun(NioEndpoint.java:1579)\r\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\r\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149)\r\n	at java.util.concurrent.ThreadPoolExecutorTWorker.run(ThreadPoolExecutor.java:624)\r\n	at org.apache.tomcat.util.threads.TaskThreadTWrappingRunnable.run(TaskThread.java:61)\r\n	at java.lang.Thread.run(Thread.java:748)\r\n'),(1241323533292912642,'业务日志','修改管理员',1,'com.oa.modular.system.controller.UserMgrController','edit','2020-03-21 19:19:27','成功','账号=admin;;;'),(1241323599873294337,'异常日志','',1,NULL,NULL,'2020-03-21 19:19:43','失败','cn.stylefeng.roses.kernel.model.exception.ServiceException: 不能冻结超级管理员\r\n	at com.oa.modular.system.controller.UserMgrController.freeze(UserMgrController.java:311)\r\n	at com.oa.modular.system.controller.UserMgrControllerTTFastClassBySpringCGLIBTT7f878843.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\r\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:769)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\r\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.proceed(CglibAopProxy.java:747)\r\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:88)\r\n	at com.oa.core.interceptor.SessionHolderInterceptor.sessionKit(SessionHolderInterceptor.java:44)\r\n	at sun.reflect.GeneratedMethodAccessor103.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:644)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:633)\r\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:70)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\r\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.proceed(CglibAopProxy.java:747)\r\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:88)\r\n	at com.oa.core.aop.LogAop.recordSysLog(LogAop.java:60)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:644)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:633)\r\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:70)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:175)\r\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.proceed(CglibAopProxy.java:747)\r\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:88)\r\n	at com.oa.core.aop.PermissionAop.doPermission(PermissionAop.java:79)\r\n	at sun.reflect.GeneratedMethodAccessor201.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:644)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:633)\r\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:70)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:175)\r\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.proceed(CglibAopProxy.java:747)\r\n	at org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:93)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\r\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.proceed(CglibAopProxy.java:747)\r\n	at org.springframework.aop.framework.CglibAopProxyTDynamicAdvisedInterceptor.intercept(CglibAopProxy.java:689)\r\n	at com.oa.modular.system.controller.UserMgrControllerTTEnhancerBySpringCGLIBTTf4673002.freeze(<generated>)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:190)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:138)\r\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:106)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:888)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:793)\r\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1040)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:943)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:1006)\r\n	at org.springframework.web.servlet.FrameworkServlet.doPost(FrameworkServlet.java:909)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:660)\r\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:883)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:741)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:231)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:53)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:449)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilterT1.call(AbstractShiroFilter.java:365)\r\n	at org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\r\n	at org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\r\n	at org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:387)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:362)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at cn.stylefeng.roses.core.xss.XssFilter.doFilter(XssFilter.java:31)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at com.alibaba.druid.support.http.WebStatFilter.doFilter(WebStatFilter.java:123)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:100)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:119)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.FormContentFilter.doFilterInternal(FormContentFilter.java:93)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:119)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:201)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:119)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:202)\r\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:96)\r\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:526)\r\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:139)\r\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:92)\r\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:74)\r\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:343)\r\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:408)\r\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:66)\r\n	at org.apache.coyote.AbstractProtocolTConnectionHandler.process(AbstractProtocol.java:861)\r\n	at org.apache.tomcat.util.net.NioEndpointTSocketProcessor.doRun(NioEndpoint.java:1579)\r\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\r\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149)\r\n	at java.util.concurrent.ThreadPoolExecutorTWorker.run(ThreadPoolExecutor.java:624)\r\n	at org.apache.tomcat.util.threads.TaskThreadTWrappingRunnable.run(TaskThread.java:61)\r\n	at java.lang.Thread.run(Thread.java:748)\r\n'),(1241323611634122754,'业务日志','冻结用户',1,'com.oa.modular.system.controller.UserMgrController','freeze','2020-03-21 19:19:46','成功','账号=syx'),(1241323617099300866,'业务日志','解除冻结用户',1,'com.oa.modular.system.controller.UserMgrController','unfreeze','2020-03-21 19:19:47','成功','账号=syx'),(1241323746686517249,'业务日志','清空登录日志',1,'com.oa.modular.system.controller.LoginLogController','delLog','2020-03-21 19:20:18','成功','主键id=null'),(1241327655807184898,'异常日志','',1,NULL,NULL,'2020-03-21 19:35:50','失败','cn.stylefeng.roses.kernel.model.exception.ServiceException: 不能修改超级管理员角色\r\n	at com.oa.modular.system.controller.UserMgrController.setRole(UserMgrController.java:353)\r\n	at com.oa.modular.system.controller.UserMgrControllerTTFastClassBySpringCGLIBTT7f878843.invoke(<generated>)\r\n	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218)\r\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:769)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\r\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.proceed(CglibAopProxy.java:747)\r\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:88)\r\n	at com.oa.core.interceptor.SessionHolderInterceptor.sessionKit(SessionHolderInterceptor.java:44)\r\n	at sun.reflect.GeneratedMethodAccessor99.invoke(Unknown Source)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:644)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:633)\r\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:70)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\r\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.proceed(CglibAopProxy.java:747)\r\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:88)\r\n	at com.oa.core.aop.LogAop.recordSysLog(LogAop.java:60)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:644)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:633)\r\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:70)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:175)\r\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.proceed(CglibAopProxy.java:747)\r\n	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:88)\r\n	at com.oa.core.aop.PermissionAop.doPermission(PermissionAop.java:79)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethodWithGivenArgs(AbstractAspectJAdvice.java:644)\r\n	at org.springframework.aop.aspectj.AbstractAspectJAdvice.invokeAdviceMethod(AbstractAspectJAdvice.java:633)\r\n	at org.springframework.aop.aspectj.AspectJAroundAdvice.invoke(AspectJAroundAdvice.java:70)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:175)\r\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.proceed(CglibAopProxy.java:747)\r\n	at org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:93)\r\n	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:186)\r\n	at org.springframework.aop.framework.CglibAopProxyTCglibMethodInvocation.proceed(CglibAopProxy.java:747)\r\n	at org.springframework.aop.framework.CglibAopProxyTDynamicAdvisedInterceptor.intercept(CglibAopProxy.java:689)\r\n	at com.oa.modular.system.controller.UserMgrControllerTTEnhancerBySpringCGLIBTTfe651099.setRole(<generated>)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\r\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n	at java.lang.reflect.Method.invoke(Method.java:498)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:190)\r\n	at org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:138)\r\n	at org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:106)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:888)\r\n	at org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:793)\r\n	at org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\r\n	at org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1040)\r\n	at org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:943)\r\n	at org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:1006)\r\n	at org.springframework.web.servlet.FrameworkServlet.doPost(FrameworkServlet.java:909)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:660)\r\n	at org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:883)\r\n	at javax.servlet.http.HttpServlet.service(HttpServlet.java:741)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:231)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:53)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:61)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.executeChain(AdviceFilter.java:108)\r\n	at org.apache.shiro.web.servlet.AdviceFilter.doFilterInternal(AdviceFilter.java:137)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.apache.shiro.web.servlet.ProxiedFilterChain.doFilter(ProxiedFilterChain.java:66)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.executeChain(AbstractShiroFilter.java:449)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilterT1.call(AbstractShiroFilter.java:365)\r\n	at org.apache.shiro.subject.support.SubjectCallable.doCall(SubjectCallable.java:90)\r\n	at org.apache.shiro.subject.support.SubjectCallable.call(SubjectCallable.java:83)\r\n	at org.apache.shiro.subject.support.DelegatingSubject.execute(DelegatingSubject.java:387)\r\n	at org.apache.shiro.web.servlet.AbstractShiroFilter.doFilterInternal(AbstractShiroFilter.java:362)\r\n	at org.apache.shiro.web.servlet.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:125)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at cn.stylefeng.roses.core.xss.XssFilter.doFilter(XssFilter.java:31)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at com.alibaba.druid.support.http.WebStatFilter.doFilter(WebStatFilter.java:123)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:100)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:119)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.FormContentFilter.doFilterInternal(FormContentFilter.java:93)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:119)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:201)\r\n	at org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:119)\r\n	at org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:193)\r\n	at org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:166)\r\n	at org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:202)\r\n	at org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:96)\r\n	at org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:526)\r\n	at org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:139)\r\n	at org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:92)\r\n	at org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:74)\r\n	at org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:343)\r\n	at org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:408)\r\n	at org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:66)\r\n	at org.apache.coyote.AbstractProtocolTConnectionHandler.process(AbstractProtocol.java:861)\r\n	at org.apache.tomcat.util.net.NioEndpointTSocketProcessor.doRun(NioEndpoint.java:1579)\r\n	at org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:49)\r\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149)\r\n	at java.util.concurrent.ThreadPoolExecutorTWorker.run(ThreadPoolExecutor.java:624)\r\n	at org.apache.tomcat.util.threads.TaskThreadTWrappingRunnable.run(TaskThread.java:61)\r\n	at java.lang.Thread.run(Thread.java:748)\r\n'),(1241327696202526721,'业务日志','分配角色',1,'com.oa.modular.system.controller.UserMgrController','setRole','2020-03-21 19:36:00','成功','账号=syx,角色名称集合=董事长');

/*Table structure for table `sys_relation` */

DROP TABLE IF EXISTS `sys_relation`;

CREATE TABLE `sys_relation` (
  `RELATION_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `MENU_ID` bigint(20) DEFAULT NULL COMMENT '菜单id',
  `ROLE_ID` bigint(20) DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`RELATION_ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1240455135151263746 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='角色和菜单关联表';

/*Data for the table `sys_relation` */

insert  into `sys_relation`(`RELATION_ID`,`MENU_ID`,`ROLE_ID`) values (1203210097354903553,105,1203209893302013953),(1203210097422012417,106,1203209893302013953),(1203210097422012418,107,1203209893302013953),(1203210097422012419,108,1203209893302013953),(1203210097422012420,109,1203209893302013953),(1203210097422012421,110,1203209893302013953),(1203210097422012422,111,1203209893302013953),(1203210097484926977,112,1203209893302013953),(1203210097484926978,113,1203209893302013953),(1203210097484926979,165,1203209893302013953),(1203210097484926980,166,1203209893302013953),(1203210097484926981,167,1203209893302013953),(1203210097484926982,131,1203209893302013953),(1203210097552035842,135,1203209893302013953),(1203210097552035843,136,1203209893302013953),(1203210097552035844,137,1203209893302013953),(1203210097552035845,152,1203209893302013953),(1203210097552035846,153,1203209893302013953),(1203210097614950402,154,1203209893302013953),(1203210097614950403,141,1203209893302013953),(1203210097614950404,142,1203209893302013953),(1203210097614950405,143,1203209893302013953),(1203210097614950406,144,1203209893302013953),(1209041332321996802,105,1203209893302013958),(1209041332321996803,106,1203209893302013958),(1209041332321996804,167,1203209893302013958),(1209041332389105666,114,1203209893302013958),(1209041332389105667,164,1203209893302013958),(1209041332389105668,119,1203209893302013958),(1209041332389105669,151,1203209893302013958),(1209041332389105670,131,1203209893302013958),(1209041332389105671,153,1203209893302013958),(1209041332389105672,154,1203209893302013958),(1209041332389105673,132,1203209893302013958),(1209041332456214530,156,1203209893302013958),(1209041332456214531,157,1203209893302013958),(1209041332456214534,1203350645813256194,1203209893302013958),(1209041332456214535,1203351078816423938,1203209893302013958),(1209041332456214536,1203352300428435458,1203209893302013958),(1209041332456214537,1203353625954328577,1203209893302013958),(1209041332456214538,1203355169290428418,1203209893302013958),(1209041332519129090,1203356119329644548,1203209893302013958),(1209041332519129091,1203356119329644547,1203209893302013958),(1209041332519129092,1203356119329644546,1203209893302013958),(1223600925478768641,105,1203209893302013955),(1223600925491351554,106,1203209893302013955),(1223600925499740162,107,1203209893302013955),(1223600925508128770,108,1203209893302013955),(1223600925516517378,109,1203209893302013955),(1223600925524905985,110,1203209893302013955),(1223600925524905986,111,1203209893302013955),(1223600925524905987,112,1203209893302013955),(1223600925533294593,113,1203209893302013955),(1223600925533294594,165,1203209893302013955),(1223600925541683201,166,1203209893302013955),(1223600925550071809,167,1203209893302013955),(1223600925558460417,114,1203209893302013955),(1223600925562654722,115,1203209893302013955),(1223600925571043330,116,1203209893302013955),(1223600925583626242,117,1203209893302013955),(1223600925587820545,118,1203209893302013955),(1223600925587820546,162,1203209893302013955),(1223600925596209154,163,1203209893302013955),(1223600925600403458,164,1203209893302013955),(1223600925600403459,119,1203209893302013955),(1223600925608792065,120,1203209893302013955),(1223600925608792066,121,1203209893302013955),(1223600925617180674,122,1203209893302013955),(1223600925617180675,150,1203209893302013955),(1223600925625569282,151,1203209893302013955),(1223600925633957889,131,1203209893302013955),(1223600925642346497,135,1203209893302013955),(1223600925646540802,136,1203209893302013955),(1223600925654929409,137,1203209893302013955),(1223600925663318017,152,1203209893302013955),(1223600925663318018,153,1203209893302013955),(1223600925663318019,154,1203209893302013955),(1223600925671706626,141,1203209893302013955),(1223600925671706627,142,1203209893302013955),(1223600925680095234,143,1203209893302013955),(1223600925684289537,144,1203209893302013955),(1223600925701066753,1203350645813256194,1203209893302013955),(1223600925709455361,1203351078816423938,1203209893302013955),(1223600925717843970,1203352300428435458,1203209893302013955),(1223600925726232578,1203353625954328577,1203209893302013955),(1223600925730426882,1203355169290428418,1203209893302013955),(1223600925730426883,1203356119329644548,1203209893302013955),(1223600925738815489,1203356119329644547,1203209893302013955),(1223600925743009794,1203356119329644546,1203209893302013955),(1223600962485112833,105,1203209893302013959),(1223600962493501441,106,1203209893302013959),(1223600962493501442,107,1203209893302013959),(1223600962501890050,108,1203209893302013959),(1223600962501890051,109,1203209893302013959),(1223600962510278657,110,1203209893302013959),(1223600962518667265,111,1203209893302013959),(1223600962518667266,112,1203209893302013959),(1223600962527055874,113,1203209893302013959),(1223600962527055875,165,1203209893302013959),(1223600962543833090,166,1203209893302013959),(1223600962556416001,167,1203209893302013959),(1223600962573193217,1203350645813256194,1203209893302013959),(1223600962581581825,1203351078816423938,1203209893302013959),(1223600962581581826,1203352300428435458,1203209893302013959),(1223600962589970434,1203353625954328577,1203209893302013959),(1223600962589970435,1203355169290428418,1203209893302013959),(1223600962598359042,1203356119329644548,1203209893302013959),(1223600962602553346,1203356119329644547,1203209893302013959),(1223600962610941954,1203356119329644546,1203209893302013959),(1223601153640517634,105,6),(1223601153653100545,106,6),(1223601153665683457,107,6),(1223601153669877761,111,6),(1223601153669877762,112,6),(1223601153678266369,113,6),(1223601153686654977,165,6),(1223601153686654978,167,6),(1223601153695043585,114,6),(1223601153695043586,118,6),(1223601153703432194,164,6),(1223601153716015106,119,6),(1223601153716015107,151,6),(1223601153728598017,131,6),(1223601153728598018,153,6),(1223601153736986625,154,6),(1223601153736986626,132,6),(1223601153745375233,156,6),(1223601153745375234,157,6),(1223601153762152449,1203350645813256194,6),(1223601153762152450,1203351078816423938,6),(1223601153770541058,1203352300428435458,6),(1223601153774735362,1203353625954328577,6),(1223601153783123969,1203355169290428418,6),(1223601153787318274,1203356119329644548,6),(1223601153795706882,1203356119329644547,6),(1223601153799901185,1203356119329644546,6),(1239093840472764417,105,1203209893302013956),(1239093840476958721,114,1203209893302013956),(1239093840485347330,164,1203209893302013956),(1239093840497930241,119,1203209893302013956),(1239093840502124545,151,1203209893302013956),(1239093840514707457,131,1203209893302013956),(1239093840514707458,153,1203209893302013956),(1239093840523096066,154,1203209893302013956),(1239093840552456194,1203350645813256194,1203209893302013956),(1239093840560844802,1203351078816423938,1203209893302013956),(1239093840569233409,1203352300428435458,1203209893302013956),(1239093840573427713,1203353625954328577,1203209893302013956),(1239093840581816321,1203355169290428418,1203209893302013956),(1239093840590204929,1203356119329644548,1203209893302013956),(1239093840598593538,1203356119329644547,1203209893302013956),(1239093840606982145,1203356119329644546,1203209893302013956),(1239094008106512386,105,7),(1239094008114900994,114,7),(1239094008123289602,163,7),(1239094008131678210,119,7),(1239094008140066817,151,7),(1239094008148455426,131,7),(1239094008156844033,153,7),(1239094008186204162,154,7),(1239094008202981377,1203350645813256194,7),(1239094008219758594,1203351078816423938,7),(1239094008228147202,1203352300428435458,7),(1239094008236535810,1203353625954328577,7),(1239094008236535811,1203355169290428418,7),(1239094008253313025,1203356119329644548,7),(1239094008261701634,1203356119329644547,7),(1239094008261701635,1203356119329644546,7),(1240455134752804865,105,1),(1240455134769582082,106,1),(1240455134777970689,107,1),(1240455134777970690,108,1),(1240455134786359298,109,1),(1240455134786359299,110,1),(1240455134794747905,111,1),(1240455134794747906,112,1),(1240455134803136514,113,1),(1240455134811525121,165,1),(1240455134819913729,166,1),(1240455134819913730,167,1),(1240455134828302337,114,1),(1240455134836690946,115,1),(1240455134845079554,116,1),(1240455134845079555,117,1),(1240455134853468161,118,1),(1240455134853468162,162,1),(1240455134861856770,163,1),(1240455134866051073,164,1),(1240455134874439682,119,1),(1240455134882828289,120,1),(1240455134882828290,121,1),(1240455134891216897,122,1),(1240455134899605505,150,1),(1240455134907994114,151,1),(1240455134916382721,128,1),(1240455134916382722,134,1),(1240455134924771329,158,1),(1240455134933159938,159,1),(1240455134937354241,130,1),(1240455134945742849,131,1),(1240455134958325762,135,1),(1240455134970908674,136,1),(1240455134975102977,137,1),(1240455134983491586,152,1),(1240455134991880194,153,1),(1240455135000268802,154,1),(1240455135004463106,132,1),(1240455135004463107,138,1),(1240455135012851713,139,1),(1240455135025434626,140,1),(1240455135025434627,155,1),(1240455135038017538,156,1),(1240455135046406145,157,1),(1240455135054794754,133,1),(1240455135058989057,160,1),(1240455135067377666,161,1),(1240455135084154882,1203350645813256194,1),(1240455135092543490,1203351078816423938,1),(1240455135100932097,1203352300428435458,1),(1240455135109320705,1203353625954328577,1),(1240455135121903618,1203355169290428418,1),(1240455135121903619,1203356119329644548,1),(1240455135130292226,1203356119329644547,1),(1240455135142875137,1203356119329644546,1),(1240455135151263745,1203356119329644549,1);

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `ROLE_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `PID` bigint(20) DEFAULT NULL COMMENT '父角色id',
  `NAME` varchar(255) DEFAULT NULL COMMENT '角色名称',
  `DESCRIPTION` varchar(255) DEFAULT NULL COMMENT '提示',
  `SORT` int(11) DEFAULT NULL COMMENT '序号',
  `VERSION` int(11) DEFAULT NULL COMMENT '乐观锁',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `UPDATE_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建用户',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '修改用户',
  PRIMARY KEY (`ROLE_ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1203209893302013960 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='角色表';

/*Data for the table `sys_role` */

insert  into `sys_role`(`ROLE_ID`,`PID`,`NAME`,`DESCRIPTION`,`SORT`,`VERSION`,`CREATE_TIME`,`UPDATE_TIME`,`CREATE_USER`,`UPDATE_USER`) values (1,0,'超级管理员','administrator',2,1,NULL,NULL,NULL,NULL),(6,1203209893302013955,'总经理','general manager',2,NULL,NULL,NULL,NULL,NULL),(7,1203209893302013959,'主管','dept manager',4,NULL,NULL,NULL,NULL,NULL),(1203209893302013955,0,'董事长','Boss',1,NULL,NULL,NULL,NULL,NULL),(1203209893302013956,7,'经理','pep manager',5,NULL,NULL,NULL,NULL,NULL),(1203209893302013958,1203209893302013956,'销售员','pep staff',6,NULL,NULL,NULL,NULL,NULL),(1203209893302013959,6,'副总经理','副总',3,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `USER_ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `AVATAR` varchar(255) DEFAULT NULL COMMENT '头像',
  `ACCOUNT` varchar(45) DEFAULT NULL COMMENT '账号',
  `PASSWORD` varchar(45) DEFAULT NULL COMMENT '密码',
  `SALT` varchar(45) DEFAULT NULL COMMENT 'md5密码盐',
  `NAME` varchar(45) DEFAULT NULL COMMENT '名字',
  `BIRTHDAY` datetime DEFAULT NULL COMMENT '生日',
  `SEX` varchar(32) DEFAULT NULL COMMENT '性别(字典)',
  `EMAIL` varchar(45) DEFAULT NULL COMMENT '电子邮件',
  `PHONE` varchar(45) DEFAULT NULL COMMENT '电话',
  `ROLE_ID` varchar(255) DEFAULT NULL COMMENT '角色id(多个逗号隔开)',
  `DEPT_ID` bigint(20) DEFAULT NULL COMMENT '部门id(多个逗号隔开)',
  `STATUS` varchar(32) DEFAULT NULL COMMENT '状态(字典)',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `CREATE_USER` bigint(20) DEFAULT NULL COMMENT '创建人',
  `UPDATE_TIME` datetime DEFAULT NULL COMMENT '更新时间',
  `UPDATE_USER` bigint(20) DEFAULT NULL COMMENT '更新人',
  `VERSION` int(11) DEFAULT NULL COMMENT '乐观锁',
  PRIMARY KEY (`USER_ID`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1206115250404966408 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='管理员表';

/*Data for the table `sys_user` */

insert  into `sys_user`(`USER_ID`,`AVATAR`,`ACCOUNT`,`PASSWORD`,`SALT`,`NAME`,`BIRTHDAY`,`SEX`,`EMAIL`,`PHONE`,`ROLE_ID`,`DEPT_ID`,`STATUS`,`CREATE_TIME`,`CREATE_USER`,`UPDATE_TIME`,`UPDATE_USER`,`VERSION`) values (1,'1240453763198619649','admin','4a44a60c737439adcceee7db2b5f0083','0ywvc','stylefeng','2019-12-24 00:00:00','M','sn93@qq.com','18200000000','1',24,'ENABLE','2016-01-29 08:49:53',NULL,'2018-12-28 22:52:24',24,25),(2,NULL,'syx','637ffc357de357017638fb334a369c69','uff8o','宋亚鑫','2019-12-10 00:00:00','M','1607011324@qq.com','18513240501','1203209893302013955',24,'ENABLE','2019-12-10 17:00:17',NULL,NULL,NULL,NULL),(1206115250404966402,NULL,'dlam','04f950ef656feed755c2eda863488b2f','dijen','哆啦A梦','2019-12-15 00:00:00','M','dlam@qq.com','0000000','1203209893302013958',27,'ENABLE','2019-12-15 15:38:58',NULL,NULL,NULL,NULL),(1206115250404966403,NULL,'ljx','f505774266634111f6828193a341bbbf','nuww3','吕俊宪','2019-12-23 00:00:00','M','163ghgh@hvbv.com','','1203209893302013959',25,'ENABLE','2019-12-23 13:02:22',NULL,NULL,NULL,NULL),(1206115250404966404,NULL,'jtz','1cd258a58100ac6d0fb3c786c93eabdb','ml05i','擎天柱','2019-12-23 00:00:00','M','dlam@qq.com','','7',29,'ENABLE','2019-12-23 14:51:13',NULL,NULL,NULL,NULL),(1206115250404966405,NULL,'dhf','77e56dc7552d945279976fc6b41f7f86','ovbgh','大黄蜂','2020-01-12 00:00:00','M','dhf@163.com','','1203209893302013956',27,'ENABLE','2020-01-04 21:44:49',NULL,NULL,NULL,NULL),(1206115250404966406,NULL,'lbxx','6548b52eb89e9ec25d7e0b929d9528d4','63tiy','蜡笔小新','2020-01-31 00:00:00','M','lbxx@126.com','','1203209893302013958',27,'ENABLE','2020-01-31 17:35:49',NULL,NULL,NULL,NULL),(1206115250404966407,NULL,'gyx','55a93da73793c95a8441b9c45daab0a0','le9u6','龚燕煕','2020-03-15 00:00:00','M','gyx@126.com','','6',25,'ENABLE','2020-03-15 20:51:15',NULL,NULL,NULL,NULL);

/*Table structure for table `sys_wxinfo` */

DROP TABLE IF EXISTS `sys_wxinfo`;

CREATE TABLE `sys_wxinfo` (
  `openid` varchar(255) NOT NULL COMMENT '微信账户id',
  `nickname` varchar(255) NOT NULL COMMENT '微信昵称',
  `sex` int(11) NOT NULL COMMENT '微信性别',
  `headimgurl` text NOT NULL COMMENT '微信头像',
  `country` varchar(255) NOT NULL COMMENT '省',
  `province` varchar(255) NOT NULL COMMENT '市',
  `city` varchar(255) NOT NULL COMMENT '县',
  `eventkey` varchar(255) DEFAULT NULL COMMENT '标识',
  `binduserid` bigint(20) DEFAULT NULL COMMENT '绑定用户',
  PRIMARY KEY (`openid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sys_wxinfo` */

insert  into `sys_wxinfo`(`openid`,`nickname`,`sex`,`headimgurl`,`country`,`province`,`city`,`eventkey`,`binduserid`) values ('ohcQnuM-duGgvrdAygzxL35UvQMg','一片空白',1,'http://thirdwx.qlogo.cn/mmopen/ajNVdqHZLLBhWrYf9icRyAYzZHoH81ryrAfSCicFITOxMgLwDglZLkF2nscKEBkbe02cmaBqSN1kaxld4DfYRje0QZTcDM5vKl92Qlqkno2yU/132','法国','巴黎','','lrfun.com.1585178542090',1);

/*Table structure for table `sys_wxsystem` */

DROP TABLE IF EXISTS `sys_wxsystem`;

CREATE TABLE `sys_wxsystem` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pwd` varchar(255) NOT NULL,
  `allow` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `sys_wxsystem` */

insert  into `sys_wxsystem`(`id`,`pwd`,`allow`) values (2,'199951','1585327839127');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
