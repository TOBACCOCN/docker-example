create database smart_glass character set utf8;

-- you must change user and password with yourself
-- dev
create user 'test'@'%' identified by 'test';
grant all PRIVILEGES on smart_glass.* to 'test'@"%";
-- fat
-- create user 'smart_glass'@'%' identified by 'smart_glass';
-- grant all PRIVILEGES on smart_glass.* to 'smart_glass'@"%";
-- pro
-- create user 'smart_glass'@'%' identified by 'smart_glass';
-- grant all PRIVILEGES on smart_glass.* to 'smart_glass'@"%";

use smart_glass;

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户编号',
  `nick_name` varchar(50) DEFAULT NULL COMMENT '昵称',
  `avatar` MEDIUMTEXT DEFAULT NULL COMMENT '头像',
  `gender` varchar(6) DEFAULT NULL COMMENT '性别（male：男，female：女）',
  `birthday` varchar(10) DEFAULT NULL COMMENT '出生年月日，格式 yyyy-MM-dd',
  `phone` varchar(50) NOT NULL UNIQUE COMMENT '手机号',
  `password` varchar(50) NOT NULL COMMENT '密码',
  `salt` varchar(50) NOT NULL COMMENT '盐（用于密码加固）',
  `create_time` varchar(24) DEFAULT NULL COMMENT '创建时间（UTC）',
  `update_time` varchar(24) DEFAULT NULL COMMENT '更新时间（UTC）',
    PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1209802236704243714 DEFAULT CHARSET=utf8mb4 COMMENT='用户表';

DROP TABLE IF EXISTS `wechat_user`;
CREATE TABLE `wechat_user` (
  `user_id` varchar(50) NOT NULL COMMENT '会员 ID',
  `name` varchar(50) NOT NULL COMMENT '姓名',
  `mobile` varchar(50) NOT NULL COMMENT '手机号',
  `create_time` varchar(50) NOT NULL COMMENT '创建时间（时间戳）',
  `virtual_currency` varchar(50) NOT NULL COMMENT '虚拟币',
  `points` varchar(50) NOT NULL COMMENT '当前积分',
  `superior_user_id` varchar(50) NOT NULL COMMENT '直属上级 ID',
  `top_user_id` varchar(50) NOT NULL COMMENT '二级上级 ID',
  `three_user_id` varchar(50) NOT NULL COMMENT '三级上级 ID',
  `openid` varchar(50) NOT NULL COMMENT '微信 openid',
  `unionid` varchar(50) NOT NULL COMMENT '微信 unionid',
  `subscribe` varchar(50) NOT NULL COMMENT '是否关注公众号（0：未关注；1：已关注）',
  `nickname` varchar(50) NOT NULL COMMENT '微信昵称',
  `sex` varchar(50) NOT NULL COMMENT '性别（1：男性；2：女性；0：未知）',
  `headimgurl` varchar(200) NOT NULL COMMENT '微信头像',
  `superior_user_unionid` varchar(50) NOT NULL COMMENT '直属上级 unionid',
  `top_user_unionid` varchar(50) NOT NULL COMMENT '二级上级 unionid',
  `three_user_unionid` varchar(50) NOT NULL COMMENT '三级上级 unionid',
  `is_agent` varchar(50) NOT NULL COMMENT '是否为分销商',
  `total_count` varchar(50) NOT NULL COMMENT '总订单笔数',
  `total_price` varchar(50) NOT NULL COMMENT '总消费金额',
  `total_points` varchar(50) NOT NULL COMMENT '总共获得的积分',
  `rank_id` varchar(50) NOT NULL COMMENT '会员等级 id',
  `rank_name` varchar(50) NOT NULL COMMENT '会员等级名称',
  `balance` varchar(50) NOT NULL COMMENT '买家账户余额',
  `remaining_commission` varchar(50) NOT NULL COMMENT '佣金余额',
  `user_update_time` varchar(50) NOT NULL COMMENT '会员信息最近更新时间',
    PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='微信用户表';

DROP TABLE IF EXISTS `apple_account`;
CREATE TABLE `apple_account` (
  `user_id` bigint(20) NOT NULL COMMENT '用户编号',
  `apple_user_id` varchar(50) NOT NULL COMMENT '苹果用户在我方苹果开发者这边的用户编号',
  `create_time` varchar(24) DEFAULT NULL COMMENT '创建时间（UTC）'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='苹果用户表';

DROP TABLE IF EXISTS `device`;
CREATE TABLE `device` (
  `device_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '设备编号',
  `one_net_device_id` varchar(20) NOT NULL COMMENT '设备在 OneNET 平台的编号',
  `imei` varchar(50) NOT NULL UNIQUE COMMENT '国际移动设备识别码',
  `imsi` varchar(50) NOT NULL UNIQUE COMMENT '国际移动用户识别码',
  `create_time` varchar(24) NOT NULL COMMENT '创建时间（UTC）',
    PRIMARY KEY (`device_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1209802236704243714 DEFAULT CHARSET=utf8mb4 COMMENT='设备表';

DROP TABLE IF EXISTS `user_device`;
CREATE TABLE `user_device` (
  `user_id` bigint(20) NOT NULL COMMENT '用户编号',
  `device_id` bigint(20) NOT NULL COMMENT '设备编号',
  `is_host` tinyint(1) NOT NULL COMMENT '是否是主人（0：否，1：是）',
  `can_control` tinyint(1) NOT NULL COMMENT '是否可以控制设备（0：否，1：是）',
  `bound` tinyint(1) NOT NULL COMMENT '是否已绑定（0：否，1：是）',
  `bind_time` varchar(24) NOT NULL COMMENT '绑定时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户设备表';

DROP TABLE IF EXISTS `vision_record`;
CREATE TABLE `vision_record` (
  `user_id` bigint(20) NOT NULL COMMENT '用户编号',
  `time` bigint(13) NOT NULL COMMENT '记录时间戳',
  `dioptric_type` varchar(100) NOT NULL COMMENT '屈光类型（myopia：近视，farsightedness：远视，presbyopia：老花，amblyopia：弱视，多个用半角逗号拼接）',
  `left_eye_degree` int(4) NOT NULL COMMENT '左眼度数',
  `right_eye_degree` int(4) NOT NULL COMMENT '右眼度数',
  `left_astigmastism_degree` int(4) NOT NULL COMMENT '左眼散光度数',
  `right_astigmastism_degree` int(4) NOT NULL COMMENT '右眼散光度数',
  `left_axis` int(4) NOT NULL COMMENT '左眼轴位',
  `right_axis` int(4) NOT NULL COMMENT '右眼轴位',
  `left_eye_vision` double NOT NULL COMMENT '左眼视力',
  `right_eye_vision` double NOT NULL COMMENT '右眼视力',
  `double_eye_vision` double NOT NULL COMMENT '双眼视力',
  `left_eye_corrective_vision` double NOT NULL COMMENT '左眼矫正视力',
  `right_eye_corrective_vision` double NOT NULL COMMENT '左眼矫正视力',
  `double_eye_corrective_vision` double NOT NULL COMMENT '双眼矫正视力',
  `trained_time` int(10) NOT NULL COMMENT '已训练时长，单位分钟'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='视力记录表';

DROP TABLE IF EXISTS `purchase_record`;
CREATE TABLE `purchase_record` (
  `user_id` bigint(20) NOT NULL COMMENT '用户编号',
  `time` varchar(24) NOT NULL COMMENT '事件时间',
  `purchase_length` int(10) NOT NULL COMMENT '购买时长，单位分钟',
  `left_time_before_purchase` int(10) NOT NULL COMMENT '购买前剩余时长，单位分钟',
  `left_time_after_purchase` int(10) NOT NULL COMMENT '购买后剩余时长，单位分钟'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='购买记录表';

DROP TABLE IF EXISTS `device_usage_record`;
CREATE TABLE `device_usage_record` (
  `user_id` bigint(20) NOT NULL COMMENT '用户编号',
  `device_id` bigint(20) NOT NULL COMMENT '设备编号',
  `date` varchar(10) NOT NULL COMMENT '日期',
  `time` int(10) NOT NULL COMMENT '设备记录使用时长时的时间戳',
  `count` int(10) NOT NULL COMMENT '佩戴次数',
  `usage_length` int(10) NOT NULL COMMENT '训练时长，单位分钟'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='设备使用记录表';

DROP TABLE IF EXISTS `train_time`;
CREATE TABLE `train_time` (
  `user_id` bigint(20) NOT NULL COMMENT '用户编号',
  `left_time` int(10) NOT NULL COMMENT '剩余训练时长，单位分钟',
  `used_time` int(10) NOT NULL COMMENT '已用训练时长，单位分钟',
   `reward_points` int(11) DEFAULT NULL COMMENT '积分',
      PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='训练时长表';

DROP TABLE IF EXISTS `usual_problem`;
CREATE TABLE `usual_problem` (
  `problem_id` bigint(20) NOT NULL COMMENT '问题编号',
  `question` varchar(80) NOT NULL COMMENT '问题',
  `answer` varchar(80) NOT NULL COMMENT '答案'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='常见问题表';

DROP TABLE IF EXISTS `customer_service`;
CREATE TABLE `customer_service` (
  `customer_telephone` varchar(20) NOT NULL COMMENT '客服电话'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='客服表';

DROP TABLE IF EXISTS `ios_update`;
CREATE TABLE `ios_update` (
  `version` varchar(20) NOT NULL COMMENT '当前版本',
  `url` varchar(200) NOT NULL COMMENT 'APP 更新地址'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='iOS 应用更新表';
