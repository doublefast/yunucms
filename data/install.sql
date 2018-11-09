/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50547
Source Host           : localhost:3306
Source Database       : yunucms

Target Server Type    : MYSQL
Target Server Version : 50547
File Encoding         : 65001

Date: 2018-01-13 15:21:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for yunu_admin
-- ----------------------------
DROP TABLE IF EXISTS `yunu_admin`;
CREATE TABLE `yunu_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT '' COMMENT '用户名',
  `password` varchar(255) DEFAULT '' COMMENT '密码',
  `loginnum` int(11) DEFAULT '0' COMMENT '登陆次数',
  `last_login_ip` varchar(255) DEFAULT '' COMMENT '最后登录IP',
  `last_login_time` int(11) DEFAULT '0' COMMENT '最后登录时间',
  `real_name` varchar(255) DEFAULT '' COMMENT '真实姓名',
  `status` int(1) DEFAULT '0' COMMENT '状态',
  `groupid` int(11) DEFAULT '1' COMMENT '用户角色id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of yunu_admin
-- ----------------------------
INSERT INTO `yunu_admin` VALUES ('1', 'admin', 'ebbd202c239d6fc65061ae22a13c1b69', '396', '127.0.0.1', '1515827554', 'admin', '1', '1');

-- ----------------------------
-- Table structure for yunu_area
-- ----------------------------
DROP TABLE IF EXISTS `yunu_area`;
CREATE TABLE `yunu_area` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL,
  `stitle` varchar(100) NOT NULL DEFAULT '' COMMENT '简称',
  `etitle` varchar(500) NOT NULL DEFAULT '',
  `pid` int(11) unsigned NOT NULL DEFAULT '0',
  `sort` int(11) unsigned NOT NULL DEFAULT '0',
  `istop` tinyint(1) NOT NULL DEFAULT '0',
  `iscon` tinyint(1) DEFAULT '0',
  `isurl` tinyint(1) DEFAULT '0',
  `seo_title` varchar(200) DEFAULT NULL,
  `seo_keywords` varchar(200) DEFAULT NULL,
  `seo_description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6026 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yunu_area
-- ----------------------------
INSERT INTO `yunu_area` VALUES ('1', '北京市', '北京', 'beijing', '0', '0', '1', '1', '1', '', '', '');
INSERT INTO `yunu_area` VALUES ('2', '上海市', '上海', 'shanghai', '0', '0', '0', '1', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('3', '天津市', '天津', 'tianjing', '0', '0', '0', '1', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('4', '重庆市', '重庆', 'chongqing', '0', '0', '0', '1', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('5', '广东省', '广东', 'guangdong', '0', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('6', '福建省', '福建', 'fujian', '0', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('7', '浙江省', '浙江', 'zhejiang', '0', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('8', '江苏省', '江苏', 'jiangsu', '0', '0', '0', '1', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('9', '山东省', '山东', 'shandong', '0', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('10', '辽宁省', '辽宁', 'liaoning', '0', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('11', '江西省', '江西', 'jiangxi', '0', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('12', '四川省', '四川', 'sichuan', '0', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('13', '陕西省', '陕西', 'shanxi', '0', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('14', '湖北省', '湖北', 'hubei', '0', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('15', '河南省', '河南', 'henan', '0', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('16', '河北省', '河北', 'hebei', '0', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('17', '山西省', '山西', 'shanxi1', '0', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('18', '内蒙古', '内蒙古', 'neimengug', '0', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('19', '吉林省', '吉林', 'jiling', '0', '0', '1', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('20', '黑龙江', '黑龙江', 'heilongjiang', '0', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('21', '安徽省', '安徽', 'anhui', '0', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('22', '湖南省', '湖南', 'hunan', '0', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('23', '广西', '广西', 'guangxi', '0', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('24', '海南省', '海南', 'hainan', '0', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('25', '云南省', '云南', 'yunnan', '0', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('26', '贵州省', '贵州', 'guizhou', '0', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('27', '西藏', '西藏', 'xizang', '0', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('28', '甘肃省', '甘肃', 'gansu', '0', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('29', '宁夏区', '宁夏区', 'ningxiaqu', '0', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('30', '青海省', '青海', 'qinghai', '0', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('31', '新疆', '新疆', 'xinjiang', '0', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('32', '香港', '香港', 'xianggang', '0', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('33', '澳门', '澳门', 'aomen', '0', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('34', '台湾省', '台湾', 'taiwan', '0', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('415', '永川市', '永川', 'yongchuan', '4', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('416', '合川市', '合川', 'hechuan', '4', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('417', '江津市', '江津', 'jiangjin', '4', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('418', '南川市', '南川', 'nanchuan', '4', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('501', '广州市', '广州', 'guangzhou', '5', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('502', '深圳市', '深圳', 'shenzhen', '5', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('503', '珠海市', '珠海', 'zhuhai', '5', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('504', '汕头市', '汕头', 'shantou', '5', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('505', '韶关市', '韶关', 'shaoguan', '5', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('506', '河源市', '河源', 'heyuan', '5', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('507', '梅州市', '梅州', 'meizhou', '5', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('508', '惠州市', '惠州', 'huizhou', '5', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('509', '汕尾市', '汕尾', 'shanwei', '5', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('510', '东莞市', '东莞', 'dongguan', '5', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('511', '中山市', '中山', 'zhongshan', '5', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('512', '江门市', '江门', 'jiangmen', '5', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('513', '佛山市', '佛山', 'foshan', '5', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('514', '阳江市', '阳江', 'yangjiang', '5', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('515', '湛江市', '湛江', 'zhanjiang', '5', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('516', '茂名市', '茂名', 'maoming', '5', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('517', '肇庆市', '肇庆', 'zhaoqing', '5', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('518', '清远市', '清远', 'qingyuan', '5', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('519', '潮州市', '潮州', 'chaozhou', '5', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('520', '揭阳市', '揭阳', 'jieyang', '5', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('521', '云浮市', '云浮', 'yunfu', '5', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('601', '福州市', '福州', 'fuzhou', '6', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('602', '厦门市', '厦门', 'xiamen', '6', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('603', '三明市', '三明', 'sanming', '6', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('604', '莆田市', '莆田', 'putian', '6', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('605', '泉州市', '泉州', 'quanzhou', '6', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('606', '漳州市', '漳州', 'zhangzhou', '6', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('607', '南平市', '南平', 'nanping', '6', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('608', '龙岩市', '龙岩', 'longyan', '6', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('609', '宁德市', '宁德', 'ningde', '6', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('701', '杭州市', '杭州', 'hangzhou', '7', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('702', '宁波市', '宁波', 'ningbo', '7', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('703', '温州市', '温州', 'wenzhou', '7', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('704', '嘉兴市', '嘉兴', 'jiaxing', '7', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('705', '湖州市', '湖州', 'huzhou', '7', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('706', '绍兴市', '绍兴', 'shaoxing', '7', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('707', '金华市', '金华', 'jinhua', '7', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('708', '衢州市', '衢州', 'quzhou', '7', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('709', '舟山市', '舟山', 'zhoushan', '7', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('710', '台州市', '台州', 'taizhou', '7', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('711', '丽水市', '丽水', 'lishui', '7', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('801', '南京市', '南京', 'nanjing', '8', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('802', '徐州市', '徐州', 'xuzhou', '8', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('803', '连云港市', '连云港', 'lianyungang', '8', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('804', '淮安市', '淮安', 'huaian', '8', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('805', '宿迁市', '宿迁', 'suqian', '8', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('806', '盐城市', '盐城', 'yancheng', '8', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('807', '扬州市', '扬州', 'yangzhou', '8', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('808', '泰州市', '泰州', 'taizhou1', '8', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('809', '南通市', '南通', 'nantong', '8', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('810', '镇江市', '镇江', 'zhenjiang', '8', '0', '0', '1', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('811', '常州市', '常州', 'changzhou', '8', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('812', '无锡市', '无锡', 'wuxishi', '8', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('813', '苏州市', '苏州', 'suzhoushi', '8', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('901', '济南市', '济南', 'jinan', '9', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('902', '青岛市', '青岛', 'qingdao', '9', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('903', '淄博市', '淄博', 'zibo', '9', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('904', '枣庄市', '枣庄', 'zaozhuang', '9', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('905', '东营市', '东营', 'dongying', '9', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('906', '潍坊市', '潍坊', 'weifang', '9', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('907', '烟台市', '烟台', 'yantai', '9', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('908', '威海市', '威海', 'weihai', '9', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('909', '济宁市', '济宁', 'jining', '9', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('910', '泰安市', '泰安', 'taian', '9', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('911', '日照市', '日照', 'rizhao', '9', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('912', '莱芜市', '莱芜', 'laiwu', '9', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('913', '德州市', '德州', 'dezhou', '9', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('914', '临沂市', '临沂', 'linyi', '9', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('915', '聊城市', '聊城', 'liaocheng', '9', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('916', '滨州市', '滨州', 'binzhou', '9', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('917', '菏泽市', '菏泽', 'heze', '9', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1001', '沈阳市', '沈阳', 'shenyang', '10', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1002', '大连市', '大连', 'dalian', '10', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1003', '鞍山市', '鞍山', 'anshan', '10', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1004', '抚顺市', '抚顺', 'fushun', '10', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1005', '本溪市', '本溪', 'benxi', '10', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1006', '丹东市', '丹东', 'dandong', '10', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1007', '锦州市', '锦州', 'jinzhou', '10', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1008', '葫芦岛市', '葫芦岛', 'huludao', '10', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1009', '营口市', '营口', 'yingkou', '10', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1010', '盘锦市', '盘锦', 'panjin', '10', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1011', '阜新市', '阜新', 'fuxin', '10', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1012', '辽阳市', '辽阳', 'liaoyang', '10', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1013', '铁岭市', '铁岭', 'tieling', '10', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1014', '朝阳市', '朝阳', 'chaoyang', '10', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1101', '南昌市', '南昌', 'nanchang', '11', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1102', '景德镇市', '景德镇', 'jingdezhen', '11', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1103', '萍乡市', '萍乡', 'pingxiang', '11', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1104', '新余市', '新余', 'xinyu', '11', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1105', '九江市', '九江', 'jiujiang', '11', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1106', '鹰潭市', '鹰潭', 'yingtan', '11', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1107', '赣州市', '赣州', 'ganzhou', '11', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1108', '吉安市', '吉安', 'jian', '11', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1109', '宜春市', '宜春', 'yichun', '11', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1110', '抚州市', '抚州', 'fuzhou1', '11', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1111', '上饶市', '上饶', 'shangrao', '11', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1201', '成都市', '成都', 'chengdu', '12', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1202', '自贡市', '自贡', 'zigong', '12', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1203', '攀枝花市', '攀枝花', 'panzhihua', '12', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1204', '泸州市', '泸州', 'luzhou', '12', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1205', '德阳市', '德阳', 'deyang', '12', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1206', '绵阳市', '绵阳', 'mianyang', '12', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1207', '广元市', '广元', 'guangyuan', '12', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1208', '遂宁市', '遂宁', 'suining', '12', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1209', '内江市', '内江', 'najiang', '12', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1210', '乐山市', '乐山', 'leshan', '12', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1211', '南充市', '南充', 'nanchong', '12', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1212', '宜宾市', '宜宾', 'yibin', '12', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1213', '广安市', '广安', 'guangan', '12', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1214', '达州市', '达州', 'dazhou', '12', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1215', '巴中市', '巴中', 'bazhong', '12', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1216', '雅安市', '雅安', 'yaan', '12', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1217', '眉山市', '眉山', 'meishan', '12', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1218', '资阳市', '资阳', 'ziyang', '12', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1219', '阿坝州', '阿坝', 'aba', '12', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1220', '甘孜州', '甘孜', 'ganzi', '12', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1221', '凉山州', '凉山', 'liangshan', '12', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('3114', '西安市', '西安', 'xian', '13', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1302', '铜川市', '铜川', 'tongchuan', '13', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1303', '宝鸡市', '宝鸡', 'baoji', '13', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1304', '咸阳市', '咸阳', 'xianyang', '13', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1305', '渭南市', '渭南', 'weinan', '13', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1306', '延安市', '延安', 'yanan', '13', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1307', '汉中市', '汉中', 'hanzhong', '13', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1308', '榆林市', '榆林', 'yulin', '13', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1309', '安康市', '安康', 'ankang', '13', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1310', '商洛地区', '商洛地区', 'shangluodiqu', '13', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1401', '武汉市', '武汉', 'wuhan', '14', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1402', '黄石市', '黄石', 'huangshi', '14', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1403', '襄樊市', '襄樊', 'xiangfan', '14', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1404', '十堰市', '十堰', 'shiyan', '14', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1405', '荆州市', '荆州', 'jingzhou', '14', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1406', '宜昌市', '宜昌', 'yichang', '14', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1407', '荆门市', '荆门', 'jingmen', '14', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1408', '鄂州市', '鄂州', 'ezhou', '14', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1409', '孝感市', '孝感', 'xiaogan', '14', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1410', '黄冈市', '黄冈', 'huanggang', '14', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1411', '咸宁市', '咸宁', 'xianning', '14', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1412', '随州市', '随州', 'suizhou', '14', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1413', '仙桃市', '仙桃', 'xiantao', '14', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1414', '天门市', '天门', 'tianmen', '14', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1415', '潜江市', '潜江', 'qianjiang', '14', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1416', '神农架', '神农架', 'shennongjia', '14', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1417', '恩施州', '恩施', 'enshi', '14', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1501', '郑州市', '郑州', 'zhengzhou', '15', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1502', '开封市', '开封', 'kaifeng', '15', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1503', '洛阳市', '洛阳', 'luoyang', '15', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1504', '平顶山市', '平顶山', 'pingdingshan', '15', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1505', '焦作市', '焦作', 'jiaozuo', '15', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1506', '鹤壁市', '鹤壁', 'hebi', '15', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1507', '新乡市', '新乡', 'xinxiang', '15', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1508', '安阳市', '安阳', 'anyang', '15', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1509', '濮阳市', '濮阳', 'puyang', '15', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1510', '许昌市', '许昌', 'xuchang', '15', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1511', '漯河市', '漯河', 'leihe', '15', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1512', '三门峡市', '三门峡', 'sanmenxia', '15', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1513', '南阳市', '南阳', 'nanyang', '15', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1514', '商丘市', '商丘', 'shangqiu', '15', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1515', '信阳市', '信阳', 'xinyang', '15', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1516', '周口市', '周口', 'zhoukou', '15', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1517', '驻马店市', '驻马店', 'zhumadian', '15', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1518', '济源市', '济源', 'jiyuan', '15', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1601', '石家庄市', '石家庄', 'shijiazhuang', '16', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1602', '唐山市', '唐山', 'tangshan', '16', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1603', '秦皇岛市', '秦皇岛', 'qinhuangdao', '16', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1604', '邯郸市', '邯郸', 'handan', '16', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1605', '邢台市', '邢台', 'xingtai', '16', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1606', '保定市', '保定', 'baoding', '16', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1607', '张家口市', '张家口', 'zhangjiakou', '16', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1608', '承德市', '承德', 'chengde', '16', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1609', '沧州市', '沧州', 'cangzhou', '16', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1610', '廊坊市', '廊坊', 'langfang', '16', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1611', '衡水市', '衡水', 'hengshui', '16', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1701', '太原市', '太原', 'taiyuan', '17', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1702', '大同市', '大同', 'datong', '17', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1703', '阳泉市', '阳泉', 'yangquan', '17', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1704', '长治市', '长治', 'changzhi', '17', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1705', '晋城市', '晋城', 'jincheng', '17', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1706', '朔州市', '朔州', 'shuozhou', '17', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1707', '晋中市', '晋中', 'jinzhong', '17', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1708', '忻州市', '忻州', 'xinzhou', '17', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1709', '临汾市', '临汾', 'linfen', '17', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1710', '运城市', '运城', 'yuncheng', '17', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1711', '吕梁地区', '吕梁地区', 'lvliangdiqu', '17', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1801', '呼和浩特', '呼和浩特', 'huhehaote', '18', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1802', '包头市', '包头', 'baotou', '18', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1803', '乌海市', '乌海', 'wuhai', '18', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1804', '赤峰市', '赤峰', 'chifeng', '18', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1805', '通辽市', '通辽', 'tongliao', '18', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1806', '鄂尔多斯', '鄂尔多斯', 'eerduosi', '18', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1807', '乌兰察布', '乌兰察布', 'wulanchabu', '18', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1808', '锡林郭勒', '锡林郭勒', 'xilinguole', '18', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1809', '呼伦贝尔', '呼伦贝尔', 'hulunbeier', '18', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1810', '巴彦淖尔', '巴彦淖尔', 'bayanneer', '18', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1811', '阿拉善盟', '阿拉善盟', 'alashanmeng', '18', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1812', '兴安盟', '兴安盟', 'xinganmeng', '18', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1901', '长春市', '长春', 'changchun', '19', '0', '1', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1902', '吉林市', '吉林', 'jilin', '19', '0', '1', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1903', '四平市', '四平', 'siping', '19', '1', '1', '1', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1904', '辽源市', '辽源', 'liaoyuan', '19', '0', '1', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1905', '通化市', '通化', 'tonghua', '19', '0', '1', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1906', '白山市', '白山', 'baishan', '19', '0', '1', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1907', '松原市', '松原', 'songyuan', '19', '0', '1', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1908', '白城市', '白城', 'baicheng', '19', '0', '1', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('1909', '延边州', '延边', 'yanbian', '19', '0', '1', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2001', '哈尔滨市', '哈尔滨', 'haerbin', '20', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2002', '齐齐哈尔', '齐齐哈尔', 'qiqihaer', '20', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2003', '鹤岗市', '鹤岗', 'hegang', '20', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2004', '双鸭山市', '双鸭山', 'shuangyashan', '20', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2005', '鸡西市', '鸡西', 'jixi', '20', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2006', '大庆市', '大庆', 'daqing', '20', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2007', '伊春市', '伊春', 'yichun1', '20', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2008', '牡丹江市', '牡丹江', 'mudanjiang', '20', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2009', '佳木斯市', '佳木斯', 'jiamusi', '20', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2010', '七台河市', '七台河', 'qitaihe', '20', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2011', '黑河市', '黑河', 'heihe', '20', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2012', '绥化市', '绥化', 'suihua', '20', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2013', '大兴安岭', '大兴安岭', 'daxinganling', '20', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2101', '合肥市', '合肥', 'hefei', '21', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2102', '芜湖市', '芜湖', 'wuhu', '21', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2103', '蚌埠市', '蚌埠', 'bangbu', '21', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2104', '淮南市', '淮南', 'huainan', '21', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2105', '马鞍山市', '马鞍山', 'maanshan', '21', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2106', '淮北市', '淮北', 'huaibei', '21', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2107', '铜陵市', '铜陵', 'tongling', '21', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2108', '安庆市', '安庆', 'anqing', '21', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2109', '黄山市', '黄山', 'huangshan', '21', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2110', '滁州市', '滁州', 'chuzhou', '21', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2111', '阜阳市', '阜阳', 'fuyang', '21', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2112', '宿州市', '宿州', 'suzhou', '21', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2113', '巢湖市', '巢湖', 'chaohu', '21', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2114', '六安市', '六安', 'liuan', '21', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2115', '亳州市', '亳州', 'bozhou', '21', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2116', '宣城市', '宣城', 'xuancheng', '21', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2117', '池州市', '池州', 'chizhou', '21', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2201', '长沙市', '长沙', 'changsha', '22', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2202', '株州市', '株州', 'zhuzhou', '22', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2203', '湘潭市', '湘潭', 'xiangtan', '22', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2204', '衡阳市', '衡阳', 'hengyang', '22', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2205', '邵阳市', '邵阳', 'shaoyang', '22', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2206', '岳阳市', '岳阳', 'yueyang', '22', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2207', '常德市', '常德', 'changde', '22', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2208', '张家界市', '张家界', 'zhangjiajie', '22', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2209', '益阳市', '益阳', 'yiyang', '22', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2210', '郴州市', '郴州', 'chenzhou', '22', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2211', '永州市', '永州', 'yongzhou', '22', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2212', '怀化市', '怀化', 'huaihua', '22', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2213', '娄底市', '娄底', 'loudi', '22', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2214', '湘西州', '湘西', 'xiangxi', '22', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2301', '南宁市', '南宁', 'nanning', '23', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2302', '柳州市', '柳州', 'liuzhou', '23', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2303', '桂林市', '桂林', 'guilin', '23', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2304', '梧州市', '梧州', 'wuzhou', '23', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2305', '北海市', '北海', 'beihai', '23', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2306', '防城港市', '防城港', 'fangchenggang', '23', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2307', '钦州市', '钦州', 'qinzhou', '23', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2308', '贵港市', '贵港', 'guigang', '23', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2309', '玉林市', '玉林', 'yulin1', '23', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2310', '南宁地区', '南宁地区', 'nanningdiqu', '23', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2311', '柳州地区', '柳地区', 'liudiqu', '23', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2312', '贺州地区', '贺地区', 'hediqu', '23', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2313', '百色地区', '百色地区', 'baisediqu', '23', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2314', '河池地区', '河池地区', 'hechidiqu', '23', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2401', '海口市', '海口', 'haikou', '24', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2402', '三亚市', '三亚', 'sanya', '24', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2403', '五指山市', '五指山', 'wuzhishan', '24', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2404', '琼海市', '琼海', 'qionghai', '24', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2405', '儋州市', '儋州', 'danzhou', '24', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2406', '琼山市', '琼山', 'qiongshan', '24', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2407', '文昌市', '文昌', 'wenchang', '24', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2408', '万宁市', '万宁', 'wanning', '24', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2409', '东方市', '东方', 'dongfang', '24', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2501', '昆明市', '昆明', 'kunming', '25', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2502', '曲靖市', '曲靖', 'qujing', '25', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2503', '玉溪市', '玉溪', 'yuxi', '25', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2504', '保山市', '保山', 'baoshan', '25', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2505', '昭通市', '昭通', 'zhaotong', '25', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2506', ' 普洱市', ' 普洱', 'puer', '25', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2507', '临沧市', '临沧', 'lincang', '25', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2508', '丽江市', '丽江', 'lijiang', '25', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2509', '文山州', '文山', 'wenshan', '25', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2510', '红河州', '红河', 'honghe', '25', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2511', '西双版纳', '西双版纳', 'xishuangbanna', '25', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2512', '楚雄州', '楚雄', 'chuxiong', '25', '0', '0', '1', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2513', '大理州', '大理', 'dali', '25', '0', '0', '1', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2514', '德宏州', '德宏', 'dehong', '25', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2515', '怒江州', '怒江', 'nujiang', '25', '0', '0', '1', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2516', '迪庆州', '迪庆', 'diqing', '25', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2601', '贵阳市', '贵阳', 'guiyang', '26', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2602', '六盘水市', '六盘水', 'liupanshui', '26', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2603', '遵义市', '遵义', 'zunyi', '26', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2604', '安顺市', '安顺', 'anshun', '26', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2605', '铜仁地区', '铜仁地区', 'tongrendiqu', '26', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2606', '毕节地区', '毕节地区', 'bijiediqu', '26', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2607', '黔西南州', '黔西南', 'qianxinan', '26', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2608', '黔东南州', '黔东南', 'qiandongnan', '26', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2609', '黔南州', '黔南', 'qiannan', '26', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2701', '拉萨市', '拉萨', 'lasa', '27', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2702', '那曲地区', '那曲地区', 'naqudiqu', '27', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2703', '昌都地区', '昌都地区', 'changdudiqu', '27', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2704', '山南地区', '山南地区', 'shannandiqu', '27', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2705', '日喀则', '日喀则', 'rikaze', '27', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2706', '阿里地区', '阿里地区', 'alidiqu', '27', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2707', '林芝地区', '林芝地区', 'linzhidiqu', '27', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2801', '兰州市', '兰州', 'lanzhou', '28', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2802', '金昌市', '金昌', 'jinchang', '28', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2803', '白银市', '白银', 'baiyin', '28', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2804', '天水市', '天水', 'tianshui', '28', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2805', '嘉峪关市', '嘉峪关', 'jiayuguan', '28', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2806', '武威市', '武威', 'wuwei', '28', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2807', '定西地区', '定西地区', 'dingxidiqu', '28', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2808', '平凉地区', '平凉地区', 'pingliangdiqu', '28', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2809', '庆阳地区', '庆阳地区', 'qingyangdiqu', '28', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2810', '陇南地区', '陇南地区', 'longnandiqu', '28', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2811', '张掖地区', '张掖地区', 'zhangyediqu', '28', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2812', '酒泉地区', '酒泉地区', 'jiuquandiqu', '28', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2813', '甘南州', '甘南', 'gannan', '28', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2814', '临夏州', '临夏', 'linxia', '28', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2901', '银川市', '银川', 'yinchuan', '29', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2902', '石嘴山市', '石嘴山', 'shizuishan', '29', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2903', '吴忠市', '吴忠', 'wuzhong', '29', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('2904', '固原市', '固原', 'guyuan', '29', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('3001', '西宁市', '西宁', 'xining', '30', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('3002', '海东地区', '海东地区', 'haidongdiqu', '30', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('3003', '海北州', '海北', 'haibei', '30', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('3004', '黄南州', '黄南', 'huangnan', '30', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('3005', '海南州', '海南', 'hainan1', '30', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('3006', '果洛州', '果洛', 'guoluo', '30', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('3007', '玉树州', '玉树', 'yushu', '30', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('3008', '海西州', '海西', 'haixi', '30', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('3101', '乌鲁木齐', '乌鲁木齐', 'wulumuqi', '31', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('3102', '克拉玛依', '克拉玛依', 'kelamayi', '31', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('3103', '石河子市', '石河子', 'shihezi', '31', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('3104', '吐鲁番', '吐鲁番', 'tulufan', '31', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('3105', '哈密地区', '哈密地区', 'hamidiqu', '31', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('3106', '和田地区', '和田地区', 'hetiandiqu', '31', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('3107', '阿克苏', '阿克苏', 'akesu', '31', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('3108', '喀什地区', '喀什地区', 'kashidiqu', '31', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('3109', '克孜勒苏', '克孜勒苏', 'kezilesu', '31', '0', '0', '1', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('3110', '巴音郭楞', '巴音郭楞', 'bayinguoleng', '31', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('3111', '昌吉州', '昌吉', 'changji', '31', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('3112', '博尔塔拉', '博尔塔拉', 'boertala', '31', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('3113', '伊犁州', '伊犁', 'yili', '31', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('3201', '香港岛', '香港岛', 'xianggangdao', '32', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('3202', '九龙', '九龙', 'jiulong', '32', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('3203', '新界', '新界', 'xinjie', '32', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('3301', '澳门半岛', '澳门半岛', 'aomenbandao', '33', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('3302', '离岛', '离岛', 'lidao', '33', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('3401', '台北市', '台北', 'taibei', '34', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('3402', '高雄市', '高雄', 'gaoxiong', '34', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('3403', '台南市', '台南', 'tainan', '34', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('3404', '台中市', '台中', 'taizhong', '34', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('3407', '基隆市', '基隆', 'jilong', '34', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('3408', '新竹市', '新竹', 'xinzhu', '34', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('3409', '嘉义市', '嘉义', 'jiayi', '34', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('3410', '新北市', '新北', 'xinbei', '34', '0', '0', '0', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('6019', '丹阳市', '丹阳', 'danyang', '810', '1', '0', '1', '0', null, null, null);
INSERT INTO `yunu_area` VALUES ('6020', '扬中市', '扬中', 'yangzhong', '810', '2', '0', '1', '0', null, null, null);

-- ----------------------------
-- Table structure for yunu_auth_group
-- ----------------------------
DROP TABLE IF EXISTS `yunu_auth_group`;
CREATE TABLE `yunu_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `title` char(100) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `rules` varchar(1000) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yunu_auth_group
-- ----------------------------
INSERT INTO `yunu_auth_group` VALUES ('1', '超级管理员', '1', '', '1446535750', '1446535750');

-- ----------------------------
-- Table structure for yunu_auth_group_access
-- ----------------------------
DROP TABLE IF EXISTS `yunu_auth_group_access`;
CREATE TABLE `yunu_auth_group_access` (
  `uid` mediumint(8) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yunu_auth_group_access
-- ----------------------------
INSERT INTO `yunu_auth_group_access` VALUES ('0', '1');
INSERT INTO `yunu_auth_group_access` VALUES ('1', '1');
INSERT INTO `yunu_auth_group_access` VALUES ('4', '8');
INSERT INTO `yunu_auth_group_access` VALUES ('5', '12');

-- ----------------------------
-- Table structure for yunu_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `yunu_auth_rule`;
CREATE TABLE `yunu_auth_rule` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(80) NOT NULL DEFAULT '',
  `title` char(20) NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `css` varchar(20) NOT NULL COMMENT '样式',
  `condition` char(100) NOT NULL DEFAULT '',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '父栏目ID',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=204 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yunu_auth_rule
-- ----------------------------
INSERT INTO `yunu_auth_rule` VALUES ('1', '#', '常用菜单', '1', '1', 'fa fa-building', '', '0', '1', '1446535750', '1501903299');
INSERT INTO `yunu_auth_rule` VALUES ('2', 'admin/system/basic', '基础设置', '1', '1', 'fa fa-cogs', '', '1', '0', '1446535750', '1502883984');
INSERT INTO `yunu_auth_rule` VALUES ('3', 'admin/category/index', '栏目设置', '1', '1', 'fa fa-list', '', '1', '1', '1446535750', '1501832913');
INSERT INTO `yunu_auth_rule` VALUES ('6', 'admin/data/index', '数据库管理', '1', '1', 'fa fa-database', '', '127', '4', '1446535750', '1502154059');
INSERT INTO `yunu_auth_rule` VALUES ('7', 'admin/url/index', 'URL设置', '1', '1', 'fa fa-paste', '', '1', '2', '1446535750', '1502803740');
INSERT INTO `yunu_auth_rule` VALUES ('159', 'admin/diyfield/adddiyline', '新增分组线', '1', '1', '', '', '153', '8', '1502801140', '1502801140');
INSERT INTO `yunu_auth_rule` VALUES ('162', 'admin/user/myuser', '我的帐户', '1', '1', 'fa fa-user', '', '1', '3', '1502803939', '1504339586');
INSERT INTO `yunu_auth_rule` VALUES ('9', 'admin/menu/index', '菜单管理', '1', '1', 'fa fa-server', '', '127', '0', '1501834142', '1502800572');
INSERT INTO `yunu_auth_rule` VALUES ('10', '#', '内容管理', '1', '1', 'fa fa-edit', '', '0', '2', '1501834284', '1501834293');
INSERT INTO `yunu_auth_rule` VALUES ('11', 'admin/content/index', '内容管理', '1', '1', 'fa fa-edit', '', '10', '0', '1501834356', '1501834356');
INSERT INTO `yunu_auth_rule` VALUES ('160', 'admin/diyfield/editdiyline', '编辑分组线', '1', '1', '', '', '153', '9', '1502801188', '1502801188');
INSERT INTO `yunu_auth_rule` VALUES ('116', 'admin/banner/index', '幻灯片管理', '1', '1', 'fa fa-photo', '', '118', '5', '1501835145', '1502704480');
INSERT INTO `yunu_auth_rule` VALUES ('117', 'admin/block/category', '自定义块', '1', '1', 'fa fa-tag', '', '118', '6', '1501835395', '1502704497');
INSERT INTO `yunu_auth_rule` VALUES ('118', '#', '扩展管理', '1', '1', 'fa fa-bar-chart', '', '0', '4', '1501835526', '1502704453');
INSERT INTO `yunu_auth_rule` VALUES ('119', 'admin/system/seo', '首页SEO设置', '1', '1', 'fa fa-adjust', '', '118', '0', '1501835598', '1506327744');
INSERT INTO `yunu_auth_rule` VALUES ('120', 'admin/link/index', '友情链接', '1', '1', 'fa fa-sitemap', '', '118', '2', '1501835776', '1501835813');
INSERT INTO `yunu_auth_rule` VALUES ('121', 'admin/area/index', '地区管理', '1', '1', 'fa fa-globe', '', '118', '3', '1501835925', '1501835925');
INSERT INTO `yunu_auth_rule` VALUES ('122', '#', 'WAP设置', '1', '1', 'fa fa-mobile', '', '0', '5', '1501836081', '1501836103');
INSERT INTO `yunu_auth_rule` VALUES ('123', 'admin/wap/index', '基本设置', '1', '1', 'fa fa-mobile', '', '122', '0', '1501836095', '1502704808');
INSERT INTO `yunu_auth_rule` VALUES ('167', 'admin/upgrade/index', '平台管理', '1', '1', 'fa fa-cloud-upload', '', '127', '6', '1505378826', '1505802870');
INSERT INTO `yunu_auth_rule` VALUES ('125', 'admin/menu/addrule', '新增菜单', '1', '1', '', '', '9', '0', '1501894012', '1501894012');
INSERT INTO `yunu_auth_rule` VALUES ('126', 'admin/menu/editrule', '编辑菜单', '1', '1', '', '', '9', '0', '1501895017', '1501895017');
INSERT INTO `yunu_auth_rule` VALUES ('127', '#', '系统管理', '1', '1', 'fa fa-tv', '', '0', '7', '1501895233', '1501895233');
INSERT INTO `yunu_auth_rule` VALUES ('128', 'admin/role/index', '角色管理', '1', '1', 'fa fa-id-badge', '', '127', '2', '1501895662', '1501895662');
INSERT INTO `yunu_auth_rule` VALUES ('129', 'admin/user/index', '管理员管理', '1', '1', 'fa fa-id-card', '', '127', '3', '1501895718', '1501895718');
INSERT INTO `yunu_auth_rule` VALUES ('131', 'admin/role/addrole', '新增角色', '1', '1', '', '', '128', '1', '1502074929', '1502074929');
INSERT INTO `yunu_auth_rule` VALUES ('132', 'admin/role/editrole', '编辑角色', '1', '1', '', '', '128', '2', '1502074953', '1502074953');
INSERT INTO `yunu_auth_rule` VALUES ('133', 'admin/user/adduser', '新增管理员', '1', '1', '', '', '129', '1', '1502099070', '1502099070');
INSERT INTO `yunu_auth_rule` VALUES ('134', 'admin/user/edituser', '编辑管理员', '1', '1', '', '', '129', '2', '1502099244', '1502099244');
INSERT INTO `yunu_auth_rule` VALUES ('135', 'admin/data/import', '数据库恢复', '1', '1', '', '', '6', '1', '1502158772', '1502158772');
INSERT INTO `yunu_auth_rule` VALUES ('136', 'admin/log/index', '日志管理', '1', '1', 'fa fa-map-o', '', '127', '5', '1502161451', '1502800493');
INSERT INTO `yunu_auth_rule` VALUES ('137', 'admin/banner/addbanner', '新增幻灯片', '1', '1', '', '', '116', '1', '1502351560', '1502351560');
INSERT INTO `yunu_auth_rule` VALUES ('138', 'admin/banner/editbanner', '编辑幻灯片', '1', '1', '', '', '116', '2', '1502351585', '1502351585');
INSERT INTO `yunu_auth_rule` VALUES ('139', 'admin/sitelink/index', '热门标签', '1', '1', 'fa fa-tag', '', '118', '4', '1502414966', '1502414966');
INSERT INTO `yunu_auth_rule` VALUES ('140', 'admin/sitelink/addsitelink', '新增热门标签', '1', '1', '', '', '139', '1', '1502421200', '1502421200');
INSERT INTO `yunu_auth_rule` VALUES ('141', 'admin/sitelink/editsitelink', '编辑热门标签', '1', '1', '', '', '139', '2', '1502421232', '1502421232');
INSERT INTO `yunu_auth_rule` VALUES ('142', 'admin/link/addlink', '新增友情链接', '1', '1', '', '', '120', '1', '1502421259', '1502421259');
INSERT INTO `yunu_auth_rule` VALUES ('143', 'admin/link/editlink', '编辑友情链接', '1', '1', '', '', '120', '2', '1502421283', '1502421283');
INSERT INTO `yunu_auth_rule` VALUES ('144', 'admin/block/addblock', '新增自定义块', '1', '1', '', '', '117', '1', '1502432100', '1502432100');
INSERT INTO `yunu_auth_rule` VALUES ('145', 'admin/block/editblock', '编辑自定义块', '1', '1', '', '', '117', '2', '1502432143', '1502432143');
INSERT INTO `yunu_auth_rule` VALUES ('146', 'admin/block/addcategory', '新增自定义块分类', '1', '1', '', '', '117', '5', '1502435132', '1502435132');
INSERT INTO `yunu_auth_rule` VALUES ('147', 'admin/block/editcategory', '编辑自定义块分类', '1', '1', '', '', '117', '6', '1502435163', '1502435163');
INSERT INTO `yunu_auth_rule` VALUES ('148', 'admin/block/index', '自定义块管理', '1', '1', '', '', '117', '0', '1502435194', '1502435194');
INSERT INTO `yunu_auth_rule` VALUES ('149', 'admin/area/addarea', '新增地区', '1', '1', '', '', '121', '1', '1502698791', '1502698791');
INSERT INTO `yunu_auth_rule` VALUES ('150', 'admin/area/editarea', '编辑地区', '1', '1', '', '', '121', '2', '1502698815', '1502698815');
INSERT INTO `yunu_auth_rule` VALUES ('153', 'admin/diymodel/index', '模型管理', '1', '1', 'fa fa-modx', '', '127', '1', '1502708524', '1502800581');
INSERT INTO `yunu_auth_rule` VALUES ('154', 'admin/diyfield/index', '字段管理', '1', '1', 'fa fa-code', '', '153', '4', '1502708623', '1502781468');
INSERT INTO `yunu_auth_rule` VALUES ('155', 'admin/diymodel/adddiymodel', '新增模型', '1', '1', '', '', '153', '1', '1502709642', '1502709642');
INSERT INTO `yunu_auth_rule` VALUES ('156', 'admin/diymodel/editdiymodel', '编辑模型', '1', '1', '', '', '153', '2', '1502709664', '1502709664');
INSERT INTO `yunu_auth_rule` VALUES ('157', 'admin/diyfield/adddiyfield', '新增自定义字段', '1', '1', '', '', '153', '5', '1502765914', '1502781428');
INSERT INTO `yunu_auth_rule` VALUES ('158', 'admin/diyfield/editdiyfield', '编辑自定义字段', '1', '1', '', '', '153', '6', '1502765934', '1502781450');
INSERT INTO `yunu_auth_rule` VALUES ('161', 'admin/area/statearea', '全局设置', '1', '1', '', '', '121', '4', '1502801715', '1506477056');
INSERT INTO `yunu_auth_rule` VALUES ('163', 'admin/category/addcategory', '新增栏目', '1', '1', '', '', '3', '1', '1502878827', '1502878827');
INSERT INTO `yunu_auth_rule` VALUES ('164', 'admin/category/editcategory', '编辑栏目', '1', '1', '', '', '3', '2', '1502878850', '1502878850');
INSERT INTO `yunu_auth_rule` VALUES ('165', 'admin/content/addcontent', '新增内容', '1', '1', '', '', '11', '1', '1503017703', '1503017703');
INSERT INTO `yunu_auth_rule` VALUES ('166', 'admin/content/editcontent', '编辑内容', '1', '1', '', '', '11', '2', '1503060259', '1503060259');
INSERT INTO `yunu_auth_rule` VALUES ('168', 'admin/upgrade/lists', '升级文件列表', '1', '1', '', '', '167', '1', '1505464242', '1505464242');
INSERT INTO `yunu_auth_rule` VALUES ('169', 'admin/upgrade/tpl', '模版更新列表', '1', '1', '', '', '167', '2', '1505804353', '1505804353');
INSERT INTO `yunu_auth_rule` VALUES ('170', 'admin/system/sitemap', '站点地图', '1', '1', 'fa fa-map', '', '118', '7', '1505984040', '1505984040');
INSERT INTO `yunu_auth_rule` VALUES ('171', 'admin/category/delcategory', '删除栏目', '1', '1', '', '', '3', '3', '1506476807', '1506476807');
INSERT INTO `yunu_auth_rule` VALUES ('172', 'admin/content/delContent', '删除内容', '1', '1', '', '', '11', '3', '1506476941', '1506476941');
INSERT INTO `yunu_auth_rule` VALUES ('173', 'admin/link/dellink', '删除友情链接', '1', '1', '', '', '120', '3', '1506476980', '1506476980');
INSERT INTO `yunu_auth_rule` VALUES ('174', 'admin/area/delarea', '删除地区', '1', '1', '', '', '121', '3', '1506477034', '1506477034');
INSERT INTO `yunu_auth_rule` VALUES ('175', 'admin/sitelink/delsitelink', '删除热门标签', '1', '1', '', '', '139', '3', '1506477271', '1506477271');
INSERT INTO `yunu_auth_rule` VALUES ('176', 'admin/banner/delbanner', '删除幻灯片', '1', '1', '', '', '116', '3', '1506477313', '1506477313');
INSERT INTO `yunu_auth_rule` VALUES ('177', 'admin/block/delblock', '删除自定义块', '1', '1', '', '', '117', '4', '1506477361', '1506477361');
INSERT INTO `yunu_auth_rule` VALUES ('178', 'admin/block/delcategory', '删除自定义块分类', '1', '1', '', '', '117', '7', '1506477420', '1506477420');
INSERT INTO `yunu_auth_rule` VALUES ('179', 'admin/menu/delrule', '删除菜单', '1', '1', '', '', '9', '3', '1506477447', '1506477447');
INSERT INTO `yunu_auth_rule` VALUES ('180', 'admin/diymodel/deldiymodel', '删除模型', '1', '1', '', '', '153', '3', '1506477529', '1506477529');
INSERT INTO `yunu_auth_rule` VALUES ('181', 'admin/diyfield/deldiyfield', '删除自定义字段', '1', '1', '', '', '153', '7', '1506477581', '1506477581');
INSERT INTO `yunu_auth_rule` VALUES ('182', 'admin/diyfield/deldiyline', '删除分组线', '1', '1', '', '', '153', '10', '1506477639', '1506477639');
INSERT INTO `yunu_auth_rule` VALUES ('183', 'admin/role/delrole', '删除角色', '1', '1', '', '', '128', '3', '1506477695', '1506477695');
INSERT INTO `yunu_auth_rule` VALUES ('184', 'admin/user/deluser', '删除管理员', '1', '1', '', '', '129', '3', '1506477730', '1506477730');
INSERT INTO `yunu_auth_rule` VALUES ('185', 'admin/data/export', '数据库备份', '1', '1', '', '', '6', '2', '1506477813', '1506477813');
INSERT INTO `yunu_auth_rule` VALUES ('186', 'admin/content/batchaddcontent', '批量添加内容', '1', '1', '', '', '11', '4', '1508902398', '1508902398');
INSERT INTO `yunu_auth_rule` VALUES ('188', 'admin/system/qiniu', '七牛云存储', '1', '1', 'fa fa-cloud-upload', '', '118', '9', '1515123371', '1515123371');
INSERT INTO `yunu_auth_rule` VALUES ('189', 'admin/category/batchaddcategory', '批量新增栏目', '1', '1', '', '', '3', '4', '1515135247', '1515135247');
INSERT INTO `yunu_auth_rule` VALUES ('190', 'admin/diyform/index', '表单管理', '1', '1', 'fa fa-wpforms', '', '118', '9', '1515221696', '1515221696');
INSERT INTO `yunu_auth_rule` VALUES ('191', 'admin/diyform/adddiyform', '新增表单', '1', '1', '', '', '190', '1', '1515221766', '1515221766');
INSERT INTO `yunu_auth_rule` VALUES ('192', 'admin/diyform/editdiyform', '编辑表单', '1', '1', '', '', '190', '2', '1515221788', '1515221788');
INSERT INTO `yunu_auth_rule` VALUES ('193', 'admin/diyform/deldiyform', '删除表单', '1', '1', '', '', '190', '3', '1515221809', '1515221809');
INSERT INTO `yunu_auth_rule` VALUES ('194', 'admin/diyform/diyfield', '字段管理', '1', '1', '', '', '190', '4', '1515221879', '1515221879');
INSERT INTO `yunu_auth_rule` VALUES ('195', 'admin/diyform/adddiyfield', '新增表单字段', '1', '1', '', '', '190', '5', '1515221905', '1515221905');
INSERT INTO `yunu_auth_rule` VALUES ('196', 'admin/diyform/editdiyfield', '编辑表单字段', '1', '1', '', '', '190', '6', '1515221931', '1515221931');
INSERT INTO `yunu_auth_rule` VALUES ('197', 'admin/diyform/deldiyfield', '删除表单字段', '1', '1', '', '', '190', '7', '1515221950', '1515221950');
INSERT INTO `yunu_auth_rule` VALUES ('198', 'admin/diyform/content', '表单内容列表', '1', '1', '', '', '190', '9', '1515221988', '1515221988');
INSERT INTO `yunu_auth_rule` VALUES ('199', 'admin/diyform/delcontent', '删除表单内容', '1', '1', '', '', '190', '10', '1515222006', '1515222006');
INSERT INTO `yunu_auth_rule` VALUES ('200', 'admin/diyform/showcode', '查看表单代码', '1', '1', '', '', '190', '11', '1515222033', '1515222033');
INSERT INTO `yunu_auth_rule` VALUES ('201', 'admin/diyform/formcon', '表单内容', '1', '1', '', '', '190', '12', '1515550762', '1515550762');
INSERT INTO `yunu_auth_rule` VALUES ('202', 'admin/diyform/editformcon', '表单内容编辑', '1', '1', '', '', '190', '13', '1515550796', '1515550796');
INSERT INTO `yunu_auth_rule` VALUES ('203', 'admin/diyform/delformcon', '删除表单内容', '1', '1', '', '', '190', '14', '1515553802', '1515553802');

-- ----------------------------
-- Table structure for yunu_banner
-- ----------------------------
DROP TABLE IF EXISTS `yunu_banner`;
CREATE TABLE `yunu_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL COMMENT '标题',
  `pic` varchar(200) DEFAULT NULL COMMENT '图片',
  `fpic` varchar(200) DEFAULT NULL COMMENT '副图',
  `url` varchar(200) DEFAULT NULL COMMENT '链接',
  `sort` smallint(6) DEFAULT '0' COMMENT '排序',
  `type` tinyint(1) DEFAULT '1' COMMENT '类型 1PC 2手机',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yunu_banner
-- ----------------------------
INSERT INTO `yunu_banner` VALUES ('20', '11', '/uploads/image/20170929/c20ee6e4f167f19eb37754c6178d8f21.jpg', '', '#', '0', '2');
INSERT INTO `yunu_banner` VALUES ('19', '11', '/uploads/image/20170929/b6d3bf29720455ef16903e8689fcb4bb.jpg', '', '#', '0', '2');
INSERT INTO `yunu_banner` VALUES ('17', '11', '/uploads/image/20170929/eb242765015da7ac79987234e12b2d3c.jpg', '', '#', '0', '1');
INSERT INTO `yunu_banner` VALUES ('18', '22', '/uploads/image/20170929/a01b7740cb8c75cff837c8a8baad3c3e.jpg', '', 'http://www.baidu.com', '0', '1');

-- ----------------------------
-- Table structure for yunu_block
-- ----------------------------
DROP TABLE IF EXISTS `yunu_block`;
CREATE TABLE `yunu_block` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL COMMENT '标题',
  `content` text COMMENT '内容',
  `type` tinyint(1) DEFAULT '1' COMMENT '类型 1文本 2图片 3富文本',
  `remark` text COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yunu_block
-- ----------------------------
INSERT INTO `yunu_block` VALUES ('46', '6', 'head_text1', '<h6>SO BUILDING MATERIALS CO., LTD</h6>', '3', '公司名称英文');
INSERT INTO `yunu_block` VALUES ('47', '6', 'logo', '/uploads/image/20170929/583f583fa9414bed1f230809411004dd.png', '2', 'logo');
INSERT INTO `yunu_block` VALUES ('48', '6', 'head_text2', '<p>专注环保建材<em>15</em>年！</p><p>扮靓世界 创新生活</p>', '3', '标语');
INSERT INTO `yunu_block` VALUES ('49', '6', 'head_text3', '<p><em>全国服务热线：</em>010-88888888 13888888888</p>', '3', '全国服务热线');
INSERT INTO `yunu_block` VALUES ('50', '7', 'CONTACT', '<p><img src=\"/template/default/index/img/dz.png\" alt=\"\"/>地址：香港XXXXXX街XXX号XXX大厦XXXXX室</p><p><img src=\"/template/default/index/img/dh.png\" alt=\"\"/>电话：010-12345678</p><p><img src=\"/template/default/index/img/sj.png\" alt=\"\"/>手机：13888888888</p><p><img src=\"/template/default/index/img/yx.png\" alt=\"\"/>邮箱：88888888@qq.com</p>', '3', '联系方式');
INSERT INTO `yunu_block` VALUES ('51', '7', 'map', '119.496081,32.200027', '1', '地图坐标点');
INSERT INTO `yunu_block` VALUES ('52', '7', 'banner_text', '                        <p class=\"pbottom\" id=\"pbottom\">\n                            <strong>CHINA GREEN BUILDING MATERIALS INNOVATION BRAND</strong>\n                            <b>为您提供<span>设计、生产、销售</span>一条龙解决方案</b>\n                        </p>\n                        <i id=\"fonts\">中国<em>绿色</em>建材创新品牌</i>', '1', '幻灯片文字');
INSERT INTO `yunu_block` VALUES ('53', '7', 'page_banner', '/uploads/image/20170929/943300e2cbbc41a477408155c6cc0120.jpg', '2', '内页banner');
INSERT INTO `yunu_block` VALUES ('54', '8', 'logo2', '/uploads/image/20170929/902d35fd0ae6581f34cf9141d1dd7901.png', '2', '底部logo');
INSERT INTO `yunu_block` VALUES ('55', '8', 'ewm', '/uploads/image/20170929/5677e95daa174df1d16646613b737504.png', '2', '二维码');

-- ----------------------------
-- Table structure for yunu_block_category
-- ----------------------------
DROP TABLE IF EXISTS `yunu_block_category`;
CREATE TABLE `yunu_block_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL COMMENT '标题',
  `sort` int(11) DEFAULT NULL COMMENT '内容',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yunu_block_category
-- ----------------------------
INSERT INTO `yunu_block_category` VALUES ('6', '头部公共', '1');
INSERT INTO `yunu_block_category` VALUES ('7', '公共部分', '2');
INSERT INTO `yunu_block_category` VALUES ('8', '底部公共', '3');
INSERT INTO `yunu_block_category` VALUES ('9', '手机', '4');

-- ----------------------------
-- Table structure for yunu_browse
-- ----------------------------
DROP TABLE IF EXISTS `yunu_browse`;
CREATE TABLE `yunu_browse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(15) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  `type` tinyint(1) DEFAULT '1' COMMENT '1PC 2手机',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6196 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yunu_browse
-- ----------------------------

-- ----------------------------
-- Table structure for yunu_category
-- ----------------------------
DROP TABLE IF EXISTS `yunu_category`;
CREATE TABLE `yunu_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL COMMENT '分类名称',
  `etitle` varchar(200) DEFAULT NULL COMMENT '别名',
  `subtitle` varchar(200) DEFAULT NULL COMMENT '副标题',
  `pid` int(11) DEFAULT '0' COMMENT '上级分类',
  `mid` int(11) DEFAULT NULL COMMENT '所属模型',
  `pic` text COMMENT '封面照片',
  `seo_title` varchar(200) DEFAULT NULL COMMENT 'SEO标题',
  `seo_keywords` varchar(200) DEFAULT NULL COMMENT 'SEO关键词',
  `seo_desc` varchar(1000) DEFAULT NULL COMMENT 'SEO描述',
  `jumpurl` varchar(200) DEFAULT NULL COMMENT '外部链接',
  `tpl_cover` varchar(60) DEFAULT NULL COMMENT '封面模版',
  `tpl_list` varchar(60) DEFAULT NULL COMMENT '列表模版',
  `tpl_show` varchar(60) DEFAULT NULL COMMENT '内容模版',
  `sort` smallint(6) DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态',
  `target` tinyint(1) DEFAULT '0' COMMENT '0当前 1新窗口',
  `nav` tinyint(1) DEFAULT '0' COMMENT '0不显示 1主导航 2尾导航 3都显示',
  `desc` text,
  `content` text,
  `cover` tinyint(1) DEFAULT '0' COMMENT '0列表  1频道',
  `isarea` tinyint(1) DEFAULT '1' COMMENT '开启地区分站0关闭 1开启',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yunu_category
-- ----------------------------
INSERT INTO `yunu_category` VALUES ('27', '其他五金', 'qitawujin', '', '21', '34', '', '', '', '', '', '', 'list_product.html', 'show_product.html', '6', '1', '0', '0', '', '', '0', '1');
INSERT INTO `yunu_category` VALUES ('26', '五金配附件', 'wujinpeifujian', '', '21', '34', '', '', '', '', '', '', 'list_product.html', 'show_product.html', '5', '1', '0', '0', '', '', '0', '1');
INSERT INTO `yunu_category` VALUES ('20', '关于我们', 'guanyuwomen', 'ABOUT US', '0', '37', '/uploads/image/20170929/9c945b7db7641940eeb9ac0f9e9b303a.jpg', '', '', '', '', '', 'list_page.html', '', '1', '1', '0', '1', '<p>1创立于2000年， 经过多年的不懈努力，公司现已经成为一家专业从事IT产品开发、生产和销售的高科技企业。公司成立几年来，一直致力于工控/服务器机箱及各种非标箱体的开发与生产，产品现广泛应用于计算机网络、监控、安防、广电、通讯和仪器设备等多种行业</p>', '<p>深圳市**科技有限公司位于美百度丽富饶的中国广东省深圳市松岗溪头工业区，主要从事精密模具开发及制造，专业冲压精密五金电子电器零配件等.产品已通过ISO--9001：2000国际标准品质体系认证，以满足各种客户的多层次需求，全体职员本着“以人为本，以质取胜，持续改进，永续经营”的企业生产理念，产品直销日本，美国，欧洲及东南亚其它国家。我们承诺：为客户提供价格合理，质量优良的产品及服务，以期提高市场的竞争力，成为你最值得信赖的供应商。主要产品：机箱，机蕊，汽车音箱，传真机，打印机，复印机，手机，摄像头,外壳及配件，各种精密端子，电子五金配件，各类五金弹片等。<br/></p><p>创立于2000年， 经过多年的不懈努力，公司现已经成为一家专业从事IT产品开发、生产和销售的高科技企业。公司成立几年来，一直致力于工控/服务器机箱及各种非标箱体的开发与生产，产品现广泛应用于计算机网络、监控、安防、广电、通讯和仪器设备等多种行业，公司设计生产的多种标准及非标产品，成功地替代了多种进口产品，为用户极大地降低了成本，也为我们的民族事业做出了我们的一份贡献！</p><p>公司的主要产品大类别有：19″服务器机箱、工控机箱、网络机柜、服务器机柜、非标机柜、各种操作台、电视墙、非线性编辑台、配电柜（强弱电）、各种机箱。我们的产品结构合理，性能稳定可靠，品质优良，品种齐全。</p><p>公司拥有一批专业的工程设计人员，先进的生产设备及可靠的生产能力；我们崇尚先进的企业文化，追求先进的经营理念、管理理念和人才理念，树立团结和谐的大局观、诚实守信的道德观，坚持加强企业两个文明建设，内增员工凝聚力，外塑 企业良好形象 ，不断增强公司的核心竞争力。</p><p>公司将进一步依靠自身优势和雄厚的实力，发挥良好的品牌效应，坚持“以管理和技术的不断进步为顾客提供满意产品”的质量方针，竭力为国内外新老客户提供更优质的产品和服务</p><p>选择我们，就等于你自己办了一个加工厂！</p><p>展望未来，我们充满信心，因为在您的点击支持和合作下，令本公司的业务蒸蒸日上！ 诚邀各界人士光临指导！</p>', '1', '1');
INSERT INTO `yunu_category` VALUES ('21', '产品展示', 'chanpinzhanshi', '', '0', '34', '', '', '', '', '', '', 'list_product.html', 'show_product.html', '2', '1', '0', '1', '<p>某某有限公司位于美丽富饶的中国广东省深圳市松岗溪头工业区，主要从事精密模具开发及制造，专业冲压精密五金电子电器零配件等.产品已通过ISO--9001：2000国际标准品质体系认证，以满足各种客户的多层次需求，全体职员本着“以人为本，以质取胜，持续改进，永续经营”的企业生产理念，产品直销日本，美国，欧洲及东南亚其它国家。我们承诺：为客户提供价格合理，质量优良的产品及服务，以期提高市场的竞争力，成为你最值得信赖的供应商。主要产品：机箱，机蕊，汽车音箱，传真机，打印机，复印机，手机，摄像头,外壳及配件，各种精密端子，电子五金配件，各类五金弹片等。</p>', '', '1', '1');
INSERT INTO `yunu_category` VALUES ('22', '建筑装饰五金', 'jianzhuzhuangshiwujin', '', '21', '34', '', '', '', '', '', '', 'list_product.html', 'show_product.html', '1', '1', '0', '0', '<p>建筑五金建筑物或构筑物中装用的金属和非金属制品、配件的总称。一般具有实用和装饰双重效果。</p>', '', '0', '1');
INSERT INTO `yunu_category` VALUES ('23', '机械五金件', 'jixiewujinjian', '', '21', '34', '', '', '', '', '', '', 'list_product.html', 'show_product.html', '2', '1', '0', '0', '<p>五金：传统的五金制品，也称“小五金”。指金、银、铜、铁、锡五种金属。经人工加工可以制成刀、剑等艺术品或金属器件。现代社会的五金更为广泛，例如五金工具、五金零部件、日用五金、建筑五金以及安防用品等。小五金产品大都不是最终消费品。</p>', '', '0', '1');
INSERT INTO `yunu_category` VALUES ('24', '手动工具', 'shoudonggongju', '', '21', '34', '', '', '', '', '', '', 'list_product.html', 'show_product.html', '3', '1', '0', '0', '', '', '0', '1');
INSERT INTO `yunu_category` VALUES ('25', '电动工具', 'diandonggongju', '', '21', '34', '', '', '', '', '', '', 'list_product.html', 'show_product.html', '4', '1', '0', '0', '', '', '0', '1');
INSERT INTO `yunu_category` VALUES ('28', '新闻中心', 'xinwenzhongxin', '', '0', '33', '', '', '', '', '', '', 'list_article.html', 'show_article.html', '3', '1', '0', '1', '', '', '0', '1');
INSERT INTO `yunu_category` VALUES ('29', '客户案例', 'kehuanli', '', '0', '35', '', '', '', '', '', '', 'list_picture.html', 'show_product.html', '4', '1', '0', '1', '<p>这里是案例简介设置这里是案例简介设置这里是案例简介设置这里是案例简介设置这里是案例简介设置这里是案例简介设置这里是案例简介设置这里是案例简介设置这里是案例简介设置这里是案例简介设置这里是案例简介设置这里是案例简介设置</p>', '', '0', '1');
INSERT INTO `yunu_category` VALUES ('30', '联系我们', 'lianxiwomen', '', '0', '37', '', '', '', '', '', '', 'list_page.html', '', '5', '1', '0', '1', '', '<p>联系我们内容</p>', '1', '1');
INSERT INTO `yunu_category` VALUES ('34', '荣誉证书', 'rongyuzhengshu', '', '0', '34', '/uploads/image/20170928/b28e4b51a2e99393fc66dac3b41cfdbf.jpg', '', '', '', '', '', 'list_product.html', 'show_product.html', '0', '1', '0', '0', '', '', '0', '1');
INSERT INTO `yunu_category` VALUES ('35', '建筑五金', 'jianzhuwujin', '', '22', '34', '', '', '', '', '', '', 'list_product.html', 'show_product.html', '0', '1', '0', '0', '<p>建筑五金建筑物或构筑物中装用的金属和非金属制品、配件的总称。一般具有实用和装饰双重效果。</p>', '', '0', '1');
INSERT INTO `yunu_category` VALUES ('36', '装饰五金', 'zhuangshiwujin', '', '22', '34', '', '', '', '', '', '', 'list_product.html', 'show_product.html', '0', '1', '0', '0', '', '', '0', '0');
INSERT INTO `yunu_category` VALUES ('38', '机械五金', 'jixie', '', '23', '34', '', '', '', '', '', '', 'list_product.html', 'show_product.html', '0', '1', '0', '0', '', '', '0', '0');
INSERT INTO `yunu_category` VALUES ('39', '钳子/夹子', 'qianzijiazi', '', '24', '34', '', '', '', '', '', '', 'list_product.html', 'show_product.html', '0', '1', '0', '0', '', '', '0', '0');
INSERT INTO `yunu_category` VALUES ('40', '扳手工具', 'banshougongju', '', '24', '34', '', '', '', '', '', '', 'list_product.html', 'show_product.html', '0', '1', '0', '0', '', '', '0', '0');
INSERT INTO `yunu_category` VALUES ('41', '金工工具', 'jingonggongju', '', '25', '34', '', '', '', '', '', '', 'list_product.html', 'show_product.html', '0', '1', '0', '0', '', '', '0', '0');
INSERT INTO `yunu_category` VALUES ('42', '木工工具', 'mugonggongju', '', '25', '34', '', '', '', '', '', '', 'list_product.html', 'show_product.html', '0', '1', '0', '0', '', '', '0', '0');
INSERT INTO `yunu_category` VALUES ('43', '砂磨抛光工具', 'shamopaoguanggongju', '', '25', '34', '', '', '', '', '', '', 'list_product.html', 'show_product.html', '0', '1', '0', '0', '', '', '0', '0');
INSERT INTO `yunu_category` VALUES ('44', '钉枪类气动工', 'dingqiangleiqidonggong', '', '26', '34', '', '', '', '', '', '', 'list_product.html', 'show_product.html', '0', '1', '0', '0', '', '', '0', '0');
INSERT INTO `yunu_category` VALUES ('45', '喷枪吹尘枪', 'penqiangchuichenqiang', '', '26', '34', '', '', '', '', '', '', 'list_product.html', 'show_product.html', '0', '1', '0', '0', '', '', '0', '0');
INSERT INTO `yunu_category` VALUES ('46', '紧固类气动工具', 'jinguleiqidonggongju', '', '26', '34', '', '', '', '', '', '', 'list_product.html', 'show_product.html', '0', '1', '0', '0', '', '', '0', '0');
INSERT INTO `yunu_category` VALUES ('68', '更多分站', 'map', '', '0', '37', '', '', '', '', '', '', 'list_map.html', '', '0', '1', '0', '0', '', '', '1', '1');
INSERT INTO `yunu_category` VALUES ('73', '在线留言', 'zaixianliuyan', '', '0', '37', '', '', '', '', '', '', 'list_page_book.html', '', '0', '1', '0', '0', '', '', '0', '1');

-- ----------------------------
-- Table structure for yunu_content
-- ----------------------------
DROP TABLE IF EXISTS `yunu_content`;
CREATE TABLE `yunu_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) DEFAULT NULL,
  `mid` int(11) DEFAULT NULL,
  `title` varchar(200) DEFAULT NULL,
  `jumpurl` varchar(100) DEFAULT NULL,
  `etitle` varchar(200) DEFAULT NULL,
  `click` int(11) DEFAULT '0',
  `vid` int(11) DEFAULT NULL COMMENT '更多字段数据ID',
  `sort` int(11) DEFAULT NULL,
  `istop` tinyint(1) DEFAULT '0' COMMENT '0 不推荐 1推荐',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `aid` int(11) DEFAULT NULL,
  `seo_title` varchar(200) DEFAULT NULL,
  `seo_keywords` varchar(200) DEFAULT NULL,
  `seo_desc` varchar(500) DEFAULT NULL,
  `area` varchar(500) DEFAULT '' COMMENT '地区',
  `top` tinyint(1) DEFAULT NULL,
  `pic` varchar(100) DEFAULT NULL,
  `tag` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=124 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yunu_content
-- ----------------------------
INSERT INTO `yunu_content` VALUES ('29', '34', '34', '1', '', '', '1', '1', '0', '1', '1506676635', '1506676703', '1', '', '', '', '', '0', '/uploads/image/20170929/76dc0e2d121b17eab37f474a65d171e8.png', '');
INSERT INTO `yunu_content` VALUES ('30', '29', '35', '案例1', '', '', '210', '1', '0', '1', '1506676928', '1506676947', '1', '', '', '', '', '0', '/uploads/image/20170929/8c181da0f27dc6671dd5ec70453f9117.jpg', '');
INSERT INTO `yunu_content` VALUES ('31', '29', '35', '案例2', '', '', '220', '2', '0', '1', '1506676948', '1506676979', '1', '', '', '', '', '0', '/uploads/image/20170929/981f6de833848af6d8cb62f6d744e3af.jpg', '');
INSERT INTO `yunu_content` VALUES ('32', '29', '35', '案例3', '', '', '206', '3', '0', '1', '1506676980', '1506677001', '1', '', '', '', '', '0', '/uploads/image/20170929/9288bda0cb4a34871cd1d91e58acd7ff.jpg', '');
INSERT INTO `yunu_content` VALUES ('33', '29', '35', '案例4', '', '', '211', '4', '0', '1', '1506677001', '1506677038', '1', '', '', '', '', '0', '/uploads/image/20170929/c85b598ca28b7e8865c8d1ec9aae5dd9.jpg', '');
INSERT INTO `yunu_content` VALUES ('34', '29', '35', '案例5', '', '', '201', '5', '0', '1', '1506677039', '1506677059', '1', '', '', '', '', '0', '/uploads/image/20170929/9d61483058cc825f4aafd6f3232132c6.jpg', '');
INSERT INTO `yunu_content` VALUES ('35', '28', '33', '公司顺利通过中国环境标志产品认证', '', '', '126', '1', '0', '1', '1506677106', '1506677157', '1', '', '', '', '', '0', '', '');
INSERT INTO `yunu_content` VALUES ('36', '28', '33', '五金配件的进口与国产之争', '', '', '107', '2', '0', '1', '1506677158', '1506677189', '1', '', '', '', '', '0', '', '');
INSERT INTO `yunu_content` VALUES ('37', '28', '33', '天津工厂组织后备骨干军训活动', '', '', '105', '3', '0', '1', '1506677190', '1506677213', '1', '', '', '', '', '0', '', '');
INSERT INTO `yunu_content` VALUES ('38', '28', '33', '五金检测中心获资格 小榄锁具“锁”向无阻', '', '', '111', '4', '0', '1', '1506677508', '1508135263', '1', '', '', '', '', '0', '', '产品');
INSERT INTO `yunu_content` VALUES ('39', '22', '34', '阜平红', '', '', '585', '2', '0', '1', '1506731922', '1508135237', '1', '', '', '', '', '0', '/uploads/image/20170930/79a34d620c72e122acb8f6078dc5922f.jpg', '产品');
INSERT INTO `yunu_content` VALUES ('40', '22', '34', '新米黄', '', '', '460', '3', '0', '1', '1506731951', '1506731982', '1', '', '', '', '', '0', '/uploads/image/20170930/5502581c5ae3a6d50864d93f86c62c7f.jpg', '');
INSERT INTO `yunu_content` VALUES ('41', '22', '34', '紫水晶', '', '', '304', '4', '0', '1', '1506731983', '1506732005', '1', '', '', '', '', '0', '/uploads/image/20170930/c729a7e40e8f69664d03827832023b86.jpg', '');
INSERT INTO `yunu_content` VALUES ('42', '22', '34', '金黄锻', '', '', '180', '5', '0', '1', '1506732006', '1506732029', '1', '', '', '', '', '0', '/uploads/image/20170930/df4bd10759e2c97bdf47d87258bb96fd.jpg', '');
INSERT INTO `yunu_content` VALUES ('43', '22', '34', '玛瑙红', '', '', '58', '6', '0', '1', '1506732030', '1506732048', '1', '', '', '', ',2,4,', '0', '/uploads/image/20170930/0150de725a47a260c846caec388a37ce.jpg', '');
INSERT INTO `yunu_content` VALUES ('44', '22', '34', '阿拉伯绿', '', '', '127', '7', '0', '1', '1506732050', '1506732065', '1', '', '', '', ',2,4,', '0', '/uploads/image/20170930/86af2b44f21a4e22ba6fa0a035975d03.jpg', '');
INSERT INTO `yunu_content` VALUES ('45', '22', '34', '人造板', '', '', '455', '8', '10', '1', '1506732066', '1515035041', '1', '', '', '', '', '0', '/uploads/image/20170930/688a51f93e518e38f4b45a6a274d04ad.jpg', 'asda');
INSERT INTO `yunu_content` VALUES ('46', '35', '34', 'FHB200-BG', '', '', '160', '9', '0', '1', '1508129374', '1508129402', '1', '', '', '', '', '0', '/uploads/image/20171016/77e467ecd89008cdb7045fc638cc8e1d.jpg', '');
INSERT INTO `yunu_content` VALUES ('47', '35', '34', '22-FHE-SB', '', '', '158', '10', '0', '1', '1508129404', '1508129425', '1', '', '', '', '', '0', '/uploads/image/20171016/7f0f09c6dc95a402dd0272041c3f81ec.jpg', '');
INSERT INTO `yunu_content` VALUES ('48', '35', '34', '23EG', '', '', '157', '11', '0', '1', '1508129426', '1508129439', '1', '', '', '', '', '0', '/uploads/image/20171016/4d886e83e628dd3ab561160d6517c378.jpg', '');
INSERT INTO `yunu_content` VALUES ('49', '35', '34', '23-SG', '', '', '9', '12', '0', '1', '1508129440', '1513915550', '1', '', '', '', ',2,3,4,', '0', '/uploads/image/20171016/0eb89d53055a6020098dcfc940b38731.jpg', '');
INSERT INTO `yunu_content` VALUES ('50', '36', '34', 'TZ-02', '', '', '117', '13', '0', '1', '1508140509', '1508140890', '1', '', '', '', '', '0', '/uploads/image/20171016/5c569da47cff2905953e3557298ce914.jpg', '');
INSERT INTO `yunu_content` VALUES ('51', '36', '34', 'HZ-033', '', '', '14', '14', '0', '1', '1508140545', '1508140880', '1', '', '', '', '', '0', '/uploads/image/20171016/353e188cea14817ff721f4273de66b70.jpg', '');
INSERT INTO `yunu_content` VALUES ('52', '36', '34', 'HYU-036', '', '', '14', '15', '0', '1', '1508140569', '1508140869', '1', '', '', '', '', '0', '/uploads/image/20171016/ee3a0dd68b76b6ab2bed9d1ea04a8b8c.jpg', '');
INSERT INTO `yunu_content` VALUES ('53', '36', '34', 'TYZ-89', '', '', '14', '16', '0', '1', '1508140646', '1508140853', '1', '', '', '', '', '0', '/uploads/image/20171016/ba166ccb43242480a37a3ad06a9dbc30.jpg', '');
INSERT INTO `yunu_content` VALUES ('54', '38', '34', 'RE-01', '', '', '118', '17', '0', '1', '1508140699', '1508140937', '1', '', '', '', '', '0', '/uploads/image/20171016/d0b6f4ab3b9ccbcd81b1101f38fce095.jpg', '');
INSERT INTO `yunu_content` VALUES ('55', '38', '34', 'RE-016', '', '', '117', '18', '0', '1', '1508140722', '1508140926', '1', '', '', '', '', '0', '/uploads/image/20171016/b064a0ca40076606d814a8607447b168.jpg', '');
INSERT INTO `yunu_content` VALUES ('56', '38', '34', 'RE-063', '', '', '118', '19', '0', '1', '1508140747', '1508140915', '1', '', '', '', '', '0', '/uploads/image/20171016/74bf8cdccfd687b827aa2bba4d9c5807.jpg', '');
INSERT INTO `yunu_content` VALUES ('57', '38', '34', 'HUW-561', '', '', '114', '20', '0', '1', '1508140764', '1508140904', '1', '', '', '', '', '0', '/uploads/image/20171016/f018c0422d3206b9def8ef5d219e1b5e.jpg', '');
INSERT INTO `yunu_content` VALUES ('58', '39', '34', 'YHU2000-HZ05', '', '', '118', '21', '0', '1', '1508140947', '1508140978', '1', '', '', '', '', '0', '/uploads/image/20171016/5295442a0bcc8695dd36cd053aa14399.jpg', '');
INSERT INTO `yunu_content` VALUES ('59', '39', '34', 'YH2001-HE056', '', '', '116', '22', '0', '1', '1508140980', '1508141004', '1', '', '', '', '', '0', '/uploads/image/20171016/e5395dac23acc4b8581816170f2ac365.jpg', '');
INSERT INTO `yunu_content` VALUES ('60', '39', '34', 'HTFC500-630V', '', '', '111', '23', '0', '1', '1508141005', '1508141029', '1', '', '', '', '', '0', '/uploads/image/20171016/3e635e0d82c077e8ee8565e06392f159.jpg', '');
INSERT INTO `yunu_content` VALUES ('61', '39', '34', 'HYUHF3020-T028', '', '', '116', '24', '0', '1', '1508141030', '1508141069', '1', '', '', '', '', '0', '/uploads/image/20171016/393bc610e233df82a8605d0f0be8cb2e.jpg', '');
INSERT INTO `yunu_content` VALUES ('62', '40', '34', 'BZ188-56C', '', '', '121', '25', '0', '1', '1508141100', '1508141142', '1', '', '', '', '', '0', '/uploads/image/20171016/abfd3c9a492e5c609f63eeab47690a8c.jpg', '');
INSERT INTO `yunu_content` VALUES ('63', '40', '34', 'BZ188-076C', '', '', '117', '26', '0', '1', '1508141143', '1508141200', '1', '', '', '', '', '0', '/uploads/image/20171016/6a5e5df1cab22d1529c5c9e435f6f1fb.jpg', '');
INSERT INTO `yunu_content` VALUES ('64', '40', '34', 'YHVF50-K63', '', '', '116', '27', '0', '1', '1508141201', '1508141475', '1', '', '', '', '', '0', '/uploads/image/20171016/e371daf4bae56d144f67f6a3e0e41e83.jpg', '');
INSERT INTO `yunu_content` VALUES ('65', '40', '34', 'HYTR-630K', '', '', '119', '28', '0', '1', '1508141477', '1508141513', '1', '', '', '', '', '0', '/uploads/image/20171016/14aced74b2517730385f6dc57dff5226.jpg', '');
INSERT INTO `yunu_content` VALUES ('66', '41', '34', 'JIN-01', '', '', '117', '29', '0', '1', '1508141519', '1508141540', '1', '', '', '', '', '0', '/uploads/image/20171016/3961bcc36e19f0b0fa1d33d59baf4705.jpg', '');
INSERT INTO `yunu_content` VALUES ('67', '41', '34', 'JIN-02', '', '', '117', '30', '0', '1', '1508141541', '1508141558', '1', '', '', '', '', '0', '/uploads/image/20171016/00ab3f3890a90fe0a63cbbfe2c4a0507.jpg', '');
INSERT INTO `yunu_content` VALUES ('68', '41', '34', 'JIN-03', '', '', '118', '31', '0', '1', '1508141560', '1508141583', '1', '', '', '', '', '0', '/uploads/image/20171016/70043b792f9e2a7a6b423574c24e9044.jpg', '');
INSERT INTO `yunu_content` VALUES ('69', '41', '34', 'JIN-04', '', '', '117', '32', '0', '1', '1508141584', '1508141599', '1', '', '', '', '', '0', '/uploads/image/20171016/c3aeec7d6b0d5e115a1fbb64999c2985.jpg', '');
INSERT INTO `yunu_content` VALUES ('70', '42', '34', 'KIHG-01', '', '', '117', '33', '0', '1', '1508141603', '1508141633', '1', '', '', '', '', '0', '/uploads/image/20171016/329a0a67de616a5175580c3bbad48038.jpg', '');
INSERT INTO `yunu_content` VALUES ('71', '42', '34', 'KIHG-02', '', '', '117', '34', '0', '1', '1508141635', '1508141651', '1', '', '', '', '', '0', '/uploads/image/20171016/1a4563a35b8bc8ca80285ccca860c8b0.jpg', '');
INSERT INTO `yunu_content` VALUES ('72', '42', '34', 'KIHG-03', '', '', '117', '35', '0', '1', '1508141654', '1508141666', '1', '', '', '', '', '0', '/uploads/image/20171016/0104389e107868a2d4cb288139ef21bf.jpg', '');
INSERT INTO `yunu_content` VALUES ('73', '42', '34', 'KIHG-04', '', '', '116', '36', '0', '1', '1508141668', '1508141681', '1', '', '', '', '', '0', '/uploads/image/20171016/7955368e604c234c0a6076e5cccb4aec.jpg', '');
INSERT INTO `yunu_content` VALUES ('74', '43', '34', 'SMPO-01', '', '', '14', '37', '0', '1', '1508142380', '1508142407', '1', '', '', '', '', '0', '/uploads/image/20171016/118bc6048f20bf62927c0d51066535f1.jpg', '');
INSERT INTO `yunu_content` VALUES ('75', '43', '34', 'SMPO-02', '', '', '14', '38', '0', '1', '1508142408', '1508142422', '1', '', '', '', '', '0', '/uploads/image/20171016/45ef392a2e6ac962334a1eca04ea2129.jpg', '');
INSERT INTO `yunu_content` VALUES ('76', '43', '34', 'SMPO-03', '', '', '14', '39', '0', '1', '1508142423', '1508142434', '1', '', '', '', '', '0', '/uploads/image/20171016/e5a2fa3e7f3849be89279f35c0201ec7.jpg', '');
INSERT INTO `yunu_content` VALUES ('77', '43', '34', 'SMPO-04', '', '', '14', '40', '0', '1', '1508142436', '1508142448', '1', '', '', '', '', '0', '/uploads/image/20171016/b1154956423d390f7cf944eba1440753.jpg', '');
INSERT INTO `yunu_content` VALUES ('78', '44', '34', 'HKIJG200-01', '', '', '117', '41', '0', '1', '1508142453', '1508142584', '1', '', '', '', '', '0', '/uploads/image/20171016/90fec55dc864dcb8a7d3e31215c659fa.jpg', '');
INSERT INTO `yunu_content` VALUES ('79', '44', '34', 'HKIJG200-02', '', '', '117', '42', '0', '1', '1508142585', '1508142639', '1', '', '', '', '', '0', '/uploads/image/20171016/dd41ca7793ae04332531fb0d09eeecae.jpg', '');
INSERT INTO `yunu_content` VALUES ('80', '44', '34', 'HKIJG200-03', '', '', '116', '43', '0', '1', '1508142599', '1508142615', '1', '', '', '', '', '0', '/uploads/image/20171016/fac291a285880a2756b32e18cc205b55.jpg', '');
INSERT INTO `yunu_content` VALUES ('81', '44', '34', 'HKIJG200-04', '', '', '117', '44', '0', '1', '1508142616', '1508142628', '1', '', '', '', '', '0', '/uploads/image/20171016/6cb27ca487a31b78a82ff4b5712a4468.jpg', '');
INSERT INTO `yunu_content` VALUES ('82', '45', '34', 'PHJIKG-01', '', '', '118', '45', '0', '1', '1508142681', '1508142794', '1', '', '', '', '', '0', '/uploads/image/20171016/f7e1f1a7e903916d64b76f9d9bd99d21.jpg', '');
INSERT INTO `yunu_content` VALUES ('83', '45', '34', 'PHJIKG-02', '', '', '117', '46', '0', '1', '1508142796', '1508142859', '1', '', '', '', '', '0', '/uploads/image/20171016/64cce7e8662ee0252979d988a653c3f6.jpg', '');
INSERT INTO `yunu_content` VALUES ('84', '45', '34', 'PHJIKG-03', '', '', '118', '47', '0', '1', '1508142812', '1508142825', '1', '', '', '', '', '0', '/uploads/image/20171016/9a032c68ddc8206cbd3a5950c68da316.jpg', '');
INSERT INTO `yunu_content` VALUES ('85', '45', '34', 'PHJIKG-04', '', '', '118', '48', '0', '1', '1508142828', '1508142848', '1', '', '', '', '', '0', '/uploads/image/20171016/10912baac1e0de8599945caca9cc3aa0.jpg', '');
INSERT INTO `yunu_content` VALUES ('86', '46', '34', 'JGQD-01', '', '', '13', '49', '0', '1', '1508142863', '1508142892', '1', '', '', '', '', '0', '/uploads/image/20171016/16dff778011bc2cb76877b9813f519ff.jpg', '');
INSERT INTO `yunu_content` VALUES ('87', '46', '34', 'JGQD-02', '', '', '14', '50', '0', '1', '1508142893', '1508142904', '1', '', '', '', '', '0', '/uploads/image/20171016/43ff1a4ac831ce4d02981b61d80b98b7.jpg', '');
INSERT INTO `yunu_content` VALUES ('88', '46', '34', 'JGQD-03', '', '', '14', '51', '0', '1', '1508142905', '1508142919', '1', '', '', '', '', '0', '/uploads/image/20171016/e3c13c9456afa4b60f5226e5e6c8f71d.jpg', '');
INSERT INTO `yunu_content` VALUES ('89', '46', '34', 'JGQD-04', '', '', '14', '52', '0', '1', '1508142920', '1508142931', '1', '', '', '', '', '0', '/uploads/image/20171016/eac32662ebe78c03d9ec0ce8047e4af1.jpg', '');
INSERT INTO `yunu_content` VALUES ('90', '27', '34', 'JkLHF300-01', '', '', '116', '53', '0', '1', '1508143314', '1508143354', '1', '', '', '', '', '0', '/uploads/image/20171016/5cedc1bab5193a2f1f21772d7654ffb4.jpg', '');
INSERT INTO `yunu_content` VALUES ('91', '27', '34', 'JkLHF300-02', '', '', '116', '54', '0', '1', '1508143356', '1508143368', '1', '', '', '', '', '0', '/uploads/image/20171016/d3acdf2cb5001ff09b34b39643cf51f3.jpg', '');
INSERT INTO `yunu_content` VALUES ('92', '27', '34', 'JkLHF300-03', '', '', '116', '55', '0', '1', '1508143369', '1508143421', '1', '', '', '', '', '0', '/uploads/image/20171016/e3dcacb475c56df6ab8e7eff23f7acb0.jpg', '');
INSERT INTO `yunu_content` VALUES ('93', '27', '34', 'JkLHF300-04', '', '', '116', '56', '0', '1', '1508143423', '1508143441', '1', '', '', '', '', '0', '/uploads/image/20171016/dbd60804281094cc1803e75f45f39cf3.jpg', '');
INSERT INTO `yunu_content` VALUES ('121', '67', '39', '飒沓', '', '啊是', '5', '1', '0', '1', '1515227641', '1515227659', '1', '啊盛大', '啊盛大', '啊是', '', '0', '', '撒');
INSERT INTO `yunu_content` VALUES ('122', '67', '39', '啊盛大', '', '', '0', '2', '0', '1', '1515227816', '1515227922', '1', '', '', '', '', '0', '', '');
INSERT INTO `yunu_content` VALUES ('123', '67', '39', '啊盛大', '', '', '0', '3', '0', '1', '1515227924', '1515227962', '1', '', '', '', '', '0', '', '');

-- ----------------------------
-- Table structure for yunu_diyfield
-- ----------------------------
DROP TABLE IF EXISTS `yunu_diyfield`;
CREATE TABLE `yunu_diyfield` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) DEFAULT NULL,
  `title` varchar(60) DEFAULT NULL COMMENT '字段名称',
  `field` varchar(20) DEFAULT NULL,
  `values` text COMMENT '字段可选值',
  `ftype` varchar(20) DEFAULT '0',
  `defval` varchar(200) DEFAULT NULL COMMENT '默认值',
  `isnotnull` tinyint(1) DEFAULT '0' COMMENT '是否必填 0非必填 1必填',
  `remark` varchar(200) DEFAULT NULL,
  `type` tinyint(1) DEFAULT '1' COMMENT '级别 1用户字段 2系统字段',
  `sort` int(11) DEFAULT NULL,
  `length` int(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=123 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yunu_diyfield
-- ----------------------------
INSERT INTO `yunu_diyfield` VALUES ('87', '33', '副标题', 'ftitle', null, 'text', '', '0', '', '1', '0', '255');
INSERT INTO `yunu_diyfield` VALUES ('88', '33', '发布人', 'author', null, 'text', '', '0', '', '1', '0', '255');
INSERT INTO `yunu_diyfield` VALUES ('89', '33', 'linecdm', 'linefxd', null, '------', null, '0', '内容设置', '1', '0', null);
INSERT INTO `yunu_diyfield` VALUES ('90', '33', '文章简介', 'desc', null, 'seditor', '', '0', '', '1', '0', '255');
INSERT INTO `yunu_diyfield` VALUES ('91', '33', '文章内容', 'content', null, 'editor', '', '1', '', '1', '0', '255');
INSERT INTO `yunu_diyfield` VALUES ('97', '34', '产品多图', 'piclist', null, 'images', null, '1', '', '1', '0', '255');
INSERT INTO `yunu_diyfield` VALUES ('98', '34', 'linedqo', 'linevfi', null, '------', null, '0', '内容设置', '1', '0', null);
INSERT INTO `yunu_diyfield` VALUES ('99', '34', '产品简介', 'desc', null, 'seditor', '', '0', '', '1', '0', '255');
INSERT INTO `yunu_diyfield` VALUES ('100', '34', '产品内容', 'content', null, 'editor', '', '1', '', '1', '0', '255');
INSERT INTO `yunu_diyfield` VALUES ('101', '35', '图片多图', 'piclist', null, 'images', null, '0', '', '1', '0', '255');
INSERT INTO `yunu_diyfield` VALUES ('102', '35', 'linejdf', 'lineerr', null, '------', null, '0', '内容设置', '1', '0', null);
INSERT INTO `yunu_diyfield` VALUES ('103', '35', '图片简介', 'desc', null, 'seditor', '', '0', '', '1', '0', '255');
INSERT INTO `yunu_diyfield` VALUES ('104', '35', '图片内容', 'content', null, 'editor', '', '0', '', '1', '0', '255');
INSERT INTO `yunu_diyfield` VALUES ('106', '39', '副标题', 'ftitle', null, 'text', '', '0', '', '1', '0', '255');
INSERT INTO `yunu_diyfield` VALUES ('107', '39', '发布人', 'author', null, 'text', '', '0', '', '1', '0', '255');
INSERT INTO `yunu_diyfield` VALUES ('108', '39', 'linecdm', 'linefxd', null, '------', null, '0', '内容设置', '1', '0', null);
INSERT INTO `yunu_diyfield` VALUES ('109', '39', '文章简介', 'desc', null, 'seditor', '', '0', '', '1', '0', '255');
INSERT INTO `yunu_diyfield` VALUES ('110', '39', '文章内容', 'content', null, 'editor', '', '1', '', '1', '0', '255');
INSERT INTO `yunu_diyfield` VALUES ('114', '1', '联系人', 'name', null, 'text', '', '1', '1', '3', '1', '255');
INSERT INTO `yunu_diyfield` VALUES ('115', '1', '手机', 'phone', null, 'number', '0', '1', '1', '3', '2', '255');
INSERT INTO `yunu_diyfield` VALUES ('120', '1', '你的留言', 'yuanwang', null, 'textarea', '', '1', '0', '3', '6', '255');
INSERT INTO `yunu_diyfield` VALUES ('121', '3', '姓名', 'username', null, 'text', '', '1', '', '3', '0', '255');
INSERT INTO `yunu_diyfield` VALUES ('122', '3', '留言内容', 'content', null, 'textarea', '', '1', '', '3', '0', '255');

-- ----------------------------
-- Table structure for yunu_diyform
-- ----------------------------
DROP TABLE IF EXISTS `yunu_diyform`;
CREATE TABLE `yunu_diyform` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `tabname` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `mailwarn` tinyint(1) DEFAULT '0',
  `telwarn` tinyint(1) DEFAULT '0',
  `yzcode` tinyint(1) DEFAULT '0',
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yunu_diyform
-- ----------------------------
INSERT INTO `yunu_diyform` VALUES ('1', '测试表单', 'demo', '测试表单', '0', '0', '1', '1');

-- ----------------------------
-- Table structure for yunu_diymodel
-- ----------------------------
DROP TABLE IF EXISTS `yunu_diymodel`;
CREATE TABLE `yunu_diymodel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(60) DEFAULT NULL COMMENT '名称',
  `tabname` text COMMENT '自定义字段列表',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `type` tinyint(1) DEFAULT '1' COMMENT '级别 1用户模型 2系统模型',
  `sort` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yunu_diymodel
-- ----------------------------
INSERT INTO `yunu_diymodel` VALUES ('33', '文章模型', 'article', '文章模型', '2', '1');
INSERT INTO `yunu_diymodel` VALUES ('34', '产品模型', 'product', '产品模型', '2', '2');
INSERT INTO `yunu_diymodel` VALUES ('35', '图片模型', 'image', '图片模型', '2', '3');
INSERT INTO `yunu_diymodel` VALUES ('37', '单页模型', 'page', '空模型', '2', '3');

-- ----------------------------
-- Table structure for yunu_diy_article
-- ----------------------------
DROP TABLE IF EXISTS `yunu_diy_article`;
CREATE TABLE `yunu_diy_article` (
  `conid` int(10) NOT NULL AUTO_INCREMENT,
  `ftitle` varchar(255) DEFAULT '',
  `author` varchar(255) DEFAULT '',
  `desc` text,
  `content` text,
  PRIMARY KEY (`conid`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yunu_diy_article
-- ----------------------------
INSERT INTO `yunu_diy_article` VALUES ('1', '公司顺利通过中国环境标志产品认证', '本站', '<p>近期，公司喜获“中国环境标志产品认证”证书。中国环境标志认证表明公司产品不仅质量合格，而且王企鹅群翁群无王企鹅无群二近期，公司喜获“中国环境标志产品认证”证书。中国环境标志认证表明公司产品不仅质量合格，而且王企鹅群翁群无王企鹅无群二1</p>', '<p>近期，公司喜获“中国环境标志产品认证”证书。中国环境标志认证表明公司产品不仅质量合格，而且王企鹅群翁群无王企鹅无群二近期，公司喜获“中国环境标志产品认证”证书。中国环境标志认证表明公司产品不仅质量合格，而且王企鹅群翁群无王企鹅无群二1</p>');
INSERT INTO `yunu_diy_article` VALUES ('2', '五金配件的进口与国产之争', '本站', '<p>五金件是现代家具中非常关键的组成部分，别看个头小，在一定程度它却可以决定家具的功能和使用寿</p>', '<p>五金件是现代家具中非常关键的组成部分，别看个头小，在一定程度它却可以决定家具的功能和使用寿</p>');
INSERT INTO `yunu_diy_article` VALUES ('3', '天津工厂组织后备骨干军训活动', '本站', '<p>为加强员工体能锻炼，提升工作激情，天津工厂年初举行了为期20多天的后备骨干军训活动</p>', '<p>为加强员工体能锻炼，提升工作激情，天津工厂年初举行了为期20多天的后备骨干军训活动</p>');
INSERT INTO `yunu_diy_article` VALUES ('4', '五金检测中心获资格 小榄锁具“锁”向无阻', '本站', '<p>小榄镇在2004年便被国家授予“中国锁具出口基地”称号，然而小榄锁具在出口时，却要送到外地</p>', '<p>小榄镇在2004年便被国家授予“中国锁具出口基地”称号，然而小榄锁具在出口时，却要送到外地</p>');

-- ----------------------------
-- Table structure for yunu_diy_image
-- ----------------------------
DROP TABLE IF EXISTS `yunu_diy_image`;
CREATE TABLE `yunu_diy_image` (
  `conid` int(10) NOT NULL AUTO_INCREMENT,
  `piclist` text,
  `desc` text,
  `content` text,
  PRIMARY KEY (`conid`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yunu_diy_image
-- ----------------------------
INSERT INTO `yunu_diy_image` VALUES ('1', '', '<p>1</p>', '<p>1</p>');
INSERT INTO `yunu_diy_image` VALUES ('2', '', '<p>2</p>', '<p>2</p>');
INSERT INTO `yunu_diy_image` VALUES ('3', '', '<p>3</p>', '<p>3</p>');
INSERT INTO `yunu_diy_image` VALUES ('4', '', '<p>4</p>', '<p>4</p>');
INSERT INTO `yunu_diy_image` VALUES ('5', '', '<p>5</p>', '<p>5</p>');

-- ----------------------------
-- Table structure for yunu_diy_page
-- ----------------------------
DROP TABLE IF EXISTS `yunu_diy_page`;
CREATE TABLE `yunu_diy_page` (
  `conid` int(10) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`conid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yunu_diy_page
-- ----------------------------

-- ----------------------------
-- Table structure for yunu_diy_product
-- ----------------------------
DROP TABLE IF EXISTS `yunu_diy_product`;
CREATE TABLE `yunu_diy_product` (
  `conid` int(10) NOT NULL AUTO_INCREMENT,
  `piclist` text,
  `desc` text,
  `content` text,
  PRIMARY KEY (`conid`)
) ENGINE=MyISAM AUTO_INCREMENT=87 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yunu_diy_product
-- ----------------------------
INSERT INTO `yunu_diy_product` VALUES ('1', '', '<p>1</p>', '<p>1</p>');
INSERT INTO `yunu_diy_product` VALUES ('2', '', '<p>1</p>', '<p>1</p>');
INSERT INTO `yunu_diy_product` VALUES ('3', '', '<p>1</p>', '<p>1</p>');
INSERT INTO `yunu_diy_product` VALUES ('4', '', '<p>1</p>', '<p>1</p>');
INSERT INTO `yunu_diy_product` VALUES ('5', '', '<p>1</p>', '<p>1</p>');
INSERT INTO `yunu_diy_product` VALUES ('6', '', '<p>1</p>', '<p>1</p>');
INSERT INTO `yunu_diy_product` VALUES ('7', '', '<p>1</p>', '<p>1</p>');
INSERT INTO `yunu_diy_product` VALUES ('8', '', '<p>大事发生电风扇第三帝国&#39;大事发生的风格&#39;</p>', '<p>1</p>');
INSERT INTO `yunu_diy_product` VALUES ('9', '', '', '<p>FHB200-BG</p>');
INSERT INTO `yunu_diy_product` VALUES ('10', '', '', '<p>22-FHE-SB</p>');
INSERT INTO `yunu_diy_product` VALUES ('11', '', '', '<p>23EG</p>');
INSERT INTO `yunu_diy_product` VALUES ('12', '', '<p>23-SG</p>', '<p>23-SG</p>');
INSERT INTO `yunu_diy_product` VALUES ('13', '', '', '<p>TZ-02</p>');
INSERT INTO `yunu_diy_product` VALUES ('14', '', '', '<p>HZ-033</p>');
INSERT INTO `yunu_diy_product` VALUES ('15', '', '', '<p>HYU-036</p>');
INSERT INTO `yunu_diy_product` VALUES ('16', '', '', '<p>TYZ-89</p>');
INSERT INTO `yunu_diy_product` VALUES ('17', '', '', '<p>RE-01</p>');
INSERT INTO `yunu_diy_product` VALUES ('18', '', '', '<p>RE-016</p>');
INSERT INTO `yunu_diy_product` VALUES ('19', '', '', '<p>RE-063</p>');
INSERT INTO `yunu_diy_product` VALUES ('20', '', '', '<p>HUW-561</p>');
INSERT INTO `yunu_diy_product` VALUES ('21', '', '', '<p>YHU2000-HZ05</p>');
INSERT INTO `yunu_diy_product` VALUES ('22', '', '', '<p>YH2001-HE056</p>');
INSERT INTO `yunu_diy_product` VALUES ('23', '', '', '<p>HTFC500-630V</p>');
INSERT INTO `yunu_diy_product` VALUES ('24', '', '', '<p>HYUHF3020-T028</p>');
INSERT INTO `yunu_diy_product` VALUES ('25', '', '', '<p>BZ188-56C</p>');
INSERT INTO `yunu_diy_product` VALUES ('26', '', '', '<p>BZ188-076C</p>');
INSERT INTO `yunu_diy_product` VALUES ('27', '', '', '<p>YHVF50-K63</p>');
INSERT INTO `yunu_diy_product` VALUES ('28', '', '', '<p>HYTR-630K</p>');
INSERT INTO `yunu_diy_product` VALUES ('29', '', '', '<p>JIN-01</p>');
INSERT INTO `yunu_diy_product` VALUES ('30', '', '', '<p>JIN-02</p>');
INSERT INTO `yunu_diy_product` VALUES ('31', '', '', '<p>JIN-03</p>');
INSERT INTO `yunu_diy_product` VALUES ('32', '', '', '<p>JIN-04</p>');
INSERT INTO `yunu_diy_product` VALUES ('33', '', '', '<p>KIHG-01</p>');
INSERT INTO `yunu_diy_product` VALUES ('34', '', '', '<p>KIHG-02</p>');
INSERT INTO `yunu_diy_product` VALUES ('35', '', '', '<p>KIHG-03</p>');
INSERT INTO `yunu_diy_product` VALUES ('36', '', '', '<p>KIHG-04</p>');
INSERT INTO `yunu_diy_product` VALUES ('37', '', '', '<p>SMPO-01</p>');
INSERT INTO `yunu_diy_product` VALUES ('38', '', '', '<p>SMPO-02</p>');
INSERT INTO `yunu_diy_product` VALUES ('39', '', '', '<p>SMPO-03</p>');
INSERT INTO `yunu_diy_product` VALUES ('40', '', '', '<p>SMPO-04</p>');
INSERT INTO `yunu_diy_product` VALUES ('41', '', '', '<p>HKIJG200-01</p>');
INSERT INTO `yunu_diy_product` VALUES ('42', '', '', '<p>HKIJG200-02</p>');
INSERT INTO `yunu_diy_product` VALUES ('43', '', '', '<p>HKIJG200-03</p>');
INSERT INTO `yunu_diy_product` VALUES ('44', '', '', '<p>HKIJG200-04</p>');
INSERT INTO `yunu_diy_product` VALUES ('45', '', '', '<p>PHJIKG-01</p>');
INSERT INTO `yunu_diy_product` VALUES ('46', '', '', '<p>PHJIKG-02</p>');
INSERT INTO `yunu_diy_product` VALUES ('47', '', '', '<p>PHJIKG-03</p>');
INSERT INTO `yunu_diy_product` VALUES ('48', '', '', '<p>PHJIKG-04</p>');
INSERT INTO `yunu_diy_product` VALUES ('49', '', '', '<p>JGQD-01</p>');
INSERT INTO `yunu_diy_product` VALUES ('50', '', '', '<p>JGQD-02</p>');
INSERT INTO `yunu_diy_product` VALUES ('51', '', '', '<p>JGQD-03</p>');
INSERT INTO `yunu_diy_product` VALUES ('52', '', '', '<p>JGQD-04</p>');
INSERT INTO `yunu_diy_product` VALUES ('53', '', '', '<p>JkLHF300-01</p>');
INSERT INTO `yunu_diy_product` VALUES ('54', '', '', '<p>JkLHF300-02</p>');
INSERT INTO `yunu_diy_product` VALUES ('55', '', '', '<p>JkLHF300-03</p>');
INSERT INTO `yunu_diy_product` VALUES ('56', '', '', '<p>JkLHF300-04</p>');

-- ----------------------------
-- Table structure for yunu_formcon
-- ----------------------------
DROP TABLE IF EXISTS `yunu_formcon`;
CREATE TABLE `yunu_formcon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fid` int(11) DEFAULT NULL,
  `vid` int(11) DEFAULT NULL,
  `istop` tinyint(1) DEFAULT '0',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `ip` varchar(15) DEFAULT NULL,
  `look` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yunu_formcon
-- ----------------------------
INSERT INTO `yunu_formcon` VALUES ('10', '3', '1', '0', '1515670595', '1515670595', '127.0.0.1', '1');

-- ----------------------------
-- Table structure for yunu_form_demo
-- ----------------------------
DROP TABLE IF EXISTS `yunu_form_demo`;
CREATE TABLE `yunu_form_demo` (
  `conid` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT '',
  `phone` int(10) unsigned DEFAULT '0',
  `yuanwang` text,
  PRIMARY KEY (`conid`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yunu_form_demo
-- ----------------------------

-- ----------------------------
-- Table structure for yunu_link
-- ----------------------------
DROP TABLE IF EXISTS `yunu_link`;
CREATE TABLE `yunu_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL COMMENT '标题',
  `pic` varchar(200) DEFAULT NULL COMMENT '图片',
  `url` varchar(200) DEFAULT NULL COMMENT '链接',
  `sort` smallint(6) DEFAULT '0' COMMENT '排序',
  `type` tinyint(1) DEFAULT '1' COMMENT '类型 1首页 2内页 3其他',
  `area` varchar(500) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yunu_link
-- ----------------------------
INSERT INTO `yunu_link` VALUES ('5', '百度', '', 'http://www.baidu.com', '0', '1', ',,1,,');
INSERT INTO `yunu_link` VALUES ('6', 'YUNUCMS官网', '', 'http://www.yunucms.com', '0', '1', '');

-- ----------------------------
-- Table structure for yunu_log
-- ----------------------------
DROP TABLE IF EXISTS `yunu_log`;
CREATE TABLE `yunu_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `admin_name` varchar(50) DEFAULT NULL COMMENT '用户姓名',
  `description` varchar(300) DEFAULT NULL COMMENT '描述',
  `ip` char(60) DEFAULT NULL COMMENT 'IP地址',
  `status` tinyint(1) DEFAULT NULL COMMENT '1 成功 2 失败',
  `add_time` int(11) DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`log_id`)
) ENGINE=MyISAM AUTO_INCREMENT=684 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yunu_log
-- ----------------------------

-- ----------------------------
-- Table structure for yunu_sitelink
-- ----------------------------
DROP TABLE IF EXISTS `yunu_sitelink`;
CREATE TABLE `yunu_sitelink` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `num` tinyint(5) DEFAULT '0',
  `otype` varchar(10) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否启用',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yunu_sitelink
-- ----------------------------
INSERT INTO `yunu_sitelink` VALUES ('16', '百度', 'http://www.baidu.com', '10', '_blank', '1');
