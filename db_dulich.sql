/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : db_dulich

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2019-12-10 02:21:32
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tbl_album
-- ----------------------------
DROP TABLE IF EXISTS `tbl_album`;
CREATE TABLE `tbl_album` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) DEFAULT NULL,
  `code` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `thumb` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `intro` text COLLATE utf8_unicode_ci NOT NULL,
  `cdate` datetime NOT NULL,
  `visited` int(11) DEFAULT '0',
  `order` tinyint(5) DEFAULT NULL,
  `isactive` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tbl_album
-- ----------------------------
INSERT INTO `tbl_album` VALUES ('8', '0', 'thu-vien-anh', '', 'Thư viện ảnh', '', '2019-07-14 17:27:09', '5', null, '1');

-- ----------------------------
-- Table structure for tbl_booking
-- ----------------------------
DROP TABLE IF EXISTS `tbl_booking`;
CREATE TABLE `tbl_booking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) DEFAULT NULL,
  `code` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `thumb` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `intro` text COLLATE utf8_unicode_ci NOT NULL,
  `cdate` datetime NOT NULL,
  `visited` int(11) DEFAULT '0',
  `order` tinyint(5) DEFAULT NULL,
  `isactive` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tbl_booking
-- ----------------------------
INSERT INTO `tbl_booking` VALUES ('8', '0', 'thu-vien-anh', '', 'Thư viện ảnh', '', '2019-07-14 17:27:09', '5', null, '1');

-- ----------------------------
-- Table structure for tbl_boxes
-- ----------------------------
DROP TABLE IF EXISTS `tbl_boxes`;
CREATE TABLE `tbl_boxes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL DEFAULT '0',
  `type` int(11) DEFAULT NULL COMMENT 'inbox=1 | outbox=2 | draft=0 | trash=-1',
  `from` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `to` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bcc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8_unicode_ci,
  `encoding` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `subject_encoding` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `size` double DEFAULT NULL COMMENT 'Dung lượng',
  `attachment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Đính kèm',
  `priority` int(11) DEFAULT NULL COMMENT 'Mức độ ưu tiên',
  `viewed` int(11) DEFAULT '0' COMMENT 'not view = 0 | viewed = 1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tbl_boxes
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_catalog
-- ----------------------------
DROP TABLE IF EXISTS `tbl_catalog`;
CREATE TABLE `tbl_catalog` (
  `cat_id` int(11) NOT NULL AUTO_INCREMENT,
  `par_id` int(11) NOT NULL,
  `alias` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `meta_title` text COLLATE utf8_unicode_ci,
  `meta_key` text COLLATE utf8_unicode_ci,
  `meta_desc` text COLLATE utf8_unicode_ci,
  `order` int(11) NOT NULL DEFAULT '0',
  `isactive` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`cat_id`),
  KEY `idx_active` (`isactive`),
  KEY `idx_par` (`par_id`),
  KEY `idx_alias` (`alias`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tbl_catalog
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_categories
-- ----------------------------
DROP TABLE IF EXISTS `tbl_categories`;
CREATE TABLE `tbl_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `par_id` int(11) NOT NULL DEFAULT '0',
  `type_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `thumb` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `intro` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_title` text COLLATE utf8_unicode_ci,
  `meta_key` text COLLATE utf8_unicode_ci,
  `meta_desc` text COLLATE utf8_unicode_ci,
  `order` int(11) DEFAULT '0',
  `lag_id` int(11) DEFAULT '0',
  `isactive` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=MyISAM AUTO_INCREMENT=76 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tbl_categories
-- ----------------------------
INSERT INTO `tbl_categories` VALUES ('67', '0', '1', 'Bán đất nền dự án', 'ban-dat-nen-du-an', '', '', null, null, null, '0', '0', '1');
INSERT INTO `tbl_categories` VALUES ('69', '0', '1', 'Bán đất 50 năm', 'ban-dat-50-nam', '', '', null, null, null, '0', '0', '1');
INSERT INTO `tbl_categories` VALUES ('70', '0', '1', 'Bán đất thổ cư nhà vườn', 'ban-dat-tho-cu-nha-vuon', '', '', null, null, null, '0', '0', '1');
INSERT INTO `tbl_categories` VALUES ('68', '0', '1', 'Bán đất', 'ban-dat', '', '', null, null, null, '0', '0', '1');
INSERT INTO `tbl_categories` VALUES ('71', '0', '1', 'Bán trang trại, khu nghỉ dưỡng', 'ban-trang-trai-khu-nghi-duong', '', '', null, null, null, '0', '0', '1');
INSERT INTO `tbl_categories` VALUES ('72', '0', '1', 'Bán nhà xưởng, đất doanh nghiệp', 'ban-nha-xuong-dat-doanh-nghiep', '', '', null, null, null, '0', '0', '1');
INSERT INTO `tbl_categories` VALUES ('73', '0', '1', 'Bán loại bất động sản khác', 'ban-loai-bat-dong-san-khac', '', '', null, null, null, '0', '0', '1');
INSERT INTO `tbl_categories` VALUES ('74', '0', '2', 'Cho thuê kho, nhà xưởng, đất', 'cho-thue-kho-nha-xuong-dat', '', '', null, null, null, '0', '0', '1');
INSERT INTO `tbl_categories` VALUES ('75', '0', '2', 'Cho thuê loại bất động sản khác', 'cho-thue-loai-bat-dong-san-khac', '', '', null, null, null, '0', '0', '1');

-- ----------------------------
-- Table structure for tbl_category
-- ----------------------------
DROP TABLE IF EXISTS `tbl_category`;
CREATE TABLE `tbl_category` (
  `cat_id` int(11) NOT NULL AUTO_INCREMENT,
  `par_id` int(11) NOT NULL DEFAULT '0',
  `isactive` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`cat_id`)
) ENGINE=MyISAM AUTO_INCREMENT=67 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tbl_category
-- ----------------------------
INSERT INTO `tbl_category` VALUES ('1', '0', '1');
INSERT INTO `tbl_category` VALUES ('31', '31', '1');
INSERT INTO `tbl_category` VALUES ('32', '0', '1');
INSERT INTO `tbl_category` VALUES ('42', '42', '1');
INSERT INTO `tbl_category` VALUES ('44', '0', '1');
INSERT INTO `tbl_category` VALUES ('48', '0', '1');
INSERT INTO `tbl_category` VALUES ('51', '0', '1');
INSERT INTO `tbl_category` VALUES ('66', '0', '1');

-- ----------------------------
-- Table structure for tbl_category_text
-- ----------------------------
DROP TABLE IF EXISTS `tbl_category_text`;
CREATE TABLE `tbl_category_text` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cat_id` int(11) DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_title` text COLLATE utf8_unicode_ci,
  `meta_key` text COLLATE utf8_unicode_ci,
  `meta_desc` text COLLATE utf8_unicode_ci,
  `lag_id` int(11) DEFAULT '0',
  `isactive` int(11) DEFAULT '1',
  `alias` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `alias` (`alias`),
  KEY `FK_tbl_category_text` (`cat_id`)
) ENGINE=MyISAM AUTO_INCREMENT=63 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tbl_category_text
-- ----------------------------
INSERT INTO `tbl_category_text` VALUES ('31', '31', 'Thông Tin Về Chúng Tôi', '', '', '', '0', '1', 'thong-tin-ve-chung-toi');
INSERT INTO `tbl_category_text` VALUES ('41', '42', 'Cầm Đồ Sim', '', '', '', '0', '1', 'cam-do-sim');
INSERT INTO `tbl_category_text` VALUES ('62', '66', 'Tin Tức', '', '', '', '0', '1', 'tin-tuc');

-- ----------------------------
-- Table structure for tbl_city
-- ----------------------------
DROP TABLE IF EXISTS `tbl_city`;
CREATE TABLE `tbl_city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `order` int(11) DEFAULT '0',
  `isactive` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_city
-- ----------------------------
INSERT INTO `tbl_city` VALUES ('1', 'Hà Nội', '100', '1');
INSERT INTO `tbl_city` VALUES ('28', 'Hòa Bình', '99', '1');
INSERT INTO `tbl_city` VALUES ('56', 'Thanh Hóa', '0', '1');

-- ----------------------------
-- Table structure for tbl_configsite
-- ----------------------------
DROP TABLE IF EXISTS `tbl_configsite`;
CREATE TABLE `tbl_configsite` (
  `config_id` int(11) NOT NULL AUTO_INCREMENT,
  `tem_id` int(11) DEFAULT NULL,
  `company_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `intro` longtext COLLATE utf8_unicode_ci,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tel` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `fax` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `banner` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logo` text COLLATE utf8_unicode_ci,
  `meta_keyword` longtext COLLATE utf8_unicode_ci,
  `meta_descript` longtext COLLATE utf8_unicode_ci,
  `lang_id` int(11) NOT NULL DEFAULT '0',
  `contact` text COLLATE utf8_unicode_ci NOT NULL,
  `footer` text COLLATE utf8_unicode_ci NOT NULL,
  `nick_yahoo` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `name_yahoo` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `skype1` varchar(70) COLLATE utf8_unicode_ci NOT NULL,
  `skype2` varchar(70) COLLATE utf8_unicode_ci NOT NULL,
  `twitter` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `gplus` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `facebook` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `youtube` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tbl_configsite
-- ----------------------------
INSERT INTO `tbl_configsite` VALUES ('1', '0', 'DATHOABINH.INFO', 'DATHOABINH.INFO |  Mua Bán Bất Động Sản Tây Hà Nội - Thông tin đất đai mới nhất, cập nhập liên tục trong 24h', '', '', '0332.36.38.39  |  0896.035.789', '', '', 'hiennguyendang1987@gmail.com', '', '', '', '', 'DATHOABINH.INFO |  Mua Bán Bất Động Sản Tây Hà Nội - Thông tin đất đai mới nhất, cập nhập liên tục trong 24h', '0', '', '', '', '', '', '', 'https://twitter.com/', 'https://plus.google.com/?hl=vi', 'https://www.facebook.com/', 'https://www.youtube.com/');

-- ----------------------------
-- Table structure for tbl_contact
-- ----------------------------
DROP TABLE IF EXISTS `tbl_contact`;
CREATE TABLE `tbl_contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fullname` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tittle` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contents` text COLLATE utf8_unicode_ci,
  `cdate` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isactive` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tbl_contact
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_contents
-- ----------------------------
DROP TABLE IF EXISTS `tbl_contents`;
CREATE TABLE `tbl_contents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `thumb` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `images` text COLLATE utf8_unicode_ci,
  `sapo` text COLLATE utf8_unicode_ci,
  `intro` text COLLATE utf8_unicode_ci,
  `fulltext` longtext COLLATE utf8_unicode_ci,
  `type_of_land_id` int(11) DEFAULT NULL,
  `area` float DEFAULT NULL,
  `price` float DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `district_id` int(11) DEFAULT NULL,
  `ward_id` int(11) DEFAULT NULL,
  `latlng` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `list_conid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `list_tagid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `author` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cdate` int(11) DEFAULT NULL,
  `mdate` int(11) DEFAULT NULL,
  `visited` int(11) NOT NULL DEFAULT '0',
  `order` int(11) NOT NULL DEFAULT '0',
  `ispay` tinyint(4) DEFAULT '0',
  `ishot` tinyint(4) NOT NULL DEFAULT '0',
  `isactive` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=82 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tbl_contents
-- ----------------------------
INSERT INTO `tbl_contents` VALUES ('38', '74', 'Bán đất xã cư yên lương sơn hòa bình 1000m2 khuôn viên nghỉ dưỡng  giá rẻ.', 'ban-dat-xa-cu-yen-luong-son-hoa-binh-1000m2-khuon-vien-nghi-duong-gia-re', 'http://localhost/dulich/images/img20190925095755.jpg', '[{\"url\":\"http://localhost/dulich/images/img20190925095818.jpg\",\"alt\":\"\"},{\"url\":\"http://localhost/dulich/images/img20190925095930.jpg\",\"alt\":\"\"},{\"url\":\"http://localhost/dulich/images/img20190925095937.jpg\",\"alt\":\"\"},{\"url\":\"http://localhost/dulich/images/img20190925100239.jpg\",\"alt\":\"\"}]', null, 'Bán gấp khuôn viên hoàn thiện DT 1000m2, trong đó có 100m2 đất nhà ở, đã xây dựng một ngôi BT mini,chỉ sẵn ở, cây ăn quả cây bóng mát, thảm cỏ nhất được trồng và chăm sóc cẩn thận, view cao thoáng mát, đường bê tông vào tận nơi LH 0332363839 để biết thêm chi tiết', '<div class=\"pm-title\" style=\"font-family: tahoma; font-size: 14px; margin: 0px 0px 10px; padding: 0px 0px 10px; font-weight: bold; border: 0px; background-color: rgb(255, 255, 255);\"><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"font-size: 14px;\"><span style=\"color: rgb(5, 86, 153);\">Do bố mẹ tuổi già không đi lại được gia đình muốn chuyển nhượng </span><span style=\"color: rgb(255, 0, 0);\">1000m2</span><span style=\"color: rgb(5, 86, 153);\"> đất thổ cư trong đó có 100m2 đất nhà ở, còn lại là đất trồng cây lâu năm.</span></span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">-</span><span style=\"color: rgb(5, 86, 153);\"> Thế đất vuông vắn, view cao thoáng mát, nằm trong một quần thể các nhà Hà Nội (cả khu vực là 4000m2 đã chia cho 4 nhà mỗi nhà 1000m). Đầy đủ nội thất, chỉ việc đến ở.</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+ </span><span style=\"color: rgb(5, 86, 153);\">Tường bao vây xung quanh, trên đất đã xây dựng một nhà BT kiên cố rộng 134m2, đổ bê tông mái và dán ngói. Có 1 phòng ngủ, 1 phòng tắm nhà vệ sinh, 1 phòng bếp và phòng khách, xung quanh đã trồng nhiều loại cây như sấu, khế, hoa giấy... Thảm cỏ Nhật trông rất đẹp. Quý khách hàng chỉ cần cải tạo thêm một chút đắp hòn non bộ, làm giàn lan nữa sẽ trở thành nơi nghỉ dưỡng quá lý tưởng.</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> Không khí trong lành sạch sẽ, an ninh bảo đảm, trong khu vực có nhiều nhà Hà Nội về xây dựng biệt phủ, và các khu nghỉ dưỡng, nằm trong vùng quy hoạch vành đai xanh của huyện nên không sợ bởi sự chen lấn chuồng trại, công ty, xí nghiệp...</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">-</span><span style=\"color: rgb(5, 86, 153);\"> Giao thông thuận tiện cách đường 6 tầm 5km, Hà Nội khoảng 45km, thời gian sẽ được rút ngắn nữa khi đường 6 được mở rộng.</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">- Gía bán&nbsp; &nbsp;: 1.8 t</span><span style=\"color: rgb(5, 86, 153);\">ỷ</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">-</span><span style=\"color: rgb(5, 86, 153);\"> Quý khách vui lòng LH Đăng Hiển </span><span style=\"color: rgb(255, 0, 0);\">0332363839&nbsp; (0896.035.789)</span><span style=\"color: rgb(5, 86, 153);\"> để được xem đất</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">-</span><span style=\"color: rgb(5, 86, 153);\"> Thủ tục sang nhượng nhanh gọn, đúng quy định của pháp luật.</span></h1></div>', '2', '1000', '1800000000', '28', '98', '0', '', null, null, 'danghien', '1571850000', '1571880691', '3', '0', '0', '1', '1');
INSERT INTO `tbl_contents` VALUES ('25', '74', 'Bán đất thổ cư Lương Sơn Hòa Bình 1ha trang trại nghỉ dưỡng, homstay giá cực rẻ 03.32.36.38.39', 'ban-dat-tho-cu-luong-son-hoa-binh-1ha-trang-trai-nghi-duong-homstay-gia-cuc-re-0332363839', 'http://localhost/dulich/images/20191014060223-fedbwm.jpg', '[{\"url\":\"http://localhost/dulich/images/20191014060313-7703wm.jpg\",\"alt\":\"\"},{\"url\":\"http://localhost/dulich/images/20191014060312-2831wm.jpg\",\"alt\":\"\"},{\"url\":\"http://localhost/dulich/images/20191014060223-fedbwm.jpg\",\"alt\":\"\"}]', null, 'Bán gấp 1ha đất thổ cư có 1000m2 đất nhà ở, có Ao to, có BT nhìn ra Ao, khuôn viên cơ bản hoàn thiện, tường bao vây xung quanh, rất phù hợp làm trang trại, khu nghỉ dưỡng, homestay...giao thông thuaanj tiện Gía hạt rẻ tại Cư Yên,Lương Sơn,Hòa Bình  LH 03.32.36.38.39 (08.960.35789)', '<div class=\"pm-title\" style=\"font-family: tahoma; font-size: 14px; margin: 0px 0px 10px; padding: 0px 0px 10px; color: rgb(5, 86, 153); font-weight: bold; border: 0px; background-color: rgb(255, 255, 255);\"><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"font-size: 14px;\">Do phải ra nước ngoài sinh sống nên được gia đình muốn chuyển nhượng 1ha đất thổ cư trong đó có 1000m2 đất nhà ở, còn lại là đất trồng cây lâu năm.</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\">- Thế đất thoải sườn đồi, view cao thoáng mát, đã được xây tường bao kiên cố, có ao to và kè bờ chắc chắn, có một nhà BT Mini nhìn xuống ao cực đẹp. Quý khách hàng chỉ cần cải tạo thêm một chút nữa sẽ trở thành nơi nghỉ dưỡng quá lý tưởng.</h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\">- Không khí trong lành sạch sẽ, an ninh bảo đảm, trong khu vực có nhiều nhà Hà Nội về xây dựng biệt phủ (Làng Hà Nội) và các khu resort nghỉ dưỡng, du lịch sinh thái như Vịt Cổ Xanh, BevryHill. Bô cagadern... Nằm trong vùng quy hoạch vành đai xanh của huyện nên không sợ bởi sự chen lấn chuồng trại, công ty, xí nghiệp...</h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\">- Giao thông thuận tiện cách đường 6 tầm 5km, đường HCM khoảng 4km, Hà Nội khoảng 45km, thời gian sẽ được rút ngắn nữa khi đường 6 được mở rộng.</h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\">- Quý khách vui lòng LH Đăng Hiển&nbsp;03.32.36.38.39 (0896.035.789) để được xem đất, và gặp chủ.</h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\">- Thủ tục sang nhượng nhanh gọn, đúng quy định của pháp luật.</h1><div><br></div><div><iframe width=\"560\" height=\"320\" src=\"https://www.youtube.com/embed/vNriFA3r94k\" frameborder=\"0\" allowfullscreen=\"\"></iframe><br></div></div>', '2', '10000', '5800000000', '28', '98', '0', '', null, null, 'igf', '1571763600', '1571813665', '2', '0', '0', '1', '1');
INSERT INTO `tbl_contents` VALUES ('26', '68', 'Bán đất chương mỹ hà nội 7000m2 làm trang trại, khu nghỉ dưỡng, homestay, công ty,kho xưởng LH 0332363839', 'ban-dat-chuong-my-ha-noi-7000m2-lam-trang-trai-khu-nghi-duong-homestay-cong-tykho-xuong-lh-0332363839', 'http://localhost/dulich/images/img20190927092359.jpg', '[{\"url\":\"http://localhost/dulich/images/img20190927091239.jpg\",\"alt\":\"\"},{\"url\":\"http://localhost/dulich/images/img20190927092144.jpg\",\"alt\":\"\"},{\"url\":\"http://localhost/dulich/images/img20190927091836.jpg\",\"alt\":\"\"}]', null, 'Cần bán gấp 7000m2 sổ đỏ có 400m2 đất nhà ở còn lại là đất trồng cây lâu năm, 2 mặt tiền, Lưng tựa núi chân đạp ngã ba đường và trạm điện trung thế, view cao thoáng mát rất phù hợp để làm trang trại, khu nghỉ dưỡng, homstay , Biệt Phủ hoặc công ty, kho xưởng. địa chỉ Thủy Xuân Tiên, Chương Mỹ, Hà Nội LH 0332363839', '<div class=\"pm-title\" style=\"font-family: tahoma; font-size: 14px; margin: 0px 0px 10px; padding: 0px 0px 10px; color: rgb(5, 86, 153); font-weight: bold; border: 0px; background-color: rgb(255, 255, 255);\"><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"font-size: 14px;\">Do cần tiền đầu tư gia đình muốn bán gấp 7000m2 sổ đỏ có 400m2 đất nhà ở còn lại là đất trồng cây lâu năm, 2 mặt tiền, chiều dài đất bám đường 130m, tường bao vây xung quanh, đã được trồng nhiều cây ăn quả, cây công trình có giá trị kinh tế cao, phủ bóng mát kín cả vườn.</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\">- View cao thoáng mát, tầm nhìn xa ra khu vực Xuân Mai và đường HCM, thế đất thoải sườn đồi đầu gối sơn (núi đá) chân đạp đường bê tông và trạm điện trung thế. Nền đất chắc chắn, chất đất tốt vị trí đất cao ráo, sạch sẽ, đường bê tông rộng 5m.</h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\">- Không khí trong lành mát mẻ, an ninh bảo đảm. Rất phù hợp để làm trang trại, khu nghỉ dưỡng cuối tuần, homestay, hoặc làm kho xưởng, cty xí nghiệp.</h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\">- Cách đường HCM khoảng 1.5km, cách Xuân Mai tầm 4.5km, TT Hà Nội khoảng 34km.</h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\">- Mọi chi tiết xin vui lòng liên hệ Đăng Hiển: 0332363839 - (0896035789).</h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\">- Thủ tục sang nhượng nhanh gọn đúng quy định của pháp luật.</h1></div>', '1', '7000', '7500000000', '1', '89', '0', '', null, null, 'danghien', '1571763600', '1572663109', '1', '0', '0', '1', '1');
INSERT INTO `tbl_contents` VALUES ('27', '74', 'Bán 13.4ha trang trại, khu nghỉ dưỡng tại kỳ sơn, hòa bình giá rẻ có ao, điện 3 pha, ô tô to vào tận nơi LH 0332363839', 'ban-134ha-trang-trai-khu-nghi-duong-tai-ky-son-hoa-binh-gia-re-co-ao-dien-3-pha-o-to-to-vao-tan-noi-lh-0332363839', 'http://localhost/dulich/images/img20190910112545.jpg', '[{\"url\":\"http://localhost/dulich/images/img20190910112548.jpg\",\"alt\":\"\"},{\"url\":\"http://localhost/dulich/images/img20190910112542.jpg\",\"alt\":\"\"},{\"url\":\"http://localhost/dulich/images/img20190910112548.jpg\",\"alt\":\"\"},{\"url\":\"http://localhost/dulich/images/img20190508160053.jpg\",\"alt\":\"\"}]', null, 'Bán gấp 13.4ha  trang trại, khu nghỉ dưỡng, homestay, đã trồng 11ha bưởi 4 năm tuổi đang cho thu hoạch, 2ha keo 5 năm tuổi,có ao, điện 3 pha, ô tô to vào tận nơi, view cao cực đẹp, giao thông thuận tiện lh 0332363839', '<div class=\"kqchitiet\" style=\"font-family: Tahoma; font-size: 12px; margin: 0px 0px 10px; padding: 0px; position: relative; line-height: 22px; background-color: rgb(255, 255, 255);\"><h1 itemprop=\"name\" style=\"color: rgb(5, 86, 153); font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"font-size: 14px;\">-Chú em đã mất nhiều công sức, tâm huyết để xây dựng và thiết kế trang trại. Nhưng do gia đình có việc nên cần bán gấp&nbsp; trang trại bưởi đang cho thu hoạch.</span></h1><h1 itemprop=\"name\" style=\"color: rgb(5, 86, 153); font-size: 16px; margin: 0px; padding: 0px;\">- Với diện tích 13.4ha (11ha đã trồng bưởi năm thứ 4 đang cho thu hoạch, 2ha keo 5 năm tuổi), có 1 ao (15mx20m), có nhà cấp 4 chỉ sẵn ở, điện 3 pha, đường to rộng ô tô vào tận nơi.</h1><h1 itemprop=\"name\" style=\"color: rgb(5, 86, 153); font-size: 16px; margin: 0px; padding: 0px;\">- View cao thoáng mát, không khí trong lành sạch sẽ, yên tĩnh, rất phù hợp cho làm trang trại, khu nghỉ dưỡng cuối tuần, homestay...</h1><h1 itemprop=\"name\" style=\"color: rgb(5, 86, 153); font-size: 16px; margin: 0px; padding: 0px;\">- Giao thông thuận lợi, cách đường 6 tầm 7km, Hà Nội tầm 58km. Đi theo đường đại lộ Hòa Lạc - Hòa Bình, hay đường QL6 đều được.</h1><h1 itemprop=\"name\" style=\"color: rgb(5, 86, 153); font-size: 16px; margin: 0px; padding: 0px;\">- Giá bán: 400tr/ha</h1><h1 itemprop=\"name\" style=\"color: rgb(5, 86, 153); font-size: 16px; margin: 0px; padding: 0px;\">- Mọi chi tiết xin vui lòng LH Đăng Hiển 0962.792.687. (0896. 035.789).</h1></div>', '2', '134000', '5300000000', '28', '97', '0', '', null, null, 'danghien', '1571763600', '1572663548', '1', '0', '0', '1', '1');
INSERT INTO `tbl_contents` VALUES ('28', '74', 'Bán trang trại, khu nghỉ dưỡng Lương Sơn, Hòa Bình, 2ha resot, khuôn viên hoàn thiện đẹp long lanh LH 0332363839', 'ban-trang-trai-khu-nghi-duong-luong-son-hoa-binh-2ha-resot-khuon-vien-hoan-thien-dep-long-lanh-lh-0332363839', 'http://localhost/dulich/images/img20190616164056.jpg', '[{\"url\":\"http://localhost/dulich/images/img20190616163153.jpg\",\"alt\":\"\"},{\"url\":\"http://localhost/dulich/images/img20190616164029.jpg\",\"alt\":\"\"},{\"url\":\"http://localhost/dulich/images/img20190616163202.jpg\",\"alt\":\"\"},{\"url\":\"http://localhost/dulich/images/img20190616164115.jpg\",\"alt\":\"\"},{\"url\":\"http://localhost/dulich/images/img20190616164106.jpg\",\"alt\":\"\"}]', null, '2ha đất thổ cư, có 400m2 đất nhà ở, đã xây tường bao quanh và thiết kế khuôn viên hoàn thiện đẹp lung linh, hiện tại đang cho thuê nghỉ dưỡng rất hiệu quả.giao thông thuận tiện đường bê tông to rộng xe 45 chỗ vào thoải mái. LH 0332363839 ', '<div class=\"pm-title\" style=\"font-family: tahoma; font-size: 14px; margin: 0px 0px 10px; padding: 0px 0px 10px; font-weight: bold; border: 0px; background-color: rgb(255, 255, 255);\"><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"font-size: 14px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> Bán gấp trang trại, khu nghỉ dưỡng, homestay,resort </span><span style=\"color: rgb(255, 0, 0);\">2ha đất thổ cư có 800m2 đất nhà ở </span><span style=\"color: rgb(5, 86, 153);\">còn&nbsp; lại là đất trồng cây lâu năm, đã thiết&nbsp; kế khuôn viên hoàn thiện đẹp lung linh, đầy đủ các hạng mục công trình vườn cây ao cá, nhà sàn, chuồng nuôi, cảnh quan môi trường... Có thể sử dụng và đưa vào khai thác được ngay hiện tại đang cho các gia đình thuê nghỉ dưỡng cuối tuần rất hiệu quả, có tường bao vây xung quanh, và được trồng nhiều loại cây ăn quả, cây hoa, cây cảnh có giá trị kinh tế cao.</span></span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> Không khí trong lành yên tĩnh,đời sống dân trí cao, an ninh bảo đảm, có nhiều biệt phủ của đại gia Hà Nội về xây dựng.</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> Cách đường QL6 tầm 4km, thành phố </span><span style=\"color: rgb(255, 0, 0);\">Hà Nội khoảng 35km.</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> Để biết thêm chi tiết LH Đăng Hiển </span><span style=\"color: rgb(255, 0, 0);\">0332363839 (0896. 035. 789).</span></h1><h1 itemprop=\"name\" style=\"color: rgb(5, 86, 153); font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><br></h1></div>', '2', '20000', '42000000000', '28', '98', '94', '', null, null, 'danghien', '1571763600', '1572659546', '1', '0', '0', '1', '1');
INSERT INTO `tbl_contents` VALUES ('29', '71', 'Bán đất kim bôi hòa bình, 24ha làm trang trại, khu nghỉ dưỡng, bám MĐ nhựa liên huyện cách Hà Nội tầm 50km', 'ban-dat-kim-boi-hoa-binh-24ha-lam-trang-trai-khu-nghi-duong-bam-md-nhua-lien-huyen-cach-ha-noi-tam-50km', 'http://localhost/dulich/images/img20191013090857.jpg', '[{\"url\":\"http://localhost/dulich/images/img20191013090857.jpg\",\"alt\":\"\"},{\"url\":\"http://localhost/dulich/images/img20191013090853.jpg\",\"alt\":\"\"},{\"url\":\"http://localhost/dulich/images/img20191013090848.jpg\",\"alt\":\"\"}]', null, 'Cần bán gấp 24ha đầy đủ các điều kiện  để làm trang trại, khu nghỉ dưỡng sinh thái, resrot, homestay..., Lung tụa núi chân đạp thủy.đất bám đường nhựa liên huyện, giao thông thuận tiện cách Hà Nội tầm 60km Lh 0332363839 (0896.035.789)', '<div class=\"pm-title\" style=\"font-family: tahoma; font-size: 14px; margin: 0px 0px 10px; padding: 0px 0px 10px; color: rgb(5, 86, 153); font-weight: bold; border: 0px; background-color: rgb(255, 255, 255);\"><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"font-size: 14px;\">Cần bán gấp 24ha rất phù hợp để làm trang trại, khu nghỉ dưỡng sinh thái, resrot, homestay..., view đồi cực đẹp, thế đất lưng tựa núi chân đạp thủy, trong khu vực có nhiều dãy núi đá trùng trùng điệp điệp, phía dưới lô đất là hệ thống suối và mạch nước ngầm có thể ngăn làm hồ.</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\">- Lô đất bám mặt đường nhựa liên huyện, rất thuận lợi giao thông đi lại, không khí trong lành yên tĩnh, mát mẻ, còn lưu giữ được nhiều vẻ hoang sơ của vùng quê Việt Nam... Có nhiều các loại thực phẩm sạch do bà con dân bản trồng, và đánh bắt hái lượm trên rừng về...</h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\">- Cách đường HCM tầm 8km, Hà Đông tầm 50km, xe oto vào tận nơi.</h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\">- Trong khu vực có nhiều đại gia Hà Nội về làm trang trại và xây biệt phủ, khu nghỉ dưỡng cuối tuần.</h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\">- Giá bán 200tr/ha.</h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\">- Để biết thêm chi tiết LH Đăng Hiển SĐT&nbsp; &nbsp;: 0332363839&nbsp; &nbsp;-&nbsp; &nbsp;0896. 035.789.</h1></div>', '1', '24000', '4800000000', '28', '99', '0', '', null, null, 'danghien', '1571763600', '1572659088', '0', '0', '0', '1', '1');
INSERT INTO `tbl_contents` VALUES ('30', '71', 'bán đất lương sơn hòa bình 100ha làm trang trại,khu nghỉ dưỡng sinh thái view tuyệt đẹp (Tam Đảo 2), GT thuận tiện cách HN 50km 0332363839', 'ban-dat-luong-son-hoa-binh-100ha-lam-trang-traikhu-nghi-duong-sinh-thai-view-tuyet-dep-tam-dao-2-gt-thuan-tien-cach-hn-50km-0332363839', 'http://localhost/dulich/images/img20190926142626.jpg', '[{\"url\":\"http://localhost/dulich/images/img20190727182534.jpg\",\"alt\":\"\"},{\"url\":\"http://localhost/dulich/images/img20191004050609.jpg\",\"alt\":\"\"},{\"url\":\"http://localhost/dulich/images/img20191004050553.jpg\",\"alt\":\"\"}]', null, 'Cần bán gấp 100ha  View đồi cao nhìn về phía Hà Nội cực đẹp, được ví như là Tam Đảo 2 của Việt Nam. Nơi đây hội tụ đầy đủ các yếu tố để làm du lịch sinh thái, nghỉ dưỡng bảo đảm nhà đầu tư nào lên cũng phải mê...Gọi ngay 0332363839 (0896.035.789)', '<div class=\"pm-title\" style=\"font-family: tahoma; font-size: 14px; margin: 0px 0px 10px; padding: 0px 0px 10px; color: rgb(5, 86, 153); font-weight: bold; border: 0px; background-color: rgb(255, 255, 255);\"><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"font-size: 14px;\">Còn sót lại một lô duy nhất</span>&nbsp;100ha View đồi cao nhìn về phía Hà Nội cực đẹp, được ví như là Tam Đảo 2 của Việt Nam. Nơi đây hội tụ đầy đủ các yếu tố để làm du lịch sinh thái, nghỉ dưỡng bảo đảm nhà đầu tư nào lên cũng phải mê...</h1><div><span style=\"font-size: 14px;\">- Đường bê tông lên tận nơi, có suối to chảy quanh năm, không khí trong lành mát mẻ rất phù hợp để đầu tư phát triển du lịch nghỉ dưỡng, khu vui&nbsp; chơi giải trí, homestay, phân lô bán nền...</span></div><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\">- Là lô đất duy nhất rộng, đẹp, rẻ cách Hà Nội không xa chỉ tầm 50km, cách TT Xuân Mai khoảng 20km, đường HCM tầm 8km, xe ô tô lên tận nơi...</h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\">- Đang cần bán gấp nên giá bán quá rẻ... Nhanh tay số lượng có hạn.</h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\">-Để biết thêm chi tiết LH Đăng Hiển 0962.792.687 (0896.035.789).</h1></div>', '1', '1000000', '36000000000', '28', '98', '0', '', null, null, 'danghien', '1571763600', '1572658762', '0', '0', '0', '1', '1');
INSERT INTO `tbl_contents` VALUES ('31', '71', 'Cần bán 4.2ha khu du lịch sinh thái bậc nhất Việt Nam, tại lương sơn hòa bình, giá đầu tư, 0332363839', 'can-ban-42ha-khu-du-lich-sinh-thai-bac-nhat-viet-nam-tai-luong-son-hoa-binh-gia-dau-tu-0332363839', 'http://localhost/dulich/images/img20190721091934.jpg', '[{\"url\":\"http://localhost/dulich/images/img20190721092024.jpg\",\"alt\":\"\"},{\"url\":\"http://localhost/dulich/images/img20190721091929.jpg\",\"alt\":\"\"},{\"url\":\"http://localhost/dulich/images/img20190721091919.jpg\",\"alt\":\"\"}]', null, 'cần bán khu du lịch sinh thái 4.2 ha đang hoạt động rất hiệu quả, có ao hồ, sông suối, đầy đủ các hạng mục công trình, như nhà nghỉ, nhà hàng, bể bơi, giao thông thuận tiện LH 0332363839 (0896.035.789)', '<div class=\"kqchitiet\" style=\"font-family: Tahoma; font-size: 12px; margin: 0px 0px 10px; padding: 0px; position: relative; line-height: 22px; background-color: rgb(255, 255, 255);\"><span style=\"font-size: 14px;\">Cần sang tên chuyển nhượng 4.2ha khu du lịch sinh thái đang hoạt động rất hiệu quả, đã được xây dựng đầy đủ các hạng mục công trình, hồ sơ, giấy tờ pháp lý đúng theo quy định của pháp luật.</span></div><div class=\"kqchitiet\" style=\"font-family: Tahoma; font-size: 12px; margin: 0px 0px 10px; padding: 0px; position: relative; line-height: 22px; background-color: rgb(255, 255, 255);\"><span style=\"font-size: 14px;\">- Cách đường QL6 tầm 4km, Hà Nội khoảng 40km, không khí trong lành sạch sẽ nơi được nhiều quý khách đánh giá là Địa điểm đáng đến.</span></div><div class=\"kqchitiet\" style=\"margin: 0px 0px 10px; padding: 0px; position: relative; line-height: 22px; background-color: rgb(255, 255, 255);\"><span style=\"font-family: Tahoma; font-size: 14px;\">-Mọi chi tiết LH Đăng Hiển&nbsp;</span><span style=\"font-size: 14px; font-family: Tahoma;\">0332363839 (0896.035.789)</span></div>', '1', '42000', '70000000000', '28', '98', '0', '', null, null, 'danghien', '1571763600', '1572658439', '1', '0', '0', '1', '1');
INSERT INTO `tbl_contents` VALUES ('32', '72', 'Bán đất Lương Sơn Hòa Bình 1ha đất SXKD đã có nhà ĐH, làm cty, kho xưởng gía rẻ LH 0332363839 ', 'ban-dat-luong-son-hoa-binh-1ha-dat-sxkd-da-co-nha-dh-lam-cty-kho-xuong-gia-re-lh-0332363839-', 'http://localhost/dulich/images/img20190602153444.jpg', '[{\"url\":\"http://localhost/dulich/images/img20180918174801.jpg\",\"alt\":\"\"},{\"url\":\"http://localhost/dulich/images/img20190602153506.jpg\",\"alt\":\"\"},{\"url\":\"http://localhost/dulich/images/img20190602153434.jpg\",\"alt\":\"\"},{\"url\":\"http://localhost/dulich/images/img20190602153428.jpg\",\"alt\":\"\"}]', null, 'Bán gấp 1ha đất SXKD đã có nhà điều hành, địa hình bằng phẳng, bám mặt đường QL6 làm cty, kho xưởng, nhân công tại chỗ giá rẻ, thuận tiện giao thông cách đường HCM khoảng 6km, Hà Nội tầm 40km.Gia bán 900k/m2. Gọi ngay 0332363839 để biết thêm chi tiết.', '<div class=\"kqchitiet\" style=\"font-family: Tahoma; font-size: 12px; margin: 0px 0px 10px; padding: 0px; position: relative; line-height: 22px; background-color: rgb(255, 255, 255);\"><h1 itemprop=\"name\" style=\"font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"font-size: 14px;\"><span style=\"color: rgb(5, 86, 153);\">Cần bán gấp </span><span style=\"color: rgb(255, 0, 0);\">1ha </span><span style=\"color: rgb(5, 86, 153);\">đất sổ SXKD, bám mặt đường QL6, đã có nhà điều hành 2 tầng, đất thuộc thị trấn Lương Sơn, huyện Lương Sơn, tỉnh Hòa Bình.là một lô đất có một không hai trong khu vực, có đầy đủ sổ sách giấy tờ, để xây dựng công ty kho xưởng, cơ sở sản xuất kinh doanh...</span></span></h1><h1 itemprop=\"name\" style=\"color: rgb(5, 86, 153); font-size: 16px; margin: 0px; padding: 0px;\">- Điện nước đầy đủ, nền đất bằng phẳng chắc chắn quý khách hàng chỉ việc xây dựng và đi vào sản xuất được luôn, không phải san gạt gì. là đất bám mặt đường 6, gần vị trí trung tâm, cách sân gol phonex tầm 2km, ngã ba Bãi Lạng tầm 500m.</h1><h1 itemprop=\"name\" style=\"color: rgb(5, 86, 153); font-size: 16px; margin: 0px; padding: 0px;\">- Cách Xuân Mai tầm 6km, TT Hà Nội khoảng 40km</h1><h1 itemprop=\"name\" style=\"font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(5, 86, 153);\">- Giá bán: </span><span style=\"color: rgb(255, 0, 0);\">900k/m2</span></h1><h1 itemprop=\"name\" style=\"font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(5, 86, 153);\">- Mọi chi tiết xin vui lòng liên hệ Đăng Hiển: </span><span style=\"color: rgb(255, 0, 0);\">0332363839 - (0896.035.789).</span></h1><h1 itemprop=\"name\" style=\"color: rgb(5, 86, 153); font-size: 16px; margin: 0px; padding: 0px;\">- Thủ tục sang nhượng nhanh gọn đúng quy định của pháp luật.</h1></div>', '1', '10000', '9000000000', '28', '98', '0', '', null, null, 'danghien', '1571850000', '1572658226', '5', '0', '0', '1', '1');
INSERT INTO `tbl_contents` VALUES ('33', '72', 'Bán lương sơn hòa bình 21ha đất doanh nghiệp cách đường HCM tầm 1.5km, làm mỏ khai thác Đá, cty, trại gà giá rẻ LH 0332363839', 'ban-luong-son-hoa-binh-21ha-dat-doanh-nghiep-cach-duong-hcm-tam-15km-lam-mo-khai-thac-da-cty-trai-ga-gia-re-lh-0332363839', 'http://localhost/dulich/images/img20191107145439.jpg', '[{\"url\":\"http://localhost/dulich/images/img20190925110136.jpg\",\"alt\":\"\"},{\"url\":\"http://localhost/dulich/images/img20191016093912.jpg\",\"alt\":\"\"},{\"url\":\"http://localhost/dulich/images/img20191016094002.jpg\",\"alt\":\"\"}]', null, 'Bán gấp từ 21ha  trong đó có 11ha đất sản xuất kinh doanh, còn lại là đất trồng cây lâu năm.xa khu dân cư cách đường HCM tầm 1.5km, làm mỏ khai thác Đá, cty, trại gà giá rẻ . gọi ngay 0332363839 để biết thêm chi tiết', '<div class=\"pm-title\" style=\"font-family: tahoma; font-size: 14px; margin: 0px 0px 10px; padding: 0px 0px 10px; font-weight: bold; border: 0px; background-color: rgb(255, 255, 255);\"><h1 itemprop=\"name\" style=\"color: rgb(5, 86, 153); font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\">- Diện tích rộng, địa hình&nbsp; bằng phẳng, cách khu dân cư bằng dãy núi đá nhưng không xa dân vì lô đất cách đường hcm và trung tâm của xã Trung Sơn không xa. bên cạnh có 2 mỏ đá đang khai thác rất hiệu quả.</h1><h1 itemprop=\"name\" style=\"color: rgb(5, 86, 153); font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\">- Cách đường mòn HCM tầm 1.5km, đường to rộng xe 4 chân vào thoải mái, tiện cho quá trình vận chuyển từ Bắc Vào Nam.</h1><h1 itemprop=\"name\" style=\"color: rgb(5, 86, 153); font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\">- Do biệt lập, xung quanh không có dân cư sinh sống nên rất phù hợp để đầu tư khai thác đá, hoặc có thể sử dụng làm trại gà, công ty, kho xưởng . (Có hang nước, nước chảy quanh năm).</h1><h1 itemprop=\"name\" style=\"color: rgb(5, 86, 153); font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\">- Cách trung tâm thị trấn Xuân Mai tầm 18 km, Hà Nội tầm 40km (đi qua thị trấn Chúc Sơn),...</h1><div>-<span style=\"color: rgb(255, 0, 0);\"> Gía bán cực rẻ&nbsp; :&nbsp; &nbsp;500tr/ha&nbsp;</span></div><h1 itemprop=\"name\" style=\"color: rgb(5, 86, 153); font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\">- Đã có sổ đỏ, giấy tờ đầy đủ, thủ tục sang, nhượng nhanh chóng đúng quy định của pháp luật.</h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(5, 86, 153);\"><br></span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(5, 86, 153);\">- Mọi chi tiết xin vui lòng LH Đăng Hiển </span><span style=\"color: rgb(255, 0, 0);\">0332363839 (0896.035.789).</span></h1></div>', '1', '2100000', '500000000', '28', '98', '0', '', null, null, 'danghien', '1571850000', '1573858784', '5', '0', '0', '1', '1');
INSERT INTO `tbl_contents` VALUES ('34', '71', 'Bán khu nghỉ dưỡng Lương Sơn Hòa Bình 5ha suối trong xanh không khì trong lành, núi non hùng vĩ  LH 0332363839', 'ban-khu-nghi-duong-luong-son-hoa-binh-5ha-suoi-trong-xanh-khong-khi-trong-lanh-nui-non-hung-vi-lh-0332363839', 'http://localhost/dulich/images/img20191009080155.jpg', '[{\"url\":\"http://localhost/dulich/images/img20191009080208.jpg\",\"alt\":\"\"},{\"url\":\"http://localhost/dulich/images/img20191009080226.jpg\",\"alt\":\"\"},{\"url\":\"http://localhost/dulich/images/img20191009080137.jpg\",\"alt\":\"\"}]', null, 'Bán gấp trang trại, khu nghỉ dưỡng 5ha khuôn viên hoàn thiện đẹp lung linh, chỉ sẵn ở, nâng cấp cải tạo và hoàn thiện thêm. đường bê tông vào tận nơi, cách đường nhựa liên huyện với Kim Bôi tầm 1km, đường QL6 khoảng 10km, Hà Nội tầm 50km', '<div class=\"pm-title\" style=\"font-family: tahoma; font-size: 14px; margin: 0px 0px 10px; padding: 0px 0px 10px; font-weight: bold; border: 0px; background-color: rgb(255, 255, 255);\"><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(5, 86, 153);\">- Đã xây dự 1 nhà sàn 1 bể bơi, và khuôn viên hoàn thiện cùng nhiều hạng mục công trình khác Có thể sử dụng và đưa vào khai thác được ngay, hiện tại đang cho các gia đình thuê nghỉ dưỡng cuối tuần rất tốt và được trồng nhiều loại cây ăn quả, cây hoa, cây cảnh có giá trị kinh tế cao.</span></h1><h1 itemprop=\"name\" style=\"color: rgb(5, 86, 153); font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\">- Không khí trong lành yên tĩnh, an ninh bảo đảm, trong khu vực có nhiều biệt phủ của đại gia Hà Nội về xây dựng và các khu resot, homsaty đang trong quá trình xây dựng ,khai thác, và nằm trên trục đường đi suối khoáng Kim Bôi có thể tổ chức thành chuỗi nghỉ dưỡng đầy hấp dẫn.</h1><h1 itemprop=\"name\" style=\"color: rgb(5, 86, 153); font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\">- Bên cạnh đó trong khu vực có nguồn thực phẩm sạch, thực phẩm hữu cơ, được bà con nuôi trồng, hái lượm và săn bắt trên rừng về vừa ngon lại rẻ, ngay trên ngõ vào có quán thịt trâu Ngọc Được Nổi tiếng về các món ăn dân tộc...</h1><h1 itemprop=\"name\" style=\"color: rgb(5, 86, 153); font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\">- Có thể nói với tổng diện tích 5ha chủ đầu tư có thể xây dựng biệt phủ, trang trại nhà vườn, homstay, khu resort nghỉ dưỡng cuối tuần, trung tâm trải nghiệm cho các em học sinh...</h1><h1 itemprop=\"name\" style=\"color: rgb(5, 86, 153); font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\">- Giá cả lại rẻ, giao thông thuận tiện, đường bê tông vào tận nơi.</h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(5, 86, 153);\">- Cách đường Trường Sơn A tầm 1km, đường QL6 tầm 10km, </span><span style=\"color: rgb(255, 0, 0);\">thành phố Hà Nội khoảng 50km.</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(5, 86, 153);\">- Để biết thêm chi tiết LH Đăng Hiển </span><span style=\"color: rgb(255, 0, 0);\">0332363839 (0896. 035. 789).</span></h1></div>', '1', '50000', '5000000000', '28', '98', '0', '', null, null, 'danghien', '1571850000', '1572644461', '1', '0', '0', '1', '1');
INSERT INTO `tbl_contents` VALUES ('35', '71', 'Bán đất lương sơn hòa bình 7000m2 khu nghỉ dưỡng,khuôn viên hoàn thiện đẹp long lanh, có bể bơi ngoài trời giá rẻ 0332363839', 'ban-dat-luong-son-hoa-binh-7000m2-khu-nghi-duongkhuon-vien-hoan-thien-dep-long-lanh-co-be-boi-ngoai-troi-gia-re-0332363839', 'http://localhost/dulich/images/img15671488044381567149022617.jpg', '[{\"url\":\"http://localhost/dulich/images/img15671488044161567149022580.jpg\",\"alt\":\"\"},{\"url\":\"http://localhost/dulich/images/img15671488042761567149022272.jpg\",\"alt\":\"\"},{\"url\":\"http://localhost/dulich/images/img15671488043451567149022438.jpg\",\"alt\":\"\"}]', null, 'Bán gấp resort 7000m2 khuôn viên hoàn thiện, đẹp lung linh,kinh doanh hiệu quả. có 550m2 đất nhà ở còn lại là đất trồng cây lâu năm.giao thông thuận tiện cách Hà Nội tầm 32km.\r\n', '<div class=\"pm-title\" style=\"font-family: tahoma; font-size: 14px; margin: 0px 0px 10px; padding: 0px 0px 10px; color: rgb(5, 86, 153); font-weight: bold; border: 0px; background-color: rgb(255, 255, 255);\"><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"font-size: 14px;\">- Đã xây dựng một ngôi biệt thự to rộng, đẹp, kiên cố có thiết kế khoa học, bể bơi ngoài trời đẳng cấp châu Âu, có gần chục phòng nghỉ, thảm cỏ,...</span>Khu vui chơi giải trí, hiện tại đang cho các gia đình thuê nghỉ dưỡng cuối tuần rất hiệu quả, có tường bao vây xung quanh, và được trồng nhiều loại cây ăn quả, cây hoa, cây cảnh có giá trị kinh tế cao.</h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\">- Không khí trong lành yên tĩnh, an ninh bảo đảm, có nhiều biệt phủ của Đại gia Hà Nội về xây dựng.</h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\">- Cách đường QL6 tầm 2km, thành phố Hà Nội khoảng 32km.</h1><div><br></div><div>- Gía bán :&nbsp; 12 tỷ</div><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><br></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\">- Để biết thêm chi tiết LH Đăng Hiển 0332363839&nbsp; &nbsp;(0896. 035. 789).</h1></div>', '1', '7000', '12000000', '28', '98', '0', '', null, null, 'danghien', '1571850000', '1572645464', '3', '0', '0', '1', '1');
INSERT INTO `tbl_contents` VALUES ('36', '72', 'Bán xưởng Lương Sơn Hòa Bình 4000m2 đất SXKD đã có 1000m2 nhà xưởng cách QL6 100m, HN 30km  LH 0332363839', 'ban-xuong-luong-son-hoa-binh-4000m2-dat-sxkd-da-co-1000m2-nha-xuong-cach-ql6-100m-hn-30km-lh-0332363839', 'http://localhost/dulich/images/img20190824170710.jpg', '[{\"url\":\"http://localhost/dulich/images/img20191102051104.jpg\",\"alt\":\"\"},{\"url\":\"http://localhost/dulich/images/img20190511171623.jpg\",\"alt\":\"\"},{\"url\":\"http://localhost/dulich/images/img20190602152053.jpg\",\"alt\":\"\"}]', null, '- Cả Lương sơn còn sót lại đúng một lô đất sản xuất kinh doanh DT 4000m2 trong đó có 1000m2 nhà xưởng chất lượng bảo đảm. Sẵn sàng bước vào sản xuất được luôn.', '<div class=\"pm-title\" style=\"font-family: tahoma; font-size: 14px; margin: 0px 0px 10px; padding: 0px 0px 10px; border: 0px; background-color: rgb(255, 255, 255);\"><h1 itemprop=\"name\" style=\"color: rgb(5, 86, 153); font-family: Tahoma; font-size: 16px; margin: 0px; text-decoration: none; padding: 0px;\"><span style=\"font-size: 14px; color: rgb(0, 0, 0);\">- Do cần tiền chuyển hướng đầu tư bên mình muốn chuyển nhượng lô đất SXKD DT 4000m2 trong đó có 1000m2 nhà xưởng chất lượng bảo đảm. Sẵn sàng bước vào sản xuất được luôn, địa hình bằng phẳng, nền đất chắc chắn</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><div class=\"pm-content\" style=\"font-size: 13px; margin: 0px; padding: 0px;\"><div class=\"pm-desc\" style=\"color: rgb(0, 0, 0); font-size: 14px; margin: 0px; padding: 0px; line-height: 25.2px;\">- Giao thông thuận lợi cách đường QL 6 tầm 100m, Hà Nội tầm 30km, đường bê tông to rộng xe công vào thoải mái.<br style=\"line-height: 25.2px;\">+ Địa chỉ lô đất: Thị trấn Lương Sơn, huyện Lương Sơn, tỉnh Hòa Bình.</div><div class=\"pm-desc\" style=\"font-size: 14px; margin: 0px; padding: 0px; line-height: 25.2px;\"><span style=\"color: rgb(0, 0, 0);\">+</span><span style=\"color: rgb(255, 0, 0);\">Gía bán : 5.5ty</span></div><div class=\"pm-desc\" style=\"font-size: 14px; margin: 0px; padding: 0px; line-height: 25.2px;\">+ Thủ tục sang nhượng nhanh gọn, bảo đảm đúng quy định của pháp luật.<br style=\"line-height: 25.2px;\">- Quý khách hàng vui lòng LH Đăng Hiển <span style=\"color: rgb(255, 0, 0);\">0332363839&nbsp; &nbsp;(0896.035.789).</span> Để biết thêm chi tiết.</div></div></h1></div>', '1', '4000', '5500000000', '28', '98', '0', '', null, null, 'danghien', '1571850000', '1572646443', '4', '0', '0', '1', '1');
INSERT INTO `tbl_contents` VALUES ('37', '72', 'Bán kho xưởng Lương Sơn Hòa Bình 2.69ha đất doanh nghiệp  nằm trong cụm công nghiệp của huyện cách Hà Nội tầm 30km LH 0332363839', 'ban-kho-xuong-luong-son-hoa-binh-269ha-dat-doanh-nghiep-nam-trong-cum-cong-nghiep-cua-huyen-cach-ha-noi-tam-30km-lh-0332363839', 'http://localhost/dulich/images/img20190731162016.jpg', '[{\"url\":\"http://localhost/dulich/images/img20190719183229.jpg\",\"alt\":\"\"},{\"url\":\"http://localhost/dulich/images/img20190731162037.jpg\",\"alt\":\"\"},{\"url\":\"http://localhost/dulich/images/img20190719183220.jpg\",\"alt\":\"\"}]', null, 'hiện tại cty Có 2 lô, Lô1  diện tích 1,9ha( chưa có nhà xưởng), Lô 2 diện tích 7775m2 trong đó có 1620m2 nhà xưởng, khung thép zamin chắc chắn, có thể sản xuất được ngay, xe công vào thoải mái, điện nước đầy đủ LH 0332363839', '<div class=\"pm-title\" style=\"font-family: tahoma; font-size: 14px; margin: 0px 0px 10px; padding: 0px 0px 10px; color: rgb(5, 86, 153); font-weight: bold; border: 0px; background-color: rgb(255, 255, 255);\"><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"font-size: 14px;\">- Do cần tiền chuyển hướng đầu tư bên cty mình muốn chuyển nhượng 2 lô đất SXKD + nhà xưởng đạt tiêu chuẩn quốc tế.</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\">- Lô 1 diện tích 19.198.5m2 đất sản xuất kinh doanh, thời hạn sử dụng còn 39 năm. Lô đất nằm trải dài bám đường bê tông tầm 200m, đường điện trung thế phía trước và phía sau đất đều có, nước sạch dẫn tận nơi. Thế đất cao ráo, thoát nước tốt nên không sợ ngập úng.</h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><br></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\">- Lô 2 diện tích 7.775m2 nằm đối diện với lô 1.9ha; 2 mặt tiền, bám đường bê tông tầm 150m, thửa đất vuông vắn, tường bao vây xung quanh, trên đất đã xây dựng một nhà xưởng khung thép Zamil chắc chắn, sẵn sàng hoạt động (DT nhà xưởng 1.620m2), thời hạn sử dụng còn 39 năm.</h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\">- Nền đất cực kỳ chắc chắn, điện nước đầy đủ, tường bao vây xung quanh, đường bê tông rộng 6m, cách đường QL6 tầm 500m, cách Hà Nội khoảng 30km, đường to rộng, xe công vào thoải mái.</h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\">- Hình thức mua bán: Mua bán cổ phần của công ty.</h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\">+ Trước khi làm thủ tục chuyển nhượng, các thành viên hiện hữu sẽ thực hiện quyết toán thuế với cơ quan thuế, nhà cung cấp và thực hiện bàn giao doanh nghiệp \"sạch\" cho chủ sở hữu mới.</h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\">+ Chủ đầu tư mới được hưởng lợi từ khoản thuế GTGT âm gần 2 tỷ VNĐ.</h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\">+ Chủ đầu tư mới không phải nộp tiền thuê đất do công ty được chiết khấu trừ tiền thuê đất trong khoảng 10 năm tiếp theo (mỗi năm nộp gần 300tr tiền thuê đất).</h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\">+ Chủ đầu tư có thể tiếp cận doanh nghiệp và sản xuất kinh doanh được ngay, như vậy vừa không mất thời gian lại không tốn kém về tài chính.</h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\">+ Giá bán cực rẻ: 800.000đ/m2 (nếu tính cả tiền thuế GTGT và tiền thuê đất 10 năm thì quý khách hàng đang mua với giá 611.000đ/m2).</h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\">+ Địa chỉ lô đất: Thị trấn Lương Sơn, Huyện Lương Sơn, Tỉnh Hòa Bình.</h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\">+ Thủ tục sang nhượng nhanh gọn, bảo đảm đúng quy định của pháp luật</h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><br></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\">-Qúy khách hàng vui lòng LH Đăng Hiển 0332363839&nbsp; &nbsp;&nbsp;<span style=\"font-size: 14px;\">(0896.035.789). Để biết thêm chi tiết.</span></h1></div>', '1', '26900', '21000000000', '28', '98', '0', '', null, null, 'danghien', '1571850000', '1571881448', '6', '0', '0', '1', '1');
INSERT INTO `tbl_contents` VALUES ('39', '68', 'Bán đất lương sơn hòa bình 4766m2 thổ cư có 1000m đất xây dựng,bám Hồ đồng chanh 100m cực đẹp 0332363839', 'ban-dat-luong-son-hoa-binh-4766m2-tho-cu-co-1000m-dat-xay-dungbam-ho-dong-chanh-100m-cuc-dep-0332363839', 'http://localhost/dulich/images/img20190211163738.jpg', '[{\"url\":\"http://localhost/dulich/images/img20191025045420.jpg\",\"alt\":\"\"},{\"url\":\"http://localhost/dulich/images/img20191025045424.jpg\",\"alt\":\"\"},{\"url\":\"http://localhost/dulich/images/img20191025045403.jpg\",\"alt\":\"\"},{\"url\":\"http://localhost/dulich/images/img20190918161637.jpg\",\"alt\":\"\"},{\"url\":\"http://localhost/dulich/images/img20190616112431.jpg\",\"alt\":\"\"}]', null, 'Hồ Đồng Chanh rộng hơn 30ha xung quanh hồ đã kín các đại gia về xây biệt phủ còn sót lại một lô duy nhất với diện tích 4766m2 có 1000m đất xây dựng, rất phù hợp để làm trang trại, khu nghỉ dưỡng, biệt phủ ven hồ, cách Hà Nội tầm 40km, nhanh tay số lượng có hạn.', '<div class=\"kqchitiet\" style=\"font-family: Tahoma; font-size: 12px; margin: 0px 0px 10px; padding: 0px; position: relative; line-height: 22px; background-color: rgb(255, 255, 255);\"><span class=\"diadiem-title mar-right-15\" style=\"margin: 0px 15px 0px 0px; padding: 0px; display: block;\"><span style=\"font-size: 14px; font-weight: bold;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(0, 0, 205);\"> Cần bán gấp lô đất thổ cư làm trang trại,khu nghỉ dưỡng, homstay bám mặt hồ Đồng Chanh có một không hai trong khu vực, với diện tích </span><span style=\"color: rgb(255, 0, 0);\">4766m2 trong đó có 1000m2</span><span style=\"color: rgb(0, 0, 205);\"> đất xây dựng, còn lại là đất trồng cây lâu năm,view mặt hồ tầm 100m.</span></span></span></div><div class=\"pm-content\" style=\"font-family: Tahoma; font-size: 13px; margin: 0px; padding: 0px; background-color: rgb(255, 255, 255);\"><div class=\"pm-desc\" style=\"font-size: 14px; margin: 0px; padding: 0px; line-height: 25.2px;\"><span style=\"font-weight: bold;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(0, 0, 205);\">Thế đất thoai thoải, tầm nhìn ra hồ đồng chanh có diện tích hơn 30ha.đã được kè bờ chắc chắn, không khí trong làng mát mẻ,đời sống dân trí cao, an ninh bảo đảm, rất phù hợp để làm trang trại, khu nghỉ dưỡng, biệt thự nhà vườn, homstay.Do diện tích đất nhà ở lớn nên quý khách hàng có thể xây dựng được ngay mà k cần phải xin phép.</span><br style=\"line-height: 25.2px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(0, 0, 205);\"> Trong khu vực có nhiều đại gia Hà Thành về xây dựng biệt phủ, trang trại khu nghỉ dưỡng cuối tuần, làm homsatay tạo nên một quần thể, cộng đồng người Hà Nội trong khu vực.</span><br style=\"line-height: 25.2px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(0, 0, 205);\"> Giao thông thuận tiện cách đường HCM tầm 3km, thị trấn xuân mai khoảng 5km, </span><span style=\"color: rgb(255, 0, 0);\">Hà Nội tầm 40km</span><span style=\"color: rgb(0, 0, 205);\">.</span></span></div><div class=\"pm-desc\" style=\"font-size: 14px; margin: 0px; padding: 0px; line-height: 25.2px;\"><span style=\"font-weight: bold; color: rgb(255, 0, 0);\">+ Gía bán 7.5 tỷ</span><span style=\"font-weight: bold;\"><span style=\"color: rgb(0, 0, 205);\"><br style=\"line-height: 25.2px;\"></span><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(0, 0, 205);\"> Để biết thêm chi tiết LH Đăng Hiển </span><span style=\"color: rgb(255, 0, 0);\">0332363839&nbsp; &nbsp; -&nbsp; &nbsp; &nbsp;0896035789</span></span></div><div class=\"pm-desc\" style=\"font-size: 14px; margin: 0px; padding: 0px; line-height: 25.2px;\"><span style=\"font-weight: bold;\"><span style=\"color: rgb(255, 0, 0);\">-</span><span style=\"color: rgb(0, 0, 205);\"> Thủ tục sang nhượng nhanh gọn, đúng quy định của pháp luật..</span></span></div></div>', '1', '4766', '7500000000', '28', '98', '0', '', null, null, 'danghien', '1571936400', '1572645847', '3', '0', '0', '1', '1');
INSERT INTO `tbl_contents` VALUES ('40', '71', 'Bán đất Kim Bôi, Hòa Bình, 5,3ha đất thổ cư trang trại lợn giá rẻ thuận tiện giao thông 0332363839', 'ban-dat-kim-boi-hoa-binh-53ha-dat-tho-cu-trang-trai-lon-gia-re-thuan-tien-giao-thong-0332363839', 'http://localhost/dulich/images/img20191019052354.jpg', '[{\"url\":\"http://localhost/dulich/images/img20191019055059.jpg\",\"alt\":\"\"},{\"url\":\"http://localhost/dulich/images/img20191019055106.jpg\",\"alt\":\"\"},{\"url\":\"http://localhost/dulich/images/img20191019052348.jpg\",\"alt\":\"\"}]', null, '5.3ha đất thổ cư, có 400m2 đất nhà ở, còn lại là đất nông nghiệp khác, đã xây dựng 2 chuồng nuôi với trữ lượng vài nghìn con đang hoạt động rất hiệu quả, đầy đủ các loại giấy tờ, thủ tục, thời hạn còn khoảng 40 năm. giao thông thuận tiện. cách hà nội tầm 70km.rất thiện trí bán cần sang nhượng cho ai có nhu cầu.', '<div class=\"pm-title\" style=\"font-family: tahoma; font-size: 14px; margin: 0px 0px 10px; padding: 0px 0px 10px; font-weight: bold; border: 0px; background-color: rgb(255, 255, 255);\"><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"font-size: 14px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\">Cần bán gấp đất thổ cư tại Kim Bôi, Hòa Bình, diện tích </span><span style=\"color: rgb(255, 0, 0);\">5.3ha trong đó có 400m2 </span><span style=\"color: rgb(5, 86, 153);\">đất nhà ở còn lại là đất Nông nghiệp khác, hiện tại đã xây dựng một trang trại lợn quy mô tầm vài nghìn con.</span></span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\">Đã có đầy đủ các loại giấy tờ, giấy phép trang trại đang hoạt động cũng rất hiệu quả, giá Lợn đang lên cao nhưng do tuổi tác gia đình muốn chuyển nhượng lại cho ai có nhu cầu.</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> Ngoài việc nuôi lợn quý khách hàng còn trồng keo, cây lấy gỗ xung quanh để tạo thêm thu nhập.</span></h1><div><span style=\"color: rgb(255, 0, 0);\">+&nbsp;</span><span style=\"color: rgb(5, 86, 153); font-family: Tahoma; font-size: 16px;\">&nbsp;Giao thông thuận tiện, cách đường nhựa liên huyện 12b tầm 4km, đường&nbsp;</span><span style=\"font-family: Tahoma; font-size: 16px; color: rgb(255, 0, 0);\"> Hà Nội khoảng 70km</span><span style=\"color: rgb(5, 86, 153); font-family: Tahoma; font-size: 16px;\"> đi theo đường QL6</span></div><div><span style=\"font-family: Tahoma; font-size: 16px; color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153); font-family: Tahoma; font-size: 16px;\"> ĐC : xã Hùng tiến, huyện Kim Bôi, tỉnh Hòa Bình</span></div><div style=\"\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> </span><span style=\"color: rgb(255, 0, 0);\">Gía bán : 5 tỷ</span></div><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\">Quý khách hàng xin vui lòng LH Đăng Hiển</span><span style=\"color: rgb(255, 0, 0);\"> 0332363839&nbsp; &nbsp;(0896.035.789)</span><span style=\"color: rgb(5, 86, 153);\">&nbsp; &nbsp;để được xem đất.</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\">Thủ tục sang nhượng nhanh gọn đúng quy định của pháp luật.</span></h1><div><span style=\"color: rgb(5, 86, 153);\"><br></span></div></div>', '1', '53000', '5000000000', '28', '99', '0', '', null, null, 'danghien', '1571936400', '1572643852', '2', '0', '0', '1', '1');
INSERT INTO `tbl_contents` VALUES ('41', '72', 'Bán đất kim bôi hòa bình 5.8ha đất doanh nghiệp làm công ty,kho xưởng,bám đường nhựa 500m 0332363839', 'ban-dat-kim-boi-hoa-binh-58ha-dat-doanh-nghiep-lam-cong-tykho-xuongbam-duong-nhua-500m-0332363839', 'http://localhost/dulich/images/img20191025063755.jpg', '[{\"url\":\"http://localhost/dulich/images/img20191025063755.jpg\",\"alt\":\"\"},{\"url\":\"http://localhost/dulich/images/img20191025063736.jpg\",\"alt\":\"\"},{\"url\":\"http://localhost/dulich/images/img20191025063747.jpg\",\"alt\":\"\"}]', null, '1 lô duy nhất DT 5.8ha đã có sổ đỏ đất sản xuất kinh doanh,bám mặt đường nhựa liên huyện ATK 500m, thế đất thoải, tương đối phẳng,không mất công san lấp, làm cty, kho xưởng, trạm chế biến nông lâm sản thì quá đẹp, nhân công tại chỗ giá rẻ, giao thông thuận tiện cách Hà Nội tầm 65km.', '<div class=\"pm-title\" style=\"font-family: tahoma; font-size: 14px; margin: 0px 0px 10px; padding: 0px 0px 10px; font-weight: bold; border: 0px; background-color: rgb(255, 255, 255);\"><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"font-size: 14px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> Cần bán gấp </span><span style=\"color: rgb(255, 0, 0);\">5.8ha đất sản xuất kinh doanh</span><span style=\"color: rgb(5, 86, 153);\">, bám mặt đường nhựa liên huyện 500m, địa hình tương đối bằng phẳng, nền đất chắc chắn, thoải sườn đồi, view nhìn ra sông cực đẹp.</span></span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> Rất phù hợp để làm công ty, kho xưởng, cơ sở chế biến nông lâm sản nhân công tại chỗ giá rẻ.</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> Giao thông thuận tiện cách Hà Nội tầm </span><span style=\"color: rgb(255, 0, 0);\">65km.</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+ Gía bán : 9 tỷ</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> Để biết thêm chi tiết quý khách hàng vui lòng LH </span><span style=\"color: rgb(255, 0, 0);\">Đăng Hiển 0332363839&nbsp; &nbsp;-&nbsp; &nbsp;0896035789.</span></h1></div>', '1', '58000', '9000000000', '28', '99', '0', '', null, null, 'danghien', '1571936400', '1572643497', '5', '0', '0', '1', '1');
INSERT INTO `tbl_contents` VALUES ('42', '71', 'Bán đất lương sơn hòa bình 7000m2 thổ cư làm trang trại, khu nghỉ dưỡng,homestay ngay sát sân golf Sky Lake giá rẻ. 0332363839', 'ban-dat-luong-son-hoa-binh-7000m2-tho-cu-lam-trang-trai-khu-nghi-duonghomestay-ngay-sat-san-golf-sky-lake-gia-re-0332363839', 'http://localhost/dulich/images/img20190715142630.jpg', '[{\"url\":\"http://localhost/dulich/images/img20190715142645.jpg\",\"alt\":\"\"},{\"url\":\"http://localhost/dulich/images/img20190715142614.jpg\",\"alt\":\"\"},{\"url\":\"http://localhost/dulich/images/img20190715142617.jpg\",\"alt\":\"\"}]', null, '7000m2 thổ cư đã xây dựng cơ bản hoàn thiện, tường bao vây xung quanh, ao kè bờ chắc chắn, có bể bơi ngoài trời, đã trồng nhiều cây ăn quả, cây hoa, cây cảnh có giá trị kinh tế cao, rất phù hợp làm trang trại, khu nghỉ dưỡng  homestay ngay sát sân golf Sky Lake,giao thông thuận tiện đường bê tông vào tận nơi.', '<div class=\"pm-title\" style=\"font-family: tahoma; font-size: 14px; margin: 0px 0px 10px; padding: 0px 0px 10px; font-weight: bold; border: 0px;\"><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"background-color: rgb(255, 255, 255); font-size: 14px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\">Cần bán gấp </span><span style=\"color: rgb(255, 0, 0);\">7000m2 đất thổ cư có 400m2</span><span style=\"color: rgb(5, 86, 153);\"> đất nhà ở, còn lại là đất trồng cây lâu năm, đã được xây tường bao quanh kín đáo, ao to rộng được kè bờ chắc chắn, trong vườn có nhiều cây ăn quả, cây bóng mát có giá trị kinh tế cao.</span></span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\">Không khí trong lành yên tĩnh, an ninh bảo đảm, đời sống dân trí cao, ngay sát sân golf Sky Lake, cách đường HCM tầm 3km, trung tâm thị trấn Xuân Mai tầm 12 km, </span><span style=\"color: rgb(255, 0, 0);\">cách Hà Nội tầm 42km.</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\">rất phù hợp cho làm biệt thự nhà vườn, khu nghỉ dưỡng cuối tuần, homestay, trang trại nuôi trồng thực phẩm sạch phục vụ gia đình.</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(0, 0, 128);\"> Đc&nbsp; &nbsp;:&nbsp; </span><span style=\"color: rgb(255, 0, 0);\">Xã Liên sơn, Huyện Luơng Sơn, Tỉnh Hòa Bình</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"background-color: rgb(255, 255, 255); font-size: 14px;\"> <span style=\"color: rgb(47, 79, 79);\">Giá bán</span><span style=\"color: rgb(255, 0, 0);\">&nbsp; &nbsp; :&nbsp; &nbsp;3.5 tỷ.&nbsp; &nbsp;&nbsp;</span></span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"background-color: rgb(255, 255, 255); font-size: 14px; color: rgb(47, 79, 79);\">Để biết thêm chi tiết LH Đăng Hiển </span><span style=\"background-color: rgb(255, 255, 255); font-size: 14px; color: rgb(255, 0, 0);\">0332363839 - 0896.035.789.</span></h1></div><div class=\"pm-content\" style=\"font-family: Tahoma; font-size: 13px; margin: 0px; padding: 0px;\"><div><br></div></div>', '1', '7000', '3500000000', '28', '98', '0', '', null, null, 'danghien', '1571936400', '1572642663', '3', '0', '0', '1', '1');
INSERT INTO `tbl_contents` VALUES ('43', '71', 'Bán đất chương mỹ hà nội 4100m2 đất  thổ cư, hòn đảo nhỏ xung quanh là hồ làm nghỉ dưỡng, đẹp và rẻ nhất khu vực 0332363839', 'ban-dat-chuong-my-ha-noi-4100m2-dat-tho-cu-hon-dao-nho-xung-quanh-la-ho-lam-nghi-duong-dep-va-re-nhat-khu-vuc-0332363839', 'http://localhost/dulich/images/img20181225171606.jpg', '[{\"url\":\"http://localhost/dulich/images/img20190613123117.jpg\",\"alt\":\"\"},{\"url\":\"http://localhost/dulich/images/img20190520180251.jpg\",\"alt\":\"\"}]', null, 'Đất thổ cư giá rẻ chỉ với 1,3tr/m2 trong khi đó thị trường bán đất chưa sổ cũng toàn tầm 2tr trở lên, đường bê tông rộng xe to vào thoải mái, khu đất giống như một ốc đảo xung quanh là mặt nước,đã trồng bưởi diễn các cây ăn quả kín vườn, cách đường QL6 tầm 300m.làm trang trại,khu nghỉ dưỡng, biệt phủ thì quá đỉnh...', '<div class=\"pm-title\" style=\"font-family: tahoma; font-size: 14px; margin: 0px 0px 10px; padding: 0px 0px 10px; font-weight: bold; border: 0px; background-color: rgb(255, 255, 255);\"><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; text-decoration: none; padding: 0px;\"><span style=\"font-size: 14px; font-weight: 400; color: rgb(255, 0, 0);\">+ </span><span style=\"font-size: 14px; font-weight: 400; color: rgb(0, 0, 205);\">Gia đình cần bán 4100m2 đất sổ đỏ, có 120m2 đất nhà ở, còn lại là đất trồng cây lâu năm, có 2 ao to rộng. Xung quanh là hồ giống như một bán đảo, cực kỳ mát mẻ, thoáng đãng, trong đất trồng nhiều cây ăn quả như bưởi diễn, nhãn, mít.. Cây bóng mát, cây cảnh có giá trị kinh tế cao, đang cho thu hoạch.</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><div class=\"pm-content\" style=\"font-size: 13px; margin: 0px; padding: 0px; font-weight: 400;\"><div class=\"pm-desc\" style=\"font-size: 14px; margin: 0px; padding: 0px; line-height: 25.2px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(0, 0, 205);\"> Thế đất vắn bằng phẳng, chất đất tốt, nền đất chắc chắn, nằm trong khu vực đông dân cư, đời sống, dân trí cao.</span><br style=\"line-height: 25.2px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(0, 0, 205);\"> Không khí trong lành sạch sẽ, an ninh bảo đảm, rất phù hợp cho việc nghỉ dưỡng sinh thái, biệt thự nhà vườn kết hợp nuôi trồng thực phẩm sạch phục vụ gia đình.</span><br style=\"line-height: 25.2px;\"><span style=\"color: rgb(255, 0, 0);\">+&nbsp;</span><span style=\"color: rgb(0, 0, 205);\">Cách đường QL6 tầm khoảng 300m, đường to rộng, xe ô tô vào thoải mái, cách trung tâm mua sắm thị trấn Xuân Mai khoảng 2.5km, bên cạnh gần trường cấp 1,2,3 và chợ. Cách Hà Nội khoảng 45p lái xe, khi đường Ql6 mở rộng thòi gian còn rút ngắn hơn nữa.</span><br style=\"line-height: 25.2px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(0, 0, 205);\"> Địa chỉ&nbsp; &nbsp; &nbsp;Xuân Mai, Chương Mỹ, Hà Nội.</span><br style=\"line-height: 25.2px;\"><span style=\"color: rgb(255, 0, 0);\">+&nbsp;</span><span style=\"color: rgb(0, 0, 205);\">Giá bán: 5.5 tỷ</span><br style=\"line-height: 25.2px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(0, 0, 205);\"> Mọi chi tiết xin vui lòng LH Đăng Hiển 0332363839&nbsp; &nbsp; &nbsp; (0896.035.789).</span></div></div></h1></div>', '1', '4100', '5500000000', '0', '0', '0', '', null, null, 'danghien', '1572022800', '1572642395', '2', '0', '0', '1', '1');
INSERT INTO `tbl_contents` VALUES ('44', '68', 'Bán đất kỳ sơn hòa bình 1.4ha đất dự án nhà máy, cây xăng bám QL6 tầm 80m 0332363839', 'ban-dat-ky-son-hoa-binh-14ha-dat-du-an-nha-may-cay-xang-bam-ql6-tam-80m-0332363839', 'http://localhost/dulich/images/img20181111100904.jpg', '[{\"url\":\"http://localhost/dulich/images/img20180919144411.jpg\",\"alt\":\"\"},{\"url\":\"http://localhost/dulich/images/img20180919144415.jpg\",\"alt\":\"\"}]', null, '1.4ha đầy đủ các điều kiện sổ sách, giấy tờ, giao thông, điện nước để làm công ty nhà máy, kho xưởng, địa hình bằng phẳng không phải san lấp, giá rẻ, cách Hà Nội tầm 55km.', '<div class=\"pm-title\" style=\"font-family: tahoma; font-size: 14px; margin: 0px 0px 10px; padding: 0px 0px 10px; font-weight: bold; border: 0px; background-color: rgb(255, 255, 255);\"><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"font-size: 14px; color: rgb(255, 0, 0);\">&nbsp; &nbsp; &nbsp; Lô 1</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"font-size: 14px;\"><span style=\"color: rgb(255, 0, 0);\">+ </span><span style=\"color: rgb(0, 0, 205);\">DT</span><span style=\"color: rgb(255, 0, 0);\">&nbsp;1.4ha</span><span style=\"color: rgb(5, 86, 153);\"> đất dự án làm nhà máy chế biến nông sản, và cây xăng, lô đất bám mặt đường QL6 tầm 80m, phía sau là suối nước chảy quanh năm, điện 3 pha thì ngay cạnh.</span></span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+&nbsp;</span><span style=\"color: rgb(5, 86, 153);\">Là khu vực được quy hoạch phát triển công nghiệp của tỉnh, hiện tại đã có nhiều công ty, nhà máy về xây dựng và hoạt động rất hiệu quả, ít thời gian nữa sẽ có con đường nối từ đường 6 sang đường Đại lộ Hòa Bình Hà Nội ngay cạnh đó, rất thuận tiên giao thông, Nhân công tại chỗ. Mặt bằng đã hoàn thiện chủ việc xây dựng</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> Cách Hà Nội tầm 55km</span></h1><div><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> Gía bán&nbsp; &nbsp;: </span><span style=\"color: rgb(255, 0, 0);\">14 tỷ</span></div><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> Thủ tục pháp lý giấy tờ đầy đủ, nhanh gọn đúng quy định của Pháp luật.</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\"><br></span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">* Lô 2:</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> Diện tích </span><span style=\"color: rgb(255, 0, 0);\">1.5ha </span><span style=\"color: rgb(5, 86, 153);\">đất thổ cư có 1000m2 đất nhà ở, còn lại là đất trồng cây lâu năm. Địa hình bằng phẳng nền đất chắc chắn,có suối chảy quanh năm, điện 3 pha ngay tại đất tiện cho việc hạ trạm, xe công vào thoải mái.</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> Cách đường QL6 tầm 1km, Hà Nội tầm </span><span style=\"color: rgb(255, 0, 0);\">32km</span><span style=\"color: rgb(5, 86, 153);\">.</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> Đc Hòa Sơn, Lương Sơn, Hòa Bình.</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> Giá bán </span><span style=\"color: rgb(255, 0, 0);\">11 tỷ&nbsp;</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(0, 0, 128);\">Mọi chi tiết quý khách hàng vui lòng LH Đăng Hiển</span><span style=\"color: rgb(0, 0, 205);\"> </span><span style=\"color: rgb(255, 0, 0);\">0332363839</span><span style=\"color: rgb(0, 0, 205);\">&nbsp;</span><span style=\"color: rgb(255, 0, 0);\"> - 0896. 035.789</span><span style=\"color: rgb(0, 0, 205);\">.</span></h1></div>', '1', '14000', '14000000000', '28', '97', '0', '', null, null, 'danghien', '1572022800', '1572618431', '2', '0', '0', '1', '1');
INSERT INTO `tbl_contents` VALUES ('45', '68', 'Bán đất Lương Sơn Hòa Bình 3240m2 làm trang trại nghỉ dưỡng,view ruộng cực đẹp, giá rẻ giao thông thuận tiện 0332363839', 'ban-dat-luong-son-hoa-binh-3240m2-lam-trang-trai-nghi-duongview-ruong-cuc-dep-gia-re-giao-thong-thuan-tien-0332363839', 'http://localhost/dulich/images/img20190710133256.jpg', '[{\"url\":\"http://localhost/dulich/images/img20191026120110.jpg\",\"alt\":\"\"},{\"url\":\"http://localhost/dulich/images/img15625699582731562646127686.jpg\",\"alt\":\"\"}]', null, 'thế đất bằng phẳng, chất đất tốt, view ruộng cực đẹp, giao thông thuận tiện đường bê tông vào tận nơi, không khí trong lành mát mẻ,rất phù hợp làm trang trại, khu nghỉ dưỡng, homestay..', '<div class=\"pm-title\" style=\"font-family: tahoma; font-size: 14px; margin: 0px 0px 10px; padding: 0px 0px 10px; font-weight: bold; border: 0px; background-color: rgb(255, 255, 255);\"><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"font-size: 14px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> Do cần tiền đầu tư gia đình muốn chuyển nhượng </span><span style=\"color: rgb(255, 0, 0);\">3240m2 đất thổ cư</span><span style=\"color: rgb(5, 86, 153);\"> trong đó có </span><span style=\"color: rgb(255, 0, 0);\">400m2 đất nhà ở</span><span style=\"color: rgb(5, 86, 153);\">, còn lại là đất trồng cây lâu năm.vew ruộng cực đep, quý khách hàng có thể mua ruộng mở rộng làm ao thì quá đỉnh.</span></span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> Thế đất bằng phẳng, chất đất tốt rất thuận tiện cho việc trồng cây, trồng rau. Quý khách hàng chỉ cần cải tạo thêm một chút nữa là sẽ trở thành trang trại nghỉ dưỡng với đủ các loại hoa trái quanh năm.</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> Không khí trong lành sạch sẽ, an ninh bảo đảm, trong khu vực có nhiều nhà Hà Nội về xây dựng biệt phủ, trang trại nhà vườn, bên cạnh có khu nông trại 2ha khách trr 10 tỷ chưa bán.Nằm trong vùng quy hoạch vành đai xanh của huyện nên không sợ bởi sự chen lấn chuồng trại, công ty, xí nghiệp...</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> Giao thông thuận tiện, đường bê tông vào tận nơi. Cách đường 6 tầm 4km, </span><span style=\"color: rgb(255, 0, 0);\">Hà Nội khoảng 40km</span><span style=\"color: rgb(5, 86, 153);\">, thời gian sẽ được rút ngắn nữa khi đường 6 được mở rộng.</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\">Giá bán </span><span style=\"color: rgb(255, 0, 0);\">1.5 tỷ </span><span style=\"color: rgb(5, 86, 153);\">đất đẹp giá rẻ Đang cần bán gấp để giải quyết công việc.</span></h1><div style=\"\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> Địa chỉ&nbsp; &nbsp; : </span><span style=\"color: rgb(255, 0, 0);\">Hợp Hòa, Lương Sơn, Hòa Bình</span></div><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\">Quý khách vui lòng LH Đăng Hiển </span><span style=\"color: rgb(255, 0, 0);\">0332363839&nbsp; (0896.035.789)</span><span style=\"color: rgb(5, 86, 153);\"> để được xem đất và gặp chủ.</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> Thủ tục sang nhượng nhanh gọn, đúng quy định của pháp luật</span></h1></div>', '1', '3240', '1500000000', '28', '98', '99', '', null, null, 'danghien', '1572022800', '1572617320', '1', '0', '0', '1', '1');
INSERT INTO `tbl_contents` VALUES ('46', '71', 'Bán đất lương sơn hòa bình 9ha đất thổ cư làm trang trại, khu nghỉ dưỡng, bên cạnh là dự án nghỉ dưỡng 70ha 0332363839', 'ban-dat-luong-son-hoa-binh-9ha-dat-tho-cu-lam-trang-trai-khu-nghi-duong-ben-canh-la-du-an-nghi-duong-70ha-0332363839', 'http://localhost/dulich/images/img20190811160753.jpg', '[{\"url\":\"http://localhost/dulich/images/img20181227104800.jpg\",\"alt\":\"\"},{\"url\":\"http://localhost/dulich/images/img20190811160805.jpg\",\"alt\":\"\"},{\"url\":\"http://localhost/dulich/images/img20190811155458.jpg\",\"alt\":\"\"},{\"url\":\"http://localhost/dulich/images/img20190811160726.jpg\",\"alt\":\"\"}]', null, '9ha  phẳng đét như sân mỹ đình, lưng tựa núi, phía trước là đường bê tông xóm và đường điện 3pha,rất phù hợp làm trang trại, khu nghỉ dưỡng,homstay , trồng rau sạch..,giao thông thuận tiện,cách đường 6 tầm 5km, Hà Nội tầm 45km', '<div class=\"pm-title\" style=\"font-family: tahoma; font-size: 14px; margin: 0px 0px 10px; padding: 0px 0px 10px; font-weight: bold; border: 0px; background-color: rgb(255, 255, 255);\"><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"font-size: 14px;\"><span style=\"color: rgb(255, 0, 0);\">+ </span><span style=\"color: rgb(5, 86, 153);\">Cần bán gấp</span><span style=\"color: rgb(255, 0, 0);\"> 9ha thổ cư</span><span style=\"color: rgb(5, 86, 153);\">, trong đó có </span><span style=\"color: rgb(255, 0, 0);\">400m2 đất nhà ở,</span><span style=\"color: rgb(5, 86, 153);\"> còn lại là đất trồng cây lâu năm.</span></span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> Địa hình bằng phẳng, toàn bộ khu đất là triền ruộng, phía sau là dãy núi đá hùng vĩ, có đường lên tận đỉnh, phía trước giáp đường bê tông của xóm. Nhìn cảnh vật rất nên thơ. Qúy khách hàng có thể làm đường, lắp thang máy lên đỉnh núi đá, trên đó có thể tận dụng để làm bể bơi và các hoạt động khác bảo đảm 100% ai cũng muốn đến.</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> Hiện tại đã được mua gom, và ra sổ đất trồng cây lâu năm, thế đất rất đẹp có một không hai trong khu vực, quý khách hàng có thể xây dựng thiết kế tùy ý, có thể làm biệt thự nhà vườn, hay khu resort, homestay trải nghiệm nông nghiệp... Hay làm trang trại trồng rau sạch.... Bên cạnh là dự án nghỉ dưỡng 70ha, và dự án sân golf đã được phê duyệt, và đền bù xong, chuẩn bị xây dựng.</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> Vị trí đắc địa, giao thông thuận tiện, cách đường Ql 6 tầm 5km, </span><span style=\"color: rgb(255, 0, 0);\">Hà Nội khoảng 45km.</span></h1><div><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> Gía bán&nbsp; &nbsp; &nbsp;:&nbsp; 12 tỷ</span></div><div><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> ĐC : </span><span style=\"color: rgb(255, 0, 0);\">Cao Răm, Lương Sơn, Hòa Bình</span></div><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+&nbsp;</span><span style=\"color: rgb(5, 86, 153);\">Để biết thêm chi tiết quý khách hàng xin vui lòng liên hệ&nbsp; &nbsp;Đăng Hiển&nbsp; &nbsp;</span><span style=\"color: rgb(255, 0, 0);\">0332363839 - 0896.035.789.</span></h1></div>', '1', '90000', '12000000000', '28', '98', '100', '', null, null, 'danghien', '1572022800', '1572574017', '2', '0', '0', '1', '1');
INSERT INTO `tbl_contents` VALUES ('47', '70', 'Bán đất tại xuân mai chương mỹ hà nội 2700m2 thổ cư, làm biệt thự nhà vườn, nghỉ dưỡng, phân lô bán nền 0332363839', 'ban-dat-tai-xuan-mai-chuong-my-ha-noi-2700m2-tho-cu-lam-biet-thu-nha-vuon-nghi-duong-phan-lo-ban-nen-0332363839', 'http://localhost/dulich/images/img20190829160642.jpg', '[{\"url\":\"http://localhost/dulich/images/img20190829161150.jpg\",\"alt\":\"\"},{\"url\":\"http://localhost/dulich/images/img20190829160642.jpg\",\"alt\":\"\"}]', null, '2700m2 thổ cư có 120m đất nhà ở, còn lại là đất trồng cây lâu năm, có Ao, view thoáng, đẹp phù hợpn làm trang trại, khu nghỉ dưỡng, biệt thự nhà vườn, nuôi trồng thực phẩm sạch phục vụ gia đình,phân lô bán nền , gần đường QL6, và trung tâm mua sắm của thi trấn.', '<div class=\"pm-title\" style=\"font-family: tahoma; font-size: 14px; margin: 0px 0px 10px; padding: 0px 0px 10px; font-weight: bold; border: 0px; background-color: rgb(255, 255, 255);\"><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"font-size: 14px;\"><span style=\"color: rgb(255, 0, 0);\">+ </span><span style=\"color: rgb(5, 86, 153);\">Gia đình cần bán </span><span style=\"color: rgb(255, 0, 0);\">2700m2 đất sổ đỏ, có 120m2 đất nhà ở</span><span style=\"color: rgb(5, 86, 153);\">, còn lại là đất trồng cây lâu năm, có ao to rộng. Trong vườn đã trồng toàn bộ là bưởi diễn được hơn trục năm chất lượng tốt đang cho thu hoạch.</span></span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\">Không khí trong lành, yên tĩnh, mát mẻ, thoáng đãng, thế đất thoai thoải, chất đất tốt, nền đất chắc chắn, nằm trong khu vực đông dân cư, đời sống, dân trí cao, an ninh bảo đảm.</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> Rất phù hợp cho việc nghỉ dưỡng sinh thái, biệt thự nhà vườn kết hợp nuôi trồng thực phẩm sạch phục vụ gia đình. Đường to rộng có thể chia đôi để phân lô, bán nền, hiện tại nhu cầu nhà ở của người dân trong khu vực và giới đầu tư Hà Nội đang lên cao.</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\">Cách đường QL6 chưa đến 1km, đường to rộng, xe ô tô vào thoải mái, cách trung tâm mua sắm thị trấn Xuân Mai khoảng 2km, bên cạnh gần trường cấp 1,2,3. cách </span><span style=\"color: rgb(255, 0, 0);\">Hà Nội khoảng 30km</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> Địa chỉ Xuân Mai, Chương Mỹ, Hà Nội.</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> Giá bán: </span><span style=\"color: rgb(255, 0, 0);\">1.5tr/m2.</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> Mọi chi tiết xin vui lòng LH Đăng Hiển&nbsp; &nbsp; &nbsp;:</span><span style=\"color: rgb(255, 0, 0);\"> 0332363839&nbsp; &nbsp; &nbsp;(0896.035.789).</span></h1></div>', '1', '2700', '1500000', '1', '89', '111', '', null, null, 'danghien', '1572022800', '1572616847', '1', '0', '0', '1', '1');
INSERT INTO `tbl_contents` VALUES ('48', '70', 'Bán đất lương sơn hòa bình 3500m2 thổ cư, làm trang trại,khu nghỉ dưỡng,có ao, view cánh đồng giá rẻ 0332363839', 'ban-dat-luong-son-hoa-binh-3500m2-tho-cu-lam-trang-traikhu-nghi-duongco-ao-view-canh-dong-gia-re-0332363839', 'http://localhost/dulich/images/img20190914161538.jpg', '[{\"url\":\"http://localhost/dulich/images/img20190914161620.jpg\",\"alt\":\"\"},{\"url\":\"http://localhost/dulich/images/img20190914161630.jpg\",\"alt\":\"\"}]', null, 'đất đẹp giá rẻ dt 3500m2  có ao, tường bao vây xung quanh, bám mặt đường bê tông xóm 50m, xe 45 chỗ vào thoải mái, view cánh đồng cực đẹp, cách QL6 tầm 2km, Hà Nội 32km,làm trang trại,khu nghỉ dưỡng, homestay thì quá đỉnh.', '<div class=\"pm-title\" style=\"font-family: tahoma; font-size: 14px; margin: 0px 0px 10px; padding: 0px 0px 10px; font-weight: bold; border: 0px; background-color: rgb(255, 255, 255);\"><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"font-size: 14px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> Cần bán </span><span style=\"color: rgb(255, 0, 0);\">3500m2 đất thổ cư</span><span style=\"color: rgb(5, 86, 153);\"> trong đó có </span><span style=\"color: rgb(255, 0, 0);\">400m2 đất nhà ở</span><span style=\"color: rgb(5, 86, 153);\">, còn lại là đất trồng cây lâu năm, mặt đường bê tông xóm tầm 60m (đã có cột mốc trong vài năm tới sẽ làm đương nhựa lớn nối liền giữa phố chợ Lương Sơn với đường HCM). Bác nào mua đầu tư bảo đảm trúng 100%. (Có thể làm BT nhà vườn, có thể làm cty, kho xưởng thoải mái).</span></span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> Thế đất bằng phẳng, nền đất chắc chắn, có ao nước, tường bao vây quanh, ranh giới rõ ràng, Trong vườn có 1 số cây ăn quả như sấu, xoài, mít đang cho thu hoạch, view nhìn ra cánh đồng cực đẹp, cực thoáng mát...</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> Không khí trong lành, sạch sẽ, yên tĩnh, trật tự, an ninh bảo đảm, đời sống dân trí cao... Phù hợp cho việc xây dựng biệt thự nhà vườn, khu nghỉ dưỡng cuối tuần nuôi trồng thực phẩm sạch phục vụ gia đình.</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> Cách đường Quốc Lộ 6 khoảng 2km, </span><span style=\"color: rgb(255, 0, 0);\">trung tâm TP Hà Nội 32km</span><span style=\"color: rgb(5, 86, 153);\">.</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> Địa chỉ: </span><span style=\"color: rgb(255, 0, 0);\">Nhuận Trạch,Lương Sơn, Hòa Bình</span><span style=\"color: rgb(5, 86, 153);\">.</span></h1><div><span style=\"color: rgb(5, 86, 153);\">+ Gia bán&nbsp; &nbsp;: </span><span style=\"color: rgb(255, 0, 0);\">2 tỷ</span></div><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> Để biết thêm chi tiết LH </span><span style=\"color: rgb(255, 0, 0);\">Đăng Hiển&nbsp; &nbsp;&nbsp;</span><span style=\"color: rgb(255, 0, 0);\">0332363839&nbsp; &nbsp;(0896.035.789). để được xem đất và gặp chủ.</span></h1><div><span style=\"color: rgb(255, 0, 0);\"><br></span></div><div><span style=\"color: rgb(255, 0, 0);\">&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</span></div><div><span style=\"color: rgb(255, 0, 0);\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<iframe width=\"560\" height=\"320\" src=\"https://www.youtube.com/embed/nGuEazcXW44\" frameborder=\"0\" allowfullscreen=\"\"></iframe></span></div><div><span style=\"color: rgb(255, 0, 0);\"><br></span></div><div><span style=\"color: rgb(255, 0, 0);\"><br></span></div></div>', '1', '3500', '2000000000', '28', '98', '96', '', null, null, 'danghien', '1572022800', '1575069008', '2', '0', '0', '1', '1');
INSERT INTO `tbl_contents` VALUES ('49', '70', 'Bán đất Lương Sơn Hòa Bình  5000m2thổ cư làm trang trại,cty,kho xưởng,đường to điện nước đầy đủ 0332363839', 'ban-dat-luong-son-hoa-binh-5000m2tho-cu-lam-trang-traictykho-xuongduong-to-dien-nuoc-day-du-0332363839', 'http://localhost/dulich/images/img20191025102028.jpg', '[{\"url\":\"http://localhost/dulich/images/img20191025101859.jpg\",\"alt\":\"\"},{\"url\":\"http://localhost/dulich/images/img20191025101842.jpg\",\"alt\":\"\"}]', null, 'Bán 5000m2 đất thổ cư đa tác dụng làm trang trại, bt nhà vườn, khu nghỉ dưỡng cuối tuần, công ty kho, xưởng, đường to rộng, điện nước đầy đủ,cách Hà Nội tầm 38km.', '<div class=\"pm-title\" style=\"font-family: tahoma; font-size: 14px; margin: 0px 0px 10px; padding: 0px 0px 10px; font-weight: bold; border: 0px; background-color: rgb(255, 255, 255);\"><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"font-size: 14px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\">Cần bán gấp </span><span style=\"color: rgb(255, 0, 0);\">5000m2 đất thổ cư, có 1200m2 đất nhà ở</span><span style=\"color: rgb(5, 86, 153);\">, còn lại là đất trồng cây lâu năm.mặt tiền bám ngõ tầm 40m.</span></span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\">Thế đất bằng phẳng, nền đất chắc chắn, ranh giới rõ ràng, giao thông thuận lợi, đường rộng xe oto to vào thoải mái.</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> Không khí trong lành sạch sẽ, an ninh bảo đảm, rất phù hợp cho việc làm trang trại nuôi trồng thực phẩm sạch phục vụ gia đình, làm cty, kho xưởng....</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> Cách đường nhựa liên xã 50m, QL6 tầm 3km, </span><span style=\"color: rgb(255, 0, 0);\">Hà Nội Khoảng 38 km.</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> ĐC: Hợp Hòa, Lương Sơn, Hòa Bình.</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\">Gía bán : </span><span style=\"color: rgb(255, 0, 0);\">2,2 tỷ</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\">Để biết thêm chi tiết quý khách hàng vui lòng LH Đăng Hiển </span><span style=\"color: rgb(255, 0, 0);\">0332363839&nbsp; (0896.035.789)</span><span style=\"color: rgb(5, 86, 153);\">.</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+T</span><span style=\"color: rgb(5, 86, 153);\">hủ tục sang nhượng nhanh gọn đúng quy định của pháp luật.</span></h1><div><span style=\"color: rgb(5, 86, 153);\"><br></span></div><div><h1 class=\"title style-scope ytd-video-primary-info-renderer\" style=\"margin: 0px; padding: 0px; border: 0px; background: rgb(249, 249, 249); max-height: 4.8rem; overflow: hidden; font-weight: 400; line-height: 2.4rem; color: var(--ytd-video-primary-info-renderer-title-color, var(--yt-spec-text-primary)); font-family: Roboto, Arial, sans-serif; font-size: var(--ytd-video-primary-info-renderer-title-font-size, 1.8rem); transform: var(--ytd-video-primary-info-renderer-title-transform, none); text-shadow: var(--ytd-video-primary-info-renderer-title-text-shadow, none);\"><iframe width=\"560\" height=\"320\" src=\"https://www.youtube.com/embed/rkc0ATw_UU0\" frameborder=\"0\" allowfullscreen=\"\"></iframe><br></h1></div></div>', '1', '5000', '2200000000', '28', '98', '99', '', null, null, 'danghien', '1572109200', '1572560417', '1', '0', '0', '1', '1');
INSERT INTO `tbl_contents` VALUES ('50', '70', 'Bán đất Kỳ Sơn Hòa Bình 4ha thổ cư làm trang trại nghỉ dưỡng,cty, kho xưởng,cách QL6 100m ,view cao,giá rẻ 0332363839', 'ban-dat-ky-son-hoa-binh-4ha-tho-cu-lam-trang-trai-nghi-duongcty-kho-xuongcach-ql6-100m-view-caogia-re-0332363839', 'http://localhost/dulich/images/screenshot2019-10-30-05-34-35-74.png', '[{\"url\":\"http://localhost/dulich/images/screenshot2019-10-30-05-33-51-28.png\",\"alt\":\"\"},{\"url\":\"http://localhost/dulich/images/screenshot2019-10-30-05-34-12-77.png\",\"alt\":\"\"}]', null, 'Đất đa chức năng view cao thoáng mát, gần đường QL6, diện tích rộng có thể làm Biệt thự, nhà vườn, trang trại khu nghỉ dưỡng, cty, kho xưởng....cách đường QL6 100m, Hà Nội 50km.', '<div class=\"pm-title\" style=\"font-family: tahoma; font-size: 14px; margin: 0px 0px 10px; padding: 0px 0px 10px; font-weight: bold; border: 0px; background-color: rgb(255, 255, 255);\"><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"font-size: 14px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> Cần bán gấp </span><span style=\"color: rgb(255, 0, 0);\">4ha</span><span style=\"color: rgb(5, 86, 153);\"> trong đó có </span><span style=\"color: rgb(255, 0, 0);\">900m2 đất nhà ở, 6000m2 đất vườn</span><span style=\"color: rgb(5, 86, 153);\">, còn lại 3.3ha là đất RSX đang làm thủ tục chuyển đổi sang đất vườn rất phù hợp làm trang trại, nghỉ dưỡng, biệt thự nhà vườn, homestay...</span></span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\">Thế đất thoải sườn đồi, view cao thoáng mát quan sát toàn bộ đường QL6, và khu vực thị trấn Kỳ sơn, TP Hòa Bình, phía trước mặt là dãy núi đá trùng trùng điệp điệp...</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> Không khí trong lành, mát mẻ, đời sống dân trí cao, an ninh bảo đảm, rất phù hợp để làm trang trại, nghỉ dưỡng, homestay mini, trang trại nuôi trồng thực phẩm sạch...</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(5, 86, 153);\">- Giao thông thuận tiện, xe 45 chỗ vào tận nơi, cách đường </span><span style=\"color: rgb(255, 0, 0);\">QL6 tầm 100 m, Hà Nội tầm 50km</span><span style=\"color: rgb(5, 86, 153);\">, trong vùng đã có nhiều dự án lớn như Dự án </span><span style=\"color: rgb(255, 0, 0);\">Hồ Dụ,SaKaNa,Oharafam, khu du lịch sinh thái thác thăng thiên, sân gol singgapo </span><span style=\"color: rgb(5, 86, 153);\">và nhiều đại gia Hà thành về mua đất làm trang trại, xây biệt phủ, kinh doanh homestay...quý khách hàng có thể san gạt tạo mặt bằng để làm cty kho xưởng</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> Địa chỉ: Dần Hòa,Kỳ Sơn, Hòa Bình.</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> Gía Bán : </span><span style=\"color: rgb(255, 0, 0);\">5 tỷ</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> Để biết thêm chi tiết xin vui lòng LH Đăng Hiển </span><span style=\"color: rgb(255, 0, 0);\">0332363839 (0896. 035.789)</span><span style=\"color: rgb(5, 86, 153);\"> để được xem đất và tư vấn nhiều lô đất đẹp, rẻ, làm trang trại, nghỉ dưỡng, kho xưởng xí nghiệp cty nhà máy...</span></h1><div><br><iframe width=\"560\" height=\"320\" src=\"https://www.youtube.com/embed/LAoMUOSg-EA\" frameborder=\"0\" allowfullscreen=\"\"></iframe><br></div></div>', '1', '43000', '5000000000', '28', '97', '127', '', null, null, 'danghien', '1572368400', '1572616900', '2', '0', '0', '1', '1');
INSERT INTO `tbl_contents` VALUES ('51', '71', 'Bán đất lương sơn hoa bình15.480m2thổ cư khuôn viên hoàn thien và nhiều đồ vật quý hiếm 0332363839', 'ban-dat-luong-son-hoa-binh15480m2tho-cu-khuon-vien-hoan-thien-va-nhieu-do-vat-quy-hiem-0332363839', 'http://localhost/dulich/images/img20181227104353.jpg', '[{\"url\":\"http://localhost/dulich/images/img20181227103521.jpg\",\"alt\":\"\"},{\"url\":\"http://localhost/dulich/images/img20181227104324.jpg\",\"alt\":\"\"},{\"url\":\"http://localhost/dulich/images/img20181227103512.jpg\",\"alt\":\"\"},{\"url\":\"http://localhost/dulich/images/img20181227104353.jpg\",\"alt\":\"\"}]', null, 'Biệt phủ ai ơi đẹp tuyệt vời\r\nVườn cây ao cá lá xanh tươi\r\nHoa thăm trái ngọt muôn đời thọ\r\nBiệt thự nhà sang thỏa mãn lòng', '<div class=\"kqchitiet\" style=\"font-family: Tahoma; font-size: 12px; margin: 0px 0px 10px; padding: 0px; position: relative; line-height: 22px; background-color: rgb(255, 255, 255);\"><span class=\"diadiem-title mar-right-15\" style=\"margin: 0px 15px 0px 0px; padding: 0px; display: block;\"><span style=\"font-size: 14px; font-weight: bold;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(0, 0, 205);\"> Cần bán </span><span style=\"color: rgb(255, 0, 0);\">15.480m2 </span><span style=\"color: rgb(0, 0, 205);\">khuôn viên hoàn thiện, biệt thự nhà vườn đẹp long lanh sổ đỏ.</span><span style=\"color: rgb(255, 0, 0);\"> 1100m2 đất nhà ở,</span><span style=\"color: rgb(0, 0, 205);\"> 2.520m2 đất ruộng còn lại là đất trồng cây lâu năm, tường bao xây kiên cố, có </span><span style=\"color: rgb(255, 0, 0);\">7 sào ao</span><span style=\"color: rgb(0, 0, 205);\">, có nhiều đồ vật bằng gỗ quý, niên hạn lâu năm </span><span style=\"color: rgb(255, 0, 0);\">(đồ cổ)</span><span style=\"color: rgb(0, 0, 205);\">, hoa thơm quả ngọt bốn mùa, có nhiều cây gỗ quý, cây cảnh, cây ăn quả có giá trị kinh tế cao, không khí trong lành, sạch sẽ, yên tĩnh phù hợp cho việc nghỉ dưỡng cuối tuần nuôi trồng thực phẩm sạch phục vụ gia đinh, xung quanh có cả một quần thể biệt thự nhà vườn của đại gia Hà Nội.</span></span></span><span class=\"diadiem-title mar-right-15\" style=\"margin: 0px 15px 0px 0px; padding: 0px; display: block;\"><span style=\"font-size: 14px; font-weight: bold;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(0, 0, 205);\"> Với khuôn viên cơ bản hoàn thiện, quý khách hàng chỉ cần chỉnh sửa hoặc thiết kế thêm một chút là có thể kinh doanh cho thuê nghỉ dưỡng được</span></span></span><span class=\"diadiem-title mar-right-15\" style=\"margin: 0px 15px 0px 0px; padding: 0px; display: block;\"><span style=\"font-size: 14px; font-weight: bold;\"><span style=\"color: rgb(255, 0, 0);\">+ </span><span style=\"color: rgb(0, 0, 205);\">Giao thông thuận tiện đường bê tông to rộng </span><span style=\"color: rgb(255, 0, 0);\">xe 45</span><span style=\"color: rgb(0, 0, 205);\"> chỗ vào thoải mái cách đường Quốc Lộ 6 khoảng 1.5km, cách trung tâm TT Xuân Mai 3 km, </span><span style=\"color: rgb(255, 0, 0);\">TT Hà Nội 33km.</span></span></span></div><div class=\"pm-content\" style=\"font-family: Tahoma; font-size: 13px; margin: 0px; padding: 0px; background-color: rgb(255, 255, 255);\"><div class=\"pm-desc\" style=\"font-size: 14px; margin: 0px; padding: 0px; line-height: 25.2px;\"><span style=\"font-weight: bold;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(0, 0, 205);\"> Giá bán</span><span style=\"color: rgb(255, 0, 0);\"> 17 tỷ </span><span style=\"color: rgb(0, 0, 205);\">(có thương lượng).</span><br style=\"line-height: 25.2px;\"><span style=\"color: rgb(255, 0, 0);\">- </span><span style=\"color: rgb(0, 0, 205);\">ĐC : </span><span style=\"color: rgb(255, 0, 0);\">Hòa Sơn, Lương Sơn, Hòa Bình</span><br style=\"line-height: 25.2px;\"><span style=\"color: rgb(0, 0, 205);\">Để biết thêm chi tiết LH Đăng Hiển :&nbsp; &nbsp;</span><span style=\"color: rgb(255, 0, 0);\"> 0332363839&nbsp; &nbsp;(0896.035.789).</span></span></div></div>', '1', '15480', '17000000000', '28', '98', '94', '', null, null, 'danghien', '1572368400', '1572558520', '0', '0', '0', '1', '1');
INSERT INTO `tbl_contents` VALUES ('52', '71', 'Bán dự án nghỉ dưỡng Lương Sơn Hòa Bình3.2ha có 1600m2 đất xây dựng,view cực đẹp,giá rẻ 332363839', 'ban-du-an-nghi-duong-luong-son-hoa-binh32ha-co-1600m2-dat-xay-dungview-cuc-depgia-re-332363839', 'http://localhost/dulich/images/20191102061534-56a4wm.jpg', '[{\"url\":\"http://localhost/dulich/images/20191102061601-0f5fwm.jpg\",\"alt\":\"\"},{\"url\":\"http://localhost/dulich/images/20191102061601-d473wm.jpg\",\"alt\":\"\"},{\"url\":\"http://localhost/dulich/images/20191102061601-13bcwm.jpg\",\"alt\":\"\"},{\"url\":\"http://localhost/dulich/images/20191102061535-9711wm.jpg\",\"alt\":\"\"},{\"url\":\"http://localhost/dulich/images/20191102061534-dbd1wm-1.jpg\",\"alt\":\"\"}]', null, 'Dự àn nghỉ dưỡng đẹp như tranh vẽ, có 102 trong khu vực, có sơn có thủy, địa thế không dốc lắm,view cao thoáng mát, giao thông thuận tiện, đường bê tông vào tận nơi. cách Hà Nội tầm 40km, mất khoảng 45p lái xe. nhanh tay số lượng có hạn.', '<div class=\"kqchitiet\" style=\"font-family: Tahoma; font-size: 12px; margin: 0px 0px 10px; padding: 0px; position: relative; line-height: 22px; background-color: rgb(255, 255, 255);\"><h1 itemprop=\"name\" style=\"font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"font-size: 14px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> Do chuyển công tác cần bán gấp </span><span style=\"color: rgb(255, 0, 0);\">3.2ha đất thổ cư trong đó có 1600m2 đất nhà ở,</span><span style=\"color: rgb(5, 86, 153);\"> còn lại là đất trồng cây lâu năm. View cao thoáng mát, đã có bản thiết kế, và đã được cải tạo cơ bản.nơi đây mà được đầu tư, xây dựng thì sẽ trở thành khu nghỉ dưỡng số một trong khu vực, với đầy đủ các yếu tố, Điện, đường, đồi núi, sơn thủy hữ tình.....</span></span></h1><h1 itemprop=\"name\" style=\"font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> Không khí trong lành sạch sẽ, an ninh bảo đảm,ngay cạnh xóm là </span><span style=\"color: rgb(255, 0, 0);\">Cây Si </span><span style=\"color: rgb(5, 86, 153);\">cổ thụ được nhà nước công nhận là cây Di sản quốc gia, là nơi đóng phim của( Làng ế vợ) và nhiều bộ phim khác. trong khu vực có nhiều nhà Hà Nội về xây dựng biệt phủ, trang trại nhà vườn, homestay,khu nghỉ dưỡng sunset, beveryhill, stop hill,boocagarden ....Nằm trong vùng quy hoạch vành đai xanh của huyện nên không sợ bởi sự chen lấn chuồng trại, công ty, xí nghiệp...</span></h1><h1 itemprop=\"name\" style=\"font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> Giao thông thuận tiện, đường bê tông vào tận nơi. Cách đường 6 tầm 4km, </span><span style=\"color: rgb(255, 0, 0);\">Hà Nội khoảng 40km</span><span style=\"color: rgb(5, 86, 153);\">, thời gian sẽ được rút ngắn nữa khi đường 6 được mở rộng.</span></h1><h1 itemprop=\"name\" style=\"font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> ĐC </span><span style=\"color: rgb(255, 0, 0);\">xã Hợp Hòa, Huyện Lương Sơn, tỉnh Hòa Bình</span></h1><h1 itemprop=\"name\" style=\"font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> Giá bán : </span><span style=\"color: rgb(255, 0, 0);\">312k/m2</span></h1><h1 itemprop=\"name\" style=\"font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> Quý khách vui lòng LH Đăng Hiển </span><span style=\"color: rgb(255, 0, 0);\">0332363839&nbsp; (0896.035.789)</span><span style=\"color: rgb(5, 86, 153);\"> để được xem đất&nbsp;</span></h1></div>', '1', '32000', '8800000000', '28', '98', '99', '', null, null, 'danghien', '1572627600', '1573339896', '0', '0', '0', '1', '1');
INSERT INTO `tbl_contents` VALUES ('53', '68', 'Bán đất lương sơn hòa bình3.2ha làm trang trại,khu nghỉ dưỡng,view suối, núi đa,canh đồng 0332363839  ', 'ban-dat-luong-son-hoa-binh32ha-lam-trang-traikhu-nghi-duongview-suoi-nui-dacanh-dong-0332363839-', 'http://localhost/dulich/images/img20191108164320.jpg', '[{\"url\":\"http://localhost/dulich/images/img20191016094002.jpg\",\"alt\":\"\"},{\"url\":\"http://localhost/dulich/images/img20191019093426.jpg\",\"alt\":\"\"},{\"url\":\"http://localhost/dulich/images/img20191031142750.jpg\",\"alt\":\"\"}]', null, 'Chỉ với 1.8 tỷ là Bạn đã sở hữu 32.000m2 với đầy đủ các loại view ( view núi đá, view suối, view ruộng, view sân gol..) có Aao, Giao thông thuận tiện,có  đầy đủ các yếu tố để làm trang trại, khu nghỉ dưỡng, homstay .....Cách Hà Nội tầm 40km', '<div class=\"pm-title\" style=\"font-family: tahoma; margin: 0px 0px 10px; padding: 0px 0px 10px; font-weight: bold; border: 0px; background-color: rgb(255, 255, 255);\"><h1 itemprop=\"name\" style=\"font-family: Tahoma; margin: 0px; padding: 0px;\"><span style=\"font-size: 16px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\">&nbsp;</span></span><span style=\"color: rgb(5, 86, 153); font-size: 14px;\">Do cần tiền làm nhà gia đình muốn chuyển nhượng </span><span style=\"font-size: 14px; color: rgb(255, 0, 0);\">3.2ha có Ao,</span><span style=\"color: rgb(5, 86, 153); font-size: 14px;\">có thể mua ruộng mở rộng thêm. View cực đẹp đứng trên đất có thể quan sát hết toàn bộ khu ruộng, cung quanh, suối phía trước nhà, các dãy núi đá trùng trùng, điệp điệp, và dự án sân gol đang chuẩn bị xây dựng.</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"font-size: 14px;\"> <span style=\"color: rgb(0, 0, 128);\">Thế đất thoải sườn đồi, chất đất tốt rất thuận tiện cho việc trồng cây, trồng rau.làm trang trại khu nghỉ dưỡng, homstay... Quý khách hàng chỉ cần cải tạo thêm một chút nữa là sẽ trở thành trang trại với đủ các loại hoa trái quanh năm.</span></span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"font-size: 14px; color: rgb(0, 0, 128);\"> Không khí trong lành sạch sẽ, an ninh bảo đảm, trong xã có dự án nghỉ dưỡng sông hồng, và dự án sân gol 70ha đang chuẩn bị xây dựng và nhiều nhà Hà Nội về xây dựng biệt phủ, trang trại nhà vườn, Nằm trong vùng quy hoạch vành đai xanh của huyện nên không sợ bởi sự chen lấn chuồng trại, công ty, xí nghiệp...</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"font-size: 14px;\"><span style=\"color: rgb(0, 0, 128);\"> Giao thông thuận tiện, Cách đường nhựa Liên xã tầm 200m, đường ql6 khoảng 5km , </span><span style=\"color: rgb(255, 0, 0);\">Hà Nội tầm 45km</span><span style=\"color: rgb(0, 0, 128);\">, thời gian sẽ được rút ngắn nữa khi đường 6 được mở rộng.</span></span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"font-size: 14px;\"> <span style=\"color: rgb(0, 0, 128);\">Địa chỉ : </span><span style=\"color: rgb(255, 0, 0);\">xã Cao Răm, Huyện Lương Sơn Tỉnh Hòa Bình</span></span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"font-size: 14px;\"> <span style=\"color: rgb(0, 0, 128);\">Giá bán </span><span style=\"color: rgb(255, 0, 0);\">1.8 tỷ </span><span style=\"color: rgb(0, 0, 128);\">đất đẹp giá rẻ đang cần bán gấp để giải quyết công việc.</span></span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"font-size: 14px;\"> <span style=\"color: rgb(0, 0, 128);\">Quý khách vui lòng LH Đăng Hiển</span><span style=\"color: rgb(255, 0, 0);\"> 0332363839&nbsp; (0896.035.789) </span><span style=\"color: rgb(0, 0, 128);\">để được xem đất </span>.</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"font-size: 14px;\"> T<span style=\"color: rgb(0, 0, 128);\">hủ tục sang nhượng nhanh gọn, đúng quy định của pháp luật.</span></span></h1></div><div class=\"pm-middle-content\" style=\"font-family: Tahoma; font-size: 12px; margin: 10px 0px 0px; padding: 0px; width: 745px; background-color: rgb(255, 255, 255);\"><ul id=\"LeftMainContent__productDetail_ulTab\" class=\"detail-more-info\" style=\"margin: 0px; padding: 0px; background-color: rgb(31, 84, 150); width: 745px; border-top-left-radius: 5px; border-top-right-radius: 5px; height: 30px;\"><li id=\"liImg\" style=\"margin: 0px 0px 0px 5px; padding: 0px; float: left; list-style-type: none;\"></li></ul></div>', '1', '32000', '1800000000', '28', '98', '100', '', null, null, 'danghien', '1572627600', '1573858678', '1', '0', '0', '1', '1');
INSERT INTO `tbl_contents` VALUES ('54', '71', 'Bán đất lương sơn hòa bình 3000m2thổ cư khuôn viên hoàn thiện làm nghỉ dưỡng,có ao,giá rẻ 0332363839', 'ban-dat-luong-son-hoa-binh-3000m2tho-cu-khuon-vien-hoan-thien-lam-nghi-duongco-aogia-re-0332363839', '', '[]', null, 'Cần bán khuôn viên hoàn thiện, đất làm trang trại, biệt thự nhà vườn, cty, kho xưởng giá rẻ, thuận lợi giao thông,không khí trong lành sạch sẽ thủ tục giấy tờ pháp lý đầy đủ theo đúng luật của nhà nước.', '<div class=\"pm-title\" style=\"font-family: tahoma; font-size: 14px; margin: 0px 0px 10px; padding: 0px 0px 10px; font-weight: bold; border: 0px; background-color: rgb(255, 255, 255);\"><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"font-size: 14px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> Cần bán 3000m2 đất thổ cư,khuôn viên hoàn thiện, có 400m2 đất nhà ở,còn lại là đất trồng cây lâu năm, hoa thơm quả ngọt bốn mùa, làm biệt thự nhà vườn, khu nghỉ dưỡng cuối tuần thì quá đỉnh.</span></span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> Trong khuôn viên đã được thiết kế cơ bản,có 1 nhà mái bằng,có 2 ao nhỏ được xây kè xung quanh, bên trong có các thớ đá nhô lên nhìn rất đẹp. hệ thống cây ăn quả, cây bóng mát đã full toàn bộ vườn đang cho thu hoạch với nhiều loại cây khác nhau như Mít, ổi, Soài, Hồng Bì....có một hòn đá cảnh phía trướn nhìn rất phong thủy.</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> không khí trong lành, sạch sẽ, yên tĩnh phù hợp cho việc nghỉ dưỡng cuối tuần nuôi trồng thực phẩm sạch phục vụ gia đinh, xung quanh có cả một quần thể biệt thự nhà vườn của đại gia Hà Nội. Nếu quý khách muốn thì vẫn có thể mua mở rộng thêm 3000m2 nữa</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> Cách đường Quốc Lộ 6 khoảng 1km, cách trung tâm TT Xuân Mai 4 km, TT Hà Nội 33km.</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> Giá bán 2 tỷ.</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\">ĐC Thị trấn Lương Sơn, Lương Sơn, Hòa Bình</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">** Lô 2 : Có diện tích 9000m2 với 2 mặt tiền,1 mặt bám đường bê tông tầm 50m, một mặt khoảng 180m vuông vắn, thế đất bằng phẳng, nền đất chắc chắn, chất đất tốt, rất phù hợp để làm Biệt thự nhà vườn, trang trại, khu nghỉ dưỡng cuối tuần, nuôi trồng thực phẩm sạch, , nông trại rau sạch,&nbsp; và công ty nhà xưởng ...</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">- Cách Đường QL6 tầm 1km, Hà Nội Tầm 33km.</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">- Gía Bán 600k/m2</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">- ĐC Thị trấn Lương Sơn, huyện Lương Sơn, tỉnh Hòa Bình</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(148, 0, 211);\">** Lô 3 : có diện tích 1700m2 có 400m2 đất nhà ở, còn lại là đất trồng cây lâu năm, giao thông thuận tiện, có 1 nhà mái bằng, đường bê tông vào tận nơi.</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(148, 0, 211);\">- Cách đường QL6 tầm 1,5km</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(148, 0, 211);\">- ĐC Thị trấn Lương Sơn, Lương Sơn, Hòa Bình</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(148, 0, 211);\">- Gía Bán 1 tỷ.</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(148, 0, 211);\">- Để biết thêm chi tiết LH Đăng Hiển :0332363839 (0896.035.789).</span></h1></div>', '1', '3000', '2000000000', '28', '98', '95', '', null, null, 'danghien', '1572800400', null, '0', '0', '0', '1', '1');
INSERT INTO `tbl_contents` VALUES ('55', '68', 'Bán đất lương sơn hòa bình4.3h lam trang trại,khu nghỉ dưỡng,có Ao,view cao thoángthuận ,tiện giao thông 0332363839', 'ban-dat-luong-son-hoa-binh43h-lam-trang-traikhu-nghi-duongco-aoview-cao-thoangthuan-tien-giao-thong-0332363839', 'http://localhost/dulich/images/img20191105092600.jpg', '[{\"url\":\"http://localhost/dulich/images/img20191110113642.jpg\",\"alt\":\"\"},{\"url\":\"http://localhost/dulich/images/img20191110113702.jpg\",\"alt\":\"\"}]', null, '4.3ha view cao, thoáng mát, thuận tiện giao thông cách truch đường nhựa liên xã tầm 100m, đầu gối sơn, chân đạp thủy,không khí trong lành sạch sẽ, phù hợp làm trang trại, khu nghỉ dưỡng,homestay...cách Hà Nội tầm 40km ', '<div class=\"pm-title\" style=\"font-family: tahoma; font-size: 14px; margin: 0px 0px 10px; padding: 0px 0px 10px; font-weight: bold; border: 0px; background-color: rgb(255, 255, 255);\"><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"font-size: 14px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> Do cần tiền đầu tư gia đình muốn chuyển nhượng </span><span style=\"color: rgb(255, 0, 0);\">4.3ha đất hỗn hợp</span><span style=\"color: rgb(5, 86, 153);\">, trong đó có </span><span style=\"color: rgb(255, 0, 0);\">800m2 đất nhà ở lâu dài</span><span style=\"color: rgb(5, 86, 153);\">, hơn </span><span style=\"color: rgb(255, 0, 0);\">2000m2 đất vườn</span><span style=\"color: rgb(5, 86, 153);\">,còn lại là đất rừng sản xuất( có thể chuyển đổi sang đất vườn được)có Ao,có thể mua mở rộng thêm lên 7h nữa.</span></span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span> <span style=\"color: rgb(0, 0, 128);\">View cực đẹp đứng trên đất có thể quan sát hết toàn bộ khu Xung quanh, suối,ao phía trước nhà, các dãy núi đá trùng trùng, điệp điệp. Thế đất thoải sườn đồi, chất đất tốt rất thuận tiện cho việc trồng cây, trồng rau.làm trang trại khu nghỉ dưỡng, homstay... Quý khách hàng chỉ cần cải tạo thêm một chút nữa là sẽ trở thành trang trại với đủ các loại hoa trái quanh năm.</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(0, 0, 128);\">&nbsp;</span> <span style=\"color: rgb(0, 0, 128);\">Không khí trong lành sạch sẽ, an ninh bảo đảm, nhiều nhà Hà Nội về xây dựng biệt phủ, trang trại nhà vườn.bên trong có 1 trang trại rộng cả tramwha của nữ đại gia Hà Nội.</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span> <span style=\"color: rgb(0, 0, 128);\">Giao thông thuận tiện, Cách đường nhựa Liên xã tầm 100m, đường ql6 khoảng 5km , </span><span style=\"color: rgb(255, 0, 0);\">Hà Nội tầm 45km,</span><span style=\"color: rgb(0, 0, 128);\"> thời gian sẽ được rút ngắn nữa khi đường 6 được mở rộng.</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span> <span style=\"color: rgb(0, 0, 128);\">Địa chỉ : </span><span style=\"color: rgb(255, 0, 0);\">xã Hợp Hòa, Huyện Lương Sơn Tỉnh Hòa Bình</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span> <span style=\"color: rgb(0, 0, 128);\">Giá bán :&nbsp; &nbsp;</span><span style=\"color: rgb(255, 0, 0);\">3.5 tỷ </span><span style=\"color: rgb(0, 0, 128);\">đất đẹp giá rẻ đang cần bán gấp để giải quyết công việc.</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">*&nbsp;</span> <span style=\"color: rgb(0, 0, 128);\">Quý khách vui lòng LH Đăng Hiển</span><span style=\"color: rgb(255, 0, 0);\"> 0332363839 (0896.035.789) </span><span style=\"color: rgb(0, 0, 128);\">để được xem đất và gặp chủ</span><span style=\"color: rgb(255, 0, 0);\">.</span></h1></div>', '1', '43000', '3500000000', '28', '98', '99', '', null, null, 'danghien', '1572800400', '1573858602', '2', '0', '0', '1', '1');
INSERT INTO `tbl_contents` VALUES ('56', '71', 'Bán đất Kỳ Sơn Hòa Bình4.2ha trang trại nghỉ dưỡng,view cao thoáng mát,bám Đường  nhựa lien xã 0332363839', 'ban-dat-ky-son-hoa-binh42ha-trang-trai-nghi-duongview-cao-thoang-matbam-duong-nhua-lien-xa-0332363839', 'http://localhost/dulich/images/img15728353034201572836252959.jpg', '[{\"url\":\"http://localhost/dulich/images/img15728353040951572836253049.jpg\",\"alt\":\"\"},{\"url\":\"http://localhost/dulich/images/img15728353046451572836253287.jpg\",\"alt\":\"\"},{\"url\":\"http://localhost/dulich/images/img15728353041441572836253114.jpg\",\"alt\":\"\"},{\"url\":\"http://localhost/dulich/images/img15728353044261572836253210.jpg\",\"alt\":\"\"},{\"url\":\"http://localhost/dulich/images/img15728353047671572836253318.jpg\",\"alt\":\"\"},{\"url\":\"http://localhost/dulich/images/img15728353042251572836253145.jpg\",\"alt\":\"\"},{\"url\":\"http://localhost/dulich/images/img15728353046031572836253261.jpg\",\"alt\":\"\"}]', null, '4.2ha trang trại nhà vườn đã xây dựng cơ bản hệ thống chuồng nuôi, vườn cây ao cá, đổ đường bê tông xung quanh, không khí trong lành yên tĩnh,làm khu nghỉ dưỡng, biệt phủ thì quá đỉnh, đường nhựa vào tận noiow, các Hà Nội có 60km..', '<div class=\"kqchitiet\" style=\"font-family: Tahoma; font-size: 12px; margin: 0px 0px 10px; padding: 0px; position: relative; line-height: 22px; background-color: rgb(255, 255, 255);\"><span class=\"diadiem-title mar-right-15\" style=\"margin: 0px 15px 0px 0px; padding: 0px; display: block;\"><span style=\"font-size: 14px; font-weight: bold;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(0, 0, 128);\"> Cần bán gấp </span><span style=\"color: rgb(255, 0, 0);\">4.2ha trong đó có 400m2 đất nhà ở, hơn 9000m2 đất vườn</span><span style=\"color: rgb(0, 0, 128);\">, còn lại là đất RSX, có Ao nước cả quanh năm..</span></span></span><span class=\"diadiem-title mar-right-15\" style=\"margin: 0px 15px 0px 0px; padding: 0px; display: block;\"><span style=\"font-size: 14px; font-weight: bold;\"><span style=\"color: rgb(255, 0, 0);\">+ </span><span style=\"color: rgb(0, 0, 128);\">Thế đất thoải sườn đồi, view cao thoáng mát, núi non hùng vỹ,đã xây dựng các Chuồng Nuôi, đổ đường bê tông và nhiêu cây ăn quả có giá trị kinh tế cao như </span><span style=\"color: rgb(255, 0, 0);\">Mít thái, Cam, Soài ,ổi, Bưởi....</span></span></span><span class=\"diadiem-title mar-right-15\" style=\"margin: 0px 15px 0px 0px; padding: 0px; display: block;\"><span style=\"font-size: 14px; font-weight: bold;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(0, 0, 128);\"> Không khí trong lành, mát mẻ, đời sống dân trí cao, an ninh bảo đảm, rất phù hợp để làm trang trại, nghỉ dưỡng, homestay , trang trại nuôi trồng thực phẩm sạch...</span></span></span><span class=\"diadiem-title mar-right-15\" style=\"margin: 0px 15px 0px 0px; padding: 0px; display: block; font-weight: bold;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"font-size: 14px;\"><span style=\"color: rgb(255, 0, 0);\"> </span><span style=\"color: rgb(0, 0, 128);\">Giao thông thuận tiện, xe 45 chỗ vào tận nơi, cách đường </span><span style=\"color: rgb(255, 0, 0);\">QL6 tầm 4km, Hà Nội tầm 60km</span><span style=\"color: rgb(0, 0, 128);\">, trong vùng đã có nhiều dự án lớn như dự án Hồ Dụ, Sakana, Oharafarm, khu du lịch sinh thái thác thăng thiên, sân golf Singapore và nhiều đại gia Hà thành về mua đất làm trang trại, xây biệt phủ, kinh doanh homestay...</span></span></span><span class=\"diadiem-title mar-right-15\" style=\"margin: 0px 15px 0px 0px; padding: 0px; display: block;\"><span style=\"font-size: 14px; font-weight: bold;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(0, 0, 128);\"> Địa chỉ: </span><span style=\"color: rgb(255, 0, 0);\">Dân Hạ, Kỳ Sơn, Hòa Bình</span><span style=\"color: rgb(0, 0, 128);\">.</span></span></span><span class=\"diadiem-title mar-right-15\" style=\"margin: 0px 15px 0px 0px; padding: 0px; display: block; font-weight: bold;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"font-size: 14px;\"><span style=\"color: rgb(0, 0, 128);\">Giá bán: </span><span style=\"color: rgb(255, 0, 0);\">8.8tỷ.</span></span></span><span class=\"diadiem-title mar-right-15\" style=\"margin: 0px 15px 0px 0px; padding: 0px; display: block;\"><span style=\"font-size: 14px; font-weight: bold;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(0, 0, 128);\"> Để biết thêm chi tiết xin vui lòng LH Đăng Hiển </span><span style=\"color: rgb(255, 0, 0);\">0332363839 (0896. 035.789)</span><span style=\"color: rgb(0, 0, 128);\"> để đượ xem đất và gặp chủ cũng như được tư vấn nhiều lô đất đẹp, rẻ, làm trang trại, nghỉ dưỡng, kho xưởng xí nghiệp cty nhà máy...</span></span></span></div>', '1', '42000', '8800000000', '28', '97', '128', '', null, null, 'danghien', '1572886800', '1572907217', '3', '0', '0', '1', '1');
INSERT INTO `tbl_contents` VALUES ('57', '71', 'Bán đất Lương Sơn hòa bình 363.9m2 Beveryhill 2, đã có nhà chỉ sẵn ở,giá rẻ 750tr 0332363839', 'ban-dat-luong-son-hoa-binh-3639m2-beveryhill-2-da-co-nha-chi-san-ogia-re-750tr-0332363839', 'http://localhost/dulich/images/img20191105050142.jpg', '[{\"url\":\"http://localhost/dulich/images/img20191105050147.jpg\",\"alt\":\"\"},{\"url\":\"http://localhost/dulich/images/img20191105050152.jpg\",\"alt\":\"\"},{\"url\":\"http://localhost/dulich/images/img20191105050142.jpg\",\"alt\":\"\"},{\"url\":\"http://localhost/dulich/images/img20191105050213.jpg\",\"alt\":\"\"}]', null, 'Ngôi nhà nhỏ hạnh phúc to, với số tiền nho nhỏ là bạn đã sở hữu một lô Biệt thự nghỉ dưỡng mini , với đầy đủ các tính năng không khác gì các biệt thự resot trong khu vực, giao thông thuận tiện , cách Hà Nội tầm khoảng 40km.', '<div class=\"pm-title\" style=\"font-family: tahoma; font-size: 14px; margin: 0px 0px 10px; padding: 0px 0px 10px; font-weight: bold; border: 0px; background-color: rgb(255, 255, 255);\"><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"font-size: 14px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> Cần chuyển nhượng </span><span style=\"color: rgb(255, 0, 0);\">363.9m2 đất thổ cư trong đó có 70m2 đất nhà ở</span><span style=\"color: rgb(5, 86, 153);\">, còn lại là đất trồng cây lâu năm.</span></span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\">Thế đất vuông vắn, view cao thoáng mát, nằm trong khu phân lô của dự án </span><span style=\"color: rgb(255, 0, 0);\">Beveryhill2</span><span style=\"color: rgb(5, 86, 153);\"> và một quần thể các nhà Hà Nội đã có nhà chỉ việc ở.quý khách hàng chỉ cần tu sửa, cải tạo một chút nó sẽ trở thành nơi nghỉ dưỡng lý tưởng, không kém gì các resot trong khu vực.</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> Không khí trong lành sạch sẽ, an ninh bảo đảm, trong khu vực có nhiều nhà Hà Nội về xây dựng biệt phủ, và các khu nghỉ dưỡng, nằm trong vùng quy hoạch vành đai xanh của huyện nên không sợ bởi sự chen lấn chuồng trại, công ty, xí nghiệp...</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> Giao thông thuận tiện cách đường 6 tầm 4km, </span><span style=\"color: rgb(255, 0, 0);\">Hà Nội khoảng 40km</span><span style=\"color: rgb(5, 86, 153);\">, thời gian sẽ được rút ngắn nữa khi đường 6 được mở rộng.</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> ĐC : </span><span style=\"color: rgb(255, 0, 0);\">xã Cư Yên, Lương Sơn, Hòa Bình</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> LH Đăng Hiển </span><span style=\"color: rgb(255, 0, 0);\">0332363839 (0896.035.789) </span><span style=\"color: rgb(5, 86, 153);\">để được xem đất,và gặp chủ.</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> Thủ tục sang nhượng nhanh gọn, đúng quy định của pháp luật.</span></h1></div>', '1', '363', '750000000', '28', '98', '97', '', null, null, 'danghien', '1572886800', '1572907042', '2', '0', '0', '1', '1');
INSERT INTO `tbl_contents` VALUES ('58', '74', 'Bán khu nghỉ dưỡng sương Sơn hòa bình 5000m2 khuôn viên hoàn thiện đẹp long lanh, Coa Ao, có Nhà Biệt thự chỉ sẵn ở 0332363839', 'ban-khu-nghi-duong-suong-son-hoa-binh-5000m2-khuon-vien-hoan-thien-dep-long-lanh-coa-ao-co-nha-biet-thu-chi-san-o-0332363839', 'http://localhost/dulich/images/img20191103104901.jpg', '[{\"url\":\"http://localhost/dulich/images/img20191103104744.jpg\",\"alt\":\"\"},{\"url\":\"http://localhost/dulich/images/img20191103104753.jpg\",\"alt\":\"\"},{\"url\":\"http://localhost/dulich/images/img20191103104730.jpg\",\"alt\":\"\"}]', null, 'Biệt thự nhà vườn đẹp long lanh, địa hình bằn phẳng, cây ăn trái sum xuê, ao kè bờ chắc chắn, là đất thuộc thị trấn, cách đường QL6 tầm 800m, Hà Nội khoảng 32km.đường bê tông xe 45 vào thoải mái.', '<div class=\"pm-title\" style=\"font-family: tahoma; margin: 0px 0px 10px; padding: 0px 0px 10px; font-weight: bold; border: 0px; background-color: rgb(255, 255, 255);\"><h1 itemprop=\"name\" style=\"font-size: 16px; font-family: Tahoma; margin: 0px; padding: 0px;\"><span style=\"font-size: 14px;\"><span style=\"color: rgb(255, 0, 0);\">+ </span><span style=\"color: rgb(5, 86, 153);\">Bán gấp </span><span style=\"color: rgb(255, 0, 0);\">5000m2 </span><span style=\"color: rgb(0, 0, 128);\">đất thổ cư, có </span><span style=\"color: rgb(255, 0, 0);\">400m2 đất nhà ở</span><span style=\"color: rgb(0, 0, 128);\">, còn lại là đất trồng cây lâu năm,</span><span style=\"color: rgb(5, 86, 153);\">khuôn viên hoàn thiện đẹp lung linh, có 1 ngôi biệt thự được xây dựng theo kiểu kiến trúc thời Xưa, Ao cá to rộng nước cả quanh năm và đã được kè bờ chắc chắn. có rất nhiều cây ăn quả cây bóng mát phủ kín vườn ,đa dạng về chủng loại...</span></span></h1><h1 itemprop=\"name\" style=\"font-size: 16px; font-family: Tahoma; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> Không khí trong lành yên tĩnh, an ninh bảo đảm, có nhiều biệt phủ của đại gia Hà Nội về xây dựng.đường bê tông to rộng xe</span><span style=\"color: rgb(255, 0, 0);\"> 45 chỗ</span><span style=\"color: rgb(5, 86, 153);\"> vào thoải mái.</span></h1><h1 itemprop=\"name\" style=\"font-size: 16px; font-family: Tahoma; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> Cách đường QL6 tầm </span><span style=\"color: rgb(255, 0, 0);\">800m</span><span style=\"color: rgb(5, 86, 153);\">, thành phố Hà Nội khoảng </span><span style=\"color: rgb(255, 0, 0);\">32km</span>.</h1><div style=\"font-size: 14px;\"><span style=\"color: rgb(5, 86, 153);\">+ ĐC : </span><span style=\"color: rgb(255, 0, 0);\">Thị trấn Lương Sơn,&nbsp; Hòa Bình.</span><span style=\"color: rgb(5, 86, 153);\">&nbsp;</span></div><div style=\"\"><span style=\"font-size: 14px; color: rgb(5, 86, 153);\">+ LH Đăng Hiển&nbsp; </span><span style=\"color: rgb(255, 0, 0);\">0332363839<span style=\"font-size: 16px; font-family: Tahoma; color: rgb(255, 0, 0);\">&nbsp;(0896. 035. 789)</span></span><span style=\"font-size: 16px; color: rgb(5, 86, 153); font-family: Tahoma;\">. để biết thêm chi tiết và được xem đất</span></div><div style=\"\"><span style=\"font-size: 16px; color: rgb(5, 86, 153); font-family: Tahoma;\"><br></span></div><div style=\"\"><span style=\"font-size: 16px; color: rgb(5, 86, 153); font-family: Tahoma;\"><br></span></div><div style=\"\"><span style=\"font-size: 16px; color: rgb(5, 86, 153); font-family: Tahoma;\"><iframe width=\"560\" height=\"320\" src=\"https://www.youtube.com/embed/11dEzvsxNRQ\" frameborder=\"0\" allowfullscreen=\"\"></iframe><br></span></div><h1 itemprop=\"name\" style=\"font-size: 16px; color: rgb(5, 86, 153); font-family: Tahoma; margin: 0px; padding: 0px;\">&nbsp;</h1></div>', '2', '5000', '5500000000', '28', '98', '95', '', null, null, 'danghien', '1572886800', '1572908973', '2', '0', '0', '1', '1');
INSERT INTO `tbl_contents` VALUES ('59', '70', 'Bán đất lương sơn hòa bình 800m2 làm phòng trọ,kho xưởng,đất phân lô,Sát Khu khu công nghiệp,tiện giao thông 0332363839', 'ban-dat-luong-son-hoa-binh-800m2-lam-phong-trokho-xuongdat-phan-losat-khu-khu-cong-nghieptien-giao-thong-0332363839', 'http://localhost/dulich/images/', '[{\"url\":\"http://localhost/dulich/images/img20191106064344.jpg\",\"alt\":\"\"},{\"url\":\"http://localhost/dulich/images/img20191104163630.jpg\",\"alt\":\"\"}]', null, 'Là lô duy nhất trong khu vực đã có sổ đỏ, cách khu công nghiệp, QL6, khu mua sắm dịch, vụ ăn uống, vui chơi giải trí chỉ có vài trăm m,ngay cạnh sân bóng,nhà văn hóa, nhà trẻ. KCN đang trên đà phát triển mạnh, nhu cầu về phòng trọ của CN đang lên cao, chuẩn bị có cty với quy mô 3ha và hàng nghìn công nhân đang chuẩn bị đi vào hoạt động.nhanh tay số lượng có hạn', '<div class=\"pm-title\" style=\"font-family: tahoma; font-size: 14px; margin: 0px 0px 10px; padding: 0px 0px 10px; font-weight: bold; border: 0px; background-color: rgb(255, 255, 255);\"><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"font-size: 14px;\"><span style=\"color: rgb(5, 86, 153);\">- Do hoàn canh gia đình bán gấp </span><span style=\"color: rgb(255, 0, 0);\">800m2 đất thổ cư,trong đó có 120m2 đất nhà ở</span><span style=\"color: rgb(5, 86, 153);\">, còn lại là đất trồng cây lâu năm (sổ đỏ cấp nắm 2016)</span></span></h1><h1 itemprop=\"name\" style=\"color: rgb(5, 86, 153); font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\">- Đát bám mặt đường bê tông tầm 40m, đường rộng 4m xe oto to vào thoải mái. một mặt bám suối rất thoáng mát và quý khách không phải lo nghĩ về vấn đề nước thải.ngay sát trung tâm xóm, dân cư đông đúc, có sân bóng đá , bóng chuyền của Tiểu Khu.</h1><h1 itemprop=\"name\" style=\"color: rgb(5, 86, 153); font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\">- Là Lô đất duy nhất trong khu vực đã có sổ đỏ,nằm ở vị trí đắc địa, bám đường bê tông rất sạch sẽ, cách khu mua sắm tầm 100m, cách khu công nghiệm tầm 300m, công nhân chỉ mất tầm 10p đi bộ là tới chỗ làm. Nền đất chắc chắn thế đất tương đối băng phẳng, quý khách chỉ việc xây dựng được luôn mà không phải san lấp gì.</h1><h1 itemprop=\"name\" style=\"color: rgb(5, 86, 153); font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\">- Khu công nghiệp Lương sơn Rộng tầm 50 ha, hiện tại đang có tầm 20 nghìn Công nhân đang làm việc, bao gòm người dân địa phương và công nhân ở các huyện trong tỉnh, và cả nước về làm việc. trong thời gian tới tiếp tục có công ty rộng 3ha có quy mô lớn tầm vài nghìn công nhân đang chuẩn bị đi vào hoạt động, đó là chưa kể cả trục ha đất trống chưa xây dựng cty. Có thể nói đây là lô đất đầy tiềm năng.</h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(5, 86, 153);\">- Cách QL6 tầm 400M, cách Xuân Mai khoảng 4km, </span><span style=\"color: rgb(255, 0, 0);\">Hà Nội tầm 30km</span><span style=\"color: rgb(5, 86, 153);\">.</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(5, 86, 153);\">- Gía Bán : </span><span style=\"color: rgb(255, 0, 0);\">2.5tr/M2</span></h1><h1 itemprop=\"name\" style=\"color: rgb(5, 86, 153); font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\">_ ĐC : KCN Lương Sơn, Hòa Bình</h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(5, 86, 153);\">- Qúy khách hàng vui lòng LH </span><span style=\"color: rgb(255, 0, 0);\">0332363839&nbsp; &nbsp;(0896.035.789)</span><span style=\"color: rgb(5, 86, 153);\"> để được xem đất và gặp chủ.</span></h1></div><div class=\"pm-content\" style=\"font-family: Tahoma; font-size: 13px; margin: 0px; padding: 0px; background-color: rgb(255, 255, 255);\"><div class=\"pm-desc\" style=\"font-size: 14px; margin: 0px; padding: 0px; line-height: 25.2px;\"><span style=\"font-weight: bold;\"><span style=\"color: rgb(255, 0, 0);\">*** Lô 2 : Có diện tích </span><span style=\"color: rgb(0, 0, 128);\">1000m2,</span><span style=\"color: rgb(255, 0, 0);\"> đã có trích đo trên thị trấn, thế đất vuông vắn nền đất chắc chắn,.</span><br style=\"line-height: 25.2px;\"><span style=\"color: rgb(255, 0, 0);\">- Đường rộng 4m xe oto vào thoải mái, cách đường 6 Tầm 200m, khu công nghiệp lương sơn khoảng </span><span style=\"color: rgb(0, 0, 128);\">400m,</span><span style=\"color: rgb(255, 0, 0);\"> rất tiện cho công nhân đi lại và mua sắm.</span></span></div><div class=\"pm-desc\" style=\"font-size: 14px; margin: 0px; padding: 0px; line-height: 25.2px;\"><span style=\"font-weight: bold;\"><span style=\"color: rgb(255, 0, 0);\">- </span><span style=\"color: rgb(0, 0, 128);\">Gía bán 2.7tr/m2.</span></span><br style=\"line-height: 25.2px;\"><br></div><div class=\"pm-desc\" style=\"font-size: 14px; margin: 0px; padding: 0px; line-height: 25.2px;\"><span style=\"font-weight: bold;\"><span style=\"color: rgb(255, 20, 147);\">*** Lô 3 Có diện tích</span><span style=\"color: rgb(255, 215, 0);\"> </span><span style=\"color: rgb(0, 0, 128);\">300m2 </span><span style=\"color: rgb(255, 20, 147);\">đã có trích đo trên huyện. ngay sát vách khu công nghiệp, thế đất vuông vắn, nền đất chắc chắn, bằng phẳng, rất phù hợp cho việc xây dựng phòng trọ, tiện cho Công nhân đi lại, mua sắm.</span></span></div><div class=\"pm-desc\" style=\"font-size: 14px; margin: 0px; padding: 0px; line-height: 25.2px;\"><span style=\"font-weight: bold;\"><span style=\"color: rgb(255, 20, 147);\">- </span><span style=\"color: rgb(0, 0, 128);\">Gía Bán : 3tr/m2</span><br style=\"line-height: 25.2px;\"><span style=\"color: rgb(255, 20, 147);\">- Qúy khách hàng vui lòng LH </span><span style=\"color: rgb(0, 0, 128);\">0332363839&nbsp; &nbsp;(0896.035.789)</span><span style=\"color: rgb(255, 20, 147);\"> để được xem đất và gặp chủ.</span></span></div></div>', '1', '800', '2000000000', '28', '98', '95', '', null, null, 'danghien', '1572973200', '1573108971', '7', '0', '0', '1', '1');
INSERT INTO `tbl_contents` VALUES ('60', '74', 'Bán đất lương sơn hòa bình 2.5ha trang trại cam,khu nghỉ dưỡng,là 1 thung lũng,oto lên được 0332363839', 'ban-dat-luong-son-hoa-binh-25ha-trang-trai-camkhu-nghi-duongla-1-thung-lungoto-len-duoc-0332363839', 'http://localhost/dulich/images/img20191107051240.jpg', '[{\"url\":\"http://localhost/dulich/images/img20191107051149.jpg\",\"alt\":\"\"},{\"url\":\"http://localhost/dulich/images/img20191107051200.jpg\",\"alt\":\"\"},{\"url\":\"http://localhost/dulich/images/img20191107051207.jpg\",\"alt\":\"\"},{\"url\":\"http://localhost/dulich/images/img20191107051302.jpg\",\"alt\":\"\"},{\"url\":\"http://localhost/dulich/images/img20191107051233.jpg\",\"alt\":\"\"}]', null, 'Có một Thung Lũng Tình Yêu duy nhất,  cách Hà Nội  không xa chỉ mất khoảng 50p lái xe,trong đó có 2,5ha và 2,3ha trang trại cam đang muốn chuyển nhượng , nơi đây quang cảnh cực đẹp, đủ các điều kiện để làm trang trại nhà vườn, khu nghỉ dưỡng cuối tuần, homestay...Nhanh tay số lượng có hạn.', '<div class=\"pm-title\" style=\"font-family: tahoma; font-size: 14px; margin: 0px 0px 10px; padding: 0px 0px 10px; font-weight: bold; border: 0px; background-color: rgb(255, 255, 255);\"><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"font-size: 14px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(0, 0, 128);\"> Cần Bán Gấp </span><span style=\"color: rgb(255, 0, 0);\">2.5ha Trang trại đã trồng Cam đang cho thu hoạch</span><span style=\"color: rgb(0, 0, 128);\">, chất lượng, số lượng ngang ngửa với cam Cao Phong.có thể mua mở rộng thêm. Khung cảnh rất nên thơ xung quanh là các dãy núi đá trùng trùng, điệp điệp,rất hùng vỹ, mùa đông aams áp, mùa hè mát mẻ buổi tối toàn phải đắp chăn...</span></span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(0, 0, 128);\"> Thế đất bằng phẳng,là một thung lũng tình yêu xung quanh là núi đá nhìn cực đẹp. chất đất tốt cây cối phát triển nhanh ít sâu bện rất phù hợp làm </span><span style=\"color: rgb(255, 0, 0);\">trang trại, khu nghỉ dưỡng, homstay, nông trại rau sạch, thực phẩm sạch phục vụ gia đình...</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(0, 0, 128);\"> Không khí trong lành sạch sẽ, an ninh bảo đảm, trong xã có dự án nghỉ dưỡng sông hồng, và dự án sân gol 70ha đang chuẩn bị xây dựng và nhiều nhà Hà Nội về xây dựng biệt phủ, trang trại nhà vườn, Nằm trong vùng quy hoạch vành đai xanh của huyện nên không sợ bởi sự chen lấn chuồng trại, công ty, xí nghiệp...</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(0, 0, 128);\"> Giao thông thuận tiện,oto lên tận nơi,trong thời gian ngắn nữa là có đường bê tông, Điện nước đầy đủ</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(0, 0, 128);\">Cách đường nhựa Liên xã tầm 3km, đường ql6 khoảng 6km , </span><span style=\"color: rgb(255, 0, 0);\">Hà Nội tầm 50km</span><span style=\"color: rgb(0, 0, 128);\">, thời gian sẽ được rút ngắn nữa khi đường 6 được mở rộng.</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(0, 0, 128);\"> Địa chỉ : </span><span style=\"color: rgb(255, 0, 0);\">xã Cao Răm, Huyện Lương Sơn Tỉnh Hòa Bình</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(0, 0, 128);\"> Giá bán :&nbsp; </span><span style=\"color: rgb(255, 0, 0);\">3 tỷ&nbsp;</span><span style=\"color: rgb(0, 0, 128);\"> &nbsp; &nbsp; đất đẹp giá rẻ đang cần bán gấp để giải quyết công việc.</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(0, 0, 128);\"><br></span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">***&nbsp;</span><span style=\"color: rgb(0, 0, 128);\">Trong khu vực còn có lô</span><span style=\"color: rgb(255, 0, 0);\"> 2,3 ha</span><span style=\"color: rgb(0, 0, 128);\"> cũng đã trồng toàn bộ Cam đang cho thu hoạch muốn chuyển nhượng, chất đất, địa thế, khí hậu, điều kiện cũng tương tự như lô trên</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(0, 0, 128);\">- Gía bán&nbsp; &nbsp; :&nbsp; &nbsp;</span><span style=\"color: rgb(255, 0, 0);\">3.5ty.</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(0, 0, 128);\">- Quý khách nào có nhu cầu thực sự xin vui lòng LH Đăng Hiển&nbsp; &nbsp;</span><span style=\"color: rgb(255, 0, 0);\">0332363839 (0896.035.789)</span><span style=\"color: rgb(0, 0, 128);\"> để được xem đất và gặp chủ.</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(0, 0, 128);\">- Thủ tục sang nhượng nhanh gọn, đúng quy định của pháp luật</span></h1></div>', '2', '25000', '3000000000', '28', '98', '100', '', null, null, 'danghien', '1573059600', '1573339614', '2', '0', '0', '1', '1');
INSERT INTO `tbl_contents` VALUES ('61', '68', 'Bán đất Lương Sơn Hòa Bình 3600m2 phẳng,mặt đường bê tông 25m,xe công vào,cách QL6 tầm1.5 km0962792687', 'ban-dat-luong-son-hoa-binh-3600m2-phangmat-duong-be-tong-25mxe-cong-vaocach-ql6-tam15-km0962792687', 'http://localhost/dulich/images/img20191106093934.jpg', '[{\"url\":\"http://localhost/dulich/images/img20191106090901.jpg\",\"alt\":\"\"},{\"url\":\"http://localhost/dulich/images/img20191106093547.jpg\",\"alt\":\"\"},{\"url\":\"http://localhost/dulich/images/img20191106093553.jpg\",\"alt\":\"\"},{\"url\":\"http://localhost/dulich/images/img20191106093932.jpg\",\"alt\":\"\"},{\"url\":\"http://localhost/dulich/images/img20191106093934.jpg\",\"alt\":\"\"}]', null, '3600m2 thổ cư có đầy đủ các điều kiện làm cty,kho xưởng, xe công vào tận nơi, điện Nước đầy đủ, nhân công tại chỗ  giá rẻ . Nhanh tay số lượng có hạn..', '<div><span style=\"font-weight: bold;\"><span style=\"color: rgb(255, 0, 0);\">*</span><span style=\"color: rgb(0, 0, 128);\">&nbsp; Cần bán</span><span style=\"color: rgb(255, 0, 0);\"> 3600m2 đất thổ cư trong đó có 400m2 đất nhà ở</span><span style=\"color: rgb(0, 0, 128);\">, còn lại là đất trồng cây lâu năm.</span></span></div><div><span style=\"font-weight: bold;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(0, 0, 128);\"> Thế đất bằng phẳng, mặt đường bê tông xóm tầm 25m, đường to rộng xe công vào thoải mái. trong khu vực có nhiều doanh nghiệp về xây dựng cty, kho xưởng, Xã Hòa Sơn được huyện quy hoạch là khu vực phát triển Công Nghiệp...</span></span></div><div><span style=\"font-weight: bold;\"><span style=\"color: rgb(255, 0, 0);\">+&nbsp;</span><span style=\"color: rgb(0, 0, 128);\">Cách đường QL6 và đường HCM tầm 1.5km, trung tâm TP Hà Nội hơn 30km.</span></span></div><div><span style=\"font-weight: bold;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(0, 0, 128);\"> Gía bán 700k/m rẻ hơn khu vực rất nhiều..</span></span></div><div><span style=\"font-weight: bold;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(0, 0, 128);\"> Địa chỉ: </span><span style=\"color: rgb(255, 0, 0);\">Hòa sơn,Lương Sơn, Hòa Bình</span><span style=\"color: rgb(0, 0, 128);\">.</span></span></div><div><span style=\"font-weight: bold; color: rgb(0, 0, 128);\"><br></span></div><div><span style=\"font-weight: bold;\"><span style=\"color: rgb(255, 0, 0);\">**</span><span style=\"color: rgb(0, 0, 128);\"> Lô 2 </span><span style=\"color: rgb(255, 0, 0);\">DT 3000m2 có 200m2</span><span style=\"color: rgb(0, 0, 128);\"> đất nhà ở còn lại là đất trồng cây lâu năm,với 10m mặt đường liên xã sâu vào </span><span style=\"color: rgb(255, 0, 0);\">30m.</span></span></div><div><span style=\"font-weight: bold;\"><span style=\"color: rgb(255, 0, 0);\">+&nbsp;</span><span style=\"color: rgb(0, 0, 128);\"> Gía bán&nbsp; &nbsp;:&nbsp; </span><span style=\"color: rgb(255, 0, 0);\">1.2tr/m2</span></span></div><div><span style=\"font-weight: bold; color: rgb(0, 0, 128);\"><br></span></div><div><span style=\"font-weight: bold;\"><span style=\"color: rgb(255, 0, 0);\">***</span><span style=\"color: rgb(0, 0, 128);\">&nbsp; Lô 3&nbsp; </span><span style=\"color: rgb(255, 0, 0);\">DT 6800 trong đó 4800M2 trong sổ,2000m2 là ngoài sổ, có 800m2 đất ở Lâu dài,</span><span style=\"color: rgb(0, 0, 128);\">còn lại là đất vườn( nếu bán chỉ tính tiền diện tích đất trong sổ)</span></span></div><div><span style=\"font-weight: bold;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(0, 0, 128);\"> Thế đất bằng phẳng, nền đất chắc chắn, xe công vào tận nơi.cách đường ql6 1km.</span></span></div><div><span style=\"font-weight: bold;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(0, 0, 128);\"> ĐC : </span><span style=\"color: rgb(255, 0, 0);\">Chiến Thắng, Xuân Mai, Chương Mỹ Hà Nội</span><span style=\"color: rgb(0, 0, 128);\">.</span></span></div><div><span style=\"font-weight: bold;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(0, 0, 128);\"> Gía bán&nbsp; &nbsp; :&nbsp; </span><span style=\"color: rgb(255, 0, 0);\">1.2tr/m2&nbsp;</span></span></div><div><span style=\"font-weight: bold;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(0, 0, 128);\"> Gia đình thật sự thiện chí bán, bán để được việc, bác nào có nhu cầu xin vui lòng LH </span><span style=\"color: rgb(255, 0, 0);\">Đăng Hiển: 0332363839&nbsp; &nbsp;0896.035.789.</span><span style=\"color: rgb(0, 0, 128);\">để được&nbsp; xem đất va gặp chủ.</span></span></div>', '1', '3600', '2500000000', '28', '98', '94', '', null, null, 'danghien', '1573059600', '1573339549', '2', '0', '0', '1', '1');
INSERT INTO `tbl_contents` VALUES ('62', '68', 'Bán đất Lương Sơn Hòa Bình 7800m có 1050m xây dựng, view cao,thoáng,bám hồ 120m cực đẹp 0332363839', 'ban-dat-luong-son-hoa-binh-7800m-co-1050m-xay-dung-view-caothoangbam-ho-120m-cuc-dep-0332363839', 'http://localhost/dulich/images/img20191107162606.jpg', '[{\"url\":\"http://localhost/dulich/images/img20191107162548.jpg\",\"alt\":\"\"},{\"url\":\"http://localhost/dulich/images/screenshot2019-11-07-16-27-52-86.png\",\"alt\":\"\"},{\"url\":\"http://localhost/dulich/images/img20191107162603.jpg\",\"alt\":\"\"},{\"url\":\"http://localhost/dulich/images/img20191107161930.jpg\",\"alt\":\"\"},{\"url\":\"http://localhost/dulich/images/img20191107162554.jpg\",\"alt\":\"\"}]', null, 'Đất bám 120,mặt Hồ,giá rẻ, view cao thoáng mát, đất ở 1050m có thể phân lô hoặc xây dựng thoải mái...Lưng tựa núi,chân đạp thủy, nằm ngay cạnh khu nghỉ dưỡng Vịt Cổ xanh, và nhiều đại gia Hà Nội khác,giao thông thuận tiện cách Hà Nội tầm 40km.', '<div class=\"pm-title\" style=\"font-family: tahoma; font-size: 14px; margin: 0px 0px 10px; padding: 0px 0px 10px; font-weight: bold; border: 0px; background-color: rgb(255, 255, 255);\"><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"font-size: 14px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> Cần bán gấp lô đất thổ cư làm trang trại, khu nghỉ dưỡng, homestay bám mặt Hồ có một không hai trong khu vực, với diện tích</span><span style=\"color: rgb(255, 0, 0);\"> 7800m2 trong đó có</span><span style=\"color: rgb(5, 86, 153);\"> </span><span style=\"color: rgb(255, 0, 0);\">1050m2 đất xây dựng</span><span style=\"color: rgb(5, 86, 153);\">, còn lại là đất trồng cây lâu năm, view cao thoáng mát, bám mặt hồ tầm 120m.</span></span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> không khí trong làng mát mẻ, đời sống dân trí cao, an ninh bảo đảm, rất phù hợp để làm trang trại, khu nghỉ dưỡng, biệt thự nhà vườn, homestay. Do diện tích đất nhà ở lớn nên quý khách hàng có thể xây dựng được ngay mà k cần phải xin phép.</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\">Trong khu vực có nhiều đại gia Hà Thành về xây dựng biệt phủ, trang trại khu nghỉ dưỡng cuối tuần, làm homestay tạo nên một quần thể, cộng đồng người Hà Nội trong khu vực(ngay sát Khu nghỉ dưỡng Vịt Cổ Xanh</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> Giao thông thuận tiện cách đường nhựa liên xã tầm 1km,</span><span style=\"color: rgb(255, 0, 0);\"> đường QL6 khoảng 5km, Hà Nội tầm 45km.</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\">Để biết thêm chi tiết LH Đăng Hiển </span><span style=\"color: rgb(255, 0, 0);\">0332363839&nbsp; - 0896035789</span><span style=\"color: rgb(5, 86, 153);\"> để được xem đất và gặp chủ.</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\">Thủ tục sang nhượng nhanh gọn, đúng quy định của pháp luật.</span></h1></div>', '1', '7800', '5460000000', '28', '98', '97', '', null, null, 'danghien', '1573146000', '1573858245', '3', '0', '0', '1', '1');
INSERT INTO `tbl_contents` VALUES ('63', '74', 'Bán đất thổ cư Lương Sơn Hòa Bình1.1ha,20m mặt đường xóm làm trang trại nghỉ dưỡng,giá rẻ  0332363839', 'ban-dat-tho-cu-luong-son-hoa-binh11ha20m-mat-duong-xom-lam-trang-trai-nghi-duonggia-re-0332363839', 'http://localhost/dulich/images/img20191108044050.jpg', '[{\"url\":\"http://localhost/dulich/images/img20191108044052.jpg\",\"alt\":\"\"},{\"url\":\"http://localhost/dulich/images/img20191108044114.jpg\",\"alt\":\"\"},{\"url\":\"http://localhost/dulich/images/img20191108044111.jpg\",\"alt\":\"\"},{\"url\":\"http://localhost/dulich/images/img20191108044055.jpg\",\"alt\":\"\"},{\"url\":\"http://localhost/dulich/images/img20191108044059.jpg\",\"alt\":\"\"}]', null, 'Thế đất bằng phẳng,bám đường bê tông xóm, bám suối, có ao, đã có một Nhà Sàn và đầy đủ công trình phụ chỉ sẵn ở. trong vườn có nhiều loại cây ăn quả đang cho thu hoạch, cây hoa, cây cảnh, cây bóng mát có giá trị kinh tế cao, nằm trong quần thể các đại gia Hà Nội  và Khu résot nghỉ dưỡng......', '<div class=\"pm-title\" style=\"font-family: tahoma; margin: 0px 0px 10px; padding: 0px 0px 10px; font-weight: bold; border: 0px; background-color: rgb(255, 255, 255);\"><h1 itemprop=\"name\" style=\"font-size: 16px; font-family: Tahoma; margin: 0px; padding: 0px;\"><span style=\"font-size: 14px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(0, 0, 128);\">Do cần tiền đầu tư gia đình muốn chuyển nhượng</span><span style=\"color: rgb(255, 0, 0);\"> 1.1ha</span><span style=\"color: rgb(0, 0, 128);\"> đất thổ cư trong đó có </span><span style=\"color: rgb(255, 0, 0);\">400m2 </span><span style=\"color: rgb(0, 0, 128);\">đất nhà ở, còn lại là đất trồng cây lâu năm( </span><span style=\"color: rgb(255, 0, 0);\">7000m2 trong sổ còn 4000m ngoài sổ, có giấy tờ mua bán đầy đủ</span><span style=\"color: rgb(0, 0, 128);\">).</span></span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; margin: 0px; padding: 0px;\"><span style=\"font-size: 14px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(0, 0, 128);\">&nbsp;</span></span><span style=\"color: rgb(0, 0, 128); font-size: 16px;\">Bám đường bê tông xóm tầm </span><span style=\"font-size: 16px; color: rgb(255, 0, 0);\">20m</span><span style=\"color: rgb(0, 0, 128); font-size: 16px;\">, bám suối, có ao.hiện tại đã có nhà sàn, đầy đủ các công trinh phụ bảo đảm cho gia đình sinh hoạt, tường bao vây xung quanh, trồng nhiều loại cây ăn quả, cây cảnh cây bóng mát có giá trị kinh tế cao...</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; margin: 0px; padding: 0px;\"><span style=\"font-size: 12pt;\"><span style=\"font-weight: bold; font-size: 12pt; color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(0, 0, 128); font-weight: bold; font-size: 12pt;\">Thế đất bằng phẳng, chất đất tốt rất thuận tiện cho việc trồng cây, trồng rau. Quý khách hàng chỉ cần cải tạo thêm một chút nữa là sẽ trở thành trang trại nghỉ dưỡng với đủ các loại hoa trái quanh năm.</span></span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; margin: 0px; padding: 0px;\"><span style=\"font-size: 12pt;\"><span style=\"font-weight: bold; font-size: 12pt; color: rgb(255, 0, 0);\">+</span><span style=\"font-weight: bold; font-size: 12pt;\"><span style=\"color: rgb(255, 0, 0);\"> </span><span style=\"color: rgb(0, 0, 128);\">Không khí trong lành sạch sẽ, an ninh bảo đảm, trong khu vực có nhiều nhà Hà Nội về xây dựng biệt phủ (Làng Hà Nội) và các khu resort nghỉ dưỡng, du lịch sinh thái như Vịt Cổ Xanh, Beverly Hill, Bô Cagadern... Nằm trong vùng quy hoạch vành đai xanh của huyện nên không sợ bởi sự chen lấn chuồng trại, công ty, xí nghiệp..</span></span></span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; margin: 0px; padding: 0px;\"><span style=\"font-size: 12pt;\"><span style=\"font-weight: bold; font-size: 12pt; color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(0, 0, 128); font-weight: bold; font-size: 12pt;\"> Giao thông thuận tiện, đường bê tông to rộng xe </span><span style=\"font-weight: bold; font-size: 12pt; color: rgb(255, 0, 0);\">45</span><span style=\"color: rgb(0, 0, 128); font-weight: bold; font-size: 12pt;\"> chỗ vào thoải mái. Cách đường QL 6 tầm </span><span style=\"font-weight: bold; font-size: 12pt; color: rgb(255, 0, 0);\">6km</span><span style=\"color: rgb(0, 0, 128); font-weight: bold; font-size: 12pt;\">, Hà Nội khoảng</span><span style=\"color: rgb(255, 0, 0);\"><span style=\"font-weight: bold; font-size: 12pt;\"> 45km</span><span style=\"font-weight: bold; font-size: 12pt;\">,</span></span><span style=\"color: rgb(0, 0, 128); font-weight: bold; font-size: 12pt;\"> thời gian sẽ được rút ngắn nữa khi đường 6 được mở rộng.</span></span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; margin: 0px; padding: 0px;\"><span style=\"font-size: 12pt;\"><span style=\"font-weight: bold; font-size: 12pt; color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(0, 0, 128); font-weight: bold; font-size: 12pt;\"> Giá bán : </span><span style=\"font-weight: bold; font-size: 12pt; color: rgb(255, 0, 0);\">4.3 TY</span><span style=\"color: rgb(0, 0, 128); font-weight: bold; font-size: 12pt;\"> Đang cần bán gấp để giải quyết công việc.</span></span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; margin: 0px; padding: 0px;\"><span style=\"font-size: 12pt;\"><span style=\"font-weight: bold; font-size: 12pt; color: rgb(255, 0, 0);\">+</span><span style=\"font-weight: bold; font-size: 12pt;\"><span style=\"color: rgb(0, 0, 128);\">Quý khách vui lòng LH </span><span style=\"color: rgb(255, 0, 0);\">Đăng Hiển </span></span><span style=\"font-weight: bold; font-size: 12pt; color: rgb(255, 0, 0);\">0332363839&nbsp; (0896.035.789)</span><span style=\"color: rgb(0, 0, 128); font-weight: bold; font-size: 12pt;\"> để được xem đất.</span></span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; margin: 0px; padding: 0px;\"><span style=\"font-size: 12pt;\"><span style=\"font-weight: bold; font-size: 12pt; color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(0, 0, 128); font-weight: bold; font-size: 12pt;\"> Thủ tục sang nhượng nhanh gọn, đúng quy định của pháp luật.</span></span></h1></div>', '2', '11000', '4300000000', '28', '98', '97', '', null, null, 'danghien', '1573146000', '1573425911', '6', '0', '0', '1', '1');
INSERT INTO `tbl_contents` VALUES ('64', '71', 'Bán đất kỳ Sơn Hòa Bình 5000m2 biệt thự,bể bơi,vườn cây,ao cá và nhiều đồ dùng có giá trị 0332363839', 'ban-dat-ky-son-hoa-binh-5000m2-biet-thube-boivuon-cayao-ca-va-nhieu-do-dung-co-gia-tri-0332363839', 'http://localhost/dulich/images/img20191108214856.jpg', '[{\"url\":\"http://localhost/dulich/images/img20191108160543.jpg\",\"alt\":\"\"},{\"url\":\"http://localhost/dulich/images/img20191108160721.jpg\",\"alt\":\"\"},{\"url\":\"http://localhost/dulich/images/img20191108161443.jpg\",\"alt\":\"\"},{\"url\":\"http://localhost/dulich/images/img20191108161401.jpg\",\"alt\":\"\"},{\"url\":\"http://localhost/dulich/images/img20191108160509.jpg\",\"alt\":\"\"},{\"url\":\"http://localhost/dulich/images/img20191108161221.jpg\",\"alt\":\"\"},{\"url\":\"http://localhost/dulich/images/img20191108160447.jpg\",\"alt\":\"\"},{\"url\":\"http://localhost/dulich/images/img20191108214856.jpg\",\"alt\":\"\"}]', null, 'Biệt thự nghỉ dưỡng sẵn ở và khai thác có 102 tại Hòa Bình, được thiết kế đẹp mắt, khoa học, chắc chắn ai vào cũng phải mê, với đầy đủ các điều kiện, đồ dùng để phục vụ nhu cầu nghỉ dưỡng cuối tuần sau những ngày làm việc vất vả.Gía trị sử dụng gấp nhiều lần so với các BT trong khu dự án,full nội thất,có bể bơi ao cá,sân vườn khuôn viên hoàn thiện...', '<div class=\"pm-title\" style=\"margin: 0px 0px 10px; padding: 0px 0px 10px; border: 0px; background-color: rgb(255, 255, 255);\"><h1 itemprop=\"name\" style=\"margin: 0px; padding: 0px;\"><span style=\"font-size: 12pt;\"><span style=\"color: rgb(0, 0, 128); font-family: Arial; font-size: 12pt;\">+</span><span style=\"color: rgb(0, 0, 128); font-family: Arial; font-size: 12pt;\">&nbsp;</span><span style=\"color: rgb(0, 0, 128); font-family: Arial; font-size: 12pt;\">Do phải chuyển đơn vị công tác và nơi sinh sống nên gia đình Cần bán </span><span style=\"font-family: Arial; font-size: 12pt; color: rgb(255, 0, 0);\">5000m2 khuôn viên hoàn thiện</span><span style=\"color: rgb(0, 0, 128); font-family: Arial; font-size: 12pt;\">, biệt thự nhà vườn đẹp long lanh sổ đỏ </span><span style=\"font-family: Arial; font-size: 12pt; color: rgb(255, 0, 0);\">có 300m2 đất nhà ở,</span><span style=\"color: rgb(0, 0, 128); font-family: Arial; font-size: 12pt;\"> còn lại là đất trồng cây lâu năm,tường bao và hàng rào dây thép gai kiên cố, ranh giới rõ ràng.</span></span></h1><h1 itemprop=\"name\" style=\"margin: 0px; padding: 0px;\"><span style=\"font-size: 12pt; font-family: Arial; color: rgb(0, 0, 128);\">- Thế đất cao ráo thoáng mát, view cực đẹp nhìn ra các</span><span style=\"font-size: 12pt; font-family: Arial; color: rgb(255, 0, 0);\"> dãy núi trùng trùng điệp điệp, và cánh đồng rất thơ mộng.</span></h1></div><div class=\"pm-content\" style=\"margin: 0px; padding: 0px; background-color: rgb(255, 255, 255);\"><div class=\"pm-desc\" style=\"margin: 0px; padding: 0px; line-height: 25.2px;\"><div class=\"pm-title\" style=\"margin: 0px 0px 10px; padding: 0px 0px 10px; border: 0px;\"><h1 itemprop=\"name\" style=\"margin: 0px; padding: 0px;\"><span style=\"font-family: Arial; font-size: 12pt; color: rgb(0, 0, 128);\">- Biệt thự được thết kế theo kiến trúc Kim cổ kết hợp, toàn bộ cửa và phần gỗ trong nhà đều làm bằng gỗ Lim chắc chắn</span><span style=\"font-family: Arial; font-size: 12pt; color: rgb(255, 0, 0);\">.có 3 tầng,6 phòng ngủ vệ sinh khép kín, 3p khách, các phòng ngủ có cửa sổ nhìn về phía trước và ra khu vườn rất lãng mạn.</span></h1></div><div class=\"pm-content\" style=\"margin: 0px; padding: 0px;\"><div class=\"pm-desc\" style=\"margin: 0px; padding: 0px; line-height: 25.2px;\"><span style=\"font-family: Arial; color: rgb(0, 0, 128); font-weight: bold;\">- Có phòng đọc và làm việc bằng kính trong suốt cảm giác như</span><span style=\"font-family: Arial; font-weight: bold; color: rgb(255, 0, 0);\"> hòa mình vào thiên nhiên, </span><span style=\"font-family: Arial; color: rgb(0, 0, 128); font-weight: bold;\">có bể bơi, sân cầu lông,vườn cây ao cá, chuồng nuôi Lợn mán, vườn rau đủ cả, có hệ thống cống thoát nước rất sạch sẽ và khoa học.<br style=\"line-height: 25.2px;\">- Hoa thơm quả ngọt bốn mùa, có nhiều cây cảnh, cây ăn quả có giá trị kinh tế cao, không khí trong lành, sạch sẽ, yên tĩnh phù hợp cho việc </span><span style=\"font-family: Arial; font-weight: bold; color: rgb(255, 0, 0);\">nghỉ dưỡng cuối tuần nuôi trồng thực phẩm sạch</span><span style=\"font-family: Arial; color: rgb(0, 0, 128); font-weight: bold;\"> phục vụ gia đình, xung quanh có cả một quần thể biệt thự nhà vườn của đại gia Hà Nội.và nhiều khu resot nghỉ dưỡng như </span><span style=\"font-family: Arial; font-weight: bold;\"><span style=\"color: rgb(255, 0, 0);\">SAKANA, Hồ Dụ, Cao Vàng, Thác Thang Thiên, ORAHAFAM, Công viên nghĩa trang Lạc Hồng Viên,Sân gol Singgapo....</span><br style=\"line-height: 25.2px;\"><span style=\"color: rgb(0, 0, 128);\">- Giao thông thuận tiện quý khách có thể đi đường QL6 hoặc Đại Lộ Hòa Lạc Hòa Bình đều được. Cách đường </span></span><span style=\"font-family: Arial; font-weight: bold; color: rgb(255, 0, 0);\">Quốc Lộ 6 khoảng 1km, TT Hà Nội tầm 50km</span><span style=\"font-family: Arial; color: rgb(0, 0, 128); font-weight: bold;\">.<br style=\"line-height: 25.2px;\">- ĐC : </span><span style=\"font-family: Arial; font-weight: bold;\"><span style=\"color: rgb(255, 0, 0);\">Mông Hóa, Kỳ Sơn, Hòa Bình.</span><br style=\"line-height: 25.2px;\"><span style=\"color: rgb(0, 0, 128);\">- Qúy khách vui lòng LH Đăng Hiển: </span></span><span style=\"font-family: Arial; font-weight: bold; color: rgb(255, 0, 0);\">0332.36.38.39 (0896.035.789) </span><span style=\"font-family: Arial; color: rgb(0, 0, 128); font-weight: bold;\">để được biết gía, xem đất và gặp chủ.</span></div></div><span style=\"font-family: Arial; color: rgb(0, 0, 128); font-weight: bold;\">- Thủ tục pháp lý đầy đủ, nhanh gọn đúng quy định của pháp luật</span></div></div>', '1', '5000', '5500000000', '28', '97', '129', '', null, null, 'danghien', '1573232400', '1575065240', '7', '0', '0', '1', '1');
INSERT INTO `tbl_contents` VALUES ('65', '68', 'Bán đất Lương Sơn Hòa Bình1800m2 có Hang đá để ủ Rượu,sát đường QL6,cách Hà Nội 40km 0332363839', 'ban-dat-luong-son-hoa-binh1800m2-co-hang-da-de-u-ruousat-duong-ql6cach-ha-noi-40km-0332363839', 'http://localhost/dulich/images/img20191110104328.jpg', '[{\"url\":\"http://localhost/dulich/images/screenshot2019-11-13-05-45-44-44.png\",\"alt\":\"\"},{\"url\":\"http://localhost/dulich/images/img20191110104335.jpg\",\"alt\":\"\"},{\"url\":\"http://localhost/dulich/images/img20191110104001.jpg\",\"alt\":\"\"},{\"url\":\"http://localhost/dulich/images/img20191110104028.jpg\",\"alt\":\"\"}]', null, '1800m2 là lô duy nhất trong vùng ,Lưng tụa núi và có hang đá tự nhiên,bám đường bê tông xóm tầm 50m, view nhìn ra xa là các dãy núi trùng trùng điệp điệp, cách QL6 200m, Hà Nội Khoảng 40km. ', '<div class=\"pm-title\" style=\"font-family: tahoma; font-size: 14px; margin: 0px 0px 10px; padding: 0px 0px 10px; font-weight: bold; border: 0px; background-color: rgb(255, 255, 255);\"><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"font-size: 14px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> Cần bán </span><span style=\"color: rgb(255, 0, 0);\">1800m2</span><span style=\"color: rgb(5, 86, 153);\"> có thể mở rộng thêm. lưng tựa Núi đá, trong đó có hang rất đẹp, có thể chứa </span><span style=\"color: rgb(255, 0, 0);\">hàng ngìn Lít Rượu</span><span style=\"color: rgb(5, 86, 153);\">, đất bám mặt đường bê tông tầm 50m,View cực đẹp đứng trên đất có thể quan sát các dãy núi đá trùng trùng, điệp điệp.</span></span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> Không khí trong lành sạch sẽ, an ninh bảo đảm, rất phù hợp để làm khu nghỉ dưỡng, homestay... Quý khách hàng chỉ cần cải tạo thêm một chút nữa là sẽ trở thành trang trại với đủ các loại hoa trái quanh năm.</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\">Giao thông thuận tiện, cách đường </span><span style=\"color: rgb(255, 0, 0);\">QL6</span><span style=\"color: rgb(5, 86, 153);\"> khoảng </span><span style=\"color: rgb(255, 0, 0);\">200m</span><span style=\"color: rgb(5, 86, 153);\">, </span><span style=\"color: rgb(255, 0, 0);\">Hà Nội</span><span style=\"color: rgb(5, 86, 153);\"> tầm </span><span style=\"color: rgb(255, 0, 0);\">40km</span><span style=\"color: rgb(5, 86, 153);\">, thời gian sẽ được rút ngắn nữa khi đường 6 được mở rộng.</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> Địa chỉ: </span><span style=\"color: rgb(255, 0, 0);\">Xóm Kẽm, Lâm Sơn,Lương Sơn, Hòa Bình.</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> Giá bán :&nbsp; &nbsp; &nbsp;&nbsp;</span><span style=\"color: rgb(255, 0, 0);\">1 tỷ</span><span style=\"color: rgb(5, 86, 153);\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;đất đẹp giá rẻ đang cần bán gấp để giải quyết công việc.</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\">Quý khách vui lòng LH </span><span style=\"color: rgb(255, 0, 0);\">Đăng Hiển 0332363839&nbsp; &nbsp;(0896.035.789) để được xem đất và gặp chủ</span><span style=\"color: rgb(5, 86, 153);\">.</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> Thủ tục sang nhượng nhanh gọn, đúng quy định của pháp luật.</span></h1></div>', '1', '1800', '1000000000', '28', '98', '101', '', null, null, 'danghien', '1573578000', '1573797944', '3', '0', '0', '1', '1');
INSERT INTO `tbl_contents` VALUES ('66', '70', 'Bán đất Lương Sơn Hòa Bình 6500m2 Vườn cây,ao cá,có nhà sẵn ở,cạnh resot dưỡng lão giá rẻ 0332363839', 'ban-dat-luong-son-hoa-binh-6500m2-vuon-cayao-caco-nha-san-ocanh-resot-duong-lao-gia-re-0332363839', 'http://localhost/dulich/images/img20191106082205.jpg', '[{\"url\":\"http://localhost/dulich/images/img20191106082124.jpg\",\"alt\":\"\"},{\"url\":\"http://localhost/dulich/images/img20191107164455.jpg\",\"alt\":\"\"},{\"url\":\"http://localhost/dulich/images/img20191106082228.jpg\",\"alt\":\"\"}]', null, 'Lô đất 6500m2 nằm trong quần thể các dự án và khu nghỉ dưỡng của Đại Gia Hà Nội,giao thông thuận tiện cách đường QL6 tầm 1.5km,Hà Nội khoảng 32km, đã có nhà cấp 4 sẵn ở, điện nước đầy đủ, vườn cây ao cá đang cho thu hoạch...', '<div class=\"pm-title\" style=\"font-family: tahoma; font-size: 14px; margin: 0px 0px 10px; padding: 0px 0px 10px; font-weight: bold; border: 0px; background-color: rgb(255, 255, 255);\"><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"font-size: 14px;\"><span style=\"color: rgb(255, 0, 0);\">+&nbsp;</span><span style=\"color: rgb(5, 86, 153);\"> Bán gấp </span><span style=\"color: rgb(255, 0, 0);\">6500m2 đất thổ cư </span><span style=\"color: rgb(5, 86, 153);\">trong đó có </span><span style=\"color: rgb(255, 0, 0);\">400m2 đất nhà ở,còn lại là đất trồng cây lâu năm</span><span style=\"color: rgb(5, 86, 153);\">, có nhà cấp bốn bằng Đá ong cực kỳ mát mẻ, Ao cá to rộng nước cả quanh năm và đã được kè bờ chắc chắn. Có rất nhiều cây ăn quả cây bóng mát phủ kín vườn, đa dạng về chủng loại..</span></span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> Không khí trong lành yên tĩnh, an ninh bảo đảm, có nhiều biệt phủ của đại gia Hà Nội về xây dựng, bên cạnh là khu resot Dưỡng Lão đang trong quá trình xây dựng, Đường bê tông to rộng </span><span style=\"color: rgb(255, 0, 0);\">xe 45</span><span style=\"color: rgb(5, 86, 153);\"> chỗ vào thoải mái.</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+ </span><span style=\"color: rgb(5, 86, 153);\">Cách đường QL6 tầm</span><span style=\"color: rgb(255, 0, 0);\"> 1.2km</span><span style=\"color: rgb(5, 86, 153);\">, thành phố Hà Nội khoảng </span><span style=\"color: rgb(255, 0, 0);\">32km</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> ĐC: </span><span style=\"color: rgb(255, 0, 0);\">Hòa Sơn, Lương Sơn, Hòa Bình.</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> Để biết thêm chi tiết LH Đăng Hiển </span><span style=\"color: rgb(255, 0, 0);\">0332363839&nbsp; &nbsp; (0896. 035. 789)</span><span style=\"color: rgb(5, 86, 153);\">.</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(5, 86, 153);\">Hoặc quý khách hàng có thể tra trên google bằng SĐT </span><span style=\"color: rgb(255, 0, 0);\">0962.792.687 </span><span style=\"color: rgb(5, 86, 153);\">để biết thêm thông tin nhiều lô khác nữa.</span></h1><div><span style=\"color: rgb(5, 86, 153);\"><br></span></div><div><span style=\"color: rgb(5, 86, 153);\"><br></span></div><div><span style=\"color: rgb(5, 86, 153);\"><iframe width=\"560\" height=\"320\" src=\"https://www.youtube.com/embed/08ejfs9OvsI\" frameborder=\"0\" allowfullscreen=\"\"></iframe><br></span></div></div>', '1', '6500', '4800000000', '28', '98', '94', '', null, null, 'danghien', '1573664400', '1573797768', '6', '0', '0', '1', '1');
INSERT INTO `tbl_contents` VALUES ('67', '71', 'Bán đất Lương Sơn Hòa Bình 5ha cả một quả đồi là Khu nhảy dù lý tưởng,nhìn tứ phía,bám hồ lớn 0332363839', 'ban-dat-luong-son-hoa-binh-5ha-ca-mot-qua-doi-la-khu-nhay-du-ly-tuongnhin-tu-phiabam-ho-lon-0332363839', 'http://localhost/dulich/images/img20191107165503.jpg', '[{\"url\":\"http://localhost/dulich/images/img20191107165251.jpg\",\"alt\":\"\"},{\"url\":\"http://localhost/dulich/images/img20191107164502.jpg\",\"alt\":\"\"},{\"url\":\"http://localhost/dulich/images/img20191107165406.jpg\",\"alt\":\"\"}]', null, 'Thế đất có một không hai trong khu vực toàn bộ là cả một quả đồi lớn, nhìn tứ phía xung quanh, bên dưới là Hồ lớn rộng cả trục ha, đã full toàn bộ Mít thái đang chuẩn bị cho thu hoạch đại trà.là nơi nghỉ dưỡng lý tưởng kết  hợp với môn thể thao nhảy dù thì không thể chê được. nhanh tay số lượng có hạn.', '<div class=\"pm-title\" style=\"font-family: tahoma; font-size: 14px; margin: 0px 0px 10px; padding: 0px 0px 10px; font-weight: bold; border: 0px; background-color: rgb(255, 255, 255);\"><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"font-size: 14px;\"><span style=\"color: rgb(5, 86, 153);\">- Bán gấp</span><span style=\"color: rgb(255, 0, 0);\"> 5ha </span><span style=\"color: rgb(5, 86, 153);\">bao trọn một đỉnh của quả đồi, đất đã được phân tầng, và trồng toàn bộ là cây Mit thái đang chuẩn bị cho thu hoach.</span></span></h1><h1 itemprop=\"name\" style=\"color: rgb(5, 86, 153); font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\">+ View Cao thoáng mát, đứng trên đất có thể quan sát được tứ phía xung quanh,phía dưới là Hồ rộng gần trục ha, thế gối sươn đạp thủy. thế đất cao quý khách hàng có thể làm khu nhaỷ dù rất lý tưởng, quanh khu vực hà nội không có chỗ nào có được lợi thế đó.</h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(5, 86, 153);\">+ Không khí trong lành yên tĩnh, an ninh bảo đảm, Trong khu vực có nhiều khu resot như </span><span style=\"color: rgb(255, 0, 0);\">Beveryhill, Vịt cổ xanh.... Bocagardern,khu du lịch Hồ Đồng Chanh....</span><span style=\"color: rgb(5, 86, 153);\">và rất nhiều đại gia Hà Nọi về xây dựng Biệt Phủ trang trại và khu nghỉ dưỡng cuối tuần</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(5, 86, 153);\">+ Cách đường </span><span style=\"color: rgb(255, 0, 0);\">QL6 tầm 5km,</span><span style=\"color: rgb(5, 86, 153);\"> thành phố Hà Nội khoảng</span><span style=\"color: rgb(255, 0, 0);\"> 35km</span><span style=\"color: rgb(5, 86, 153);\">.</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(5, 86, 153);\">+ ĐC: C</span><span style=\"color: rgb(255, 0, 0);\">ư Yên, Lương Sơn, Hòa Bình</span><span style=\"color: rgb(5, 86, 153);\">.</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(5, 86, 153);\">+ Để biết thêm chi tiết LH Đăng Hiển </span><span style=\"color: rgb(255, 0, 0);\">0332363839&nbsp; &nbsp;(0896. 035. 789)</span><span style=\"color: rgb(5, 86, 153);\">.</span></h1><h1 itemprop=\"name\" style=\"color: rgb(5, 86, 153); font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><br></h1><h1 itemprop=\"name\" style=\"color: rgb(5, 86, 153); font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\">Hoặc quý khách hàng có thể tra trên google bằng SĐT 0962.792.687 để biết thêm thông tin nhiều lô khác nữa.</h1><div><br></div><div><iframe width=\"560\" height=\"320\" src=\"https://www.youtube.com/embed/XqFCIDqSpyg\" frameborder=\"0\" allowfullscreen=\"\"></iframe><br></div></div>', '1', '50000', '18000000000', '28', '98', '97', '', null, null, 'danghien', '1573664400', '1573797476', '5', '0', '0', '1', '1');
INSERT INTO `tbl_contents` VALUES ('68', '71', 'Thung lũng tinh yêu 100ha làm nghỉ dưỡng sinh thái view tuyệt đẹp,Đ Bê tông lên tận nơi cách HN 50km 0332363839', 'thung-lung-tinh-yeu-100ha-lam-nghi-duong-sinh-thai-view-tuyet-depd-be-tong-len-tan-noi-cach-hn-50km-0332363839', 'http://localhost/dulich/images/img20191106131327.jpg', '[{\"url\":\"http://localhost/dulich/images/img20191106130908.jpg\",\"alt\":\"\"},{\"url\":\"http://localhost/dulich/images/img20191106130918.jpg\",\"alt\":\"\"},{\"url\":\"http://localhost/dulich/images/img20191106131453.jpg\",\"alt\":\"\"},{\"url\":\"http://localhost/dulich/images/img20191106131149.jpg\",\"alt\":\"\"},{\"url\":\"http://localhost/dulich/images/img20191106131502.jpg\",\"alt\":\"\"}]', null, '100ha đầy đủ các yếu tố để làm du lịch sinh thái, nghỉ dưỡng sinh thái toàn bộ khu đất là một thung lũng, xung quanh là núi rừng hùng vĩ,lên đỉnh núi ta có thể nhìn thấy KengNam, và là nơi lý tưởng cho ai yêu thích môn nhảy dù,đường bê tông lên tận noi,...', '<div class=\"kqchitiet\" style=\"font-family: Tahoma; font-size: 12px; margin: 0px 0px 10px; padding: 0px; position: relative; line-height: 22px; background-color: rgb(255, 255, 255);\"><span style=\"font-size: 14px; font-weight: bold;\"><span style=\"color: rgb(255, 0, 0);\">+</span> <span style=\"color: rgb(0, 0, 128);\">Cần bán gấp </span><span style=\"color: rgb(255, 0, 0);\">100ha đất làm du lịch, nghỉ dưỡng sinh thái</span><span style=\"color: rgb(0, 0, 128);\">, View đồi cao nhìn về phía Hà Nội cực đẹp, được ví như là Tam Đảo 2 của Việt Nam. Nơi đây hội tụ đầy đủ các yếu tố để làm du lịch sinh thái, nghỉ dưỡng như suối lớn có thể ngăn làm Hồ, địa hình thoải sườn đồi, xung quanh là các cánh rừng, đứng trên đỉnh có thể quan sát được tòa </span><span style=\"color: rgb(255, 0, 0);\">KengNam</span><span style=\"color: rgb(0, 0, 128);\">, co rất nhiều </span><span style=\"color: rgb(255, 0, 0);\">Câu Lạc Bộ nhảy Dù về thực hành Bay.</span><span style=\"color: rgb(0, 0, 128);\"> không khí trong lành, yên tĩnh , bảo đảm nhà đầu tư nào lên cũng phải mê...</span></span></div><div class=\"pm-content\" style=\"font-family: Tahoma; font-size: 13px; margin: 0px; padding: 0px; background-color: rgb(255, 255, 255);\"><div class=\"pm-desc\" style=\"font-size: 14px; margin: 0px; padding: 0px; line-height: 25.2px;\"><span style=\"font-weight: bold;\"><span style=\"color: rgb(255, 0, 0);\">+&nbsp;</span><span style=\"color: rgb(0, 0, 128);\">Là lô đất duy nhất rộng, đẹp, rẻ cách Hà Nội không xa chỉ tầm 50km, cách TT Xuân Mai khoảng 10km, đường HCM tầm 5km, đường bê tông to rộng, ô tô lên tận nơi...</span></span></div><div class=\"pm-desc\" style=\"font-size: 14px; margin: 0px; padding: 0px; line-height: 25.2px;\"><span style=\"font-weight: bold;\"><span style=\"color: rgb(255, 0, 0);\">+&nbsp;</span><span style=\"color: rgb(0, 0, 128);\"> Đang cần bán gấp nên giá bán quá rẻ... Nhanh tay số lượng có hạn.</span><br style=\"line-height: 25.2px;\"><span style=\"color: rgb(0, 0, 128);\">Để biết thêm chi tiết LH&nbsp; Đăng&nbsp; Hiển&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; </span><span style=\"color: rgb(255, 0, 0);\">&nbsp;0332363839&nbsp; (0896.035.789).</span><br style=\"line-height: 25.2px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(0, 0, 128);\"> Hoặc quý khách hàng có thể tra trên google bằng SĐT 0962.792.687 để biết thêm thông tin nhiều lô khác nữa.</span></span></div><div class=\"pm-desc\" style=\"font-size: 14px; margin: 0px; padding: 0px; line-height: 25.2px;\"><br></div></div>', '1', '1000000', '40000000000', '28', '98', '103', '', null, null, 'danghien', '1573837200', '1574239496', '5', '0', '0', '1', '1');
INSERT INTO `tbl_contents` VALUES ('69', '68', 'Bán đất ba vì hà nội 5.1ha có 5000m2 đất nhà ở,làm nghỉ dưỡng,homstay view hồ,mặt nước rộng mênh mông0332.36.38.39', 'ban-dat-ba-vi-ha-noi-51ha-co-5000m2-dat-nha-olam-nghi-duonghomstay-view-homat-nuoc-rong-menh-mong0332363839', '', '[]', null, 'Chính chủ Gửi bán lô đất 5.1ha làm Du Lịch Sinh Thái, Nghỉ Dưỡng, Phân lô, bán nền thì  quá đỉnh, không thể tìm được lô thứ hai như vậy, địa hình bằng phẳng, diện tích đất Nhà ở Nhiều nên quý khách hàng có thể xây dựng được ngay, Giao thông thuận tiện Cách Hà Nội  tầm 55km.', '<div class=\"pm-title\" style=\"font-family: tahoma; font-size: 14px; margin: 0px 0px 10px; padding: 0px 0px 10px; font-weight: bold; border: 0px; background-color: rgb(255, 255, 255);\"><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"font-size: 14px;\"><span style=\"color: rgb(255, 0, 0);\">+&nbsp;</span><span style=\"color: rgb(5, 86, 153);\"> Thông tin mới nhất, chính xác nhất về lô </span><span style=\"color: rgb(255, 0, 0);\">5.1ha đất thổ cư, có 5000m2 đất nhà ở </span><span style=\"color: rgb(5, 86, 153);\">còn lại là đất trồng cây lâu năm, tại Hồ suối Hai Ba Vì Hà Nội.</span></span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> Là lô đất có một không hai trong khu vực, có đầy đủ các yếu tố làm </span><span style=\"color: rgb(255, 0, 0);\">khu du lịch sinh thái, nghỉ dưỡng, homestay, phân lô bán nền</span><span style=\"color: rgb(5, 86, 153);\">, diện tích đất xây dựng lớn và địa hình tương đối bằng phẳng có thể xây dựng được ngay mà không cần san lấp, đất bám hồ tầm vài trăm m.</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> Giao thông thuận tiện, </span><span style=\"color: rgb(255, 0, 0);\">Cách Hà Nội khoảng 55km</span><span style=\"color: rgb(5, 86, 153);\">. mất khoảng</span><span style=\"color: rgb(255, 0, 0);\"> 45 phút lái xe</span><span style=\"color: rgb(5, 86, 153);\">.</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\">ĐC&nbsp; &nbsp; &nbsp;:&nbsp; &nbsp; &nbsp; </span><span style=\"color: rgb(255, 0, 0);\">Hồ Suối Hai, xã Cẩm Lĩnh , Ba Vì. Hà Nộ</span><span style=\"color: rgb(5, 86, 153);\">i</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> Giá bán:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; </span><span style=\"color: rgb(255, 0, 0);\">&nbsp; 600k/m2</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> Quý khách vui lòng LH </span><span style=\"color: rgb(255, 0, 0);\">Đăng Hiển 0332.36.38.39 (0896.035.789)</span><span style=\"color: rgb(5, 86, 153);\"> để được xem đất và gặp chủ.</span></h1><h1 itemprop=\"name\" style=\"color: rgb(5, 86, 153); font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><br></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> Thủ tục sang nhượng nhanh gọn, đúng quy định của pháp luật.</span></h1></div>', '1', '51000', '30000000000', '1', '83', '131', '', null, null, 'danghien', '1574269200', '1574290443', '2', '0', '0', '1', '1');
INSERT INTO `tbl_contents` VALUES ('70', '68', 'Bán đất chương mỹ hà nội 1182m2 có 100m2 đất nhà ở,view hồ thoáng mát,giao thông thuận tiên 0332363839', 'ban-dat-chuong-my-ha-noi-1182m2-co-100m2-dat-nha-oview-ho-thoang-matgiao-thong-thuan-tien-0332363839', '', '[]', null, 'Là lô duy nhất bám Hồ tại xã Thủy Xuân Tiên, Chương Mỹ, Hà Nội. địa hình bằng phẳng,dân cư đông đúc đời sống dân trí cao, giao thông thuận tiện, giá hạt rẻ  nhanh tay số lượng có hạn...', '<div class=\"pm-title\" style=\"font-family: tahoma; font-size: 14px; margin: 0px 0px 10px; padding: 0px 0px 10px; font-weight: bold; border: 0px; background-color: rgb(255, 255, 255);\"><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"font-size: 14px;\"><span style=\"color: rgb(5, 86, 153);\">- Cần Bán </span><span style=\"color: rgb(255, 0, 0);\">1182m2 trong đó có 100m đất nhà ở</span><span style=\"color: rgb(5, 86, 153);\"> còn lại là đát trồng cây lâu năm, vieư hồ cực thoáng mát,giao thông thuận tiện.</span></span></h1><h1 itemprop=\"name\" style=\"color: rgb(5, 86, 153); font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\">- Đất thuộc Hà Nội dân cư đông đuc, đời sống dân trí cao, an ninh bảo đảm...</h1><h1 itemprop=\"name\" style=\"color: rgb(5, 86, 153); font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\">- Là lô đất có một không hai trong khu vực, địa hình tương đối bằng phẳng có thể xây dựng được ngay mà không cần san lấp, đất bám hồ tầm 50 m,</h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(5, 86, 153);\">- Giao thông thuận tiện, </span><span style=\"color: rgb(255, 0, 0);\">Cách TT TP.Hà Nội khoảng 30km. mất khoảng 45 phút lái xe.</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(5, 86, 153);\">- ĐC&nbsp; &nbsp; :&nbsp; </span><span style=\"color: rgb(255, 0, 0);\">xã Thủy Xuân Tiên, Chương Mỹ, Hà Nội</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(5, 86, 153);\">- Giá bán:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span><span style=\"color: rgb(255, 0, 0);\"> 1 tỷ</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(5, 86, 153);\">- Quý khách vui lòng LH&nbsp; &nbsp; </span><span style=\"color: rgb(255, 0, 0);\">Đăng Hiển&nbsp; &nbsp; 0332363839&nbsp; &nbsp; (0896.035.789)</span><span style=\"color: rgb(5, 86, 153);\">&nbsp; &nbsp;để được xem đất và gặp chủ.</span></h1><h1 itemprop=\"name\" style=\"color: rgb(5, 86, 153); font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\">- Thủ tục sang nhượng nhanh gọn, đúng quy định của pháp luật.</h1></div>', '1', '1182', '1000000000', '1', '89', '112', '', null, null, 'danghien', '1574355600', null, '3', '0', '0', '1', '1');
INSERT INTO `tbl_contents` VALUES ('71', '68', 'Bán đất lương sơn hoa bình 3300m2 MĐ liên xã30m,xe công vào,điện nước đầy đủ,cách QL6 600m  0332363839', 'ban-dat-luong-son-hoa-binh-3300m2-md-lien-xa30mxe-cong-vaodien-nuoc-day-ducach-ql6-600m-0332363839', '', '[]', null, 'Chính chủ gửi bán 3300m2 đất thổ cư đa tác dụng có thể làm Biệt thự nhà vườn, khu nghỉ dưỡng cuối tuần, hoặc làm cty, kho xưởng, xây phòng trọ đều được. Gía hợp lý          nhanh tay số lượng có hạn', '<div class=\"pm-title\" style=\"font-family: tahoma; font-size: 14px; margin: 0px 0px 10px; padding: 0px 0px 10px; font-weight: bold; border: 0px; background-color: rgb(255, 255, 255);\"><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"font-size: 14px;\"><span style=\"color: rgb(5, 86, 153);\">- </span><span style=\"color: rgb(255, 0, 0);\">Chính chủ</span><span style=\"color: rgb(5, 86, 153);\"> gửi bán lô đất thổ cư với Diện tích</span><span style=\"color: rgb(255, 0, 0);\"> 3300m2 trong đó có 400m đất nhà ở</span><span style=\"color: rgb(5, 86, 153);\">, còn lại là đất trồng cây lâu năm.</span></span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(5, 86, 153);\">- Địa hình bằng phẳng, nền đất chắc chắn, </span><span style=\"color: rgb(255, 0, 0);\">bám đường Liên xã tầm 30m</span><span style=\"color: rgb(5, 86, 153);\">, đường to rộng </span><span style=\"color: rgb(255, 0, 0);\">xe công</span><span style=\"color: rgb(5, 86, 153);\"> vào thoải mái.</span></h1><h1 itemprop=\"name\" style=\"color: rgb(5, 86, 153); font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\">- Phù hợp làm trang trại, nhà vườn, khu nghỉ dưỡng, homestay, hoặc làm công ty kho xưởng, xây phòng trọ.</h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(5, 86, 153);\">- Giao thông thuận tiện cách</span><span style=\"color: rgb(255, 0, 0);\"> KCN Lương Sơn tầm 400m, đường QL6 tầm 600m</span><span style=\"color: rgb(5, 86, 153);\">, Hà Nội khoảng </span><span style=\"color: rgb(255, 0, 0);\">32km.</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(5, 86, 153);\">- Địa chỉ:</span><span style=\"color: rgb(255, 0, 0);\"> Xã Hòa Sơn, H. Lương Sơn, Hòa Bình</span><span style=\"color: rgb(5, 86, 153);\">.</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(5, 86, 153);\">- Qúy khách hàng quan tâm xin vui lòng LH </span><span style=\"color: rgb(255, 0, 0);\">Đăng Hiển 0332363839&nbsp; (0896.035.789)</span><span style=\"color: rgb(5, 86, 153);\"> để được xem đất và gặp chủ.hoặc quý anh chị có thể tra goolge bằng sđt 0962792687 để biết thêm thông tin nhiều lô khác.</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(0, 0, 128);\">- Thủ tục sang nhượng nhanh chóng chính xác đúng quy định của pháp luật.</span></h1></div>', '1', '3300', '3800000000', '28', '98', '94', '', null, null, 'danghien', '1574442000', null, '1', '0', '0', '0', '1');
INSERT INTO `tbl_contents` VALUES ('72', '68', 'Bán đất lương sơn hòa bình 2100m2 đất ở 400m2 mặt đường bê tông,khuôn viên hoàn thiện sẵn ở 0332363839', 'ban-dat-luong-son-hoa-binh-2100m2-dat-o-400m2-mat-duong-be-tongkhuon-vien-hoan-thien-san-o-0332363839', '', '[]', null, 'Khuôn viên hoàn thiện giá rẻ, giao thông thuận tiện cách Hà Nội chỉ 45p Lái xe, không khí trong lành sạch sẽ khu vực xung quanh có rất nhiều Đại gia Hà Nội về xây dựng Biệt phủ khu nghỉ dưỡng cuối tần,resot ,homestay, nông traị sạch...', '<div class=\"pm-title\" style=\"margin: 0px 0px 10px; padding: 0px 0px 10px; border: 0px; background-color: rgb(255, 255, 255);\"><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; font-weight: bold; margin: 0px; padding: 0px;\"><span style=\"font-size: 14px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> Cần bán </span><span style=\"color: rgb(255, 0, 0);\">2100m2 đất ở 400m2,</span><span style=\"color: rgb(5, 86, 153);\">còn lại la đất trồng cây lâu năm, thế đất bằng phẳng,nền đất chắc chắn, đã có tường bao quanh, trong vườn đã trồng nhiều loại cây ăn quả cây bóng mát có giá trị kinh tế cao, đang cho thu hoạch,có nhà có khuôn viên cơ bản đã hoàn thiện quý khách hàng chỉ sẵn ở.</span></span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; font-weight: bold; margin: 0px; padding: 0px;\"><span style=\"color: rgb(5, 86, 153);\">- không khí trong lành sạch sẽ, an ninh bảo đảm, đời sống dân trí cao, trong khu vuawcj có nhiều Đại gia Hà Nội về xây Biệt Phủ, trang trại nhà vườn khu nghỉ dưỡng cuối tuần </span><span style=\"color: rgb(255, 0, 0);\">( Làng Hà Nội )</span><span style=\"color: rgb(5, 86, 153);\">Thuận tiện giao thông </span><span style=\"color: rgb(255, 0, 0);\">mặt đường bê tông tầm 25m</span><span style=\"color: rgb(5, 86, 153);\"> rất đẹp.</span></h1><h1 itemprop=\"name\" style=\"margin: 0px; padding: 0px;\"><span style=\"font-family: Tahoma; font-size: 16px; font-weight: bold; color: rgb(5, 86, 153);\">- Cách đương QL6 tầm&nbsp;</span><span style=\"font-size: 16px; font-family: Tahoma; color: rgb(5, 86, 153);\">1</span><span style=\"font-weight: bold;\"><span style=\"font-size: 16px; font-family: Tahoma;\">km</span><span style=\"font-family: Tahoma; font-size: 16px; color: rgb(5, 86, 153);\">, Hà Nội khoảng </span></span><span style=\"font-family: Tahoma; font-size: 16px; color: rgb(5, 86, 153);\">&nbsp;3</span><span style=\"font-size: 12pt;\">1<span style=\"font-family: Tahoma; font-size: 12pt;\">km</span>chỉ với</span> <span style=\"font-family: Tahoma; font-size: 16px; color: rgb(255, 0, 0);\">45p chạy xe là tớ</span><span style=\"font-family: Tahoma; font-size: 16px; color: rgb(5, 86, 153);\">i.</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; font-weight: bold; margin: 0px; padding: 0px;\"><span style=\"color: rgb(5, 86, 153);\">- Qúy khách hàng quan tâm xin vui lòng LH </span><span style=\"color: rgb(255, 0, 0);\">Đăng Hiển&nbsp; 0332.36.38.39 (0896.035.789) </span><span style=\"color: rgb(5, 86, 153);\">để được xem đất và gặp chủ.</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; font-weight: bold; color: rgb(5, 86, 153); margin: 0px; padding: 0px;\"><br></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; font-weight: bold; color: rgb(5, 86, 153); margin: 0px; padding: 0px;\">- Thủ tục sang nhượng nhanh chóng chính xác đúng quy định của pháp luật.</h1></div>', '1', '2100', '2500000000', '28', '98', '94', '', null, null, 'danghien', '1574442000', '1574464632', '3', '0', '0', '1', '1');
INSERT INTO `tbl_contents` VALUES ('73', '71', 'Bán đất Lương Sơn Hòa Bình1800m2,2 sỏ đỏ trong dự án tophill Cư Yên, có400m đất ở giá rẻ 0332.36.38.39', 'ban-dat-luong-son-hoa-binh1800m22-so-do-trong-du-an-tophill-cu-yen-co400m-dat-o-gia-re-0332363839', '', '[]', null, 'chính chủ gửi bán lô đất 1800m2 có 400m đất nhà ở,là lô góc của một dự án nghỉ dưỡng, view cao thoáng mát,tầm nhìn xa trông rộng, bên cạnh là Hồ có diện tích hơn 10ha, trong vùng có nhiều Đại Gia Hà Nội về xây biệt phủ,cách Hà Nội tầm 36km.', '<div class=\"pm-title\" style=\"font-family: tahoma; font-size: 14px; margin: 0px 0px 10px; padding: 0px 0px 10px; font-weight: bold; border: 0px; background-color: rgb(255, 255, 255);\"><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"font-size: 14px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> Do cần tiền đầu tư gia đình muốn chuyển nhượng </span><span style=\"color: rgb(255, 0, 0);\">1800m2 đất thổ cư 2 sổ đỏ, mỗi sổ là 200m đất nhà ở còn lại là đất trồng cây lâu năm.</span></span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> Lô đất thuộc lô góc của dự án, có view cao thoáng mát,tầm nhìn xa,phía trước mặt là khe núi và suối nên tầm nhìn khồn bị ai che chắn.</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> địa hình phẳng có, thoải có, toàn bộ các lô đất trong dự án đã bán hết, hiện tại các đại gia Hà Nội đang tiếp tục về xây dựng, nhà ở khu nghỉ dưỡng...bên cạnh lô đất là Hồ thủy lợi có diện tích cả trục ha.</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> Không khí trong lành sạch sẽ, an ninh bảo đảm, trong khu vực có nhiều nhà Hà Nội về xây dựng biệt phủ (Làng Hà Nội) và các khu resort nghỉ dưỡng, du lịch sinh thái như Vịt Cổ Xanh, Beverly Hill, Bô Cagadern... Nằm trong vùng </span><span style=\"color: rgb(255, 0, 0);\">quy hoạch vành đai xanh </span><span style=\"color: rgb(5, 86, 153);\">của huyện nên không sợ bởi sự chen lấn chuồng trại, công ty, xí nghiệp...</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> Giao thông thuận tiện, đường bê tông to rộng </span><span style=\"color: rgb(255, 0, 0);\">xe 45 chỗ</span><span style=\"color: rgb(5, 86, 153);\"> vào thoải mái. Cách đường </span><span style=\"color: rgb(255, 0, 0);\">QL 6 tầm 6km, </span><span style=\"color: rgb(0, 0, 128);\">Hà Nội khoảng </span><span style=\"color: rgb(255, 0, 0);\">45km</span><span style=\"color: rgb(5, 86, 153);\">, thời gian sẽ được rút ngắn nữa</span><span style=\"color: rgb(255, 0, 0);\"> khi đường 6 được mở rộng</span><span style=\"color: rgb(5, 86, 153);\">.</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> Giá bán:&nbsp; &nbsp; &nbsp;&nbsp;</span><span style=\"color: rgb(255, 0, 0);\">1 tỷ </span><span style=\"color: rgb(5, 86, 153);\">đang cần bán gấp để giải quyết công việc.</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> Quý khách vui lòng LH </span><span style=\"color: rgb(255, 0, 0);\">Đăng Hiển 0332.36.38.39 (0896.035.789)</span><span style=\"color: rgb(5, 86, 153);\"> để được xem đất, và gặp chủ.</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\">Ngoài ra các bác có thể tra sđt 0962792687 trên goolge để biết thêm nhiều thông tin, nhiều lô khác nữa.</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> Thủ tục sang nhượng nhanh gọn, đúng quy định của pháp luật.</span></h1><div><span style=\"color: rgb(5, 86, 153);\"><br></span></div><div><span style=\"color: rgb(5, 86, 153);\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<iframe width=\"560\" height=\"320\" src=\"https://www.youtube.com/embed/3DK9oxMk9UQ\" frameborder=\"0\" allowfullscreen=\"\"></iframe></span></div></div>', '1', '1800', '1000000000', '28', '98', '97', '', null, null, 'danghien', '1574701200', '1574723481', '2', '0', '0', '1', '1');
INSERT INTO `tbl_contents` VALUES ('74', '71', 'Bán đất Lương Sơn Hòa Bình 1.3ha thổ cư có 400m đất nhà ở giá rẻ 0332.36.38.39', 'ban-dat-luong-son-hoa-binh-13ha-tho-cu-co-400m-dat-nha-o-gia-re-0332363839', '', '[]', null, 'Chính chủ nhờ bán 1.3ha nằm trong một thung lũng,có nhà cấp 4 chỉ sẵn ở, hệ thồng Vườn, Ao, chuồng đầy đủ,view cao thoáng mát,lưng tụa núi chân đạp thủy, không khí trong lành yên tĩnh,rất phù hợp làm Biệt thự nhà vườn,nghỉ dưỡng,nông trại sạch.', '<div class=\"pm-title\" style=\"font-family: tahoma; font-size: 14px; margin: 0px 0px 10px; padding: 0px 0px 10px; font-weight: bold; border: 0px; background-color: rgb(255, 255, 255);\"><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"font-size: 14px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> Do cần tiền đầu tư gia đình muốn chuyển nhượng </span><span style=\"color: rgb(255, 0, 0);\">13000m2 đất thổ cư có 400m đất nhà ở</span><span style=\"color: rgb(5, 86, 153);\"> còn lại là đất trồng cây lâu năm,và hơn 3000 đất RSX.</span></span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(5, 86, 153);\">- Nằm trong một</span><span style=\"color: rgb(255, 0, 0);\"> thung lũng của Thị Trấn Lương sơn</span><span style=\"color: rgb(5, 86, 153);\">, có view cao thoáng mát, đứng trên nhà có thể trông thấy cá bơi lội tung tăng dưới Ao,một mình một khu vực, có thể mua để mở rộng thêm.</span></h1><h1 itemprop=\"name\" style=\"color: rgb(5, 86, 153); font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\">- Không khí trong lành sạch sẽ, an ninh bảo đảm, trong khu vực có nhiều nhà Hà Nội về xây dựng biệt phủ,là đất thuộc thị trấn củ huyện nên không sợ bởi sự chen lấn chuồng trại, công ty, xí nghiệp...</h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(5, 86, 153);\">- Giao thông thuận tiện, đường bê tông to rộng </span><span style=\"color: rgb(255, 0, 0);\">xe 29 chỗ&nbsp;</span><span style=\"color: rgb(5, 86, 153);\"> vào thoải mái. Cách đường </span><span style=\"color: rgb(255, 0, 0);\">QL 6 tầm 2km, Hà Nội khoảng 32km</span><span style=\"color: rgb(5, 86, 153);\">, thời gian sẽ được rút ngắn nữa khi </span><span style=\"color: rgb(255, 0, 0);\">đường 6</span><span style=\"color: rgb(5, 86, 153);\"> được mở rộng.</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(5, 86, 153);\">- Giá bán:&nbsp; &nbsp; &nbsp; &nbsp;</span><span style=\"color: rgb(255, 0, 0);\">2 tỷ </span><span style=\"color: rgb(5, 86, 153);\">đang cần bán gấp để giải quyết công việc.</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(5, 86, 153);\">- Quý khách vui lòng LH </span><span style=\"color: rgb(255, 0, 0);\">Đăng Hiển 0332.36.38.39 (0896.035.789)</span><span style=\"color: rgb(5, 86, 153);\"> để được xem đất, và gặp chủ.</span></h1><h1 itemprop=\"name\" style=\"color: rgb(5, 86, 153); font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\">- Ngoài ra các bác có thể tra sđt 0962792687 trên goolge để biết thêm nhiều thông tin, nhiều lô khác nữa.</h1><h1 itemprop=\"name\" style=\"color: rgb(5, 86, 153); font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\">- Thủ tục sang nhượng nhanh gọn, đúng quy định của&nbsp; &nbsp;pháp luật.</h1><div><br></div><div><br></div><div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<iframe width=\"560\" height=\"320\" src=\"https://www.youtube.com/embed/7W-sFYHD-Tc\" frameborder=\"0\" allowfullscreen=\"\"></iframe></div></div>', '1', '13000', '2000000000', '28', '98', '95', '', null, null, 'danghien', '1574701200', '1574806335', '2', '0', '0', '1', '1');
INSERT INTO `tbl_contents` VALUES ('75', '70', 'Bán đất Kỳ Sơn Hòa Bình 7420m2 có 6000m đất nhà ở,xe 45 chỗ vào,giá rẻ,cách QL6 1.5km 0332.36.38.39', 'ban-dat-ky-son-hoa-binh-7420m2-co-6000m-dat-nha-oxe-45-cho-vaogia-recach-ql6-15km-0332363839', '', '[]', null, 'Diện tích đất nhà ở lớn gần 6000m2, thế đất thoải sườn đồi, view cao thoáng mát, đường bê tông vào tận nơi,có ao, tường bao vây xung quanh, đường to rộng xe 45 chỗ vào tận nơi,cách QL6 tầm 1.5km, Hà Nội khoảng 55km,', '<div class=\"pm-title\" style=\"font-family: tahoma; font-size: 14px; margin: 0px 0px 10px; padding: 0px 0px 10px; font-weight: bold; border: 0px; background-color: rgb(255, 255, 255);\"><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"font-size: 14px;\"><span style=\"color: rgb(5, 86, 153);\">+ Cần bán gấp </span><span style=\"color: rgb(255, 0, 0);\">74200m2 đất thổ cư có 5945m đất nhà ở</span><span style=\"color: rgb(5, 86, 153);\"> còn lại là đất trồng cây lâu năm để làm biệt thự nhà vườn,khu nghỉ dưỡng nghỉ dưỡng, homestay,phân lô bán nền... Trên đất có nhiều cây ăn quả cây bóng mát tươi tốt sum xuê.</span></span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> Thế đất thoải sườn đồi, </span><span style=\"color: rgb(255, 0, 0);\">view cao thoáng mát,tầm nhìn xa trông rộng</span><span style=\"color: rgb(5, 86, 153);\">, đường bê tông vào tận nơi, nửa tường rào đã xây tường bao</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> Không khí trong lành, mát mẻ, đời sống dân trí cao, an ninh bảo đảm, rất phù hợp để làm homstay,phân lô bán nền, trang trại, khu nghỉ dưỡng, trang trại nuôi trồng thực phẩm sạch...</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> Giao thông thuận tiện, </span><span style=\"color: rgb(255, 0, 0);\">xe ô tô 45 chỗ vào tận nơi</span><span style=\"color: rgb(5, 86, 153);\">, cách đường cách đường </span><span style=\"color: rgb(255, 0, 0);\">QL6 tầm 1.5km, Hà Nội tầm 55km</span><span style=\"color: rgb(5, 86, 153);\">, trong vùng đã có nhiều đại gia Hà thành về mua đất làm trang trại, xây biệt phủ, kinh doanh homestay...</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> Địa chỉ: </span><span style=\"color: rgb(255, 0, 0);\">xã Mông Hóa,Kỳ Sơn, Hòa Bình</span><span style=\"color: rgb(5, 86, 153);\">.</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> Để biết thêm chi tiết xin vui lòng LH </span><span style=\"color: rgb(255, 0, 0);\">Đăng Hiển 0332363839 (0896. 035.789) </span><span style=\"color: rgb(5, 86, 153);\">để được xem đất và gặp chủ.</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> Qúy khách có thể tra goolge bằng sđt 0962792687 để biết thêm thông tin nhiều lô khác nữa.</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\">Thủ tục pháp lý nhanh gọn đúng quy định của pháp luật.</span></h1><div><span style=\"color: rgb(5, 86, 153);\"><br></span></div><div><span style=\"color: rgb(5, 86, 153);\"><br></span></div><div><span style=\"color: rgb(5, 86, 153);\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<iframe width=\"560\" height=\"320\" src=\"https://www.youtube.com/embed/CQJOO6CsuHY\" frameborder=\"0\" allowfullscreen=\"\"></iframe></span></div></div>', '1', '7420', '3800000000', '28', '97', '129', '', null, null, 'danghien', '1574787600', '1574806489', '2', '0', '0', '1', '1');
INSERT INTO `tbl_contents` VALUES ('76', '68', 'Bán đất Kỳ Sơn Hòa Bình 2.2ha co 400m ở,làm BT nhà vườn,công ty,mặt QL6 15m,cách Hà Nội 50km 0332.36.38.39.', 'ban-dat-ky-son-hoa-binh-22ha-co-400m-olam-bt-nha-vuoncong-tymat-ql6-15mcach-ha-noi-50km-0332363839', '', '[]', null, 'Trục chính  QL6 còn một lô duy nhất 22.000m2  đa tác dụng,có thể làm Biệt thự Nhà Vườn, cty, kho xưởng, tương đối bằng phẳng,có suối chảy qua đất,mặt đường QL6 15m, giá rẻ Cách Hà Nội tầm 50km.', '<div class=\"pm-title\" style=\"font-family: tahoma; font-size: 14px; margin: 0px 0px 10px; padding: 0px 0px 10px; font-weight: bold; border: 0px; background-color: rgb(255, 255, 255);\"><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"font-size: 14px;\"><span style=\"color: rgb(255, 0, 0);\">+ </span><span style=\"color: rgb(5, 86, 153);\">Cần bán gấp</span><span style=\"color: rgb(255, 0, 0);\"> 2.2ha trong đó có 400m2 đất nhà ở, 1200m đất vườn </span><span style=\"color: rgb(5, 86, 153);\">còn lại là đất Rừng sản xuất ( chuyển đổi sang đất vườn được) để làm trang trại, nghỉ dưỡng, biệt thự nhà vườn, </span><span style=\"color: rgb(255, 0, 0);\">homestay, công ty nhà máy </span><span style=\"color: rgb(5, 86, 153);\">xí nghiệp, kho xưởng đều được... Trên đất có nhiều cây ăn quả, cây bóng mát lâu năm.</span></span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> Thế đất thoải sườn đồi, view cao thoáng mát, đất bám mặt </span><span style=\"color: rgb(255, 0, 0);\">đường QL6 15m</span><span style=\"color: rgb(5, 86, 153);\">,trong đất có một dòng </span><span style=\"color: rgb(255, 0, 0);\">suối</span><span style=\"color: rgb(5, 86, 153);\"> chảy qua,rất phong thủy,có thể ngăn suối </span><span style=\"color: rgb(255, 0, 0);\">làm Ao</span><span style=\"color: rgb(5, 86, 153);\"> (trước đây chủ nhà đã có ý định nuôi Ba Ba)</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> Không khí trong lành, mát mẻ, đời sống dân trí cao, an ninh bảo đảm, rất phù hợp để làm trang trại, nghỉ dưỡng, homestay, trang trại nuôi trồng thực phẩm sạch, công ty kho xưởng, nhà máy xí nghiệp..</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> Giao thông thuận tiện, xe công vào tận thoải mái, cách</span><span style=\"color: rgb(255, 0, 0);\"> Hà Nội tầm 50km</span><span style=\"color: rgb(5, 86, 153);\">, trong vùng đã có nhiều đại gia Hà thành về mua đất làm trang trại, xây biệt phủ, kinh doanh homestay...</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+&nbsp;</span><span style=\"color: rgb(5, 86, 153);\">Địa chỉ: </span><span style=\"color: rgb(255, 0, 0);\">Dân Hạ,Kỳ Sơn, Hòa Bình.</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> Để biết thêm chi tiết xin vui lòng LH </span><span style=\"color: rgb(255, 0, 0);\">Đăng Hiển&nbsp; 0332.36.38.39, (0896. 035.789)</span><span style=\"color: rgb(5, 86, 153);\"> để được xem đất và gặp chủ.</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> Thủ tục pháp lý nhanh gọn đúng quy định của pháp luật.</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> Qúy khách hàng có thể tra Goolge bằng sđt</span><span style=\"color: rgb(255, 0, 0);\"> 0962.792.687</span><span style=\"color: rgb(5, 86, 153);\"> để biết thông tin nhiều lô khác nữa.</span></h1></div>', '1', '22000', '3200000000', '28', '97', '129', '', null, null, 'danghien', '1574874000', null, '4', '0', '0', '1', '1');
INSERT INTO `tbl_contents` VALUES ('77', '68', 'Bán đất Lương Sơn Hòa Bình 6000m2,view cao,đường bê tông,xe 45 chỗ vào,cách QL6 3Km,Hà Nội 36Km 0332.36.38.39', 'ban-dat-luong-son-hoa-binh-6000m2view-caoduong-be-tongxe-45-cho-vaocach-ql6-3kmha-noi-36km-0332363839', '', '[]', null, 'khu đất là cả một mỏm đồi hình bát úp,view cực đẹp và thoáng mát,tầm nhìn ra tận Hà Nội, có thể đào ao thả cá , đường bê tông lên tận nơi,xe 45 chỗ vào được,lô này chỉ cần đầu tư 300tr để xây nhà và cải tạo sẽ trở thành khu nghỉ dưỡng quá tuyệt vời..', '<div class=\"kqchitiet\" style=\"font-family: Tahoma; font-size: 12px; margin: 0px 0px 10px; padding: 0px; position: relative; line-height: 22px; background-color: rgb(255, 255, 255);\"><h1 itemprop=\"name\" style=\"font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"font-size: 14px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> Cần bán </span><span style=\"color: rgb(255, 0, 0);\">6000m2 đất trồng cây lâu năm</span><span style=\"color: rgb(5, 86, 153);\">, nếu có khách mua chủ sẽ làm ra sổ đỏ </span><span style=\"color: rgb(255, 0, 0);\">có 200m đất thổ cư</span><span style=\"color: rgb(5, 86, 153);\">, còn lại là đất vườn.</span></span></h1><h1 itemprop=\"name\" style=\"font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(5, 86, 153);\">- Thế đất thoải hình bát úp,lô đất là cả một mỏm đồi,view cao thoáng mát,đứng trên đất có thể nhìn ra khu vực xung quanh, nhìn ra Hà Nội... mặt đường bê tông xóm tầm</span><span style=\"color: rgb(255, 0, 0);\"> 45m</span><span style=\"color: rgb(5, 86, 153);\">, đường to rộng </span><span style=\"color: rgb(255, 0, 0);\">xe 45 chỗ vào thoải mái.</span><span style=\"color: rgb(5, 86, 153);\"> Trong khu vực có nhiều Dại Gia Hà Nội về xây Biệt phủ, cả một tòa lâu đài, cũng như khách sạn gần trục tầng...</span></h1><h1 itemprop=\"name\" style=\"font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+&nbsp;</span><span style=\"color: rgb(5, 86, 153);\">Cách đường QL6 </span><span style=\"color: rgb(255, 0, 0);\">&nbsp;tầm 3km</span><span style=\"color: rgb(5, 86, 153);\">, trung tâm </span><span style=\"color: rgb(255, 0, 0);\">TP Hà Nội hơn 30km</span><span style=\"color: rgb(5, 86, 153);\">.</span></h1><h1 itemprop=\"name\" style=\"font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> Giá bán&nbsp; &nbsp; &nbsp; &nbsp;</span><span style=\"color: rgb(255, 0, 0);\">3.2 tỷ.</span></h1><h1 itemprop=\"name\" style=\"font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+&nbsp;</span><span style=\"color: rgb(5, 86, 153);\">Địa chỉ:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; </span><span style=\"color: rgb(255, 0, 0);\">Hòa Sơn, Lương Sơn, Hòa Bình</span><span style=\"color: rgb(5, 86, 153);\">.</span></h1><h1 itemprop=\"name\" style=\"font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> Gia đình thật sự thiện chí bán, bán để được việc, bác nào có nhu cầu xin vui lòng LH Đăng&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</span></h1><h1 itemprop=\"name\" style=\"font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(5, 86, 153);\"><br></span></h1><h1 itemprop=\"name\" style=\"font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(5, 86, 153);\">&nbsp; &nbsp; &nbsp; &nbsp;<iframe width=\"560\" height=\"320\" src=\"https://www.youtube.com/embed/QSm-FUxl6ew\" frameborder=\"0\" allowfullscreen=\"\"></iframe>Hiển:</span><span style=\"color: rgb(255, 0, 0);\"> 0332.36.38.39&nbsp; &nbsp;, 0896.035.789.</span></h1><h1 itemprop=\"name\" style=\"font-size: 16px; margin: 0px; padding: 0px;\"><br></h1><h1 itemprop=\"name\" style=\"font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> Thủ tục sang nhượng nhanh gọn đúng quy định của pháp lu</span></h1><div><span style=\"color: rgb(5, 86, 153);\"><br></span></div><div><span style=\"color: rgb(5, 86, 153);\"><br></span></div></div>', '1', '6000', '3200000000', '28', '98', '94', '', null, null, 'danghien', '1574960400', '1574983071', '2', '0', '0', '1', '1');
INSERT INTO `tbl_contents` VALUES ('78', '68', 'Bán đất Lương Sơn Hòa Bình 1ha tầm nhìn xa,tiện giao thông,xe 45 chỗ vào được,cách HN 34Km 0332363839', 'ban-dat-luong-son-hoa-binh-1ha-tam-nhin-xatien-giao-thongxe-45-cho-vao-duoccach-hn-34km-0332363839', '', '[]', null, 'Chính chủ Gửi bán hơn 1ha thổ cư,Đất đẹp,giá rẻ,view cao thoáng mát,giao thông thuận tiện xe 45 chỗ vào được,đứng trên đất có thể quan sát ra khu vực Hà Nội và trục đường 6,cách QL6 tầm 3km,có nhiều Đại Gia Hà Nội về xây dựng biệt phủ và khu nghỉ dưỡng.', '<div class=\"kqchitiet\" style=\"font-family: Tahoma; font-size: 12px; margin: 0px 0px 10px; padding: 0px; position: relative; line-height: 22px; background-color: rgb(255, 255, 255);\"><h1 itemprop=\"name\" style=\"font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"font-size: 14px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\">&nbsp; Chính chủ gửi bán </span><span style=\"color: rgb(255, 0, 0);\">hơn 1ha</span><span style=\"color: rgb(5, 86, 153);\"> lưng chừng Đồi,</span><span style=\"color: rgb(255, 0, 0);\">có 400m đất nhà ở </span><span style=\"color: rgb(5, 86, 153);\">còn lại là đất trồng cây lâu năm, đất đã được phân tầng, và tạo mặt bằng chỉ việc xây dựng, cải tạo.Điện ngay cạnh, nước thì chỉ cần khoan cái là có,và hệ thống nước sạch của huyện đang triển kkhailắp đặt.</span></span></h1><h1 itemprop=\"name\" style=\"font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> View Cao thoáng,</span><span style=\"color: rgb(255, 0, 0);\">tầm nhìn xa trông rộng,không bị che chắn bởi nhà cửa,cây cối</span><span style=\"color: rgb(5, 86, 153);\">.hướng Đông, Đông Nam rất mát mẻ, đứng trên đất có thể quan sát được toàn bộ khu vực </span><span style=\"color: rgb(255, 0, 0);\">Hà Nội</span><span style=\"color: rgb(5, 86, 153);\">, trục đướng QL6.</span></h1><h1 itemprop=\"name\" style=\"font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> Không khí </span><span style=\"color: rgb(255, 0, 0);\">trong lành yên tĩnh, an ninh bảo đảm,</span><span style=\"color: rgb(5, 86, 153);\"> Trong khu vực có nhiều Đại gia Hà Nọi về xây dựng Biệt Phủ trang trại và khu nghỉ dưỡng cuối tuần.</span></h1><h1 itemprop=\"name\" style=\"font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> Giao thông thuận tiện, </span><span style=\"color: rgb(255, 0, 0);\">đường to rộng, xe 45 chỗ vào thoải mái</span><span style=\"color: rgb(5, 86, 153);\">. Cách đường </span><span style=\"color: rgb(255, 0, 0);\">QL6 tầm 3km, thành phố Hà Nội khoảng 34km.</span></h1><h1 itemprop=\"name\" style=\"font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> ĐC:&nbsp; &nbsp; &nbsp; </span><span style=\"color: rgb(255, 0, 0);\">&nbsp;Hòa Sơn, Lương Sơn, Hòa Bình.</span></h1><h1 itemprop=\"name\" style=\"font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> Gía Bán&nbsp; &nbsp; &nbsp;:&nbsp; &nbsp;</span><span style=\"color: rgb(255, 0, 0);\">3.6 tỷ</span></h1><h1 itemprop=\"name\" style=\"font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> Để biết thêm chi tiết LH </span><span style=\"color: rgb(255, 0, 0);\">Đăng Hiển</span><span style=\"color: rgb(5, 86, 153);\"> </span><span style=\"color: rgb(255, 0, 0);\">0332363839&nbsp; (0896. 035. 789)</span><span style=\"color: rgb(5, 86, 153);\">.để được xem đất và gặp chủ.</span></h1><h1 itemprop=\"name\" style=\"font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">- </span><span style=\"color: rgb(5, 86, 153);\">thủ tục sang nhượng nhanh gọn đúng quy định của pháp luật.</span></h1><div><span style=\"color: rgb(5, 86, 153);\"><br></span></div><div><span style=\"color: rgb(5, 86, 153);\">&nbsp; &nbsp; &nbsp;</span></div><div><span style=\"color: rgb(5, 86, 153);\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<iframe width=\"560\" height=\"320\" src=\"https://www.youtube.com/embed/MquyGKFS6BQ\" frameborder=\"0\" allowfullscreen=\"\"></iframe><br></span></div></div>', '1', '10000', '3600000000', '28', '98', '94', '', null, null, 'danghien', '1575046800', '1575068761', '1', '0', '0', '1', '1');
INSERT INTO `tbl_contents` VALUES ('79', '71', 'Bán đất lương sơn hòa bình1.3ha khuôn viên hoàn thiện,dáng sơn bóng thủy,bám Đường QL6 0332363839', 'ban-dat-luong-son-hoa-binh13ha-khuon-vien-hoan-thiendang-son-bong-thuybam-duong-ql6-0332363839', '', '[]', null, '1.3ha khuôn viên hoàn thiện ai vào cũng phải khen, thế đất bằng phẳng, Dáng Sơn bóng Thủy rất đẹp, sau lưng là dãy núi đá, trước mặt là hồ, nước trong xanh quanh năm,bám mặt QL6 tầm 50m,cách Hà Nội 35km,rất phù hợp để làm tổ hợp khu vui chơi giải trí phục vụ đại gia đến chơi gol.', '<div class=\"pm-title\" style=\"font-family: tahoma; font-size: 14px; margin: 0px 0px 10px; padding: 0px 0px 10px; font-weight: bold; border: 0px; background-color: rgb(255, 255, 255);\"><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"font-size: 14px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> Chính chủ gửi bán </span><span style=\"color: rgb(255, 0, 0);\">1.3ha nhà đất thổ cư, có 800m đất nhà ở</span><span style=\"color: rgb(5, 86, 153);\"> còn lại là đát trồng cây lâu năm,khuôn viên hoàn thiện đã xây dựng một căn Biệt thự mini,rất xinh xắn ...</span></span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> Thế đất bằng phẳng,nền đất chắc chắn, sau lưng là một dãy núi đá,trùng trùng điệp điệp, trước mặt là Hồ, nước trong xanh quanh năm (</span><span style=\"color: rgb(255, 0, 0);\"> Dáng Sơn bóng thủy </span><span style=\"color: rgb(5, 86, 153);\">), </span><span style=\"color: rgb(255, 0, 0);\">mặt đường QL6 tầm 50m</span><span style=\"color: rgb(5, 86, 153);\"> Không khí trong lành, sạch sẽ, là khu vực được quy hoạch vùng phát triển du lịch, dịch vụ. Nằm ngay phía trước của</span><span style=\"color: rgb(255, 0, 0);\"> cổng sân golf Phonex</span><span style=\"color: rgb(5, 86, 153);\">.</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> Rất phù hợp để làm tổ hợp khu vui chơi, giải trí phục vụ các</span><span style=\"color: rgb(255, 0, 0);\"> Đại Gia đến chơi GOL</span><span style=\"color: rgb(5, 86, 153);\"> , Biệt thự nhà vườn, khu nghỉ dưỡng cuối tuần...</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> Cách đường&nbsp;</span><span style=\"color: rgb(255, 0, 0);\">Hà Nội khoảng 35km,</span><span style=\"color: rgb(0, 0, 128);\"> mất khoảng 45p lái xe đi theo trục đươèng QL6.</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(0, 0, 128);\">+Quý khách hàng vui lòng LH </span><span style=\"color: rgb(255, 0, 0);\">Đăng Hiển cty BĐS Đất Việt 0332363839&nbsp; (0896.035.789)</span><span style=\"color: rgb(0, 0, 128);\"> để được xem đất và gặp chủ.</span></h1><h1 itemprop=\"name\" style=\"font-family: Tahoma; font-size: 16px; margin: 0px; padding: 0px;\"><span style=\"color: rgb(255, 0, 0);\">+</span><span style=\"color: rgb(5, 86, 153);\"> Thủ tục sang nhượng, nhanh gọn đúng quy ddingj của pháp luật</span></h1></div><div class=\"pm-middle-content\" style=\"font-family: Tahoma; font-size: 12px; margin: 10px 0px 0px; padding: 0px; width: 745px; background-color: rgb(255, 255, 255);\"><ul id=\"LeftMainContent__productDetail_ulTab\" class=\"detail-more-info\" style=\"margin: 0px; padding: 0px; background-color: rgb(31, 84, 150); width: 745px; border-top-left-radius: 5px; border-top-right-radius: 5px; height: 30px;\"><li id=\"liImg\" style=\"margin: 0px 0px 0px 5px; padding: 0px; float: left; list-style-type: none;\"></li></ul></div>', '1', '13000', '20000000000', '28', '98', '95', '', null, null, 'danghien', '1575046800', null, '2', '0', '0', '1', '1');

-- ----------------------------
-- Table structure for tbl_district
-- ----------------------------
DROP TABLE IF EXISTS `tbl_district`;
CREATE TABLE `tbl_district` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city_id` int(11) DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `order` int(11) DEFAULT '0',
  `isactive` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_district
-- ----------------------------
INSERT INTO `tbl_district` VALUES ('65', '1', 'Quận Ba Đình', '0', '1');
INSERT INTO `tbl_district` VALUES ('66', '1', 'Quận Ho&agrave;n Kiếm', '0', '1');
INSERT INTO `tbl_district` VALUES ('67', '1', 'Quận T&acirc;y Hồ', '0', '1');
INSERT INTO `tbl_district` VALUES ('68', '1', 'Quận Long Bi&ecirc;n', '0', '1');
INSERT INTO `tbl_district` VALUES ('69', '1', 'Quận Cầu Giấy', '0', '1');
INSERT INTO `tbl_district` VALUES ('70', '1', 'Quận Đống Đa', '0', '1');
INSERT INTO `tbl_district` VALUES ('71', '1', 'Quận Hai B&agrave; Trưng', '0', '1');
INSERT INTO `tbl_district` VALUES ('72', '1', 'Quận Ho&agrave;ng Mai', '0', '1');
INSERT INTO `tbl_district` VALUES ('73', '1', 'Quận Thanh Xu&acirc;n', '0', '1');
INSERT INTO `tbl_district` VALUES ('77', '1', 'Quận Nam Từ Li&ecirc;m', '0', '1');
INSERT INTO `tbl_district` VALUES ('79', '1', 'Quận Bắc Từ Li&ecirc;m', '0', '1');
INSERT INTO `tbl_district` VALUES ('81', '1', 'Quận H&agrave; Đ&ocirc;ng', '0', '1');
INSERT INTO `tbl_district` VALUES ('82', '1', 'Thị x&atilde; Sơn T&acirc;y', '0', '1');
INSERT INTO `tbl_district` VALUES ('83', '1', 'Huyện Ba V&igrave;', '0', '1');
INSERT INTO `tbl_district` VALUES ('87', '1', 'Huyện Quốc Oai', '0', '1');
INSERT INTO `tbl_district` VALUES ('88', '1', 'Huyện Thạch Thất', '0', '1');
INSERT INTO `tbl_district` VALUES ('89', '1', 'Huyện Chương Mỹ', '0', '1');
INSERT INTO `tbl_district` VALUES ('95', '28', 'Th&agrave;nh phố H&ograve;a B&igrave;nh', '0', '1');
INSERT INTO `tbl_district` VALUES ('96', '28', 'Huyện Đ&agrave; Bắc', '0', '1');
INSERT INTO `tbl_district` VALUES ('97', '28', 'Huyện Kỳ Sơn', '0', '1');
INSERT INTO `tbl_district` VALUES ('98', '28', 'Huyện Lương Sơn', '0', '1');
INSERT INTO `tbl_district` VALUES ('99', '28', 'Huyện Kim B&ocirc;i', '0', '1');
INSERT INTO `tbl_district` VALUES ('100', '28', 'Huyện Cao Phong', '0', '1');
INSERT INTO `tbl_district` VALUES ('101', '28', 'Huyện T&acirc;n Lạc', '0', '1');
INSERT INTO `tbl_district` VALUES ('102', '28', 'Huyện Mai Ch&acirc;u', '0', '1');
INSERT INTO `tbl_district` VALUES ('103', '28', 'Huyện Lạc Sơn', '0', '1');
INSERT INTO `tbl_district` VALUES ('104', '28', 'Huyện Y&ecirc;n Thủy', '0', '1');
INSERT INTO `tbl_district` VALUES ('105', '28', 'Huyện Lạc Thủy', '0', '1');

-- ----------------------------
-- Table structure for tbl_document
-- ----------------------------
DROP TABLE IF EXISTS `tbl_document`;
CREATE TABLE `tbl_document` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `g_id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `intro` text COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `thumb` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fullurl` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `author` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `filetype` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `filesize` int(11) NOT NULL,
  `date_issued` datetime DEFAULT NULL,
  `cdate` datetime NOT NULL,
  `mdate` datetime DEFAULT NULL,
  `pages` int(11) NOT NULL,
  `views` int(11) NOT NULL DEFAULT '0',
  `downloads` int(11) NOT NULL DEFAULT '0',
  `order` int(11) NOT NULL DEFAULT '0',
  `meta_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_desc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ishot` int(11) DEFAULT NULL,
  `isactive` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`,`views`),
  FULLTEXT KEY `idx` (`name`,`intro`,`content`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tbl_document
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_document_group
-- ----------------------------
DROP TABLE IF EXISTS `tbl_document_group`;
CREATE TABLE `tbl_document_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `par_id` int(11) DEFAULT '0',
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `thumb` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `banner` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT '0',
  `isactive` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tbl_document_group
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_feedback
-- ----------------------------
DROP TABLE IF EXISTS `tbl_feedback`;
CREATE TABLE `tbl_feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `career` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `order` int(4) DEFAULT NULL,
  `isactive` tinyint(2) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_feedback
-- ----------------------------
INSERT INTO `tbl_feedback` VALUES ('1', 'Layla', 'http://localhost/dulich/images/hinh-anh/avata-1.jpg', 'Tôi thật sự bị ấn tượng bởi sự nhiệt tình và chu đáo dành cho khách hàng ở đây. Không chỉ chuyên sửa Lexus uy tín, mà chất lượng phục vụ cũng rất tốt. Dịch vụ ở đây hoàn toàn thuyết phục', 'Doanh nhân', '1', '1');
INSERT INTO `tbl_feedback` VALUES ('2', 'DAVID MATIN', 'http://localhost/dulich/images/hinh-anh/avata-1.jpg', 'Tôi hài lòng về dịch vụ bảo hành ở đây, các kỹ sư sau khi sửa ô tô Lexus còn gọi điện chăm sóc và hỏi thăm tình trạng ô tô sau khi sửa chữa. Dịch vụ ở đây hoàn toàn thuyết phục một khách hàng khó tính như tôi', 'Student', '0', '1');
INSERT INTO `tbl_feedback` VALUES ('3', 'Võ Văn Vẻ', 'http://localhost/dulich/images/hinh-anh/avata-1.jpg', 'Tôi hài lòng về dịch vụ bảo hành ở đây, các kỹ sư sau khi sửa ô tô Lexus còn gọi điện chăm sóc và hỏi thăm tình trạng ô tô sau khi sửa chữa. Dịch vụ ở đây hoàn toàn thuyết phục một khách hàng khó tính như tôi', 'Nhân viên văn phòng', null, '1');
INSERT INTO `tbl_feedback` VALUES ('4', 'Hoàng Rapper', 'http://localhost/dulich/images/hinh-anh/avata-1.jpg', 'Tôi hài lòng về dịch vụ bảo hành ở đây, các kỹ sư sau khi sửa ô tô Lexus còn gọi điện chăm sóc và hỏi thăm tình trạng ô tô sau khi sửa chữa. Dịch vụ ở đây hoàn toàn thuyết phục một khách hàng khó tính như tôi', 'Nhân viên văn phòng', null, '1');

-- ----------------------------
-- Table structure for tbl_gallery
-- ----------------------------
DROP TABLE IF EXISTS `tbl_gallery`;
CREATE TABLE `tbl_gallery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `album_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `link` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `isactive` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tbl_gallery
-- ----------------------------
INSERT INTO `tbl_gallery` VALUES ('2', '8', 'hinh-anh-2', 'http://localhost/dulich/images/gallery/bd6.jpg', '1');
INSERT INTO `tbl_gallery` VALUES ('3', '8', 'hinh-anh-3', 'http://localhost/dulich/images/gallery/bd7.jpg', '1');
INSERT INTO `tbl_gallery` VALUES ('4', '8', 'hinh-anh-4', 'http://localhost/dulich/images/gallery/bd8.jpg', '1');
INSERT INTO `tbl_gallery` VALUES ('5', '8', 'hinh-anh-5', 'http://localhost/dulich/images/gallery/bd1.jpg', '1');
INSERT INTO `tbl_gallery` VALUES ('6', '8', 'hinh-anh-6', 'http://localhost/dulich/images/gallery/bd2.jpg', '1');
INSERT INTO `tbl_gallery` VALUES ('7', '8', 'hinh-anh-7', 'http://localhost/dulich/images/gallery/bd4.jpg', '1');
INSERT INTO `tbl_gallery` VALUES ('8', '8', 'ha1', 'http://localhost/dulich/images/gallery/block-4-img-5.jpg', '1');
INSERT INTO `tbl_gallery` VALUES ('9', '8', 'ha2', 'http://localhost/dulich/images/gallery/block-4-img-6.jpg', '1');
INSERT INTO `tbl_gallery` VALUES ('10', '8', 'ha3', 'http://localhost/dulich/images/gallery/block-4-img-7.jpg', '1');
INSERT INTO `tbl_gallery` VALUES ('11', '8', 'ha4', 'http://localhost/dulich/images/gallery/block-4-img-8.jpg', '1');

-- ----------------------------
-- Table structure for tbl_gmember
-- ----------------------------
DROP TABLE IF EXISTS `tbl_gmember`;
CREATE TABLE `tbl_gmember` (
  `gmem_id` int(11) NOT NULL AUTO_INCREMENT,
  `par_id` int(11) DEFAULT '0',
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `intro` text COLLATE utf8_unicode_ci,
  `isadmin` int(11) DEFAULT '1',
  `isactive` int(11) DEFAULT '1',
  PRIMARY KEY (`gmem_id`),
  KEY `idx_active` (`isactive`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tbl_gmember
-- ----------------------------
INSERT INTO `tbl_gmember` VALUES ('1', '0', 'Super Admin', '', '1', '1');
INSERT INTO `tbl_gmember` VALUES ('2', '1', 'Admin', null, '1', '1');
INSERT INTO `tbl_gmember` VALUES ('3', '2', 'Content Managers', 'Quản trị nội dung', '1', '1');
INSERT INTO `tbl_gmember` VALUES ('4', '2', 'Product Manager', null, '1', '1');
INSERT INTO `tbl_gmember` VALUES ('11', '2', 'Order Manager', '', '1', '1');
INSERT INTO `tbl_gmember` VALUES ('13', '1', 'Public', 'ai cũng có quyền truy cập', '1', '1');

-- ----------------------------
-- Table structure for tbl_language
-- ----------------------------
DROP TABLE IF EXISTS `tbl_language`;
CREATE TABLE `tbl_language` (
  `lag_id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `flag` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `site` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'front_end',
  `isdefault` int(11) NOT NULL DEFAULT '0',
  `isactive` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`lag_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tbl_language
-- ----------------------------
INSERT INTO `tbl_language` VALUES ('1', 'vi', 'Viá»‡t nam', 'vi.png', 'back_end', '1', '1');
INSERT INTO `tbl_language` VALUES ('2', 'en', 'English', 'en.png', 'back_end', '0', '1');
INSERT INTO `tbl_language` VALUES ('3', 'vi', 'Việt Nam', 'vi.png', 'front_end', '1', '1');
INSERT INTO `tbl_language` VALUES ('4', 'en', 'Englishs', 'en.png', 'front_end', '0', '1');

-- ----------------------------
-- Table structure for tbl_mail_config
-- ----------------------------
DROP TABLE IF EXISTS `tbl_mail_config`;
CREATE TABLE `tbl_mail_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `hostname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pass` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `port` int(11) NOT NULL DEFAULT '110',
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tbl_mail_config
-- ----------------------------
INSERT INTO `tbl_mail_config` VALUES ('1', 'admin', 'yourdomain.com', 'info@yourdomain.com', '123456', '465', 'YOURDOMAIN.COM');

-- ----------------------------
-- Table structure for tbl_member
-- ----------------------------
DROP TABLE IF EXISTS `tbl_member`;
CREATE TABLE `tbl_member` (
  `mem_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `firstname` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `lastname` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `birthday` date NOT NULL,
  `gender` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `address` text COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `mobile` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `joindate` datetime NOT NULL,
  `lastlogin` datetime NOT NULL,
  `gmem_id` int(11) NOT NULL,
  `isactive` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`mem_id`),
  UNIQUE KEY `username` (`username`),
  KEY `idx_active` (`isactive`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tbl_member
-- ----------------------------
INSERT INTO `tbl_member` VALUES ('6', 'igf', 'b069f1ce2c5e6ad7776d36dd87d75948', 'JSC', 'IGF', '2012-09-16', '0', 'Hà nội', '0936831277', '0936831277', 'nxtuyen.pro@gmail.com', '2011-11-14 05:28:11', '2019-09-04 06:57:15', '1', '1');

-- ----------------------------
-- Table structure for tbl_menus
-- ----------------------------
DROP TABLE IF EXISTS `tbl_menus`;
CREATE TABLE `tbl_menus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `desc` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `isactive` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tbl_menus
-- ----------------------------
INSERT INTO `tbl_menus` VALUES ('1', 'Main menu', 'main-menu', '', '1');
INSERT INTO `tbl_menus` VALUES ('3', 'Menu Footer', 'Menu-footer', '', '1');

-- ----------------------------
-- Table structure for tbl_menus_text
-- ----------------------------
DROP TABLE IF EXISTS `tbl_menus_text`;
CREATE TABLE `tbl_menus_text` (
  `mnu_id_text` int(11) NOT NULL AUTO_INCREMENT,
  `mnu_id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lag_id` int(11) DEFAULT NULL,
  `isactive` int(11) DEFAULT NULL,
  PRIMARY KEY (`mnu_id_text`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tbl_menus_text
-- ----------------------------
INSERT INTO `tbl_menus_text` VALUES ('10', '10', 'Mainmenu', '0', null);

-- ----------------------------
-- Table structure for tbl_mnuitem
-- ----------------------------
DROP TABLE IF EXISTS `tbl_mnuitem`;
CREATE TABLE `tbl_mnuitem` (
  `mnuitem_id` int(11) NOT NULL AUTO_INCREMENT,
  `par_id` int(11) NOT NULL DEFAULT '0',
  `code` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `mnu_id` int(11) NOT NULL DEFAULT '0',
  `viewtype` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `cat_id` int(11) NOT NULL DEFAULT '0',
  `cata_id` int(11) NOT NULL DEFAULT '0',
  `con_id` int(11) NOT NULL DEFAULT '0',
  `link` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `class` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT '0',
  `isactive` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`mnuitem_id`)
) ENGINE=MyISAM AUTO_INCREMENT=99 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tbl_mnuitem
-- ----------------------------
INSERT INTO `tbl_mnuitem` VALUES ('63', '0', 'trang-chu', '10', 'link', '0', '0', '0', 'http://demo.loichoi.com/camsim/', '', '0', '1');
INSERT INTO `tbl_mnuitem` VALUES ('64', '0', 'gioi-thieu', '10', 'link', '0', '0', '0', 'http://demo.loichoi.com/camsim/gioithieu/', '', '1', '1');
INSERT INTO `tbl_mnuitem` VALUES ('71', '0', 'lien-he', '10', 'link', '0', '0', '0', 'http://demo.loichoi.com/camsim/lien-he', '', '6', '1');
INSERT INTO `tbl_mnuitem` VALUES ('72', '0', 'blog', '10', 'link', '0', '0', '0', 'http://demo.loichoi.com/camsim/blog/', '', '7', '1');

-- ----------------------------
-- Table structure for tbl_mnuitems
-- ----------------------------
DROP TABLE IF EXISTS `tbl_mnuitems`;
CREATE TABLE `tbl_mnuitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `par_id` int(11) NOT NULL DEFAULT '0',
  `menu_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` text COLLATE utf8_unicode_ci,
  `viewtype` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `type_of_land_id` int(11) DEFAULT NULL,
  `category_id` int(11) NOT NULL DEFAULT '0',
  `content_id` int(11) NOT NULL DEFAULT '0',
  `link` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `class` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT '0',
  `isactive` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tbl_mnuitems
-- ----------------------------
INSERT INTO `tbl_mnuitems` VALUES ('2', '2', '1', 'Giới thiệu', 'gioi-thieu', '<img src=\"http://daihocdongdo.edu.vn/images/DD.jpg\" alt=\"\" align=\"\" border=\"0px\">', 'block', null, '44', '0', '', '', '', '0', '1');
INSERT INTO `tbl_mnuitems` VALUES ('3', '0', '1', 'Nhà đất cho thuê', 'nha-dat-cho-thue', '', 'type_of_land', '2', '0', '0', '', '', '', '1', '1');
INSERT INTO `tbl_mnuitems` VALUES ('5', '0', '1', 'Nhà đất bán', 'nha-dat-ban', '', 'type_of_land', '1', '0', '0', '', '', '', '0', '1');
INSERT INTO `tbl_mnuitems` VALUES ('10', '0', '3', 'FAQs', 'faqs', null, 'link', null, '0', '0', '#', '', '', '0', '1');
INSERT INTO `tbl_mnuitems` VALUES ('11', '0', '3', 'Liên hệ', 'lien-he', null, 'link', null, '0', '0', '#', '', '', '0', '1');
INSERT INTO `tbl_mnuitems` VALUES ('15', '0', '1', 'Dự án', 'du-an', '', 'type_of_land', '3', '0', '0', '', '', '', '2', '1');
INSERT INTO `tbl_mnuitems` VALUES ('16', '0', '1', 'Cần mua - Cần thuê', 'can-mua-can-thue', '', 'type_of_land', '4', '0', '0', '', '', '', '3', '1');
INSERT INTO `tbl_mnuitems` VALUES ('17', '0', '1', 'Xây dựng - Kiến trúc', 'xay-dung-kien-truc', '', 'type_of_land', '5', '0', '0', '', '', '', '4', '1');
INSERT INTO `tbl_mnuitems` VALUES ('18', '0', '1', 'Nội - Ngoại thất', 'noi-ngoai-that', '', 'type_of_land', '6', '0', '0', '', '', '', '5', '1');
INSERT INTO `tbl_mnuitems` VALUES ('19', '0', '1', 'Phong thủy', 'phong-thuy', '', 'type_of_land', '7', '0', '0', '', '', '', '6', '1');
INSERT INTO `tbl_mnuitems` VALUES ('20', '5', '1', 'Bán đât nền dự án', 'ban-dat-nen-du-an', '', 'block', '0', '69', '0', '', '', '', '0', '1');
INSERT INTO `tbl_mnuitems` VALUES ('21', '5', '1', 'Bán đất 50 năm', 'ban-dat-50-nam', '', 'block', '0', '69', '0', '', '', '', '0', '1');
INSERT INTO `tbl_mnuitems` VALUES ('22', '5', '1', 'Bán đất thổ cư nhà vườn', 'ban-dat-tho-cu-nha-vuon', '', 'block', '0', '70', '0', '', '', '', '0', '1');
INSERT INTO `tbl_mnuitems` VALUES ('23', '5', '1', 'Bán trang trại, khu nghỉ dưỡng', 'ban-trang-trai-khu-nghi-duong', '', 'block', '0', '71', '0', '', '', '', '0', '1');
INSERT INTO `tbl_mnuitems` VALUES ('24', '5', '1', 'Bán nhà xưởng, đất doanh nghiệp', 'ban-nha-xuong-dat-doanh-nghiep', '', 'block', '0', '72', '0', '', '', '', '0', '1');
INSERT INTO `tbl_mnuitems` VALUES ('25', '5', '1', 'Bán đất', 'ban-dat', '', 'block', '0', '68', '0', '', '', '', '0', '1');
INSERT INTO `tbl_mnuitems` VALUES ('26', '5', '1', 'Bán loại bất động sản khác', 'ban-loai-bat-dong-san-khac', '', 'block', '0', '73', '0', '', '', '', '0', '1');
INSERT INTO `tbl_mnuitems` VALUES ('27', '3', '1', 'Cho thuê kho, nhà xưởng, đất', 'cho-thue-kho-nha-xuong-dat', '', 'block', '0', '74', '0', '', '', '', '0', '1');
INSERT INTO `tbl_mnuitems` VALUES ('28', '3', '1', 'Cho thuê loại bất động sản khác', 'cho-thue-loai-bat-dong-san-khac', '', 'block', '0', '75', '0', '', '', '', '0', '1');

-- ----------------------------
-- Table structure for tbl_mnuitem_text
-- ----------------------------
DROP TABLE IF EXISTS `tbl_mnuitem_text`;
CREATE TABLE `tbl_mnuitem_text` (
  `mnuitem_id_text` int(11) NOT NULL AUTO_INCREMENT,
  `mnuitem_id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `intro` text COLLATE utf8_unicode_ci NOT NULL,
  `lag_id` int(11) DEFAULT NULL,
  `isactive` int(11) DEFAULT NULL,
  PRIMARY KEY (`mnuitem_id_text`)
) ENGINE=MyISAM AUTO_INCREMENT=99 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tbl_mnuitem_text
-- ----------------------------
INSERT INTO `tbl_mnuitem_text` VALUES ('72', '72', 'Blog', '', '0', null);
INSERT INTO `tbl_mnuitem_text` VALUES ('71', '71', 'Liên hệ', '', '0', null);
INSERT INTO `tbl_mnuitem_text` VALUES ('64', '64', 'Giới thiệu', '', '0', null);
INSERT INTO `tbl_mnuitem_text` VALUES ('63', '63', 'Trang chủ', '', '0', null);

-- ----------------------------
-- Table structure for tbl_modtype
-- ----------------------------
DROP TABLE IF EXISTS `tbl_modtype`;
CREATE TABLE `tbl_modtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tbl_modtype
-- ----------------------------
INSERT INTO `tbl_modtype` VALUES ('1', 'mainmenu', 'Main menu');
INSERT INTO `tbl_modtype` VALUES ('2', 'html', 'HTML');
INSERT INTO `tbl_modtype` VALUES ('3', 'categories', 'Nhóm bài viết');
INSERT INTO `tbl_modtype` VALUES ('4', 'news', 'Bài viết');
INSERT INTO `tbl_modtype` VALUES ('5', 'slide', 'Slideshow');
INSERT INTO `tbl_modtype` VALUES ('6', 'video', 'Tin Video');
INSERT INTO `tbl_modtype` VALUES ('7', 'gallery', 'Tin ảnh');
INSERT INTO `tbl_modtype` VALUES ('8', 'partner', 'Đối tác');
INSERT INTO `tbl_modtype` VALUES ('9', 'more', 'Mở rộng');

-- ----------------------------
-- Table structure for tbl_modules
-- ----------------------------
DROP TABLE IF EXISTS `tbl_modules`;
CREATE TABLE `tbl_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `intro` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `viewtitle` int(11) NOT NULL DEFAULT '0',
  `menu_id` int(11) DEFAULT NULL,
  `menu_ids` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category_id` int(50) DEFAULT NULL,
  `content_id` int(50) DEFAULT NULL,
  `theme` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `class` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT '0',
  `isactive` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=79 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tbl_modules
-- ----------------------------
INSERT INTO `tbl_modules` VALUES ('2', 'mainmenu', 'Main menu', '', '', '0', '1', '', '0', null, '', 'navitor', '', '0', '1');
INSERT INTO `tbl_modules` VALUES ('15', 'html', 'Logo', '', '<img src=\"http://localhost/dulich/images/logo/logo.png\" class=\"img-responsive\">', '0', '0', '', '0', '0', '', 'user1', 'logo', '1', '1');
INSERT INTO `tbl_modules` VALUES ('21', 'html', 'Copyright', '', '© Copyright 2019 DATHOABINH.INFO | Thông tin đất đai mới nhất, cập nhập liên tục trong 24h', '0', '0', null, '0', '0', '', 'bottom', '', '0', '1');
INSERT INTO `tbl_modules` VALUES ('43', 'html', 'Thông tin liên hệ - Trang liên hệ', '', '<div><span style=\"font-size: 24px;\">THC AUTO SERVICE</span></div><div><br></div><div><div>XƯỞNG DỊCH VỤ 1:</div><div>430 đường Phúc Diễm, Xuân Phương, Nam Từ Liêm, HN</div><div><br></div><div>XƯỞNG DỊCH VỤ 2:</div><div>563 đường Phúc Diễm, Xuân Phương, Nam Từ Liêm, HN</div><div><br></div><div>HOTLINE:</div><div>0968.87.87.68 - 0964.10.4444 (Hỗ trợ 24/7)</div><div><br></div><div>EMAIL:</div><div>otomydinhthc@gmail.com</div></div>', '0', '0', null, '0', null, '', 'user9', '', '0', '1');
INSERT INTO `tbl_modules` VALUES ('75', 'html', 'Thông tin cuối trang (footer)', '', '<p>DATHOABINH.INFO - Mua b&aacute;n Bất Động Sản T&acirc;y H&agrave; Nội</p>\r\n<p>Địa chỉ: Đường Quốc lộ 6, tiểu khu 14, thị trấn Lương Sơn, huyện Lương Sơn, tỉnh H&ograve;a B&igrave;nh</p>\r\n<p>Điện thoại: 0332.36.38.39&nbsp; |&nbsp; 0896.035.789&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Email: hiennguyendang1987@gmail.com</p>', '0', '0', null, '0', '0', '', 'footer', '', '0', '1');
INSERT INTO `tbl_modules` VALUES ('76', 'more', 'Home - Video giới thiệu', '', '', '0', '0', null, '0', '0', 'languages', 'box5', '', '0', '0');
INSERT INTO `tbl_modules` VALUES ('77', 'more', 'Home - Cảm nhận khách hàng', '', '', '0', '0', null, '0', '0', 'feedback', 'box4', '', '0', '1');
INSERT INTO `tbl_modules` VALUES ('78', 'more', 'Home - Khu đất hot', '', '', '0', '0', null, '0', '0', 'hot-lands', 'box3', '', '0', '1');

-- ----------------------------
-- Table structure for tbl_modules_text
-- ----------------------------
DROP TABLE IF EXISTS `tbl_modules_text`;
CREATE TABLE `tbl_modules_text` (
  `mod_text_id` int(11) DEFAULT NULL,
  `mod_id` int(11) DEFAULT NULL,
  `title` varchar(765) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `lag_id` int(11) DEFAULT NULL,
  `isactive` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tbl_modules_text
-- ----------------------------
INSERT INTO `tbl_modules_text` VALUES (null, '27', 'Top Menu', '', '0', null);
INSERT INTO `tbl_modules_text` VALUES (null, '60', 'Thời gian vay linh hoạt', '&nbsp;Với các thẩm định viên chuyên nghiệp, tài sản của bạn sẽ được định giá cao nhất và phù hợp nhất với nhu cầu của bạn.', '0', null);

-- ----------------------------
-- Table structure for tbl_partner
-- ----------------------------
DROP TABLE IF EXISTS `tbl_partner`;
CREATE TABLE `tbl_partner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `images` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `order` tinyint(4) DEFAULT NULL,
  `isactive` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_partner
-- ----------------------------
INSERT INTO `tbl_partner` VALUES ('1', 'Đối t&aacute;c 1', 'http://localhost/dulich/images/hinh-anh/logo1.jpg', '', '1', '1');
INSERT INTO `tbl_partner` VALUES ('2', 'Đối t&aacute;c 2', 'http://localhost/dulich/images/hinh-anh/logo2.jpg', '', '2', '1');
INSERT INTO `tbl_partner` VALUES ('3', 'Đối t&aacute;c 3', 'http://localhost/dulich/images/hinh-anh/logo3.jpg', '', '3', '1');
INSERT INTO `tbl_partner` VALUES ('4', 'Đối t&aacute;c 4', 'http://localhost/dulich/images/hinh-anh/logo4.jpg', '', '4', '1');
INSERT INTO `tbl_partner` VALUES ('5', 'Đối t&aacute;c 5', 'http://localhost/dulich/images/hinh-anh/logo1.jpg', '', '5', '1');

-- ----------------------------
-- Table structure for tbl_partners
-- ----------------------------
DROP TABLE IF EXISTS `tbl_partners`;
CREATE TABLE `tbl_partners` (
  `partner_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `intro` text COLLATE utf8_unicode_ci,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fax` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logo` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lat` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lng` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isactive` int(11) DEFAULT '1',
  `email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `author` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`partner_id`),
  KEY `idx_active` (`isactive`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tbl_partners
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_personnel
-- ----------------------------
DROP TABLE IF EXISTS `tbl_personnel`;
CREATE TABLE `tbl_personnel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `order` tinyint(4) DEFAULT NULL,
  `isactive` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_personnel
-- ----------------------------
INSERT INTO `tbl_personnel` VALUES ('1', 'Benson Casero', 'http://localhost/dulich/images/nhan-su/ns1.jpg', 'Tổng giám đốc', '1', '1');
INSERT INTO `tbl_personnel` VALUES ('2', 'Nguyễn Thanh Hải', 'http://localhost/dulich/images/nhan-su/ns4.jpg', 'Trưởng phòng kinh doanh', '2', '1');
INSERT INTO `tbl_personnel` VALUES ('3', 'Trần Quốc Chí', 'http://localhost/dulich/images/nhan-su/ns3.jpg', 'Phó tổng giám đốc', '3', '1');
INSERT INTO `tbl_personnel` VALUES ('4', 'Võ Chí Công', 'http://localhost/dulich/images/nhan-su/ns4.jpg', 'Trưởng phòng kỹ thuật', '4', '1');
INSERT INTO `tbl_personnel` VALUES ('5', 'Nguyễn Thị Thủy', 'http://localhost/dulich/images/nhan-su/ns5.jpg', 'Nhân viên kinh doanh', '5', '1');
INSERT INTO `tbl_personnel` VALUES ('6', 'Nguyễn Hồng', 'http://localhost/dulich/images/nhan-su/ns6.jpg', 'Nhân viên kinh doanh', '6', '1');

-- ----------------------------
-- Table structure for tbl_place
-- ----------------------------
DROP TABLE IF EXISTS `tbl_place`;
CREATE TABLE `tbl_place` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `par_id` int(11) DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `images` text COLLATE utf8_unicode_ci,
  `intro` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `order` int(11) DEFAULT '0',
  `isactive` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=MyISAM AUTO_INCREMENT=89 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tbl_place
-- ----------------------------
INSERT INTO `tbl_place` VALUES ('1', '0', 'Du lịch trong nước', 'du-lich-trong-nuoc', '[{\"url\":\"http://localhost/dulich/images/du-lich-trong-nuoc/banner-03_dpl.jpg\",\"alt\":\"\",\"order\":\"\"}]', '', '0', '1');
INSERT INTO `tbl_place` VALUES ('5', '0', 'Du lịch nước ngoài', 'du-lich-nuoc-ngoai', '[{\"url\":\"http://localhost/dulich/images/du-lich-nuoc-ngoai/banner-01_bjy.jpg\",\"alt\":\"\",\"order\":0},{\"url\":\"http://localhost/dulich/images/du-lich-nuoc-ngoai/banner-02_qle.jpg\",\"alt\":\"\",\"order\":0},{\"url\":\"http://localhost/dulich/images/du-lich-nuoc-ngoai/banner-03_aou.jpg\",\"alt\":\"\",\"order\":0}]', '', '0', '1');
INSERT INTO `tbl_place` VALUES ('6', '1', 'Du lịch Miền Bắc', 'du-lich-mien-bac', '[]', '', '0', '1');
INSERT INTO `tbl_place` VALUES ('7', '1', 'Du lịch Miền Nam', 'du-lich-mien-nam', '[]', '', '0', '1');
INSERT INTO `tbl_place` VALUES ('8', '1', 'Du lịch Nam Bộ', 'du-lich-nam-bo', '[]', '', '0', '1');
INSERT INTO `tbl_place` VALUES ('9', '1', 'Du lịch theo mùa', 'du-lich-theo-mua', '[]', '', '0', '1');
INSERT INTO `tbl_place` VALUES ('10', '5', 'Du lịch Châu Á', 'du-lich-chau-a', '[]', '', '0', '1');
INSERT INTO `tbl_place` VALUES ('11', '5', 'Du lịch Châu Âu', 'du-lich-chau-au', '[]', '', '0', '1');
INSERT INTO `tbl_place` VALUES ('12', '5', 'Du lịch Châu Mỹ - Phi - Úc', 'du-lich-chau-my-phi-uc', '[]', '', '0', '1');
INSERT INTO `tbl_place` VALUES ('13', '5', 'Tour nổi bật', 'tour-noi-bat', '[]', '', '0', '1');
INSERT INTO `tbl_place` VALUES ('14', '6', 'Du lịch Sapa', 'du-lich-sapa', '[]', '', '0', '1');
INSERT INTO `tbl_place` VALUES ('15', '6', 'Du lịch Điện Biên', 'du-lich-dien-bien', '[]', '', '0', '1');
INSERT INTO `tbl_place` VALUES ('16', '6', 'Du lịch Hòa Bình', 'du-lich-hoa-binh', '[]', '', '0', '1');
INSERT INTO `tbl_place` VALUES ('17', '6', 'Du lịch Sơn La', 'du-lich-son-la', '[]', '', '0', '1');
INSERT INTO `tbl_place` VALUES ('18', '6', 'Du lịch Hà Giang', 'du-lich-ha-giang', '[]', '', '0', '1');
INSERT INTO `tbl_place` VALUES ('19', '6', 'Du lịch Cao Bằng', 'du-lich-cao-bang', '[]', '', '0', '1');
INSERT INTO `tbl_place` VALUES ('20', '6', 'Du lịch Bắc Cạn', 'du-lich-bac-can', '[]', '', '0', '1');
INSERT INTO `tbl_place` VALUES ('21', '6', 'Du lịch Lạng Sơn', 'du-lich-lang-son', '[]', '', '0', '1');
INSERT INTO `tbl_place` VALUES ('22', '6', 'Du lịch Tuyên Quang', 'du-lich-tuyen-quang', '[]', '', '0', '1');
INSERT INTO `tbl_place` VALUES ('23', '6', 'Du lịch Phú Thọ', 'du-lich-phu-tho', '[]', '', '0', '1');
INSERT INTO `tbl_place` VALUES ('24', '6', 'Du lịch Quảng Ninh', 'du-lich-quang-ninh', '[]', '', '0', '1');
INSERT INTO `tbl_place` VALUES ('25', '6', 'Du lịch Bắc Ninh', 'du-lich-bac-ninh', '[]', '', '0', '1');
INSERT INTO `tbl_place` VALUES ('26', '6', 'Du lịch Hà Nội', 'du-lich-ha-noi', '[]', '', '0', '1');
INSERT INTO `tbl_place` VALUES ('27', '6', 'Du lịch Hải Dương', 'du-lich-hai-duong', '[]', '', '0', '1');
INSERT INTO `tbl_place` VALUES ('28', '6', 'Du lịch Hải Phòng', 'du-lich-hai-phong', '[]', '', '0', '1');
INSERT INTO `tbl_place` VALUES ('29', '6', 'Du lịch Nam Định ', 'du-lich-nam-dinh-', '[]', '', '0', '1');
INSERT INTO `tbl_place` VALUES ('30', '6', 'Du lịch Ninh Bình', 'du-lich-ninh-binh', '[]', '', '0', '1');
INSERT INTO `tbl_place` VALUES ('31', '6', 'Du lịch Vĩnh Phúc', 'du-lich-vinh-phuc', '[]', '', '0', '1');
INSERT INTO `tbl_place` VALUES ('32', '1', 'Du lịch Miền Trung', 'du-lich-mien-trung', '[]', '', '0', '1');
INSERT INTO `tbl_place` VALUES ('33', '32', 'Du lịch Thanh Hóa', 'du-lich-thanh-hoa', '[]', '', '0', '1');
INSERT INTO `tbl_place` VALUES ('34', '32', 'Du lịch Nghệ An', 'du-lich-nghe-an', '[]', '', '0', '1');
INSERT INTO `tbl_place` VALUES ('35', '32', 'Du lịch Hà Tĩnh', 'du-lich-ha-tinh', '[]', '', '0', '1');
INSERT INTO `tbl_place` VALUES ('36', '32', 'Du lịch Quảng Bình', 'du-lich-quang-binh', '[]', '', '0', '1');
INSERT INTO `tbl_place` VALUES ('37', '32', 'Du lịch Quảng Trị', 'du-lich-quang-tri', '[]', '', '0', '1');
INSERT INTO `tbl_place` VALUES ('38', '32', 'Du lịch Thừa Thiên Huế', 'du-lich-thua-thien-hue', '[]', '', '0', '1');
INSERT INTO `tbl_place` VALUES ('39', '32', 'Du lịch Đà Nẵng', 'du-lich-da-nang', '[]', '', '0', '1');
INSERT INTO `tbl_place` VALUES ('40', '32', 'Du lịch Quảng Nam', 'du-lich-quang-nam', '[]', '', '0', '1');
INSERT INTO `tbl_place` VALUES ('41', '32', 'Du lịch Quảng Ngãi', 'du-lich-quang-ngai', '[]', '', '0', '1');
INSERT INTO `tbl_place` VALUES ('42', '32', 'Du lịch Bình Định', 'du-lich-binh-dinh', '[]', '', '0', '1');
INSERT INTO `tbl_place` VALUES ('43', '32', 'Du lịch Phú Yên', 'du-lich-phu-yen', '[]', '', '0', '1');
INSERT INTO `tbl_place` VALUES ('44', '32', 'Du lịch Khánh Hòa', 'du-lich-khanh-hoa', '[]', '', '0', '1');
INSERT INTO `tbl_place` VALUES ('45', '32', 'Du lịch Ninh Thuận', 'du-lich-ninh-thuan', '[]', '', '0', '1');
INSERT INTO `tbl_place` VALUES ('46', '32', 'Du lịch Bình Thuận', 'du-lich-binh-thuan', '[]', '', '0', '1');
INSERT INTO `tbl_place` VALUES ('47', '32', 'Du lịch Kon Tum', 'du-lich-kon-tum', '[]', '', '0', '1');
INSERT INTO `tbl_place` VALUES ('48', '32', 'Du lịch Gia Lai', 'du-lich-gia-lai', '[]', '', '0', '1');
INSERT INTO `tbl_place` VALUES ('49', '32', 'Du lịch Đắc Lắc', 'du-lich-dac-lac', '[]', '', '0', '1');
INSERT INTO `tbl_place` VALUES ('50', '32', 'Du lịch Đắc Nông', 'du-lich-dac-nong', '[]', '<p>&nbsp;&nbsp;&nbsp;&nbsp;<br></p>', '0', '1');
INSERT INTO `tbl_place` VALUES ('51', '32', 'Du lịch Lâm Đồng', 'du-lich-lam-dong', '[]', '', '0', '1');
INSERT INTO `tbl_place` VALUES ('52', '7', 'Du lịch TPHCM', 'du-lich-tphcm', '[]', '', '0', '1');
INSERT INTO `tbl_place` VALUES ('53', '7', 'Du lịch Bình Phướng', 'du-lich-binh-phuong', '[]', '', '0', '1');
INSERT INTO `tbl_place` VALUES ('54', '7', 'Du lịch Bình Dương', 'du-lich-binh-duong', '[]', '', '0', '1');
INSERT INTO `tbl_place` VALUES ('55', '7', 'Du lịch Đồng Nai', 'du-lich-dong-nai', '[]', '', '0', '1');
INSERT INTO `tbl_place` VALUES ('56', '7', 'Du lịch Tây Ninh', 'du-lich-tay-ninh', '[]', '', '0', '1');
INSERT INTO `tbl_place` VALUES ('57', '7', 'Du lịch Bà Rịa - Vũng Tàu', 'du-lich-ba-ria-vung-tau', '[]', '', '0', '1');
INSERT INTO `tbl_place` VALUES ('58', '7', 'Du lịch Long An', 'du-lich-long-an', '[]', '', '0', '1');
INSERT INTO `tbl_place` VALUES ('59', '7', 'Du lịch Đồng Tháp', 'du-lich-dong-thap', '[]', '', '0', '1');
INSERT INTO `tbl_place` VALUES ('60', '7', 'Du lịch Tiền Giang', 'du-lich-tien-giang', '[]', '', '0', '1');
INSERT INTO `tbl_place` VALUES ('61', '7', 'Du lịch An Giang', 'du-lich-an-giang', '[]', '', '0', '1');
INSERT INTO `tbl_place` VALUES ('62', '7', 'Du lịch Bến Tre', 'du-lich-ben-tre', '[]', '', '0', '1');
INSERT INTO `tbl_place` VALUES ('63', '7', 'Du lịch Vĩnh Long', 'du-lich-vinh-long', '[]', '', '0', '1');
INSERT INTO `tbl_place` VALUES ('64', '7', 'Du lịch Trà Vinh', 'du-lich-tra-vinh', '[]', '', '0', '1');
INSERT INTO `tbl_place` VALUES ('65', '7', 'Du lịch Hậu Giang', 'du-lich-hau-giang', '[]', '', '0', '1');
INSERT INTO `tbl_place` VALUES ('66', '7', 'Du lịch Kiên Giang', 'du-lich-kien-giang', '[]', '', '0', '1');
INSERT INTO `tbl_place` VALUES ('67', '7', 'Du lịch Sóc Trăng', 'du-lich-soc-trang', '[]', '', '0', '1');
INSERT INTO `tbl_place` VALUES ('68', '7', 'Du lịch Cà Mau', 'du-lich-ca-mau', '[]', '', '0', '1');
INSERT INTO `tbl_place` VALUES ('69', '7', 'Du lịch Cần Thơ', 'du-lich-can-tho', '[]', '', '0', '1');
INSERT INTO `tbl_place` VALUES ('70', '9', 'Du lịch Phú Quốc', 'du-lich-phu-quoc', '[]', '', '0', '1');
INSERT INTO `tbl_place` VALUES ('71', '9', 'Du lịch Đà Nẵng - Hội An', 'du-lich-da-nang-hoi-an', '[]', '', '0', '1');
INSERT INTO `tbl_place` VALUES ('72', '9', 'Du lịch Huế', 'du-lich-hue', '[]', '', '0', '1');
INSERT INTO `tbl_place` VALUES ('73', '9', 'Du lịch Cô Tô', 'du-lich-co-to', '[]', '', '0', '1');
INSERT INTO `tbl_place` VALUES ('74', '9', 'Du lịch Quan Lạn', 'du-lich-quan-lan', '[]', '', '0', '1');
INSERT INTO `tbl_place` VALUES ('75', '9', 'Du lịch Hạ Long', 'du-lich-ha-long', '[]', '', '0', '1');
INSERT INTO `tbl_place` VALUES ('76', '9', 'Du lịch Sầm Sơn', 'du-lich-sam-son', '[]', '', '0', '1');
INSERT INTO `tbl_place` VALUES ('77', '9', 'Du lịch Cửa Lò', 'du-lich-cua-lo', '[]', '', '0', '1');
INSERT INTO `tbl_place` VALUES ('78', '9', 'Du lịch Nha Trang - Đà Lạt', 'du-lich-nha-trang-da-lat', '[]', '', '0', '1');
INSERT INTO `tbl_place` VALUES ('79', '9', 'Du lịch Mũi Né - Phan Thiết', 'du-lich-mui-ne-phan-thiet', '[]', '', '0', '1');
INSERT INTO `tbl_place` VALUES ('80', '9', 'Du lịch Vũng Tàu ', 'du-lich-vung-tau-', '[]', '', '0', '1');
INSERT INTO `tbl_place` VALUES ('81', '9', 'Du lịch Chùa Hươnng', 'du-lich-chua-huonng', '[]', '', '0', '1');
INSERT INTO `tbl_place` VALUES ('82', '9', 'Du lịch Tràng An - Bái Đính', 'du-lich-trang-an-bai-dinh', '[]', '', '0', '1');
INSERT INTO `tbl_place` VALUES ('83', '9', 'Du lịch Côn Sơn Kiếp Bạc', 'du-lich-con-son-kiep-bac', '[]', '', '0', '1');
INSERT INTO `tbl_place` VALUES ('84', '9', 'Du lịch Đền Hùng', 'du-lich-den-hung', '[]', '', '0', '1');
INSERT INTO `tbl_place` VALUES ('85', '9', 'Du lịch Yên Tử', 'du-lich-yen-tu', '[]', '', '0', '1');
INSERT INTO `tbl_place` VALUES ('86', '9', 'Du lịch Đền Mẫu', 'du-lich-den-mau', '[]', '', '0', '1');
INSERT INTO `tbl_place` VALUES ('87', '9', 'Du lịch Sapa 1', 'du-lich-sapa-1', '[]', '', '0', '1');
INSERT INTO `tbl_place` VALUES ('88', '9', 'Du lịch Hà Giang 1', 'du-lich-ha-giang-1', '[]', '', '0', '1');

-- ----------------------------
-- Table structure for tbl_position
-- ----------------------------
DROP TABLE IF EXISTS `tbl_position`;
CREATE TABLE `tbl_position` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=69 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_position
-- ----------------------------
INSERT INTO `tbl_position` VALUES ('1', 'header');
INSERT INTO `tbl_position` VALUES ('2', 'navitor');
INSERT INTO `tbl_position` VALUES ('3', 'footer');
INSERT INTO `tbl_position` VALUES ('4', 'top');
INSERT INTO `tbl_position` VALUES ('5', 'bottom');
INSERT INTO `tbl_position` VALUES ('6', 'path');
INSERT INTO `tbl_position` VALUES ('7', 'left');
INSERT INTO `tbl_position` VALUES ('8', 'right');
INSERT INTO `tbl_position` VALUES ('9', 'box1');
INSERT INTO `tbl_position` VALUES ('10', 'box2');
INSERT INTO `tbl_position` VALUES ('11', 'box3');
INSERT INTO `tbl_position` VALUES ('12', 'box4');
INSERT INTO `tbl_position` VALUES ('13', 'box5');
INSERT INTO `tbl_position` VALUES ('14', 'box6');
INSERT INTO `tbl_position` VALUES ('15', 'box7');
INSERT INTO `tbl_position` VALUES ('16', 'box8');
INSERT INTO `tbl_position` VALUES ('17', 'box9');
INSERT INTO `tbl_position` VALUES ('18', 'box10');
INSERT INTO `tbl_position` VALUES ('19', 'box11');
INSERT INTO `tbl_position` VALUES ('20', 'box12');
INSERT INTO `tbl_position` VALUES ('21', 'box13');
INSERT INTO `tbl_position` VALUES ('22', 'box14');
INSERT INTO `tbl_position` VALUES ('23', 'box15');
INSERT INTO `tbl_position` VALUES ('24', 'box16');
INSERT INTO `tbl_position` VALUES ('25', 'box17');
INSERT INTO `tbl_position` VALUES ('26', 'box18');
INSERT INTO `tbl_position` VALUES ('27', 'box19');
INSERT INTO `tbl_position` VALUES ('28', 'box20');
INSERT INTO `tbl_position` VALUES ('29', 'user1');
INSERT INTO `tbl_position` VALUES ('30', 'user2');
INSERT INTO `tbl_position` VALUES ('31', 'user3');
INSERT INTO `tbl_position` VALUES ('32', 'user4');
INSERT INTO `tbl_position` VALUES ('33', 'user5');
INSERT INTO `tbl_position` VALUES ('34', 'user6');
INSERT INTO `tbl_position` VALUES ('35', 'user7');
INSERT INTO `tbl_position` VALUES ('36', 'user8');
INSERT INTO `tbl_position` VALUES ('37', 'user9');
INSERT INTO `tbl_position` VALUES ('38', 'user10');
INSERT INTO `tbl_position` VALUES ('39', 'banner1');
INSERT INTO `tbl_position` VALUES ('40', 'banner2');
INSERT INTO `tbl_position` VALUES ('41', 'banner3');
INSERT INTO `tbl_position` VALUES ('42', 'banner4');
INSERT INTO `tbl_position` VALUES ('43', 'banner5');
INSERT INTO `tbl_position` VALUES ('44', 'banner6');
INSERT INTO `tbl_position` VALUES ('45', 'banner7');
INSERT INTO `tbl_position` VALUES ('46', 'banner8');
INSERT INTO `tbl_position` VALUES ('47', 'banner9');
INSERT INTO `tbl_position` VALUES ('48', 'banner10');
INSERT INTO `tbl_position` VALUES ('49', 'ads1');
INSERT INTO `tbl_position` VALUES ('50', 'ads2');
INSERT INTO `tbl_position` VALUES ('51', 'ads3');
INSERT INTO `tbl_position` VALUES ('52', 'ads4');
INSERT INTO `tbl_position` VALUES ('53', 'ads5');
INSERT INTO `tbl_position` VALUES ('54', 'ads6');
INSERT INTO `tbl_position` VALUES ('55', 'ads7');
INSERT INTO `tbl_position` VALUES ('56', 'ads8');
INSERT INTO `tbl_position` VALUES ('57', 'ads9');
INSERT INTO `tbl_position` VALUES ('58', 'ads10');
INSERT INTO `tbl_position` VALUES ('59', 'ads11');
INSERT INTO `tbl_position` VALUES ('60', 'ads12');
INSERT INTO `tbl_position` VALUES ('61', 'ads13');
INSERT INTO `tbl_position` VALUES ('62', 'ads14');
INSERT INTO `tbl_position` VALUES ('63', 'ads15');
INSERT INTO `tbl_position` VALUES ('64', 'ads16');
INSERT INTO `tbl_position` VALUES ('65', 'ads17');
INSERT INTO `tbl_position` VALUES ('66', 'ads18');
INSERT INTO `tbl_position` VALUES ('67', 'ads19');
INSERT INTO `tbl_position` VALUES ('68', 'ads20');

-- ----------------------------
-- Table structure for tbl_product
-- ----------------------------
DROP TABLE IF EXISTS `tbl_product`;
CREATE TABLE `tbl_product` (
  `pro_code` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `cat_id` int(11) NOT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `partner_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `intro` text COLLATE utf8_unicode_ci NOT NULL,
  `fulltext` longtext COLLATE utf8_unicode_ci NOT NULL,
  `thumb` text COLLATE utf8_unicode_ci NOT NULL,
  `color` text COLLATE utf8_unicode_ci,
  `size` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `start_price` decimal(10,0) DEFAULT NULL,
  `old_price` decimal(10,0) NOT NULL,
  `cur_price` decimal(10,0) NOT NULL,
  `quantity` bigint(20) NOT NULL,
  `cdate` datetime NOT NULL,
  `mdate` datetime NOT NULL,
  `author` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_title` text COLLATE utf8_unicode_ci,
  `meta_key` text COLLATE utf8_unicode_ci,
  `meta_desc` text COLLATE utf8_unicode_ci,
  `visited` int(11) NOT NULL,
  `order` int(11) DEFAULT '0',
  `ishot` int(11) unsigned NOT NULL,
  `isactive` int(11) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`pro_code`),
  KEY `idx_catid` (`cat_id`),
  KEY `idx_vendor` (`vendor_id`),
  KEY `idx_partner` (`partner_id`),
  KEY `idx_hot` (`ishot`),
  KEY `idx_active` (`isactive`),
  KEY `idx_mdate` (`mdate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tbl_product
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_schedule
-- ----------------------------
DROP TABLE IF EXISTS `tbl_schedule`;
CREATE TABLE `tbl_schedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `service_id` int(11) DEFAULT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `note` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `isactive` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tbl_schedule
-- ----------------------------
INSERT INTO `tbl_schedule` VALUES ('1', 'Nguyễn Văn Nam1', '59', 'abc@gmail.com1', '09695499991', '2019-08-24 00:00:00', 'hehehihi111', 'hihihehe111', '1');
INSERT INTO `tbl_schedule` VALUES ('2', 'DAVID MATIN', '7', 'abc@gmail.com1', '09695499991', '2019-08-03 00:00:00', 'hihihehe', 'hihihaha', '1');
INSERT INTO `tbl_schedule` VALUES ('3', 'DAVID MATIN', '7', 'abc@gmail.com1', '09695499991', '2019-08-03 00:00:00', 'hihihehe', 'hihihaha', '1');
INSERT INTO `tbl_schedule` VALUES ('4', 'Nguyễn Thị Ly', '6', 'abc@gmail.com', '0969548888', '2019-08-02 00:00:00', 'hihihehe', 'hihihaha', '1');
INSERT INTO `tbl_schedule` VALUES ('5', 'Nguyễn Thị Ly', '6', 'abc@gmail.com', '0969548888', '2019-08-02 00:00:00', 'hihihehe', 'hihihaha', '1');
INSERT INTO `tbl_schedule` VALUES ('6', 'Đối tác 1', '0', '', '', '0000-00-00 00:00:00', '', '', '1');
INSERT INTO `tbl_schedule` VALUES ('7', 'DAVID MATIN', '8', 'abc@gmail.com1', '09695499991', '2019-07-19 00:00:00', 'hihihehe', 'hihihaha', '1');
INSERT INTO `tbl_schedule` VALUES ('8', 'DAVID MATIN', '13', 'abc@gmail.com1', '09695499991', '2019-08-02 00:00:00', '', '', '1');

-- ----------------------------
-- Table structure for tbl_seo
-- ----------------------------
DROP TABLE IF EXISTS `tbl_seo`;
CREATE TABLE `tbl_seo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `link` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `ishot` tinyint(4) DEFAULT '0',
  `order` tinyint(4) DEFAULT '0',
  `isactive` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_seo
-- ----------------------------
INSERT INTO `tbl_seo` VALUES ('2', 'Du lịch trong nước', 'http://localhost/dulich/diem-den/du-lich-trong-nuoc', 'http://localhost/dulich/images/du-lich-trong-nuoc/banner-03_dpl.jpg', 'Du lịch trong nước', 'Du lịch trong nước', 'Du lịch trong nước', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('6', 'Du lịch nước ngoài', 'http://localhost/dulich/diem-den/du-lich-nuoc-ngoai', 'http://localhost/dulich/images/du-lich-nuoc-ngoai/banner-01_bjy.jpg', 'Du lịch nước ngo&agrave;i', 'Du lịch nước ngo&agrave;i', 'Du lịch nước ngo&agrave;i', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('7', 'Du lịch Miền Bắc', 'http://localhost/dulich/diem-den/du-lich-mien-bac', '', '', '', '', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('8', 'Du lịch Miền Nam', 'http://localhost/dulich/diem-den/du-lich-mien-nam', '', '', '', '', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('9', 'Du lịch Nam Bộ', 'http://localhost/dulich/diem-den/du-lich-nam-bo', '', '', '', '', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('10', 'Du lịch theo mùa', 'http://localhost/dulich/diem-den/du-lich-theo-mua', '', '', '', '', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('11', 'Du lịch Châu Á', 'http://localhost/dulich/diem-den/du-lich-chau-a', '', '', '', '', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('12', 'Du lịch Châu Âu', 'http://localhost/dulich/diem-den/du-lich-chau-au', '', '', '', '', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('13', 'Du lịch Châu Mỹ - Phi - Úc', 'http://localhost/dulich/diem-den/du-lich-chau-my-phi-uc', '', '', '', '', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('14', 'Tour nổi bật', 'http://localhost/dulich/diem-den/tour-noi-bat', '', '', '', '', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('15', 'Du lịch Sapa', 'http://localhost/dulich/diem-den/du-lich-sapa', '', '', '', '', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('16', 'Du lịch Điện Biên', 'http://localhost/dulich/diem-den/du-lich-dien-bien', '', '', '', '', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('17', 'Du lịch Hòa Bình', 'http://localhost/dulich/diem-den/du-lich-hoa-binh', '', '', '', '', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('18', 'Du lịch Sơn La', 'http://localhost/dulich/diem-den/du-lich-son-la', '', '', '', '', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('19', 'Du lịch Hà Giang', 'http://localhost/dulich/diem-den/du-lich-ha-giang', '', '', '', '', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('20', 'Du lịch Cao Bằng', 'http://localhost/dulich/diem-den/du-lich-cao-bang', '', '', '', '', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('21', 'Du lịch Bắc Cạn', 'http://localhost/dulich/diem-den/du-lich-bac-can', '', '', '', '', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('22', 'Du lịch Lạng Sơn', 'http://localhost/dulich/diem-den/du-lich-lang-son', '', '', '', '', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('23', 'Du lịch Tuyên Quang', 'http://localhost/dulich/diem-den/du-lich-tuyen-quang', '', '', '', '', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('24', 'Du lịch Phú Thọ', 'http://localhost/dulich/diem-den/du-lich-phu-tho', '', '', '', '', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('25', 'Du lịch Quảng Ninh', 'http://localhost/dulich/diem-den/du-lich-quang-ninh', '', '', '', '', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('26', 'Du lịch Bắc Ninh', 'http://localhost/dulich/diem-den/du-lich-bac-ninh', '', '', '', '', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('27', 'Du lịch Hà Nội', 'http://localhost/dulich/diem-den/du-lich-ha-noi', '', '', '', '', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('28', 'Du lịch Hải Dương', 'http://localhost/dulich/diem-den/du-lich-hai-duong', '', '', '', '', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('30', 'Du lịch Hải Phòng', 'http://localhost/dulich/diem-den/du-lich-hai-phong', '', '', '', '', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('31', 'Du lịch Nam Định ', 'http://localhost/dulich/diem-den/du-lich-nam-dinh-', '', '', '', '', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('32', 'Du lịch Ninh Bình', 'http://localhost/dulich/diem-den/du-lich-ninh-binh', '', '', '', '', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('33', 'Du lịch Vĩnh Phúc', 'http://localhost/dulich/diem-den/du-lich-vinh-phuc', '', '', '', '', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('34', 'Du lịch Miền Trung', 'http://localhost/dulich/diem-den/du-lich-mien-trung', '', '', '', '', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('35', 'Du lịch Thanh Hóa', 'http://localhost/dulich/diem-den/du-lich-thanh-hoa', '', '', '', '', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('36', 'Du lịch Nghệ An', 'http://localhost/dulich/diem-den/du-lich-nghe-an', '', '', '', '', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('37', 'Du lịch Hà Tĩnh', 'http://localhost/dulich/diem-den/du-lich-ha-tinh', '', '', '', '', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('38', 'Du lịch Quảng Bình', 'http://localhost/dulich/diem-den/du-lich-quang-binh', '', '', '', '', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('39', 'Du lịch Quảng Trị', 'http://localhost/dulich/diem-den/du-lich-quang-tri', '', '', '', '', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('40', 'Du lịch Thừa Thiên Huế', 'http://localhost/dulich/diem-den/du-lich-thua-thien-hue', '', '', '', '', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('41', 'Du lịch Đà Nẵng', 'http://localhost/dulich/diem-den/du-lich-da-nang', '', '', '', '', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('42', 'Du lịch Quảng Nam', 'http://localhost/dulich/diem-den/du-lich-quang-nam', '', '', '', '', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('43', 'Du lịch Quảng Ngãi', 'http://localhost/dulich/diem-den/du-lich-quang-ngai', '', '', '', '', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('44', 'Du lịch Bình Định', 'http://localhost/dulich/diem-den/du-lich-binh-dinh', '', '', '', '', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('45', 'Du lịch Phú Yên', 'http://localhost/dulich/diem-den/du-lich-phu-yen', '', '', '', '', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('46', 'Du lịch Khánh Hòa', 'http://localhost/dulich/diem-den/du-lich-khanh-hoa', '', '', '', '', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('47', 'Du lịch Ninh Thuận', 'http://localhost/dulich/diem-den/du-lich-ninh-thuan', '', '', '', '', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('48', 'Du lịch Bình Thuận', 'http://localhost/dulich/diem-den/du-lich-binh-thuan', '', '', '', '', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('49', 'Du lịch Kon Tum', 'http://localhost/dulich/diem-den/du-lich-kon-tum', '', '', '', '', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('50', 'Du lịch Gia Lai', 'http://localhost/dulich/diem-den/du-lich-gia-lai', '', '', '', '', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('51', 'Du lịch Đắc Lắc', 'http://localhost/dulich/diem-den/du-lich-dac-lac', '', '', '', '', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('52', 'Du lịch Đắc Nông', 'http://localhost/dulich/diem-den/du-lich-dac-nong', '', '', '', '', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('53', 'Du lịch Lâm Đồng', 'http://localhost/dulich/diem-den/du-lich-lam-dong', '', '', '', '', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('54', 'Du lịch TPHCM', 'http://localhost/dulich/diem-den/du-lich-tphcm', '', '', '', '', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('55', 'Du lịch Bình Phướng', 'http://localhost/dulich/diem-den/du-lich-binh-phuong', '', '', '', '', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('56', 'Du lịch Bình Dương', 'http://localhost/dulich/diem-den/du-lich-binh-duong', '', '', '', '', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('57', 'Du lịch Đồng Nai', 'http://localhost/dulich/diem-den/du-lich-dong-nai', '', '', '', '', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('58', 'Du lịch Tây Ninh', 'http://localhost/dulich/diem-den/du-lich-tay-ninh', '', '', '', '', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('59', 'Du lịch Bà Rịa - Vũng Tàu', 'http://localhost/dulich/diem-den/du-lich-ba-ria-vung-tau', '', '', '', '', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('60', 'Du lịch Long An', 'http://localhost/dulich/diem-den/du-lich-long-an', '', '', '', '', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('61', 'Du lịch Đồng Tháp', 'http://localhost/dulich/diem-den/du-lich-dong-thap', '', '', '', '', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('62', 'Du lịch Tiền Giang', 'http://localhost/dulich/diem-den/du-lich-tien-giang', '', '', '', '', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('63', 'Du lịch An Giang', 'http://localhost/dulich/diem-den/du-lich-an-giang', '', '', '', '', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('64', 'Du lịch Bến Tre', 'http://localhost/dulich/diem-den/du-lich-ben-tre', '', '', '', '', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('65', 'Du lịch Vĩnh Long', 'http://localhost/dulich/diem-den/du-lich-vinh-long', '', '', '', '', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('66', 'Du lịch Trà Vinh', 'http://localhost/dulich/diem-den/du-lich-tra-vinh', '', '', '', '', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('67', 'Du lịch Hậu Giang', 'http://localhost/dulich/diem-den/du-lich-hau-giang', '', '', '', '', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('68', 'Du lịch Kiên Giang', 'http://localhost/dulich/diem-den/du-lich-kien-giang', '', '', '', '', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('69', 'Du lịch Sóc Trăng', 'http://localhost/dulich/diem-den/du-lich-soc-trang', '', '', '', '', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('70', 'Du lịch Cà Mau', 'http://localhost/dulich/diem-den/du-lich-ca-mau', '', '', '', '', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('71', 'Du lịch Cần Thơ', 'http://localhost/dulich/diem-den/du-lich-can-tho', '', '', '', '', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('72', 'Du lịch Phú Quốc', 'http://localhost/dulich/diem-den/du-lich-phu-quoc', '', '', '', '', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('73', 'Du lịch Đà Nẵng - Hội An', 'http://localhost/dulich/diem-den/du-lich-da-nang-hoi-an', '', '', '', '', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('74', 'Du lịch Huế', 'http://localhost/dulich/diem-den/du-lich-hue', '', '', '', '', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('75', 'Du lịch Cô Tô', 'http://localhost/dulich/diem-den/du-lich-co-to', '', '', '', '', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('76', 'Du lịch Quan Lạn', 'http://localhost/dulich/diem-den/du-lich-quan-lan', '', '', '', '', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('77', 'Du lịch Hạ Long', 'http://localhost/dulich/diem-den/du-lich-ha-long', '', '', '', '', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('78', 'Du lịch Sầm Sơn', 'http://localhost/dulich/diem-den/du-lich-sam-son', '', '', '', '', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('79', 'Du lịch Cửa Lò', 'http://localhost/dulich/diem-den/du-lich-cua-lo', '', '', '', '', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('80', 'Du lịch Nha Trang - Đà Lạt', 'http://localhost/dulich/diem-den/du-lich-nha-trang-da-lat', '', '', '', '', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('81', 'Du lịch Mũi Né - Phan Thiết', 'http://localhost/dulich/diem-den/du-lich-mui-ne-phan-thiet', '', '', '', '', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('82', 'Du lịch Vũng Tàu ', 'http://localhost/dulich/diem-den/du-lich-vung-tau-', '', '', '', '', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('83', 'Du lịch Chùa Hươnng', 'http://localhost/dulich/diem-den/du-lich-chua-huonng', '', '', '', '', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('84', 'Du lịch Tràng An - Bái Đính', 'http://localhost/dulich/diem-den/du-lich-trang-an-bai-dinh', '', '', '', '', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('85', 'Du lịch Côn Sơn Kiếp Bạc', 'http://localhost/dulich/diem-den/du-lich-con-son-kiep-bac', '', '', '', '', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('86', 'Du lịch Đền Hùng', 'http://localhost/dulich/diem-den/du-lich-den-hung', '', '', '', '', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('87', 'Du lịch Yên Tử', 'http://localhost/dulich/diem-den/du-lich-yen-tu', '', '', '', '', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('88', 'Du lịch Đền Mẫu', 'http://localhost/dulich/diem-den/du-lich-den-mau', '', '', '', '', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('89', 'Du lịch Sapa 1', 'http://localhost/dulich/diem-den/du-lich-sapa-1', '', '', '', '', '0', '0', '1');
INSERT INTO `tbl_seo` VALUES ('90', 'Du lịch Hà Giang 1', 'http://localhost/dulich/diem-den/du-lich-ha-giang-1', '', '', '', '', '0', '0', '1');

-- ----------------------------
-- Table structure for tbl_slider
-- ----------------------------
DROP TABLE IF EXISTS `tbl_slider`;
CREATE TABLE `tbl_slider` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `slogan` varchar(120) COLLATE utf8_unicode_ci DEFAULT NULL,
  `intro` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT '0',
  `thumb` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `link` varchar(120) COLLATE utf8_unicode_ci DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `isactive` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tbl_slider
-- ----------------------------
INSERT INTO `tbl_slider` VALUES ('18', 'SỬA CHỮA PHỤC HỒI XE Ô TÔ', 'Đặt lịch hẹn Hôm nay <span style=\"color: rgb(250, 121, 1); font-weight: bold;\">GIẢM NGAY 15%</span><div><br><div><button class=\"btn btn-view\">ĐẶT LỊCH SỬA CHỮA</button></div></div>', '0', ' http://localhost/dulich/images/Banner/banner-02.jpg', '', null, '1');
INSERT INTO `tbl_slider` VALUES ('19', 'SỬA CHỮA PHỤC HỒI XE Ô TÔ', 'Đặt lịch hẹn Hôm nay <span style=\"color: rgb(250, 121, 1); font-weight: bold;\">GIẢM NGAY 15%</span><div><br><div><button class=\"btn btn-view\">ĐẶT LỊCH SỬA CHỮA</button></div></div>', '0', ' http://localhost/dulich/images/Banner/banner-03.jpg', '', null, '1');
INSERT INTO `tbl_slider` VALUES ('20', 'SỬA CHỮA PHỤC HỒI XE Ô TÔ', 'Đặt lịch hẹn Hôm nay <span style=\"color: rgb(250, 121, 1); font-weight: bold;\">GIẢM NGAY 15%</span><div><br><div><button class=\"btn btn-view\">ĐẶT LỊCH SỬA CHỮA</button></div></div>', '0', ' http://localhost/dulich/images/Banner/banner-01.jpg', '', null, '1');

-- ----------------------------
-- Table structure for tbl_tags
-- ----------------------------
DROP TABLE IF EXISTS `tbl_tags`;
CREATE TABLE `tbl_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_desc` text,
  `pids` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_tags
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_template
-- ----------------------------
DROP TABLE IF EXISTS `tbl_template`;
CREATE TABLE `tbl_template` (
  `tem_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `desc` text COLLATE utf8_unicode_ci NOT NULL,
  `author` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `author_email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `author_site` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `site` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `mnuids` text COLLATE utf8_unicode_ci NOT NULL,
  `isdefault` int(11) NOT NULL DEFAULT '0',
  `isactive` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`tem_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tbl_template
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_tour
-- ----------------------------
DROP TABLE IF EXISTS `tbl_tour`;
CREATE TABLE `tbl_tour` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `un_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` char(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `place_id` int(11) NOT NULL,
  `intro` text COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `schedule` text COLLATE utf8_unicode_ci,
  `policy` text COLLATE utf8_unicode_ci,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `images` text COLLATE utf8_unicode_ci NOT NULL,
  `price1` int(11) DEFAULT NULL,
  `price2` int(11) DEFAULT NULL,
  `starting_gate` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `departure` int(11) DEFAULT NULL,
  `days` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `vehicle` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `number_of_holes` int(11) DEFAULT NULL,
  `cdate` datetime NOT NULL,
  `mdate` datetime NOT NULL,
  `author` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_title` text COLLATE utf8_unicode_ci,
  `meta_key` text COLLATE utf8_unicode_ci,
  `meta_desc` text COLLATE utf8_unicode_ci,
  `visited` int(11) NOT NULL,
  `order` int(11) DEFAULT '0',
  `ishot` int(11) unsigned NOT NULL,
  `isactive` int(11) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_catid` (`place_id`),
  KEY `idx_hot` (`ishot`),
  KEY `idx_active` (`isactive`),
  KEY `idx_mdate` (`mdate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of tbl_tour
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_type_of_land
-- ----------------------------
DROP TABLE IF EXISTS `tbl_type_of_land`;
CREATE TABLE `tbl_type_of_land` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `intro` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `ishot` tinyint(4) DEFAULT NULL,
  `display_home` tinyint(1) DEFAULT '1',
  `order` tinyint(4) DEFAULT NULL,
  `isactive` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_type_of_land
-- ----------------------------
INSERT INTO `tbl_type_of_land` VALUES ('1', 'Nhà đất bán', 'nha-dat-ban', '', null, '1', null, '1');
INSERT INTO `tbl_type_of_land` VALUES ('2', 'Nhà đất cho thuê', 'nha-dat-cho-thue', '', null, '1', null, '1');
INSERT INTO `tbl_type_of_land` VALUES ('3', 'Dự án', 'du-an', '', null, '0', null, '1');
INSERT INTO `tbl_type_of_land` VALUES ('4', 'Cần mua - cần thuê', 'can-mua-can-thue', '', null, '0', null, '1');
INSERT INTO `tbl_type_of_land` VALUES ('5', 'Xây dựng - Kiến trúc', 'xay-dung-kien-truc', '', null, '0', null, '1');
INSERT INTO `tbl_type_of_land` VALUES ('6', 'Nội - Ngoại thất', 'noi-ngoai-that', '', null, '0', null, '1');
INSERT INTO `tbl_type_of_land` VALUES ('7', 'Phong thủy', 'phong-thuy', '', null, '0', null, '1');

-- ----------------------------
-- Table structure for tbl_user
-- ----------------------------
DROP TABLE IF EXISTS `tbl_user`;
CREATE TABLE `tbl_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `firstname` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `lastname` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `birthday` date NOT NULL,
  `gender` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `address` text COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `mobile` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `identify` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `organ` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `joindate` datetime NOT NULL,
  `lastlogin` datetime NOT NULL,
  `gid` int(11) NOT NULL,
  `isroot` tinyint(4) DEFAULT NULL,
  `isactive` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tbl_user
-- ----------------------------
INSERT INTO `tbl_user` VALUES ('12', 'igf', 'd93a5def7511da3d0f2d171d9c344e91', 'IGF', 'JSC', '0000-00-00', '', '', '', '', '', null, null, null, '0000-00-00 00:00:00', '2019-10-27 10:39:49', '1', null, '1');
INSERT INTO `tbl_user` VALUES ('16', 'admin', 'd93a5def7511da3d0f2d171d9c344e91', 'Admin', 'Admin', '0000-00-00', '0', '', '123456789', '', 'a@gmail.com', null, '1111111111', '', '2019-07-23 17:13:50', '2019-12-10 02:20:13', '1', null, '1');
INSERT INTO `tbl_user` VALUES ('20', 'danghien', '8fce8935f4d4dc9cfaf4ca6f705b2329', 'Hiển', 'Nguyễn Đăng', '0000-00-00', '0', '', '1234567890', '', 'a@gmail.com', null, null, null, '2019-10-17 09:33:05', '2019-12-02 10:49:24', '1', null, '1');

-- ----------------------------
-- Table structure for tbl_user_group
-- ----------------------------
DROP TABLE IF EXISTS `tbl_user_group`;
CREATE TABLE `tbl_user_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `par_id` int(11) DEFAULT '0',
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `intro` text COLLATE utf8_unicode_ci,
  `permission` int(11) NOT NULL DEFAULT '0',
  `isadmin` int(11) NOT NULL DEFAULT '0',
  `isroot` tinyint(4) DEFAULT NULL,
  `isboss` tinyint(4) DEFAULT '1',
  `isactive` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tbl_user_group
-- ----------------------------
INSERT INTO `tbl_user_group` VALUES ('1', '0', 'Super Admin', '', '8388607', '1', null, '1', '1');
INSERT INTO `tbl_user_group` VALUES ('2', '1', 'Admin', '', '6291448', '0', null, '1', '1');
INSERT INTO `tbl_user_group` VALUES ('10', '2', 'Content', '', '992', '0', null, '1', '1');
INSERT INTO `tbl_user_group` VALUES ('13', '2', 'Dangky', '', '49152', '0', null, '1', '1');

-- ----------------------------
-- Table structure for tbl_video
-- ----------------------------
DROP TABLE IF EXISTS `tbl_video`;
CREATE TABLE `tbl_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `video_id` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `thumb` varchar(255) DEFAULT NULL,
  `intro` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `content` text CHARACTER SET utf8,
  `ishot` tinyint(4) DEFAULT '0',
  `order` int(11) DEFAULT '0',
  `cdate` datetime DEFAULT NULL,
  `mdate` datetime DEFAULT NULL,
  `visited` int(11) DEFAULT '0',
  `isactive` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_video
-- ----------------------------
INSERT INTO `tbl_video` VALUES ('3', 'Sinh vi&ecirc;n đại học Đ&ocirc;ng Đ&ocirc;', 'sinh-vien-dai-hoc-dong-do', 'rUXsxIRagMo', 'https://www.youtube.com/watch?v=rUXsxIRagMo', 'https://i.ytimg.com/vi/rUXsxIRagMo/hqdefault.jpg', 'Clip nhảy Flashmob sinh vi&ecirc;n đại học Đ&ocirc;ng Đ&ocirc;', '', '0', '0', '2018-09-13 10:00:00', '2018-09-14 14:56:41', '0', '1');
INSERT INTO `tbl_video` VALUES ('4', 'Flash mob mừng kỷ niệm 26 năm quan hệ ngoại giao Việt - H&agrave;n', 'flash-mob-mung-ky-niem-26-nam-quan-he-ngoai-giao-viet-han', 's3dDUNL1VNY', 'https://www.youtube.com/watch?v=s3dDUNL1VNY', 'https://i.ytimg.com/vi/s3dDUNL1VNY/hqdefault.jpg', '150 SV Đại học Đ&ocirc;ng Đ&ocirc; đồng diễn flash mob ch&agrave;o mừng kỷ niệm 26 năm quan hệ ngoại giao Việt Nam - H&agrave;n Quốc (1992 - 2018) tại SVĐ Mỹ Đ&igrave;nh ng&agrave;y 20/1 vừa qua.', '&lt;span style=&quot;color: rgb(51, 51, 51); font-family: &quot; helvetica=&quot;&quot; neue&quot;,=&quot;&quot; helvetica,=&quot;&quot; arial,=&quot;&quot; sans-serif;=&quot;&quot; font-size:=&quot;&quot; 14px;=&quot;&quot; background-color:=&quot;&quot; rgb(255,=&quot;&quot; 255,=&quot;&quot; 255);&quot;=&quot;&quot;&gt;150 SV Đại học Đ&ocirc;ng Đ&ocirc; đồng diễn flash mob ch&agrave;o mừng kỷ niệm 26 năm quan hệ ngoại giao Việt Nam - H&agrave;n Quốc (1992 - 2018) tại SVĐ Mỹ Đ&igrave;nh ng&agrave;y 20/1 vừa qua.&lt;/span&gt;', '0', '0', '2018-09-14 08:00:00', '2018-09-15 18:25:46', '0', '1');
INSERT INTO `tbl_video` VALUES ('5', 'Đại học Đ&ocirc;ng Đ&ocirc; tuyển sinh v&agrave; giảng dạy 2018', 'dai-hoc-dong-do-tuyen-sinh-va-giang-day-2018', 'fzcchFRp1qw', 'https://www.youtube.com/watch?v=fzcchFRp1qw', 'https://i.ytimg.com/vi/fzcchFRp1qw/hqdefault.jpg', 'Đại học Đ&ocirc;ng Đ&ocirc; tuyển sinh 20 ng&agrave;nh hệ Đại học v&agrave; 06 ng&agrave;nh hệ Thạc sĩ: Thạc sĩ Quản trị kinh doanh Thạc sĩ Quản l&yacute; c&ocirc;ng Thạc sĩ Quản l&yacute; kinh tế Thạc sĩ T&agrave;i ch&iacute;nh ng&acirc;n h&agrave;ng Thạ', '&lt;span style=&quot;color: rgb(51, 51, 51); font-family: &quot; helvetica=&quot;&quot; neue&quot;,=&quot;&quot; helvetica,=&quot;&quot; arial,=&quot;&quot; sans-serif;=&quot;&quot; font-size:=&quot;&quot; 14px;=&quot;&quot; background-color:=&quot;&quot; rgb(255,=&quot;&quot; 255,=&quot;&quot; 255);&quot;=&quot;&quot;&gt;Đại học Đ&ocirc;ng Đ&ocirc; tuyển sinh 20 ng&agrave;nh hệ Đại học v&agrave; 06 ng&agrave;nh hệ Thạc sĩ: Thạc sĩ Quản trị kinh doanh Thạc sĩ Quản l&yacute; c&ocirc;ng Thạc sĩ Quản l&yacute; kinh tế Thạc sĩ T&agrave;i ch&iacute;nh ng&acirc;n h&agrave;ng Thạc sĩ Quản l&yacute; x&acirc;y dựng Thạc sĩ Kiến tr&uacute;c&lt;/span&gt;', '0', '0', '2018-09-14 08:28:30', '2018-09-15 18:25:40', '0', '1');
INSERT INTO `tbl_video` VALUES ('6', 'Trường Đại học Đ&ocirc;ng Đ&ocirc; x&eacute;t tuyển Học bạ v&agrave;o đại học ch&iacute;nh quy 2018', 'truong-dai-hoc-dong-do-xet-tuyen-hoc-ba-vao-dai-hoc-chinh-quy-2018', 'q1XdK2O6hLU', 'https://www.youtube.com/watch?v=q1XdK2O6hLU', 'https://i.ytimg.com/vi/q1XdK2O6hLU/hqdefault.jpg', 'Trường Đại học Đ&ocirc;ng Đ&ocirc; tuyển sinh đại học ch&iacute;nh quy năm 2018. Phương thức x&eacute;t tuyển học bạ v&agrave; x&eacute;t tuyển kết quả thi PTTH Quốc gia', '&lt;span style=&quot;font-family: arial; font-size: 14.6667px; background-color: rgb(255, 255, 255);&quot;&gt;Trường Đại học Đ&ocirc;ng Đ&ocirc; tuyển sinh đại học ch&iacute;nh quy năm 2018. Phương thức x&eacute;t tuyển học bạ v&agrave; x&eacute;t tuyển kết quả thi PTTH Quốc gia&lt;/span&gt;', '0', '0', '2018-09-14 08:31:10', '2018-09-15 18:25:33', '0', '1');

-- ----------------------------
-- Table structure for tbl_visit
-- ----------------------------
DROP TABLE IF EXISTS `tbl_visit`;
CREATE TABLE `tbl_visit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cdate` date DEFAULT NULL,
  `isonline` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tbl_visit
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_ward
-- ----------------------------
DROP TABLE IF EXISTS `tbl_ward`;
CREATE TABLE `tbl_ward` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city_id` int(11) DEFAULT '0',
  `district_id` int(11) DEFAULT '0',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `order` int(11) DEFAULT '0',
  `isactive` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_ward
-- ----------------------------
INSERT INTO `tbl_ward` VALUES ('65', '1', '65', 'Phường Ph&uacute;c X&aacute;', '0', '1');
INSERT INTO `tbl_ward` VALUES ('66', '1', '65', 'Phường Tr&uacute;c Bạch', '0', '1');
INSERT INTO `tbl_ward` VALUES ('67', '1', '65', 'Phường Vĩnh Ph&uacute;c', '0', '1');
INSERT INTO `tbl_ward` VALUES ('68', '1', '65', 'Phường Cống Vị', '0', '1');
INSERT INTO `tbl_ward` VALUES ('69', '1', '65', 'Phường Liễu Giai', '0', '1');
INSERT INTO `tbl_ward` VALUES ('70', '1', '65', 'Phường Nguyễn Trung Trực', '0', '1');
INSERT INTO `tbl_ward` VALUES ('71', '1', '65', 'Phường Qu&aacute;n Th&aacute;nh', '0', '1');
INSERT INTO `tbl_ward` VALUES ('72', '1', '65', 'Phường Ngọc H&agrave;1', '0', '1');
INSERT INTO `tbl_ward` VALUES ('73', '1', '65', 'Phường Điện Bi&ecirc;n', '0', '1');
INSERT INTO `tbl_ward` VALUES ('74', '1', '65', 'Phường Đội Cấn', '0', '1');
INSERT INTO `tbl_ward` VALUES ('75', '1', '65', 'Phường Ngọc Kh&aacute;nh', '0', '1');
INSERT INTO `tbl_ward` VALUES ('76', '1', '65', 'Phường Kim M&atilde;', '0', '1');
INSERT INTO `tbl_ward` VALUES ('77', '1', '65', 'Phường Giảng V&otilde;', '0', '1');
INSERT INTO `tbl_ward` VALUES ('78', '1', '65', 'Phường Th&agrave;nh C&ocirc;ng', '0', '1');
INSERT INTO `tbl_ward` VALUES ('79', '28', '95', 'Phường Th&aacute;i B&igrave;nh', '0', '1');
INSERT INTO `tbl_ward` VALUES ('80', '28', '95', 'Phường T&acirc;n H&ograve;a', '0', '1');
INSERT INTO `tbl_ward` VALUES ('81', '28', '95', 'Phường Thịnh Lang', '0', '1');
INSERT INTO `tbl_ward` VALUES ('82', '28', '95', 'Phường Hữu Nghị', '0', '1');
INSERT INTO `tbl_ward` VALUES ('83', '28', '95', 'Phường T&acirc;n Thịnh', '0', '1');
INSERT INTO `tbl_ward` VALUES ('84', '28', '95', 'Phường Đồng Tiến', '0', '1');
INSERT INTO `tbl_ward` VALUES ('85', '28', '95', 'Phường Phương L&acirc;m', '0', '1');
INSERT INTO `tbl_ward` VALUES ('86', '28', '95', 'Phường Chăm M&aacute;t', '0', '1');
INSERT INTO `tbl_ward` VALUES ('87', '28', '95', 'X&atilde; Y&ecirc;n M&ocirc;ng', '0', '1');
INSERT INTO `tbl_ward` VALUES ('88', '28', '95', 'X&atilde; Sủ Ng&ograve;i', '0', '1');
INSERT INTO `tbl_ward` VALUES ('89', '28', '95', 'X&atilde; D&acirc;n Chủ', '0', '1');
INSERT INTO `tbl_ward` VALUES ('90', '28', '95', 'X&atilde; Th&aacute;i Thịnh', '0', '1');
INSERT INTO `tbl_ward` VALUES ('91', '28', '95', 'X&atilde; H&ograve;a B&igrave;nh', '0', '1');
INSERT INTO `tbl_ward` VALUES ('92', '28', '95', 'X&atilde; Thống Nhất', '0', '1');
INSERT INTO `tbl_ward` VALUES ('93', '28', '95', 'X&atilde; Trung Minh', '0', '1');
INSERT INTO `tbl_ward` VALUES ('94', '28', '98', 'h&ograve;a sơn', '0', '1');
INSERT INTO `tbl_ward` VALUES ('95', '28', '98', 'Thị trấn Lương Sơn', '0', '1');
INSERT INTO `tbl_ward` VALUES ('96', '28', '98', 'x&atilde; Nhuận Trạch', '0', '1');
INSERT INTO `tbl_ward` VALUES ('97', '28', '98', 'x&atilde; Cư Y&ecirc;n', '0', '1');
INSERT INTO `tbl_ward` VALUES ('98', '28', '98', 'x&atilde; Trường Sơn', '0', '1');
INSERT INTO `tbl_ward` VALUES ('99', '28', '98', 'x&atilde; Hợp H&ograve;a', '0', '1');
INSERT INTO `tbl_ward` VALUES ('100', '28', '98', 'x&atilde; Cao Răm', '0', '1');
INSERT INTO `tbl_ward` VALUES ('101', '28', '98', 'x&atilde; L&acirc;m Sơn', '0', '1');
INSERT INTO `tbl_ward` VALUES ('102', '28', '98', 'x&atilde; T&acirc;n Vinh', '0', '1');
INSERT INTO `tbl_ward` VALUES ('103', '28', '98', 'x&atilde; Li&ecirc;n sơn', '0', '1');
INSERT INTO `tbl_ward` VALUES ('104', '28', '98', 'x&atilde; Th&agrave;nh Lập', '0', '1');
INSERT INTO `tbl_ward` VALUES ('105', '28', '98', 'x&atilde; Hợp Ch&acirc;u', '0', '1');
INSERT INTO `tbl_ward` VALUES ('106', '28', '98', 'x&atilde; Long Sơn', '0', '1');
INSERT INTO `tbl_ward` VALUES ('107', '28', '98', 'x&atilde; T&acirc;n Th&agrave;nh', '0', '1');
INSERT INTO `tbl_ward` VALUES ('108', '28', '98', 'x&atilde; Cao Dương', '0', '1');
INSERT INTO `tbl_ward` VALUES ('109', '28', '98', 'x&atilde; Trung Sơn', '0', '1');
INSERT INTO `tbl_ward` VALUES ('110', '1', '89', 'x&atilde; Trần Ph&uacute;', '0', '1');
INSERT INTO `tbl_ward` VALUES ('111', '1', '89', 'Thị trấn Xu&acirc;n Mai', '0', '1');
INSERT INTO `tbl_ward` VALUES ('112', '1', '89', 'Thủy Xu&acirc;n Ti&ecirc;n', '0', '1');
INSERT INTO `tbl_ward` VALUES ('113', '1', '89', 'x&atilde; Ho&agrave;ng Văn Thụ', '0', '1');
INSERT INTO `tbl_ward` VALUES ('114', '1', '89', 'Thị trấn Ch&uacute;c Sơn', '0', '1');
INSERT INTO `tbl_ward` VALUES ('115', '1', '89', 'x&atilde; Ph&uacute; Nghĩa', '0', '1');
INSERT INTO `tbl_ward` VALUES ('116', '1', '89', 'x&atilde; Hữu Văn', '0', '1');
INSERT INTO `tbl_ward` VALUES ('117', '1', '89', 'x&atilde; Tốt Động', '0', '1');
INSERT INTO `tbl_ward` VALUES ('118', '1', '89', 'x&atilde; T&acirc;n Tiến', '0', '1');
INSERT INTO `tbl_ward` VALUES ('119', '1', '87', 'x&atilde; Ph&uacute; C&aacute;t', '0', '1');
INSERT INTO `tbl_ward` VALUES ('120', '1', '87', 'x&atilde; Ph&uacute; M&atilde;n', '0', '1');
INSERT INTO `tbl_ward` VALUES ('121', '1', '87', 'x&atilde; H&ograve;a Thạch', '0', '1');
INSERT INTO `tbl_ward` VALUES ('122', '1', '87', 'x&atilde; Đ&ocirc;ng Xu&acirc;n', '0', '1');
INSERT INTO `tbl_ward` VALUES ('123', '1', '88', 'x&atilde; Thach H&ograve;a', '0', '1');
INSERT INTO `tbl_ward` VALUES ('124', '1', '88', 'x&atilde; Tiến Xu&acirc;n', '0', '1');
INSERT INTO `tbl_ward` VALUES ('125', '1', '88', 'x&atilde; Y&ecirc;n Chung', '0', '1');
INSERT INTO `tbl_ward` VALUES ('126', '1', '88', 'x&atilde; Y&ecirc;n B&igrave;nh', '0', '1');
INSERT INTO `tbl_ward` VALUES ('127', '28', '97', 'x&atilde; D&acirc;n H&ograve;a', '0', '1');
INSERT INTO `tbl_ward` VALUES ('128', '28', '97', 'x&atilde; D&acirc;n Hạ', '0', '1');
INSERT INTO `tbl_ward` VALUES ('129', '28', '97', 'x&atilde; M&ocirc;ng H&oacute;a', '0', '1');
INSERT INTO `tbl_ward` VALUES ('130', '1', '83', 'x&atilde; Y&ecirc;n B&agrave;i', '0', '1');
INSERT INTO `tbl_ward` VALUES ('131', '1', '83', 'x&atilde; Cẩm Lĩnh', '0', '1');

-- ----------------------------
-- View structure for view_cate
-- ----------------------------
DROP VIEW IF EXISTS `view_cate`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost`  VIEW `view_cate` AS (select `tbl_category`.`cat_id` AS `cat_id`,`tbl_category`.`par_id` AS `par_id`,`tbl_category`.`isactive` AS `isactive`,`tbl_category_text`.`name` AS `name`,`tbl_category_text`.`meta_title` AS `meta_title`,`tbl_category_text`.`meta_key` AS `meta_key`,`tbl_category_text`.`meta_desc` AS `meta_desc`,`tbl_category_text`.`lag_id` AS `lag_id`,`tbl_category_text`.`alias` AS `alias` from (`tbl_category_text` join `tbl_category` on((`tbl_category_text`.`cat_id` = `tbl_category`.`cat_id`)))) ;
