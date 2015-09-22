/*
Navicat MySQL Data Transfer

Source Server         : Michelle
Source Server Version : 50517
Source Host           : localhost:3306
Source Database       : newcdstore

Target Server Type    : MYSQL
Target Server Version : 50517
File Encoding         : 65001

Date: 2015-09-22 01:04:36
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `address`
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `addrid` bigint(20) NOT NULL AUTO_INCREMENT,
  `apt` varchar(255) DEFAULT NULL,
  `box` varchar(255) DEFAULT NULL,
  `stno` varchar(255) NOT NULL,
  `stname` varchar(255) NOT NULL,
  `province` varchar(255) NOT NULL,
  `zipcode` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `userid` bigint(20) NOT NULL,
  PRIMARY KEY (`addrid`),
  KEY `userid` (`userid`),
  CONSTRAINT `userid` FOREIGN KEY (`userid`) REFERENCES `customer` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of address
-- ----------------------------

-- ----------------------------
-- Table structure for `category`
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `cateid` bigint(20) NOT NULL AUTO_INCREMENT,
  `catename` varchar(255) NOT NULL,
  PRIMARY KEY (`cateid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------

-- ----------------------------
-- Table structure for `cd`
-- ----------------------------
DROP TABLE IF EXISTS `cd`;
CREATE TABLE `cd` (
  `cdid` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `artist` varchar(255) NOT NULL,
  `date` date DEFAULT NULL,
  `intro` varchar(255) DEFAULT NULL,
  `price` float NOT NULL,
  `stock` int(11) NOT NULL,
  `imgurl` varchar(255) DEFAULT NULL,
  `cateid` bigint(20) NOT NULL,
  PRIMARY KEY (`cdid`),
  KEY `cateid` (`cateid`),
  CONSTRAINT `cateid` FOREIGN KEY (`cateid`) REFERENCES `category` (`cateid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cd
-- ----------------------------

-- ----------------------------
-- Table structure for `customer`
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `userid` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer
-- ----------------------------

-- ----------------------------
-- Table structure for `items`
-- ----------------------------
DROP TABLE IF EXISTS `items`;
CREATE TABLE `items` (
  `itemsid` bigint(20) NOT NULL AUTO_INCREMENT,
  `count` int(11) NOT NULL,
  `orderid` bigint(20) NOT NULL,
  `cdid` bigint(20) NOT NULL,
  PRIMARY KEY (`itemsid`),
  KEY `order_item` (`orderid`),
  KEY `cd_item` (`cdid`),
  CONSTRAINT `order_item` FOREIGN KEY (`orderid`) REFERENCES `order` (`orderid`),
  CONSTRAINT `cd_item` FOREIGN KEY (`cdid`) REFERENCES `cd` (`cdid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of items
-- ----------------------------

-- ----------------------------
-- Table structure for `order`
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `orderid` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `status` char(255) NOT NULL,
  `total` float NOT NULL,
  `userid` bigint(20) NOT NULL,
  `addrid` bigint(20) NOT NULL,
  `shipid` bigint(20) NOT NULL,
  `taxid` bigint(20) NOT NULL,
  PRIMARY KEY (`orderid`),
  KEY `user_cus` (`userid`),
  KEY `add_cus` (`addrid`),
  KEY `ship_cus` (`shipid`),
  KEY `tax_cus` (`taxid`),
  CONSTRAINT `tax_cus` FOREIGN KEY (`taxid`) REFERENCES `tax` (`taxid`),
  CONSTRAINT `add_cus` FOREIGN KEY (`addrid`) REFERENCES `address` (`addrid`),
  CONSTRAINT `ship_cus` FOREIGN KEY (`shipid`) REFERENCES `shipping` (`shipid`),
  CONSTRAINT `user_cus` FOREIGN KEY (`userid`) REFERENCES `customer` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order
-- ----------------------------

-- ----------------------------
-- Table structure for `shipping`
-- ----------------------------
DROP TABLE IF EXISTS `shipping`;
CREATE TABLE `shipping` (
  `shipid` bigint(20) NOT NULL AUTO_INCREMENT,
  `method` varchar(255) NOT NULL,
  `price` float NOT NULL,
  PRIMARY KEY (`shipid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shipping
-- ----------------------------

-- ----------------------------
-- Table structure for `tax`
-- ----------------------------
DROP TABLE IF EXISTS `tax`;
CREATE TABLE `tax` (
  `taxid` bigint(20) NOT NULL AUTO_INCREMENT,
  `taxname` varchar(255) NOT NULL,
  `taxrate` varchar(255) NOT NULL,
  PRIMARY KEY (`taxid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tax
-- ----------------------------
