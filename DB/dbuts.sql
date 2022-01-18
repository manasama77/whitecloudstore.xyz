/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MariaDB
 Source Server Version : 100421
 Source Host           : localhost:3306
 Source Schema         : dbuts

 Target Server Type    : MariaDB
 Target Server Version : 100421
 File Encoding         : 65001

 Date: 18/01/2022 01:09:36
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for detail_orders
-- ----------------------------
DROP TABLE IF EXISTS `detail_orders`;
CREATE TABLE `detail_orders`  (
  `id_detail_orders` int(11) NOT NULL AUTO_INCREMENT,
  `id_orders` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `id_masakan` int(11) NOT NULL,
  `keterangan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `status_detail_orders` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id_detail_orders`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of detail_orders
-- ----------------------------
INSERT INTO `detail_orders` VALUES (1, '0001', 7, '1', 'langsung');
INSERT INTO `detail_orders` VALUES (2, '0001', 4, '2', 'langsung');
INSERT INTO `detail_orders` VALUES (3, '0001', 5, '1', 'langsung');
INSERT INTO `detail_orders` VALUES (4, '0001', 6, '1', 'langsung');
INSERT INTO `detail_orders` VALUES (5, '0002', 7, '1', 'langsung');

-- ----------------------------
-- Table structure for level
-- ----------------------------
DROP TABLE IF EXISTS `level`;
CREATE TABLE `level`  (
  `id_level` int(11) NOT NULL AUTO_INCREMENT,
  `nama_level` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id_level`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of level
-- ----------------------------
INSERT INTO `level` VALUES (1, 'Admin');
INSERT INTO `level` VALUES (2, 'Kasir');

-- ----------------------------
-- Table structure for masakan
-- ----------------------------
DROP TABLE IF EXISTS `masakan`;
CREATE TABLE `masakan`  (
  `id_masakan` int(11) NOT NULL AUTO_INCREMENT,
  `nama_masakan` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `harga` int(11) NOT NULL,
  `status_masakan` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id_masakan`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of masakan
-- ----------------------------
INSERT INTO `masakan` VALUES (2, 'Mei Mei', 9000, 'pesan');
INSERT INTO `masakan` VALUES (3, 'Nasi Goreng', 10000, 'pesan');
INSERT INTO `masakan` VALUES (4, 'Mei Ayam', 7000, 'langsung');
INSERT INTO `masakan` VALUES (5, 'Susu', 2000, 'langsung');
INSERT INTO `masakan` VALUES (6, 'Teh Manis', 1500, 'langsung');
INSERT INTO `masakan` VALUES (7, 'Jus', 5000, 'langsung');
INSERT INTO `masakan` VALUES (8, 'Cap Cay', 10000, 'langsung');
INSERT INTO `masakan` VALUES (9, 'Teh Dingan', 900, 'langsung');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id_orders` char(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_meja` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tanggal` date NOT NULL,
  `id_user` int(11) NOT NULL,
  `keterangan` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `status_orders` varchar(70) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id_orders`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('0001', '8', '2020-01-13', 1, '-', 'cash');
INSERT INTO `orders` VALUES ('0002', '4', '2021-11-13', 3, 'pake cabe yah jus nya', 'cash');

-- ----------------------------
-- Table structure for transaksi
-- ----------------------------
DROP TABLE IF EXISTS `transaksi`;
CREATE TABLE `transaksi`  (
  `id_transaksi` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `id_orders` char(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tanggal` date NOT NULL,
  `total_bayar` int(11) NOT NULL,
  PRIMARY KEY (`id_transaksi`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of transaksi
-- ----------------------------
INSERT INTO `transaksi` VALUES (1, 1, '0001', '2020-01-13', 22500);
INSERT INTO `transaksi` VALUES (2, 3, '0002', '2021-11-13', 5000);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `password` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_user` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `id_level` int(11) NOT NULL,
  PRIMARY KEY (`id_user`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'Admin', 1);
INSERT INTO `user` VALUES (2, '123', '202cb962ac59075b964b07152d234b70', 'Mario', 2);
INSERT INTO `user` VALUES (3, 'wahid', '202cb962ac59075b964b07152d234b70', 'Lim', 2);

SET FOREIGN_KEY_CHECKS = 1;
