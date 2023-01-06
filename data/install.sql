/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : yunucms

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2022-03-12 09:17:17
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
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of yunu_admin
-- ----------------------------
INSERT INTO `yunu_admin` VALUES ('1', 'admin', 'ebbd202c239d6fc65061ae22a13c1b69', '1170', '127.0.0.1', '1647047650', 'admin', '1', '1');

-- ----------------------------
-- Table structure for yunu_area
-- ----------------------------
DROP TABLE IF EXISTS `yunu_area`;
CREATE TABLE `yunu_area` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT '',
  `stitle` varchar(100) DEFAULT '',
  `etitle` varchar(500) DEFAULT '',
  `pid` int(11) DEFAULT '0',
  `sort` int(11) DEFAULT '0',
  `isopen` tinyint(1) DEFAULT '1',
  `istop` tinyint(1) DEFAULT NULL,
  `iscon` tinyint(1) DEFAULT NULL,
  `isurl` tinyint(1) DEFAULT NULL,
  `seo_title` varchar(200) DEFAULT '',
  `seo_keywords` varchar(200) DEFAULT '',
  `seo_description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=659004510 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yunu_area
-- ----------------------------
INSERT INTO `yunu_area` VALUES ('340000', '安徽', '安徽', 'anhui', '0', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('110000', '北京', '北京', 'beijing', '0', '0', '0', '0', '0', '0', '11', '22', '33');
INSERT INTO `yunu_area` VALUES ('500000', '重庆', '重庆', 'chongqing', '0', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('350000', '福建', '福建', 'fujian', '0', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('620000', '甘肃', '甘肃', 'gansu', '0', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('440000', '广东', '广东', 'guangdong', '0', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('450000', '广西', '广西', 'guangxi', '0', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('520000', '贵州', '贵州', 'guizhou', '0', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('460000', '海南', '海南', 'hainan', '0', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130000', '河北', '河北', 'hebei', '0', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('230000', '黑龙江', '黑龙江', 'heilongjiang', '0', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('410000', '河南', '河南', 'henan', '0', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('420000', '湖北', '湖北', 'hubei', '0', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('430000', '湖南', '湖南', 'hunan', '0', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('320000', '江苏', '江苏', 'jiangsu', '0', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('360000', '江西', '江西', 'jiangxi', '0', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('220000', '吉林', '吉林', 'jilin', '0', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('210000', '辽宁', '辽宁', 'liaoning', '0', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('150000', '内蒙古', '内蒙古', 'namenggu', '0', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('640000', '宁夏', '宁夏', 'ningxia', '0', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('630000', '青海', '青海', 'qinghai', '0', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('370000', '山东', '山东', 'shandong', '0', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('310000', '上海', '上海', 'shanghai', '0', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('140000', '山西', '山西', 'sx', '0', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('610000', '陕西', '陕西', 'shanxi', '0', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('510000', '四川', '四川', 'sichuan', '0', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('120000', '天津', '天津', 'tianjin', '0', '0', '0', '0', '0', '0', '11', '22', '33');
INSERT INTO `yunu_area` VALUES ('650000', '新疆', '新疆', 'xj', '0', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('540000', '西藏', '西藏', 'xizang', '0', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('530000', '云南', '云南', 'yunnan', '0', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('330000', '浙江', '浙江', 'zhejiang', '0', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('110101', '东城', '东城', 'dongcheng', '110000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('110102', '西城', '西城', 'xicheng', '110000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('110105', '朝阳', '朝阳', 'cy', '110000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('110106', '丰台', '丰台', 'ft', '110000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('110107', '石景山', '石景山', 'shijingshan', '110000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('110108', '海淀', '海淀', 'haidian', '110000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('110109', '门头沟', '门头沟', 'mentougou', '110000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('110111', '房山', '房山', 'fs', '110000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('110112', '通州', '通州', 'tongzhou', '110000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('110113', '顺义', '顺义', 'shunyi', '110000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('110114', '昌平', '昌平', 'changping', '110000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('110115', '大兴', '大兴', 'daxing', '110000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('110116', '怀柔', '怀柔', 'huairou', '110000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('110117', '平谷', '平谷', 'pinggu', '110000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('110228', '密云', '密云', 'miyun', '110000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('110229', '延庆', '延庆', 'yanqing', '110000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('120101', '和平', '和平', 'heping', '120000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('120102', '河东', '河东', 'hedong', '120000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('120103', '河西', '河西', 'hexi', '120000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('120104', '南开', '南开', 'nankai', '120000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('120105', '河北', '河北', 'bei', '120000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('120106', '红桥', '红桥', 'hongqiao', '120000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('120110', '东丽', '东丽', 'dongli', '120000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('120111', '西青', '西青', 'xiqing', '120000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('120112', '津南', '津南', 'jinnan', '120000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('120113', '北辰', '北辰', 'beichen', '120000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('120114', '武清', '武清', 'wuqing', '120000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('120115', '宝坻', '宝坻', 'baodi', '120000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('120116', '滨海', '滨海', 'binhai', '120000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('120221', '宁河', '宁河', 'ninghe', '120000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('120223', '静海', '静海', 'jinghai', '120000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('120225', '蓟州', '蓟州', 'jz', '120000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130100', '石家庄', '石家庄', 'shijiazhuang', '130000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130102', '长安', '长安', 'changan', '130100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130104', '桥西', '桥西', 'qiaoxi', '130100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130105', '新华', '新华', 'xh', '130100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130107', '井陉矿', '井陉矿', 'jingxingkuang', '130100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130108', '裕华', '裕华', 'yh', '130100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130121', '井陉', '井陉', 'jingxing', '130100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130123', '正定', '正定', 'zhengding', '130100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130124', '栾城', '栾城', 'luancheng', '130100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130125', '行唐', '行唐', 'xingtang', '130100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130126', '灵寿', '灵寿', 'lingshou', '130100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130127', '高邑', '高邑', 'gaoyi', '130100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130128', '深泽', '深泽', 'shenze', '130100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130129', '赞皇', '赞皇', 'zanhuang', '130100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130130', '无极', '无极', 'wuji', '130100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130131', '平山', '平山', 'ps', '130100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130132', '元氏', '元氏', 'yuanshi', '130100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130133', '赵县', '赵县', 'zhaoxian', '130100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130181', '辛集', '辛集', 'xinji', '130100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130182', '藁城', '藁城', 'gaocheng', '130100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130183', '晋州', '晋州', 'jin', '130100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130184', '新乐', '新乐', 'xinle', '130100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130185', '鹿泉', '鹿泉', 'lq', '130100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130200', '唐山', '唐山', 'tangshan', '130000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130202', '路南', '路南', 'lunan', '130200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130203', '路北', '路北', 'lubei', '130200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130204', '古冶', '古冶', 'guye', '130200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130205', '开平', '开平', 'kaiping', '130200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130207', '丰南', '丰南', 'fengnan', '130200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130208', '丰润', '丰润', 'fengrun', '130200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130223', '滦县', '滦县', 'luanxian', '130200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130224', '滦南', '滦南', 'luannan', '130200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130225', '乐亭', '乐亭', 'leting', '130200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130227', '迁西', '迁西', 'qx', '130200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130229', '玉田', '玉田', 'yt', '130200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130230', '曹妃甸', '曹妃甸', 'caofeidian', '130200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130281', '遵化', '遵化', 'zunhua', '130200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130283', '迁安', '迁安', 'qian', '130200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130300', '秦皇岛', '秦皇岛', 'qinhuangdao', '130000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130302', '海港', '海港', 'haigang', '130300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130303', '山海关', '山海关', 'shanhaiguan', '130300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130304', '北戴河', '北戴河', 'beidaihe', '130300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130321', '青龙', '青龙', 'ql', '130300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130322', '昌黎', '昌黎', 'changli', '130300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130323', '抚宁', '抚宁', 'fning', '130300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130324', '卢龙', '卢龙', 'lulong', '130300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130400', '邯郸', '邯郸', 'handan', '130000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130402', '邯山', '邯山', 'hs', '130400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130403', '丛台', '丛台', 'congtai', '130400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130404', '复兴', '复兴', 'fuxing', '130400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130406', '峰峰矿', '峰峰矿', 'fengfengkuang', '130400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130423', '临漳', '临漳', 'linzhang', '130400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130424', '成安', '成安', 'chengan', '130400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130425', '大名', '大名', 'daming', '130400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130426', '涉县', '涉县', 'shexian', '130400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130427', '磁县', '磁县', 'cixian', '130400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130428', '肥乡', '肥乡', 'feixiang', '130400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130429', '永年', '永年', 'yongnian', '130400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130430', '邱县', '邱县', 'qiuxian', '130400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130431', '鸡泽', '鸡泽', 'jize', '130400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130432', '广平', '广平', 'guangping', '130400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130433', '馆陶', '馆陶', 'guantao', '130400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130434', '魏县', '魏县', 'wx', '130400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130435', '曲周', '曲周', 'qz', '130400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130481', '武安', '武安', 'wuan', '130400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130500', '邢台', '邢台', 'xingtai', '130000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130502', '桥东', '桥东', 'qiaodong', '130500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130503', '桥西', '桥西', 'qxi', '130500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130522', '临城', '临城', 'lincheng', '130500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130523', '内丘', '内丘', 'naqiu', '130500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130524', '柏乡', '柏乡', 'baixiang', '130500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130525', '隆尧', '隆尧', 'longyao', '130500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130526', '任县', '任县', 'renxian', '130500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130527', '南和', '南和', 'nanhe', '130500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130528', '宁晋', '宁晋', 'nj', '130500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130529', '巨鹿', '巨鹿', 'julu', '130500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130530', '新河', '新河', 'xhe', '130500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130531', '广宗', '广宗', 'guangzong', '130500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130532', '平乡', '平乡', 'px', '130500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130533', '威县', '威县', 'wei', '130500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130534', '清河', '清河', 'qh', '130500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130535', '临西', '临西', 'lx', '130500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130581', '南宫', '南宫', 'nangong', '130500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130582', '沙河', '沙河', 'shahe', '130500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130600', '保定', '保定', 'baoding', '130000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130602', '竞秀', '竞秀', 'jingxiu', '130600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130603', '莲池', '莲池', 'lianchi', '130600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130621', '满城', '满城', 'mancheng', '130600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130622', '清苑', '清苑', 'qy', '130600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130623', '涞水', '涞水', 'laishui', '130600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130624', '阜平', '阜平', 'fp', '130600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130625', '徐水', '徐水', 'xushui', '130600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130626', '定兴', '定兴', 'dingxing', '130600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130627', '唐县', '唐县', 'tangxian', '130600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130628', '高阳', '高阳', 'gaoyang', '130600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130629', '容城', '容城', 'rc', '130600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130630', '涞源', '涞源', 'laiyuan', '130600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130631', '望都', '望都', 'wangdu', '130600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130632', '安新', '安新', 'anxin', '130600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130633', '易县', '易县', 'yxin', '130600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130634', '曲阳', '曲阳', 'quyang', '130600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130635', '蠡县', '蠡县', 'li', '130600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130636', '顺平', '顺平', 'shunping', '130600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130637', '博野', '博野', 'boye', '130600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130638', '雄县', '雄县', 'xiongxian', '130600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130681', '涿州', '涿州', 'zhuozhou', '130600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130682', '定州', '定州', 'dingzhou', '130600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130683', '安国', '安国', 'anguo', '130600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130684', '高碑店', '高碑店', 'gaobeidian', '130600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130700', '张家口', '张家口', 'zhangjiakou', '130000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130702', '桥东', '桥东', 'qdong', '130700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130703', '桥西', '桥西', 'qiaox', '130700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130705', '宣化', '宣化', 'xuanhua', '130700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130706', '下花园', '下花园', 'xiahuayuan', '130700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130722', '张北', '张北', 'zhangbei', '130700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130723', '康保', '康保', 'kangbao', '130700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130724', '沽源', '沽源', 'gy', '130700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130725', '尚义', '尚义', 'shangyi', '130700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130726', '蔚县', '蔚县', 'weixian', '130700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130727', '阳原', '阳原', 'yangyuan', '130700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130728', '怀安', '怀安', 'huai', '130700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130729', '万全', '万全', 'wanquan', '130700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130730', '怀来', '怀来', 'huailai', '130700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130731', '涿鹿', '涿鹿', 'zhuolu', '130700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130732', '赤城', '赤城', 'chicheng', '130700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130733', '崇礼', '崇礼', 'chongli', '130700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130800', '承德', '承德', 'chengde', '130000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130802', '双桥', '双桥', 'shuangqiao', '130800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130803', '双滦', '双滦', 'shuangluan', '130800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130804', '鹰手营子矿', '鹰手营子矿', 'yingshouyingzikuang', '130800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130822', '兴隆', '兴隆', 'xinglong', '130800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130823', '平泉', '平泉', 'pingquan', '130800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130824', '滦平', '滦平', 'luanping', '130800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130825', '隆化', '隆化', 'long', '130800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130826', '丰宁', '丰宁', 'fengning', '130800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130827', '宽城', '宽城', 'kuancheng', '130800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130828', '围场', '围场', 'weichang', '130800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130900', '沧州', '沧州', 'cangzhou', '130000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130902', '新华', '新华', 'xinhua1', '130900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130903', '运河', '运河', 'yun', '130900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130921', '沧县', '沧县', 'cangxian', '130900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130922', '青县', '青县', 'qingxian', '130900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130923', '东光', '东光', 'dongguang', '130900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130924', '海兴', '海兴', 'haixing', '130900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130925', '盐山', '盐山', 'ys', '130900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130926', '肃宁', '肃宁', 'suning', '130900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130927', '南皮', '南皮', 'nanpi', '130900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130928', '吴桥', '吴桥', 'wuqiao', '130900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130929', '献县', '献县', 'xianxian', '130900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130930', '孟村', '孟村', 'mengcun', '130900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130981', '泊头', '泊头', 'botou', '130900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130982', '任丘', '任丘', 'renqiu', '130900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130983', '黄骅', '黄骅', 'huanghua', '130900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('130984', '河间', '河间', 'hejian', '130900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('131000', '廊坊', '廊坊', 'langfang', '130000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('131002', '安次', '安次', 'anci', '131000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('131003', '广阳', '广阳', 'guangyang', '131000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('131022', '固安', '固安', 'guan', '131000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('131023', '永清', '永清', 'yongqing', '131000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('131024', '香河', '香河', 'xianghe', '131000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('131025', '大城', '大城', 'dacheng', '131000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('131026', '文安', '文安', 'wenan', '131000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('131028', '大厂', '大厂', 'dachang', '131000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('131081', '霸州', '霸州', 'bzhou', '131000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('131082', '三河', '三河', 'sanhe', '131000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('131100', '衡水', '衡水', 'hengshui', '130000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('131102', '桃城', '桃城', 'taocheng', '131100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('131121', '枣强', '枣强', 'zaoqiang', '131100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('131122', '武邑', '武邑', 'wy', '131100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('131123', '武强', '武强', 'wuqiang', '131100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('131124', '饶阳', '饶阳', 'raoyang', '131100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('131125', '安平', '安平', 'anping', '131100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('131126', '故城', '故城', 'gc', '131100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('131127', '景县', '景县', 'jingxian2', '131100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('131128', '阜城', '阜城', 'fc', '131100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('131181', '冀州', '冀州', 'zhou', '131100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('131182', '深州', '深州', 'shenzhou', '131100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('140100', '太原', '太原', 'taiyuan', '140000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('140105', '小店', '小店', 'xiaodian', '140100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('140106', '迎泽', '迎泽', 'yingze', '140100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('140107', '杏花岭', '杏花岭', 'xinghualing', '140100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('140108', '尖草坪', '尖草坪', 'jiancaoping', '140100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('140109', '万柏林', '万柏林', 'wanbailin', '140100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('140110', '晋源', '晋源', 'jinyuan', '140100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('140121', '清徐', '清徐', 'qingxu', '140100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('140122', '阳曲', '阳曲', 'yangqu', '140100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('140123', '娄烦', '娄烦', 'loufan', '140100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('140181', '古交', '古交', 'gujiao', '140100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('140200', '大同', '大同', 'dt', '140000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('140202', '城区', '城区', 'cq', '140200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('140203', '矿区', '矿区', 'kuangqu', '140200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('140211', '南郊', '南郊', 'nanjiao', '140200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('140212', '新荣', '新荣', 'xinrong', '140200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('140221', '阳高', '阳高', 'yanggao', '140200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('140222', '天镇', '天镇', 'tianzhen', '140200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('140223', '广灵', '广灵', 'gl', '140200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('140224', '灵丘', '灵丘', 'lingqiu', '140200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('140225', '浑源', '浑源', 'hunyuan', '140200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('140226', '左云', '左云', 'zuoyun', '140200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('140227', '大同', '大同', 'tong', '140200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('140300', '阳泉', '阳泉', 'yangquan', '140000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('140302', '城区', '城区', 'qu', '140300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('140303', '矿区', '矿区', 'kuang', '140300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('140311', '郊区', '郊区', 'jqu', '140300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('140321', '平定', '平定', 'pingding', '140300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('140322', '盂县', '盂县', 'yuxian', '140300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('140400', '长治', '长治', 'changzhi', '140000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('140423', '襄垣', '襄垣', 'xiangyuan', '140400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('140424', '屯留', '屯留', 'tunliu', '140400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('140425', '平顺', '平顺', 'pingshun', '140400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('140426', '黎城', '黎城', 'lc', '140400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('140427', '壶关', '壶关', 'huguan', '140400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('140428', '长子', '长子', 'changzi', '140400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('140429', '武乡', '武乡', 'wuxiang', '140400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('140430', '沁县', '沁县', 'qinxian', '140400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('140431', '沁源', '沁源', 'qinyuan', '140400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('140481', '潞城', '潞城', 'lu', '140400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('140482', '城区', '城区', 'cheng', '140400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('140483', '郊区', '郊区', 'jiao', '140400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('140500', '晋城', '晋城', 'jincheng', '140000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('140502', '城区', '城区', 'chengqu', '140500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('140521', '沁水', '沁水', 'qinshui', '140500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('140522', '阳城', '阳城', 'yangcheng', '140500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('140524', '陵川', '陵川', 'ling', '140500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('140525', '泽州', '泽州', 'zezhou', '140500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('140581', '高平', '高平', 'gp', '140500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('140600', '朔州', '朔州', 'shuozhou', '140000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('140602', '朔城', '朔城', 'shuocheng', '140600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('140603', '平鲁', '平鲁', 'pl', '140600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('140621', '山阴', '山阴', 'shanyin', '140600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('140622', '应县', '应县', 'yingxian', '140600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('140623', '右玉', '右玉', 'youyu', '140600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('140624', '怀仁', '怀仁', 'huairen', '140600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('140700', '晋中', '晋中', 'jinzhong', '140000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('140702', '榆次', '榆次', 'yuci', '140700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('140721', '榆社', '榆社', 'yushe', '140700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('140722', '左权', '左权', 'zuoquan', '140700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('140723', '和顺', '和顺', 'heshun', '140700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('140724', '昔阳', '昔阳', 'xiyang', '140700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('140725', '寿阳', '寿阳', 'shouyang', '140700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('140726', '太谷', '太谷', 'taigu', '140700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('140727', '祁县', '祁县', 'qi', '140700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('140728', '平遥', '平遥', 'pingyao', '140700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('140729', '灵石', '灵石', 'lingshi', '140700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('140781', '介休', '介休', 'jiexiu', '140700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('140800', '运城', '运城', 'ycheng', '140000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('140802', '盐湖', '盐湖', 'yanhu', '140800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('140821', '临猗', '临猗', 'ly', '140800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('140822', '万荣', '万荣', 'wanrong', '140800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('140823', '闻喜', '闻喜', 'wenxi', '140800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('140824', '稷山', '稷山', 'jishan', '140800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('140825', '新绛', '新绛', 'xinjiang', '140800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('140826', '绛县', '绛县', 'jiangxian', '140800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('140827', '垣曲', '垣曲', 'yuanqu', '140800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('140828', '夏县', '夏县', 'xiaxian', '140800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('140829', '平陆', '平陆', 'pinglu', '140800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('140830', '芮城', '芮城', 'ruicheng', '140800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('140881', '永济', '永济', 'yji', '140800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('140882', '河津', '河津', 'hejin', '140800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('140900', '忻州', '忻州', 'xz', '140000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('140902', '忻府', '忻府', 'xf', '140900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('140921', '定襄', '定襄', 'dingxiang', '140900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('140922', '五台', '五台', 'wutai', '140900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('140923', '代县', '代县', 'daixian', '140900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('140924', '繁峙', '繁峙', 'fanzhi', '140900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('140925', '宁武', '宁武', 'ningwu', '140900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('140926', '静乐', '静乐', 'jingle', '140900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('140927', '神池', '神池', 'shenchi', '140900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('140928', '五寨', '五寨', 'wuzhai', '140900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('140929', '岢岚', '岢岚', 'kelan', '140900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('140930', '河曲', '河曲', 'hequ', '140900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('140931', '保德', '保德', 'baode', '140900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('140932', '偏关', '偏关', 'pianguan', '140900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('140981', '原平', '原平', 'yuanping', '140900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('141000', '临汾', '临汾', 'linfen', '140000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('141002', '尧都', '尧都', 'yaodu', '141000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('141021', '曲沃', '曲沃', 'quwo', '141000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('141022', '翼城', '翼城', 'yc', '141000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('141023', '襄汾', '襄汾', 'xiangfen', '141000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('141024', '洪洞', '洪洞', 'hongdong', '141000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('141025', '古县', '古县', 'guxian', '141000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('141026', '安泽', '安泽', 'anze', '141000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('141027', '浮山', '浮山', 'fu', '141000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('141028', '吉县', '吉县', 'jix', '141000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('141029', '乡宁', '乡宁', 'xiangning', '141000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('141030', '大宁', '大宁', 'daning', '141000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('141031', '隰县', '隰县', 'xx', '141000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('141032', '永和', '永和', 'yonghe', '141000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('141033', '蒲县', '蒲县', 'puxian', '141000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('141034', '汾西', '汾西', 'fenxi', '141000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('141081', '侯马', '侯马', 'houma', '141000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('141082', '霍州', '霍州', 'huozhou', '141000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('141100', '吕梁', '吕梁', 'lvliang', '140000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('141102', '离石', '离石', 'lishi', '141100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('141121', '文水', '文水', 'wenshui', '141100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('141122', '交城', '交城', 'jiaoc', '141100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('141123', '兴县', '兴县', 'xingxian', '141100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('141124', '临县', '临县', 'linxian', '141100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('141125', '柳林', '柳林', 'liulin', '141100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('141126', '石楼', '石楼', 'shilou', '141100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('141127', '岚县', '岚县', 'lanxian', '141100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('141128', '方山', '方山', 'fangshan', '141100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('141129', '中阳', '中阳', 'zhongyang', '141100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('141130', '交口', '交口', 'jiaokou', '141100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('141181', '孝义', '孝义', 'xiaoyi', '141100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('141182', '汾阳', '汾阳', 'fenyang', '141100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('150100', '呼和浩特', '呼和浩特', 'huhehaote', '150000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('150102', '新城', '新城', 'xc', '150100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('150103', '回民', '回民', 'hm', '150100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('150104', '玉泉', '玉泉', 'yuquan', '150100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('150105', '赛罕', '赛罕', 'saihan', '150100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('150121', '土默特左', '土默特左', 'tumotezuo', '150100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('150122', '托克托', '托克托', 'tuoketuo', '150100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('150123', '和林格尔', '和林格尔', 'helingeer', '150100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('150124', '清水河', '清水河', 'qingshuihe', '150100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('150125', '武川', '武川', 'wc', '150100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('150200', '包头', '包头', 'baotou', '150000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('150202', '东河', '东河', 'donghe', '150200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('150203', '昆都仑', '昆都仑', 'kundulun', '150200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('150204', '青山', '青山', 'qingshan', '150200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('150205', '石拐', '石拐', 'shiguai', '150200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('150206', '白云矿区', '白云矿区', 'baiyunkuangqu', '150200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('150207', '九原', '九原', 'jiuyuan', '150200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('150221', '土默特右', '土默特右', 'tumoteyou', '150200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('150222', '固阳', '固阳', 'guyang', '150200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('150223', '达尔罕茂明安联合', '达尔罕茂明安联合', 'daerhanmaominganlianhe', '150200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('150300', '乌海', '乌海', 'wuhai', '150000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('150302', '海勃湾', '海勃湾', 'haibowan', '150300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('150303', '海南', '海南', 'hn', '150300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('150304', '乌达', '乌达', 'wuda', '150300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('150400', '赤峰', '赤峰', 'chifeng', '150000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('150402', '红山', '红山', 'hongsh', '150400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('150403', '元宝山', '元宝山', 'yuanbaoshan', '150400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('150404', '松山', '松山', 'songshan', '150400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('150421', '阿鲁科尔沁', '阿鲁科尔沁', 'alukeerqin', '150400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('150422', '巴林左', '巴林左', 'balinzuo', '150400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('150423', '巴林右', '巴林右', 'balinyou', '150400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('150424', '林西', '林西', 'linxi', '150400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('150425', '克什克腾', '克什克腾', 'keshiketeng', '150400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('150426', '翁牛特', '翁牛特', 'wengniute', '150400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('150428', '喀喇沁', '喀喇沁', 'kalaqin', '150400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('150429', '宁城', '宁城', 'ningcheng', '150400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('150430', '敖汉', '敖汉', 'aohan', '150400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('150500', '通辽', '通辽', 'tongliao', '150000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('150502', '科尔沁', '科尔沁', 'keerqin', '150500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('150521', '科尔沁左翼中', '科尔沁左翼中', 'keerqinzuoyizhong', '150500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('150522', '科尔沁左翼后', '科尔沁左翼后', 'keerqinzuoyihou', '150500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('150523', '开鲁', '开鲁', 'kailu', '150500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('150524', '库伦', '库伦', 'kulun', '150500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('150525', '奈曼', '奈曼', 'naiman', '150500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('150526', '扎鲁特', '扎鲁特', 'zhalute', '150500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('150581', '霍林郭勒', '霍林郭勒', 'huolinguole', '150500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('150600', '鄂尔多斯', '鄂尔多斯', 'eerduosi', '150000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('150602', '东胜', '东胜', 'dongsheng', '150600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('150603', '康巴什', '康巴什', 'kangbashi', '150600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('150621', '达拉特', '达拉特', 'dalate', '150600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('150622', '准格尔', '准格尔', 'zhungeer', '150600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('150623', '鄂托克前', '鄂托克前', 'etuokeqian', '150600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('150624', '鄂托克', '鄂托克', 'etuoke', '150600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('150625', '杭锦', '杭锦', 'hangjin', '150600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('150626', '乌审', '乌审', 'wushen', '150600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('150627', '伊金霍洛', '伊金霍洛', 'yijinhuoluo', '150600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('150700', '呼伦贝尔', '呼伦贝尔', 'hulunbeier', '150000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('150702', '海拉尔', '海拉尔', 'hailaer', '150700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('150703', '扎赉诺尔', '扎赉诺尔', 'zhalainuoer', '150700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('150721', '阿荣', '阿荣', 'arong', '150700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('150722', '莫力达瓦', '莫力达瓦', 'molidawa', '150700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('150723', '鄂伦春', '鄂伦春', 'elunchun', '150700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('150724', '鄂温克', '鄂温克', 'ewenke', '150700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('150725', '陈巴尔虎', '陈巴尔虎', 'chenbaerhu', '150700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('150726', '新巴尔虎左', '新巴尔虎左', 'xinbaerhuzuo', '150700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('150727', '新巴尔虎右', '新巴尔虎右', 'xinbaerhuyou', '150700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('150781', '满洲里', '满洲里', 'manzhouli', '150700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('150782', '牙克石', '牙克石', 'yakeshi', '150700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('150783', '扎兰屯', '扎兰屯', 'zhalantun', '150700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('150784', '额尔古纳', '额尔古纳', 'eerguna', '150700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('150785', '根河', '根河', 'genhe', '150700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('150800', '巴彦淖尔', '巴彦淖尔', 'bayanneer', '150000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('150802', '临河', '临河', 'linhe', '150800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('150821', '五原', '五原', 'wuyuan', '150800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('150822', '磴口', '磴口', 'dengkou', '150800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('150823', '乌拉特前', '乌拉特前', 'wulateqian', '150800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('150824', '乌拉特中', '乌拉特中', 'wulatezhong', '150800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('150825', '乌拉特后', '乌拉特后', 'wulatehou', '150800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('150826', '杭锦后', '杭锦后', 'hangjinhou', '150800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('150900', '乌兰察布', '乌兰察布', 'wulanchabu', '150000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('150902', '集宁', '集宁', 'jning', '150900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('150921', '卓资', '卓资', 'zhuozi', '150900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('150922', '化德', '化德', 'huade', '150900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('150923', '商都', '商都', 'shangdu', '150900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('150924', '兴和', '兴和', 'xinghe', '150900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('150925', '凉城', '凉城', 'liangcheng', '150900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('150926', '察哈尔右翼前', '察哈尔右翼前', 'chahaeryouyiqian', '150900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('150927', '察哈尔右翼中', '察哈尔右翼中', 'chahaeryouyizhong', '150900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('150928', '察哈尔右翼后', '察哈尔右翼后', 'chahaeryouyihou', '150900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('150929', '四子王', '四子王', 'siziwang', '150900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('150981', '丰镇', '丰镇', 'fengzhen', '150900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('152200', '兴安', '兴安', 'xan', '150000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('152201', '乌兰浩特', '乌兰浩特', 'wulanhaote', '152200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('152202', '阿尔山', '阿尔山', 'aershan', '152200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('152221', '科尔沁右翼前', '科尔沁右翼前', 'keerqinyouyiqian', '152200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('152222', '科尔沁右翼中', '科尔沁右翼中', 'keerqinyouyizhong', '152200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('152223', '扎赉特', '扎赉特', 'zhalaite', '152200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('152224', '突泉', '突泉', 'tuquan', '152200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('152500', '锡林郭勒', '锡林郭勒', 'xilinguole', '150000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('152501', '二连浩特', '二连浩特', 'erlianhaote', '152500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('152502', '锡林浩特', '锡林浩特', 'xilinhaote', '152500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('152522', '阿巴嘎', '阿巴嘎', 'abaga', '152500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('152523', '苏尼特左', '苏尼特左', 'sunitezuo', '152500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('152524', '苏尼特右', '苏尼特右', 'suniteyou', '152500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('152525', '东乌珠穆沁', '东乌珠穆沁', 'dongwuzhumuqin', '152500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('152526', '西乌珠穆沁', '西乌珠穆沁', 'xiwuzhumuqin', '152500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('152527', '太仆寺', '太仆寺', 'taipusi', '152500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('152528', '镶黄', '镶黄', 'xianghuang', '152500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('152529', '正镶白', '正镶白', 'zhengxiangbai', '152500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('152530', '正蓝', '正蓝', 'zhenglan', '152500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('152531', '多伦', '多伦', 'duolun', '152500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('152900', '阿拉善', '阿拉善', 'alashan', '150000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('152921', '阿拉善左', '阿拉善左', 'alashanzuo', '152900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('152922', '阿拉善右', '阿拉善右', 'alashanyou', '152900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('152923', '额济纳', '额济纳', 'ejina', '152900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('210100', '沈阳', '沈阳', 'shenyang', '210000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('210102', '和平', '和平', 'hping', '210100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('210103', '沈河', '沈河', 'shenhe', '210100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('210104', '大东', '大东', 'dadong', '210100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('210105', '皇姑', '皇姑', 'huanggu', '210100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('210106', '铁西', '铁西', 'tie', '210100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('210111', '苏家屯', '苏家屯', 'sujiatun', '210100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('210112', '浑南', '浑南', 'hunnan', '210100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('210114', '于洪', '于洪', 'yuhong', '210100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('210122', '辽中', '辽中', 'liaozhong', '210100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('210123', '康平', '康平', 'kangping', '210100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('210124', '法库', '法库', 'faku', '210100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('210181', '新民', '新民', 'xinmin', '210100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('210184', '沈北', '沈北', 'shenbei', '210100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('210200', '大连', '大连', 'dalian', '210000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('210202', '中山', '中山', 'zs', '210200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('210203', '西岗', '西岗', 'xigang', '210200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('210204', '沙河口', '沙河口', 'shahekou', '210200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('210211', '甘井子', '甘井子', 'ganjingzi', '210200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('210212', '旅顺口', '旅顺口', 'lvshunkou', '210200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('210213', '金州', '金州', 'jinzh', '210200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('210224', '长海', '长海', 'changhai', '210200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('210281', '瓦房店', '瓦房店', 'wafangdian', '210200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('210282', '普兰店', '普兰店', 'pulandian', '210200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('210283', '庄河', '庄河', 'zhuanghe', '210200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('210300', '鞍山', '鞍山', 'anshan', '210000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('210302', '铁东', '铁东', 'tdong', '210300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('210303', '铁西', '铁西', 'tiexi1', '210300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('210304', '立山', '立山', 'lishan', '210300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('210311', '千山', '千山', 'qiansh', '210300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('210321', '台安', '台安', 'tai', '210300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('210323', '岫岩', '岫岩', 'xiuyan', '210300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('210381', '海城', '海城', 'hcheng', '210300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('210400', '抚顺', '抚顺', 'shun', '210000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('210402', '新抚', '新抚', 'xinfu', '210400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('210403', '东洲', '东洲', 'dongzhou', '210400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('210404', '望花', '望花', 'wanghua', '210400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('210411', '顺城', '顺城', 'shuncheng', '210400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('210422', '新宾', '新宾', 'xinbin', '210400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('210423', '清原', '清原', 'qing', '210400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('210500', '本溪', '本溪', 'benxi', '210000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('210502', '平山', '平山', 'pshan', '210500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('210503', '溪湖', '溪湖', 'xhu', '210500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('210504', '明山', '明山', 'ms', '210500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('210505', '南芬', '南芬', 'nanfen', '210500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('210522', '桓仁', '桓仁', 'huanren', '210500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('210600', '丹东', '丹东', 'dandong', '210000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('210602', '元宝', '元宝', 'yuanbao', '210600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('210603', '振兴', '振兴', 'zhenxing', '210600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('210604', '振安', '振安', 'zhen', '210600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('210624', '宽甸', '宽甸', 'kuandian', '210600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('210681', '东港', '东港', 'dgang', '210600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('210682', '凤城', '凤城', 'feng', '210600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('210700', '锦州', '锦州', 'jinzhou', '210000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('210702', '古塔', '古塔', 'guta', '210700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('210703', '凌河', '凌河', 'linghe', '210700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('210711', '太和', '太和', 'th', '210700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('210726', '黑山', '黑山', 'heishan', '210700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('210727', '义县', '义县', 'yix', '210700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('210781', '凌海', '凌海', 'linghai', '210700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('210782', '北镇', '北镇', 'beizhen', '210700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('210800', '营口', '营口', 'yingkou', '210000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('210802', '站前', '站前', 'zhanqian', '210800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('210803', '西市', '西市', 'xishi', '210800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('210804', '鲅鱼圈', '鲅鱼圈', 'bayuquan', '210800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('210811', '老边', '老边', 'laobian', '210800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('210881', '盖州', '盖州', 'gaizhou', '210800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('210882', '大石桥', '大石桥', 'dashiqiao', '210800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('210900', '阜新', '阜新', 'fuxin', '210000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('210902', '海州', '海州', 'hzhou', '210900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('210903', '新邱', '新邱', 'xinqiu', '210900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('210904', '太平', '太平', 'taiping', '210900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('210905', '清河门', '清河门', 'qinghemen', '210900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('210911', '细河', '细河', 'xi', '210900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('210922', '彰武', '彰武', 'zhangwu', '210900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('211000', '辽阳', '辽阳', 'liaoyang', '210000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('211002', '白塔', '白塔', 'baita', '211000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('211003', '文圣', '文圣', 'wensheng', '211000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('211004', '宏伟', '宏伟', 'hongwei', '211000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('211005', '弓长岭', '弓长岭', 'gongchangling', '211000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('211011', '太子河', '太子河', 'taizihe', '211000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('211081', '灯塔', '灯塔', 'dengta', '211000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('211100', '盘锦', '盘锦', 'panjin', '210000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('211102', '双台子', '双台子', 'shuangtaizi', '211100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('211103', '兴隆台', '兴隆台', 'xinglongtai', '211100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('211121', '大洼', '大洼', 'dawa', '211100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('211122', '盘山', '盘山', 'panshan', '211100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('211200', '铁岭', '铁岭', 'tieling', '210000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('211202', '银州', '银州', 'yz', '211200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('211204', '清河', '清河', 'qinghe1', '211200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('211223', '西丰', '西丰', 'xfeng', '211200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('211224', '昌图', '昌图', 'changtu', '211200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('211281', '调兵山', '调兵山', 'diaobingshan', '211200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('211282', '开原', '开原', 'ky', '211200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('211300', '朝阳', '朝阳', 'chaoy', '210000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('211302', '双塔', '双塔', 'shuangta', '211300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('211303', '龙城', '龙城', 'longcheng', '211300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('211321', '朝阳', '朝阳', 'yang', '211300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('211322', '建平', '建平', 'jianping', '211300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('211324', '喀左', '喀左', 'kazuo', '211300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('211381', '北票', '北票', 'beipiao', '211300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('211382', '凌源', '凌源', 'lingyuan', '211300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('211400', '葫芦岛', '葫芦岛', 'huludao', '210000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('211402', '连山', '连山', 'lianshan', '211400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('211403', '龙港', '龙港', 'lg', '211400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('211404', '南票', '南票', 'nanpiao', '211400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('211421', '绥中', '绥中', 'suizhong', '211400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('211422', '建昌', '建昌', 'jianchang', '211400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('211481', '兴城', '兴城', 'xingcheng', '211400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('220100', '长春', '长春', 'changchun', '220000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('220102', '南关', '南关', 'nanguan', '220100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('220103', '宽城', '宽城', 'kc', '220100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('220104', '朝阳', '朝阳', 'chao', '220100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('220105', '二道', '二道', 'erdao', '220100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('220106', '绿园', '绿园', 'lvyuan', '220100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('220112', '双阳', '双阳', 'shuangyang', '220100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('220122', '农安', '农安', 'nongan', '220100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('220181', '九台', '九台', 'jiutai', '220100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('220182', '榆树', '榆树', 'shu', '220100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('220183', '德惠', '德惠', 'dehui', '220100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('220202', '昌邑', '昌邑', 'cyi', '220000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('220203', '龙潭', '龙潭', 'longtan', '220000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('220204', '船营', '船营', 'chuanying', '220000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('220211', '丰满', '丰满', 'fengman', '220000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('220281', '蛟河', '蛟河', 'jiaohe', '220000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('220282', '桦甸', '桦甸', 'huadian', '220000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('220283', '舒兰', '舒兰', 'shulan', '220000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('220284', '磐石', '磐石', 'panshi', '220000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('220300', '四平', '四平', 'siping', '220000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('220302', '铁西', '铁西', 'tx', '220300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('220303', '铁东', '铁东', 'tiedong1', '220300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('220322', '梨树', '梨树', 'lishu', '220300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('220323', '伊通', '伊通', 'yitong', '220300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('220381', '公主岭', '公主岭', 'gongzhuling', '220300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('220382', '双辽', '双辽', 'shuangliao', '220300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('220400', '辽源', '辽源', 'liaoyuan', '220000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('220402', '龙山', '龙山', 'longshan', '220400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('220403', '西安', '西安', 'xa', '220400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('220421', '东丰', '东丰', 'df', '220400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('220422', '东辽', '东辽', 'dongliao', '220400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('220500', '通化', '通化', 'tonghua', '220000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('220502', '东昌', '东昌', 'dongchang', '220500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('220503', '二道江', '二道江', 'erdaojiang', '220500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('220523', '辉南', '辉南', 'huinan', '220500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('220524', '柳河', '柳河', 'lh', '220500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('220581', '梅河口', '梅河口', 'meihekou', '220500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('220582', '集安', '集安', 'ji', '220500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('220600', '白山', '白山', 'baishan', '220000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('220602', '浑江', '浑江', 'hunjiang', '220600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('220621', '抚松', '抚松', 'fusong', '220600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('220622', '靖宇', '靖宇', 'jingyu', '220600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('220623', '长白', '长白', 'changbai', '220600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('220625', '江源', '江源', 'jiangyuan', '220600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('220681', '临江', '临江', 'linjiang', '220600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('220700', '松原', '松原', 'songyuan', '220000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('220702', '宁江', '宁江', 'ningjiang', '220700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('220721', '前郭', '前郭', 'qianguo', '220700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('220722', '长岭', '长岭', 'changling', '220700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('220723', '乾安', '乾安', 'qianan', '220700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('220724', '扶余', '扶余', 'fy', '220700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('220800', '白城', '白城', 'baicheng', '220000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('220802', '洮北', '洮北', 'daobei', '220800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('220821', '镇赉', '镇赉', 'zhenlai', '220800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('220822', '通榆', '通榆', 'tongyu', '220800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('220881', '洮南', '洮南', 'daonan', '220800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('220882', '大安', '大安', 'dan', '220800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('222400', '延边朝鲜族', '延边朝鲜族', 'yanbianchaoxianzu', '220000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('222401', '延吉', '延吉', 'yanji', '222400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('222402', '图们', '图们', 'tumen', '222400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('222403', '敦化', '敦化', 'dunhua', '222400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('222404', '珲春', '珲春', 'huichun', '222400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('222405', '龙井', '龙井', 'longjing', '222400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('222406', '和龙', '和龙', 'helong', '222400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('222424', '汪清', '汪清', 'wangqing', '222400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('222426', '安图', '安图', 'antu', '222400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('230100', '哈尔滨', '哈尔滨', 'haerbin', '230000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('230102', '道里', '道里', 'daoli', '230100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('230103', '南岗', '南岗', 'nangang', '230100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('230104', '道外', '道外', 'daowai', '230100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('230106', '香坊', '香坊', 'xiangfang', '230100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('230108', '平房', '平房', 'pingfang', '230100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('230109', '松北', '松北', 'songbei', '230100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('230111', '呼兰', '呼兰', 'hulan', '230100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('230123', '依兰', '依兰', 'yilan', '230100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('230124', '方正', '方正', 'fangzheng', '230100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('230125', '宾县', '宾县', 'bx', '230100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('230126', '巴彦', '巴彦', 'bayan', '230100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('230127', '木兰', '木兰', 'mulan', '230100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('230128', '通河', '通河', 'tonghe', '230100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('230129', '延寿', '延寿', 'yanshou', '230100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('230181', '阿城', '阿城', 'acheng', '230100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('230182', '双城', '双城', 'shuangcheng', '230100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('230183', '尚志', '尚志', 'shangzhi', '230100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('230184', '五常', '五常', 'wu', '230100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('230200', '齐齐哈尔', '齐齐哈尔', 'qiqihaer', '230000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('230202', '龙沙', '龙沙', 'longsha', '230200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('230203', '建华', '建华', 'jianhua', '230200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('230204', '铁锋', '铁锋', 'tiefeng', '230200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('230205', '昂昂溪', '昂昂溪', 'angangxi', '230200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('230206', '富拉尔基', '富拉尔基', 'fulaerji', '230200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('230207', '碾子山', '碾子山', 'nianzishan', '230200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('230208', '梅里斯达斡尔族', '梅里斯达斡尔族', 'meilisidawoerzu', '230200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('230221', '龙江', '龙江', 'longjiang', '230200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('230223', '依安', '依安', 'yi', '230200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('230224', '泰来', '泰来', 'tailai', '230200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('230225', '甘南', '甘南', 'gannan', '230200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('230227', '富裕', '富裕', 'fuyu', '230200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('230229', '克山', '克山', 'keshan', '230200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('230230', '克东', '克东', 'kedong', '230200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('230231', '拜泉', '拜泉', 'baiquan', '230200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('230281', '讷河', '讷河', 'nehe', '230200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('230300', '鸡西', '鸡西', 'jxi', '230000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('230302', '鸡冠', '鸡冠', 'jiguan', '230300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('230303', '恒山', '恒山', 'heng', '230300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('230304', '滴道', '滴道', 'didao', '230300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('230305', '梨树', '梨树', 'lshu', '230300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('230306', '城子河', '城子河', 'chengzihe', '230300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('230307', '麻山', '麻山', 'mshan', '230300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('230321', '鸡东', '鸡东', 'jidong', '230300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('230381', '虎林', '虎林', 'hulin', '230300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('230382', '密山', '密山', 'mishan', '230300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('230400', '鹤岗', '鹤岗', 'hegang', '230000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('230402', '向阳', '向阳', 'xiangyang2', '230400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('230403', '工农', '工农', 'gongnong', '230400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('230404', '南山', '南山', 'nanshan', '230400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('230405', '兴安', '兴安', 'xinga', '230400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('230406', '东山', '东山', 'dshan', '230400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('230407', '兴山', '兴山', 'xingshan', '230400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('230421', '萝北', '萝北', 'luobei', '230400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('230422', '绥滨', '绥滨', 'suibin', '230400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('230500', '双鸭山', '双鸭山', 'shuangyashan', '230000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('230502', '尖山', '尖山', 'jianshan', '230500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('230503', '岭东', '岭东', 'lingdong', '230500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('230505', '四方台', '四方台', 'sifangtai', '230500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('230506', '宝山', '宝山', 'bs', '230500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('230521', '集贤', '集贤', 'jixian', '230500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('230522', '友谊', '友谊', 'youyi', '230500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('230523', '宝清', '宝清', 'baoqing', '230500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('230524', '饶河', '饶河', 'raohe', '230500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('230600', '大庆', '大庆', 'daqing', '230000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('230602', '萨尔图', '萨尔图', 'saertu', '230600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('230603', '龙凤', '龙凤', 'longfeng', '230600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('230604', '让胡路', '让胡路', 'ranghulu', '230600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('230605', '红岗', '红岗', 'honggang', '230600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('230606', '大同', '大同', 'da', '230600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('230621', '肇州', '肇州', 'zhaozhou', '230600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('230622', '肇源', '肇源', 'zy', '230600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('230623', '林甸', '林甸', 'lindian', '230600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('230624', '杜尔伯特', '杜尔伯特', 'duerbote', '230600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('230700', '伊春', '伊春', 'chun', '230000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('230703', '南岔', '南岔', 'nancha', '230700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('230704', '友好', '友好', 'youhao', '230700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('230705', '西林', '西林', 'xilin', '230700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('230706', '翠峦', '翠峦', 'cuiluan', '230700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('230707', '新青', '新青', 'xinqing', '230700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('230708', '美溪', '美溪', 'meixi', '230700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('230709', '金山屯', '金山屯', 'jinshantun', '230700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('230710', '五营', '五营', 'wuying', '230700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('230711', '乌马河', '乌马河', 'wumahe', '230700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('230712', '汤旺河', '汤旺河', 'tangwanghe', '230700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('230713', '带岭', '带岭', 'dailing', '230700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('230714', '乌伊岭', '乌伊岭', 'wuyiling', '230700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('230715', '红星', '红星', 'hongxing', '230700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('230716', '上甘岭', '上甘岭', 'shangganling', '230700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('230722', '嘉荫', '嘉荫', 'jiayin', '230700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('230781', '铁力', '铁力', 'tieli', '230700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('230800', '佳木斯', '佳木斯', 'jiamusi', '230000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('230803', '向阳', '向阳', 'xiangyang1', '230800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('230804', '前进', '前进', 'qianjin', '230800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('230805', '东风', '东风', 'dongfeng', '230800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('230811', '郊区', '郊区', 'jq', '230800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('230822', '桦南', '桦南', 'huanan', '230800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('230826', '桦川', '桦川', 'huachuan', '230800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('230828', '汤原', '汤原', 'tangyuan', '230800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('230833', '抚远', '抚远', 'fyuan', '230800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('230881', '同江', '同江', 'tj', '230800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('230882', '富锦', '富锦', 'fujin', '230800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('230900', '七台河', '七台河', 'qitaihe', '230000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('230902', '新兴', '新兴', 'xinxing', '230900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('230903', '桃山', '桃山', 'taoshan', '230900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('230904', '茄子河', '茄子河', 'qiezihe', '230900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('230921', '勃利', '勃利', 'boli', '230900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('231000', '牡丹江', '牡丹江', 'mudanjiang', '230000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('231002', '东安', '东安', 'dongan', '231000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('231003', '阳明', '阳明', 'yangming', '231000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('231004', '爱民', '爱民', 'aimin', '231000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('231005', '西安', '西安', 'xia', '231000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('231024', '东宁', '东宁', 'dongning', '231000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('231025', '林口', '林口', 'linkou', '231000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('231081', '绥芬河', '绥芬河', 'suifenhe', '231000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('231083', '海林', '海林', 'hailin', '231000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('231084', '宁安', '宁安', 'ningan', '231000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('231085', '穆棱', '穆棱', 'muling', '231000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('231100', '黑河', '黑河', 'heihe', '230000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('231102', '爱辉', '爱辉', 'aihui', '231100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('231121', '嫩江', '嫩江', 'nenjiang', '231100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('231123', '逊克', '逊克', 'xunke', '231100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('231124', '孙吴', '孙吴', 'sunwu', '231100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('231181', '北安', '北安', 'beian', '231100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('231182', '五大连池', '五大连池', 'wudalianchi', '231100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('231200', '绥化', '绥化', 'suihua', '230000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('231202', '北林', '北林', 'bl', '231200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('231221', '望奎', '望奎', 'wangkui', '231200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('231222', '兰西', '兰西', 'lan', '231200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('231223', '青冈', '青冈', 'qinggang', '231200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('231224', '庆安', '庆安', 'qingan', '231200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('231225', '明水', '明水', 'mingshui', '231200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('231226', '绥棱', '绥棱', 'suiling', '231200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('231281', '安达', '安达', 'anda', '231200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('231282', '肇东', '肇东', 'zhaodong', '231200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('231283', '海伦', '海伦', 'hailun', '231200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('232700', '大兴安岭', '大兴安岭', 'daxinganling', '230000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('232721', '呼玛', '呼玛', 'huma', '232700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('232722', '塔河', '塔河', 'tahe', '232700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('232723', '漠河', '漠河', 'mohe', '232700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('232724', '加格达奇', '加格达奇', 'jiagedaqi', '232700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('310101', '黄浦', '黄浦', 'hp', '310000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('310104', '徐汇', '徐汇', 'xuhui', '310000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('310105', '长宁', '长宁', 'cn', '310000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('310106', '静安', '静安', 'jing', '310000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('310107', '普陀', '普陀', 'putuo', '310000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('310109', '虹口', '虹口', 'hongkou', '310000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('310110', '杨浦', '杨浦', 'yangpu', '310000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('310112', '闵行', '闵行', 'minxing', '310000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('310113', '宝山', '宝山', 'baoshan1', '310000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('310114', '嘉定', '嘉定', 'jiading', '310000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('310115', '浦东', '浦东', 'pudong', '310000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('310116', '金山', '金山', 'jinshan', '310000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('310117', '松江', '松江', 'songjiang', '310000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('310118', '青浦', '青浦', 'qingpu', '310000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('310120', '奉贤', '奉贤', 'fxian', '310000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('310230', '崇明', '崇明', 'chongming', '310000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('320100', '南京', '南京', 'njing', '320000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('320102', '玄武', '玄武', 'xuanwu', '320100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('320104', '秦淮', '秦淮', 'qinhuai', '320100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('320105', '建邺', '建邺', 'jianye', '320100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('320106', '鼓楼', '鼓楼', 'gulou', '320100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('320111', '浦口', '浦口', 'pukou', '320100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('320113', '栖霞', '栖霞', 'qixia', '320100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('320114', '雨花台', '雨花台', 'yuhuatai', '320100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('320115', '江宁', '江宁', 'jiangning', '320100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('320116', '六合', '六合', 'liuhe', '320100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('320124', '溧水', '溧水', 'shui', '320100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('320125', '高淳', '高淳', 'gaochun', '320100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('320200', '无锡', '无锡', 'wxi', '320000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('320205', '锡山', '锡山', 'xshan', '320200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('320206', '惠山', '惠山', 'huishan', '320200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('320211', '滨湖', '滨湖', 'binhu', '320200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('320213', '梁溪', '梁溪', 'liangxi', '320200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('320214', '新吴', '新吴', 'xinwu', '320200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('320281', '江阴', '江阴', 'jiangyin', '320200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('320282', '宜兴', '宜兴', 'yixing', '320200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('320300', '徐州', '徐州', 'xuzhou', '320000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('320302', '鼓楼', '鼓楼', 'gu', '320300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('320303', '云龙', '云龙', 'yunlong', '320300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('320305', '贾汪', '贾汪', 'jiawang', '320300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('320311', '泉山', '泉山', 'quanshan', '320300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('320321', '丰县', '丰县', 'fx', '320300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('320322', '沛县', '沛县', 'peixian', '320300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('320323', '铜山', '铜山', 'ts', '320300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('320324', '睢宁', '睢宁', 'sn', '320300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('320381', '新沂', '新沂', 'xiny', '320300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('320382', '邳州', '邳州', 'pizhou', '320300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('320400', '常州', '常州', 'cz', '320000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('320402', '天宁', '天宁', 'tianning', '320400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('320404', '钟楼', '钟楼', 'zhonglou', '320400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('320411', '新北', '新北', 'xinbei', '320400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('320412', '武进', '武进', 'wujin', '320400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('320481', '溧阳', '溧阳', 'liyang', '320400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('320482', '金坛', '金坛', 'jintan', '320400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('320500', '苏州', '苏州', 'sz', '320000', '0', '1', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('320505', '虎丘', '虎丘', 'huqiu', '320500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('320506', '吴中', '吴中', 'zhong', '320500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('320507', '相城', '相城', 'xiang', '320500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('320508', '姑苏', '姑苏', 'gusu', '320500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('320581', '常熟', '常熟', 'changshu', '320500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('320582', '张家港', '张家港', 'zhangjiagang', '320500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('320583', '昆山', '昆山', 'kunshan', '320500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('320584', '吴江', '吴江', 'wj', '320500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('320585', '太仓', '太仓', 'taicang', '320500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('320600', '南通', '南通', 'nantong', '320000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('320602', '崇川', '崇川', 'chongchuan', '320600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('320611', '港闸', '港闸', 'gangzha', '320600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('320612', '通州', '通州', 'tzhou', '320600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('320621', '海安', '海安', 'haian', '320600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('320623', '如东', '如东', 'rudong', '320600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('320681', '启东', '启东', 'qd', '320600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('320682', '如皋', '如皋', 'rugao', '320600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('320684', '海门', '海门', 'haimen', '320600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('320700', '连云港', '连云港', 'lianyungang', '320000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('320703', '连云', '连云', 'lianyun', '320700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('320706', '海州', '海州', 'haizhou1', '320700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('320721', '赣榆', '赣榆', 'ganyu', '320700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('320722', '东海', '东海', 'donghai', '320700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('320723', '灌云', '灌云', 'guanyun', '320700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('320724', '灌南', '灌南', 'guannan', '320700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('320800', '淮安', '淮安', 'huaian', '320000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('320802', '清江浦', '清江浦', 'qingjiangpu', '320800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('320804', '淮阴', '淮阴', 'hy', '320800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('320826', '涟水', '涟水', 'lianshui', '320800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('320829', '洪泽', '洪泽', 'hongze', '320800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('320830', '盱眙', '盱眙', 'xuchi', '320800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('320831', '金湖', '金湖', 'jinhu', '320800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('320900', '盐城', '盐城', 'yan', '320000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('320902', '亭湖', '亭湖', 'tinghu', '320900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('320903', '盐都', '盐都', 'yandu', '320900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('320921', '响水', '响水', 'xiangshui', '320900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('320922', '滨海', '滨海', 'binghai', '320900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('320923', '阜宁', '阜宁', 'fn', '320900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('320924', '射阳', '射阳', 'sheyang', '320900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('320925', '建湖', '建湖', 'jianhu', '320900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('320981', '东台', '东台', 'dongtai', '320900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('320982', '大丰', '大丰', 'dafeng', '320900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('321000', '扬州', '扬州', 'yangzhou', '320000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('321002', '广陵', '广陵', 'guangling', '321000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('321003', '邗江', '邗江', 'hj', '321000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('321023', '宝应', '宝应', 'baoying', '321000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('321081', '仪征', '仪征', 'yizheng', '321000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('321084', '高邮', '高邮', 'gaoyou', '321000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('321088', '江都', '江都', 'jiangdu', '321000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('321100', '镇江', '镇江', 'zhenjiang', '320000', '0', '1', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('321102', '京口', '京口', 'jingkou', '321100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('321111', '润州', '润州', 'runzhou', '321100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('321112', '丹徒', '丹徒', 'dantu', '321100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('321181', '丹阳', '丹阳', 'danyang', '321100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('321182', '扬中', '扬中', 'yangzhong', '321100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('321183', '句容', '句容', 'jurong', '321100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('321200', '泰州', '泰州', 'tz', '320000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('321202', '海陵', '海陵', 'hailing', '321200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('321203', '高港', '高港', 'gaogang', '321200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('321281', '兴化', '兴化', 'xinghua', '321200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('321282', '靖江', '靖江', 'jingjiang', '321200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('321283', '泰兴', '泰兴', 'taixing', '321200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('321284', '姜堰', '姜堰', 'jiangyan', '321200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('321300', '宿迁', '宿迁', 'suqian', '320000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('321302', '宿城', '宿城', 'sucheng', '321300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('321311', '宿豫', '宿豫', 'suyu', '321300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('321322', '沭阳', '沭阳', 'shuyang', '321300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('321323', '泗阳', '泗阳', 'siyang', '321300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('321324', '泗洪', '泗洪', 'sihong', '321300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('330100', '杭州', '杭州', 'hangzhou', '330000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('330102', '上城', '上城', 'sc', '330100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('330103', '下城', '下城', 'xiacheng', '330100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('330104', '江干', '江干', 'jianggan', '330100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('330105', '拱墅', '拱墅', 'gongshu', '330100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('330106', '西湖', '西湖', 'xihu', '330100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('330108', '滨江', '滨江', 'binjiang', '330100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('330109', '萧山', '萧山', 'xiaoshan', '330100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('330110', '余杭', '余杭', 'yuhang', '330100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('330122', '桐庐', '桐庐', 'tonglu', '330100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('330127', '淳安', '淳安', 'chunan', '330100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('330182', '建德', '建德', 'jiande', '330100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('330183', '富阳', '富阳', 'fyang', '330100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('330185', '临安', '临安', 'linan', '330100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('330200', '宁波', '宁波', 'ningbo', '330000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('330203', '海曙', '海曙', 'haishu', '330200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('330205', '江北', '江北', 'jiangbei', '330200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('330206', '北仑', '北仑', 'beilun', '330200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('330211', '镇海', '镇海', 'zhenhai', '330200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('330212', '鄞州', '鄞州', 'yinzhou', '330200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('330225', '象山', '象山', 'xs', '330200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('330226', '宁海', '宁海', 'ninghai', '330200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('330281', '余姚', '余姚', 'yuyao', '330200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('330282', '慈溪', '慈溪', 'cixi', '330200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('330283', '奉化', '奉化', 'fenghua', '330200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('330300', '温州', '温州', 'wenzhou', '330000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('330302', '鹿城', '鹿城', 'lucheng', '330300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('330303', '龙湾', '龙湾', 'longwan', '330300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('330304', '瓯海', '瓯海', 'ouhai', '330300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('330322', '洞头', '洞头', 'dongtou', '330300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('330324', '永嘉', '永嘉', 'yongjia', '330300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('330326', '平阳', '平阳', 'pingyang', '330300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('330327', '苍南', '苍南', 'cangnan', '330300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('330328', '文成', '文成', 'wencheng', '330300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('330329', '泰顺', '泰顺', 'taishun', '330300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('330381', '瑞安', '瑞安', 'ruian', '330300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('330382', '乐清', '乐清', 'leqing', '330300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('330400', '嘉兴', '嘉兴', 'jiaxing', '330000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('330402', '南湖', '南湖', 'nanhu', '330400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('330411', '秀洲', '秀洲', 'xiuzhou', '330400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('330421', '嘉善', '嘉善', 'jiashan', '330400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('330424', '海盐', '海盐', 'hai', '330400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('330481', '海宁', '海宁', 'haining', '330400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('330482', '平湖', '平湖', 'pinghu', '330400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('330483', '桐乡', '桐乡', 'tongxiang', '330400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('330500', '湖州', '湖州', 'huzhou', '330000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('330502', '吴兴', '吴兴', 'wuxing', '330500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('330503', '南浔', '南浔', 'nanxun', '330500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('330521', '德清', '德清', 'dq', '330500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('330522', '长兴', '长兴', 'changxing', '330500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('330523', '安吉', '安吉', 'anji', '330500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('330600', '绍兴', '绍兴', 'shaoxing', '330000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('330602', '越城', '越城', 'yuecheng', '330600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('330621', '柯桥', '柯桥', 'keqiao', '330600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('330624', '新昌', '新昌', 'xinchang', '330600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('330681', '诸暨', '诸暨', 'zhuji', '330600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('330682', '上虞', '上虞', 'shangyu', '330600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('330683', '嵊州', '嵊州', 'chengzhou', '330600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('330700', '金华', '金华', 'jinhua', '330000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('330702', '婺城', '婺城', 'moucheng', '330700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('330703', '金东', '金东', 'jindong', '330700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('330723', '武义', '武义', 'wuyi', '330700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('330726', '浦江', '浦江', 'pj', '330700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('330727', '磐安', '磐安', 'panan', '330700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('330781', '兰溪', '兰溪', 'lanxi', '330700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('330782', '义乌', '义乌', 'yw', '330700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('330783', '东阳', '东阳', 'dongyang', '330700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('330784', '永康', '永康', 'yongkang', '330700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('330800', '衢州', '衢州', 'quzhou', '330000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('330802', '柯城', '柯城', 'kecheng', '330800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('330803', '衢江', '衢江', 'qj', '330800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('330822', '常山', '常山', 'changshan', '330800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('330824', '开化', '开化', 'kaihua', '330800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('330825', '龙游', '龙游', 'longyou', '330800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('330881', '江山', '江山', 'jiangshan', '330800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('330900', '舟山', '舟山', 'zhoushan', '330000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('330902', '定海', '定海', 'dinghai', '330900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('330903', '普陀', '普陀', 'tuo', '330900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('330921', '岱山', '岱山', 'daishan', '330900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('330922', '嵊泗', '嵊泗', 'chengsi', '330900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('331000', '台州', '台州', 'taizhou', '330000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('331002', '椒江', '椒江', 'jiaojiang', '331000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('331003', '黄岩', '黄岩', 'huangyan', '331000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('331004', '路桥', '路桥', 'luqiao', '331000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('331021', '玉环', '玉环', 'yuhuan', '331000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('331022', '三门', '三门', 'sanmen', '331000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('331023', '天台', '天台', 'tiantai', '331000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('331024', '仙居', '仙居', 'xianji', '331000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('331081', '温岭', '温岭', 'wenling', '331000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('331082', '临海', '临海', 'linhai', '331000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('331100', '丽水', '丽水', 'lishui', '330000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('331102', '莲都', '莲都', 'liandu', '331100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('331121', '青田', '青田', 'qingtian', '331100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('331122', '缙云', '缙云', 'jinyun', '331100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('331123', '遂昌', '遂昌', 'suichang', '331100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('331124', '松阳', '松阳', 'songyang', '331100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('331125', '云和', '云和', 'yunhe', '331100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('331126', '庆元', '庆元', 'qyuan', '331100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('331127', '景宁', '景宁', 'jn', '331100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('331181', '龙泉', '龙泉', 'longquan', '331100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('340100', '合肥', '合肥', 'hefei', '340000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('340102', '瑶海', '瑶海', 'yaohai', '340100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('340103', '庐阳', '庐阳', 'luyang', '340100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('340104', '蜀山', '蜀山', 'shushan', '340100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('340111', '包河', '包河', 'baohe', '340100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('340121', '长丰', '长丰', 'changfeng', '340100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('340122', '肥东', '肥东', 'feidong', '340100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('340123', '肥西', '肥西', 'feixi', '340100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('340200', '芜湖', '芜湖', 'wuhu', '340000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('340202', '镜湖', '镜湖', 'jinghu', '340200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('340203', '弋江', '弋江', 'yijiang', '340200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('340207', '鸠江', '鸠江', 'qiujiang', '340200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('340208', '三山', '三山', 'sanshan', '340200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('340222', '繁昌', '繁昌', 'fanchang', '340200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('340223', '南陵', '南陵', 'nanling', '340200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('340300', '蚌埠', '蚌埠', 'bangbu', '340000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('340302', '龙子湖', '龙子湖', 'longzihu', '340300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('340303', '蚌山', '蚌山', 'bangshan', '340300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('340304', '禹会', '禹会', 'yuhui', '340300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('340311', '淮上', '淮上', 'huaishang', '340300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('340321', '怀远', '怀远', 'huaiyuan', '340300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('340322', '五河', '五河', 'wuhe', '340300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('340323', '固镇', '固镇', 'guzhen', '340300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('340400', '淮南', '淮南', 'huainan', '340000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('340402', '大通', '大通', 'datong', '340400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('340403', '田家庵', '田家庵', 'tianjiaan', '340400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('340404', '谢家集', '谢家集', 'xiejiaji', '340400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('340405', '八公山', '八公山', 'bagongshan', '340400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('340406', '潘集', '潘集', 'panji', '340400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('340421', '凤台', '凤台', 'fengtai', '340400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('340500', '马鞍山', '马鞍山', 'maanshan', '340000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('340503', '花山', '花山', 'huashan', '340500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('340504', '雨山', '雨山', 'yshan', '340500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('340506', '博望', '博望', 'bowang', '340500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('340499', '寿县', '寿县', 'shouxian', '340400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('340521', '当涂', '当涂', 'dangtu', '340500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('340600', '淮北', '淮北', 'huaibei', '340000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('340602', '杜集', '杜集', 'duji', '340600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('340603', '相山', '相山', 'xiangshan', '340600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('340604', '烈山', '烈山', 'lieshan', '340600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('340621', '濉溪', '濉溪', 'sui', '340600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('340700', '铜陵', '铜陵', 'tongling', '340000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('340705', '铜官', '铜官', 'tg', '340700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('340711', '郊区', '郊区', 'jiaoqu3', '340700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('340721', '义安', '义安', 'yian', '340700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('340799', '枞阳', '枞阳', 'congyang', '340700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('340800', '安庆', '安庆', 'anqing', '340000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('340802', '迎江', '迎江', 'yingj', '340800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('340803', '大观', '大观', 'dg', '340800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('340811', '宜秀', '宜秀', 'yixiu', '340800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('340822', '怀宁', '怀宁', 'huaining', '340800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('340824', '潜山', '潜山', 'qianshan2', '340800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('340825', '太湖', '太湖', 'taihu', '340800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('340826', '宿松', '宿松', 'susong', '340800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('340827', '望江', '望江', 'wangjiang', '340800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('340828', '岳西', '岳西', 'yue', '340800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('340881', '桐城', '桐城', 'tcheng', '340800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('341000', '黄山', '黄山', 'huangshan', '340000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('341002', '屯溪', '屯溪', 'tunxi', '341000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('341004', '徽州', '徽州', 'hz', '341000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('341021', '歙县', '歙县', 'xiexian', '341000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('341022', '休宁', '休宁', 'xiuning', '341000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('341023', '黟县', '黟县', 'yixian', '341000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('341024', '祁门', '祁门', 'qimen', '341000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('341100', '滁州', '滁州', 'chuzhou', '340000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('341102', '琅琊', '琅琊', 'langya', '341100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('341103', '南谯', '南谯', 'nanqiao', '341100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('341122', '来安', '来安', 'laian', '341100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('341124', '全椒', '全椒', 'quanjiao', '341100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('341125', '定远', '定远', 'dingyuan', '341100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('341126', '凤阳', '凤阳', 'fengyang', '341100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('341181', '天长', '天长', 'tianchang', '341100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('341182', '明光', '明光', 'mingguang', '341100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('341200', '阜阳', '阜阳', 'fuyang', '340000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('341202', '颍州', '颍州', 'yingzhou', '341200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('341203', '颍东', '颍东', 'yingdong', '341200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('341204', '颍泉', '颍泉', 'yingquan', '341200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('341221', '临泉', '临泉', 'linquan', '341200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('341222', '太和', '太和', 'the', '341200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('341225', '阜南', '阜南', 'funan', '341200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('341226', '颍上', '颍上', 'yingshang', '341200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('341282', '界首', '界首', 'jieshou', '341200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('341300', '宿州', '宿州', 'su', '340000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('341302', '埇桥', '埇桥', 'qiao', '341300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('341321', '砀山', '砀山', 'dangshan', '341300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('341322', '萧县', '萧县', 'xiaoxian', '341300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('341323', '灵璧', '灵璧', 'lingbi', '341300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('341324', '泗县', '泗县', 'sixian', '341300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('341400', '巢湖', '巢湖', 'chaohu', '340100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('341421', '庐江', '庐江', 'lujiang', '340100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('341422', '无为', '无为', 'wwei', '340200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('341423', '含山', '含山', 'hanshan', '340500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('341424', '和县', '和县', 'hexian', '340500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('341500', '六安', '六安', 'liuan', '340000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('341502', '金安', '金安', 'ja', '341500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('341503', '裕安', '裕安', 'yuan', '341500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('341504', '叶集', '叶集', 'yeji', '341500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('341522', '霍邱', '霍邱', 'huoqiu', '341500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('341523', '舒城', '舒城', 'shucheng', '341500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('341524', '金寨', '金寨', 'jinzhai', '341500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('341525', '霍山', '霍山', 'huoshan', '341500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('341600', '亳州', '亳州', 'bz', '340000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('341602', '谯城', '谯城', 'qiaocheng', '341600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('341621', '涡阳', '涡阳', 'woyang', '341600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('341622', '蒙城', '蒙城', 'mengcheng', '341600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('341623', '利辛', '利辛', 'lixin', '341600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('341700', '池州', '池州', 'chizhou', '340000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('341702', '贵池', '贵池', 'guichi', '341700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('341721', '东至', '东至', 'dongzhi', '341700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('341722', '石台', '石台', 'shitai', '341700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('341723', '青阳', '青阳', 'qyang', '341700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('341800', '宣城', '宣城', 'xuancheng', '340000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('341802', '宣州', '宣州', 'xuanzhou', '341800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('341821', '郎溪', '郎溪', 'langxi', '341800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('341822', '广德', '广德', 'guangde', '341800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('341823', '泾县', '泾县', 'jingxian', '341800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('341824', '绩溪', '绩溪', 'jixi', '341800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('341825', '旌德', '旌德', 'jingde', '341800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('341881', '宁国', '宁国', 'ningguo', '341800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('350100', '福州', '福州', 'fuzhou', '350000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('350102', '鼓楼', '鼓楼', 'lou', '350100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('350103', '台江', '台江', 'taijiang', '350100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('350104', '仓山', '仓山', 'cangshan', '350100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('350105', '马尾', '马尾', 'mawei', '350100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('350111', '晋安', '晋安', 'jan', '350100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('350121', '闽侯', '闽侯', 'minhou', '350100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('350122', '连江', '连江', 'lj', '350100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('350123', '罗源', '罗源', 'luoyuan', '350100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('350124', '闽清', '闽清', 'minqing', '350100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('350125', '永泰', '永泰', 'yongtai', '350100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('350128', '平潭', '平潭', 'pingtan', '350100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('350181', '福清', '福清', 'fuqing', '350100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('350182', '长乐', '长乐', 'cl', '350100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('350200', '厦门', '厦门', 'xiamen', '350000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('350203', '思明', '思明', 'siming', '350200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('350205', '海沧', '海沧', 'haicang', '350200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('350206', '湖里', '湖里', 'huli', '350200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('350211', '集美', '集美', 'jimei', '350200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('350212', '同安', '同安', 'tongan', '350200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('350213', '翔安', '翔安', 'xiangan', '350200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('350300', '莆田', '莆田', 'putian', '350000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('350302', '城厢', '城厢', 'chengxiang', '350300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('350303', '涵江', '涵江', 'hanjiang', '350300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('350304', '荔城', '荔城', 'lcheng', '350300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('350305', '秀屿', '秀屿', 'xiuyu', '350300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('350322', '仙游', '仙游', 'xianyou', '350300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('350400', '三明', '三明', 'sanming', '350000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('350402', '梅列', '梅列', 'meilie', '350400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('350403', '三元', '三元', 'sy', '350400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('350421', '明溪', '明溪', 'mingxi', '350400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('350423', '清流', '清流', 'qingliu', '350400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('350424', '宁化', '宁化', 'ninghua', '350400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('350425', '大田', '大田', 'datian', '350400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('350426', '尤溪', '尤溪', 'youxi', '350400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('350427', '沙县', '沙县', 'shaxian', '350400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('350428', '将乐', '将乐', 'jiangle', '350400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('350429', '泰宁', '泰宁', 'taining', '350400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('350430', '建宁', '建宁', 'jianning', '350400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('350481', '永安', '永安', 'yongan', '350400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('350500', '泉州', '泉州', 'quan', '350000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('350502', '鲤城', '鲤城', 'lich', '350500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('350503', '丰泽', '丰泽', 'fengze', '350500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('350504', '洛江', '洛江', 'luo', '350500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('350505', '泉港', '泉港', 'quangang', '350500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('350521', '惠安', '惠安', 'huian', '350500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('350524', '安溪', '安溪', 'anxi', '350500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('350525', '永春', '永春', 'yongchun', '350500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('350526', '德化', '德化', 'dehua', '350500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('350527', '金门', '金门', 'jinmen', '350500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('350581', '石狮', '石狮', 'shishi', '350500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('350582', '晋江', '晋江', 'jjiang', '350500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('350583', '南安', '南安', 'nan', '350500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('350600', '漳州', '漳州', 'zhangzhou', '350000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('350602', '芗城', '芗城', 'xcheng', '350600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('350603', '龙文', '龙文', 'longwen', '350600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('350622', '云霄', '云霄', 'yunxiao', '350600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('350623', '漳浦', '漳浦', 'zhangpu', '350600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('350624', '诏安', '诏安', 'zhaoan', '350600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('350625', '长泰', '长泰', 'changtai', '350600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('350626', '东山', '东山', 'dongshan1', '350600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('350627', '南靖', '南靖', 'nanjing', '350600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('350628', '平和', '平和', 'pinghe', '350600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('350629', '华安', '华安', 'huaan', '350600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('350681', '龙海', '龙海', 'longhai', '350600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('350700', '南平', '南平', 'nanping', '350000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('350702', '延平', '延平', 'yanping', '350700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('350721', '顺昌', '顺昌', 'shunchang', '350700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('350722', '浦城', '浦城', 'pc', '350700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('350723', '光泽', '光泽', 'guangze', '350700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('350724', '松溪', '松溪', 'songxi', '350700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('350725', '政和', '政和', 'zhenghe', '350700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('350781', '邵武', '邵武', 'shaowu', '350700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('350782', '武夷山', '武夷山', 'wuyishan', '350700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('350783', '建瓯', '建瓯', 'jianou', '350700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('350784', '建阳', '建阳', 'jy', '350700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('350800', '龙岩', '龙岩', 'longyan', '350000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('350802', '新罗', '新罗', 'xinluo', '350800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('350821', '长汀', '长汀', 'changting', '350800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('350822', '永定', '永定', 'yongding', '350800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('350823', '上杭', '上杭', 'shanghang', '350800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('350824', '武平', '武平', 'wuping', '350800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('350825', '连城', '连城', 'liancheng', '350800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('350881', '漳平', '漳平', 'zhangping', '350800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('350900', '宁德', '宁德', 'ningde', '350000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('350902', '蕉城', '蕉城', 'jiaocheng', '350900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('350921', '霞浦', '霞浦', 'xiapu', '350900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('350922', '古田', '古田', 'gutian', '350900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('350923', '屏南', '屏南', 'pn', '350900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('350924', '寿宁', '寿宁', 'shouning', '350900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('350925', '周宁', '周宁', 'zhouning', '350900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('350926', '柘荣', '柘荣', 'zherong', '350900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('350981', '福安', '福安', 'fuan', '350900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('350982', '福鼎', '福鼎', 'fuding', '350900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('360100', '南昌', '南昌', 'nanchang', '360000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('360102', '东湖', '东湖', 'donghu', '360100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('360103', '西湖', '西湖', 'hu', '360100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('360104', '青云谱', '青云谱', 'qingyunpu', '360100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('360105', '湾里', '湾里', 'wanli', '360100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('360111', '青山湖', '青山湖', 'qingshanhu', '360100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('360122', '新建', '新建', 'xinjian', '360100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('360123', '安义', '安义', 'anyi', '360100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('360124', '进贤', '进贤', 'jinxian', '360100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('360200', '景德镇', '景德镇', 'jingdezhen', '360000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('360202', '昌江', '昌江', 'changjiang', '360200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('360203', '珠山', '珠山', 'zshan', '360200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('360222', '浮梁', '浮梁', 'fuliang', '360200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('360281', '乐平', '乐平', 'leping', '360200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('360300', '萍乡', '萍乡', 'pxing', '360000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('360302', '安源', '安源', 'ayuan', '360300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('360313', '湘东', '湘东', 'xiangdong', '360300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('360321', '莲花', '莲花', 'lianhua', '360300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('360322', '上栗', '上栗', 'shangli', '360300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('360323', '芦溪', '芦溪', 'luxii', '360300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('360400', '九江', '九江', 'jiujiang', '360000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('360402', '濂溪', '濂溪', 'lianxi', '360400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('360403', '浔阳', '浔阳', 'xun', '360400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('360423', '武宁', '武宁', 'wuning', '360400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('360424', '修水', '修水', 'xiushui', '360400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('360425', '永修', '永修', 'yongxiu', '360400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('360426', '德安', '德安', 'dean', '360400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('360427', '庐山', '庐山', 'lus', '360400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('360428', '都昌', '都昌', 'duchang', '360400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('360429', '湖口', '湖口', 'hukou', '360400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('360430', '彭泽', '彭泽', 'pengze', '360400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('360481', '瑞昌', '瑞昌', 'ruichang', '360400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('360483', '共青城', '共青城', 'gongqingcheng', '360400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('360500', '新余', '新余', 'xinyu', '360000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('360502', '渝水', '渝水', 'yushui', '360500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('360521', '分宜', '分宜', 'fenyi', '360500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('360600', '鹰潭', '鹰潭', 'yingtan', '360000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('360602', '月湖', '月湖', 'yuehu', '360600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('360622', '余江', '余江', 'yujiang', '360600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('360681', '贵溪', '贵溪', 'guixi', '360600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('360700', '赣州', '赣州', 'gz', '360000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('360702', '章贡', '章贡', 'zhanggong', '360700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('360721', '赣县', '赣县', 'ganxian', '360700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('360722', '信丰', '信丰', 'xin', '360700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('360723', '大余', '大余', 'dayu', '360700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('360724', '上犹', '上犹', 'shangyou', '360700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('360725', '崇义', '崇义', 'chongyi', '360700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('360726', '安远', '安远', 'anyuan1', '360700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('360727', '龙南', '龙南', 'ln', '360700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('360728', '定南', '定南', 'dingnan', '360700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('360729', '全南', '全南', 'quannan', '360700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('360730', '宁都', '宁都', 'ningdu', '360700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('360731', '于都', '于都', 'yudu', '360700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('360732', '兴国', '兴国', 'xingguo', '360700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('360733', '会昌', '会昌', 'huichang', '360700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('360734', '寻乌', '寻乌', 'xunwu', '360700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('360735', '石城', '石城', 'shicheng', '360700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('360781', '瑞金', '瑞金', 'ruijin', '360700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('360782', '南康', '南康', 'nankang', '360700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('360800', '吉安', '吉安', 'jian', '360000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('360802', '吉州', '吉州', 'jizhou', '360800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('360803', '青原', '青原', 'qingy', '360800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('360822', '吉水', '吉水', 'jishui', '360800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('360823', '峡江', '峡江', 'xiajiang', '360800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('360824', '新干', '新干', 'xingan', '360800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('360825', '永丰', '永丰', 'yongfeng', '360800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('360826', '泰和', '泰和', 'taihe', '360800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('360827', '遂川', '遂川', 'suichuan', '360800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('360828', '万安', '万安', 'wanan', '360800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('360829', '安福', '安福', 'anfu', '360800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('360830', '永新', '永新', 'yongxin', '360800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('360881', '井冈山', '井冈山', 'jinggangshan', '360800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('360900', '宜春', '宜春', 'yichun', '360000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('360902', '袁州', '袁州', 'yzhou', '360900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('360921', '奉新', '奉新', 'fengxin', '360900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('360922', '万载', '万载', 'wanzai', '360900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('360923', '上高', '上高', 'shanggao', '360900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('360924', '宜丰', '宜丰', 'yifeng', '360900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('360925', '靖安', '靖安', 'jingan', '360900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('360926', '铜鼓', '铜鼓', 'tonggu', '360900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('360981', '丰城', '丰城', 'fengcheng', '360900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('360982', '樟树', '樟树', 'zhangshu', '360900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('360983', '高安', '高安', 'gaoan', '360900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('361000', '抚州', '抚州', 'fzhou', '360000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('361002', '临川', '临川', 'linchuan', '361000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('361021', '南城', '南城', 'nancheng', '361000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('361022', '黎川', '黎川', 'chuan', '361000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('361023', '南丰', '南丰', 'nanfeng', '361000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('361024', '崇仁', '崇仁', 'chongren', '361000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('361025', '乐安', '乐安', 'lean', '361000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('361026', '宜黄', '宜黄', 'yihuang', '361000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('361027', '金溪', '金溪', 'jinxi', '361000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('361028', '资溪', '资溪', 'zixi', '361000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('361029', '东乡', '东乡', 'dongxiang', '361000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('361030', '广昌', '广昌', 'guangchang', '361000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('361100', '上饶', '上饶', 'shangrao', '360000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('361102', '信州', '信州', 'xzhou', '361100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('361122', '广丰', '广丰', 'guangfeng', '361100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('361123', '玉山', '玉山', 'yushan', '361100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('361124', '铅山', '铅山', 'qs', '361100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('361125', '横峰', '横峰', 'hengfeng', '361100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('361126', '弋阳', '弋阳', 'yyang', '361100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('361127', '余干', '余干', 'yugan', '361100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('361128', '鄱阳', '鄱阳', 'poyang', '361100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('361129', '万年', '万年', 'wannian', '361100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('361130', '婺源', '婺源', 'mouyuan', '361100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('361181', '德兴', '德兴', 'dexing', '361100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('370100', '济南', '济南', 'jinan', '370000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('370102', '历下', '历下', 'lixia', '370100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('370103', '市中', '市中', 'shizh', '370100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('370104', '槐荫', '槐荫', 'huaiyin', '370100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('370105', '天桥', '天桥', 'tianqiao', '370100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('370112', '历城', '历城', 'licheng', '370100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('370113', '长清', '长清', 'changqing', '370100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('370124', '平阴', '平阴', 'pingyin', '370100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('370125', '济阳', '济阳', 'jyang', '370100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('370126', '商河', '商河', 'shanghe', '370100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('370181', '章丘', '章丘', 'zhangqiu', '370100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('370200', '青岛', '青岛', 'qingdao', '370000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('370202', '市南', '市南', 'shinan', '370200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('370203', '市北', '市北', 'shibei', '370200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('370211', '黄岛', '黄岛', 'huangdao', '370200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('370212', '崂山', '崂山', 'laoshan', '370200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('370213', '李沧', '李沧', 'licang', '370200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('370214', '城阳', '城阳', 'chengyang', '370200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('370281', '胶州', '胶州', 'jiaozhou', '370200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('370282', '即墨', '即墨', 'jimo', '370200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('370283', '平度', '平度', 'pingdu', '370200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('370285', '莱西', '莱西', 'laixi', '370200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('370300', '淄博', '淄博', 'zibo', '370000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('370302', '淄川', '淄川', 'zichuan', '370300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('370303', '张店', '张店', 'zhangdian', '370300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('370304', '博山', '博山', 'boshan', '370300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('370305', '临淄', '临淄', 'linzi', '370300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('370306', '周村', '周村', 'zhoucun', '370300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('370321', '桓台', '桓台', 'huantai', '370300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('370322', '高青', '高青', 'gaoqing', '370300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('370323', '沂源', '沂源', 'yiyuan', '370300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('370400', '枣庄', '枣庄', 'zaozhuang', '370000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('370402', '市中', '市中', 'shizhong1', '370400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('370403', '薛城', '薛城', 'xuecheng', '370400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('370404', '峄城', '峄城', 'yich', '370400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('370405', '台儿庄', '台儿庄', 'taierzhuang', '370400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('370406', '山亭', '山亭', 'shanting', '370400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('370481', '滕州', '滕州', 'tengzhou', '370400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('370500', '东营', '东营', 'dongying', '370000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('370503', '河口', '河口', 'hekou', '370500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('370521', '垦利', '垦利', 'kenli', '370500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('370522', '利津', '利津', 'lijin', '370500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('370523', '广饶', '广饶', 'guangrao', '370500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('370600', '烟台', '烟台', 'yantai', '370000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('370602', '芝罘', '芝罘', 'zhifu', '370600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('370611', '福山', '福山', 'fshan', '370600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('370612', '牟平', '牟平', 'mouping', '370600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('370613', '莱山', '莱山', 'laishan', '370600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('370634', '长岛', '长岛', 'changdao', '370600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('370681', '龙口', '龙口', 'longkou', '370600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('370682', '莱阳', '莱阳', 'laiyang', '370600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('370683', '莱州', '莱州', 'laizhou', '370600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('370684', '蓬莱', '蓬莱', 'penglai', '370600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('370685', '招远', '招远', 'zhaoyuan', '370600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('370686', '栖霞', '栖霞', 'xix', '370600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('370687', '海阳', '海阳', 'haiyang', '370600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('370700', '潍坊', '潍坊', 'weifang', '370000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('370702', '潍城', '潍城', 'wcheng', '370700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('370703', '寒亭', '寒亭', 'hanting', '370700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('370704', '坊子', '坊子', 'fangzi', '370700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('370705', '奎文', '奎文', 'kuiwen', '370700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('370724', '临朐', '临朐', 'linchun', '370700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('370725', '昌乐', '昌乐', 'changle', '370700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('370781', '青州', '青州', 'qingzhou', '370700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('370782', '诸城', '诸城', 'zhucheng', '370700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('370783', '寿光', '寿光', 'shouguang', '370700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('370784', '安丘', '安丘', 'anqiu', '370700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('370785', '高密', '高密', 'gaomi', '370700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('370786', '昌邑', '昌邑', 'changyi1', '370700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('370800', '济宁', '济宁', 'jining', '370000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('370811', '任城', '任城', 'rencheng', '370800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('370826', '微山', '微山', 'wshan', '370800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('370827', '鱼台', '鱼台', 'yutai', '370800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('370828', '金乡', '金乡', 'jinxiang', '370800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('370829', '嘉祥', '嘉祥', 'jiaxiang', '370800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('370830', '汶上', '汶上', 'wenshang', '370800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('370831', '泗水', '泗水', 'sishui', '370800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('370832', '梁山', '梁山', 'ls', '370800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('370881', '曲阜', '曲阜', 'qufu', '370800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('370882', '兖州', '兖州', 'yanzhou', '370800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('370883', '邹城', '邹城', 'zoucheng', '370800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('370900', '泰安', '泰安', 'taian', '370000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('370902', '泰山', '泰山', 'tshan', '370900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('370903', '岱岳', '岱岳', 'daiyue', '370900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('370921', '宁阳', '宁阳', 'ningyang', '370900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('370923', '东平', '东平', 'dongping', '370900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('370982', '新泰', '新泰', 'xintai', '370900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('370983', '肥城', '肥城', 'feicheng', '370900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('371000', '威海', '威海', 'weihai', '370000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('371002', '环翠', '环翠', 'huancui', '371000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('371081', '文登', '文登', 'wendeng', '371000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('371082', '荣成', '荣成', 'rongcheng2', '371000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('371083', '乳山', '乳山', 'rushan', '371000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('371100', '日照', '日照', 'rizhao', '370000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('371102', '东港', '东港', 'donggang1', '371100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('371103', '岚山', '岚山', 'lshan', '371100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('371121', '五莲', '五莲', 'wulian', '371100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('371122', '莒县', '莒县', 'juxian', '371100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('371200', '莱芜', '莱芜', 'laiwu', '370000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('371202', '莱城', '莱城', 'laicheng', '371200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('371203', '钢城', '钢城', 'gangcheng', '371200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('371300', '临沂', '临沂', 'lxi', '370000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('371302', '兰山', '兰山', 'lansh', '371300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('371311', '罗庄', '罗庄', 'luozhuang', '371300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('371312', '河东', '河东', 'hdong', '371300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('371321', '沂南', '沂南', 'yinan', '371300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('371322', '郯城', '郯城', 'tancheng', '371300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('371323', '沂水', '沂水', 'yishui', '371300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('371324', '兰陵', '兰陵', 'lanling', '371300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('371325', '费县', '费县', 'feixian', '371300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('371326', '平邑', '平邑', 'pingyi', '371300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('371327', '莒南', '莒南', 'junan', '371300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('371328', '蒙阴', '蒙阴', 'mengyin', '371300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('371329', '临沭', '临沭', 'linshu', '371300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('371400', '德州', '德州', 'dezhou', '370000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('371402', '德城', '德城', 'decheng', '371400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('371421', '陵城', '陵城', 'lingcheng', '371400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('371422', '宁津', '宁津', 'ningjin', '371400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('371423', '庆云', '庆云', 'qingyun', '371400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('371424', '临邑', '临邑', 'linyi', '371400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('371425', '齐河', '齐河', 'qihe', '371400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('371426', '平原', '平原', 'py', '371400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('371427', '夏津', '夏津', 'xiajin', '371400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('371428', '武城', '武城', 'wucheng', '371400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('371481', '乐陵', '乐陵', 'leling', '371400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('371482', '禹城', '禹城', 'yuch', '371400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('371500', '聊城', '聊城', 'liaocheng', '370000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('371502', '东昌府', '东昌府', 'dongchangfu', '371500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('371521', '阳谷', '阳谷', 'yanggu', '371500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('371522', '莘县', '莘县', 'xinx', '371500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('371523', '茌平', '茌平', 'chiping', '371500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('371524', '东阿', '东阿', 'donga', '371500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('371525', '冠县', '冠县', 'guanxian', '371500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('371526', '高唐', '高唐', 'gaotang', '371500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('371581', '临清', '临清', 'linqing', '371500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('371600', '滨州', '滨州', 'binzhou', '370000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('371602', '滨城', '滨城', 'bincheng', '371600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('371621', '惠民', '惠民', 'huimin', '371600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('371622', '阳信', '阳信', 'yxin', '371600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('371623', '无棣', '无棣', 'wudi', '371600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('371624', '沾化', '沾化', 'zhanhua', '371600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('371625', '博兴', '博兴', 'boxing', '371600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('371626', '邹平', '邹平', 'zouping', '371600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('371700', '菏泽', '菏泽', 'heze', '370000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('371702', '牡丹', '牡丹', 'mudan', '371700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('371721', '曹县', '曹县', 'caoxian', '371700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('371722', '单县', '单县', 'danxian', '371700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('371723', '成武', '成武', 'chengwu', '371700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('371724', '巨野', '巨野', 'juye', '371700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('371725', '郓城', '郓城', 'yunch', '371700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('371726', '鄄城', '鄄城', 'juancheng', '371700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('371727', '定陶', '定陶', 'dingtao', '371700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('371728', '东明', '东明', 'dongming', '371700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('410100', '郑州', '郑州', 'zhengzhou', '410000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('410102', '中原', '中原', 'zhongyuan', '410100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('410103', '二七', '二七', 'erqi', '410100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('410104', '管城回族', '管城回族', 'guanchenghuizu', '410100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('410105', '金水', '金水', 'jinshui', '410100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('410106', '上街', '上街', 'shangjie', '410100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('410108', '惠济', '惠济', 'huiji', '410100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('410122', '中牟', '中牟', 'zhongmou', '410100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('410181', '巩义', '巩义', 'gongyi', '410100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('410182', '荥阳', '荥阳', 'xingyang', '410100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('410183', '新密', '新密', 'xinmi', '410100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('410184', '新郑', '新郑', 'xinzheng', '410100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('410185', '登封', '登封', 'dengfeng', '410100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('410200', '开封', '开封', 'kaifeng', '410000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('410202', '龙亭', '龙亭', 'longting', '410200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('410203', '顺河回族', '顺河回族', 'shunhehuizu', '410200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('410204', '鼓楼', '鼓楼', 'glou', '410200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('410205', '禹王台', '禹王台', 'yuwangtai', '410200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('410221', '杞县', '杞县', 'qxian', '410200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('410222', '通许', '通许', 'tongxu', '410200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('410223', '尉氏', '尉氏', 'weishi', '410200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('410224', '祥符', '祥符', 'xiangfu', '410200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('410225', '兰考', '兰考', 'lankao', '410200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('410300', '洛阳', '洛阳', 'luoyang', '410000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('410302', '老城', '老城', 'laocheng', '410300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('410303', '西工', '西工', 'xigong', '410300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('410304', '瀍河回族', '瀍河回族', 'hehuizu', '410300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('410305', '涧西', '涧西', 'jianxi', '410300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('410306', '吉利', '吉利', 'jili', '410300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('410307', '洛龙', '洛龙', 'llong', '410300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('410322', '孟津', '孟津', 'mengjin', '410300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('410323', '新安', '新安', 'xinan', '410300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('410324', '栾川', '栾川', 'luanchuan', '410300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('410325', '嵩县', '嵩县', 'songxian', '410300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('410326', '汝阳', '汝阳', 'ruyang', '410300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('410327', '宜阳', '宜阳', 'yy', '410300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('410328', '洛宁', '洛宁', 'luoning', '410300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('410329', '伊川', '伊川', 'ychun', '410300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('410381', '偃师', '偃师', 'shi', '410300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('410400', '平顶山', '平顶山', 'pingdingshan', '410000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('410402', '新华', '新华', 'hua', '410400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('410403', '卫东', '卫东', 'weidong', '410400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('410404', '石龙', '石龙', 'shilong', '410400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('410411', '湛河', '湛河', 'zhanhe', '410400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('410421', '宝丰', '宝丰', 'baofeng', '410400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('410422', '叶县', '叶县', 'yexian', '410400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('410423', '鲁山', '鲁山', 'lush', '410400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('410425', '郏县', '郏县', 'jia', '410400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('410481', '舞钢', '舞钢', 'wg', '410400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('410482', '汝州', '汝州', 'ruzhou', '410400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('410500', '安阳', '安阳', 'anyang', '410000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('410502', '文峰', '文峰', 'wenfeng', '410500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('410503', '北关', '北关', 'beiguan', '410500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('410505', '殷都', '殷都', 'yindu', '410500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('410506', '龙安', '龙安', 'an', '410500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('410523', '汤阴', '汤阴', 'tangyin', '410500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('410526', '滑县', '滑县', 'huaxian', '410500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('410527', '内黄', '内黄', 'nahuang', '410500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('410581', '林州', '林州', 'lz', '410500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('410600', '鹤壁', '鹤壁', 'hebi', '410000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('410602', '鹤山', '鹤山', 'hshan', '410600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('410603', '山城', '山城', 'shancheng', '410600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('410611', '淇滨', '淇滨', 'qibin', '410600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('410621', '浚县', '浚县', 'junxian', '410600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('410622', '淇县', '淇县', 'qixian', '410600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('410700', '新乡', '新乡', 'xinxiang', '410000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('410702', '红旗', '红旗', 'hongqi', '410700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('410703', '卫滨', '卫滨', 'wb', '410700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('410704', '凤泉', '凤泉', 'fengquan', '410700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('410711', '牧野', '牧野', 'muye', '410700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('410724', '获嘉', '获嘉', 'huojia', '410700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('410725', '原阳', '原阳', 'yuany', '410700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('410726', '延津', '延津', 'yj', '410700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('410727', '封丘', '封丘', 'fengqiu', '410700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('410728', '长垣', '长垣', 'changyuan', '410700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('410781', '卫辉', '卫辉', 'weihui', '410700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('410782', '辉县', '辉县', 'hx', '410700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('410800', '焦作', '焦作', 'jiaozuo', '410000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('410802', '解放', '解放', 'jiefang', '410800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('410803', '中站', '中站', 'zhongzhan', '410800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('410804', '马村', '马村', 'macun', '410800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('410811', '山阳', '山阳', 'shanyang', '410800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('410821', '修武', '修武', 'xiuwu', '410800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('410822', '博爱', '博爱', 'boai', '410800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('410823', '武陟', '武陟', 'wuzhi', '410800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('410825', '温县', '温县', 'wxian', '410800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('410881', '济源', '济源', 'jiyuan', '410000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('410882', '沁阳', '沁阳', 'qinyang', '410800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('410883', '孟州', '孟州', 'mengzhou', '410800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('410900', '濮阳', '濮阳', 'puyang', '410000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('410902', '华龙', '华龙', 'hlong', '410900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('410922', '清丰', '清丰', 'qingfeng', '410900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('410923', '南乐', '南乐', 'nanle', '410900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('410926', '范县', '范县', 'fanxian', '410900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('410927', '台前', '台前', 'taiqian', '410900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('411000', '许昌', '许昌', 'xuchang', '410000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('411002', '魏都', '魏都', 'weidu', '411000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('411024', '鄢陵', '鄢陵', 'yl', '411000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('411025', '襄城', '襄城', 'xiangch', '411000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('411081', '禹州', '禹州', 'yu', '411000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('411082', '长葛', '长葛', 'changge', '411000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('411100', '漯河', '漯河', 'leihe', '410000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('411102', '源汇', '源汇', 'yuanhui', '411100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('411103', '郾城', '郾城', 'yancheng', '411100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('411104', '召陵', '召陵', 'zhaoling', '411100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('411121', '舞阳', '舞阳', 'wuyang', '411100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('411122', '临颍', '临颍', 'linying', '411100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('411200', '三门峡', '三门峡', 'sanmenxia', '410000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('411202', '湖滨', '湖滨', 'hubin', '411200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('411221', '渑池', '渑池', 'shengchi', '411200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('411222', '陕州', '陕州', 'shanzhou', '411200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('411224', '卢氏', '卢氏', 'lushi', '411200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('411281', '义马', '义马', 'yima', '411200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('411282', '灵宝', '灵宝', 'lingbao', '411200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('411300', '南阳', '南阳', 'nanyang', '410000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('411302', '宛城', '宛城', 'wancheng', '411300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('411303', '卧龙', '卧龙', 'wolong', '411300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('411321', '南召', '南召', 'nanzhao', '411300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('411322', '方城', '方城', 'fang', '411300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('411323', '西峡', '西峡', 'xxia', '411300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('411324', '镇平', '镇平', 'zp', '411300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('411325', '内乡', '内乡', 'naxiang', '411300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('411326', '淅川', '淅川', 'xichuan', '411300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('411327', '社旗县', '社旗县', 'sheqixian', '411300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('411328', '唐河', '唐河', 'tanghe', '411300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('411329', '新野', '新野', 'xinye', '411300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('411330', '桐柏', '桐柏', 'tongbai', '411300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('411381', '邓州', '邓州', 'dengzhou', '411300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('411400', '商丘', '商丘', 'shangqiu', '410000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('411402', '梁园', '梁园', 'liangyuan', '411400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('411403', '睢阳', '睢阳', 'syang', '411400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('411421', '民权', '民权', 'minquan', '411400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('411422', '睢县', '睢县', 'suix', '411400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('411423', '宁陵', '宁陵', 'ningling', '411400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('411424', '柘城', '柘城', 'zhecheng', '411400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('411425', '虞城', '虞城', 'yucheng2', '411400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('411426', '夏邑', '夏邑', 'xiayi', '411400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('411481', '永城', '永城', 'yongcheng', '411400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('411500', '信阳', '信阳', 'xinyang', '410000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('411502', '浉河', '浉河', 'he', '411500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('411503', '平桥', '平桥', 'pingqiao', '411500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('411521', '罗山', '罗山', 'luoshan', '411500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('411522', '光山', '光山', 'guangshan', '411500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('411523', '新县', '新县', 'xinxian', '411500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('411524', '商城', '商城', 'shangcheng', '411500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('411525', '固始', '固始', 'gushi', '411500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('411526', '潢川', '潢川', 'huangchuan', '411500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('411527', '淮滨', '淮滨', 'huaibin', '411500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('411528', '息县', '息县', 'xixian', '411500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('411600', '周口', '周口', 'zhoukou', '410000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('411602', '川汇', '川汇', 'chuanhui', '411600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('411621', '扶沟', '扶沟', 'fugou', '411600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('411622', '西华', '西华', 'xihua', '411600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('411623', '商水', '商水', 'shangshui', '411600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('411624', '沈丘', '沈丘', 'shenqiu', '411600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('411625', '郸城', '郸城', 'dancheng', '411600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('411626', '淮阳', '淮阳', 'huaiyang', '411600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('411627', '太康', '太康', 'taikang', '411600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('411628', '鹿邑', '鹿邑', 'luyi', '411600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('411681', '项城', '项城', 'xiangc', '411600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('411700', '驻马店', '驻马店', 'zhumadian', '410000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('411702', '驿城', '驿城', 'yic', '411700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('411721', '西平', '西平', 'xiping', '411700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('411722', '上蔡', '上蔡', 'shangcai', '411700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('411723', '平舆', '平舆', 'pingyu', '411700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('411724', '正阳', '正阳', 'zhengyang', '411700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('411725', '确山', '确山', 'queshan', '411700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('411726', '泌阳', '泌阳', 'miyang', '411700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('411727', '汝南', '汝南', 'runan', '411700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('411728', '遂平', '遂平', 'suiping', '411700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('411729', '新蔡', '新蔡', 'xincai', '411700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('420100', '武汉', '武汉', 'wuhan', '420000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('420102', '江岸', '江岸', 'jiang', '420100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('420103', '江汉', '江汉', 'jianghan', '420100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('420104', '硚口', '硚口', 'kou', '420100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('420105', '汉阳', '汉阳', 'hanyang', '420100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('420106', '武昌', '武昌', 'wuchang', '420100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('420107', '青山', '青山', 'qshan', '420100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('420111', '洪山', '洪山', 'hongshan', '420100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('420112', '东西湖', '东西湖', 'dongxihu', '420100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('420113', '汉南', '汉南', 'hannan', '420100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('420114', '蔡甸', '蔡甸', 'caidian', '420100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('420115', '江夏', '江夏', 'jiangxia', '420100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('420116', '黄陂', '黄陂', 'huangbei', '420100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('420117', '新洲', '新洲', 'xinzhou', '420100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('420200', '黄石', '黄石', 'huangshi', '420000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('420202', '黄石港', '黄石港', 'huangshigang', '420200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('420203', '西塞山', '西塞山', 'xisaishan', '420200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('420204', '下陆', '下陆', 'xialu', '420200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('420205', '铁山', '铁山', 'tieshan', '420200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('420222', '阳新', '阳新', 'yangxin', '420200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('420281', '大冶', '大冶', 'daye', '420200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('420300', '十堰', '十堰', 'shiyan', '420000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('420302', '茅箭', '茅箭', 'maojian', '420300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('420303', '张湾', '张湾', 'zhangwan', '420300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('420321', '郧阳', '郧阳', 'yuny', '420300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('420322', '郧西', '郧西', 'yxi', '420300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('420323', '竹山', '竹山', 'zhushan', '420300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('420324', '竹溪', '竹溪', 'zhuxi', '420300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('420325', '房县', '房县', 'fangxian', '420300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('420381', '丹江口', '丹江口', 'danjiangkou', '420300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('420500', '宜昌', '宜昌', 'yichang', '420000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('420502', '西陵', '西陵', 'xiling', '420500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('420503', '伍家岗', '伍家岗', 'wujiagang', '420500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('420504', '点军', '点军', 'dianjun', '420500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('420505', '猇亭', '猇亭', 'ting', '420500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('420506', '夷陵', '夷陵', 'yiling', '420500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('420525', '远安', '远安', 'yuanan', '420500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('420526', '兴山', '兴山', 'xingsh', '420500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('420527', '秭归', '秭归', 'zigui', '420500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('420528', '长阳', '长阳', 'changyang', '420500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('420529', '五峰', '五峰', 'wufeng', '420500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('420581', '宜都', '宜都', 'yidu', '420500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('420582', '当阳', '当阳', 'dangyang', '420500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('420583', '枝江', '枝江', 'zj', '420500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('420600', '襄阳', '襄阳', 'xyang', '420000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('420602', '襄城', '襄城', 'xch', '420600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('420606', '樊城', '樊城', 'fancheng', '420600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('420607', '襄州', '襄州', 'xiangzh', '420600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('420624', '南漳', '南漳', 'nanzhang', '420600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('420625', '谷城', '谷城', 'gcheng', '420600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('420626', '保康', '保康', 'baokang', '420600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('420682', '老河口', '老河口', 'laohekou', '420600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('420683', '枣阳', '枣阳', 'zaoyang', '420600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('420684', '宜城', '宜城', 'yicheng', '420600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('420700', '鄂州', '鄂州', 'ezhou', '420000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('420702', '梁子湖', '梁子湖', 'liangzihu', '420700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('420703', '华容', '华容', 'huarong', '420700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('420704', '鄂城', '鄂城', 'echeng', '420700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('420800', '荆门', '荆门', 'jingmen', '420000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('420802', '东宝', '东宝', 'dongbao', '420800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('420804', '掇刀', '掇刀', 'duodao', '420800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('420821', '京山', '京山', 'jingshan', '420800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('420822', '沙洋', '沙洋', 'shayang', '420800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('420881', '钟祥', '钟祥', 'zhongxiang', '420800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('420900', '孝感', '孝感', 'xiaogan', '420000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('420902', '孝南', '孝南', 'xiaonan', '420900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('420921', '孝昌', '孝昌', 'xiaochang', '420900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('420922', '大悟', '大悟', 'dawu', '420900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('420923', '云梦', '云梦', 'yunmeng', '420900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('420981', '应城', '应城', 'yingcheng', '420900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('420982', '安陆', '安陆', 'anlu', '420900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('420984', '汉川', '汉川', 'hanchuan', '420900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('421000', '荆州', '荆州', 'jzhou', '420000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('421002', '沙市', '沙市', 'shashi', '421000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('421022', '公安', '公安', 'gongan', '421000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('421023', '监利', '监利', 'jianli', '421000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('421024', '江陵', '江陵', 'jiangling', '421000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('421081', '石首', '石首', 'shishou', '421000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('421083', '洪湖', '洪湖', 'honghu', '421000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('421087', '松滋', '松滋', 'songzi', '421000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('421100', '黄冈', '黄冈', 'huanggang', '420000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('421102', '黄州', '黄州', 'huangzhou', '421100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('421121', '团风', '团风', 'tuanfeng', '421100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('421122', '红安', '红安', 'hongan', '421100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('421123', '罗田', '罗田', 'luotian', '421100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('421124', '英山', '英山', 'yinsh', '421100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('421125', '浠水', '浠水', 'xshui', '421100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('421126', '蕲春', '蕲春', 'qinchun', '421100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('421127', '黄梅', '黄梅', 'huangmei', '421100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('421181', '麻城', '麻城', 'macheng', '421100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('421182', '武穴', '武穴', 'wuxue', '421100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('421200', '咸宁', '咸宁', 'xianning', '420000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('421202', '咸安', '咸安', 'xianan', '421200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('421221', '嘉鱼', '嘉鱼', 'jiayu', '421200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('421222', '通城', '通城', 'tongcheng', '421200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('421223', '崇阳', '崇阳', 'chongyang', '421200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('421224', '通山', '通山', 'tongshan', '421200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('421281', '赤壁', '赤壁', 'chibi', '421200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('421300', '随州', '随州', 'suizhou', '420000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('421302', '曾都', '曾都', 'zengdu', '421300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('421321', '随县', '随县', 'suixian', '421300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('421381', '广水', '广水', 'guangshui', '421300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('422800', '恩施', '恩施', 'enshi', '420000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('422802', '利川', '利川', 'lichuan', '422800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('422822', '建始', '建始', 'jianshi', '422800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('422823', '巴东', '巴东', 'badong', '422800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('422825', '宣恩', '宣恩', 'xuanen', '422800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('422826', '咸丰', '咸丰', 'xianfeng', '422800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('422827', '来凤', '来凤', 'laifeng', '422800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('422828', '鹤峰', '鹤峰', 'hefeng', '422800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('429004', '仙桃', '仙桃', 'xiantao', '420000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('429005', '潜江', '潜江', 'qjiang', '420000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('429006', '天门', '天门', 'tian', '420000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('429021', '神农架', '神农架', 'shennongjia', '420000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('430100', '长沙', '长沙', 'changsha', '430000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('430102', '芙蓉', '芙蓉', 'furong', '430100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('430103', '天心', '天心', 'tianxin', '430100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('430104', '岳麓', '岳麓', 'yuelu', '430100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('430105', '开福', '开福', 'kaifu', '430100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('430111', '雨花', '雨花', 'yuhua', '430100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('430122', '望城', '望城', 'wangcheng', '430100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('430124', '宁乡', '宁乡', 'ningxiang', '430100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('430181', '浏阳', '浏阳', 'liuyang', '430100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('430200', '株洲', '株洲', 'zhuzhou', '430000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('430202', '荷塘', '荷塘', 'hetang', '430200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('430203', '芦淞', '芦淞', 'lusong', '430200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('430204', '石峰', '石峰', 'shifeng', '430200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('430211', '天元', '天元', 'tianyuan', '430200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('430223', '攸县', '攸县', 'you', '430200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('430224', '茶陵', '茶陵', 'chaling', '430200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('430225', '炎陵', '炎陵', 'yanling', '430200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('430281', '醴陵', '醴陵', 'liling', '430200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('430300', '湘潭', '湘潭', 'xiangtan', '430000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('430302', '雨湖', '雨湖', 'yuhu', '430300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('430304', '岳塘', '岳塘', 'yuetang', '430300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('430381', '湘乡', '湘乡', 'xiangxiang', '430300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('430382', '韶山', '韶山', 'shaoshan', '430300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('430400', '衡阳', '衡阳', 'hengyang', '430000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('430405', '珠晖', '珠晖', 'zhuhui', '430400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('430406', '雁峰', '雁峰', 'yanfeng', '430400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('430407', '石鼓', '石鼓', 'shigu', '430400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('430408', '蒸湘', '蒸湘', 'zhengxiang', '430400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('430412', '南岳', '南岳', 'nanyue', '430400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('430422', '衡南', '衡南', 'hengnan', '430400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('430423', '衡山', '衡山', 'hangsh', '430400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('430424', '衡东', '衡东', 'hengdong', '430400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('430426', '祁东', '祁东', 'qidong', '430400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('430481', '耒阳', '耒阳', 'leiyang', '430400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('430482', '常宁', '常宁', 'chang', '430400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('430500', '邵阳', '邵阳', 'shaoyang', '430000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('430502', '双清', '双清', 'shuangqing', '430500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('430503', '大祥', '大祥', 'daxiang', '430500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('430511', '北塔', '北塔', 'beita', '430500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('430521', '邵东', '邵东', 'shaodong', '430500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('430522', '新邵', '新邵', 'xinshao', '430500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('430524', '隆回', '隆回', 'longhui', '430500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('430525', '洞口', '洞口', 'dongkou', '430500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('430527', '绥宁', '绥宁', 'sning', '430500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('430528', '新宁', '新宁', 'xinning', '430500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('430529', '城步', '城步', 'chengbu', '430500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('430581', '武冈', '武冈', 'wugang', '430500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('430600', '岳阳', '岳阳', 'yueyang', '430000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('430602', '岳阳楼', '岳阳楼', 'yueyanglou', '430600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('430603', '云溪', '云溪', 'yunxi', '430600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('430611', '君山', '君山', 'junshan', '430600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('430623', '华容', '华容', 'hr', '430600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('430624', '湘阴', '湘阴', 'xiangyin', '430600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('430626', '平江', '平江', 'pingjiang', '430600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('430681', '汨罗', '汨罗', 'miluo', '430600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('430682', '临湘', '临湘', 'lxiang', '430600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('430700', '常德', '常德', 'changde', '430000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('430702', '武陵', '武陵', 'wuling', '430700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('430703', '鼎城', '鼎城', 'dingcheng', '430700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('430721', '安乡', '安乡', 'anxiang', '430700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('430722', '汉寿', '汉寿', 'hanshou', '430700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('430723', '澧县', '澧县', 'lix', '430700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('430724', '临澧', '临澧', 'linli', '430700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('430725', '桃源', '桃源', 'taoyuan', '430700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('430726', '石门', '石门', 'shimen', '430700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('430781', '津市', '津市', 'jinshi', '430700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('430800', '张家界', '张家界', 'zhangjiajie', '430000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('430802', '永定', '永定', 'yd', '430800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('430811', '武陵源', '武陵源', 'wulingyuan', '430800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('430821', '慈利', '慈利', 'cili', '430800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('430822', '桑植', '桑植', 'sangzhi', '430800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('430900', '益阳', '益阳', 'yiyang', '430000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('430902', '资阳', '资阳', 'zyang', '430900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('430903', '赫山', '赫山', 'hesh', '430900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('430921', '南县', '南县', 'nanxian', '430900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('430922', '桃江', '桃江', 'taojiang', '430900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('430923', '安化', '安化', 'anhua', '430900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('430981', '沅江', '沅江', 'yjiang', '430900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('431000', '郴州', '郴州', 'chenzhou', '430000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('431002', '北湖', '北湖', 'beihu', '431000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('431003', '苏仙', '苏仙', 'suxian', '431000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('431021', '桂阳', '桂阳', 'gyang', '431000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('431022', '宜章', '宜章', 'yizhang', '431000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('431023', '永兴', '永兴', 'yongxing', '431000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('431024', '嘉禾', '嘉禾', 'jiahe', '431000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('431025', '临武', '临武', 'linwu', '431000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('431026', '汝城', '汝城', 'rucheng', '431000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('431027', '桂东', '桂东', 'guidong', '431000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('431028', '安仁', '安仁', 'anren', '431000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('431081', '资兴', '资兴', 'zixing', '431000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('431100', '永州', '永州', 'yongzhou', '430000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('431102', '零陵', '零陵', 'lingling', '431100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('431103', '冷水滩', '冷水滩', 'lingshuitan', '431100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('431121', '祁阳', '祁阳', 'qiyang', '431100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('431122', '东安', '东安', 'dong', '431100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('431123', '双牌', '双牌', 'shuangpai', '431100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('431124', '道县', '道县', 'daoxian', '431100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('431125', '江永', '江永', 'jiangyong', '431100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('431126', '宁远', '宁远', 'ningyuan', '431100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('431127', '蓝山', '蓝山', 'lanshan', '431100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('431128', '新田', '新田', 'xintian', '431100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('431129', '江华', '江华', 'jianghua', '431100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('431200', '怀化', '怀化', 'huaihua', '430000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('431202', '鹤城', '鹤城', 'hecheng', '431200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('431221', '中方', '中方', 'zhongfang', '431200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('431222', '沅陵', '沅陵', 'yuanling', '431200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('431223', '辰溪', '辰溪', 'chenxi', '431200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('431224', '溆浦', '溆浦', 'xupu', '431200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('431225', '会同', '会同', 'huitong', '431200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('431226', '麻阳', '麻阳', 'mayang', '431200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('431227', '新晃', '新晃', 'xinhuang', '431200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('431228', '芷江', '芷江', 'zhijiang', '431200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('431229', '靖州', '靖州', 'jingzhou', '431200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('431230', '通道', '通道', 'tongdao', '431200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('431281', '洪江', '洪江', 'hongjiang', '431200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('431300', '娄底', '娄底', 'loudi', '430000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('431302', '娄星', '娄星', 'louxing', '431300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('431321', '双峰', '双峰', 'shuangfeng', '431300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('431322', '新化', '新化', 'xinh', '431300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('431381', '冷水江', '冷水江', 'lingshuijiang', '431300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('431382', '涟源', '涟源', 'lianyuan', '431300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('433100', '湘西', '湘西', 'xiangxi', '430000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('433101', '吉首', '吉首', 'jishou', '433100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('433122', '泸溪', '泸溪', 'lux', '433100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('433123', '凤凰', '凤凰', 'fenghuang', '433100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('433124', '花垣', '花垣', 'huayuan', '433100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('433125', '保靖', '保靖', 'baojing', '433100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('433126', '古丈', '古丈', 'guzhang', '433100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('433127', '永顺', '永顺', 'yongshun', '433100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('433130', '龙山', '龙山', 'longsh', '433100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('440100', '广州', '广州', 'guangzhou', '440000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('440103', '荔湾', '荔湾', 'liwan', '440100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('440104', '越秀', '越秀', 'yuexiu', '440100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('440105', '海珠', '海珠', 'haizhu', '440100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('440106', '天河', '天河', 'tianhe', '440100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('440111', '白云', '白云', 'baiyun', '440100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('440112', '黄埔', '黄埔', 'huangpu', '440100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('440113', '番禺', '番禺', 'fanyu', '440100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('440114', '花都', '花都', 'huadu', '440100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('440115', '南沙', '南沙', 'sha', '440100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('440183', '增城', '增城', 'zengcheng', '440100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('440184', '从化', '从化', 'conghua', '440100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('440200', '韶关', '韶关', 'shaoguan', '440000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('440203', '武江', '武江', 'wujiang', '440200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('440204', '浈江', '浈江', 'chjiang', '440200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('440205', '曲江', '曲江', 'qujiang', '440200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('440222', '始兴', '始兴', 'shixing', '440200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('440224', '仁化', '仁化', 'renhua', '440200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('440229', '翁源', '翁源', 'wengyuan', '440200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('440232', '乳源', '乳源', 'ruyuan', '440200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('440233', '新丰', '新丰', 'xinfeng', '440200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('440281', '乐昌', '乐昌', 'lechang', '440200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('440282', '南雄', '南雄', 'nanxiong', '440200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('440300', '深圳', '深圳', 'shenzheng', '440000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('440303', '罗湖', '罗湖', 'luohu', '440300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('440304', '福田', '福田', 'futian', '440300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('440305', '南山', '南山', 'nshan', '440300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('440306', '宝安', '宝安', 'baoan', '440300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('440307', '龙岗', '龙岗', 'longgang', '440300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('440308', '盐田', '盐田', 'yantian', '440300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('440400', '珠海', '珠海', 'zhuhai', '440000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('440402', '香洲', '香洲', 'xiangz', '440400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('440403', '斗门', '斗门', 'doumen', '440400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('440404', '金湾', '金湾', 'jinwan', '440400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('440500', '汕头', '汕头', 'shantou', '440000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('440507', '龙湖', '龙湖', 'longhu', '440500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('440511', '金平', '金平', 'jp', '440500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('440512', '濠江', '濠江', 'haojiang', '440500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('440513', '潮阳', '潮阳', 'chaoyang', '440500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('440514', '潮南', '潮南', 'chaonan', '440500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('440515', '澄海', '澄海', 'chenghai', '440500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('440523', '南澳', '南澳', 'nanao', '440500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('440600', '佛山', '佛山', 'fushan', '440000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('440604', '禅城', '禅城', 'chancheng', '440600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('440605', '南海', '南海', 'nanhai', '440600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('440606', '顺德', '顺德', 'shunde', '440600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('440607', '三水', '三水', 'sanshui', '440600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('440608', '高明', '高明', 'gaoming', '440600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('440700', '江门', '江门', 'jiangmen', '440000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('440703', '蓬江', '蓬江', 'pengjiang', '440700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('440704', '江海', '江海', 'jianghai', '440700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('440705', '新会', '新会', 'xinhui', '440700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('440781', '台山', '台山', 'taishan', '440700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('440783', '开平', '开平', 'kp', '440700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('440784', '鹤山', '鹤山', 'heshan1', '440700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('440785', '恩平', '恩平', 'enping', '440700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('440800', '湛江', '湛江', 'zhanjiang', '440000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('440802', '赤坎', '赤坎', 'chikan', '440800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('440803', '霞山', '霞山', 'xiashan', '440800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('440804', '坡头', '坡头', 'potou', '440800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('440811', '麻章', '麻章', 'mazhang', '440800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('440823', '遂溪', '遂溪', 'suixi', '440800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('440825', '徐闻', '徐闻', 'xuwen', '440800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('440881', '廉江', '廉江', 'lianjiang', '440800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('440882', '雷州', '雷州', 'leizhou', '440800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('440883', '吴川', '吴川', 'wchuan', '440800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('440900', '茂名', '茂名', 'maoming', '440000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('440902', '茂南', '茂南', 'maonan', '440900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('440903', '电白', '电白', 'dianbai', '440900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('440981', '高州', '高州', 'gaozhou', '440900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('440982', '化州', '化州', 'huazh', '440900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('440983', '信宜', '信宜', 'xinyi', '440900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('441200', '肇庆', '肇庆', 'zhaoqing', '440000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('441202', '端州', '端州', 'duanzhou', '441200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('441203', '鼎湖', '鼎湖', 'dinghu', '441200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('441223', '广宁', '广宁', 'guangning', '441200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('441224', '怀集', '怀集', 'huaiji', '441200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('441225', '封开', '封开', 'fengkai', '441200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('441226', '德庆', '德庆', 'deqing', '441200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('441283', '高要', '高要', 'gaoyao', '441200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('441284', '四会', '四会', 'sihui', '441200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('441300', '惠州', '惠州', 'huizhou', '440000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('441302', '惠城', '惠城', 'huicheng', '441300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('441303', '惠阳', '惠阳', 'huiyang', '441300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('441322', '博罗', '博罗', 'boluo', '441300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('441323', '惠东', '惠东', 'hd', '441300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('441324', '龙门', '龙门', 'longmen', '441300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('441400', '梅州', '梅州', 'meizhou', '440000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('441402', '梅江', '梅江', 'meijiang', '441400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('441421', '梅县', '梅县', 'mx', '441400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('441422', '大埔', '大埔', 'dapu', '441400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('441423', '丰顺', '丰顺', 'fengshun', '441400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('441424', '五华', '五华', 'whua', '441400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('441426', '平远', '平远', 'pingyuan', '441400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('441427', '蕉岭', '蕉岭', 'jiaoling', '441400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('441481', '兴宁', '兴宁', 'xn', '441400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('441500', '汕尾', '汕尾', 'shanwei', '440000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('441502', '城区', '城区', 'cqu', '441500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('441521', '海丰', '海丰', 'haifeng', '441500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('441523', '陆河', '陆河', 'luhe', '441500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('441581', '陆丰', '陆丰', 'lfeng', '441500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('441600', '河源', '河源', 'heyuan', '440000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('441602', '源城', '源城', 'yuancheng', '441600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('441621', '紫金', '紫金', 'zijin', '441600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('441622', '龙川', '龙川', 'lchuan', '441600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('441623', '连平', '连平', 'lianping', '441600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('441624', '和平', '和平', 'ping', '441600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('441625', '东源', '东源', 'dongyuan', '441600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('441700', '阳江', '阳江', 'yangjiang', '440000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('441702', '江城', '江城', 'jcheng', '441700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('441721', '阳西', '阳西', 'yangxi', '441700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('441723', '阳东', '阳东', 'yangdong', '441700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('441781', '阳春', '阳春', 'yangchun', '441700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('441800', '清远', '清远', 'qingyuan', '440000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('441802', '清城', '清城', 'qcheng', '441800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('441821', '佛冈', '佛冈', 'fugang', '441800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('441823', '阳山', '阳山', 'yangshan', '441800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('441825', '连山', '连山', 'lian', '441800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('441826', '连南', '连南', 'liannan', '441800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('441827', '清新', '清新', 'qingxin', '441800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('441881', '英德', '英德', 'yingde', '441800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('441882', '连州', '连州', 'lianzhou', '441800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('441900', '东莞', '东莞', 'dongguan', '440000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('442000', '中山', '中山', 'zhshan', '440000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('445100', '潮州', '潮州', 'chaozhou', '440000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('445102', '湘桥', '湘桥', 'xiangqiao', '445100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('445121', '潮安', '潮安', 'chaoan', '445100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('445122', '饶平', '饶平', 'raoping', '445100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('445200', '揭阳', '揭阳', 'jieyang', '440000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('445202', '榕城', '榕城', 'rong', '445200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('445221', '揭东', '揭东', 'jiedong', '445200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('445222', '揭西', '揭西', 'jiexi', '445200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('445224', '惠来', '惠来', 'huilai', '445200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('445281', '普宁', '普宁', 'puning', '445200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('445300', '云浮', '云浮', 'yunfu', '440000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('445302', '云城', '云城', 'yuncheng', '445300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('445321', '新兴', '新兴', 'xxing', '445300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('445322', '郁南', '郁南', 'yn', '445300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('445323', '云安', '云安', 'yunan', '445300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('445381', '罗定', '罗定', 'luoding', '445300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('450100', '南宁', '南宁', 'nanning', '450000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('450102', '兴宁', '兴宁', 'xingning1', '450100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('450103', '青秀', '青秀', 'qingxiu', '450100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('450105', '江南', '江南', 'jiangnan', '450100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('450107', '西乡塘', '西乡塘', 'xixiangtang', '450100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('450108', '良庆', '良庆', 'liangqing', '450100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('450109', '邕宁', '邕宁', 'yong', '450100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('450122', '武鸣', '武鸣', 'wuming', '450100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('450123', '隆安', '隆安', 'longan', '450100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('450124', '马山', '马山', 'mashan', '450100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('450125', '上林', '上林', 'shanglin', '450100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('450126', '宾阳', '宾阳', 'binyang', '450100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('450127', '横县', '横县', 'hengxian', '450100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('450200', '柳州', '柳州', 'liuzhou', '450000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('450202', '城中', '城中', 'chengzhong', '450200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('450203', '鱼峰', '鱼峰', 'yufeng', '450200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('450204', '柳南', '柳南', 'liunan', '450200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('450205', '柳北', '柳北', 'liubei', '450200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('450221', '柳江', '柳江', 'liujiang', '450200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('450222', '柳城', '柳城', 'liucheng', '450200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('450223', '鹿寨', '鹿寨', 'luzhai', '450200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('450224', '融安', '融安', 'rongan', '450200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('450225', '融水', '融水', 'rongshui', '450200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('450226', '三江', '三江', 'sanjiang', '450200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('450300', '桂林', '桂林', 'guilin', '450000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('450302', '秀峰', '秀峰', 'xiufeng', '450300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('450303', '叠彩', '叠彩', 'diecai', '450300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('450304', '象山', '象山', 'xiangsh', '450300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('450305', '七星', '七星', 'qixing', '450300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('450311', '雁山', '雁山', 'yshan', '450300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('450321', '阳朔', '阳朔', 'yangshuo', '450300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('450322', '临桂', '临桂', 'lingui', '450300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('450323', '灵川', '灵川', 'lingchuan', '450300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('450324', '全州', '全州', 'quanzhou', '450300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('450325', '兴安', '兴安', 'xing', '450300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('450326', '永福', '永福', 'yongfu', '450300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('450327', '灌阳', '灌阳', 'guanyang', '450300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('450328', '龙胜', '龙胜', 'longsheng', '450300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('450329', '资源', '资源', 'ziyuan', '450300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('450330', '平乐', '平乐', 'pingle', '450300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('450331', '荔浦', '荔浦', 'lipu', '450300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('450332', '恭城', '恭城', 'gongcheng', '450300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('450400', '梧州', '梧州', 'wuzhou', '450000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('450403', '万秀', '万秀', 'wanxiu', '450400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('450405', '长洲', '长洲', 'changzhou', '450400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('450406', '龙圩', '龙圩', 'longxu', '450400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('450421', '苍梧', '苍梧', 'cangwu', '450400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('450422', '藤县', '藤县', 'tengxian', '450400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('450423', '蒙山', '蒙山', 'mengshan', '450400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('450481', '岑溪', '岑溪', 'cenxi', '450400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('450500', '北海', '北海', 'beihai', '450000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('450502', '海城', '海城', 'haicheng1', '450500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('450503', '银海', '银海', 'yinhai', '450500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('450512', '铁山港', '铁山港', 'tieshangang', '450500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('450521', '合浦', '合浦', 'hepu', '450500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('450600', '防城港', '防城港', 'fangchenggang', '450000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('450602', '港口', '港口', 'gangkou', '450600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('450603', '防城', '防城', 'fangcheng', '450600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('450621', '上思', '上思', 'shangsi', '450600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('450681', '东兴', '东兴', 'dxing', '450600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('450700', '钦州', '钦州', 'qin', '450000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('450702', '钦南', '钦南', 'qinnan', '450700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('450703', '钦北', '钦北', 'qinbei', '450700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('450721', '灵山', '灵山', 'lingshan', '450700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('450722', '浦北', '浦北', 'pubei', '450700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('450800', '贵港', '贵港', 'guigang', '450000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('450802', '港北', '港北', 'gangbei', '450800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('450803', '港南', '港南', 'gangnan', '450800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('450804', '覃塘', '覃塘', 'tantang', '450800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('450821', '平南', '平南', 'pingnan', '450800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('450881', '桂平', '桂平', 'guiping', '450800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('450900', '玉林', '玉林', 'ylin', '450000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('450902', '玉州', '玉州', 'yuzhou', '450900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('450903', '福绵', '福绵', 'fumian', '450900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('450921', '容县', '容县', 'rxian', '450900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('450922', '陆川', '陆川', 'luchuan', '450900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('450923', '博白', '博白', 'bobai', '450900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('450924', '兴业', '兴业', 'xingye', '450900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('450981', '北流', '北流', 'beiliu', '450900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('451000', '百色', '百色', 'baise', '450000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('451002', '右江', '右江', 'youjiang', '451000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('451021', '田阳', '田阳', 'tianyang', '451000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('451022', '田东', '田东', 'tiandong', '451000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('451023', '平果', '平果', 'pingguo', '451000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('451024', '德保', '德保', 'debao', '451000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('451025', '靖西', '靖西', 'jingxi', '451000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('451026', '那坡', '那坡', 'napo', '451000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('451027', '凌云', '凌云', 'lingyun', '451000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('451028', '乐业', '乐业', 'leye', '451000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('451029', '田林', '田林', 'tianlin', '451000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('451030', '西林', '西林', 'lin', '451000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('451031', '隆林', '隆林', 'longlin', '451000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('451100', '贺州', '贺州', 'hezhou', '450000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('451102', '八步', '八步', 'babu', '451100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('451103', '平桂', '平桂', 'pinggui', '451100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('451121', '昭平', '昭平', 'zhaoping', '451100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('451122', '钟山', '钟山', 'zhongshan', '451100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('451123', '富川', '富川', 'fuchuan', '451100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('451200', '河池', '河池', 'hechi', '450000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('451202', '金城江', '金城江', 'jinchengjiang', '451200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('451221', '南丹', '南丹', 'nandan', '451200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('451222', '天峨', '天峨', 'tiane', '451200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('451223', '凤山', '凤山', 'fengshan', '451200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('451224', '东兰', '东兰', 'donglan', '451200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('451225', '罗城', '罗城', 'luocheng', '451200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('451226', '环江', '环江', 'huanjiang', '451200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('451227', '巴马', '巴马', 'bama', '451200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('451228', '都安', '都安', 'duan', '451200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('451229', '大化', '大化', 'dahua', '451200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('451281', '宜州', '宜州', 'yizh', '451200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('451300', '来宾', '来宾', 'laibin', '450000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('451302', '兴宾', '兴宾', 'xingbin', '451300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('451321', '忻城', '忻城', 'xinch', '451300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('451322', '象州', '象州', 'xiangzhou', '451300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('451323', '武宣', '武宣', 'wuxuan', '451300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('451324', '金秀', '金秀', 'jinxiu', '451300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('451381', '合山', '合山', 'shan', '451300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('451400', '崇左', '崇左', 'chongzuo', '450000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('451402', '江州', '江州', 'jiangzhou', '451400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('451421', '扶绥', '扶绥', 'fusui', '451400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('451422', '宁明', '宁明', 'ningming', '451400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('451423', '龙州', '龙州', 'longzhou', '451400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('451424', '大新', '大新', 'daxin', '451400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('451425', '天等', '天等', 'tiandeng', '451400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('451481', '凭祥', '凭祥', 'pingxiang', '451400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('460100', '海口', '海口', 'haikou', '460000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('460105', '秀英', '秀英', 'xiuying', '460100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('460106', '龙华', '龙华', 'longhua', '460100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('460107', '琼山', '琼山', 'qiongshan', '460100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('460108', '美兰', '美兰', 'meilan', '460100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('460200', '三亚', '三亚', 'sanya', '460000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('460202', '海棠', '海棠', 'haitang', '460200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('460203', '吉阳', '吉阳', 'jiyang', '460200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('460204', '天涯', '天涯', 'tianya', '460200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('460205', '崖州', '崖州', 'yazhou', '460200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('460300', '三沙', '三沙', 'sansha', '460000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('460321', '西沙', '西沙', 'xisha', '460300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('460322', '南沙', '南沙', 'nansha1', '460300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('460323', '中沙', '中沙', 'zhongsha', '460300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469001', '五指山', '五指山', 'wuzhishan', '460000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469002', '琼海', '琼海', 'qionghai', '460000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469003', '儋州', '儋州', 'danzhou', '460000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469005', '文昌', '文昌', 'wenchang', '460000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469006', '万宁', '万宁', 'wanning', '460000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469007', '东方', '东方', 'dongfang', '460000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469025', '定安', '定安', 'dingan', '460000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469026', '屯昌', '屯昌', 'tunchang', '460000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469027', '澄迈', '澄迈', 'chengmai', '460000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469028', '临高', '临高', 'lingao', '460000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469030', '白沙', '白沙', 'baisha', '460000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469031', '昌江', '昌江', 'cj', '460000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469033', '乐东', '乐东', 'ledong', '460000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469034', '陵水', '陵水', 'lingshui', '460000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469035', '保亭', '保亭', 'baoting', '460000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469036', '琼中', '琼中', 'qiongzhong', '460000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('500101', '万州', '万州', 'wanzhou', '500000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('500102', '涪陵', '涪陵', 'fuling', '500000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('500103', '渝中', '渝中', 'yuzh', '500000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('500104', '大渡口', '大渡口', 'dadukou', '500000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('500105', '江北', '江北', 'jb', '500000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('500106', '沙坪坝', '沙坪坝', 'shapingba', '500000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('500107', '九龙坡', '九龙坡', 'jiulongpo', '500000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('500108', '南岸', '南岸', 'nanan', '500000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('500109', '北碚', '北碚', 'beibei', '500000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('500112', '渝北', '渝北', 'yubei', '500000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('500113', '巴南', '巴南', 'banan', '500000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('500114', '黔江', '黔江', 'qianjiang', '500000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('500115', '长寿', '长寿', 'changshou', '500000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('500222', '綦江', '綦江', 'qijiang', '500000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('500223', '潼南', '潼南', 'tongnan', '500000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('500224', '铜梁', '铜梁', 'tongliang', '500000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('500225', '大足', '大足', 'dazu', '500000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('500226', '荣昌', '荣昌', 'rongchang', '500000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('500227', '璧山', '璧山', 'bishan', '500000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('500228', '梁平', '梁平', 'liangping', '500000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('500229', '城口', '城口', 'chengkou', '500000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('500230', '丰都', '丰都', 'fengdu', '500000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('500231', '垫江', '垫江', 'dianjiang', '500000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('500232', '武隆', '武隆', 'wulong', '500000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('500233', '忠县', '忠县', 'zhongxian', '500000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('500234', '开州', '开州', 'kaizhou', '500000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('500235', '云阳', '云阳', 'yunyang', '500000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('500236', '奉节', '奉节', 'fengjie', '500000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('500237', '巫山', '巫山', 'wush', '500000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('500238', '巫溪', '巫溪', 'wuxi', '500000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('500240', '石柱', '石柱', 'shizhu', '500000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('500241', '秀山', '秀山', 'xiushan', '500000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('500242', '酉阳', '酉阳', 'youyang', '500000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('500243', '彭水', '彭水', 'pengshui', '500000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('500381', '江津', '江津', 'jiangjin', '500000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('500382', '合川', '合川', 'hechuan', '500000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('500383', '永川', '永川', 'yongchuan', '500000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('500384', '南川', '南川', 'nanchuan', '500000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('510100', '成都', '成都', 'chengdu', '510000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('510104', '锦江', '锦江', 'jinjiang', '510100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('510105', '青羊', '青羊', 'qingyang2', '510100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('510106', '金牛', '金牛', 'jinniu', '510100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('510107', '武侯', '武侯', 'wuhou', '510100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('510108', '成华', '成华', 'chenghua', '510100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('510112', '龙泉驿', '龙泉驿', 'longquanyi', '510100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('510113', '青白江', '青白江', 'qingbaijiang', '510100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('510114', '新都', '新都', 'xindu', '510100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('510115', '温江', '温江', 'wenjiang', '510100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('510121', '金堂', '金堂', 'jintang', '510100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('510122', '双流', '双流', 'shuangliu', '510100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('510124', '郫县', '郫县', 'pixian', '510100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('510129', '大邑', '大邑', 'dayi', '510100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('510131', '蒲江', '蒲江', 'pujiang', '510100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('510132', '新津', '新津', 'xinjin', '510100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('510181', '都江堰', '都江堰', 'dujiangyan', '510100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('510182', '彭州', '彭州', 'pengzhou', '510100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('510183', '邛崃', '邛崃', 'qionglai', '510100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('510184', '崇州', '崇州', 'chongzhou', '510100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('510300', '自贡', '自贡', 'zigong', '510000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('510302', '自流井', '自流井', 'ziliujing', '510300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('510303', '贡井', '贡井', 'gongjing', '510300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('510304', '大安', '大安', 'daan1', '510300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('510311', '沿滩', '沿滩', 'yantan', '510300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('510321', '荣县', '荣县', 'rongxian', '510300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('510322', '富顺', '富顺', 'fushun', '510300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('510400', '攀枝花', '攀枝花', 'panzhihua', '510000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('510402', '东区', '东区', 'dongqu', '510400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('510403', '西区', '西区', 'xiqu', '510400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('510411', '仁和', '仁和', 'renhe', '510400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('510421', '米易', '米易', 'miyi', '510400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('510422', '盐边', '盐边', 'yanbian', '510400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('510500', '泸州', '泸州', 'luzhou', '510000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('510502', '江阳', '江阳', 'jiangyang', '510500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('510503', '纳溪', '纳溪', 'naxi', '510500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('510504', '龙马潭', '龙马潭', 'longmatan', '510500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('510521', '泸县', '泸县', 'luxian', '510500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('510522', '合江', '合江', 'hejiang', '510500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('510524', '叙永', '叙永', 'xuyong', '510500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('510525', '古蔺', '古蔺', 'gulin', '510500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('510600', '德阳', '德阳', 'deyang', '510000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('510603', '旌阳', '旌阳', 'jingy', '510600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('510623', '中江', '中江', 'zhongjiang', '510600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('510626', '罗江', '罗江', 'luojiang', '510600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('510681', '广汉', '广汉', 'guanghan', '510600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('510682', '什邡', '什邡', 'shifang', '510600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('510683', '绵竹', '绵竹', 'mianzhu', '510600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('510700', '绵阳', '绵阳', 'mianyang', '510000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('510703', '涪城', '涪城', 'fucheng', '510700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('510704', '游仙', '游仙', 'youxian', '510700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('510722', '三台', '三台', 'santai', '510700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('510723', '盐亭', '盐亭', 'yanting', '510700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('510724', '安州', '安州', 'anzhou', '510700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('510725', '梓潼', '梓潼', 'zitong', '510700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('510726', '北川', '北川', 'beichuan', '510700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('510727', '平武', '平武', 'pingwu', '510700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('510781', '江油', '江油', 'jiangyou', '510700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('510800', '广元', '广元', 'guangyuan', '510000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('510802', '利州', '利州', 'lizhou', '510800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('510811', '昭化', '昭化', 'zhaohua', '510800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('510812', '朝天', '朝天', 'chaotian', '510800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('510821', '旺苍', '旺苍', 'wangcang', '510800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('510822', '青川', '青川', 'qingchuan', '510800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('510823', '剑阁', '剑阁', 'jiange', '510800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('510824', '苍溪', '苍溪', 'cangxi', '510800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('510900', '遂宁', '遂宁', 'suining', '510000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('510903', '船山', '船山', 'chuanshan', '510900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('510904', '安居', '安居', 'ju', '510900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('510921', '蓬溪', '蓬溪', 'pengxi', '510900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('510922', '射洪', '射洪', 'shehong', '510900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('510923', '大英', '大英', 'daying', '510900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('511000', '内江', '内江', 'najiang', '510000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('511002', '市中', '市中', 'shzhong', '511000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('511011', '东兴', '东兴', 'dongxing1', '511000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('511024', '威远', '威远', 'wyuan', '511000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('511025', '资中', '资中', 'zizhong', '511000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('511028', '隆昌', '隆昌', 'longchang', '511000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('511100', '乐山', '乐山', 'leshan', '510000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('511102', '市中', '市中', 'shzh', '511100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('511111', '沙湾', '沙湾', 'shawan', '511100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('511112', '五通桥', '五通桥', 'wutongqiao', '511100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('511113', '金口河', '金口河', 'jinkouhe', '511100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('511123', '犍为', '犍为', 'jianwei', '511100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('511124', '井研', '井研', 'jingyan', '511100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('511126', '夹江', '夹江', 'jiajiang', '511100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('511129', '沐川', '沐川', 'muchuan', '511100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('511132', '峨边', '峨边', 'ebian', '511100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('511133', '马边', '马边', 'mabian', '511100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('511181', '峨眉山', '峨眉山', 'emeishan', '511100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('511300', '南充', '南充', 'nanchong', '510000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('511302', '顺庆', '顺庆', 'shunqing', '511300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('511303', '高坪', '高坪', 'gaoping', '511300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('511304', '嘉陵', '嘉陵', 'jialing', '511300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('511321', '南部', '南部', 'nanbu', '511300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('511322', '营山', '营山', 'yingshan', '511300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('511323', '蓬安', '蓬安', 'pengan', '511300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('511324', '仪陇', '仪陇', 'yilong', '511300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('511325', '西充', '西充', 'xichong', '511300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('511381', '阆中', '阆中', 'langzhong', '511300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('511400', '眉山', '眉山', 'meishan', '510000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('511402', '东坡', '东坡', 'dongpo', '511400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('511421', '仁寿', '仁寿', 'renshou', '511400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('511422', '彭山', '彭山', 'pengshan', '511400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('511423', '洪雅', '洪雅', 'hongya', '511400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('511424', '丹棱', '丹棱', 'danling', '511400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('511425', '青神', '青神', 'qingshen', '511400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('511500', '宜宾', '宜宾', 'yibin', '510000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('511502', '翠屏', '翠屏', 'cuiping', '511500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('511522', '南溪', '南溪', 'nanxi', '511500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('511523', '江安', '江安', 'jiangan', '511500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('511524', '长宁', '长宁', 'chning', '511500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('511525', '高县', '高县', 'gaoxian', '511500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('511526', '珙县', '珙县', 'gongxian', '511500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('511527', '筠连', '筠连', 'junlian', '511500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('511528', '兴文', '兴文', 'xingwen', '511500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('511529', '屏山', '屏山', 'pingshan', '511500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('511600', '广安', '广安', 'guangan', '510000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('511603', '前锋', '前锋', 'qianfeng', '511600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('511621', '岳池', '岳池', 'yuechi', '511600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('511622', '武胜', '武胜', 'wusheng', '511600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('511623', '邻水', '邻水', 'linshui', '511600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('511681', '华蓥', '华蓥', 'ying', '511600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('511700', '达州', '达州', 'dazhou', '510000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('511702', '通川', '通川', 'tchuan', '511700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('511721', '达川', '达川', 'dachuan', '511700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('511722', '宣汉', '宣汉', 'xuanhan', '511700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('511723', '开江', '开江', 'kaijiang', '511700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('511724', '大竹', '大竹', 'dazhu', '511700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('511725', '渠县', '渠县', 'quxian', '511700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('511781', '万源', '万源', 'wanyuan', '511700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('511800', '雅安', '雅安', 'yaan', '510000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('511802', '雨城', '雨城', 'ych', '511800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('511821', '名山', '名山', 'mingshan', '511800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('511822', '荥经', '荥经', 'xingjing', '511800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('511823', '汉源', '汉源', 'hanyuan', '511800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('511824', '石棉', '石棉', 'shimian', '511800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('511825', '天全', '天全', 'tianquan', '511800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('511826', '芦山', '芦山', 'lushan', '511800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('511827', '宝兴', '宝兴', 'baoxing', '511800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('511900', '巴中', '巴中', 'bazhong', '510000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('511902', '巴州', '巴州', 'bazhou', '511900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('511903', '恩阳', '恩阳', 'enyang', '511900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('511921', '通江', '通江', 'tongjiang', '511900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('511922', '南江', '南江', 'nanjiang', '511900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('511923', '平昌', '平昌', 'pingchang', '511900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('512000', '资阳', '资阳', 'zi', '510000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('512002', '雁江', '雁江', 'yanjiang', '512000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('512021', '安岳', '安岳', 'anyue', '512000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('512022', '乐至', '乐至', 'lezhi', '512000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('512081', '简阳', '简阳', 'jianyang', '510100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('513200', '阿坝', '阿坝', 'aba', '510000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('513221', '汶川', '汶川', 'wenchuan', '513200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('513222', '理县', '理县', 'lxian', '513200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('513223', '茂县', '茂县', 'maoxian', '513200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('513224', '松潘', '松潘', 'songpan', '513200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('513225', '九寨沟', '九寨沟', 'jiuzhaigou', '513200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('513226', '金川', '金川', 'jinchuan', '513200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('513227', '小金', '小金', 'xiaojin', '513200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('513228', '黑水', '黑水', 'heishui', '513200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('513229', '马尔康', '马尔康', 'maerkang', '513200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('513230', '壤塘', '壤塘', 'rangtang', '513200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('513232', '若尔盖', '若尔盖', 'ruoergai', '513200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('513233', '红原', '红原', 'hongyuan', '513200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('513300', '甘孜', '甘孜', 'ganzi', '510000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('513321', '康定', '康定', 'kangding', '513300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('513322', '泸定', '泸定', 'luding', '513300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('513323', '丹巴', '丹巴', 'danba', '513300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('513324', '九龙', '九龙', 'jiulong', '513300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('513325', '雅江', '雅江', 'yajiang', '513300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('513326', '道孚', '道孚', 'daofu', '513300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('513327', '炉霍', '炉霍', 'luhuo', '513300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('513329', '新龙', '新龙', 'xinlong', '513300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('513330', '德格', '德格', 'dege', '513300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('513331', '白玉', '白玉', 'baiyu', '513300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('513332', '石渠', '石渠', 'shiqu', '513300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('513333', '色达', '色达', 'seda', '513300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('513334', '理塘', '理塘', 'litang', '513300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('513335', '巴塘', '巴塘', 'batang', '513300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('513336', '乡城', '乡城', 'xiangcheng', '513300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('513337', '稻城', '稻城', 'daocheng', '513300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('513338', '得荣', '得荣', 'derong', '513300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('513400', '凉山', '凉山', 'liangshan', '510000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('513401', '西昌', '西昌', 'xichang', '513400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('513422', '木里', '木里', 'muli', '513400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('513423', '盐源', '盐源', 'yanyuan', '513400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('513424', '德昌', '德昌', 'dechang', '513400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('513425', '会理', '会理', 'huili', '513400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('513426', '会东', '会东', 'huidong', '513400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('513427', '宁南', '宁南', 'ningnan', '513400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('513428', '普格', '普格', 'puge', '513400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('513429', '布拖', '布拖', 'butuo', '513400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('513430', '金阳', '金阳', 'jinyang', '513400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('513431', '昭觉', '昭觉', 'zhaojue', '513400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('513432', '喜德', '喜德', 'xide', '513400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('513433', '冕宁', '冕宁', 'mianning', '513400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('513434', '越西', '越西', 'yuexi', '513400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('513435', '甘洛', '甘洛', 'ganluo', '513400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('513436', '美姑', '美姑', 'meigu', '513400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('513437', '雷波', '雷波', 'leibo', '513400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('520100', '贵阳', '贵阳', 'guiyang', '520000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('520102', '南明', '南明', 'nanming', '520100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('520103', '云岩', '云岩', 'yunyan', '520100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('520111', '花溪', '花溪', 'huaxi', '520100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('520112', '乌当', '乌当', 'wudang', '520100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('520113', '白云', '白云', 'by', '520100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('520121', '开阳', '开阳', 'kaiyang', '520100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('520122', '息烽', '息烽', 'xif', '520100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('520123', '修文', '修文', 'xiuwen', '520100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('520151', '观山湖', '观山湖', 'guanshanhu', '520100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('520181', '清镇', '清镇', 'qingzhen', '520100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('520200', '六盘水', '六盘水', 'liupanshui', '520000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('520201', '钟山', '钟山', 'zhongsh', '520200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('520203', '六枝特', '六枝特', 'liuzhite', '520200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('520221', '水城', '水城', 'shuicheng', '520200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('520222', '盘县', '盘县', 'panxian', '520200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('520300', '遵义', '遵义', 'zunyi', '520000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('520302', '红花岗', '红花岗', 'honghuagang', '520300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('520303', '汇川', '汇川', 'huichuan', '520300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('520321', '播州', '播州', 'bozhou', '520300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('520322', '桐梓', '桐梓', 'tongzi', '520300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('520323', '绥阳', '绥阳', 'suiyang', '520300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('520324', '正安', '正安', 'zhengan', '520300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('520325', '道真', '道真', 'dao', '520300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('520326', '务川', '务川', 'wuchuan', '520300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('520327', '凤冈', '凤冈', 'fenggang', '520300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('520328', '湄潭', '湄潭', 'meitan', '520300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('520329', '余庆', '余庆', 'yuqing', '520300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('520330', '习水', '习水', 'xishui', '520300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('520381', '赤水', '赤水', 'chishui', '520300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('520382', '仁怀', '仁怀', 'renhuai', '520300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('520400', '安顺', '安顺', 'anshun', '520000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('520402', '西秀', '西秀', 'xixiu', '520400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('520421', '平坝', '平坝', 'pingba', '520400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('520422', '普定', '普定', 'puding', '520400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('520423', '镇宁', '镇宁', 'zhenning', '520400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('520424', '关岭', '关岭', 'guanling', '520400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('520425', '紫云', '紫云', 'ziyun', '520400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('522200', '铜仁', '铜仁', 'ren', '520000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('522201', '碧江', '碧江', 'bijiang', '522200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('522222', '江口', '江口', 'jiangkou', '522200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('522223', '玉屏', '玉屏', 'yuping', '522200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('522224', '石阡', '石阡', 'shiqian', '522200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('522225', '思南', '思南', 'sinan', '522200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('522226', '印江', '印江', 'yinjiang', '522200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('522227', '德江', '德江', 'dejiang', '522200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('522228', '沿河', '沿河', 'yanhe', '522200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('522229', '松桃', '松桃', 'songtao', '522200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('522230', '万山', '万山', 'wanshan', '522200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('522300', '黔西南', '黔西南', 'qianxinan', '520000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('522301', '兴义', '兴义', 'xingyi', '522300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('522322', '兴仁', '兴仁', 'xingren', '522300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('522323', '普安', '普安', 'puan', '522300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('522324', '晴隆', '晴隆', 'qinglong', '522300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('522325', '贞丰', '贞丰', 'zhenfeng', '522300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('522326', '望谟', '望谟', 'wangmo', '522300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('522327', '册亨', '册亨', 'ceheng', '522300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('522328', '安龙', '安龙', 'anlong', '522300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('522400', '毕节', '毕节', 'bijie', '520000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('522401', '七星关', '七星关', 'qixingguan', '522400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('522422', '大方', '大方', 'dafang', '522400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('522423', '黔西', '黔西', 'qianxi', '522400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('522424', '金沙', '金沙', 'jinsha', '522400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('522425', '织金', '织金', 'zhijin', '522400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('522426', '纳雍', '纳雍', 'nayong', '522400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('522427', '威宁', '威宁', 'weining', '522400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('522428', '赫章', '赫章', 'hezhang', '522400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('522600', '黔东南', '黔东南', 'qiandongnan', '520000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('522601', '凯里', '凯里', 'kaili', '522600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('522622', '黄平', '黄平', 'huangping', '522600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('522623', '施秉', '施秉', 'shibing', '522600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('522624', '三穗', '三穗', 'sansui', '522600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('522625', '镇远', '镇远', 'zhyuan', '522600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('522626', '岑巩', '岑巩', 'cengong', '522600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('522627', '天柱', '天柱', 'tzhu', '522600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('522628', '锦屏', '锦屏', 'jping', '522600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('522629', '剑河', '剑河', 'jianhe', '522600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('522630', '台江', '台江', 'tjiang', '522600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('522631', '黎平', '黎平', 'liping', '522600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('522632', '榕江', '榕江', 'rongjiang', '522600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('522633', '从江', '从江', 'congjiang', '522600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('522634', '雷山', '雷山', 'leishan', '522600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('522635', '麻江', '麻江', 'majiang', '522600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('522636', '丹寨', '丹寨', 'danzhai', '522600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('522700', '黔南', '黔南', 'qiannan', '520000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('522701', '都匀', '都匀', 'duyun', '522700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('522702', '福泉', '福泉', 'fuquan', '522700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('522722', '荔波', '荔波', 'libo', '522700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('522723', '贵定', '贵定', 'guiding', '522700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('522725', '瓮安', '瓮安', 'wengan', '522700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('522726', '独山', '独山', 'dushan', '522700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('522727', '平塘', '平塘', 'pingtang', '522700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('522728', '罗甸', '罗甸', 'luodian', '522700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('522729', '长顺', '长顺', 'changshun', '522700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('522730', '龙里', '龙里', 'longli', '522700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('522731', '惠水', '惠水', 'huishui', '522700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('522732', '三都', '三都', 'sandu', '522700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('530100', '昆明', '昆明', 'kunming', '530000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('530102', '五华', '五华', 'wuhua1', '530100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('530103', '盘龙', '盘龙', 'panlong', '530100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('530111', '官渡', '官渡', 'guandu', '530100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('530112', '西山', '西山', 'xishan', '530100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('530113', '东川', '东川', 'dongchuan', '530100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('530121', '呈贡', '呈贡', 'chenggong', '530100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('530122', '晋宁', '晋宁', 'jinning', '530100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('530124', '富民', '富民', 'fumin', '530100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('530125', '宜良', '宜良', 'yling', '530100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('530126', '石林', '石林', 'shilin', '530100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('530127', '嵩明', '嵩明', 'songming', '530100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('530128', '禄劝', '禄劝', 'luquan', '530100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('530129', '寻甸', '寻甸', 'xundian', '530100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('530181', '安宁', '安宁', 'anning', '530100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('530300', '曲靖', '曲靖', 'qujing', '530000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('530302', '麒麟', '麒麟', 'qilin', '530300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('530321', '马龙', '马龙', 'malong', '530300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('530322', '陆良', '陆良', 'luliang', '530300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('530323', '师宗', '师宗', 'shizong', '530300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('530324', '罗平', '罗平', 'luoping', '530300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('530325', '富源', '富源', 'fuyuan', '530300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('530326', '会泽', '会泽', 'huize', '530300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('530328', '沾益', '沾益', 'zhanyi', '530300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('530381', '宣威', '宣威', 'xuanwei', '530300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('530400', '玉溪', '玉溪', 'yuxi', '530000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('530402', '红塔', '红塔', 'hongta', '530400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('530421', '江川', '江川', 'jiangchuan', '530400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('530422', '澄江', '澄江', 'chengjiang', '530400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('530423', '通海', '通海', 'tonghai', '530400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('530424', '华宁', '华宁', 'huaning', '530400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('530425', '易门', '易门', 'yimen', '530400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('530426', '峨山', '峨山', 'eshan', '530400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('530427', '新平', '新平', 'xinping', '530400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('530428', '元江', '元江', 'yuanjiang', '530400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('530500', '保山', '保山', 'bao', '530000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('530502', '隆阳', '隆阳', 'longyang', '530500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('530521', '施甸', '施甸', 'shidian', '530500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('530522', '腾冲', '腾冲', 'tengchong', '530500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('530523', '龙陵', '龙陵', 'longling', '530500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('530524', '昌宁', '昌宁', 'changning', '530500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('530600', '昭通', '昭通', 'zhaotong', '530000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('530602', '昭阳', '昭阳', 'zhaoyang', '530600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('530621', '鲁甸', '鲁甸', 'ludian', '530600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('530622', '巧家', '巧家', 'qiaojia', '530600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('530623', '盐津', '盐津', 'yanjin', '530600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('530624', '大关', '大关', 'daguan', '530600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('530625', '永善', '永善', 'yongshan', '530600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('530626', '绥江', '绥江', 'suijiang', '530600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('530627', '镇雄', '镇雄', 'zhenxiong', '530600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('530628', '彝良', '彝良', 'yiliang', '530600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('530629', '威信', '威信', 'weixin', '530600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('530630', '水富', '水富', 'shuifu', '530600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('530700', '丽江', '丽江', 'lijiang', '530000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('530702', '古城', '古城', 'gucheng', '530700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('530721', '玉龙', '玉龙', 'yulong', '530700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('530722', '永胜', '永胜', 'yongsheng', '530700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('530723', '华坪', '华坪', 'huaping', '530700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('530724', '宁蒗', '宁蒗', 'ninglang', '530700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('530800', '普洱', '普洱', 'puer', '530000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('530802', '思茅', '思茅', 'simao', '530800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('530821', '宁洱', '宁洱', 'ninger', '530800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('530822', '墨江', '墨江', 'mojiang', '530800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('530823', '景东', '景东', 'jingdong', '530800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('530824', '景谷', '景谷', 'jinggu', '530800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('530825', '镇沅', '镇沅', 'zheny', '530800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('530826', '江城', '江城', 'jiangcheng1', '530800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('530827', '孟连', '孟连', 'menglian', '530800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('530828', '澜沧', '澜沧', 'lancang', '530800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('530829', '西盟', '西盟', 'ximeng', '530800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('530900', '临沧', '临沧', 'lincang', '530000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('530902', '临翔', '临翔', 'linxiang', '530900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('530921', '凤庆', '凤庆', 'fengqing', '530900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('530922', '云县', '云县', 'yunxian', '530900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('530923', '永德', '永德', 'yongde', '530900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('530924', '镇康', '镇康', 'zhenkang', '530900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('530925', '双江', '双江', 'shuangjiang', '530900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('530926', '耿马', '耿马', 'gengma', '530900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('530927', '沧源', '沧源', 'cangyuan', '530900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('532300', '楚雄', '楚雄', 'chuxiong', '530000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('532322', '双柏', '双柏', 'shuangbai', '532300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('532323', '牟定', '牟定', 'mouding', '532300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('532324', '南华', '南华', 'nanhua', '532300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('532325', '姚安', '姚安', 'yaoan', '532300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('532326', '大姚', '大姚', 'dayao', '532300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('532327', '永仁', '永仁', 'yongren', '532300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('532328', '元谋', '元谋', 'yuanmou', '532300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('532329', '武定', '武定', 'wuding', '532300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('532331', '禄丰', '禄丰', 'lufeng', '532300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('532500', '红河', '红河', 'honghe', '530000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('532501', '个旧', '个旧', 'gejiu', '532500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('532502', '开远', '开远', 'kaiyuan', '532500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('532522', '蒙自', '蒙自', 'mengzi', '532500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('532523', '屏边', '屏边', 'pingbian', '532500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('532524', '建水', '建水', 'jianshui', '532500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('532525', '石屏', '石屏', 'shiping', '532500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('532526', '弥勒', '弥勒', 'mile', '532500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('532527', '泸西', '泸西', 'luxi', '532500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('532528', '元阳', '元阳', 'yuanyang', '532500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('532530', '金平', '金平', 'jinping1', '532500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('532531', '绿春', '绿春', 'lvchun', '532500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('532532', '河口', '河口', 'hk', '532500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('532600', '文山', '文山', 'wenshan', '530000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('532622', '砚山', '砚山', 'yanshan', '532600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('532623', '西畴', '西畴', 'xichou', '532600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('532624', '麻栗坡', '麻栗坡', 'malipo', '532600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('532625', '马关', '马关', 'maguan', '532600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('532626', '丘北', '丘北', 'qiubei', '532600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('532627', '广南', '广南', 'guangnan', '532600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('532628', '富宁', '富宁', 'funing', '532600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('532800', '西双版纳', '西双版纳', 'xishuangbanna', '530000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('532801', '景洪', '景洪', 'jinghong', '532800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('532822', '勐海', '勐海', 'menghai', '532800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('532823', '勐腊', '勐腊', 'mengla', '532800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('532900', '大理', '大理', 'dal', '530000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('532922', '漾濞', '漾濞', 'yangbi', '532900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('532923', '祥云', '祥云', 'xiangyun', '532900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('532924', '宾川', '宾川', 'binchuan', '532900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('532925', '弥渡', '弥渡', 'midu', '532900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('532926', '南涧', '南涧', 'nanjian', '532900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('532927', '巍山', '巍山', 'weishan', '532900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('532928', '永平', '永平', 'yongping', '532900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('532929', '云龙', '云龙', 'ylong', '532900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('532930', '洱源', '洱源', 'eryuan', '532900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('532931', '剑川', '剑川', 'jianchuan', '532900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('532932', '鹤庆', '鹤庆', 'heqing', '532900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('533100', '德宏', '德宏', 'dehong', '530000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('533102', '瑞丽', '瑞丽', 'ruili', '533100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('533103', '芒市', '芒市', 'mangshi', '533100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('533122', '梁河', '梁河', 'lianghe', '533100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('533123', '盈江', '盈江', 'yingjiang', '533100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('533124', '陇川', '陇川', 'longchuan', '533100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('533300', '怒江', '怒江', 'nujiang', '530000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('533321', '泸水', '泸水', 'lushui', '533300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('533323', '福贡', '福贡', 'fugong', '533300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('533324', '贡山', '贡山', 'gongshan', '533300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('533325', '兰坪', '兰坪', 'lanping', '533300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('533400', '迪庆', '迪庆', 'diqing', '530000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('533421', '香格里拉', '香格里拉', 'xianggelila', '533400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('533422', '德钦', '德钦', 'deqin', '533400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('533423', '维西', '维西', 'weixi', '533400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('540100', '拉萨', '拉萨', 'lasa', '540000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('540102', '城关', '城关', 'cg', '540100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('540121', '林周', '林周', 'linzhou', '540100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('540122', '当雄', '当雄', 'dangxiong', '540100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('540123', '尼木', '尼木', 'nimu', '540100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('540124', '曲水', '曲水', 'qushui', '540100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('540125', '堆龙德庆', '堆龙德庆', 'duilongdeqing', '540100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('540126', '达孜', '达孜', 'dazi', '540100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('540127', '墨竹工卡', '墨竹工卡', 'mozhugongka', '540100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('542100', '昌都', '昌都', 'changdu', '540000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('542121', '卡若', '卡若', 'karuo', '542100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('542122', '江达', '江达', 'jiangda', '542100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('542123', '贡觉', '贡觉', 'gongjue', '542100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('542124', '类乌齐', '类乌齐', 'leiwuqi', '542100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('542125', '丁青', '丁青', 'dingqing', '542100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('542126', '察雅', '察雅', 'chaya', '542100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('542127', '八宿', '八宿', 'basu', '542100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('542128', '左贡', '左贡', 'zuogong', '542100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('542129', '芒康', '芒康', 'mangkang', '542100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('542132', '洛隆', '洛隆', 'luolong', '542100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('542133', '边坝', '边坝', 'bianba', '542100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('542200', '山南', '山南', 'shannan', '540000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('542221', '乃东', '乃东', 'naidong', '542200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('542222', '扎囊', '扎囊', 'zhanan', '542200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('542223', '贡嘎', '贡嘎', 'gongga', '542200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('542224', '桑日', '桑日', 'sangri', '542200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('542225', '琼结', '琼结', 'qiongjie', '542200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('542226', '曲松', '曲松', 'qusong', '542200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('542227', '措美', '措美', 'cuomei', '542200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('542228', '洛扎', '洛扎', 'luozha', '542200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('542229', '加查', '加查', 'jiacha', '542200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('542231', '隆子', '隆子', 'longzi', '542200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('542232', '错那', '错那', 'cuona', '542200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('542233', '浪卡子', '浪卡子', 'langkazi', '542200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('542300', '日喀则', '日喀则', 'rikaze', '540000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('542301', '桑珠孜', '桑珠孜', 'sangzhuzi', '542300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('542322', '南木林', '南木林', 'nanmulin', '542300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('542323', '江孜', '江孜', 'jiangzi', '542300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('542324', '定日', '定日', 'dingri', '542300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('542325', '萨迦', '萨迦', 'sajia', '542300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('542326', '拉孜', '拉孜', 'lazi', '542300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('542327', '昂仁', '昂仁', 'angren', '542300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('542328', '谢通门', '谢通门', 'xietongmen', '542300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('542329', '白朗', '白朗', 'bailang', '542300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('542330', '仁布', '仁布', 'renbu', '542300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('542331', '康马', '康马', 'kangma', '542300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('542332', '定结', '定结', 'dingjie', '542300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('542333', '仲巴', '仲巴', 'zhongba', '542300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('542334', '亚东', '亚东', 'yadong', '542300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('542335', '吉隆', '吉隆', 'jilong', '542300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('542336', '聂拉木', '聂拉木', 'nielamu', '542300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('542337', '萨嘎', '萨嘎', 'saga', '542300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('542338', '岗巴', '岗巴', 'gangba', '542300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('542400', '那曲', '那曲', 'naqu', '540000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('542422', '嘉黎', '嘉黎', 'jiali', '542400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('542423', '比如', '比如', 'biru', '542400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('542424', '聂荣', '聂荣', 'nierong', '542400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('542425', '安多', '安多', 'anduo', '542400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('542426', '申扎', '申扎', 'shenzha', '542400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('542427', '索县', '索县', 'suoxian', '542400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('542428', '班戈', '班戈', 'bange', '542400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('542429', '巴青', '巴青', 'baqing', '542400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('542430', '尼玛', '尼玛', 'nima', '542400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('542432', '双湖', '双湖', 'shuanghu', '542400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('542500', '阿里', '阿里', 'ali', '540000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('542521', '普兰', '普兰', 'pulan', '542500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('542522', '札达', '札达', 'zhada', '542500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('542523', '噶尔', '噶尔', 'gaer', '542500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('542524', '日土', '日土', 'ritu', '542500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('542525', '革吉', '革吉', 'geji', '542500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('542526', '改则', '改则', 'gaize', '542500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('542527', '措勤', '措勤', 'cuoqin', '542500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('542600', '林芝', '林芝', 'linzhi', '540000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('542621', '巴宜', '巴宜', 'bayi', '542600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('542622', '工布江达', '工布江达', 'gongbujiangda', '542600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('542623', '米林', '米林', 'milin', '542600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('542624', '墨脱', '墨脱', 'motuo', '542600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('542625', '波密', '波密', 'bomi', '542600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('542626', '察隅', '察隅', 'chayu', '542600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('542627', '朗县', '朗县', 'langxian', '542600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('610100', '西安', '西安', 'xian', '610000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('610102', '新城', '新城', 'xincheng1', '610100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('610103', '碑林', '碑林', 'beilin', '610100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('610104', '莲湖', '莲湖', 'lianhu', '610100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('610111', '灞桥', '灞桥', 'baqiao', '610100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('610112', '未央', '未央', 'weiyang', '610100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('610113', '雁塔', '雁塔', 'yanta', '610100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('610114', '阎良', '阎良', 'yanliang', '610100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('610115', '临潼', '临潼', 'lintong', '610100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('610116', '长安', '长安', 'chan', '610100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('610122', '蓝田', '蓝田', 'lantian', '610100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('610124', '周至', '周至', 'zhouzhi', '610100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('610125', '户县', '户县', 'huxian', '610100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('610126', '高陵', '高陵', 'gaoling', '610100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('610200', '铜川', '铜川', 'tongchuan', '610000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('610202', '王益', '王益', 'wangyi', '610200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('610203', '印台', '印台', 'yintai', '610200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('610204', '耀州', '耀州', 'yaozhou', '610200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('610222', '宜君', '宜君', 'yijun', '610200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('610300', '宝鸡', '宝鸡', 'baoji', '610000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('610302', '渭滨', '渭滨', 'weibin', '610300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('610303', '金台', '金台', 'jintai', '610300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('610304', '陈仓', '陈仓', 'chencang', '610300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('610322', '凤翔', '凤翔', 'fengxiang', '610300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('610323', '岐山', '岐山', 'qishan', '610300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('610324', '扶风', '扶风', 'fufeng', '610300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('610326', '眉县', '眉县', 'meixian', '610300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('610327', '陇县', '陇县', 'longxian', '610300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('610328', '千阳', '千阳', 'qianyang', '610300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('610329', '麟游', '麟游', 'linyou', '610300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('610330', '凤县', '凤县', 'fengxian', '610300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('610331', '太白', '太白', 'taibai', '610300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('610400', '咸阳', '咸阳', 'xianyang', '610000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('610402', '秦都', '秦都', 'qindu', '610400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('610403', '杨陵', '杨陵', 'yangling', '610400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('610404', '渭城', '渭城', 'weicheng', '610400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('610422', '三原', '三原', 'sanyuan', '610400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('610423', '泾阳', '泾阳', 'jingyang', '610400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('610424', '乾县', '乾县', 'qianxian', '610400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('610425', '礼泉', '礼泉', 'liquan', '610400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('610426', '永寿', '永寿', 'yongshou', '610400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('610427', '彬县', '彬县', 'binxian', '610400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('610428', '长武', '长武', 'changwu', '610400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('610429', '旬邑', '旬邑', 'xunyi', '610400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('610430', '淳化', '淳化', 'chunhua', '610400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('610431', '武功', '武功', 'wugong', '610400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('610481', '兴平', '兴平', 'xingping', '610400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('610500', '渭南', '渭南', 'weinan', '610000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('610502', '临渭', '临渭', 'linwei', '610500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('610521', '华州', '华州', 'huazhou', '610500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('610522', '潼关', '潼关', 'tongguan', '610500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('610523', '大荔', '大荔', 'dali', '610500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('610524', '合阳', '合阳', 'heyang', '610500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('610525', '澄城', '澄城', 'chengcheng', '610500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('610526', '蒲城', '蒲城', 'pucheng', '610500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('610527', '白水', '白水', 'baishui', '610500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('610528', '富平', '富平', 'fping', '610500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('610581', '韩城', '韩城', 'hancheng', '610500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('610582', '华阴', '华阴', 'huayin', '610500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('610600', '延安', '延安', 'yanan', '610000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('610602', '宝塔', '宝塔', 'baota', '610600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('610621', '延长', '延长', 'yanchang', '610600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('610622', '延川', '延川', 'yanchuan', '610600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('610623', '子长', '子长', 'zichang', '610600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('610624', '安塞', '安塞', 'ansai', '610600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('610625', '志丹', '志丹', 'zhidan', '610600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('610626', '吴起', '吴起', 'wuqi', '610600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('610627', '甘泉', '甘泉', 'ganquan', '610600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('610628', '富县', '富县', 'fuxian', '610600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('610629', '洛川', '洛川', 'luochuan', '610600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('610630', '宜川', '宜川', 'yichuan', '610600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('610631', '黄龙', '黄龙', 'huanglong', '610600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('610632', '黄陵', '黄陵', 'huangling', '610600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('610700', '汉中', '汉中', 'hanzhong', '610000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('610702', '汉台', '汉台', 'hantai', '610700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('610721', '南郑', '南郑', 'nanzheng', '610700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('610722', '城固', '城固', 'chenggu', '610700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('610723', '洋县', '洋县', 'yangxian', '610700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('610724', '西乡', '西乡', 'xixiang', '610700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('610725', '勉县', '勉县', 'mianxian', '610700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('610726', '宁强', '宁强', 'ningqiang', '610700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('610727', '略阳', '略阳', 'lueyang', '610700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('610728', '镇巴', '镇巴', 'zhenba', '610700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('610729', '留坝', '留坝', 'liuba', '610700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('610730', '佛坪', '佛坪', 'fuping', '610700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('610800', '榆林', '榆林', 'yulin', '610000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('610802', '榆阳', '榆阳', 'yuyang', '610800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('610821', '神木', '神木', 'shenmu', '610800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('610822', '府谷', '府谷', 'fugu', '610800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('610823', '横山', '横山', 'hengshan', '610800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('610824', '靖边', '靖边', 'jingbian', '610800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('610825', '定边', '定边', 'dingbian', '610800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('610826', '绥德', '绥德', 'suide', '610800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('610827', '米脂', '米脂', 'mizhi', '610800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('610828', '佳县', '佳县', 'jiaxian', '610800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('610829', '吴堡', '吴堡', 'wubao', '610800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('610830', '清涧', '清涧', 'qingjian', '610800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('610831', '子洲', '子洲', 'zizhou', '610800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('610900', '安康', '安康', 'ankang', '610000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('610902', '汉滨', '汉滨', 'hanbin', '610900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('610921', '汉阴', '汉阴', 'hanyin', '610900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('610922', '石泉', '石泉', 'shiquan', '610900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('610923', '宁陕', '宁陕', 'ningshan', '610900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('610924', '紫阳', '紫阳', 'ziyang', '610900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('610925', '岚皋', '岚皋', 'langao', '610900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('610926', '平利', '平利', 'pingli', '610900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('610927', '镇坪', '镇坪', 'zhenping', '610900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('610928', '旬阳', '旬阳', 'xunyang', '610900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('610929', '白河', '白河', 'baihe', '610900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('611000', '商洛', '商洛', 'shangluo', '610000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('611002', '商州', '商州', 'shangzhou', '611000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('611021', '洛南', '洛南', 'luonan', '611000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('611022', '丹凤', '丹凤', 'danfeng', '611000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('611023', '商南', '商南', 'shangnan', '611000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('611024', '山阳', '山阳', 'shany', '611000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('611025', '镇安', '镇安', 'zhenan', '611000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('611026', '柞水', '柞水', 'zuoshui', '611000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('620100', '兰州', '兰州', 'lanzhou', '620000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('620102', '城关', '城关', 'chengguan1', '620100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('620103', '七里河', '七里河', 'qilihe', '620100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('620104', '西固', '西固', 'xigu', '620100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('620105', '安宁', '安宁', 'ning', '620100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('620111', '红古', '红古', 'honggu', '620100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('620121', '永登', '永登', 'yongdeng', '620100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('620122', '皋兰', '皋兰', 'gaolan', '620100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('620123', '榆中', '榆中', 'yuzhong', '620100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('620200', '嘉峪关', '嘉峪关', 'jiayuguan', '620000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('620300', '金昌', '金昌', 'jinchang', '620000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('620302', '金川', '金川', 'jinchan', '620300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('620321', '永昌', '永昌', 'yongchang', '620300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('620400', '白银', '白银', 'baiyin', '620000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('620403', '平川', '平川', 'pingchuan', '620400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('620421', '靖远', '靖远', 'jyun', '620400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('620422', '会宁', '会宁', 'huining', '620400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('620423', '景泰', '景泰', 'jingtai', '620400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('620500', '天水', '天水', 'tianshui', '620000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('620502', '秦州', '秦州', 'qinzhou', '620500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('620503', '麦积', '麦积', 'maiji', '620500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('620521', '清水', '清水', 'qingshui', '620500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('620522', '秦安', '秦安', 'qinan', '620500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('620523', '甘谷', '甘谷', 'gangu', '620500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('620524', '武山', '武山', 'wushan', '620500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('620525', '张家川', '张家川', 'zhangjiachuan', '620500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('620600', '武威', '武威', 'wuwei', '620000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('620602', '凉州', '凉州', 'liangzhou', '620600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('620621', '民勤', '民勤', 'minqin', '620600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('620622', '古浪', '古浪', 'gulang', '620600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('620623', '天祝', '天祝', 'tianzhu', '620600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('620700', '张掖', '张掖', 'zhangye', '620000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('620702', '甘州', '甘州', 'ganzhou', '620700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('620721', '肃南', '肃南', 'sunan', '620700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('620722', '民乐', '民乐', 'minle', '620700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('620723', '临泽', '临泽', 'linze', '620700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('620724', '高台', '高台', 'gaotai', '620700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('620725', '山丹', '山丹', 'shandan', '620700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('620800', '平凉', '平凉', 'pingliang', '620000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('620802', '崆峒', '崆峒', 'kongdong', '620800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('620821', '泾川', '泾川', 'jingchuan', '620800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('620822', '灵台', '灵台', 'lingtai', '620800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('620823', '崇信', '崇信', 'chongxin', '620800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('620824', '华亭', '华亭', 'huating', '620800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('620825', '庄浪', '庄浪', 'zhuanglang', '620800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('620826', '静宁', '静宁', 'jingning', '620800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('620900', '酒泉', '酒泉', 'jiuquan', '620000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('620902', '肃州', '肃州', 'suzhou', '620900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('620921', '金塔', '金塔', 'jinta', '620900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('620922', '瓜州', '瓜州', 'guazhou', '620900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('620923', '肃北', '肃北', 'subei', '620900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('620924', '阿克塞', '阿克塞', 'akesai', '620900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('620981', '玉门', '玉门', 'yumen', '620900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('620982', '敦煌', '敦煌', 'dunhuang', '620900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('621000', '庆阳', '庆阳', 'qiny', '620000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('621002', '西峰', '西峰', 'xifeng', '621000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('621021', '庆城', '庆城', 'qingcheng', '621000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('621022', '环县', '环县', 'huanxian', '621000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('621023', '华池', '华池', 'huachi', '621000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('621024', '合水', '合水', 'heshui', '621000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('621025', '正宁', '正宁', 'zhengning', '621000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('621026', '宁县', '宁县', 'ningxian', '621000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('621027', '镇原', '镇原', 'zhenyuan', '621000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('621100', '定西', '定西', 'dingxi', '620000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('621102', '安定', '安定', 'anding', '621100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('621121', '通渭', '通渭', 'tongwei', '621100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('621122', '陇西', '陇西', 'longxi', '621100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('621123', '渭源', '渭源', 'weiyuan', '621100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('621124', '临洮', '临洮', 'lindao', '621100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('621125', '漳县', '漳县', 'zhangxian', '621100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('621126', '岷县', '岷县', 'minxian', '621100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('621200', '陇南', '陇南', 'longnan', '620000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('621202', '武都', '武都', 'wudu', '621200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('621221', '成县', '成县', 'chengxian', '621200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('621222', '文县', '文县', 'wenxian', '621200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('621223', '宕昌', '宕昌', 'dangchang', '621200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('621224', '康县', '康县', 'kangxian', '621200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('621225', '西和', '西和', 'xihe', '621200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('621226', '礼县', '礼县', 'lixian', '621200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('621227', '徽县', '徽县', 'huixian', '621200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('621228', '两当', '两当', 'liangdang', '621200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('622900', '临夏', '临夏', 'linxia', '620000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('622901', '临夏市', '临夏市', 'linxiashi', '622900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('622921', '临夏县', '临夏县', 'linxiaxian', '622900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('622922', '康乐', '康乐', 'kangle', '622900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('622923', '永靖', '永靖', 'yongjing', '622900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('622924', '广河', '广河', 'guanghe', '622900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('622925', '和政', '和政', 'hezheng', '622900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('622926', '东乡', '东乡', 'dx', '622900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('622927', '积石山', '积石山', 'jishishan', '622900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('623000', '甘南', '甘南', 'gn', '620000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('623001', '合作', '合作', 'hezuo', '623000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('623021', '临潭', '临潭', 'lintan', '623000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('623022', '卓尼', '卓尼', 'zhuoni', '623000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('623023', '舟曲', '舟曲', 'zhouqu', '623000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('623024', '迭部', '迭部', 'diebu', '623000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('623025', '玛曲', '玛曲', 'maqu', '623000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('623026', '碌曲', '碌曲', 'luqu', '623000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('623027', '夏河', '夏河', 'xiahe', '623000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('630100', '西宁', '西宁', 'xining', '630000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('630102', '城东', '城东', 'chengdong', '630100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('630103', '城中', '城中', 'chengzh', '630100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('630104', '城西', '城西', 'chengxi', '630100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('630105', '城北', '城北', 'chengbei', '630100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('630121', '大通', '大通', 'dtong', '630100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('630122', '湟中', '湟中', 'huangzhong', '630100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('630123', '湟源', '湟源', 'huangyuan', '630100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('632100', '海东', '海东', 'haidong', '630000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('632121', '平安', '平安', 'pingan', '632100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('632122', '民和', '民和', 'minhe', '632100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('632123', '乐都', '乐都', 'ledu', '632100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('632126', '互助', '互助', 'huzhu', '632100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('632127', '化隆', '化隆', 'hualong', '632100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('632128', '循化', '循化', 'xunhua', '632100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('632200', '海北', '海北', 'haibei', '630000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('632221', '门源', '门源', 'menyuan', '632200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('632222', '祁连', '祁连', 'qilian', '632200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('632223', '海晏', '海晏', 'haiyan', '632200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('632224', '刚察', '刚察', 'gangcha', '632200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('632300', '黄南', '黄南', 'huangnan', '630000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('632321', '同仁', '同仁', 'tongren', '632300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('632322', '尖扎', '尖扎', 'jianzha', '632300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('632323', '泽库', '泽库', 'zeku', '632300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('632324', '河南', '河南', 'hnan', '632300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('632500', '海南藏族', '海南藏族', 'hainancangzu', '630000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('632521', '共和', '共和', 'gonghe', '632500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('632522', '同德', '同德', 'tongde', '632500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('632523', '贵德', '贵德', 'guide', '632500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('632524', '兴海', '兴海', 'xinghai', '632500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('632525', '贵南', '贵南', 'guinan', '632500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('632600', '果洛', '果洛', 'guoluo', '630000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('632621', '玛沁', '玛沁', 'maqin', '632600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('632622', '班玛', '班玛', 'banma', '632600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('632623', '甘德', '甘德', 'gande', '632600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('632624', '达日', '达日', 'dari', '632600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('632625', '久治', '久治', 'jiuzhi', '632600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('632626', '玛多', '玛多', 'maduo', '632600', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('632700', '玉树', '玉树', 'yushu', '630000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('632722', '杂多', '杂多', 'zaduo', '632700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('632723', '称多', '称多', 'chenduo', '632700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('632724', '治多', '治多', 'zhiduo', '632700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('632725', '囊谦', '囊谦', 'nanqian', '632700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('632726', '曲麻莱', '曲麻莱', 'qumalai', '632700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('632800', '海西', '海西', 'haixi', '630000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('632825', '海西直辖', '海西直辖', 'haixizhixia', '632800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('632801', '格尔木', '格尔木', 'geermu', '632800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('632802', '德令哈', '德令哈', 'delingha', '632800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('632821', '乌兰', '乌兰', 'wulan', '632800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('632822', '都兰', '都兰', 'dulan', '632800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('632823', '天峻', '天峻', 'tianjun', '632800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('640100', '银川', '银川', 'yinchuan', '640000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('640104', '兴庆', '兴庆', 'xingqing', '640100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('640105', '西夏', '西夏', 'xixia', '640100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('640106', '金凤', '金凤', 'jinfeng', '640100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('640121', '永宁', '永宁', 'yongning', '640100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('640122', '贺兰', '贺兰', 'helan', '640100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('640181', '灵武', '灵武', 'lingwu', '640100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('640200', '石嘴山', '石嘴山', 'shizuishan', '640000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('640202', '大武口', '大武口', 'dawukou', '640200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('640205', '惠农', '惠农', 'huinong', '640200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('640221', '平罗', '平罗', 'pingluo', '640200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('640300', '吴忠', '吴忠', 'wuzhong', '640000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('640302', '利通', '利通', 'litong', '640300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('640303', '红寺堡', '红寺堡', 'hongsibao', '640300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('640323', '盐池', '盐池', 'yanchi', '640300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('640324', '同心', '同心', 'tongxin', '640300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('640381', '青铜峡', '青铜峡', 'qingtongxia', '640300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('640400', '固原', '固原', 'guyuan', '640000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('640402', '原州', '原州', 'yuanzhou', '640400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('640422', '西吉', '西吉', 'xiji', '640400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('640423', '隆德', '隆德', 'longde', '640400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('640424', '泾源', '泾源', 'jingyuan', '640400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('640425', '彭阳', '彭阳', 'pengyang', '640400', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('640500', '中卫', '中卫', 'zhongwei', '640000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('640502', '沙坡头', '沙坡头', 'shapotou', '640500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('640521', '中宁', '中宁', 'zhongning', '640500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('640522', '海原', '海原', 'haiyuan', '640500', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('650100', '乌鲁木齐', '乌鲁木齐', 'wulumuqi', '650000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('650102', '天山', '天山', 'tianshan', '650100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('650103', '沙依巴克', '沙依巴克', 'shayibake', '650100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('650104', '新市', '新市', 'xinshi', '650100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('650105', '水磨沟', '水磨沟', 'shuimogou', '650100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('650106', '头屯河', '头屯河', 'toutunhe', '650100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('650107', '达坂城', '达坂城', 'dabancheng', '650100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('650109', '米东', '米东', 'midong', '650100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('650200', '克拉玛依', '克拉玛依', 'kelamayi', '650000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('650202', '独山子', '独山子', 'dushanzi', '650200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('650204', '白碱滩', '白碱滩', 'baijiantan', '650200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('650205', '乌尔禾', '乌尔禾', 'wuerhe', '650200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('652100', '吐鲁番', '吐鲁番', 'tulufan', '650000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('652101', '高昌', '高昌', 'gaochang', '652100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('652122', '鄯善', '鄯善', 'shanshan', '652100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('652123', '托克逊', '托克逊', 'tuokexun', '652100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('652200', '哈密', '哈密', 'hami', '650000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('652201', '伊州', '伊州', 'yizhou', '652200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('652222', '巴里坤', '巴里坤', 'balikun', '652200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('652223', '伊吾', '伊吾', 'yiwu', '652200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('652300', '昌吉', '昌吉', 'changji', '650000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('652302', '阜康', '阜康', 'fukang', '652300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('652323', '呼图壁', '呼图壁', 'hutubi', '652300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('652324', '玛纳斯', '玛纳斯', 'manasi', '652300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('652325', '奇台', '奇台', 'qitai', '652300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('652327', '吉木萨尔', '吉木萨尔', 'jimusaer', '652300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('652328', '木垒', '木垒', 'mulei', '652300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('652700', '博尔塔拉', '博尔塔拉', 'boertala', '650000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('652701', '博乐', '博乐', 'bole', '652700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('652702', '阿拉山口', '阿拉山口', 'alashankou', '652700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('652722', '精河', '精河', 'jinghe', '652700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('652723', '温泉', '温泉', 'wenquan', '652700', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('652800', '巴音郭楞', '巴音郭楞', 'bayinguoleng', '650000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('652801', '库尔勒', '库尔勒', 'kuerle', '652800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('652822', '轮台', '轮台', 'luntai', '652800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('652823', '尉犁', '尉犁', 'weili', '652800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('652824', '若羌', '若羌', 'ruoqiang', '652800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('652825', '且末', '且末', 'qiemo', '652800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('652826', '焉耆', '焉耆', 'yanshi', '652800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('652827', '和静', '和静', 'hejing', '652800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('652828', '和硕', '和硕', 'heshuo', '652800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('652829', '博湖', '博湖', 'bohu', '652800', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('652900', '阿克苏', '阿克苏', 'akesu', '650000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('652922', '温宿', '温宿', 'wensu', '652900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('652923', '库车', '库车', 'kuche', '652900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('652924', '沙雅', '沙雅', 'shaya', '652900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('652925', '新和', '新和', 'xinhe', '652900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('652926', '拜城', '拜城', 'bc', '652900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('652927', '乌什', '乌什', 'wushi', '652900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('652928', '阿瓦提', '阿瓦提', 'awati', '652900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('652929', '柯坪', '柯坪', 'keping', '652900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('653000', '克孜勒苏柯尔克孜', '克孜勒苏柯尔克孜', 'kezilesukeerkezi', '650000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('653001', '阿图什', '阿图什', 'atushi', '653000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('653022', '阿克陶', '阿克陶', 'aketao', '653000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('653023', '阿合奇', '阿合奇', 'aheqi', '653000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('653024', '乌恰', '乌恰', 'wuqia', '653000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('653100', '喀什', '喀什', 'kashi', '650000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('653121', '疏附', '疏附', 'shufu', '653100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('653122', '疏勒', '疏勒', 'shule', '653100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('653123', '英吉沙', '英吉沙', 'yingjisha', '653100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('653124', '泽普', '泽普', 'zepu', '653100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('653125', '莎车', '莎车', 'shache', '653100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('653126', '叶城', '叶城', 'yecheng', '653100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('653127', '麦盖提', '麦盖提', 'maigaiti', '653100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('653128', '岳普湖', '岳普湖', 'yuepuhu', '653100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('653129', '伽师', '伽师', 'jiashi', '653100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('653130', '巴楚', '巴楚', 'bachu', '653100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('653131', '塔什库尔干', '塔什库尔干', 'tashikuergan', '653100', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('653200', '和田', '和田', 'hetian', '650000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('653201', '和田市', '和田市', 'hetianshi', '653200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('653221', '和田县', '和田县', 'hetianxian', '653200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('653222', '墨玉', '墨玉', 'moyu', '653200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('653223', '皮山', '皮山', 'pishan', '653200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('653224', '洛浦', '洛浦', 'luopu', '653200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('653225', '策勒', '策勒', 'cele', '653200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('653226', '于田', '于田', 'yutian', '653200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('653227', '民丰', '民丰', 'minfeng', '653200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('654000', '伊犁', '伊犁', 'yili', '650000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('654002', '伊宁市', '伊宁市', 'yiningshi', '654000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('654003', '奎屯', '奎屯', 'kuitun', '654000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('654004', '霍尔果斯', '霍尔果斯', 'huoerguosi', '654000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('654021', '伊宁县', '伊宁县', 'yiningxian', '654000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('654022', '察布查尔', '察布查尔', 'chabuchaer', '654000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('654023', '霍城', '霍城', 'huocheng', '654000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('654024', '巩留', '巩留', 'gongliu', '654000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('654025', '新源', '新源', 'xinyuan', '654000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('654026', '昭苏', '昭苏', 'zhaosu', '654000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('654027', '特克斯', '特克斯', 'tekesi', '654000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('654028', '尼勒克', '尼勒克', 'nileke', '654000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('654200', '塔城', '塔城', 'tacheng', '650000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('654202', '乌苏', '乌苏', 'wusu', '654200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('654221', '额敏', '额敏', 'emin', '654200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('654223', '沙湾', '沙湾', 'sw', '654200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('654224', '托里', '托里', 'tuoli', '654200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('654225', '裕民', '裕民', 'yumin', '654200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('654226', '和布克赛尔', '和布克赛尔', 'hebukesaier', '654200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('654300', '阿勒泰', '阿勒泰', 'aletai', '650000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('654321', '布尔津', '布尔津', 'buerjin', '654300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('654322', '富蕴', '富蕴', 'fuyun', '654300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('654323', '福海', '福海', 'fuhai', '654300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('654324', '哈巴河', '哈巴河', 'habahe', '654300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('654325', '青河', '青河', 'qhe', '654300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('654326', '吉木乃', '吉木乃', 'jimunai', '654300', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('659000', '可克达拉', '可克达拉', 'kekedala', '650000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('659001', '石河子', '石河子', 'shihezi', '650000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('659002', '阿拉尔', '阿拉尔', 'alaer', '650000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('659003', '图木舒克', '图木舒克', 'tumushuke', '650000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('659004', '五家渠', '五家渠', 'wujiaqu', '650000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('659005', '北屯', '北屯', 'beitun', '650000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('659006', '铁门关', '铁门关', 'tiemenguan', '650000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('659007', '双河', '双河', 'shuanghe', '659000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('659009', '昆玉', '昆玉', 'kunyu', '650000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('659004003', '人民路街道', '人民路街道', 'renminlujiedao', '659004', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('659004002', '青湖路街道', '青湖路街道', 'qinghulujiedao', '659004', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('659004001', '军垦路街道', '军垦路街道', 'junkenlujiedao', '659004', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('659003003', '永安坝街道', '永安坝街道', 'yonganbajiedao', '659003', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('659003002', '前海街道', '前海街道', 'qianhaijiedao', '659003', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('659003001', '齐干却勒街道', '齐干却勒街道', 'qiganquelejiedao', '659003', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('659002513', '阿拉尔农场', '阿拉尔农场', 'alaernongchang', '659002', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('659002402', '工业园区', '工业园区', 'gongyeyuanqu', '659002', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('659002200', '托喀依乡', '托喀依乡', 'tuokayixiang', '659002', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('659002004', '南口街道', '南口街道', 'nankoujiedao', '659002', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('659002003', '青松路街道', '青松路街道', 'qingsonglujiedao', '659002', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('659002002', '幸福路街道', '幸福路街道', 'xingfulujiedao', '659002', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('659002001', '金银川路街道', '金银川路街道', 'jinyinchuanlujiedao', '659002', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('659001200', '石河子乡', '石河子乡', 'shihezixiang', '659001', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('659001100', '北泉镇', '北泉镇', 'beiquanzhen', '659001', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('659001005', '东城街道', '东城街道', 'dongchengjiedao1', '659001', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('659001004', '老街街道', '老街街道', 'laojiejiedao', '659001', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('659001003', '红山街道', '红山街道', 'hongshanjiedao', '659001', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('659001002', '向阳街道', '向阳街道', 'xiangyangjiedao', '659001', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('659001001', '新城街道', '新城街道', 'xinchengjiedao', '659001', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('620201403', '长城区', '长城区', 'changchengqu', '620200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('620201402', '镜铁区', '镜铁区', 'jingtiequ', '620200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('620201401', '雄关区', '雄关区', 'xiongguanqu', '620200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('620201102', '文殊镇', '文殊镇', 'wenshuzhen', '620200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('620201101', '峪泉镇', '峪泉镇', 'yuquanzhen', '620200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('620201100', '新城镇', '新城镇', 'xinchengzhen', '620200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469030202', '什运乡', '什运乡', 'shiyunxiang', '469036', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469030201', '上安乡', '上安乡', 'shanganxiang', '469036', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469030200', '吊罗山乡', '吊罗山乡', 'diaoluoshanxiang', '469036', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469030106', '中平镇', '中平镇', 'zhongpingzhen', '469036', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469030105', '红毛镇', '红毛镇', 'hongmaozhen', '469036', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469030104', '长征镇', '长征镇', 'changzhengzhen', '469036', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469030103', '和平镇', '和平镇', 'hepingzhen', '469036', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469030102', '黎母山镇', '黎母山镇', 'limushanzhen', '469036', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469030101', '湾岭镇', '湾岭镇', 'wanlingzhen', '469036', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469030100', '营根镇', '营根镇', 'yinggenzhen', '469036', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469029202', '毛感乡', '毛感乡', 'maoganxiang', '469035', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469029201', '南林乡', '南林乡', 'nanlinxiang', '469035', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469029200', '六弓乡', '六弓乡', 'liugongxiang', '469035', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469029105', '三道镇', '三道镇', 'sandaozhen', '469035', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469029104', '新政镇', '新政镇', 'xinzhengzhen', '469035', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469029103', '响水镇', '响水镇', 'xiangshuizhen', '469035', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469029102', '加茂镇', '加茂镇', 'jiamaozhen', '469035', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469029101', '什玲镇', '什玲镇', 'shilingzhen', '469035', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469029100', '保城镇', '保城镇', 'baochengzhen', '469035', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469028201', '群英乡', '群英乡', 'qunyingxiang', '469034', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469028200', '提蒙乡', '提蒙乡', 'timengxiang', '469034', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469028108', '黎安镇', '黎安镇', 'lianzhen', '469034', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469028107', '新村镇', '新村镇', 'xincunzhen', '469034', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469028106', '本号镇', '本号镇', 'benhaozhen', '469034', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469028105', '文罗镇', '文罗镇', 'wenluozhen', '469034', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469028104', '隆广镇', '隆广镇', 'longguangzhen', '469034', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469028103', '英州镇', '英州镇', 'yingzhouzhen', '469034', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469028102', '三才镇', '三才镇', 'sancaizhen', '469034', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469028101', '光坡镇', '光坡镇', 'guangpozhen', '469034', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469028100', '椰林镇', '椰林镇', 'yelinzhen', '469034', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469027110', '莺歌海镇', '莺歌海镇', 'yinggehaizhen', '469033', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469027109', '尖峰镇', '尖峰镇', 'jianfengzhen', '469033', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469027108', '佛罗镇', '佛罗镇', 'fuluozhen', '469033', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469027107', '黄流镇', '黄流镇', 'huangliuzhen', '469033', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469027106', '利国镇', '利国镇', 'liguozhen', '469033', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469027105', '九所镇', '九所镇', 'jiusuozhen', '469033', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469027104', '千家镇', '千家镇', 'qianjiazhen', '469033', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469027103', '志仲镇', '志仲镇', 'zhizhongzhen', '469033', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469027102', '大安镇', '大安镇', 'daanzh', '469033', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469027101', '万冲镇', '万冲镇', 'wanchongzhen', '469033', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469027100', '抱由镇', '抱由镇', 'baoyouzhen', '469033', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469026200', '王下乡', '王下乡', 'wangxiaxiang', '469031', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469026106', '七叉镇', '七叉镇', 'qichazhen', '469031', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469026105', '海尾镇', '海尾镇', 'haiweizhen', '469031', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469026104', '昌化镇', '昌化镇', 'changhuazhen', '469031', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469026103', '乌烈镇', '乌烈镇', 'wuliezhen', '469031', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469026102', '十月田镇', '十月田镇', 'shiyuetianzhen', '469031', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469026101', '叉河镇', '叉河镇', 'chahezhen', '469031', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469026100', '石碌镇', '石碌镇', 'shiluzhen', '469031', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469025206', '荣邦乡', '荣邦乡', 'rongbangxiang', '469030', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469025205', '金波乡', '金波乡', 'jinboxiang', '469030', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469025204', '青松乡', '青松乡', 'qingsongxiang', '469030', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469025203', '阜龙乡', '阜龙乡', 'fulongxiang', '469030', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469025202', '南开乡', '南开乡', 'nankaixiang', '469030', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469025201', '元门乡', '元门乡', 'yuanmenxiang', '469030', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469025200', '细水乡', '细水乡', 'xishuixiang', '469030', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469025103', '打安镇', '打安镇', 'daanzhen', '469030', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469025102', '邦溪镇', '邦溪镇', 'bangxizhen', '469030', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469025101', '七坊镇', '七坊镇', 'qifangzhen', '469030', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469025100', '牙叉镇', '牙叉镇', 'yachazhen', '469030', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469024109', '调楼镇', '调楼镇', 'diaolouzhen', '469028', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469024108', '新盈镇', '新盈镇', 'xinyingzhen', '469028', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469024107', '南宝镇', '南宝镇', 'nanbaozhen', '469028', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469024106', '和舍镇', '和舍镇', 'heshezhen', '469028', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469024105', '多文镇', '多文镇', 'duowenzhen', '469028', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469024104', '皇桐镇', '皇桐镇', 'huangtongzhen', '469028', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469024103', '博厚镇', '博厚镇', 'bohouzhen', '469028', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469024102', '东英镇', '东英镇', 'dongyingzhen', '469028', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469024101', '波莲镇', '波莲镇', 'bolianzhen', '469028', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469024100', '临城镇', '临城镇', 'linchengzhen', '469028', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469023110', '大丰镇', '大丰镇', 'dafengzhen', '469027', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469023109', '桥头镇', '桥头镇', 'qtz', '469027', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469023108', '福山镇', '福山镇', 'fushanzhen', '469027', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469023107', '仁兴镇', '仁兴镇', 'renxingzhen', '469027', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469023106', '中兴镇', '中兴镇', 'xingzhen', '469027', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469023105', '文儒镇', '文儒镇', 'wenruzhen', '469027', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469023104', '加乐镇', '加乐镇', 'jialezhen', '469027', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469023103', '永发镇', '永发镇', 'yongfazhen', '469027', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469023102', '瑞溪镇', '瑞溪镇', 'ruixizhen', '469027', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469023101', '老城镇', '老城镇', 'laochengzhen', '469027', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469023100', '金江镇', '金江镇', 'jinjiangzhen', '469027', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469022107', '西昌镇', '西昌镇', 'xichangzhen', '469026', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469022106', '坡心镇', '坡心镇', 'poxinzhen', '469026', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469022105', '南坤镇', '南坤镇', 'nankunzhen', '469026', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469022104', '南吕镇', '南吕镇', 'nanlvzhen', '469026', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469022103', '乌坡镇', '乌坡镇', 'wupozhen', '469026', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469022102', '枫木镇', '枫木镇', 'fengmuzhen', '469026', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469022101', '新兴镇', '新兴镇', 'xinxingzhen', '469026', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469022100', '屯城镇', '屯城镇', 'tunchengzhen', '469026', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469021109', '富文镇', '富文镇', 'fuwenzhen', '469025', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469021108', '翰林镇', '翰林镇', 'hanlinzhen', '469025', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469021107', '岭口镇', '岭口镇', 'lingkouzhen', '469025', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469021106', '龙河镇', '龙河镇', 'longhezhen', '469025', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469021105', '龙门镇', '龙门镇', 'longmenzhen', '469025', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469021104', '雷鸣镇', '雷鸣镇', 'leimingzhen', '469025', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469021103', '黄竹镇', '黄竹镇', 'huangzhuzhen', '469025', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469021102', '龙湖镇', '龙湖镇', 'longhuzhen', '469025', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469021101', '新竹镇', '新竹镇', 'xinzhuzhen', '469025', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469021100', '定城镇', '定城镇', 'dingchengzhen', '469025', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469007500', '东方华侨农场', '东方华侨农场', 'dongfanghuaqiaonongchang', '469007', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469007201', '江边乡', '江边乡', 'jiangbianxiang', '469007', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469007200', '天安乡', '天安乡', 'tiananxiang', '469007', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469007107', '新龙镇', '新龙镇', 'xinlongzhen', '469007', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469007106', '四更镇', '四更镇', 'sigengzhen', '469007', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469007105', '三家镇', '三家镇', 'sanjiazhen', '469007', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469007104', '板桥镇', '板桥镇', 'banqiaozhen', '469007', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469007103', '感城镇', '感城镇', 'ganchengzhen', '469007', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469007102', '大田镇', '大田镇', 'datianzhen', '469007', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469007101', '东河镇', '东河镇', 'donghezhen', '469007', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469007100', '八所镇', '八所镇', 'basuozhen', '469007', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469006500', '兴隆华侨农场', '兴隆华侨农场', 'xinglonghuaqiaonongchang', '469006', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469006111', '三更罗镇', '三更罗镇', 'sangengluozhen', '469006', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469006110', '南桥镇', '南桥镇', 'nanqiaozhen', '469006', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469006109', '北大镇', '北大镇', 'beidazhen', '469006', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469006108', '山根镇', '山根镇', 'shangenzhen', '469006', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469006107', '长丰镇', '长丰镇', 'changfengzhen', '469006', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469006106', '礼纪镇', '礼纪镇', 'lijizhen', '469006', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469006105', '东澳镇', '东澳镇', 'dongaozhen', '469006', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469006104', '大茂镇', '大茂镇', 'damaozhen', '469006', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469006103', '后安镇', '后安镇', 'houanzhen', '469006', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469006102', '和乐镇', '和乐镇', 'helezhen', '469006', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469006101', '龙滚镇', '龙滚镇', 'longgunzhen', '469006', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469006100', '万城镇', '万城镇', 'wanchengzhen', '469006', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469005116', '公坡镇', '公坡镇', 'gongpozhen', '469005', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469005115', '铺前镇', '铺前镇', 'puqianzhen', '469005', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469005114', '锦山镇', '锦山镇', 'jinshanzhen', '469005', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469005113', '冯坡镇', '冯坡镇', 'fengpozhen', '469005', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469005112', '抱罗镇', '抱罗镇', 'baoluozhen', '469005', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469005111', '翁田镇', '翁田镇', 'wengtianzhen', '469005', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469005110', '昌洒镇', '昌洒镇', 'changsazhen', '469005', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469005109', '龙楼镇', '龙楼镇', 'longlouzhen', '469005', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469005108', '东郊镇', '东郊镇', 'dongjiaozhen', '469005', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469005107', '文教镇', '文教镇', 'wenjiaozhen', '469005', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469005106', '东阁镇', '东阁镇', 'donggezhen', '469005', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469005105', '潭牛镇', '潭牛镇', 'tanniuzhen', '469005', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469005104', '东路镇', '东路镇', 'dongluzhen', '469005', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469005103', '会文镇', '会文镇', 'huiwenzhen', '469005', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469005102', '蓬莱镇', '蓬莱镇', 'penglaizhen', '469005', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469005101', '重兴镇', '重兴镇', 'zhongxingzhen', '469005', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469005100', '文城镇', '文城镇', 'wenchengzhen', '469005', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469003500', '华南热作学院', '华南热作学院', 'huananrezuoxueyuan', '469003', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469003499', '洋浦经济开发区', '洋浦经济开发区', 'yangpujingjikaifaqu', '469003', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469003116', '新州镇', '新州镇', 'xinzhouzhen', '469003', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469003115', '东成镇', '东成镇', 'dongchengzhen', '469003', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469003114', '排浦镇', '排浦镇', 'paipuzhen', '469003', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469003113', '中和镇', '中和镇', 'zhonghezhen', '469003', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469003112', '白马井镇', '白马井镇', 'baimajingzhen', '469003', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469003111', '王五镇', '王五镇', 'wuzhen', '469003', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469003110', '三都镇', '三都镇', 'sanduzhen', '469003', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469003109', '峨蔓镇', '峨蔓镇', 'emanzhen', '469003', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469003108', '海头镇', '海头镇', 'haitouzhen', '469003', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469003107', '木棠镇', '木棠镇', 'mutangzhen', '469003', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469003106', '光村镇', '光村镇', 'guangcunzhen', '469003', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469003105', '兰洋镇', '兰洋镇', 'lanyangzhen', '469003', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469003104', '雅星镇', '雅星镇', 'yaxingzhen', '469003', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469003103', '大成镇', '大成镇', 'dachengzhen', '469003', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469003102', '南丰镇', '南丰镇', 'nanfengzhen', '469003', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469003101', '和庆镇', '和庆镇', 'heqingzhen', '469003', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469003100', '那大镇', '那大镇', 'nadazhen', '469003', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469002500', '彬村山华侨农场', '彬村山华侨农场', 'bincunshanhuaqiaonongchang', '469002', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469002111', '会山镇', '会山镇', 'huishanzhen', '469002', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469002110', '大路镇', '大路镇', 'daluzhen', '469002', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469002109', '长坡镇', '长坡镇', 'changpozhen', '469002', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469002108', '塔洋镇', '塔洋镇', 'tayangzhen', '469002', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469002107', '潭门镇', '潭门镇', 'tanmenzhen', '469002', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469002106', '龙江镇', '龙江镇', 'longjiangzhen', '469002', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469002105', '阳江镇', '阳江镇', 'yangjiangzhen', '469002', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469002104', '博鳌镇', '博鳌镇', 'boaozhen', '469002', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469002103', '中原镇', '中原镇', 'zhongyuanzhen', '469002', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469002102', '石壁镇', '石壁镇', 'shibizhen', '469002', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469002101', '万泉镇', '万泉镇', 'wanquanzhen', '469002', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469002100', '嘉积镇', '嘉积镇', 'jiajizhen', '469002', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469001202', '水满乡', '水满乡', 'shuimanxiang', '469001', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469001201', '毛道乡', '毛道乡', 'maodaoxiang', '469001', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469001200', '畅好乡', '畅好乡', 'changhaoxiang', '469001', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469001103', '番阳镇', '番阳镇', 'fanyangzhen', '469001', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469001102', '毛阳镇', '毛阳镇', 'maoyangzhen', '469001', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469001101', '南圣镇', '南圣镇', 'nanshengzhen', '469001', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('469001100', '通什镇', '通什镇', 'tongshizhen', '469001', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('460201452', '河东区街道', '河东区街道', 'hedongqujiedao', '460200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('460201451', '河西区街道', '河西区街道', 'hexiqujiedao', '460200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('460201105', '育才镇', '育才镇', 'yucaizhen', '460200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('460201104', '天涯镇', '天涯镇', 'tianyazhen', '460200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('460201103', '崖城镇', '崖城镇', 'yachengzhen', '460200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('460201102', '凤凰镇', '凤凰镇', 'fenghuangzhen', '460200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('460201101', '吉阳镇', '吉阳镇', 'jiyangzhen', '460200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('460201100', '海棠湾镇', '海棠湾镇', 'haitangwanzhen', '460200', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('442001117', '神湾镇', '神湾镇', 'shenwanzhen', '442000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('442001116', '大涌镇', '大涌镇', 'dayongzhen', '442000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('442001115', '板芙镇', '板芙镇', 'banfuzhen', '442000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('442001114', '三乡镇', '三乡镇', 'sanxiangzhen', '442000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('442001113', '南朗镇', '南朗镇', 'nanlangzhen', '442000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('442001112', '阜沙镇', '阜沙镇', 'fushazhen', '442000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('442001111', '南头镇', '南头镇', 'nantouzhen', '442000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('442001110', '横栏镇', '横栏镇', 'henglanzhen', '442000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('442001109', '三角镇', '三角镇', 'sanjiaozhen', '442000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('442001108', '港口镇', '港口镇', 'gangkouzhen', '442000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('442001107', '坦洲镇', '坦洲镇', 'tanzhouzhen', '442000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('442001106', '沙溪镇', '沙溪镇', 'shaxizhen', '442000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('442001105', '古镇镇', '古镇镇', 'guzhenzhen', '442000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('442001104', '东升镇', '东升镇', 'dongshengzhen', '442000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('442001103', '东凤镇', '东凤镇', 'dongfengzhen', '442000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('442001102', '民众镇', '民众镇', 'minzhongzhen', '442000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('442001101', '黄圃镇', '黄圃镇', 'huangpuzhen', '442000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('442001100', '小榄镇', '小榄镇', 'xiaolanzhen', '442000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('442001006', '五桂山街道', '五桂山街道', 'wuguishanjiedao', '442000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('442001005', '南区街道', '南区街道', 'nanqujiedao', '442000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('442001004', '西区街道', '西区街道', 'xiqujiedao', '442000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('442001003', '火炬开发区街道', '火炬开发区街道', 'huojukaifaqujiedao', '442000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('442001002', '东区街道', '东区街道', 'dongqujiedao', '442000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('442001001', '石岐区街道', '石岐区街道', 'shiqiqujiedao', '442000', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('441901403', '东莞生态园', '东莞生态园', 'dongguanshengtaiyuan', '441900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('441901402', '虎门港管委会', '虎门港管委会', 'humengangguanweihui', '441900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('441901401', '松山湖管委会', '松山湖管委会', 'songshanhuguanweihui', '441900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('441901129', '高埗镇', '高埗镇', 'gaozhen', '441900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('441901128', '中堂镇', '中堂镇', 'zhongtangzhen', '441900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('441901127', '望牛墩镇', '望牛墩镇', 'wangniudunzhen', '441900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('441901126', '麻涌镇', '麻涌镇', 'mayongzhen', '441900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('441901125', '洪梅镇', '洪梅镇', 'hongmeizhen', '441900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('441901124', '道滘镇', '道滘镇', 'daozhen', '441900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('441901123', '沙田镇', '沙田镇', 'shatianzhen', '441900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('441901122', '厚街镇', '厚街镇', 'houjiezhen', '441900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('441901121', '虎门镇', '虎门镇', 'humenzhen', '441900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('441901119', '长安镇', '长安镇', 'changanzhen', '441900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('441901118', '大岭山镇', '大岭山镇', 'dalingshanzhen', '441900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('441901117', '凤岗镇', '凤岗镇', 'fenggangzhen', '441900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('441901116', '塘厦镇', '塘厦镇', 'tangxiazhen', '441900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('441901115', '清溪镇', '清溪镇', 'qingxizhen', '441900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('441901114', '黄江镇', '黄江镇', 'huangjiangzhen', '441900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('441901113', '大朗镇', '大朗镇', 'dalangzhen', '441900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('441901112', '樟木头镇', '樟木头镇', 'zhangmutouzhen', '441900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('441901111', '寮步镇', '寮步镇', 'liaobuzhen', '441900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('441901110', '常平镇', '常平镇', 'changpingzhen', '441900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('441901109', '东坑镇', '东坑镇', 'dongkangzhen', '441900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('441901108', '谢岗镇', '谢岗镇', 'xiegangzhen', '441900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('441901107', '桥头镇', '桥头镇', 'qiaotouzhen1', '441900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('441901106', '横沥镇', '横沥镇', 'henglizhen', '441900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('441901105', '企石镇', '企石镇', 'qishizhen', '441900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('441901104', '石排镇', '石排镇', 'shipaizhen', '441900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('441901103', '茶山镇', '茶山镇', 'chashanzhen', '441900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('441901102', '石龙镇', '石龙镇', 'shilongzhen', '441900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('441901101', '石碣镇', '石碣镇', 'shijiezhen', '441900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('441901006', '莞城街道', '莞城街道', 'guanchengjiedao', '441900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('441901005', '万江街道', '万江街道', 'wanjiangjiedao', '441900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('441901004', '南城街道', '南城街道', 'nanchengjiedao', '441900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('441901003', '东城街道', '东城街道', 'dcjd', '441900', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('429021202', '下谷坪土家族乡', '下谷坪土家族乡', 'xiagupingtujiazuxiang', '429021', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('429021200', '宋洛乡', '宋洛乡', 'songluoxiang', '429021', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('429021105', '九湖镇', '九湖镇', 'jiuhuzhen', '429021', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('429021104', '新华镇', '新华镇', 'xinhuazhen', '429021', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('429021103', '红坪镇', '红坪镇', 'hongpingzhen', '429021', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('429021102', '木鱼镇', '木鱼镇', 'muyuzhen', '429021', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('429021101', '阳日镇', '阳日镇', 'yangrizhen', '429021', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('429021100', '松柏镇', '松柏镇', 'songbaizhen', '429021', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('429006452', '沉湖管委会', '沉湖管委会', 'chenhuguanweihui', '429006', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('429006451', '白茅湖农场', '白茅湖农场', 'baimaohunongchang', '429006', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('429006450', '蒋湖农场', '蒋湖农场', 'jianghunongchang', '429006', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('429006201', '净潭乡', '净潭乡', 'jingtanxiang', '429006', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('429006121', '佛子山镇', '佛子山镇', 'fuzishanzhen', '429006', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('429006120', '石河镇', '石河镇', 'shihezhen', '429006', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('429006119', '胡市镇', '胡市镇', 'hushizhen', '429006', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('429006118', '皂市镇', '皂市镇', 'zaoshizhen', '429006', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('429006116', '九真镇', '九真镇', 'jiuzhenzhen', '429006', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('429006115', '小板镇', '小板镇', 'xiaobanzhen', '429006', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('429006114', '卢市镇', '卢市镇', 'lushizhen', '429006', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('429006113', '马湾镇', '马湾镇', 'mawanzhen', '429006', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('429006112', '干驿镇', '干驿镇', 'ganyizhen', '429006', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('429006111', '多祥镇', '多祥镇', 'duoxiangzhen', '429006', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('429006110', '麻洋镇', '麻洋镇', 'mayangzhen', '429006', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('429006109', '彭市镇', '彭市镇', 'pengshizhen', '429006', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('429006108', '横林镇', '横林镇', 'henglinzhen', '429006', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('429006107', '岳口镇', '岳口镇', 'yuekouzhen', '429006', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('429006106', '黄潭镇', '黄潭镇', 'huangtanzhen', '429006', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('429006105', '渔薪镇', '渔薪镇', 'yuxinzhen', '429006', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('429006104', '汪场镇', '汪场镇', 'wcz', '429006', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('429006103', '蒋场镇', '蒋场镇', 'jiangchangzhen', '429006', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('429006102', '张港镇', '张港镇', 'zhanggangzhen', '429006', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('429006101', '拖市镇', '拖市镇', 'tuoshizhen', '429006', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('429006100', '多宝镇', '多宝镇', 'duobaozhen', '429006', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('429006003', '杨林街道', '杨林街道', 'yanglinjiedao', '429006', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('429006002', '侨乡街道开发区', '侨乡街道开发区', 'qiaoxiangjiedaokaifaqu', '429006', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('429006001', '竟陵街道', '竟陵街道', 'jinglingjiedao', '429006', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('429005457', '浩口原种场', '浩口原种场', 'haokouyuanzhongchang', '429005', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('429005455', '运粮湖管理区', '运粮湖管理区', 'yunlianghuguanliqu', '429005', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('429005454', '白鹭湖管理区', '白鹭湖管理区', 'bailuhuguanliqu', '429005', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('429005453', '总口管理区', '总口管理区', 'zongkouguanliqu', '429005', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('429005452', '熊口管理区', '熊口管理区', 'xiongkouguanliqu', '429005', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('429005451', '后湖管理区', '后湖管理区', 'houhuguanliqu', '429005', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('429005450', '周矶管理区', '周矶管理区', 'zhoujiguanliqu', '429005', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('429005401', '潜江经济开发区', '潜江经济开发区', 'qianjiangjingjikaifaqu', '429005', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('429005400', '江汉石油管理局', '江汉石油管理局', 'jianghanshiyouguanliju', '429005', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('429005109', '龙湾镇', '龙湾镇', 'longwanzhen', '429005', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('429005108', '张金镇', '张金镇', 'zhangjinzhen', '429005', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('429005107', '积玉口镇', '积玉口镇', 'jiyukouzhen', '429005', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('429005106', '浩口镇', '浩口镇', 'haokouzhen', '429005', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('429005105', '老新镇', '老新镇', 'laoxinzhen', '429005', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('429005104', '熊口镇', '熊口镇', 'xiongkouzhen', '429005', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('429005103', '高石碑镇', '高石碑镇', 'gaoshibeizhen', '429005', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('429005102', '王场镇', '王场镇', 'wangchangzhen', '429005', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('429005101', '渔洋镇', '渔洋镇', 'yuyangzhen', '429005', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('429005100', '竹根滩镇', '竹根滩镇', 'zhugentanzhen', '429005', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('429005006', '高场办事处', '高场办事处', 'gaochangbanshichu', '429005', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('429005005', '泰丰办事处', '泰丰办事处', 'taifengbanshichu', '429005', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('429005004', '广华办事处', '广华办事处', 'guanghuabanshichu', '429005', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('429005003', '周矶办事处', '周矶办事处', 'zhoujibanshichu', '429005', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('429005002', '杨市办事处', '杨市办事处', 'yangshibanshichu', '429005', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('429005001', '园林办事处', '园林办事处', 'yuanlinbanshichu', '429005', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('429004408', '排湖风景区', '排湖风景区', 'paihufengjingqu', '429004', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('429004407', '畜禽良种场', '畜禽良种场', 'xuqinliangzhongchang', '429004', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('429004405', '赵西垸林场', '赵西垸林场', 'zhaoxihuanlinchang', '429004', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('429004404', '五湖渔场', '五湖渔场', 'wuhuyuchang', '429004', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('429004402', '沙湖原种场', '沙湖原种场', 'shahuyuanzhongchang', '429004', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('429004401', '九合垸原种场', '九合垸原种场', 'jiuhehuanyuanzhongchang', '429004', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('429004400', '工业园区', '工业园区', 'gyyq', '429004', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('429004114', '陈场镇', '陈场镇', 'chenchangzhen', '429004', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('429004113', '通海口镇', '通海口镇', 'tonghaikouzhen', '429004', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('429004112', '沔城回族镇', '沔城回族镇', 'mianchenghuizuzhen', '429004', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('429004111', '郭河镇', '郭河镇', 'guohezhen', '429004', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('429004110', '张沟镇', '张沟镇', 'zhanggouzhen', '429004', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('429004109', '彭场镇', '彭场镇', 'pengchangzhen', '429004', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('429004108', '杨林尾镇', '杨林尾镇', 'yanglinweizhen', '429004', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('429004107', '沙湖镇', '沙湖镇', 'shahuzhen', '429004', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('429004106', '西流河镇', '西流河镇', 'xiliuhezhen', '429004', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('429004105', '长倘口镇', '长倘口镇', 'changthangkouzhen', '429004', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('429004104', '胡场镇', '胡场镇', 'huchangzhen', '429004', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('429004103', '三伏潭镇', '三伏潭镇', 'sanfutanzhen', '429004', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('429004102', '豆河镇', '豆河镇', 'douhezhen', '429004', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('429004101', '毛嘴镇', '毛嘴镇', 'maozuizhen', '429004', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('429004100', '郑场镇', '郑场镇', 'zhengchangzhen', '429004', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('429004003', '龙华山办事处', '龙华山办事处', 'longhuashanbanshichu', '429004', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('429004002', '干河街道', '干河街道', 'ganhejiedao', '429004', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('429004001', '沙嘴街道', '沙嘴街道', 'shazuijiedao', '429004', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('419001110', '下冶镇', '下冶镇', 'xiayezhen', '410881', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('419001109', '王屋镇', '王屋镇', 'wangwuzhen', '410881', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('419001108', '思礼镇', '思礼镇', 'silizhen', '410881', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('419001107', '大峪镇', '大峪镇', 'dayuzhen', '410881', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('419001106', '梨林镇', '梨林镇', 'lilinzhen', '410881', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('419001105', '坡头镇', '坡头镇', 'potouzhen', '410881', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('419001104', '邵原镇', '邵原镇', 'shaoyuanzhen', '410881', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('419001103', '承留镇', '承留镇', 'chengliuzhen', '410881', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('419001102', '轵城镇', '轵城镇', 'zhichengzhen', '410881', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('419001101', '五龙口镇', '五龙口镇', 'wulongkouzhen', '410881', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('419001100', '克井镇', '克井镇', 'kejingzhen', '410881', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('419001005', '玉泉街道', '玉泉街道', 'yuquanjiedao', '410881', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('419001004', '天坛街道', '天坛街道', 'tiantanjiedao', '410881', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('419001003', '北海街道', '北海街道', 'beihaijiedao', '410881', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('419001002', '济水街道', '济水街道', 'jishuijiedao', '410881', '0', '0', '0', '0', '0', '', '', '');
INSERT INTO `yunu_area` VALUES ('419001001', '沁园街道', '沁园街道', 'qinyuanjiedao', '410881', '0', '0', '0', '0', '0', '', '', '');

-- ----------------------------
-- Table structure for yunu_auth_group
-- ----------------------------
DROP TABLE IF EXISTS `yunu_auth_group`;
CREATE TABLE `yunu_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `title` char(100) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `catstatus` tinyint(1) DEFAULT '1' COMMENT '1权限赋予 0不赋予',
  `rules` varchar(1000) DEFAULT NULL,
  `catlist` varchar(1000) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yunu_auth_group
-- ----------------------------
INSERT INTO `yunu_auth_group` VALUES ('1', '超级管理员', '1', '1', '', '', '1446535750', '1522397948');
INSERT INTO `yunu_auth_group` VALUES ('13', '文章发布员', '1', '1', '1,2,7,116,137,138,176,123,3,163,164,171,189,11,165,166,172,186,117,144,145,146,147,148,177,178,229,230,231,232,118,119,120,142,143,173,139,140,141,175,170,216,218,217,219,220,221,222,223,226,121,149,150,161,174,167,168,169,127,6,135,185,9,125,126,179,128,131,132,183,129,133,134,184,136,153,159,160,154,155,156,157,158,180,181,182,188,190,191,192,193,194,195,196,197,198,199,200,201,202,203,204', '21,27,26,44,45,46,22,35,36,23,38,24,39,40,25,41,42,43,101,102,103', '1522399043', '1609222333');

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
INSERT INTO `yunu_auth_group_access` VALUES ('4', '8');
INSERT INTO `yunu_auth_group_access` VALUES ('5', '12');
INSERT INTO `yunu_auth_group_access` VALUES ('8', '13');
INSERT INTO `yunu_auth_group_access` VALUES ('9', '13');
INSERT INTO `yunu_auth_group_access` VALUES ('10', '1');

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
  `update_time` int(11) DEFAULT '0',
  `jumpurl` varchar(100) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=239 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yunu_auth_rule
-- ----------------------------
INSERT INTO `yunu_auth_rule` VALUES ('1', '#', '基础设置', '1', '1', 'fa fa-cog', '', '0', '1', '1446535750', '1588043486', null);
INSERT INTO `yunu_auth_rule` VALUES ('2', 'admin/system/basic', '网站信息', '1', '1', 'fa fa-cogs', '', '1', '1', '1446535750', '1639812218', '');
INSERT INTO `yunu_auth_rule` VALUES ('3', 'admin/category/index', '栏目设置', '1', '1', 'fa fa-th-large', '', '0', '3', '1446535750', '1588045283', null);
INSERT INTO `yunu_auth_rule` VALUES ('6', 'admin/data/index', '数据库管理', '1', '1', 'fa fa-database', '', '127', '5', '1446535750', '1502154059', null);
INSERT INTO `yunu_auth_rule` VALUES ('7', 'admin/url/index', 'URL静态化', '1', '1', 'fa fa-paste', '', '1', '5', '1446535750', '1588843612', null);
INSERT INTO `yunu_auth_rule` VALUES ('159', 'admin/diyfield/adddiyline', '新增分组线', '1', '0', '', '', '153', '8', '1502801140', '1502801140', null);
INSERT INTO `yunu_auth_rule` VALUES ('9', 'admin/menu/index', '菜单管理', '1', '1', 'fa fa-server', '', '127', '1', '1501834142', '1502800572', null);
INSERT INTO `yunu_auth_rule` VALUES ('11', 'admin/content/index', '内容管理', '1', '1', 'fa fa-edit', '', '0', '4', '1501834356', '1587887001', null);
INSERT INTO `yunu_auth_rule` VALUES ('160', 'admin/diyfield/editdiyline', '编辑分组线', '1', '0', '', '', '153', '9', '1502801188', '1502801188', null);
INSERT INTO `yunu_auth_rule` VALUES ('116', 'admin/banner/index', '幻灯片管理', '1', '1', 'fa fa-photo', '', '1', '4', '1501835145', '1587886893', null);
INSERT INTO `yunu_auth_rule` VALUES ('117', '#', '自定义块', '1', '1', 'fa fa-tag', '', '0', '2', '1501835395', '1588218493', null);
INSERT INTO `yunu_auth_rule` VALUES ('118', '#', 'SEO设置', '1', '1', 'fa fa-bar-chart', '', '0', '5', '1501835526', '1587887130', null);
INSERT INTO `yunu_auth_rule` VALUES ('119', 'admin/system/seo', '首页SEO', '1', '1', 'fa fa-adjust', '', '118', '1', '1501835598', '1587887139', null);
INSERT INTO `yunu_auth_rule` VALUES ('120', 'admin/link/index', '友情链接', '1', '1', 'fa fa-sitemap', '', '118', '2', '1501835776', '1501835813', null);
INSERT INTO `yunu_auth_rule` VALUES ('121', 'admin/area/index', '城市分站', '1', '1', 'fa fa-globe', '', '0', '6', '1501835925', '1587887248', null);
INSERT INTO `yunu_auth_rule` VALUES ('123', 'admin/wap/index', '手机站设置', '1', '1', 'fa fa-mobile', '', '1', '2', '1501836095', '1587886796', null);
INSERT INTO `yunu_auth_rule` VALUES ('167', 'admin/upgrade/index', '授权管理', '1', '1', 'fa fa-cloud-upload', '', '0', '12', '1505378826', '1587887388', null);
INSERT INTO `yunu_auth_rule` VALUES ('125', 'admin/menu/addrule', '新增菜单', '1', '0', '', '', '9', '2', '1501894012', '1501894012', null);
INSERT INTO `yunu_auth_rule` VALUES ('126', 'admin/menu/editrule', '编辑菜单', '1', '0', '', '', '9', '1', '1501895017', '1501895017', null);
INSERT INTO `yunu_auth_rule` VALUES ('127', '#', '系统管理', '1', '1', 'fa fa-tv', '', '0', '11', '1501895233', '1501895233', null);
INSERT INTO `yunu_auth_rule` VALUES ('128', 'admin/role/index', '角色管理', '1', '1', 'fa fa-id-badge', '', '127', '3', '1501895662', '1501895662', null);
INSERT INTO `yunu_auth_rule` VALUES ('129', 'admin/user/index', '管理员管理', '1', '1', 'fa fa-id-card', '', '127', '4', '1501895718', '1501895718', null);
INSERT INTO `yunu_auth_rule` VALUES ('131', 'admin/role/addrole', '新增角色', '1', '0', '', '', '128', '1', '1502074929', '1502074929', null);
INSERT INTO `yunu_auth_rule` VALUES ('132', 'admin/role/editrole', '编辑角色', '1', '0', '', '', '128', '2', '1502074953', '1502074953', null);
INSERT INTO `yunu_auth_rule` VALUES ('133', 'admin/user/adduser', '新增管理员', '1', '0', '', '', '129', '1', '1502099070', '1502099070', null);
INSERT INTO `yunu_auth_rule` VALUES ('134', 'admin/user/edituser', '编辑管理员', '1', '0', '', '', '129', '2', '1502099244', '1502099244', null);
INSERT INTO `yunu_auth_rule` VALUES ('135', 'admin/data/import', '数据库恢复', '1', '0', '', '', '6', '1', '1502158772', '1502158772', null);
INSERT INTO `yunu_auth_rule` VALUES ('136', 'admin/log/index', '日志管理', '1', '1', 'fa fa-map-o', '', '127', '8', '1502161451', '1502800493', null);
INSERT INTO `yunu_auth_rule` VALUES ('137', 'admin/banner/addbanner', '新增幻灯片', '1', '0', '', '', '116', '1', '1502351560', '1502351560', null);
INSERT INTO `yunu_auth_rule` VALUES ('138', 'admin/banner/editbanner', '编辑幻灯片', '1', '0', '', '', '116', '2', '1502351585', '1502351585', null);
INSERT INTO `yunu_auth_rule` VALUES ('139', 'admin/sitelink/index', '站内锚文本', '1', '1', 'fa fa-tag', '', '118', '3', '1502414966', '1502414966', null);
INSERT INTO `yunu_auth_rule` VALUES ('140', 'admin/sitelink/addsitelink', '新增站内锚文本', '1', '0', '', '', '139', '1', '1502421200', '1502421200', null);
INSERT INTO `yunu_auth_rule` VALUES ('141', 'admin/sitelink/editsitelink', '编辑站内锚文本', '1', '0', '', '', '139', '2', '1502421232', '1502421232', null);
INSERT INTO `yunu_auth_rule` VALUES ('142', 'admin/link/addlink', '新增友情链接', '1', '0', '', '', '120', '1', '1502421259', '1502421259', null);
INSERT INTO `yunu_auth_rule` VALUES ('143', 'admin/link/editlink', '编辑友情链接', '1', '0', '', '', '120', '2', '1502421283', '1502421283', null);
INSERT INTO `yunu_auth_rule` VALUES ('144', 'admin/block/addblock', '新增自定义块', '1', '0', '', '', '117', '6', '1502432100', '1502432100', null);
INSERT INTO `yunu_auth_rule` VALUES ('145', 'admin/block/editblock', '编辑自定义块', '1', '0', '', '', '117', '5', '1502432143', '1502432143', null);
INSERT INTO `yunu_auth_rule` VALUES ('146', 'admin/block/addcategory', '新增自定义块分类', '1', '0', '', '', '117', '8', '1502435132', '1502435132', null);
INSERT INTO `yunu_auth_rule` VALUES ('147', 'admin/block/editcategory', '编辑自定义块分类', '1', '0', '', '', '117', '9', '1502435163', '1502435163', null);
INSERT INTO `yunu_auth_rule` VALUES ('148', 'admin/block/category', '自定义块管理', '1', '0', '', '', '117', '4', '1502435194', '1588133016', null);
INSERT INTO `yunu_auth_rule` VALUES ('149', 'admin/area/addarea', '新增地区', '1', '0', '', '', '121', '1', '1502698791', '1502698791', null);
INSERT INTO `yunu_auth_rule` VALUES ('150', 'admin/area/editarea', '编辑地区', '1', '0', '', '', '121', '2', '1502698815', '1502698815', null);
INSERT INTO `yunu_auth_rule` VALUES ('153', 'admin/diymodel/index', '模型管理', '1', '1', 'fa fa-modx', '', '127', '2', '1502708524', '1502800581', null);
INSERT INTO `yunu_auth_rule` VALUES ('154', 'admin/diyfield/index', '字段管理', '1', '0', 'fa fa-code', '', '153', '4', '1502708623', '1502781468', null);
INSERT INTO `yunu_auth_rule` VALUES ('155', 'admin/diymodel/adddiymodel', '新增模型', '1', '0', '', '', '153', '1', '1502709642', '1502709642', null);
INSERT INTO `yunu_auth_rule` VALUES ('156', 'admin/diymodel/editdiymodel', '编辑模型', '1', '0', '', '', '153', '2', '1502709664', '1502709664', null);
INSERT INTO `yunu_auth_rule` VALUES ('157', 'admin/diyfield/adddiyfield', '新增自定义字段', '1', '0', '', '', '153', '5', '1502765914', '1502781428', null);
INSERT INTO `yunu_auth_rule` VALUES ('158', 'admin/diyfield/editdiyfield', '编辑自定义字段', '1', '0', '', '', '153', '6', '1502765934', '1502781450', null);
INSERT INTO `yunu_auth_rule` VALUES ('161', 'admin/area/statearea', '全局设置', '1', '0', '', '', '121', '4', '1502801715', '1506477056', null);
INSERT INTO `yunu_auth_rule` VALUES ('163', 'admin/category/addcategory', '新增栏目', '1', '0', '', '', '3', '1', '1502878827', '1502878827', null);
INSERT INTO `yunu_auth_rule` VALUES ('164', 'admin/category/editcategory', '编辑栏目', '1', '0', '', '', '3', '2', '1502878850', '1502878850', null);
INSERT INTO `yunu_auth_rule` VALUES ('165', 'admin/content/addcontent', '新增内容', '1', '0', '', '', '11', '1', '1503017703', '1503017703', null);
INSERT INTO `yunu_auth_rule` VALUES ('166', 'admin/content/editcontent', '编辑内容', '1', '0', '', '', '11', '2', '1503060259', '1503060259', null);
INSERT INTO `yunu_auth_rule` VALUES ('168', 'admin/upgrade/lists', '升级文件列表', '1', '0', '', '', '167', '1', '1505464242', '1505464242', null);
INSERT INTO `yunu_auth_rule` VALUES ('169', 'admin/upgrade/tpl', '模版更新列表', '1', '0', '', '', '167', '2', '1505804353', '1505804353', null);
INSERT INTO `yunu_auth_rule` VALUES ('170', 'admin/system/sitemap', '站点地图', '1', '1', 'fa fa-map', '', '118', '4', '1505984040', '1505984040', null);
INSERT INTO `yunu_auth_rule` VALUES ('171', 'admin/category/delcategory', '删除栏目', '1', '0', '', '', '3', '3', '1506476807', '1506476807', null);
INSERT INTO `yunu_auth_rule` VALUES ('172', 'admin/content/delContent', '删除内容', '1', '0', '', '', '11', '3', '1506476941', '1506476941', null);
INSERT INTO `yunu_auth_rule` VALUES ('173', 'admin/link/dellink', '删除友情链接', '1', '0', '', '', '120', '3', '1506476980', '1506476980', null);
INSERT INTO `yunu_auth_rule` VALUES ('174', 'admin/area/delarea', '删除地区', '1', '0', '', '', '121', '3', '1506477034', '1506477034', null);
INSERT INTO `yunu_auth_rule` VALUES ('175', 'admin/sitelink/delsitelink', '删除站内锚文本', '1', '0', '', '', '139', '3', '1506477271', '1506477271', null);
INSERT INTO `yunu_auth_rule` VALUES ('176', 'admin/banner/delbanner', '删除幻灯片', '1', '0', '', '', '116', '3', '1506477313', '1506477313', null);
INSERT INTO `yunu_auth_rule` VALUES ('177', 'admin/block/delblock', '删除自定义块', '1', '0', '', '', '117', '7', '1506477361', '1506477361', null);
INSERT INTO `yunu_auth_rule` VALUES ('178', 'admin/block/delcategory', '删除自定义块分类', '1', '0', '', '', '117', '10', '1506477420', '1506477420', null);
INSERT INTO `yunu_auth_rule` VALUES ('179', 'admin/menu/delrule', '删除菜单', '1', '0', '', '', '9', '3', '1506477447', '1506477447', null);
INSERT INTO `yunu_auth_rule` VALUES ('180', 'admin/diymodel/deldiymodel', '删除模型', '1', '0', '', '', '153', '3', '1506477529', '1506477529', null);
INSERT INTO `yunu_auth_rule` VALUES ('181', 'admin/diyfield/deldiyfield', '删除自定义字段', '1', '0', '', '', '153', '7', '1506477581', '1506477581', null);
INSERT INTO `yunu_auth_rule` VALUES ('182', 'admin/diyfield/deldiyline', '删除分组线', '1', '0', '', '', '153', '10', '1506477639', '1506477639', null);
INSERT INTO `yunu_auth_rule` VALUES ('183', 'admin/role/delrole', '删除角色', '1', '0', '', '', '128', '3', '1506477695', '1506477695', null);
INSERT INTO `yunu_auth_rule` VALUES ('184', 'admin/user/deluser', '删除管理员', '1', '0', '', '', '129', '3', '1506477730', '1506477730', null);
INSERT INTO `yunu_auth_rule` VALUES ('185', 'admin/data/export', '数据库备份', '1', '0', '', '', '6', '2', '1506477813', '1506477813', null);
INSERT INTO `yunu_auth_rule` VALUES ('186', 'admin/content/batchaddcontent', '批量添加内容', '1', '0', '', '', '11', '4', '1508902398', '1508902398', null);
INSERT INTO `yunu_auth_rule` VALUES ('188', 'admin/system/qiniu', '七牛云存储', '1', '1', 'fa fa-cloud-upload', '', '127', '7', '1515123371', '1588843678', null);
INSERT INTO `yunu_auth_rule` VALUES ('189', 'admin/category/batchaddcategory', '批量新增栏目', '1', '0', '', '', '3', '4', '1515135247', '1515135247', null);
INSERT INTO `yunu_auth_rule` VALUES ('190', 'admin/diyform/index', '留言管理', '1', '1', 'fa fa-commenting', '', '0', '7', '1515221696', '1588044019', null);
INSERT INTO `yunu_auth_rule` VALUES ('191', 'admin/diyform/adddiyform', '新增表单', '1', '0', '', '', '190', '1', '1515221766', '1515221766', null);
INSERT INTO `yunu_auth_rule` VALUES ('192', 'admin/diyform/editdiyform', '编辑表单', '1', '0', '', '', '190', '2', '1515221788', '1515221788', null);
INSERT INTO `yunu_auth_rule` VALUES ('193', 'admin/diyform/deldiyform', '删除表单', '1', '0', '', '', '190', '3', '1515221809', '1515221809', null);
INSERT INTO `yunu_auth_rule` VALUES ('194', 'admin/diyform/diyfield', '字段管理', '1', '0', '', '', '190', '4', '1515221879', '1515221879', null);
INSERT INTO `yunu_auth_rule` VALUES ('195', 'admin/diyform/adddiyfield', '新增表单字段', '1', '0', '', '', '190', '5', '1515221905', '1515221905', null);
INSERT INTO `yunu_auth_rule` VALUES ('196', 'admin/diyform/editdiyfield', '编辑表单字段', '1', '0', '', '', '190', '6', '1515221931', '1515221931', null);
INSERT INTO `yunu_auth_rule` VALUES ('197', 'admin/diyform/deldiyfield', '删除表单字段', '1', '0', '', '', '190', '7', '1515221950', '1515221950', null);
INSERT INTO `yunu_auth_rule` VALUES ('198', 'admin/diyform/content', '表单内容列表', '1', '0', '', '', '190', '8', '1515221988', '1515221988', null);
INSERT INTO `yunu_auth_rule` VALUES ('199', 'admin/diyform/delcontent', '删除表单内容', '1', '0', '', '', '190', '9', '1515222006', '1515222006', null);
INSERT INTO `yunu_auth_rule` VALUES ('200', 'admin/diyform/showcode', '查看表单代码', '1', '0', '', '', '190', '10', '1515222033', '1515222033', null);
INSERT INTO `yunu_auth_rule` VALUES ('201', 'admin/diyform/formcon', '表单内容', '1', '0', '', '', '190', '11', '1515550762', '1515550762', null);
INSERT INTO `yunu_auth_rule` VALUES ('202', 'admin/diyform/editformcon', '表单内容编辑', '1', '0', '', '', '190', '12', '1515550796', '1515550796', null);
INSERT INTO `yunu_auth_rule` VALUES ('203', 'admin/diyform/delformcon', '删除表单内容', '1', '0', '', '', '190', '13', '1515553802', '1515553802', null);
INSERT INTO `yunu_auth_rule` VALUES ('204', 'admin/diyform/remind', '表单提醒', '1', '0', '', '', '190', '14', '1516950644', '1516950644', null);
INSERT INTO `yunu_auth_rule` VALUES ('205', 'admin/system/interapi', 'API管理', '1', '1', 'fa fa-link', '', '0', '8', '1524031858', '1588043710', null);
INSERT INTO `yunu_auth_rule` VALUES ('206', '#', '运营推广', '1', '1', 'fa fa-table', '', '0', '10', '1532434395', '1587887356', null);
INSERT INTO `yunu_auth_rule` VALUES ('207', 'admin/datacount/baidutj', '百度统计', '1', '1', 'fa fa-bold', '', '206', '1', '1532434591', '1532434744', null);
INSERT INTO `yunu_auth_rule` VALUES ('208', 'admin/datacount/pmjkhq', '主词监控', '1', '1', 'fa fa-globe', '', '206', '2', '1532434669', '1532434669', null);
INSERT INTO `yunu_auth_rule` VALUES ('209', 'admin/system/upload', '上传设置', '1', '1', 'fa fa-upload', '', '1', '3', '1534483512', '1587886836', null);
INSERT INTO `yunu_auth_rule` VALUES ('210', 'admin/system/disablewords', '广告法禁用词', '1', '1', 'fa fa-window-close', '', '0', '9', '1535594802', '1587887339', null);
INSERT INTO `yunu_auth_rule` VALUES ('218', 'admin/redirecturl/editredirecturl', '编辑重定向', '1', '0', '', '', '216', '2', '1553499890', '1553499890', null);
INSERT INTO `yunu_auth_rule` VALUES ('215', 'admin/upload/filemanage', '站内资源管理', '1', '1', 'fa fa-file', '', '127', '6', '1553305641', '1553308645', null);
INSERT INTO `yunu_auth_rule` VALUES ('216', 'admin/redirecturl/index', 'URL重定向', '1', '1', 'fa fa-repeat', '', '118', '5', '1553499726', '1557818706', null);
INSERT INTO `yunu_auth_rule` VALUES ('217', 'admin/redirecturl/addredirecturl', '新增重定向', '1', '0', '', '', '216', '1', '1553499775', '1553499775', null);
INSERT INTO `yunu_auth_rule` VALUES ('219', 'admin/redirecturl/delredirecturl', '删除重定向', '1', '0', '', '', '216', '3', '1553499916', '1553499916', null);
INSERT INTO `yunu_auth_rule` VALUES ('220', 'admin/tagurl/index', 'TAG管理', '1', '1', 'fa fa-tags', '', '118', '6', '1553499726', '1556432499', null);
INSERT INTO `yunu_auth_rule` VALUES ('221', 'admin/tagurl/addtagurl', '新增TAG', '1', '0', '', '', '220', '1', '1553499775', '1553499775', null);
INSERT INTO `yunu_auth_rule` VALUES ('222', 'admin/tagurl/deltagurl', '删除TAG', '1', '0', '', '', '220', '4', '1553499916', '1553499916', null);
INSERT INTO `yunu_auth_rule` VALUES ('223', 'admin/tagurl/edittagurl', '编辑TAG', '1', '0', '', '', '220', '3', '1553499890', '1553499890', null);
INSERT INTO `yunu_auth_rule` VALUES ('224', 'admin/area/batchaddarea', '批量新增地区', '1', '0', '', '', '121', '5', '1561687777', '1561687777', null);
INSERT INTO `yunu_auth_rule` VALUES ('225', 'admin/upload/delfile', '文件删除', '1', '0', '', '', '215', '1', '1583911661', '1583911661', null);
INSERT INTO `yunu_auth_rule` VALUES ('226', 'admin/tagurl/batchaddtagurl', '批量新增TAG', '1', '0', '', '', '220', '2', '1586848821', '1586848821', null);
INSERT INTO `yunu_auth_rule` VALUES ('227', 'admin/tpl/index', '模板文件管理', '1', '1', 'fa fa-folder', '', '127', '7', '1587456861', '1618969902', null);
INSERT INTO `yunu_auth_rule` VALUES ('228', 'admin/category/editcategorycon', '编辑栏目内容', '1', '0', '', '', '3', '5', '1588059801', '1588059801', null);
INSERT INTO `yunu_auth_rule` VALUES ('229', 'admin/block/index', '自定义块管理列表', '1', '0', '', '', '117', '3', '1588140219', '1588229934', null);
INSERT INTO `yunu_auth_rule` VALUES ('230', 'admin/block/blocklist', '内容管理', '1', '1', '', '', '117', '2', '1588218531', '1588218864', null);
INSERT INTO `yunu_auth_rule` VALUES ('231', 'admin/block/category', '分类管理', '1', '1', '', '', '117', '1', '1588218579', '1588218924', null);
INSERT INTO `yunu_auth_rule` VALUES ('232', 'admin/block/saveblock', '更新自定义块', '1', '0', '', '', '117', '11', '1502432143', '1502432143', null);
INSERT INTO `yunu_auth_rule` VALUES ('234', 'admin/user/myuser', '我的帐户', '1', '1', '', '', '127', '0', '1606961317', '1606961317', null);
INSERT INTO `yunu_auth_rule` VALUES ('235', 'admin/security/index', '等保安全设置', '1', '1', '', '', '1', '6', '1626401352', '1626401352', null);
INSERT INTO `yunu_auth_rule` VALUES ('236', 'admin/plugins/index', '插件管理', '1', '1', 'fa fa-clone', '', '0', '8', '1632882209', '1632882209', null);
INSERT INTO `yunu_auth_rule` VALUES ('237', 'admin/plugins/manage', '插件管理', '1', '0', '', '', '236', '0', '1637806120', '1637806120', null);
INSERT INTO `yunu_auth_rule` VALUES ('238', 'admin/plugins/setting', '插件配置', '1', '0', '', '', '236', '0', '1637806151', '1637806151', null);

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
  `area` text,
  `desc` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yunu_banner
-- ----------------------------
INSERT INTO `yunu_banner` VALUES ('20', '11', '/uploads/image/20170929/c20ee6e4f167f19eb37754c6178d8f21.jpg', '', '#', '0', '2', '', null);
INSERT INTO `yunu_banner` VALUES ('19', '11', '/uploads/image/20170929/b6d3bf29720455ef16903e8689fcb4bb.jpg', '', '#', '0', '2', null, null);
INSERT INTO `yunu_banner` VALUES ('17', '11', '/uploads/image/20170929/eb242765015da7ac79987234e12b2d3c.jpg', '', '#', '0', '1', '', null);
INSERT INTO `yunu_banner` VALUES ('18', '22', '/uploads/image/20191029/f7e403e118c304f1f6d393f67fd93f50.jpg', '', '#', '0', '1', '', null);

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
  `url` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yunu_block
-- ----------------------------
INSERT INTO `yunu_block` VALUES ('46', '6', 'head_text1', 'SO BUILDING MATERIALS CO., LTD', '4', 'logo右边文字', '');
INSERT INTO `yunu_block` VALUES ('56', '6', 'head_text4', '<p class=\"pbottom\" id=\"pbottom\">\n      <strong>CHINA GREEN BUILDING MATERIALS INNOVATION BRAND</strong>\n      <b>为您提供<span>设计、生产、销售</span>一条龙解决方案</b>\n </p>\n <i id=\"fonts\">中国<em>绿色</em>建材创新品牌</i>', '1', 'banner文字', '');
INSERT INTO `yunu_block` VALUES ('48', '6', 'head_text2', '<p>专注环保建材<i>15</i>年！</p><span>扮靓世界 创新生活</span>', '1', 'logo右边文字', '');
INSERT INTO `yunu_block` VALUES ('49', '6', 'head_text3', '010-88888888 13888888888', '1', '全国服务热线', '');
INSERT INTO `yunu_block` VALUES ('50', '7', 'dizhi', '香港XXXXXX街XXX号XXX大厦XXXXX室', '1', '地址', '');
INSERT INTO `yunu_block` VALUES ('57', '7', 'dianhua', '010-12345678', '1', '电话', '');
INSERT INTO `yunu_block` VALUES ('58', '7', 'shouji', '13888888888', '1', '手机', '');
INSERT INTO `yunu_block` VALUES ('59', '7', 'email', '88888888@qq.com', '1', '邮箱', '');
INSERT INTO `yunu_block` VALUES ('51', '7', 'map', '<p><iframe width=\"100%\" height=\"272\" class=\"ueditor_baidumap\" src=\"/statics/ueditor/dialogs/map/show.html#center=116.404117,39.915228&zoom=18&width=100%&height=272&markers=116.404,39.915&markerStyles=l,A\" frameborder=\"0\"></iframe></p>', '3', '地图', '');
INSERT INTO `yunu_block` VALUES ('60', '8', 'qq', '123456789', '1', 'QQ号码', '');
INSERT INTO `yunu_block` VALUES ('53', '7', 'page_banner', '/uploads/image/20170929/943300e2cbbc41a477408155c6cc0120.jpg', '2', '内页banner', '');
INSERT INTO `yunu_block` VALUES ('54', '8', 'logo2', '/uploads/image/20191029/a0a25f0da58ca92e39ae251392ff45b3.png', '2', '底部logo', '');
INSERT INTO `yunu_block` VALUES ('55', '8', 'ewm', '/uploads/image/20191029/3053f417524e16254b0605b041c7b649.png', '2', '二维码', '');
INSERT INTO `yunu_block` VALUES ('66', '19', 'bdsq-code', '    <script> \n(function(){ \nvar src = \"https://jspassport.ssl.qhimg.com/11.0.1.js?d182b3f28525f2db83acfaaf6e696dba\"; \ndocument.write(\'<script src=\"\' + src + \'\" id=\"sozz\"><\\/script>\'); \n})(); \n</script> ', '1', '百度商桥代码', '');
INSERT INTO `yunu_block` VALUES ('67', '19', 'js-code', '<script> \nvar _hmt = _hmt || []; \n(function() { \n  var hm = document.createElement(\"script\"); \n  hm.src = \"https://hm.baidu.com/hm.js?6e6bc5b0f8269b76887df24b7a6a3a15\"; \n  var s = document.getElementsByTagName(\"script\")[0];  \n  s.parentNode.insertBefore(hm, s); \n})(); \n</script> ', '1', '第三方JS代码', '');
INSERT INTO `yunu_block` VALUES ('68', '19', 'tj-code', '<script> \nvar _hmt = _hmt || []; \n(function() { \n  var hm = document.createElement(\"script\"); \n  hm.src = \"https://hm.baidu.com/hm.js?3378adc515f9aee0d46c4e91c5f35d03\"; \n  var s = document.getElementsByTagName(\"script\")[0];  \n  s.parentNode.insertBefore(hm, s); \n})(); \n</script> ', '1', '网站统计代码', '');

-- ----------------------------
-- Table structure for yunu_block_category
-- ----------------------------
DROP TABLE IF EXISTS `yunu_block_category`;
CREATE TABLE `yunu_block_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL COMMENT '标题',
  `sort` int(11) DEFAULT NULL COMMENT '内容',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yunu_block_category
-- ----------------------------
INSERT INTO `yunu_block_category` VALUES ('6', '头部公共', '1');
INSERT INTO `yunu_block_category` VALUES ('7', '公共部分', '2');
INSERT INTO `yunu_block_category` VALUES ('8', '底部公共', '3');
INSERT INTO `yunu_block_category` VALUES ('19', '第三方代码', '5');

-- ----------------------------
-- Table structure for yunu_browse
-- ----------------------------
DROP TABLE IF EXISTS `yunu_browse`;
CREATE TABLE `yunu_browse` (
  `ip` varchar(15) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  `type` tinyint(1) DEFAULT '1' COMMENT '1PC 2手机'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

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
  `areatitle` tinyint(1) DEFAULT '1' COMMENT '0标题不显示地区 1标题显示地区',
  `areacontitle` tinyint(1) DEFAULT '1' COMMENT '1开启 0关闭',
  `catmainurl` tinyint(1) DEFAULT '0' COMMENT '栏目URL链接主站点1开始 0关闭',
  `conmainurl` tinyint(1) DEFAULT '0' COMMENT '内容URL链接主站点1开始 0关闭',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=104 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yunu_category
-- ----------------------------
INSERT INTO `yunu_category` VALUES ('27', '其他五金', 'qitawujin/pro1', '', '21', '34', '', '', '', '', '', '', 'list_product.html', 'show_product.html', '6', '1', '0', '1', '', '', '0', '1', '1', '1', '0', '0');
INSERT INTO `yunu_category` VALUES ('26', '五金配附件', 'wujinpeifujian', '', '21', '34', '', '', '', '', '', '', 'list_product.html', 'show_product.html', '5', '1', '0', '1', '', '', '0', '1', '1', '1', '0', '0');
INSERT INTO `yunu_category` VALUES ('20', '关于我们', 'guanyuwomen', 'ABOUT US', '0', '37', '', '', '', '', '@85', '', 'list_page.html', '', '1', '1', '1', '1', '<p>111</p>', '<p>222百度</p>', '1', '1', '1', '1', '0', '0');
INSERT INTO `yunu_category` VALUES ('91', '员工风采', 'yuangongfengcai', null, '84', '35', null, null, null, null, null, '', 'list_pic.html', '', '0', '1', '0', '1', null, null, '0', '0', '1', '1', '0', '0');
INSERT INTO `yunu_category` VALUES ('92', '企业展示', 'qiyezhanshi', null, '84', '35', null, null, null, null, null, '', 'list_pic.html', '', '0', '1', '0', '1', null, null, '0', '0', '1', '1', '0', '0');
INSERT INTO `yunu_category` VALUES ('21', '产品展示', 'pro', 'PRODUCT DISPLAY', '0', '34', '', '', '', '', '', '', 'list_product.html', 'show_product.html', '2', '1', '0', '1', '<p>某某有限公司位于美丽富饶的中国广东省深圳市松岗溪头工业区，主要从事精密模具开发及制造，专业冲压精密五金电子电器零配件等.产品已通过ISO--9001：2000国际标准品质体系认证，以满足各种客户的多层次需求，全体职员本着“以人为本，以质取胜，持续改进，永续经营”的企业生产理念，产品直销日本，美国，欧洲及东南亚其它国家。我们承诺：为客户提供价格合理，质量优良的产品及服务，以期提高市场的竞争力，成为你最值得信赖的供应商。主要产品：机箱，机蕊，汽车音箱，传真机，打印机，复印机，手机，摄像头,外壳及配件，各种精密端子，电子五金配件，各类五金弹片等。</p>', '', '0', '1', '1', '1', '0', '0');
INSERT INTO `yunu_category` VALUES ('22', '建筑装饰五金', 'jianzhuzhuangshiwujin', '', '21', '34', '', '', '', '', '', '', 'list_product.html', 'show_product.html', '1', '1', '0', '1', '<p>建筑五金建筑物或构筑物中装用的金属和非金属制品、配件的总称。一般具有实用和装饰双重效果。</p>', '', '0', '1', '0', '1', '0', '0');
INSERT INTO `yunu_category` VALUES ('23', '机械五金件', 'jixiewujinjian', '', '21', '34', '', '', '', '', '', '', 'list_product.html', 'show_product.html', '2', '1', '0', '1', '<p>五金：传统的五金制品，也称“小五金”。指金、银、铜、铁、锡五种金属。经人工加工可以制成刀、剑等艺术品或金属器件。现代社会的五金更为广泛，例如五金工具、五金零部件、日用五金、建筑五金以及安防用品等。小五金产品大都不是最终消费品。</p>', '', '0', '1', '1', '1', '0', '0');
INSERT INTO `yunu_category` VALUES ('24', '手动工具', 'shoudonggongju', '', '21', '34', '', '', '', '', '', '', 'list_product.html', 'show_product.html', '3', '1', '0', '1', '', '', '0', '1', '1', '1', '0', '0');
INSERT INTO `yunu_category` VALUES ('25', '电动工具', 'diandonggongju', '', '21', '34', '', '', '', '', '', '', 'list_product.html', 'show_product.html', '4', '1', '0', '1', '', '', '0', '1', '1', '1', '0', '0');
INSERT INTO `yunu_category` VALUES ('28', '新闻中心', 'news', 'NEWS CENTER', '0', '33', '', '', '', '', '', '', 'list_article.html', 'show_article.html', '3', '1', '0', '1', '', '', '0', '1', '1', '1', '0', '0');
INSERT INTO `yunu_category` VALUES ('29', '客户案例', 'kehuanli', 'CASES', '0', '35', '', '', '', '', '', '', 'list_case.html', 'show_case.html', '4', '1', '0', '1', '', '', '0', '1', '1', '1', '0', '0');
INSERT INTO `yunu_category` VALUES ('30', '联系我们', 'lianxiwomen', 'CONTACT US', '0', '37', '', '', '', '', '', '', 'list_page.html', '', '9', '1', '0', '1', '', '<p>TEL：010-12345678</p><p>MOB:13888888888&nbsp;</p><p>EMAIL：88888888@qq.com&nbsp;</p><p>公司地址：香港XXXXXX街XXX号XXX大厦XXXXX室&nbsp;</p><p>版权所有：某某建筑建材有限公司 ICP8888888</p><p><iframe class=\"ueditor_baidumap\" src=\"http://www.gjm.com/statics/ueditor/dialogs/map/show.html#center=116.39667,39.915221&zoom=14&width=100%&height=340&markers=116.404,39.915&markerStyles=l,A\" frameborder=\"0\" width=\"100%\" height=\"344\"></iframe></p>', '1', '1', '1', '1', '0', '0');
INSERT INTO `yunu_category` VALUES ('34', '荣誉证书', 'rongyuzhengshu', '', '84', '35', '/uploads/image/20170928/b28e4b51a2e99393fc66dac3b41cfdbf.jpg', '测试11荣誉证书SEO标题', '测试22荣誉证书SEO关键词', '测试33荣誉证书SEO描述', '', '', 'list_pic.html', '', '0', '1', '0', '1', '', '', '0', '1', '1', '1', '1', '1');
INSERT INTO `yunu_category` VALUES ('88', '公司新闻', 'gongsixinwen', null, '28', '33', null, null, null, null, null, '', 'list_article.html', 'show_article.html', '0', '1', '0', '1', null, null, '0', '0', '1', '1', '0', '0');
INSERT INTO `yunu_category` VALUES ('85', '公司简介', 'gongsijianjie', '', '20', '37', '/uploads/image/20191029/e545eeae61af4c9c7cf5654bd7aac10e.jpg', '', '', '', '', '', 'list_page.html', '', '0', '1', '0', '1', '<p>深圳市**科技有限公司位于美百度丽富饶的中国广东省深圳市松岗溪头工业区，主要从事精密模具开发及制造，专业冲压精密五金电子电器零配件等.产品已通过ISO--9001：2000国际标准品质体系认证，以满足各种客户的多层次需求，全体职员本着“以人为本，以质取胜，持续改进，永续经营”的企业生产理念，产品直销日本，美国，欧洲及东南亚其它国家。我们承诺：为客户提供价格合理，质量优良的产品及服务，以期提高市场的竞争力...</p>', '<p style=\"white-space: normal;\">深圳市**科技百度有限公司位于美百度丽富饶的中国广东省深圳市松岗溪头工业区，主要从事精密模具开发及制造，专业冲压精密五金电子电器零配件等.产品已通过ISO--9001：2000国际标准品质体系认证，以满足各种客户的多层次需求，全体职员本着“以人为本，以质取胜，持续改进，永续经营”的企业生产理念，产品直销日本，美国，欧洲及东南亚其它国家。我们承诺：为客户提供价格合理，质量优良的产品及服务，以期提高市场的竞争力，成为你最值得信赖的供应商。主要产品：机箱，机蕊，汽车音箱，传真机，打印机，复印机，手机，摄像头,外壳及配件，各种精密端子，电子五金配件，各类五金弹片等。<br/></p><p style=\"white-space: normal;\">创立于2000年， 经过多年的不懈努力，公司现已经成为一家专业从事IT产品开发、生产和销售的高科技企业。公司成立几年来，一直致力于工控/服务器机箱及各种非标箱体的开发与生产，产品现广泛应用于计算机网络、监控、安防、广电、通讯和仪器设备等多种行业，公司设计生产的多种标准及非标产品，成功地替代了多种进口产品，为用户极大地降低了成本，也为我们的民族事业做出了我们的一份贡献！</p><p style=\"white-space: normal;\">公司的主要产品大类别有：19″服务器机箱、工控机箱、网络机柜、服务器机柜、非标机柜、各种操作台、电视墙、非线性编辑台、配电柜（强弱电）、各种机箱。我们的产品结构合理，性能稳定可靠，品质优良，品种齐全。</p><p style=\"white-space: normal;\">公司拥有一批专业的工程设计人员，先进的生产设备及可靠的生产能力；我们崇尚先进的企业文化，追求先进的经营理念、管理理念和人才理念，树立团结和谐的大局观、诚实守信的道德观，坚持加强企业两个文明建设，内增员工凝聚力，外塑 企业良好形象 ，不断增强公司的核心竞争力。</p><p style=\"white-space: normal;\">公司将进一步依靠自身优势和雄厚的实力，发挥良好的品牌效应，坚持“以管理和技术的不断进步为顾客提供满意产品”的质量方针，竭力为国内外新老客户提供更优质的产品和服务</p><p style=\"white-space: normal;\">选择我们，就等于你自己办了一个加工厂！</p><p style=\"white-space: normal;\">展望未来，我们充满信心，因为在您的点击支持和合作下，令本公司的业务蒸蒸日上！ 诚邀各界人士光临指导！</p><p><br/></p>', '0', '0', '1', '1', '0', '0');
INSERT INTO `yunu_category` VALUES ('86', '企业文化', 'qiyewenhua', '', '20', '37', '', '', '', '', '', '', 'list_page.html', '', '0', '1', '0', '1', '', '<p>资料整理中...</p>', '0', '0', '1', '1', '0', '0');
INSERT INTO `yunu_category` VALUES ('87', '发展历程', 'fazhanlicheng', '', '20', '37', '', '', '', '', '', '', 'list_page.html', '', '0', '1', '0', '1', '', '<p>资料整理中...</p>', '0', '0', '1', '1', '0', '0');
INSERT INTO `yunu_category` VALUES ('89', '行业动态', 'xingyedongtai', null, '28', '33', null, null, null, null, null, '', 'list_article.html', 'show_article.html', '0', '1', '0', '1', null, null, '0', '0', '1', '1', '0', '0');
INSERT INTO `yunu_category` VALUES ('90', '常见问题', 'changjianwenti', null, '28', '33', null, null, null, null, null, '', 'list_article.html', 'show_article.html', '0', '1', '0', '1', null, null, '0', '0', '1', '1', '0', '0');
INSERT INTO `yunu_category` VALUES ('84', '企业相册', 'qiyexiangce', 'ENTERPRISE ALBUM', '0', '35', '', '', '', '', '', '', 'list_pic.html', '', '7', '1', '0', '1', '', '', '0', '1', '1', '1', '0', '0');
INSERT INTO `yunu_category` VALUES ('83', '产品栏目', 'chanpinlanmu', '', '21', '34', '', '', '', '', '', '', 'list_product.html', 'show_product.html', '0', '1', '0', '1', '', '', '0', '1', '1', '1', '0', '0');
INSERT INTO `yunu_category` VALUES ('68', '更多分站', 'map', '', '0', '37', '', '', '', '', '', '', 'list_map.html', '', '0', '1', '0', '0', '', '', '1', '1', '1', '1', '1', '1');
INSERT INTO `yunu_category` VALUES ('73', '在线留言', 'zaixianliuyan', '', '0', '37', '', '测试11在线留言SEO标题', '测试22在线留言SEO关键词', '测试33在线留言SEO描述', '', '', 'list_message.html', '', '8', '1', '0', '1', '', '', '1', '1', '1', '1', '0', '0');

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
  `area` text COMMENT '地区',
  `mainurl` tinyint(1) DEFAULT '0',
  `top` tinyint(1) DEFAULT NULL,
  `pic` varchar(100) DEFAULT NULL,
  `tag` varchar(500) DEFAULT NULL,
  `addcid` varchar(200) DEFAULT NULL,
  `tpl_show` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=203 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yunu_content
-- ----------------------------
INSERT INTO `yunu_content` VALUES ('164', '34', '35', '荣誉证书', null, null, '0', '7', '1', '1', '1572335209', '1572335234', '1', null, '', null, '', '0', '0', '/uploads/image/20191029/970203bedc6bb800e367b6b7774fabdd.png', null, null, null);
INSERT INTO `yunu_content` VALUES ('30', '29', '35', '案例1', '', '', '218', '1', '1', '1', '1506676928', '1639810978', '1', '', '', '', '', '1', '0', '/uploads/image/20170929/8c181da0f27dc6671dd5ec70453f9117.jpg', '', '', '');
INSERT INTO `yunu_content` VALUES ('31', '29', '35', '案例2', '', '', '220', '2', '2', '1', '1506676948', '1572404916', '1', '', '', '', '', '0', '0', '', '', null, null);
INSERT INTO `yunu_content` VALUES ('32', '29', '35', '案例3', '', '', '213', '3', '3', '1', '1506676980', '1572401379', '1', '', '', '', '', '0', '0', '/uploads/image/20170929/9288bda0cb4a34871cd1d91e58acd7ff.jpg', '', null, null);
INSERT INTO `yunu_content` VALUES ('33', '29', '35', '案例4', '', '', '221', '4', '4', '1', '1506677001', '1572401374', '1', '', '', '', '', '0', '0', '/uploads/image/20170929/c85b598ca28b7e8865c8d1ec9aae5dd9.jpg', '产品', null, null);
INSERT INTO `yunu_content` VALUES ('34', '29', '35', '案例5', '', '', '202', '5', '5', '1', '1506677039', '1572401365', '1', '', '', '', '', '0', '0', '/uploads/image/20170929/9d61483058cc825f4aafd6f3232132c6.jpg', '产品', null, null);
INSERT INTO `yunu_content` VALUES ('175', '88', '33', '天津工厂组织后备骨干军训活动', '', '', '120', '19', '0', '1', '1506677190', '1572336113', '1', '', '', '', ',88888888,110000,', '1', '0', '', '', null, null);
INSERT INTO `yunu_content` VALUES ('179', '88', '33', '天津工厂组织后备骨干军训活动', '', '', '117', '23', '0', '1', '1506677190', '1642041974', '1', '', '', '', ',88888888,110000,', '1', '0', '', '', '', '选择模板');
INSERT INTO `yunu_content` VALUES ('178', '88', '33', '五金配件的进口与国产之争', '', '', '138', '22', '0', '1', '1506677158', '1572336143', '1', '', '', '', ',,88888888,110000,,', '1', '0', '', '', null, null);
INSERT INTO `yunu_content` VALUES ('177', '88', '33', '五金检测中心获资格', '', '', '150', '21', '0', '1', '1506677508', '1572336143', '1', '', '', '', '', '1', '0', '', '五金,检测,中心', null, null);
INSERT INTO `yunu_content` VALUES ('183', '27', '34', 'JkLHF300-04', '', '', '136', '98', '7', '1', '1508143423', '1572338718', '1', '', '', '', '', '0', '0', '/uploads/image/20191029/d054042c87394228bba279cb6679f4dc.jpg', '', null, null);
INSERT INTO `yunu_content` VALUES ('180', '27', '34', 'JkLHF300-04', '', '', '119', '95', '10', '1', '1508143423', '1639810978', '1', '', '', '', '', '1', '0', '/uploads/image/20191029/369fb9a33980167af02b9d6c663a8aa5.jpg', '', '', '');
INSERT INTO `yunu_content` VALUES ('181', '27', '34', 'JkLHF300-04', '', '', '118', '96', '9', '1', '1508143423', '1572338658', '1', '', '', '', '', '0', '0', '/uploads/image/20171016/dbd60804281094cc1803e75f45f39cf3.jpg', '', null, null);
INSERT INTO `yunu_content` VALUES ('182', '27', '34', 'JkLHF300-04', '', '', '118', '97', '8', '1', '1508143423', '1572338769', '1', '', '', '', '', '0', '0', '/uploads/image/20191029/6726a4b2a547cba86cce24da535694ad.jpg', '', null, null);
INSERT INTO `yunu_content` VALUES ('186', '27', '34', 'JkLHF300-04', '', '', '150', '101', '4', '1', '1508143423', '1609918617', '1', '', '', '', '', '0', '0', '/uploads/image/20191029/88bc7851b8d96d6078361878f30e9f9f.jpg', '产品tag5', '', '选择模板');
INSERT INTO `yunu_content` VALUES ('187', '27', '34', 'JkLHF300', '', '', '119', '102', '3', '1', '1508143423', '1572399450', '1', '', '', '', '', '0', '0', '/uploads/image/20191029/d054042c87394228bba279cb6679f4dc.jpg', '产品tag4', null, '');
INSERT INTO `yunu_content` VALUES ('188', '27', '34', 'JkLHF300-04', '', '', '122', '103', '2', '1', '1508143423', '1572399444', '1', '', '', '', '', '0', '0', '/uploads/image/20171016/dbd60804281094cc1803e75f45f39cf3.jpg', '产品tag3', null, null);
INSERT INTO `yunu_content` VALUES ('189', '27', '34', 'JkLHF300-04', '', '', '142', '104', '1', '1', '1508143423', '1642665040', '1', '', '', '', '', '0', '0', '/uploads/image/20191029/9b59002a790e5aea822bbc1fdb568c19.jpg', '', '23,24', '选择模板');
INSERT INTO `yunu_content` VALUES ('173', '88', '33', '五金检测中心获资格', '', '', '151', '17', '0', '1', '1506677508', '1572336107', '1', '', '', '', '', '1', '0', '', '五金,检测,中心', null, null);
INSERT INTO `yunu_content` VALUES ('172', '88', '33', '天津工厂组织后备骨干军训活动', '', '', '112', '16', '0', '1', '1506677190', '1572336126', '1', '', '', '', ',,88888888,110000,,', '1', '0', '', '', null, null);
INSERT INTO `yunu_content` VALUES ('176', '88', '33', '天津工厂组织后备骨干军训活动', '', '', '112', '20', '0', '1', '1506677190', '1572336143', '1', '', '', '', ',88888888,110000,', '1', '0', '', '', null, null);
INSERT INTO `yunu_content` VALUES ('174', '88', '33', '五金配件的进口与国产之争', '', '', '140', '18', '0', '1', '1506677158', '1572336118', '1', '', '', '', ',,88888888,110000,,', '1', '0', '', '', null, null);
INSERT INTO `yunu_content` VALUES ('169', '34', '35', '荣誉证书', null, null, '0', '12', '1', '1', '1572335209', '1572335234', '1', null, null, null, '', '0', '0', '/uploads/image/20191029/8d35cee2d7b3e96bebb573141c8c3974.png', null, null, null);
INSERT INTO `yunu_content` VALUES ('168', '34', '35', '荣誉证书', '', '', '0', '11', '1', '1', '1572335209', '1639810978', '1', '', '', '', '', '1', '0', '/uploads/image/20191029/983d99d0add4cdb9a89c3feb9a3a1428.png', '', '', '');
INSERT INTO `yunu_content` VALUES ('167', '34', '35', '荣誉证书', null, null, '0', '10', '1', '1', '1572335209', '1572335234', '1', null, null, null, '', '0', '0', '/uploads/image/20191029/c9aff866c4451dfd2d95ac4bdf00af80.png', null, null, null);
INSERT INTO `yunu_content` VALUES ('166', '34', '35', '荣誉证书', null, null, '0', '9', '1', '1', '1572335209', '1572335234', '1', null, null, null, '', '0', '0', '/uploads/image/20191029/555c3048d3a02bcb11f98e5a9c67c19a.png', null, null, null);
INSERT INTO `yunu_content` VALUES ('165', '34', '35', '荣誉证书', null, null, '0', '8', '1', '1', '1572335209', '1572335234', '1', null, null, null, '', '0', '0', '/uploads/image/20191029/cd5004164953a66d74caa36cd0faabeb.png', null, null, null);
INSERT INTO `yunu_content` VALUES ('185', '27', '34', 'JkLHF300-04', '', '', '119', '100', '5', '1', '1508143423', '1572399461', '1', '', '', '', '', '0', '0', '/uploads/image/20191029/9b59002a790e5aea822bbc1fdb568c19.jpg', '产品tag6', null, null);
INSERT INTO `yunu_content` VALUES ('184', '27', '34', 'JkLHF300-04', '', '', '119', '99', '6', '1', '1508143423', '1572338679', '1', '', '', '', '', '0', '0', '/uploads/image/20171016/dbd60804281094cc1803e75f45f39cf3.jpg', '', null, null);
INSERT INTO `yunu_content` VALUES ('93', '27', '34', 'JkLHF300-04', '', '', '120', '56', '111', '1', '1508143423', '1572338748', '1', '', '', '', '', '0', '0', '/uploads/image/20191029/0601a98983de16d482a0f8781a50e4e8.jpg', '', null, null);

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
) ENGINE=MyISAM AUTO_INCREMENT=139 DEFAULT CHARSET=utf8;

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
INSERT INTO `yunu_diyfield` VALUES ('115', '1', '手机', 'phone', null, 'text', '', '1', '1', '3', '2', '255');
INSERT INTO `yunu_diyfield` VALUES ('126', '40', '产品多图', 'piclist', null, 'images', null, '1', '', '1', '1', '255');
INSERT INTO `yunu_diyfield` VALUES ('128', '40', '产品简介', 'desc', null, 'seditor', '', '0', '', '1', '2', '255');
INSERT INTO `yunu_diyfield` VALUES ('127', '40', 'linedqo', 'linevfi', null, '------', null, '0', '内容设置', '1', '7', null);
INSERT INTO `yunu_diyfield` VALUES ('120', '1', '你的留言', 'yuanwang', null, 'textarea', '', '0', '1', '3', '6', '255');
INSERT INTO `yunu_diyfield` VALUES ('121', '3', '姓名', 'username', null, 'text', '', '1', '', '3', '0', '255');
INSERT INTO `yunu_diyfield` VALUES ('122', '3', '留言内容', 'content', null, 'textarea', '', '1', '', '3', '0', '255');
INSERT INTO `yunu_diyfield` VALUES ('129', '40', '产品内容', 'content', null, 'editor', '', '1', '', '1', '8', '255');
INSERT INTO `yunu_diyfield` VALUES ('130', '40', 'linefsp', 'linepiw', null, '------', null, '0', '附加属性', '1', '3', null);
INSERT INTO `yunu_diyfield` VALUES ('131', '40', '品牌', 'brand', '大卫地板\n大自然地板\n久盛地板\n金象地板\n其他', 'select', null, '1', '', '1', '4', '255');
INSERT INTO `yunu_diyfield` VALUES ('132', '40', '类型', 'leixing', '实木地板\n复合地板\n强化地板\n竹木地板\n其他', 'select', null, '1', '', '1', '5', '255');
INSERT INTO `yunu_diyfield` VALUES ('133', '40', '颜色', 'color', '红色\n白色\n原木色\n复古\n其他', 'select', null, '1', '', '1', '6', '255');
INSERT INTO `yunu_diyfield` VALUES ('134', '1', '邮箱', 'email', null, 'text', '', '0', '1', '3', '0', '255');
INSERT INTO `yunu_diyfield` VALUES ('135', '1', '地址', 'dizhi', null, 'text', '', '0', '1', '3', '0', '255');
INSERT INTO `yunu_diyfield` VALUES ('136', '1', '产品标题', 'biaoti', null, 'text', '', '0', '1', '3', '0', '255');

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
  `mailadd` varchar(100) DEFAULT NULL,
  `mailtitle` varchar(100) DEFAULT NULL,
  `mailcontent` text,
  `telwarn` tinyint(1) DEFAULT '0',
  `yzcode` tinyint(1) DEFAULT '0',
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yunu_diyform
-- ----------------------------
INSERT INTO `yunu_diyform` VALUES ('1', '测试表单', 'demo', '测试表单', '0', 'gjm1018@qq.com', '%name%提交了新的留言', '<p>联系人：%name%</p><p><br/></p><p>手机号：%phone%<br/></p><p><br/></p><p>留言内容：%yuanwang%</p><p><br/></p>', '0', '1', '1');

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
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yunu_diymodel
-- ----------------------------
INSERT INTO `yunu_diymodel` VALUES ('33', '文章模型', 'article', '文章模型', '2', '1');
INSERT INTO `yunu_diymodel` VALUES ('34', '产品模型', 'product', '产品模型', '2', '2');
INSERT INTO `yunu_diymodel` VALUES ('35', '图片模型', 'image', '图片模型', '2', '3');
INSERT INTO `yunu_diymodel` VALUES ('37', '单页模型', 'page', '空模型', '2', '3');
INSERT INTO `yunu_diymodel` VALUES ('40', 'DIY产品', 'productdiy', '产品模型', '1', '2');

-- ----------------------------
-- Table structure for yunu_diy_article
-- ----------------------------
DROP TABLE IF EXISTS `yunu_diy_article`;
CREATE TABLE `yunu_diy_article` (
  `conid` int(10) NOT NULL AUTO_INCREMENT,
  `ftitle` varchar(255) DEFAULT '',
  `author` varchar(255) DEFAULT '',
  `desc` text,
  `content` longtext,
  PRIMARY KEY (`conid`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yunu_diy_article
-- ----------------------------
INSERT INTO `yunu_diy_article` VALUES ('22', '五金配件的进口与国产之争', '本站123', '', '<p>五金件是现代家具中非常关键的组成部分，别看个头小，在一定程度它却可以决定家具的功能和使用寿五金件是现代家具中非常关键的组成部分，别看个头小，在一定程度它却可以决定家具的功能和使用寿五金件是现代家具中非常关键的组成部分，别看个头小，在一定程度它却可以决定家具的功能和使用寿五金件是现代家具中非常关键的组成部分，别看个头小，在一定程度它却可以决定家具的功能和使用寿五金件是现代家具中非常关键的组成部分，别看个头小，在一定程度它却可以决定家具的功能和使用寿五金件是现代家具中非常关键的组成部分，别看个头小，在一定程度它却可以决定家具的功能和使用寿。</p>');
INSERT INTO `yunu_diy_article` VALUES ('21', '五金检测中心获资格 小榄锁具“锁”向无阻', '本站123', '', '<p>小榄镇在2004年便被授予“中国锁具出口基地”称号，然而小榄锁具在出口时，却要送到外地小榄镇在2004年便被授予“中国锁具出口基地”称号，然而小榄锁具在出口时，却要送到外地小榄镇在2004年便被授予“中国锁具出口基地”称号，然而小榄锁具在出口时，却要送到外地小榄镇在2004年便被授予“中国锁具出口基地”称号，然而小榄锁具在出口时，却要送到外地。</p>');
INSERT INTO `yunu_diy_article` VALUES ('18', '五金配件的进口与国产之争', '本站123', '', '<p>五金件是现代家具中非常关键的组成部分，别看个头小，在一定程度它却可以决定家具的功能和使用寿五金件是现代家具中非常关键的组成部分，别看个头小，在一定程度它却可以决定家具的功能和使用寿五金件是现代家具中非常关键的组成部分，别看个头小，在一定程度它却可以决定家具的功能和使用寿五金件是现代家具中非常关键的组成部分，别看个头小，在一定程度它却可以决定家具的功能和使用寿五金件是现代家具中非常关键的组成部分，别看个头小，在一定程度它却可以决定家具的功能和使用寿五金件是现代家具中非常关键的组成部分，别看个头小，在一定程度它却可以决定家具的功能和使用寿。</p>');
INSERT INTO `yunu_diy_article` VALUES ('19', '天津工厂组织后备骨干军训活动', '本站123', '', '<p>为加强员工体能锻炼，提升工作激情，天津工厂年初举行了为期20多天的后备骨干军训活动为加强员工体能锻炼，提升工作激情，天津工厂年初举行了为期20多天的后备骨干军训活动为加强员工体能锻炼，提升工作激情，天津工厂年初举行了为期20多天的后备骨干军训活动为加强员工体能锻炼，提升工作激情，天津工厂年初举行了为期20多天的后备骨干军训活动。</p>');
INSERT INTO `yunu_diy_article` VALUES ('20', '天津工厂组织后备骨干军训活动', '本站123', '', '<p>为加强员工体能锻炼，提升工作激情，天津工厂年初举行了为期20多天的后备骨干军训活动为加强员工体能锻炼，提升工作激情，天津工厂年初举行了为期20多天的后备骨干军训活动为加强员工体能锻炼，提升工作激情，天津工厂年初举行了为期20多天的后备骨干军训活动为加强员工体能锻炼，提升工作激情，天津工厂年初举行了为期20多天的后备骨干军训活动</p>');
INSERT INTO `yunu_diy_article` VALUES ('16', '天津工厂组织后备骨干军训活动', '本站123', '', '<p>为加强员工体能锻炼，提升工作激情，天津工厂年初举行了为期20多天的后备骨干军训活动为加强员工体能锻炼，提升工作激情，天津工厂年初举行了为期20多天的后备骨干军训活动为加强员工体能锻炼，提升工作激情，天津工厂年初举行了为期20多天的后备骨干军训活动为加强员工体能锻炼，提升工作激情，天津工厂年初举行了为期20多天的后备骨干军训活动</p>');
INSERT INTO `yunu_diy_article` VALUES ('17', '五金检测中心获资格 小榄锁具“锁”向无阻', '本站123', '', '<p>小榄镇在2004年便被授予“中国锁具出口基地”称号，然而小榄锁具在出口时，却要送到外地小榄镇在2004年便被授予“中国锁具出口基地”称号，然而小榄锁具在出口时，却要送到外地小榄镇在2004年便被授予“中国锁具出口基地”称号，然而小榄锁具在出口时，却要送到外地小榄镇在2004年便被授予“中国锁具出口基地”称号，然而小榄锁具在出口时，却要送到外地。</p>');
INSERT INTO `yunu_diy_article` VALUES ('23', '天津工厂组织后备骨干军训活动', '本站123', '', '<p>为加强员工体能锻炼，百度提升工作激情，天津工厂年初举行了为期20多天的后备骨干军训活动为加强员工体能锻炼，提升工作激情，天津工厂年初举行了为期20多天的后备骨干军训活动为加强员工体能锻炼，提升工作激情，天津工厂年初举行了为期20多天的后备骨干军训活动为加强员工体能锻炼，提升工作激情，天津工厂年初举行了为期20多天的后备骨干军训活动。</p>');

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
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yunu_diy_image
-- ----------------------------
INSERT INTO `yunu_diy_image` VALUES ('1', '', '', '<p>在护套工序生产过程中，由于操作工的工作责任心不强或操作失误，造成电缆头部在牵引时掉进水槽中或电缆在生产过程中未控制好电缆内外护套厚度及偏心，造成护套破洞后水进入电缆内部，如头部进水只能将头部进水电缆剪掉，影响电缆发货米数;如电缆中间由于护套</p>');
INSERT INTO `yunu_diy_image` VALUES ('2', '', '', '<p>在护套工序生产过程中，由于操作工的工作责任心不强或操作失误，造成电缆头部在牵引时掉进水槽中或电缆在生产过程中未控制好电缆内外护套厚度及偏心，造成护套破洞后水进入电缆内部，如头部进水只能将头部进水电缆剪掉，影响电缆发货米数;如电缆中间由于护套</p>');
INSERT INTO `yunu_diy_image` VALUES ('3', '', '', '<p>在护套工序生产过程中，由于操作工的工作责任心不强或操作失误，造成电缆头部在牵引时掉进水槽中或电缆在生产过程中未控制好电缆内外护套厚度及偏心，造成护套破洞后水进入电缆内部，如头部进水只能将头部进水电缆剪掉，影响电缆发货米数;如电缆中间由于护套</p>');
INSERT INTO `yunu_diy_image` VALUES ('4', '', '', '<p>在护套工序生产过程中，由于操作工的工作责任心不强或操作失误，造成电缆头部在牵引时掉进水槽中或电缆在生产过程中未控制好电缆内外护套厚度及偏心，造成护套破洞后水进入电缆内部，如头部进水只能将头部进水电缆剪掉，影响电缆发货米数;如电缆中间由于护套</p>');
INSERT INTO `yunu_diy_image` VALUES ('5', '', '', '<p>在护套工序生产过程中，由于操作工的工作责任心不强或操作失误，造成电缆头部在牵引时掉进水槽中或电缆在生产过程中未控制好电缆内外护套厚度及偏心，造成护套破洞后水进入电缆内部，如头部进水只能将头部进水电缆剪掉，影响电缆发货米数;如电缆中间由于护套...</p>');
INSERT INTO `yunu_diy_image` VALUES ('7', '', '', '');
INSERT INTO `yunu_diy_image` VALUES ('8', '', '', '');
INSERT INTO `yunu_diy_image` VALUES ('9', '', '', '');
INSERT INTO `yunu_diy_image` VALUES ('10', '', '', '');
INSERT INTO `yunu_diy_image` VALUES ('11', '', '', '');
INSERT INTO `yunu_diy_image` VALUES ('12', '', '', '');

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
) ENGINE=MyISAM AUTO_INCREMENT=117 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yunu_diy_product
-- ----------------------------
INSERT INTO `yunu_diy_product` VALUES ('95', '/uploads/image/20191029/e1ee8bce0bed57a60c908bd81db2a44a.jpg***/uploads/image/20191029/a2d67e010f85edb08fc290c709ad424b.jpg***/uploads/image/20191029/a712808ffb129eb59cc5893da80c2e08.jpg***/uploads/image/20191029/6d7956190816af10ac8e09cdabf4285e.jpg***', '<p>规格：不定（cm）&nbsp;</p><p>风格：中式现代&nbsp;</p><p>标准：马赛克&nbsp;</p><p>产地：浙江&nbsp;</p>', '<p>创立于2000年， 经过多年的不懈努力，公司现已经成为一家专业从事IT产品开发、生产和销售的高科技企业。公司成立几年来，一直致力于工控/服务器机箱及各种非标箱体的开发与生产，产品现广泛应用于计算机网络、监控、安防、广电、通讯和仪器设备等多种行业，公司设计生产的多种标准及非标产品，成功地替代了多种进口产品，为用户极大地降低了成本，也为我们的民族事业做出了我们的一份贡献！\n&nbsp;</p><p>公司的主要产品大类别有：19″服务器机箱、工控机箱、网络机柜、服务器机柜、非标机柜、各种操作台、电视墙、非线性编辑台、配电柜（强弱电）、各种机箱。我们的产品结构合理，性能稳定可靠，品质优良，品种齐全。</p>');
INSERT INTO `yunu_diy_product` VALUES ('98', '/uploads/image/20191029/e1ee8bce0bed57a60c908bd81db2a44a.jpg***/uploads/image/20191029/a2d67e010f85edb08fc290c709ad424b.jpg***/uploads/image/20191029/a712808ffb129eb59cc5893da80c2e08.jpg***/uploads/image/20191029/6d7956190816af10ac8e09cdabf4285e.jpg***', '<p>规格：不定（cm）&nbsp;</p><p>风格：中式现代&nbsp;</p><p>标准：马赛克&nbsp;</p><p>产地：浙江&nbsp;</p>', '<p>创立于2000年， 经过多年的不懈努力，公司现已经成为一家专业从事IT产品开发、生产和销售的高科技企业。公司成立几年来，一直致力于工控/服务器机箱及各种非标箱体的开发与生产，产品现广泛应用于计算机网络、监控、安防、广电、通讯和仪器设备等多种行业，公司设计生产的多种标准及非标产品，成功地替代了多种进口产品，为用户极大地降低了成本，也为我们的民族事业做出了我们的一份贡献！\n&nbsp;</p><p>公司的主要产品大类别有：19″服务器机箱、工控机箱、网络机柜、服务器机柜、非标机柜、各种操作台、电视墙、非线性编辑台、配电柜（强弱电）、各种机箱。我们的产品结构合理，性能稳定可靠，品质优良，品种齐全。</p>');
INSERT INTO `yunu_diy_product` VALUES ('56', '/uploads/image/20191029/e1ee8bce0bed57a60c908bd81db2a44a.jpg***/uploads/image/20191029/a2d67e010f85edb08fc290c709ad424b.jpg***/uploads/image/20191029/a712808ffb129eb59cc5893da80c2e08.jpg***/uploads/image/20191029/6d7956190816af10ac8e09cdabf4285e.jpg***', '<p>规格：不定（cm）&nbsp;</p><p>风格：中式现代&nbsp;</p><p>标准：马赛克&nbsp;</p><p>产地：浙江&nbsp;</p>', '<p>创立于2000年， 经过多年的不懈努力，公司现已经成为一家专业从事IT产品开发、生产和销售的高科技企业。公司成立几年来，一直致力于工控/服务器机箱及各种非标箱体的开发与生产，产品现广泛应用于计算机网络、监控、安防、广电、通讯和仪器设备等多种行业，公司设计生产的多种标准及非标产品，成功地替代了多种进口产品，为用户极大地降低了成本，也为我们的民族事业做出了我们的一份贡献！\n&nbsp;</p><p>公司的主要产品大类别有：19″服务器机箱、工控机箱、网络机柜、服务器机柜、非标机柜、各种操作台、电视墙、非线性编辑台、配电柜（强弱电）、各种机箱。我们的产品结构合理，性能稳定可靠，品质优良，品种齐全。</p>');
INSERT INTO `yunu_diy_product` VALUES ('96', '/uploads/image/20191029/e1ee8bce0bed57a60c908bd81db2a44a.jpg***/uploads/image/20191029/a2d67e010f85edb08fc290c709ad424b.jpg***/uploads/image/20191029/a712808ffb129eb59cc5893da80c2e08.jpg***/uploads/image/20191029/6d7956190816af10ac8e09cdabf4285e.jpg***', '<p>规格：不定（cm）&nbsp;</p><p>风格：中式现代&nbsp;</p><p>标准：马赛克&nbsp;</p><p>产地：浙江&nbsp;</p>', '<p>创立于2000年， 经过多年的不懈努力，公司现已经成为一家专业从事IT产品开发、生产和销售的高科技企业。公司成立几年来，一直致力于工控/服务器机箱及各种非标箱体的开发与生产，产品现广泛应用于计算机网络、监控、安防、广电、通讯和仪器设备等多种行业，公司设计生产的多种标准及非标产品，成功地替代了多种进口产品，为用户极大地降低了成本，也为我们的民族事业做出了我们的一份贡献！\n&nbsp;</p><p>公司的主要产品大类别有：19″服务器机箱、工控机箱、网络机柜、服务器机柜、非标机柜、各种操作台、电视墙、非线性编辑台、配电柜（强弱电）、各种机箱。我们的产品结构合理，性能稳定可靠，品质优良，品种齐全。</p>');
INSERT INTO `yunu_diy_product` VALUES ('97', '/uploads/image/20191029/e1ee8bce0bed57a60c908bd81db2a44a.jpg***/uploads/image/20191029/a2d67e010f85edb08fc290c709ad424b.jpg***/uploads/image/20191029/a712808ffb129eb59cc5893da80c2e08.jpg***/uploads/image/20191029/6d7956190816af10ac8e09cdabf4285e.jpg***', '<p>规格：不定（cm）&nbsp;</p><p>风格：中式现代&nbsp;</p><p>标准：马赛克&nbsp;</p><p>产地：浙江&nbsp;</p>', '<p>创立于2000年， 经过多年的不懈努力，公司现已经成为一家专业从事IT产品开发、生产和销售的高科技企业。公司成立几年来，一直致力于工控/服务器机箱及各种非标箱体的开发与生产，产品现广泛应用于计算机网络、监控、安防、广电、通讯和仪器设备等多种行业，公司设计生产的多种标准及非标产品，成功地替代了多种进口产品，为用户极大地降低了成本，也为我们的民族事业做出了我们的一份贡献！\n&nbsp;</p><p>公司的主要产品大类别有：19″服务器机箱、工控机箱、网络机柜、服务器机柜、非标机柜、各种操作台、电视墙、非线性编辑台、配电柜（强弱电）、各种机箱。我们的产品结构合理，性能稳定可靠，品质优良，品种齐全。</p>');
INSERT INTO `yunu_diy_product` VALUES ('99', '/uploads/image/20191029/e1ee8bce0bed57a60c908bd81db2a44a.jpg***/uploads/image/20191029/a2d67e010f85edb08fc290c709ad424b.jpg***/uploads/image/20191029/a712808ffb129eb59cc5893da80c2e08.jpg***/uploads/image/20191029/6d7956190816af10ac8e09cdabf4285e.jpg***', '<p>规格：不定（cm）&nbsp;</p><p>风格：中式现代&nbsp;</p><p>标准：马赛克&nbsp;</p><p>产地：浙江&nbsp;</p>', '<p>创立于2000年， 经过多年的不懈努力，公司现已经成为一家专业从事IT产品开发、生产和销售的高科技企业。公司成立几年来，一直致力于工控/服务器机箱及各种非标箱体的开发与生产，产品现广泛应用于计算机网络、监控、安防、广电、通讯和仪器设备等多种行业，公司设计生产的多种标准及非标产品，成功地替代了多种进口产品，为用户极大地降低了成本，也为我们的民族事业做出了我们的一份贡献！\n&nbsp;</p><p>公司的主要产品大类别有：19″服务器机箱、工控机箱、网络机柜、服务器机柜、非标机柜、各种操作台、电视墙、非线性编辑台、配电柜（强弱电）、各种机箱。我们的产品结构合理，性能稳定可靠，品质优良，品种齐全。</p>');
INSERT INTO `yunu_diy_product` VALUES ('100', '/uploads/image/20191029/e1ee8bce0bed57a60c908bd81db2a44a.jpg***/uploads/image/20191029/a2d67e010f85edb08fc290c709ad424b.jpg***/uploads/image/20191029/a712808ffb129eb59cc5893da80c2e08.jpg***/uploads/image/20191029/6d7956190816af10ac8e09cdabf4285e.jpg***', '<p>规格：不定（cm）&nbsp;</p><p>风格：中式现代&nbsp;</p><p>标准：马赛克&nbsp;</p><p>产地：浙江&nbsp;</p>', '<p>创立于2000年， 经过多年的不懈努力，公司现已经成为一家专业从事IT产品开发、生产和销售的高科技企业。公司成立几年来，一直致力于工控/服务器机箱及各种非标箱体的开发与生产，产品现广泛应用于计算机网络、监控、安防、广电、通讯和仪器设备等多种行业，公司设计生产的多种标准及非标产品，成功地替代了多种进口产品，为用户极大地降低了成本，也为我们的民族事业做出了我们的一份贡献！\n&nbsp;</p><p>公司的主要产品大类别有：19″服务器机箱、工控机箱、网络机柜、服务器机柜、非标机柜、各种操作台、电视墙、非线性编辑台、配电柜（强弱电）、各种机箱。我们的产品结构合理，性能稳定可靠，品质优良，品种齐全。</p>');
INSERT INTO `yunu_diy_product` VALUES ('101', '/uploads/image/20191029/e1ee8bce0bed57a60c908bd81db2a44a.jpg***/uploads/image/20191029/a2d67e010f85edb08fc290c709ad424b.jpg***/uploads/image/20191029/a712808ffb129eb59cc5893da80c2e08.jpg***/uploads/image/20191029/6d7956190816af10ac8e09cdabf4285e.jpg***', '<p>规格：不定（cm）&nbsp;</p><p>风格：中式现代&nbsp;</p><p>标准：马赛克&nbsp;</p><p>产地：浙江&nbsp;</p>', '<p>创立于2000年， 经过多年的不懈努力，公司现已经成为一家专业从事IT产品开发、生产和销售的高科技企业。公司成立几年来，一直致力于工控/服务器机箱及各种非标箱体的开发与生产，产品现广泛应用于计算机网络、监控、安防、广电、通讯和仪器设备等多种行业，公司设计生产的多种标准及非标产品，成功地替代了多种进口产品，为用户极大地降低了成本，也为我们的民族事业做出了我们的一份贡献！\n&nbsp;</p><p><img src=\"/uploads/image/20210106/1609913773479718.jpg\" title=\"1609913773479718.jpg\" alt=\"111.jpg\"/></p><p>公司的主要产品大类别有：19″服务器机箱、工控机箱、网络机柜、服务器机柜、非标机柜、各种操作台、电视墙、非线性编辑台、配电柜（强弱电）、各种机箱。我们的产品结构合理，性能稳定可靠，品质优良，品种齐全。</p>');
INSERT INTO `yunu_diy_product` VALUES ('102', '/uploads/image/20191029/e1ee8bce0bed57a60c908bd81db2a44a.jpg***/uploads/image/20191029/a2d67e010f85edb08fc290c709ad424b.jpg***/uploads/image/20191029/a712808ffb129eb59cc5893da80c2e08.jpg***/uploads/image/20191029/6d7956190816af10ac8e09cdabf4285e.jpg***', '<p>规格：不定（cm）&nbsp;</p><p>风格：中式现代&nbsp;</p><p>标准：马赛克&nbsp;</p><p>产地：浙江&nbsp;</p>', '<p>创立于2000年， 经过多年的不懈努力，公司现已经成为一家专业从事IT产品开发、生产和销售的高科技企业。公司成立几年来，一直致力于工控/服务器机箱及各种非标箱体的开发与生产，产品现广泛应用于计算机网络、监控、安防、广电、通讯和仪器设备等多种行业，公司设计生产的多种标准及非标产品，成功地替代了多种进口产品，为用户极大地降低了成本，也为我们的民族事业做出了我们的一份贡献！\n&nbsp;</p><p>公司的主要产品大类别有：19″服务器机箱、工控机箱、网络机柜、服务器机柜、非标机柜、各种操作台、电视墙、非线性编辑台、配电柜（强弱电）、各种机箱。我们的产品结构合理，性能稳定可靠，品质优良，品种齐全。</p>');
INSERT INTO `yunu_diy_product` VALUES ('103', '/uploads/image/20191029/e1ee8bce0bed57a60c908bd81db2a44a.jpg***/uploads/image/20191029/a2d67e010f85edb08fc290c709ad424b.jpg***/uploads/image/20191029/a712808ffb129eb59cc5893da80c2e08.jpg***/uploads/image/20191029/6d7956190816af10ac8e09cdabf4285e.jpg***', '<p>规格：不定（cm）&nbsp;</p><p>风格：中式现代&nbsp;</p><p>标准：马赛克&nbsp;</p><p>产地：浙江&nbsp;</p>', '<p>创立于2000年， 经过多年的不懈努力，公司现已经成为一家专业从事IT产品开发、生产和销售的高科技企业。公司成立几年来，一直致力于工控/服务器机箱及各种非标箱体的开发与生产，产品现广泛应用于计算机网络、监控、安防、广电、通讯和仪器设备等多种行业，公司设计生产的多种标准及非标产品，成功地替代了多种进口产品，为用户极大地降低了成本，也为我们的民族事业做出了我们的一份贡献！\n&nbsp;</p><p>公司的主要产品大类别有：19″服务器机箱、工控机箱、网络机柜、服务器机柜、非标机柜、各种操作台、电视墙、非线性编辑台、配电柜（强弱电）、各种机箱。我们的产品结构合理，性能稳定可靠，品质优良，品种齐全。</p>');
INSERT INTO `yunu_diy_product` VALUES ('104', '/uploads/image/20191029/e1ee8bce0bed57a60c908bd81db2a44a.jpg***/uploads/image/20191029/a2d67e010f85edb08fc290c709ad424b.jpg***/uploads/image/20191029/a712808ffb129eb59cc5893da80c2e08.jpg***/uploads/image/20191029/6d7956190816af10ac8e09cdabf4285e.jpg***', '<p>规格：不定（cm）&nbsp;</p><p>风格：中式现代&nbsp;</p><p>标准：马赛克&nbsp;</p><p>产地：浙江&nbsp;</p>', '<p>创立于2000年， 经过多年的不懈努力，公司现已经成为一家专业从事IT产品开发、生产和销售的高科技企业。公司成立几年来，一直致力于工控/服务器机箱及各种非标箱体的开发与生产，产品现广泛应用于计算机网络、监控、安防、广电、通讯和仪器设备等多种行业，公司设计生产的多种标准及非标产品，成功地替代了多种进口产品，为用户极大地降低了成本，也为我们的民族事业做出了我们的一份贡献！\n&nbsp;</p><p>公司的主要产品大类别有：19″服务器机箱、工控机箱、网络机柜、服务器机柜、非标机柜、各种操作台、电视墙、非线性编辑台、配电柜（强弱电）、各种机箱。我们的产品结构合理，性能稳定可靠，品质优良，品种齐全。</p>');

-- ----------------------------
-- Table structure for yunu_diy_productdiy
-- ----------------------------
DROP TABLE IF EXISTS `yunu_diy_productdiy`;
CREATE TABLE `yunu_diy_productdiy` (
  `conid` int(11) NOT NULL AUTO_INCREMENT,
  `piclist` text,
  `desc` text,
  `content` text,
  `brand` text,
  `leixing` text,
  `color` text,
  PRIMARY KEY (`conid`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yunu_diy_productdiy
-- ----------------------------

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
) ENGINE=MyISAM AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yunu_formcon
-- ----------------------------

-- ----------------------------
-- Table structure for yunu_form_demo
-- ----------------------------
DROP TABLE IF EXISTS `yunu_form_demo`;
CREATE TABLE `yunu_form_demo` (
  `conid` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT '',
  `phone` varchar(255) DEFAULT '',
  `yuanwang` text,
  `email` varchar(255) DEFAULT '',
  `dizhi` varchar(255) DEFAULT '',
  `biaoti` varchar(255) DEFAULT '',
  PRIMARY KEY (`conid`)
) ENGINE=MyISAM AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yunu_form_demo
-- ----------------------------

-- ----------------------------
-- Table structure for yunu_hook
-- ----------------------------
DROP TABLE IF EXISTS `yunu_hook`;
CREATE TABLE `yunu_hook` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `system` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '系统插件',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `source` varchar(50) NOT NULL DEFAULT '' COMMENT '钩子来源[plugins.插件名，module.模块名]',
  `intro` varchar(200) NOT NULL DEFAULT '' COMMENT '钩子简介',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of yunu_hook
-- ----------------------------
INSERT INTO `yunu_hook` VALUES ('1', '1', 'sys_index_install', '', '安装成功', '1', '1490885108', '1490885108');
INSERT INTO `yunu_hook` VALUES ('2', '1', 'sys_index_common', '', '前台公共', '1', '1490885108', '1490885108');
INSERT INTO `yunu_hook` VALUES ('3', '1', 'sys_index_index', '', '前台首页', '1', '1490885108', '1490885108');
INSERT INTO `yunu_hook` VALUES ('8', '1', 'sys_index_category', '', '前台栏目', '1', '1490885108', '1490885108');
INSERT INTO `yunu_hook` VALUES ('9', '1', 'sys_index_show', '', '前台详情', '1', '1490885108', '1490885108');
INSERT INTO `yunu_hook` VALUES ('10', '1', 'sys_index_myform', '', '表单提交', '1', '1490885108', '1490885108');
INSERT INTO `yunu_hook` VALUES ('11', '1', 'sys_admin_index', '', '后台首页', '1', '1490885108', '1490885108');
INSERT INTO `yunu_hook` VALUES ('12', '1', 'sys_admin_tips', '', '后台公共', '1', '1490885108', '1490885108');
INSERT INTO `yunu_hook` VALUES ('13', '1', 'sys_admin_update', '', '后台更新', '1', '1490885108', '1490885108');
INSERT INTO `yunu_hook` VALUES ('14', '1', 'sys_admin_upload', '', '后台上传', '1', '1490885108', '1490885108');
INSERT INTO `yunu_hook` VALUES ('15', '1', 'sys_admin_category', '', '后台栏目', '1', '1490885108', '1490885108');
INSERT INTO `yunu_hook` VALUES ('16', '1', 'sys_admin_content', '', '后台内容', '1', '1490885108', '1490885108');
INSERT INTO `yunu_hook` VALUES ('18', '1', 'sys_admin_login', '', '后台登陆', '1', '1490885108', '1490885108');

-- ----------------------------
-- Table structure for yunu_hook_plugins
-- ----------------------------
DROP TABLE IF EXISTS `yunu_hook_plugins`;
CREATE TABLE `yunu_hook_plugins` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `hook` varchar(32) NOT NULL COMMENT '钩子id',
  `plugins` varchar(32) NOT NULL COMMENT '插件标识',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0',
  `sort` int(11) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of yunu_hook_plugins
-- ----------------------------

-- ----------------------------
-- Table structure for yunu_link
-- ----------------------------
DROP TABLE IF EXISTS `yunu_link`;
CREATE TABLE `yunu_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL COMMENT '标题',
  `pic` varchar(200) DEFAULT '' COMMENT '图片',
  `url` varchar(200) DEFAULT NULL COMMENT '链接',
  `sort` smallint(6) DEFAULT '0' COMMENT '排序',
  `type` tinyint(1) DEFAULT '1' COMMENT '类型 1首页 2内页 3其他',
  `area` text,
  `create_time` int(11) DEFAULT NULL,
  `add_type` tinyint(1) DEFAULT '1' COMMENT '1主动添加 2自动添加',
  `site_exist` tinyint(1) DEFAULT '0' COMMENT '0不存在 1存在',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yunu_link
-- ----------------------------
INSERT INTO `yunu_link` VALUES ('5', '百度', '/uploads/image/20180409/40259f772670f77305630fb439260bea.jpg', 'http://www.baidu.com', '1', '1', '', '1558579836', '1', '0');

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
) ENGINE=MyISAM AUTO_INCREMENT=1654 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yunu_log
-- ----------------------------

-- ----------------------------
-- Table structure for yunu_plugins
-- ----------------------------
DROP TABLE IF EXISTS `yunu_plugins`;
CREATE TABLE `yunu_plugins` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL COMMENT '插件名称(英文)',
  `title` varchar(32) NOT NULL COMMENT '插件标题',
  `icon` varchar(100) NOT NULL COMMENT '图标',
  `intro` text NOT NULL COMMENT '插件简介',
  `author` varchar(32) NOT NULL COMMENT '作者',
  `version` varchar(16) NOT NULL DEFAULT '' COMMENT '版本号',
  `identifier` varchar(64) NOT NULL DEFAULT '' COMMENT '插件唯一标识符',
  `config` text NOT NULL COMMENT '插件配置',
  `app_keys` varchar(200) DEFAULT '' COMMENT '应用秘钥',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `systype` varchar(50) DEFAULT NULL,
  `systag` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of yunu_plugins
-- ----------------------------

-- ----------------------------
-- Table structure for yunu_redirecturl
-- ----------------------------
DROP TABLE IF EXISTS `yunu_redirecturl`;
CREATE TABLE `yunu_redirecturl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `source_url` varchar(200) DEFAULT NULL COMMENT '来源URL',
  `target_url` varchar(200) DEFAULT NULL COMMENT '目标URL',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=85 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yunu_redirecturl
-- ----------------------------

-- ----------------------------
-- Table structure for yunu_sitelink
-- ----------------------------
DROP TABLE IF EXISTS `yunu_sitelink`;
CREATE TABLE `yunu_sitelink` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `wapurl` varchar(255) DEFAULT NULL,
  `num` tinyint(5) DEFAULT '0',
  `otype` varchar(10) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否启用',
  `areapre` tinyint(1) DEFAULT '0' COMMENT '地区前缀',
  `color` varchar(7) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yunu_sitelink
-- ----------------------------
INSERT INTO `yunu_sitelink` VALUES ('16', '百度', '@20', '@20', '10', '_blank', '1', '1', '');

-- ----------------------------
-- Table structure for yunu_tagurl
-- ----------------------------
DROP TABLE IF EXISTS `yunu_tagurl`;
CREATE TABLE `yunu_tagurl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tagname` varchar(200) DEFAULT NULL COMMENT '名称',
  `tagurl` varchar(200) DEFAULT NULL COMMENT 'URL',
  `seo_title` varchar(200) DEFAULT NULL,
  `seo_keywords` varchar(200) DEFAULT NULL,
  `seo_description` varchar(500) DEFAULT NULL,
  `click` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yunu_tagurl
-- ----------------------------
INSERT INTO `yunu_tagurl` VALUES ('53', '检测', 'jiance', null, null, null, '0');
INSERT INTO `yunu_tagurl` VALUES ('52', '五金', 'wujin', null, null, null, '0');
INSERT INTO `yunu_tagurl` VALUES ('51', '产品tag6', 'chanpintag6', null, null, null, '0');
INSERT INTO `yunu_tagurl` VALUES ('50', '产品tag5', 'chanpintag5', null, null, null, '0');
INSERT INTO `yunu_tagurl` VALUES ('49', '产品tag4', 'chanpintag4', null, null, null, '0');
INSERT INTO `yunu_tagurl` VALUES ('48', '产品tag3', 'chanpintag3', null, null, null, '0');
INSERT INTO `yunu_tagurl` VALUES ('46', '中心', 'zhongxin', null, null, null, '0');
INSERT INTO `yunu_tagurl` VALUES ('54', '产品', 'chanpin', '', '', '', '1');
