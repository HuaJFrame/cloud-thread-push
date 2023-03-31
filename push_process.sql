/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50715 (5.7.15)
 Source Host           : localhost:3306
 Source Schema         : thread-push

 Target Server Type    : MySQL
 Target Server Version : 50715 (5.7.15)
 File Encoding         : 65001

 Date: 31/03/2023 17:37:32
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for push_process
-- ----------------------------
DROP TABLE IF EXISTS `push_process`;
CREATE TABLE `push_process`  (
  `id` bigint(32) NOT NULL AUTO_INCREMENT,
  `process_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '环节名称',
  `audit_person` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '审核人',
  `audit_result` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '审核结果',
  `push_flag` tinyint(4) NULL DEFAULT NULL COMMENT '推送成功标识：0：推送失败  1：推送成功  ',
  `push_state` tinyint(4) NOT NULL COMMENT '推送标识： 0：未推送    1：已推送',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30001 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of push_process
-- ----------------------------
INSERT INTO `push_process` VALUES (1, '审核', '蒋秀英', '通过', NULL, 0);
INSERT INTO `push_process` VALUES (2, '审核', '苏云熙', '通过', NULL, 0);
INSERT INTO `push_process` VALUES (3, '审核', '高子韬', '通过', NULL, 0);
INSERT INTO `push_process` VALUES (4, '审核', 'Michael Salazar', '通过', NULL, 0);
INSERT INTO `push_process` VALUES (5, '审核', 'Denise Green', '通过', NULL, 0);
INSERT INTO `push_process` VALUES (6, '审核', 'Irene Washington', '通过', NULL, 0);
INSERT INTO `push_process` VALUES (7, '审核', '邱云熙', '通过', NULL, 0);
INSERT INTO `push_process` VALUES (8, '审核', 'Jack Ross', '通过', NULL, 0);
INSERT INTO `push_process` VALUES (9, '审核', 'Mildred Phillips', '通过', NULL, 0);
INSERT INTO `push_process` VALUES (10, '审核', 'Judy Hunt', '通过', NULL, 0);
INSERT INTO `push_process` VALUES (11, '审核', '薛震南', '通过', NULL, 0);
INSERT INTO `push_process` VALUES (12, '审核', 'Joseph Gibson', '通过', NULL, 0);
INSERT INTO `push_process` VALUES (13, '审核', 'Amanda Rodriguez', '通过', NULL, 0);
INSERT INTO `push_process` VALUES (14, '审核', '龙致远', '通过', NULL, 0);
INSERT INTO `push_process` VALUES (15, '审核', '邹震南', '通过', NULL, 0);
INSERT INTO `push_process` VALUES (16, '审核', '黄宇宁', '通过', NULL, 0);
INSERT INTO `push_process` VALUES (17, '审核', '董岚', '通过', NULL, 0);
INSERT INTO `push_process` VALUES (18, '审核', 'Ralph Hayes', '通过', NULL, 0);
INSERT INTO `push_process` VALUES (19, '审核', '徐宇宁', '通过', NULL, 0);
INSERT INTO `push_process` VALUES (20, '审核', 'Peter Reyes', '通过', NULL, 0);
INSERT INTO `push_process` VALUES (21, '审核', '孙睿', '通过', NULL, 0);
INSERT INTO `push_process` VALUES (22, '审核', '沈震南', '通过', NULL, 0);
INSERT INTO `push_process` VALUES (23, '审核', 'Beverly Hicks', '通过', NULL, 0);
INSERT INTO `push_process` VALUES (24, '审核', 'Eric Hayes', '通过', NULL, 0);
INSERT INTO `push_process` VALUES (25, '审核', 'Kevin Lee', '通过', NULL, 0);
INSERT INTO `push_process` VALUES (26, '审核', 'Marcus Murray', '通过', NULL, 0);
INSERT INTO `push_process` VALUES (27, '审核', 'Raymond Ferguson', '通过', NULL, 0);
INSERT INTO `push_process` VALUES (28, '审核', 'Herbert Warren', '通过', NULL, 0);
INSERT INTO `push_process` VALUES (29, '审核', 'Denise Ramirez', '通过', NULL, 0);
INSERT INTO `push_process` VALUES (30, '审核', '胡睿', '通过', NULL, 0);
INSERT INTO `push_process` VALUES (31, '审核', 'Frances Alexander', '通过', NULL, 0);
INSERT INTO `push_process` VALUES (32, '审核', '江宇宁', '通过', NULL, 0);
INSERT INTO `push_process` VALUES (33, '审核', '雷睿', '通过', NULL, 0);
INSERT INTO `push_process` VALUES (34, '审核', 'Alfred Powell', '通过', NULL, 0);
INSERT INTO `push_process` VALUES (35, '审核', '罗子韬', '通过', NULL, 0);
INSERT INTO `push_process` VALUES (36, '审核', 'Doris Chavez', '通过', NULL, 0);
INSERT INTO `push_process` VALUES (37, '审核', '莫璐', '通过', NULL, 0);
INSERT INTO `push_process` VALUES (38, '审核', 'Leroy Freeman', '通过', NULL, 0);
INSERT INTO `push_process` VALUES (39, '审核', 'Jessica Thompson', '通过', NULL, 0);
INSERT INTO `push_process` VALUES (40, '审核', 'Clifford Daniels', '通过', NULL, 0);
INSERT INTO `push_process` VALUES (41, '审核', 'Richard Hayes', '通过', NULL, 0);
INSERT INTO `push_process` VALUES (42, '审核', 'Ruby Harris', '通过', NULL, 0);
INSERT INTO `push_process` VALUES (43, '审核', '韩子异', '通过', NULL, 0);
INSERT INTO `push_process` VALUES (44, '审核', '潘岚', '通过', NULL, 0);
INSERT INTO `push_process` VALUES (45, '审核', '沈子异', '通过', NULL, 0);
INSERT INTO `push_process` VALUES (46, '审核', 'Rhonda Hayes', '通过', NULL, 0);
INSERT INTO `push_process` VALUES (47, '审核', '许震南', '通过', NULL, 0);
INSERT INTO `push_process` VALUES (48, '审核', 'Anne Perez', '通过', NULL, 0);
INSERT INTO `push_process` VALUES (49, '审核', '董岚', '通过', NULL, 0);
INSERT INTO `push_process` VALUES (50, '审核', 'David Perez', '通过', NULL, 0);
INSERT INTO `push_process` VALUES (51, '审核', '阎宇宁', '通过', NULL, 0);
INSERT INTO `push_process` VALUES (52, '审核', '石安琪', '通过', NULL, 0);
INSERT INTO `push_process` VALUES (53, '审核', '戴秀英', '通过', NULL, 0);
INSERT INTO `push_process` VALUES (54, '审核', 'Bruce Thompson', '通过', NULL, 0);
INSERT INTO `push_process` VALUES (55, '审核', 'Daniel Burns', '通过', NULL, 0);
INSERT INTO `push_process` VALUES (56, '审核', '陈岚', '通过', NULL, 0);
INSERT INTO `push_process` VALUES (57, '审核', 'Mary Reyes', '通过', NULL, 0);
INSERT INTO `push_process` VALUES (58, '审核', '陆晓明', '通过', NULL, 0);
INSERT INTO `push_process` VALUES (59, '审核', '钱璐', '通过', NULL, 0);
INSERT INTO `push_process` VALUES (60, '审核', '江岚', '通过', NULL, 0);
INSERT INTO `push_process` VALUES (61, '审核', '胡子韬', '通过', NULL, 0);
INSERT INTO `push_process` VALUES (62, '审核', '邹岚', '通过', NULL, 0);
INSERT INTO `push_process` VALUES (63, '审核', '陆子韬', '通过', NULL, 0);
INSERT INTO `push_process` VALUES (64, '审核', 'Russell Chen', '通过', NULL, 0);
INSERT INTO `push_process` VALUES (65, '审核', '于震南', '通过', NULL, 0);
INSERT INTO `push_process` VALUES (66, '审核', '罗詩涵', '通过', NULL, 0);
INSERT INTO `push_process` VALUES (67, '审核', '孟晓明', '通过', NULL, 0);
INSERT INTO `push_process` VALUES (68, '审核', '田杰宏', '通过', NULL, 0);
INSERT INTO `push_process` VALUES (69, '审核', '冯致远', '通过', NULL, 0);
INSERT INTO `push_process` VALUES (70, '审核', '陈璐', '通过', NULL, 0);
INSERT INTO `push_process` VALUES (71, '审核', '叶宇宁', '通过', NULL, 0);
INSERT INTO `push_process` VALUES (72, '审核', '侯璐', '通过', NULL, 0);
INSERT INTO `push_process` VALUES (73, '审核', '姜嘉伦', '通过', NULL, 0);
INSERT INTO `push_process` VALUES (74, '审核', 'Lois Stephens', '通过', NULL, 0);
INSERT INTO `push_process` VALUES (75, '审核', 'Joshua Aguilar', '通过', NULL, 0);
INSERT INTO `push_process` VALUES (76, '审核', '孟震南', '通过', NULL, 0);
INSERT INTO `push_process` VALUES (77, '审核', '萧云熙', '通过', NULL, 0);
INSERT INTO `push_process` VALUES (78, '审核', 'Theodore Garza', '通过', NULL, 0);
INSERT INTO `push_process` VALUES (79, '审核', '梁安琪', '通过', NULL, 0);
INSERT INTO `push_process` VALUES (80, '审核', '宋安琪', '通过', NULL, 0);
INSERT INTO `push_process` VALUES (81, '审核', '段睿', '通过', NULL, 0);
INSERT INTO `push_process` VALUES (82, '审核', '邵致远', '通过', NULL, 0);
INSERT INTO `push_process` VALUES (83, '审核', '于致远', '通过', NULL, 0);
INSERT INTO `push_process` VALUES (84, '审核', 'Edward Roberts', '通过', NULL, 0);
INSERT INTO `push_process` VALUES (85, '审核', 'Monica Gardner', '通过', NULL, 0);
INSERT INTO `push_process` VALUES (86, '审核', '吴震南', '通过', NULL, 0);
INSERT INTO `push_process` VALUES (87, '审核', '叶子韬', '通过', NULL, 0);
INSERT INTO `push_process` VALUES (88, '审核', '于嘉伦', '通过', NULL, 0);
INSERT INTO `push_process` VALUES (89, '审核', 'Theodore Wright', '通过', NULL, 0);
INSERT INTO `push_process` VALUES (90, '审核', 'Elaine Brooks', '通过', NULL, 0);
INSERT INTO `push_process` VALUES (91, '审核', '崔璐', '通过', NULL, 0);
INSERT INTO `push_process` VALUES (92, '审核', 'Nathan Warren', '通过', NULL, 0);
INSERT INTO `push_process` VALUES (93, '审核', '张云熙', '通过', NULL, 0);
INSERT INTO `push_process` VALUES (94, '审核', 'Lawrence Green', '通过', NULL, 0);
INSERT INTO `push_process` VALUES (95, '审核', 'Danny Dunn', '通过', NULL, 0);
INSERT INTO `push_process` VALUES (96, '审核', 'Lisa Rivera', '通过', NULL, 0);
INSERT INTO `push_process` VALUES (97, '审核', 'Jane Martin', '通过', NULL, 0);
INSERT INTO `push_process` VALUES (98, '审核', 'Thelma Russell', '通过', NULL, 0);
INSERT INTO `push_process` VALUES (99, '审核', 'Marilyn Harrison', '通过', NULL, 0);
INSERT INTO `push_process` VALUES (100, '审核', 'Pamela Jordan', '通过', NULL, 0);

SET FOREIGN_KEY_CHECKS = 1;
