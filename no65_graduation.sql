/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50717
 Source Host           : localhost:3306
 Source Schema         : no65_graduation

 Target Server Type    : MySQL
 Target Server Version : 50717
 File Encoding         : 65001

 Date: 22/12/2023 20:10:41
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`
(
    `admin_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键,管理员id',
    `user_id`  char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '外键,用户id',
    PRIMARY KEY (`admin_id`) USING BTREE,
    INDEX `user_id` (`user_id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin`
VALUES ('admin', 'caf1a3dfb505ffed0d024130f58c5cfa');

-- ----------------------------
-- Table structure for class_info
-- ----------------------------
DROP TABLE IF EXISTS `class_info`;
CREATE TABLE `class_info`
(
    `class_id`   int(11)                                                NOT NULL AUTO_INCREMENT COMMENT '主键,id',
    `class_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '班级名',
    `grade_id`   int(11)                                                NULL DEFAULT NULL COMMENT '外键,年级',
    `subject_id` int(11)                                                NULL DEFAULT NULL COMMENT '外键,专业名',
    PRIMARY KEY (`class_id`) USING BTREE,
    INDEX `grade_id` (`grade_id`) USING BTREE,
    INDEX `subject_id` (`subject_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 2
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of class_info
-- ----------------------------
INSERT INTO `class_info`
VALUES (1, '2024级软件工程（移动终端应用开发方向）', 1, 1);

-- ----------------------------
-- Table structure for dabian
-- ----------------------------
DROP TABLE IF EXISTS `dabian`;
CREATE TABLE `dabian`
(
    `id`           int(11)                                             NOT NULL AUTO_INCREMENT COMMENT '主键,id',
    `student_id`   char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '外键,学生id',
    `dabian_score` int(11)                                             NULL DEFAULT NULL COMMENT '答辩成绩',
    PRIMARY KEY (`id`) USING BTREE,
    INDEX `student_id` (`student_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for dept
-- ----------------------------
DROP TABLE IF EXISTS `dept`;
CREATE TABLE `dept`
(
    `dept_id`   int(11)                                                NOT NULL AUTO_INCREMENT COMMENT '主键,部门id',
    `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '部门科室名',
    PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 5
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dept
-- ----------------------------
INSERT INTO `dept`
VALUES (1, '移动终端教研室');
INSERT INTO `dept`
VALUES (2, '嵌入式教研室');
INSERT INTO `dept`
VALUES (3, '计算机科学教研室');
INSERT INTO `dept`
VALUES (4, '大数据教研室');

-- ----------------------------
-- Table structure for dicts
-- ----------------------------
DROP TABLE IF EXISTS `dicts`;
CREATE TABLE `dicts`
(
    `id`     int(11)                                                 NOT NULL AUTO_INCREMENT,
    `value`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL COMMENT '字典值',
    `name`   varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL COMMENT '字典中文',
    `object` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL COMMENT '表名',
    `field`  varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL COMMENT '字段名',
    `ext`    varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '扩展Json',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 15
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci COMMENT = '数据字典'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dicts
-- ----------------------------
INSERT INTO `dicts`
VALUES (1, '0', '女', 'user', 'user_gender', '');
INSERT INTO `dicts`
VALUES (2, '1', '男', 'user', 'user_gender', '');
INSERT INTO `dicts`
VALUES (3, '0', '否', 'student', 'good_boy', '');
INSERT INTO `dicts`
VALUES (4, '1', '是', 'student', 'good_boy', '');
INSERT INTO `dicts`
VALUES (5, '0', '未通过', 'ktbg', 'ktbg_status', '');
INSERT INTO `dicts`
VALUES (6, '1', '通过', 'ktbg', 'ktbg_status', '');
INSERT INTO `dicts`
VALUES (7, '0', '退回修改', 'lunwen', 'lunwen_status', '');
INSERT INTO `dicts`
VALUES (8, '1', '评审打分', 'lunwen', 'lunwen_status', '');
INSERT INTO `dicts`
VALUES (9, '0', '否', 'yansou', 'is_leader', '');
INSERT INTO `dicts`
VALUES (10, '1', '是', 'yansou', 'is_leader', '');
INSERT INTO `dicts`
VALUES (11, '0', '否', 'student', 'project_num', '');
INSERT INTO `dicts`
VALUES (12, '1', '是', 'student', 'project_num', '');
INSERT INTO `dicts`
VALUES (13, '0', '不允许', 'mdb', 'mdb_status', '');
INSERT INTO `dicts`
VALUES (14, '1', '允许', 'mdb', 'mdb_status', '');

-- ----------------------------
-- Table structure for down
-- ----------------------------
DROP TABLE IF EXISTS `down`;
CREATE TABLE `down`
(
    `down_id`     int(11)                                                 NOT NULL AUTO_INCREMENT COMMENT '公共资源下载',
    `down_title`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '资源标题',
    `down_path`   varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '资源下载地址',
    `create_date` datetime(0)                                             NULL DEFAULT NULL COMMENT '创建时间',
    `admin_id`    varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci  NULL DEFAULT NULL COMMENT '外键,管理员id',
    PRIMARY KEY (`down_id`) USING BTREE,
    INDEX `admin_id` (`admin_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 9
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of down
-- ----------------------------
INSERT INTO `down`
VALUES (2, '中期检查表', '中期检查表.docx', '2024-08-25 17:15:39', '3b275f7fdf0e41a8945ebe207d76989c');
INSERT INTO `down`
VALUES (3, '开题报告', '开题报告.doc', '2024-08-25 17:16:10', '3b275f7fdf0e41a8945ebe207d76989c');
INSERT INTO `down`
VALUES (4, '论文要求说明', '', '2024-08-25 17:16:47', '3b275f7fdf0e41a8945ebe207d76989c');
INSERT INTO `down`
VALUES (5, '2024届毕业设计（论文）完成情况评价表（新）.doc', '', '2024-08-25 17:17:19', '3b275f7fdf0e41a8945ebe207d76989c');
INSERT INTO `down`
VALUES (6, '2024届毕业设计开题报告完成情况统计.xlsx', '', '2024-08-25 17:17:42', '3b275f7fdf0e41a8945ebe207d76989c');
INSERT INTO `down`
VALUES (7, 'Javascript参考手册.chm', '', '2024-08-25 17:18:09', '3b275f7fdf0e41a8945ebe207d76989c');
INSERT INTO `down`
VALUES (8, 'J2EE_1.6_API.chm', '', '2024-08-25 17:18:30', '3b275f7fdf0e41a8945ebe207d76989c');

-- ----------------------------
-- Table structure for grade
-- ----------------------------
DROP TABLE IF EXISTS `grade`;
CREATE TABLE `grade`
(
    `grade_id`   int(11)                                                NOT NULL AUTO_INCREMENT COMMENT '主键,id',
    `grade_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '年级名',
    PRIMARY KEY (`grade_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 2
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of grade
-- ----------------------------
INSERT INTO `grade`
VALUES (1, '2024级');

-- ----------------------------
-- Table structure for inform
-- ----------------------------
DROP TABLE IF EXISTS `inform`;
CREATE TABLE `inform`
(
    `inform_id`       int(11)                                                 NOT NULL AUTO_INCREMENT COMMENT '主键,通知公告id',
    `inform_title`    varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '通知公告标题',
    `inform_body`     text CHARACTER SET utf8 COLLATE utf8_general_ci         NOT NULL COMMENT '通知公告主体',
    `is_attachment`   int(1)                                                  NULL DEFAULT 0 COMMENT '是否有附件(0否1有)',
    `attachment_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '附件地址',
    `create_date`     datetime(0)                                             NULL DEFAULT NULL COMMENT '创建时间',
    `admin_id`        char(32) CHARACTER SET utf8 COLLATE utf8_general_ci     NULL DEFAULT NULL COMMENT '外键,管理员id',
    PRIMARY KEY (`inform_id`) USING BTREE,
    INDEX `admin_id` (`admin_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 21
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of inform
-- ----------------------------
INSERT INTO `inform`
VALUES (20, '广州软件学院', '奥术大师', 1, '阿萨德阿石', '2024-08-21 21:30:49', NULL);

-- ----------------------------
-- Table structure for ktbg
-- ----------------------------
DROP TABLE IF EXISTS `ktbg`;
CREATE TABLE `ktbg`
(
    `ktbg_id`     int(11)                                                 NOT NULL AUTO_INCREMENT COMMENT '主键,id',
    `column1`     varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '综述',
    `column2`     varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '思路及方法',
    `student_id`  char(32) CHARACTER SET utf8 COLLATE utf8_general_ci     NULL DEFAULT NULL COMMENT '外键,学生id',
    `ktbg_status` int(1)                                                  NULL DEFAULT NULL COMMENT '教师评审意见（0未通过，1通过）',
    PRIMARY KEY (`ktbg_id`) USING BTREE,
    INDEX `student_id` (`student_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for lunwen
-- ----------------------------
DROP TABLE IF EXISTS `lunwen`;
CREATE TABLE `lunwen`
(
    `lunwen_id`     int(11)                                                 NOT NULL AUTO_INCREMENT COMMENT '主键,id',
    `lunwen_name`   varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL COMMENT '论文名',
    `lunwen_path`   varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '论文上传路径',
    `lunwen_date`   datetime(0)                                             NULL DEFAULT NULL COMMENT '论文上传时间',
    `student_id`    char(32) CHARACTER SET utf8 COLLATE utf8_general_ci     NULL DEFAULT NULL COMMENT '外键,学生id',
    `lunwen_status` int(1)                                                  NULL DEFAULT NULL COMMENT '论文被审核之后的状态(0退回修改1评审打分)',
    PRIMARY KEY (`lunwen_id`) USING BTREE,
    INDEX `student_id` (`student_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mangsheng
-- ----------------------------
DROP TABLE IF EXISTS `mangsheng`;
CREATE TABLE `mangsheng`
(
    `id`                 int(11)                                                 NOT NULL AUTO_INCREMENT COMMENT '主键,id',
    `student_id`         char(32) CHARACTER SET utf8 COLLATE utf8_general_ci     NULL DEFAULT NULL COMMENT '外键,学生id',
    `mangsheng_evaluate` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '盲审结论',
    PRIMARY KEY (`id`) USING BTREE,
    INDEX `student_id` (`student_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mdb
-- ----------------------------
DROP TABLE IF EXISTS `mdb`;
CREATE TABLE `mdb`
(
    `mdb_id`     int(11)                                                 NOT NULL AUTO_INCREMENT COMMENT '主键,免答辩id',
    `column1`    varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '申请理由',
    `column2`    varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '教师意见',
    `column3`    varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学校学位委员会意见',
    `student_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci     NULL DEFAULT NULL COMMENT '外键,学生id',
    `mdb_status` int(1)                                                  NULL DEFAULT NULL COMMENT '免答辩状态(0不允许1允许)',
    PRIMARY KEY (`mdb_id`) USING BTREE,
    INDEX `student_id` (`student_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message`
(
    `message_id`    int(11)                                                 NOT NULL AUTO_INCREMENT COMMENT '主键,消息id',
    `message_body`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '消息内容',
    `message_type`  int(1)                                                  NOT NULL COMMENT '消息类型(0留言1通知)',
    `teacher_id`    char(32) CHARACTER SET utf8 COLLATE utf8_general_ci     NULL DEFAULT NULL COMMENT '外键,导师id',
    `student_id`    char(32) CHARACTER SET utf8 COLLATE utf8_general_ci     NULL DEFAULT NULL COMMENT '外键,学生id',
    `create_date`   datetime(0)                                             NULL DEFAULT NULL COMMENT '创建时间',
    `response_date` datetime(0)                                             NULL DEFAULT NULL COMMENT '回复时间',
    PRIMARY KEY (`message_id`) USING BTREE,
    INDEX `teacher_id` (`teacher_id`) USING BTREE,
    INDEX `student_id` (`student_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 3
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message`
VALUES (2, '123456612', 1, NULL, '961eb0f8a2df465db07803ac867a0be1', NULL, NULL);

-- ----------------------------
-- Table structure for project
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project`
(
    `project_id`       int(11)                                                 NOT NULL AUTO_INCREMENT COMMENT '主键,课题id',
    `project_name`     varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL COMMENT '课题名',
    `project_describe` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '课题表述',
    `project_from_id`  int(11)                                                 NULL DEFAULT NULL COMMENT '外键,课题来源',
    `teacher_id`       char(32) CHARACTER SET utf8 COLLATE utf8_general_ci     NULL DEFAULT NULL COMMENT '外键,导师id',
    `student_id`       char(32) CHARACTER SET utf8 COLLATE utf8_general_ci     NULL DEFAULT NULL COMMENT '外键,学生id',
    PRIMARY KEY (`project_id`) USING BTREE,
    INDEX `teacher_id` (`teacher_id`) USING BTREE,
    INDEX `student_id` (`student_id`) USING BTREE,
    INDEX `project_from_id` (`project_from_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 13
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of project
-- ----------------------------
INSERT INTO `project`
VALUES (1, '毕设管理系统', '毕设管理系统', 1, 'b1f4f5972541435bacbfd7de7d3422ce', NULL);
INSERT INTO `project`
VALUES (2, '“蒙娜丽莎”婚庆影楼展示网站', '“蒙娜丽莎”婚庆影楼展示网站', 2, 'b1f4f5972541435bacbfd7de7d3422ce', NULL);
INSERT INTO `project`
VALUES (3, '高校教材管理系统', '管理教材的系统', 2, 'b1f4f5972541435bacbfd7de7d3422ce', NULL);
INSERT INTO `project`
VALUES (4, '对电商网站的研究', '', 1, '51308eb888734d208655e6374cf3d5b6', '182d39231cb3413e881d76b21a3fd393');
INSERT INTO `project`
VALUES (5, '易买网', '', 1, '51308eb888734d208655e6374cf3d5b6', NULL);
INSERT INTO `project`
VALUES (6, '电商网站管理系统', '电商网站管理系统', 1, '2f65cde569194dd4bda7259c98b883af',
        '4467aa7131d646e4911c9957da9e0644');
INSERT INTO `project`
VALUES (7, '物流管理系统', '物流网页', 1, '2f65cde569194dd4bda7259c98b883af', NULL);
INSERT INTO `project`
VALUES (8, '人事管理', '人事管理系统', 1, '2f65cde569194dd4bda7259c98b883af', NULL);
INSERT INTO `project`
VALUES (9, '企业管理', '企业管理系统', 1, '2f65cde569194dd4bda7259c98b883af', NULL);
INSERT INTO `project`
VALUES (10, '物联应用管理系统', '物联应用', 1, '2f65cde569194dd4bda7259c98b883af', NULL);
INSERT INTO `project`
VALUES (11, '人事', '人事', 1, '2f65cde569194dd4bda7259c98b883af', NULL);
INSERT INTO `project`
VALUES (12, '人事', '人事实现人员流动功能，请假等事项。', 1, '2f65cde569194dd4bda7259c98b883af', NULL);

-- ----------------------------
-- Table structure for project_from
-- ----------------------------
DROP TABLE IF EXISTS `project_from`;
CREATE TABLE `project_from`
(
    `project_from_id`   int(11)                                                NOT NULL AUTO_INCREMENT COMMENT '主键,id',
    `project_from_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课题来源(教师建议 学生拟定 企业和社会征集 科研单位提供)',
    PRIMARY KEY (`project_from_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 5
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of project_from
-- ----------------------------
INSERT INTO `project_from`
VALUES (1, '教师建议');
INSERT INTO `project_from`
VALUES (2, '学生拟定');
INSERT INTO `project_from`
VALUES (3, '企业和社会征集');
INSERT INTO `project_from`
VALUES (4, '科研单位提供');

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`
(
    `roles_id`   int(11)                                             NOT NULL AUTO_INCREMENT COMMENT '主键,角色id',
    `roles_name` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名（导师，学生，管理员，超级管理员）',
    PRIMARY KEY (`roles_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 5
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles`
VALUES (1, '教师');
INSERT INTO `roles`
VALUES (2, '学生');
INSERT INTO `roles`
VALUES (3, '教务管理员');
INSERT INTO `roles`
VALUES (4, '管理员');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`
(
    `student_id`       char(32) CHARACTER SET utf8 COLLATE utf8_general_ci     NOT NULL COMMENT '主键,学生id',
    `project_num`      int(1)                                                  NULL DEFAULT 0 COMMENT '课题数,只能选择一个课题',
    `good_boy`         int(1)                                                  NULL DEFAULT NULL COMMENT '是否免答辩(0否1是)',
    `project_id`       int(11)                                                 NULL DEFAULT NULL COMMENT '外键,课题',
    `teacher_id`       char(32) CHARACTER SET utf8 COLLATE utf8_general_ci     NULL DEFAULT NULL COMMENT '外键,导师id',
    `user_id`          char(32) CHARACTER SET utf8 COLLATE utf8_general_ci     NULL DEFAULT NULL COMMENT '外键,用户id',
    `class_id`         int(11)                                                 NULL DEFAULT NULL COMMENT '外键,班级id',
    `student_score`    int(11)                                                 NULL DEFAULT NULL COMMENT '成绩',
    `teacher_evaluate` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '导师评语(成绩评价)',
    `yansou_team_id`   int(11)                                                 NULL DEFAULT NULL COMMENT '外键,验收小组id',
    PRIMARY KEY (`student_id`) USING BTREE,
    INDEX `user_id` (`user_id`) USING BTREE,
    INDEX `teacher_id` (`teacher_id`) USING BTREE,
    INDEX `project_id` (`project_id`) USING BTREE,
    INDEX `class_id` (`class_id`) USING BTREE,
    INDEX `yansou_team_id` (`yansou_team_id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student`
VALUES ('182d39231cb3413e881d76b21a3fd393', 0, 0, NULL, '51308eb888734d208655e6374cf3d5b6',
        'bd5d63c3be7f46cca824db25de1600c9', 1, NULL, NULL, NULL);
INSERT INTO `student`
VALUES ('4467aa7131d646e4911c9957da9e0644', 0, 0, NULL, '2f65cde569194dd4bda7259c98b883af',
        '7783519cfde84877a7d9db909c2996cf', 1, NULL, '', NULL);
INSERT INTO `student`
VALUES ('961eb0f8a2df465db07803ac867a0be1', 0, 0, NULL, NULL, 'ac901d879c054023bbe396504c125e50', 1, NULL, '', 1);

-- ----------------------------
-- Table structure for subject
-- ----------------------------
DROP TABLE IF EXISTS `subject`;
CREATE TABLE `subject`
(
    `subject_id`   int(11)                                                NOT NULL AUTO_INCREMENT COMMENT '主键,id',
    `subject_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '专业名',
    PRIMARY KEY (`subject_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 2
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of subject
-- ----------------------------
INSERT INTO `subject`
VALUES (1, '软件工程');

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`
(
    `teacher_id`          char(32) CHARACTER SET utf8 COLLATE utf8_general_ci     NOT NULL COMMENT '主键,导师id',
    `teacher_describe`    varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '导师描述',
    `teacher_project_num` char(255) CHARACTER SET utf8 COLLATE utf8_general_ci    NULL DEFAULT NULL COMMENT '导师出题数,限制在8个',
    `user_id`             char(32) CHARACTER SET utf8 COLLATE utf8_general_ci     NULL DEFAULT NULL COMMENT '外键,用户id',
    `dept_id`             int(11)                                                 NULL DEFAULT NULL COMMENT '外键,部门id',
    `zhicheng`            char(20) CHARACTER SET utf8 COLLATE utf8_general_ci     NULL DEFAULT NULL COMMENT '职称',
    PRIMARY KEY (`teacher_id`) USING BTREE,
    INDEX `user_id` (`user_id`) USING BTREE,
    INDEX `dept_id` (`dept_id`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher`
VALUES ('2f65cde569194dd4bda7259c98b883af', '计算机科学', NULL, '4fe0e48ffdf34530a08c33dce567376e', 3, '副教授');
INSERT INTO `teacher`
VALUES ('51308eb888734d208655e6374cf3d5b6', 'C++方向', NULL, '9671bac9eda74d058b8cc11308e80e8e', 2, '副教授');
INSERT INTO `teacher`
VALUES ('8def6a97225145dda0cdee30c5a7a9ca', 'Android方向', NULL, 'd38bf5f29fab4dbcacb84e2fe56a353f', 1, '副教授');
INSERT INTO `teacher`
VALUES ('9c96bdf712a241028d90a3f0b9a93bed', 'Web方向', NULL, 'e7b6d96d15204b75aaaae4a2fc162287', 1, '副教授');
INSERT INTO `teacher`
VALUES ('9eac83d8e4e54d45b6df8a29e5e5d6da', '大数据方向', NULL, 'c1f4a807b7a14b95a7fb4541c259177f', 4, '副教授');
INSERT INTO `teacher`
VALUES ('b1f4f5972541435bacbfd7de7d3422ce', 'Java方向', '5', 'c5835ac820e6406dab23baa5bb446c7a', 1, '副教授');
INSERT INTO `teacher`
VALUES ('b8da6b7adc3a4a1e9b9f81f3e55ee3cb', 'Java方向', NULL, 'c58dd3d32fac48ccbb82da9e18a9c4bf', 1, '副教授');
INSERT INTO `teacher`
VALUES ('d446889b66a043a196317e84b0c734be', 'IOS方向', NULL, 'dd8909d0931449eebe6367179f40cbe2', 1, '副教授');
INSERT INTO `teacher`
VALUES ('ff47e87a0219455db66bc502f5d3dca0', '网络方向', NULL, 'c31a826c1b4c4315b6df48bc97d58454', 3, '副教授');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`
(
    `user_id`       char(32) CHARACTER SET utf8 COLLATE utf8_general_ci     NOT NULL COMMENT '主键,用户id',
    `user_name`     varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL COMMENT '用户名',
    `user_account`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL COMMENT '用户登录账号',
    `user_password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL COMMENT '密码',
    `user_tel`      char(12) CHARACTER SET utf8 COLLATE utf8_general_ci     NULL DEFAULT NULL COMMENT '用户电话号',
    `user_gender`   int(1)                                                  NULL DEFAULT NULL COMMENT '性别(0女1男)',
    `user_portrait` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像图片路径',
    `user_roles`    int(11)                                                 NULL DEFAULT NULL COMMENT '外键,用户角色(导师，学生，管理员，超级管理员）',
    PRIMARY KEY (`user_id`) USING BTREE,
    INDEX `user_roles` (`user_roles`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user`
VALUES ('033f09ab78de408fb558e9db38c4b38a', '123456', '123456', 'e10adc3949ba59abbe56e057f20f883e', '124214124', 1,
        '../img/a2.jpg', 2);
INSERT INTO `user`
VALUES ('24dd83ee511e47588ea95571a5971057', 'www', '456456123', 'e10adc3949ba59abbe56e057f20f883e', '1231231', 1,
        '../img/a2.jpg', 2);
INSERT INTO `user`
VALUES ('2feede4cc7354052844c8d35b46a0ba3', 'ccc', '123111', 'e10adc3949ba59abbe56e057f20f883e', '123111', 1,
        '../img/a2.jpg', 2);
INSERT INTO `user`
VALUES ('4fe0e48ffdf34530a08c33dce567376e', '张老师', 'teacher', 'e10adc3949ba59abbe56e057f20f883e', '18337953710', 1,
        '../img/maoli.jpg', 1);
INSERT INTO `user`
VALUES ('56058e923178421c91127ed16c8dd008', '素还真', '999666', '11df9baea40a071c081c0fdb149911bf', '18337953710', 1,
        '../img/a2.jpg', 2);
INSERT INTO `user`
VALUES ('7783519cfde84877a7d9db909c2996cf', '路同学', '778899', '08ef84145b81dcd98554b70c662c41ed', '10883795310', 1,
        '../img/a2.jpg', 2);
INSERT INTO `user`
VALUES ('848572f7312e4470a26257727af2a369', '王管理员', 'admin', '96e79218965eb72c92a549dd5a330112', '123456', 0, NULL,
        4);
INSERT INTO `user`
VALUES ('9671bac9eda74d058b8cc11308e80e8e', '陈老师', '999999', '52c69e3a57331081823331c4e69d3f2e', '18337953729', 1,
        '../img/a1.jpg', 1);
INSERT INTO `user`
VALUES ('ac901d879c054023bbe396504c125e50', '李展', '141164514', 'b5328699e17e600d0a8e334e83fd8a90', '18300000000', 1,
        '../img/wo.png', 2);
INSERT INTO `user`
VALUES ('bd5d63c3be7f46cca824db25de1600c9', '索xx', '000000', '670b14728ad9902aecba32e22fa4f6bd', '18337953700', 1,
        '../img/a2.jpg', 2);
INSERT INTO `user`
VALUES ('c1f4a807b7a14b95a7fb4541c259177f', '高老师', '222222', 'e3ceb5881a0a1fdaad01296d7554868d', '18337953722', 1,
        '../img/a2.jpg', 1);
INSERT INTO `user`
VALUES ('c31a826c1b4c4315b6df48bc97d58454', '刘老师', '888888', 'e10adc3949ba59abbe56e057f20f883e', '18337953728', 1,
        '../img/a2.jpg', 1);
INSERT INTO `user`
VALUES ('c5835ac820e6406dab23baa5bb446c7a', '甘老师', '112233', 'd0970714757783e6cf17b26fb8e2298f', '18337953766', 0,
        '../img/gan.png', 1);
INSERT INTO `user`
VALUES ('c58dd3d32fac48ccbb82da9e18a9c4bf', '赵老师', '123321', 'c8837b23ff8aaa8a2dde915473ce0991', '18337953725', 1,
        NULL, 1);
INSERT INTO `user`
VALUES ('d38bf5f29fab4dbcacb84e2fe56a353f', '孙老师', '777777', 'f63f4fbc9f8c85d409f2f59f2b9e12d5', '18337353727', 0,
        NULL, 1);
INSERT INTO `user`
VALUES ('dd8909d0931449eebe6367179f40cbe2', '李刚老师', '666666', 'f379eaf3c831b04de153469d1bec345e', '18337953723', 1,
        NULL, 1);
INSERT INTO `user`
VALUES ('e2ebc908988549d4a4fd3f85e3bb0f7a', 'www', '456456123', 'e10adc3949ba59abbe56e057f20f883e', '1231231', 1,
        '../img/a2.jpg', 2);
INSERT INTO `user`
VALUES ('e7b6d96d15204b75aaaae4a2fc162287', '李丽老师', '777777', 'f63f4fbc9f8c85d409f2f59f2b9e12d5', '18337953724', 0,
        NULL, 1);

-- ----------------------------
-- Table structure for work_time
-- ----------------------------
DROP TABLE IF EXISTS `work_time`;
CREATE TABLE `work_time`
(
    `work_time_id`    int(11)                                                NOT NULL AUTO_INCREMENT COMMENT '主键,id',
    `work_time_info`  varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '描述',
    `work_time_start` date                                                   NOT NULL COMMENT '开始时间',
    `work_time_end`   date                                                   NOT NULL COMMENT '结束时间',
    PRIMARY KEY (`work_time_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 6
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of work_time
-- ----------------------------
INSERT INTO `work_time`
VALUES (1, '选择课题', '2024-08-01', '2024-08-31');
INSERT INTO `work_time`
VALUES (2, '开题报告', '2024-08-01', '2024-08-28');
INSERT INTO `work_time`
VALUES (3, '中期检查', '2024-08-11', '2024-08-31');
INSERT INTO `work_time`
VALUES (4, '系统验收', '2024-08-01', '2024-08-30');
INSERT INTO `work_time`
VALUES (5, '毕业答辩', '2024-08-01', '2024-08-31');

-- ----------------------------
-- Table structure for yansou_teacher
-- ----------------------------
DROP TABLE IF EXISTS `yansou_teacher`;
CREATE TABLE `yansou_teacher`
(
    `id`             int(11)                                             NOT NULL AUTO_INCREMENT COMMENT '主键,id',
    `yansou_team_id` int(11)                                             NOT NULL COMMENT '外键,验收组id',
    `teacher_id`     char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '外键,教师id',
    `is_leader`      int(1)                                              NOT NULL COMMENT '是否为组长(0否1是)',
    PRIMARY KEY (`id`) USING BTREE,
    INDEX `yansou_team_id` (`yansou_team_id`) USING BTREE,
    INDEX `teacher_id` (`teacher_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 4
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yansou_teacher
-- ----------------------------
INSERT INTO `yansou_teacher`
VALUES (1, 1, 'b1f4f5972541435bacbfd7de7d3422ce', 1);
INSERT INTO `yansou_teacher`
VALUES (2, 1, '51308eb888734d208655e6374cf3d5b6', 0);
INSERT INTO `yansou_teacher`
VALUES (3, 1, 'ff47e87a0219455db66bc502f5d3dca0', 0);

-- ----------------------------
-- Table structure for yansou_team
-- ----------------------------
DROP TABLE IF EXISTS `yansou_team`;
CREATE TABLE `yansou_team`
(
    `yansou_team_id`   int(11)                                                NOT NULL AUTO_INCREMENT COMMENT '主键,id',
    `yansou_team_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '验收小组编号',
    PRIMARY KEY (`yansou_team_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 2
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yansou_team
-- ----------------------------
INSERT INTO `yansou_team`
VALUES (1, '验收一组');

-- ----------------------------
-- Table structure for zqjc
-- ----------------------------
DROP TABLE IF EXISTS `zqjc`;
CREATE TABLE `zqjc`
(
    `zqjc_id`    int(11)                                                 NOT NULL AUTO_INCREMENT COMMENT '主键,中期检查表id',
    `column1`    varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '已完成内容',
    `column2`    varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '未完成内容及原因',
    `column3`    varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '指导老师意见',
    `column4`    varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
    `student_id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci     NULL DEFAULT NULL COMMENT '外键,学生id',
    PRIMARY KEY (`zqjc_id`) USING BTREE,
    INDEX `student_id` (`student_id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8
  COLLATE = utf8_general_ci
  ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
