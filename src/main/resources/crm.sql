/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50536
Source Host           : localhost:3306
Source Database       : crm

Target Server Type    : MYSQL
Target Server Version : 50536
File Encoding         : 65001

Date: 2021-06-01 16:10:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `tbl_activity`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_activity`;
CREATE TABLE `tbl_activity` (
  `id` char(32) NOT NULL,
  `owner` char(32) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `startDate` char(10) DEFAULT NULL,
  `endDate` char(10) DEFAULT NULL,
  `cost` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `createTime` char(19) DEFAULT NULL,
  `createBy` varchar(255) DEFAULT NULL,
  `editTime` char(19) DEFAULT NULL,
  `editBy` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_activity
-- ----------------------------
INSERT INTO `tbl_activity` VALUES ('00f4088e4e2f4b09821d51c97b7cd553', '40f6cdea0bd34aceb77492a1656d9fb3', '饿了吗外卖', '2021-05-13', '2021-05-14', '20000', '支付宝饿了吗', '2021-05-14 15:24:38', '张三', '2021-05-24 11:09:27', '张三');
INSERT INTO `tbl_activity` VALUES ('14e05fca6a9c4ee08bdf751abb1e0b42', '06f5fc056eac41558a964f96daa7f27c', '送快递1', '2021-03-01', '2021-03-23', '12', '你好', '2021-03-11 21:14:56', '张三', null, null);
INSERT INTO `tbl_activity` VALUES ('2164e3867f194ecca2a39d29cac13fa1', null, '城市宣传', null, null, null, null, null, null, null, null);
INSERT INTO `tbl_activity` VALUES ('4d7a1f60148348e19dc12446e1589d07', '40f6cdea0bd34aceb77492a1656d9fb3', '送快递2', '2021-03-01', '2021-03-23', '12', '你好', '2021-03-11 21:15:22', '张三', null, null);
INSERT INTO `tbl_activity` VALUES ('5813a939d647437aa034b9742b2d85b9', '40f6cdea0bd34aceb77492a1656d9fb3', '发传单42', '2021-03-01', '2021-03-16', '1444', '你好', '2021-03-10 21:28:16', '张三', null, null);
INSERT INTO `tbl_activity` VALUES ('5fbb07fe22e04a53b5ace7b324843eef', '40f6cdea0bd34aceb77492a1656d9fb3', '发传单', '2021-03-07', '2021-03-15', '12', '你好', '2021-03-09 19:15:34', '张三', null, null);
INSERT INTO `tbl_activity` VALUES ('6358debafd624bd49cab63fc65a2286c', '40f6cdea0bd34aceb77492a1656d9fb3', '送快递3', '2021-03-01', '2021-03-23', '12', '你好', '2021-03-11 21:15:00', '张三', null, null);
INSERT INTO `tbl_activity` VALUES ('64549904da674c3cbdd49d033fee660d', '40f6cdea0bd34aceb77492a1656d9fb3', '发传单3', '2021-03-01', '2021-03-16', '1444', '你好', '2021-03-10 21:28:11', '张三', null, null);
INSERT INTO `tbl_activity` VALUES ('717a91cdb634466d8a85c6cab24840b2', '40f6cdea0bd34aceb77492a1656d9fb3', '送快递12a\'a', '2021-03-01', '2021-03-23', '12', '你好', '2021-03-11 21:15:13', '张三', null, null);
INSERT INTO `tbl_activity` VALUES ('725dbbf522114009b6230f729c9f1f47', '40f6cdea0bd34aceb77492a1656d9fb3', '送快递1222', '2021-03-01', '2021-03-23', '12', '你好', '2021-03-11 21:15:08', '张三', null, null);
INSERT INTO `tbl_activity` VALUES ('84ea70cd0e1b489e927ca5107bd2887b', null, '城市宣传', null, null, null, null, null, null, null, null);
INSERT INTO `tbl_activity` VALUES ('944eb343c5334141a61f25d7d6c62563', '40f6cdea0bd34aceb77492a1656d9fb3', '送快递12abb', '2021-03-01', '2021-03-23', '12', '你好', '2021-03-11 21:15:19', '张三', null, null);
INSERT INTO `tbl_activity` VALUES ('9a1d06e2418f48d5bb5d9edac667a45c', '40f6cdea0bd34aceb77492a1656d9fb3', '发传单', '2021-03-01', '2021-03-16', '1444', '你好', '2021-03-10 21:28:03', '张三', null, null);
INSERT INTO `tbl_activity` VALUES ('aaf2b638531441a6bf04efff7ec0e166', '40f6cdea0bd34aceb77492a1656d9fb3', '送快递1211', '2021-03-01', '2021-03-23', '12', '你好', '2021-03-11 21:15:03', '张三', null, null);
INSERT INTO `tbl_activity` VALUES ('c43b61bb9ce143fc9cdb2b1774198ea3', '40f6cdea0bd34aceb77492a1656d9fb3', '发传单2', '2021-03-01', '2021-03-16', '1444', '你好', '2021-03-10 21:28:07', '张三', null, null);
INSERT INTO `tbl_activity` VALUES ('c99b17b9ea844dacae077da6fb8eaf61', '40f6cdea0bd34aceb77492a1656d9fb3', '11111112', '2021-03-03', '2021-02-28', '222222222222', '11111111111111', '2021-03-15 20:25:16', '张三', '2021-03-15 21:01:34', '张三');
INSERT INTO `tbl_activity` VALUES ('dbc3398916e54fac916bd01c0b727895', null, '城市宣传', null, null, null, null, null, null, null, null);
INSERT INTO `tbl_activity` VALUES ('f409db657d0b45e1aec99a25f91e7a0e', '06f5fc056eac41558a964f96daa7f27c', '餐厅做饭', '2020-01-01', '2021-01-02', '12', '12', '2021-03-15 21:03:04', '张三', '2021-03-15 21:03:39', '张三');

-- ----------------------------
-- Table structure for `tbl_activity_remark`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_activity_remark`;
CREATE TABLE `tbl_activity_remark` (
  `id` char(32) NOT NULL,
  `noteContent` varchar(255) DEFAULT NULL,
  `createTime` char(19) DEFAULT NULL,
  `createBy` varchar(255) DEFAULT NULL,
  `editTime` char(19) DEFAULT NULL,
  `editBy` varchar(255) DEFAULT NULL,
  `editFlag` char(1) DEFAULT NULL COMMENT '0表示未修改，1表示已修改',
  `activityId` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_activity_remark
-- ----------------------------
INSERT INTO `tbl_activity_remark` VALUES ('24a751704d044132947c65fedf66ea1f', '112', '2021-04-11 11:16:42', '张三', '2021-04-11 12:39:12', '张三', '1', 'f409db657d0b45e1aec99a25f91e7a0e');
INSERT INTO `tbl_activity_remark` VALUES ('973690f25a2d4f158abeee5772f89694', '111', '2021-04-10 15:21:08', '张三', null, null, '0', 'f409db657d0b45e1aec99a25f91e7a0e');
INSERT INTO `tbl_activity_remark` VALUES ('b20150558718455a94398ba39cd0069f', '餐厅洗碗（备注4）', '2021-03-18 19:26:45', '张三', null, null, '0', 'f409db657d0b45e1aec99a25f91e7a0e');
INSERT INTO `tbl_activity_remark` VALUES ('f409db657d0b45e1aec99a25f91e7a01', '我是“市场活动11111112”', '2021-03-11 21:14:57', 'lisa', null, null, '0', 'c99b17b9ea844dacae077da6fb8eaf61');
INSERT INTO `tbl_activity_remark` VALUES ('f409db657d0b45e1aec99a25f91e7a02', '餐厅做饭（备注33）', '2021-03-11 21:14:52', 'lisa', '2021-03-11 21:15:15', 'jack', '1', 'f409db657d0b45e1aec99a25f91e7a0e');
INSERT INTO `tbl_activity_remark` VALUES ('f409db657d0b45e1aec99a25f91e7a03', '餐厅做饭（备注2）', '2021-03-11 21:14:51', 'lisa', null, null, '0', 'f409db657d0b45e1aec99a25f91e7a0e');

-- ----------------------------
-- Table structure for `tbl_clue`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_clue`;
CREATE TABLE `tbl_clue` (
  `id` char(32) NOT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `appellation` varchar(255) DEFAULT NULL,
  `owner` char(32) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `job` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `mphone` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  `createBy` varchar(255) DEFAULT NULL,
  `createTime` char(19) DEFAULT NULL,
  `editBy` varchar(255) DEFAULT NULL,
  `editTime` char(19) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `contactSummary` varchar(255) DEFAULT NULL,
  `nextContactTime` char(10) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_clue
-- ----------------------------
INSERT INTO `tbl_clue` VALUES ('39a8536f3e3442648e2d634c814e8945', '董明珠', '先生', '40f6cdea0bd34aceb77492a1656d9fb3', '格力集团', 'CEO', 'dmz@qq.com', '112223', 'www.geli.com', '135', '将来联系', '外部介绍', '张三', '2021-04-12 11:35:40', null, '2021-04-15 16:52:33', '描述11', '纪要2', '2021-04-12', '格力大厦');
INSERT INTO `tbl_clue` VALUES ('d992bd255e9d4d5d91b7626cbb0544a4', '王健林', '教授', '40f6cdea0bd34aceb77492a1656d9fb3', '万达', 'CEO', 'jianlin@qq.com', '222', 'www.wanda.com', '187', '未联系', '合作伙伴', '张三', '2021-03-24 18:06:41', null, null, '描述321', '纪要321', '2021-03-04', '上海');

-- ----------------------------
-- Table structure for `tbl_clue_activity_relation`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_clue_activity_relation`;
CREATE TABLE `tbl_clue_activity_relation` (
  `id` char(32) NOT NULL,
  `clueId` char(32) DEFAULT NULL,
  `activityId` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_clue_activity_relation
-- ----------------------------
INSERT INTO `tbl_clue_activity_relation` VALUES ('7362f97a6c5f4d31871a3e6fe2e01444', 'd992bd255e9d4d5d91b7626cbb0544a4', 'f409db657d0b45e1aec99a25f91e7a0e');

-- ----------------------------
-- Table structure for `tbl_clue_remark`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_clue_remark`;
CREATE TABLE `tbl_clue_remark` (
  `id` char(32) NOT NULL,
  `noteContent` varchar(255) DEFAULT NULL,
  `createBy` varchar(255) DEFAULT NULL,
  `createTime` char(19) DEFAULT NULL,
  `editBy` varchar(255) DEFAULT NULL,
  `editTime` char(19) DEFAULT NULL,
  `editFlag` char(1) DEFAULT NULL,
  `clueId` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_clue_remark
-- ----------------------------
INSERT INTO `tbl_clue_remark` VALUES ('2acda5948e6245af8104c2751d5f70e5', '12', '张三', '2021-04-11 12:17:08', '张三', '2021-04-11 18:21:22', '1', 'd992bd255e9d4d5d91b7626cbb0544a4');
INSERT INTO `tbl_clue_remark` VALUES ('7362f97a6c5f4d31871a3e6fe2e01a22', '备注2（王健林）', null, null, null, null, '0', 'd992bd255e9d4d5d91b7626cbb0544a4');
INSERT INTO `tbl_clue_remark` VALUES ('7362f97a6c5f4d31871a3e6fe2e01a33', '备注3（王健林）', null, '1', null, null, '0', 'd992bd255e9d4d5d91b7626cbb0544a4');
INSERT INTO `tbl_clue_remark` VALUES ('caf747f7e6224ebe98b61f40aa66fc2f', '111', '张三', '2021-04-11 12:16:53', null, null, '0', 'd992bd255e9d4d5d91b7626cbb0544a4');
INSERT INTO `tbl_clue_remark` VALUES ('dd1f1df365764b7ebf29e4787b730eba', '222', '张三', '2021-04-11 12:16:56', null, null, '0', 'd992bd255e9d4d5d91b7626cbb0544a4');
INSERT INTO `tbl_clue_remark` VALUES ('e098a510187849c1bd1d4eb7e076ec56', '111111', '张三', '2021-04-11 12:17:20', null, null, '0', 'd992bd255e9d4d5d91b7626cbb0544a4');

-- ----------------------------
-- Table structure for `tbl_contacts`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_contacts`;
CREATE TABLE `tbl_contacts` (
  `id` char(32) NOT NULL,
  `owner` char(32) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  `customerId` char(32) DEFAULT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `appellation` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mphone` varchar(255) DEFAULT NULL,
  `job` varchar(255) DEFAULT NULL,
  `birth` char(10) DEFAULT NULL,
  `createBy` varchar(255) DEFAULT NULL,
  `createTime` char(19) DEFAULT NULL,
  `editBy` varchar(255) DEFAULT NULL,
  `editTime` char(19) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `contactSummary` varchar(255) DEFAULT NULL,
  `nextContactTime` char(10) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_contacts
-- ----------------------------
INSERT INTO `tbl_contacts` VALUES ('ef4ba9dd8694443a92200562467e5368', '40f6cdea0bd34aceb77492a1656d9fb3', '合作伙伴研讨会', '0100b3277d9347129e87c15799aac18c', '马云', '先生', 'mayun@qq.com', '186', 'CEO', null, '张三', '2021-04-10 11:39:31', null, null, '描述222', '纪要222', '2021-04-07', '阿里');

-- ----------------------------
-- Table structure for `tbl_contacts_activity_relation`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_contacts_activity_relation`;
CREATE TABLE `tbl_contacts_activity_relation` (
  `id` char(32) NOT NULL,
  `contactsId` char(32) DEFAULT NULL,
  `activityId` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_contacts_activity_relation
-- ----------------------------
INSERT INTO `tbl_contacts_activity_relation` VALUES ('5fa9549b820746f09fc95cfa77216836', 'ef4ba9dd8694443a92200562467e5368', '14e05fca6a9c4ee08bdf751abb1e0b42');
INSERT INTO `tbl_contacts_activity_relation` VALUES ('8dec7cac166d4a3da2a83434a6569359', 'ef4ba9dd8694443a92200562467e5368', '14e05fca6a9c4ee08bdf751abb1e0b42');
INSERT INTO `tbl_contacts_activity_relation` VALUES ('dda8dd42cb5f4f319371847467b26029', 'ef4ba9dd8694443a92200562467e5368', '14e05fca6a9c4ee08bdf751abb1e0b42');

-- ----------------------------
-- Table structure for `tbl_contacts_remark`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_contacts_remark`;
CREATE TABLE `tbl_contacts_remark` (
  `id` char(32) NOT NULL,
  `noteContent` varchar(255) DEFAULT NULL,
  `createBy` varchar(255) DEFAULT NULL,
  `createTime` char(19) DEFAULT NULL,
  `editBy` varchar(255) DEFAULT NULL,
  `editTime` char(19) DEFAULT NULL,
  `editFlag` char(1) DEFAULT NULL,
  `contactsId` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_contacts_remark
-- ----------------------------
INSERT INTO `tbl_contacts_remark` VALUES ('8e0344624e24434ea776b72e387c0a28', '备注22马云', '张三', '2021-04-10 11:39:31', null, null, '0', 'ef4ba9dd8694443a92200562467e5368');
INSERT INTO `tbl_contacts_remark` VALUES ('be9a9ad86a71432ca7c4252b9ceb9a8f', '备注11马云', '张三', '2021-04-10 11:39:31', null, null, '0', 'ef4ba9dd8694443a92200562467e5368');
INSERT INTO `tbl_contacts_remark` VALUES ('e1952291bebc4bb0beb806b4db1976fa', '备注33马云', '张三', '2021-04-10 11:39:31', null, null, '0', 'ef4ba9dd8694443a92200562467e5368');

-- ----------------------------
-- Table structure for `tbl_customer`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_customer`;
CREATE TABLE `tbl_customer` (
  `id` char(32) NOT NULL,
  `owner` char(32) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `createBy` varchar(255) DEFAULT NULL,
  `createTime` char(19) DEFAULT NULL,
  `editBy` varchar(255) DEFAULT NULL,
  `editTime` char(19) DEFAULT NULL,
  `contactSummary` varchar(255) DEFAULT NULL,
  `nextContactTime` char(10) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_customer
-- ----------------------------
INSERT INTO `tbl_customer` VALUES ('0100b3277d9347129e87c15799aac182', null, '阿里巴巴2', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `tbl_customer` VALUES ('0100b3277d9347129e87c15799aac183', null, '阿里巴巴3', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `tbl_customer` VALUES ('0100b3277d9347129e87c15799aac18c', '40f6cdea0bd34aceb77492a1656d9fb3', '阿里巴巴1', 'www.alibaba.com', '2222', '张三', '2021-04-10 11:39:31', null, null, '纪要222', '2021-04-07', '描述222', '阿里');
INSERT INTO `tbl_customer` VALUES ('a00962a9be74459a985bcb8e7d36e1bd', null, '顺丰快递', null, null, '张三', '2021-04-16 17:40:00', null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `tbl_customer_remark`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_customer_remark`;
CREATE TABLE `tbl_customer_remark` (
  `id` char(32) NOT NULL,
  `noteContent` varchar(255) DEFAULT NULL,
  `createBy` varchar(255) DEFAULT NULL,
  `createTime` char(19) DEFAULT NULL,
  `editBy` varchar(255) DEFAULT NULL,
  `editTime` char(19) DEFAULT NULL,
  `editFlag` char(1) DEFAULT NULL,
  `customerId` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_customer_remark
-- ----------------------------
INSERT INTO `tbl_customer_remark` VALUES ('53e2de3260e64ab7bf8aa2b02ad57b51', '备注22马云', '张三', '2021-04-10 11:39:31', null, null, '0', '0100b3277d9347129e87c15799aac18c');
INSERT INTO `tbl_customer_remark` VALUES ('757777a45ecd4d35a5724cfd6ad666bb', '备注11马云', '张三', '2021-04-10 11:39:31', null, null, '0', '0100b3277d9347129e87c15799aac18c');
INSERT INTO `tbl_customer_remark` VALUES ('f7e5f1e46d5247f6986ed8be5ecfd617', '备注33马云', '张三', '2021-04-10 11:39:31', null, null, '0', '0100b3277d9347129e87c15799aac18c');

-- ----------------------------
-- Table structure for `tbl_dic_type`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_dic_type`;
CREATE TABLE `tbl_dic_type` (
  `code` varchar(255) NOT NULL COMMENT '编码是主键，不能为空，不能含有中文。',
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_dic_type
-- ----------------------------
INSERT INTO `tbl_dic_type` VALUES ('appellation', '称呼', '');
INSERT INTO `tbl_dic_type` VALUES ('clueState', '线索状态', '');
INSERT INTO `tbl_dic_type` VALUES ('returnPriority', '回访优先级', '');
INSERT INTO `tbl_dic_type` VALUES ('returnState', '回访状态', '');
INSERT INTO `tbl_dic_type` VALUES ('source', '来源', '');
INSERT INTO `tbl_dic_type` VALUES ('stage', '阶段', '');
INSERT INTO `tbl_dic_type` VALUES ('transactionType', '交易类型', '');

-- ----------------------------
-- Table structure for `tbl_dic_value`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_dic_value`;
CREATE TABLE `tbl_dic_value` (
  `id` char(32) NOT NULL COMMENT '主键，采用UUID',
  `value` varchar(255) DEFAULT NULL COMMENT '不能为空，并且要求同一个字典类型下字典值不能重复，具有唯一性。',
  `text` varchar(255) DEFAULT NULL COMMENT '可以为空',
  `orderNo` varchar(255) DEFAULT NULL COMMENT '可以为空，但不为空的时候，要求必须是正整数',
  `typeCode` varchar(255) DEFAULT NULL COMMENT '外键',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_dic_value
-- ----------------------------
INSERT INTO `tbl_dic_value` VALUES ('06e3cbdf10a44eca8511dddfc6896c55', '虚假线索', '虚假线索', '4', 'clueState');
INSERT INTO `tbl_dic_value` VALUES ('0fe33840c6d84bf78df55d49b169a894', '销售邮件', '销售邮件', '8', 'source');
INSERT INTO `tbl_dic_value` VALUES ('12302fd42bd349c1bb768b19600e6b20', '交易会', '交易会', '11', 'source');
INSERT INTO `tbl_dic_value` VALUES ('1615f0bb3e604552a86cde9a2ad45bea', '最高', '最高', '2', 'returnPriority');
INSERT INTO `tbl_dic_value` VALUES ('176039d2a90e4b1a81c5ab8707268636', '教授', '教授', '5', 'appellation');
INSERT INTO `tbl_dic_value` VALUES ('1e0bd307e6ee425599327447f8387285', '将来联系', '将来联系', '2', 'clueState');
INSERT INTO `tbl_dic_value` VALUES ('2173663b40b949ce928db92607b5fe57', '丢失线索', '丢失线索', '5', 'clueState');
INSERT INTO `tbl_dic_value` VALUES ('2876690b7e744333b7f1867102f91153', '未启动', '未启动', '1', 'returnState');
INSERT INTO `tbl_dic_value` VALUES ('29805c804dd94974b568cfc9017b2e4c', '07成交', '07成交', '7', 'stage');
INSERT INTO `tbl_dic_value` VALUES ('310e6a49bd8a4962b3f95a1d92eb76f4', '试图联系', '试图联系', '1', 'clueState');
INSERT INTO `tbl_dic_value` VALUES ('31539e7ed8c848fc913e1c2c93d76fd1', '博士', '博士', '4', 'appellation');
INSERT INTO `tbl_dic_value` VALUES ('37ef211719134b009e10b7108194cf46', '01资质审查', '01资质审查', '1', 'stage');
INSERT INTO `tbl_dic_value` VALUES ('391807b5324d4f16bd58c882750ee632', '08丢失的线索', '08丢失的线索', '8', 'stage');
INSERT INTO `tbl_dic_value` VALUES ('3a39605d67da48f2a3ef52e19d243953', '聊天', '聊天', '14', 'source');
INSERT INTO `tbl_dic_value` VALUES ('474ab93e2e114816abf3ffc596b19131', '低', '低', '3', 'returnPriority');
INSERT INTO `tbl_dic_value` VALUES ('48512bfed26145d4a38d3616e2d2cf79', '广告', '广告', '1', 'source');
INSERT INTO `tbl_dic_value` VALUES ('4d03a42898684135809d380597ed3268', '合作伙伴研讨会', '合作伙伴研讨会', '9', 'source');
INSERT INTO `tbl_dic_value` VALUES ('59795c49896947e1ab61b7312bd0597c', '先生', '先生', '1', 'appellation');
INSERT INTO `tbl_dic_value` VALUES ('5c6e9e10ca414bd499c07b886f86202a', '高', '高', '1', 'returnPriority');
INSERT INTO `tbl_dic_value` VALUES ('67165c27076e4c8599f42de57850e39c', '夫人', '夫人', '2', 'appellation');
INSERT INTO `tbl_dic_value` VALUES ('68a1b1e814d5497a999b8f1298ace62b', '09因竞争丢失关闭', '09因竞争丢失关闭', '9', 'stage');
INSERT INTO `tbl_dic_value` VALUES ('6b86f215e69f4dbd8a2daa22efccf0cf', 'web调研', 'web调研', '13', 'source');
INSERT INTO `tbl_dic_value` VALUES ('72f13af8f5d34134b5b3f42c5d477510', '合作伙伴', '合作伙伴', '6', 'source');
INSERT INTO `tbl_dic_value` VALUES ('7c07db3146794c60bf975749952176df', '未联系', '未联系', '6', 'clueState');
INSERT INTO `tbl_dic_value` VALUES ('86c56aca9eef49058145ec20d5466c17', '内部研讨会', '内部研讨会', '10', 'source');
INSERT INTO `tbl_dic_value` VALUES ('9095bda1f9c34f098d5b92fb870eba17', '进行中', '进行中', '3', 'returnState');
INSERT INTO `tbl_dic_value` VALUES ('954b410341e7433faa468d3c4f7cf0d2', '已有业务', '已有业务', '1', 'transactionType');
INSERT INTO `tbl_dic_value` VALUES ('966170ead6fa481284b7d21f90364984', '已联系', '已联系', '3', 'clueState');
INSERT INTO `tbl_dic_value` VALUES ('96b03f65dec748caa3f0b6284b19ef2f', '推迟', '推迟', '2', 'returnState');
INSERT INTO `tbl_dic_value` VALUES ('97d1128f70294f0aac49e996ced28c8a', '新业务', '新业务', '2', 'transactionType');
INSERT INTO `tbl_dic_value` VALUES ('9ca96290352c40688de6596596565c12', '完成', '完成', '4', 'returnState');
INSERT INTO `tbl_dic_value` VALUES ('9e6d6e15232549af853e22e703f3e015', '需要条件', '需要条件', '7', 'clueState');
INSERT INTO `tbl_dic_value` VALUES ('9ff57750fac04f15b10ce1bbb5bb8bab', '02需求分析', '02需求分析', '2', 'stage');
INSERT INTO `tbl_dic_value` VALUES ('a70dc4b4523040c696f4421462be8b2f', '等待某人', '等待某人', '5', 'returnState');
INSERT INTO `tbl_dic_value` VALUES ('a83e75ced129421dbf11fab1f05cf8b4', '推销电话', '推销电话', '2', 'source');
INSERT INTO `tbl_dic_value` VALUES ('ab8472aab5de4ae9b388b2f1409441c1', '常规', '常规', '5', 'returnPriority');
INSERT INTO `tbl_dic_value` VALUES ('ab8c2a3dc05f4e3dbc7a0405f721b040', '05提案/报价', '05提案/报价', '5', 'stage');
INSERT INTO `tbl_dic_value` VALUES ('b924d911426f4bc5ae3876038bc7e0ad', 'web下载', 'web下载', '12', 'source');
INSERT INTO `tbl_dic_value` VALUES ('c13ad8f9e2f74d5aa84697bb243be3bb', '03价值建议', '03价值建议', '3', 'stage');
INSERT INTO `tbl_dic_value` VALUES ('c83c0be184bc40708fd7b361b6f36345', '最低', '最低', '4', 'returnPriority');
INSERT INTO `tbl_dic_value` VALUES ('db867ea866bc44678ac20c8a4a8bfefb', '员工介绍', '员工介绍', '3', 'source');
INSERT INTO `tbl_dic_value` VALUES ('e44be1d99158476e8e44778ed36f4355', '04确定决策者', '04确定决策者', '4', 'stage');
INSERT INTO `tbl_dic_value` VALUES ('e5f383d2622b4fc0959f4fe131dafc80', '女士', '女士', '3', 'appellation');
INSERT INTO `tbl_dic_value` VALUES ('e81577d9458f4e4192a44650a3a3692b', '06谈判/复审', '06谈判/复审', '6', 'stage');
INSERT INTO `tbl_dic_value` VALUES ('fb65d7fdb9c6483db02713e6bc05dd19', '在线商场', '在线商场', '5', 'source');
INSERT INTO `tbl_dic_value` VALUES ('fd677cc3b5d047d994e16f6ece4d3d45', '公开媒介', '公开媒介', '7', 'source');
INSERT INTO `tbl_dic_value` VALUES ('ff802a03ccea4ded8731427055681d48', '外部介绍', '外部介绍', '4', 'source');

-- ----------------------------
-- Table structure for `tbl_tran`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_tran`;
CREATE TABLE `tbl_tran` (
  `id` char(32) NOT NULL,
  `owner` char(32) DEFAULT NULL,
  `money` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `expectedDate` char(10) DEFAULT NULL,
  `customerId` char(32) DEFAULT NULL,
  `stage` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  `activityId` char(32) DEFAULT NULL,
  `contactsId` char(32) DEFAULT NULL,
  `createBy` varchar(255) DEFAULT NULL,
  `createTime` char(19) DEFAULT NULL,
  `editBy` varchar(255) DEFAULT NULL,
  `editTime` char(19) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `contactSummary` varchar(255) DEFAULT NULL,
  `nextContactTime` char(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_tran
-- ----------------------------
INSERT INTO `tbl_tran` VALUES ('801bac2daa9f45dda10971e50d168e11', null, null, null, null, null, '01资质审查', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `tbl_tran` VALUES ('801bac2daa9f45dda10971e50d168e22', null, null, null, null, null, '01资质审查', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `tbl_tran` VALUES ('801bac2daa9f45dda10971e50d168eb4', '张三', '10000', '交易123', '2021-04-16', '0100b3277d9347129e87c15799aac18c', '01资质审查', '新业务', '广告', '14e05fca6a9c4ee08bdf751abb1e0b42', 'ef4ba9dd8694443a92200562467e5368', '张三', '2021-04-16 17:37:54', null, null, '123', '234', '2021-04-16');
INSERT INTO `tbl_tran` VALUES ('edb0c7bf272d43b294e7c1e818ecf8ed', '张三', '10000', '棉花运输', '2021-04-15', 'a00962a9be74459a985bcb8e7d36e1bd', '03价值建议', '新业务', '广告', '14e05fca6a9c4ee08bdf751abb1e0b42', 'ef4ba9dd8694443a92200562467e5368', '张三', '2021-04-16 17:40:00', '张三', '2021-05-24 16:09:52', '12', '23', '2021-04-16');

-- ----------------------------
-- Table structure for `tbl_tran_history`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_tran_history`;
CREATE TABLE `tbl_tran_history` (
  `id` char(32) NOT NULL,
  `stage` varchar(255) DEFAULT NULL,
  `money` varchar(255) DEFAULT NULL,
  `expectedDate` char(10) DEFAULT NULL,
  `createTime` char(19) DEFAULT NULL,
  `createBy` varchar(255) DEFAULT NULL,
  `tranId` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_tran_history
-- ----------------------------
INSERT INTO `tbl_tran_history` VALUES ('0177ba04385a40b39d928472fa120eba', '07成交', '10000', '2021-04-15', '2021-05-01 11:16:05', '张三', 'edb0c7bf272d43b294e7c1e818ecf8ed');
INSERT INTO `tbl_tran_history` VALUES ('06e17edeff8b449b996ff0b6911615ed', '03价值建议', '10000', '2021-04-15', '2021-05-01 11:46:22', '张三', 'edb0c7bf272d43b294e7c1e818ecf8ed');
INSERT INTO `tbl_tran_history` VALUES ('072a1c518c484db08b12bb435ceb0159', '03价值建议', '10000', '2021-04-15', '2021-05-01 11:13:27', '张三', 'edb0c7bf272d43b294e7c1e818ecf8ed');
INSERT INTO `tbl_tran_history` VALUES ('0eca8ca7ebdf48c0baeb58328fb25ef1', '04确定决策者', '10000', '2021-04-15', '2021-05-01 11:14:41', '张三', 'edb0c7bf272d43b294e7c1e818ecf8ed');
INSERT INTO `tbl_tran_history` VALUES ('116d85077f5743d1bf303af82f9e620d', '08丢失的线索', '10000', '2021-04-15', '2021-05-01 11:58:52', '张三', 'edb0c7bf272d43b294e7c1e818ecf8ed');
INSERT INTO `tbl_tran_history` VALUES ('127ed9e2fef84c8fb12cea36aaeeeb82', '09因竞争丢失关闭', '10000', '2021-04-15', '2021-05-01 11:58:53', '张三', 'edb0c7bf272d43b294e7c1e818ecf8ed');
INSERT INTO `tbl_tran_history` VALUES ('15b19ed3a0f34409a35aa0ab65ee1822', '05提案/报价', '10000', '2021-04-15', '2021-05-01 11:58:46', '张三', 'edb0c7bf272d43b294e7c1e818ecf8ed');
INSERT INTO `tbl_tran_history` VALUES ('1c4e5de513944d3f88d8d58ce3cadd6c', '08丢失的线索', '10000', '2021-04-15', '2021-05-01 11:41:45', '张三', 'edb0c7bf272d43b294e7c1e818ecf8ed');
INSERT INTO `tbl_tran_history` VALUES ('34ff7dd3e6804144b019ae42e94dbac3', '09因竞争丢失关闭', '10000', '2021-04-15', '2021-05-01 11:59:00', '张三', 'edb0c7bf272d43b294e7c1e818ecf8ed');
INSERT INTO `tbl_tran_history` VALUES ('369e12ee6a9142bfb6b600a487d53e85', '07成交', '10000', '2021-04-15', '2021-05-01 11:58:50', '张三', 'edb0c7bf272d43b294e7c1e818ecf8ed');
INSERT INTO `tbl_tran_history` VALUES ('3abf740bba144108a46744f0a0be918c', '01资质审查', '10000', '2021-04-15', '2021-04-16 17:40:00', '张三', 'edb0c7bf272d43b294e7c1e818ecf8ed');
INSERT INTO `tbl_tran_history` VALUES ('4c332a5d649a43938421ca737ed3d9d0', '01资质审查', '10000', '2021-04-16', '2021-04-16 17:37:54', '张三', '801bac2daa9f45dda10971e50d168eb4');
INSERT INTO `tbl_tran_history` VALUES ('4e98bce49e74410295bc2c3385bea372', '05提案/报价', '10000', '2021-04-15', '2021-05-01 11:26:05', '张三', 'edb0c7bf272d43b294e7c1e818ecf8ed');
INSERT INTO `tbl_tran_history` VALUES ('65692dd195f84645983fff98b2c02291', '02需求分析', '10000', '2021-04-15', '2021-05-01 11:59:32', '张三', 'edb0c7bf272d43b294e7c1e818ecf8ed');
INSERT INTO `tbl_tran_history` VALUES ('674f24e95b0e461bad423e963ef0d2f3', '09因竞争丢失关闭', '10000', '2021-04-15', '2021-05-01 11:59:34', '张三', 'edb0c7bf272d43b294e7c1e818ecf8ed');
INSERT INTO `tbl_tran_history` VALUES ('750badc6b13947bdac56e26febbcd124', '06谈判/复审', '10000', '2021-04-15', '2021-05-01 11:58:58', '张三', 'edb0c7bf272d43b294e7c1e818ecf8ed');
INSERT INTO `tbl_tran_history` VALUES ('7aaee3dcfbaf49968ced573b051032b1', '02需求分析', '10000', '2021-04-15', '2021-05-01 11:58:55', '张三', 'edb0c7bf272d43b294e7c1e818ecf8ed');
INSERT INTO `tbl_tran_history` VALUES ('861f8c46e4df45fdb183b288fe6c5201', '05提案/报价', '10000', '2021-04-15', '2021-05-01 11:07:53', '张三', 'edb0c7bf272d43b294e7c1e818ecf8ed');
INSERT INTO `tbl_tran_history` VALUES ('90a1efc203e64236817216a32cf83830', '04确定决策者', '10000', '2021-04-15', '2021-05-01 11:59:35', '张三', 'edb0c7bf272d43b294e7c1e818ecf8ed');
INSERT INTO `tbl_tran_history` VALUES ('9600b26ad4d24fff9952a45e22bac1af', '04确定决策者', '10000', '2021-04-15', '2021-05-01 11:59:02', '张三', 'edb0c7bf272d43b294e7c1e818ecf8ed');
INSERT INTO `tbl_tran_history` VALUES ('9954daf2759f41ce9ca9f0daae0ad528', '05提案/报价', '10000', '2021-04-15', '2021-05-01 11:14:44', '张三', 'edb0c7bf272d43b294e7c1e818ecf8ed');
INSERT INTO `tbl_tran_history` VALUES ('a0b67218db2f4e719e97f33ead1d1ed2', '07成交', '10000', '2021-04-15', '2021-05-24 16:09:50', '张三', 'edb0c7bf272d43b294e7c1e818ecf8ed');
INSERT INTO `tbl_tran_history` VALUES ('a7f64ae986c249279d5544f96d7c2ead', '03价值建议', '10000', '2021-04-15', '2021-05-24 16:09:52', '张三', 'edb0c7bf272d43b294e7c1e818ecf8ed');
INSERT INTO `tbl_tran_history` VALUES ('abfc34b6f368426fb8cc62312f8a1811', '04确定决策者', '10000', '2021-04-15', '2021-05-01 11:05:56', '张三', 'edb0c7bf272d43b294e7c1e818ecf8ed');
INSERT INTO `tbl_tran_history` VALUES ('b5427f06897e4ff382ad5a5e404a43f0', '02需求分析', '10000', '2021-04-15', '2021-05-01 10:53:57', '张三', 'edb0c7bf272d43b294e7c1e818ecf8ed');
INSERT INTO `tbl_tran_history` VALUES ('ba8ff6a76b4a4acda1a1a68be0ab8da5', '08丢失的线索', '10000', '2021-04-15', '2021-05-01 11:59:33', '张三', 'edb0c7bf272d43b294e7c1e818ecf8ed');
INSERT INTO `tbl_tran_history` VALUES ('bdf9aba1ae1140eebf3d3a9406655c71', '05提案/报价', '10000', '2021-04-15', '2021-05-01 10:56:07', '张三', 'edb0c7bf272d43b294e7c1e818ecf8ed');
INSERT INTO `tbl_tran_history` VALUES ('c892a1de3f9040369db28f4ffd052c82', '08丢失的线索', '10000', '2021-04-15', '2021-05-01 10:54:06', '张三', 'edb0c7bf272d43b294e7c1e818ecf8ed');
INSERT INTO `tbl_tran_history` VALUES ('d65f0146ca5743dc96d2376756459523', '01资质审查', '10000', '2021-04-15', '2021-05-01 11:13:20', '张三', 'edb0c7bf272d43b294e7c1e818ecf8ed');
INSERT INTO `tbl_tran_history` VALUES ('e8fdb65d33df469384c3588dcb39c6c8', '01资质审查', '10000', '2021-04-15', '2021-05-01 11:26:30', '张三', 'edb0c7bf272d43b294e7c1e818ecf8ed');
INSERT INTO `tbl_tran_history` VALUES ('ecb640e6c3274a549bbe5a88e5ecce65', '05提案/报价', '10000', '2021-04-15', '2021-05-24 16:09:51', '张三', 'edb0c7bf272d43b294e7c1e818ecf8ed');

-- ----------------------------
-- Table structure for `tbl_tran_remark`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_tran_remark`;
CREATE TABLE `tbl_tran_remark` (
  `id` char(32) NOT NULL,
  `noteContent` varchar(255) DEFAULT NULL,
  `createBy` varchar(255) DEFAULT NULL,
  `createTime` char(19) DEFAULT NULL,
  `editBy` varchar(255) DEFAULT NULL,
  `editTime` char(19) DEFAULT NULL,
  `editFlag` char(1) DEFAULT NULL,
  `tranId` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_tran_remark
-- ----------------------------

-- ----------------------------
-- Table structure for `tbl_user`
-- ----------------------------
DROP TABLE IF EXISTS `tbl_user`;
CREATE TABLE `tbl_user` (
  `id` char(32) NOT NULL COMMENT 'uuid\r\n            ',
  `loginAct` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `loginPwd` varchar(255) DEFAULT NULL COMMENT '密码不能采用明文存储，采用密文，MD5加密之后的数据',
  `email` varchar(255) DEFAULT NULL,
  `expireTime` char(19) DEFAULT NULL COMMENT '失效时间为空的时候表示永不失效，失效时间为2018-10-10 10:10:10，则表示在该时间之前该账户可用。',
  `lockState` char(1) DEFAULT NULL COMMENT '锁定状态为空时表示启用，为0时表示锁定，为1时表示启用。',
  `deptno` char(4) DEFAULT NULL,
  `allowIps` varchar(255) DEFAULT NULL COMMENT '允许访问的IP为空时表示IP地址永不受限，允许访问的IP可以是一个，也可以是多个，当多个IP地址的时候，采用半角逗号分隔。允许IP是192.168.100.2，表示该用户只能在IP地址为192.168.100.2的机器上使用。',
  `createTime` char(19) DEFAULT NULL,
  `createBy` varchar(255) DEFAULT NULL,
  `editTime` char(19) DEFAULT NULL,
  `editBy` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_user
-- ----------------------------
INSERT INTO `tbl_user` VALUES ('06f5fc056eac41558a964f96daa7f27c', 'ls', '李四', '202cb962ac59075b964b07152d234b70', 'ls@163.com', '2018-11-27 21:50:05', '1', 'A001', '192.168.1.1', '2018-11-22 12:11:40', '李四', null, null);
INSERT INTO `tbl_user` VALUES ('40f6cdea0bd34aceb77492a1656d9f11', 'ww', '王五', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `tbl_user` VALUES ('40f6cdea0bd34aceb77492a1656d9fb3', 'zs', '张三', '202cb962ac59075b964b07152d234b70', 'zs@qq.com', '2021-11-30 23:50:55', '1', 'A001', '192.168.1.1,192.168.1.2,127.0.0.1,0:0:0:0:0:0:0:1', '2018-11-22 11:37:34', '张三', null, null);
