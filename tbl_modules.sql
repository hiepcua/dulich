/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : db_dulich

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2019-12-12 17:32:56
*/

SET FOREIGN_KEY_CHECKS=0;

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
  `place_id` int(11) DEFAULT NULL,
  `content_id` int(50) DEFAULT NULL,
  `theme` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `class` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT '0',
  `isactive` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=83 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of tbl_modules
-- ----------------------------
INSERT INTO `tbl_modules` VALUES ('2', 'mainmenu', 'Main menu', '', '', '0', '1', '', '0', null, null, '', 'navitor', '', '0', '1');
INSERT INTO `tbl_modules` VALUES ('15', 'html', 'Logo', '', '<img src=\"http://localhost:8000/dulich/images/logo/logo.png\" class=\"img-responsive\">', '0', '0', '', '0', null, '0', '', 'user1', 'logo', '1', '1');
INSERT INTO `tbl_modules` VALUES ('21', 'html', 'Copyright', '', '© Copyright 2019 DATHOABINH.INFO | Thông tin đất đai mới nhất, cập nhập liên tục trong 24h', '0', '0', null, '0', null, '0', '', 'bottom', '', '0', '1');
INSERT INTO `tbl_modules` VALUES ('43', 'html', 'Thông tin liên hệ - Trang liên hệ', '', '<div><span style=\"font-size: 24px;\">THC AUTO SERVICE</span></div><div><br></div><div><div>XƯỞNG DỊCH VỤ 1:</div><div>430 đường Phúc Diễm, Xuân Phương, Nam Từ Liêm, HN</div><div><br></div><div>XƯỞNG DỊCH VỤ 2:</div><div>563 đường Phúc Diễm, Xuân Phương, Nam Từ Liêm, HN</div><div><br></div><div>HOTLINE:</div><div>0968.87.87.68 - 0964.10.4444 (Hỗ trợ 24/7)</div><div><br></div><div>EMAIL:</div><div>otomydinhthc@gmail.com</div></div>', '0', '0', null, '0', null, null, '', 'user9', '', '0', '1');
INSERT INTO `tbl_modules` VALUES ('75', 'html', 'Thông tin cuối trang (footer)', '', '<p>DATHOABINH.INFO - Mua b&aacute;n Bất Động Sản T&acirc;y H&agrave; Nội</p>\r\n<p>Địa chỉ: Đường Quốc lộ 6, tiểu khu 14, thị trấn Lương Sơn, huyện Lương Sơn, tỉnh H&ograve;a B&igrave;nh</p>\r\n<p>Điện thoại: 0332.36.38.39&nbsp; |&nbsp; 0896.035.789&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Email: hiennguyendang1987@gmail.com</p>', '0', '0', null, '0', null, '0', '', 'footer', '', '0', '1');
INSERT INTO `tbl_modules` VALUES ('76', 'more', 'Home - Video giới thiệu', '', '', '0', '0', null, '0', null, '0', 'languages', 'box5', '', '0', '0');
INSERT INTO `tbl_modules` VALUES ('77', 'more', 'Home - Cảm nhận khách hàng', '', '', '0', '0', null, '0', null, '0', 'feedback', 'box4', '', '0', '1');
INSERT INTO `tbl_modules` VALUES ('78', 'more', 'Home - Khu đất hot', '', '', '0', '0', null, '0', null, '0', 'hot-lands', 'box3', '', '0', '1');
INSERT INTO `tbl_modules` VALUES ('79', 'more', 'Aside left - Bài viết nổi bật', '', '', '0', '0', null, '0', null, '0', 'hotnews', 'ads1', 'aside-hotnews', '0', '1');
INSERT INTO `tbl_modules` VALUES ('80', 'more', 'Aside left - Tour nổi bật', '', '', '0', '0', null, '0', null, '0', 'hottour', 'ads2', '', '0', '1');
INSERT INTO `tbl_modules` VALUES ('81', 'place', 'Home - Du lịch trong nước', '', '', '0', '0', null, '0', '1', '0', 'default', 'box5', '', '0', '1');
INSERT INTO `tbl_modules` VALUES ('82', 'place', 'Home - Du lịch nước ngoài', '', '', '0', '0', null, '0', '5', '0', 'default', 'box5', '', '0', '1');
