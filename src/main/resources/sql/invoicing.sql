drop table if exists employee;
create table employee(
	stid int(6) not null auto_increment primary key,
    username varchar(20) not null comment '用户名',
    password varchar(20) not null comment '密码',
    name varchar(10) not null comment '姓名',
    email varchar(20) comment '邮箱',
    telephone varchar(11) comment '手机号码',
    address varchar(40) comment '家庭地址',
    gender varchar(6) not null comment '性别',
    birthday date comment '出生日期',
    depName varchar(30) not null comment '部门名字',
    lastLoginTime date comment '最后一次登录的时间',
    lastLoginIp varchar(30) comment '最后一次登录的Ip地址'
)DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

部门表：department(id,部门名字，电话号码):
drop table if exists department;
create table department(
deid int(6) not null auto_increment comment '部门ID',
name varchar(30) not null comment '部门名字',
telephone varchar(20) not null comment '部门电话号码',
primary key(deid)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
数据：
Insert into department values(1,'总裁办','8888');
Insert into department values(2,'采购部','8888');
Insert into department values(3,'销售部','8888');
Insert into department values(4,'运输中心','8888');
Insert into department values(5,'库管中心','8888');
Insert into department values(6,'人力资源','8888');
Insert into department values(7,'财务部','8888');
Insert into department values(8,'市场部','8888');

商品表：goods(id,名字,起源地，出厂商，单位，进货价，出货价，商品类型Id，使用数量，最小数量，最大数量)
drop table if exists goods;
create table goods(
goid int(6) not null auto_increment primary key comment '商品ID',
name varchar(30) not null comment '商品名字',
origin varchar(30) default null comment '起源地',
producer varchar(30) not null comment '出产商' ,
unit varchar(10) not null comment '单位',
inPrice double(10,2) default null comment '进货价',
outPrice double(10,2) default null comment '出货价',
goodstypeId int(6) default null comment '商品类型Id',
useNum int(10) default null comment '使用数量',
minNum int(10) default null comment '最小数量',
maxNum int(10) default null comment '最大数量'
)ENGINE=InnoDB auto_increment=1 default charset=utf8;
数据：
insert into goods values(1,'辣条(10g)', '四川', '成都辣条厂', '箱', '1.00', '11.00', 1, 6, 15, 100);
insert into goods values(2,'辣条(100g)', '四川', '四川辣条厂', '袋', '2.00', '22.00', 1, 6, 15, 100);
insert into goods values(3,'老干妈超辣', '湖南', '老干妈家', '箱', '3.00', '33.00', 1, 6, 15, 100);
insert into goods values(4,'老干妈麻辣', '湖南', '老干妈家', '箱', '4.00', '44.00', 1, 6, 15, 100);
insert into goods values(5,'老干妈BT辣', '湖南', '老干妈家', '箱', '5.00', '55.00', 1, 6, 15, 100);
insert into goods values(6,'王致和臭豆腐', '湖南', '王致和家', '箱', '6.00', '66.00', 1, 6, 15, 100);
insert into goods values(7,'罗技鼠标', '广东', '广东电子元件厂', '个', '7.00', '77.00', 1, 6, 15, 100);
insert into goods values(8,'散热器大', '广东', '广东电子元件厂', '个', '8.00', '88.00', 1, 6, 15, 100);
insert into goods values(9,'散热器中', '广东', '广东电子元件厂', '个', '9.00', '99.00', 1, 6, 15, 100);
insert into goods values(10,'麻辣鱼', '湖南', '长沙辣条厂', '箱', '1.00', '10.00', 100.00, 6, 15, 100);


商品类型表：goodstype(id,名字，供应商Id)
drop table if exists goodstype;
create table goodstype(
gsid int(6) not null auto_increment primary key comment '商品类型Id',
name varchar(20) not null comment '商品类型名',
suid int(6) not null comment '供应商Id'
)ENGINE=InnoDB auto_increment=1 default charset=utf8;
数据：
insert into goodstype values(1,'辣条',1);
insert into goodstype values(2,'老干妈辣酱',1);
insert into goodstype values(3,'臭豆腐',1);
insert into goodstype values(4,'薯片',1);
insert into goodstype values(5,'鼠标',2);
insert into goodstype values(6,'散热器',2);
insert into goodstype values(7,'键盘',2);
insert into goodstype values(8,'烤鸭',3);

订单表：order(id,订单编号，创建者，创建时间，审批者，审批时间，完成者，结束时间，订单类型，类型，全部数量，全部价格，供应商Id)
drop table if exists order;
create table order(
orid bigint(10) not null auto_increment primary key comment '订单Id',
orderNum varchar(30) not null comment '订单编号',
creater varcahr(20) not null comment '创建人',
createTime date not null comment '创建时间',
checker varchar(20) default null comment '审批人',
checkTime date default null comment '审批时间',
completer varchar(20) default null comment '跟单人',
endTime date default null comment '结束时间',
orderType varchar(6) not null comment '订单类型',
type varcahr(6) not null comment '类型',
totalNum int(10) not null comment '全部数量',
totalPrice double(10,2) not null comment '全部价格',
supplierId int(6) not null comment '供应商Id'
)ENGINE=InnoDB auto_increment=1 default charset=utf8;

订单详细表：orderdetail(id,商品id,价格,订单id,订单数量，剩余)
drop table if exists orderdetail;
create table orderdetail(
odid int(6) not null aotu_increment primary key comment '订单详细表Id',
goodsId int(6) not null comment '商品id',
price double(10,2) not null comment '价格',
orderId int(6) not null comment '订单表Id',
num int(10) not null comment '订单数量',
surplus int(10) not null comment '剩余'
)ENGINE=InnoDB auto_increment=1 default charset=utf8;

角色表：role(id,角色名字,角色代码)
drop table if exists role;
create table role(
roid int(6) not null acto_increment primary key comment 'Id',
name varchar(20) not null comment '角色名字',
code varchar(20) not null comment '角色代码'
)ENGINE=InnoDB auto_increment=1 default charset=utf8
数据：
insert into role values(1,'系统管理员','admin');
insert into role values(2,'采购主管','buymgr');
insert into role values(3,'采购专员','buyer');
insert into role values(4,'销售主管','salemgr');
insert into role values(5,'销售专员','saler');
insert into role values(6,'跟单员','follower');
insert into role values(7,'仓库管理员','storemgr');
insert into role values(8,'人力资源总监','hrmgr');
insert into role values(9,'人力资源专员','hr');

仓库表：store(id,仓库名字，仓库地址，雇佣者id)
drop table if exists store;
create table store(
stid int(6) not null auto_increment primary key comment 'Id',
name varchar(30) not null comment '仓库名字',
address varchar(30) not null comment '仓库地址',
empId int(6) not null comment '雇佣者id' 
)ENGINE=InnoDB auto_increment=1 default charset=utf8;
数据：
insert into store values(1,'服装仓库','广州市天河区1号',1);
insert into store values(2,'食品仓库','广州市天河区2号',2);
insert into store values(3,'机械制品仓库','广州市天河区3号',3);
insert into store values(4,'玩具仓库','广州市天河区4号',4);
insert into store values(5,'书包仓库','广州市天河区5号',5);
insert into store values(6,'电脑仓库','广州市天河区6号',6);

仓库详细表：storedetail(id,仓库id,商品id,商品数量)
drop table if exists storedetail;
create table storedetail(
sdid int(6) not null auto_increment primary key comment 'Id',
storeId int(6) not null comment '仓库Id',
goodsId int(6) not null comment '商品Id',
num int(10) not null comment'商品数量'
)ENGINE=InnoDB auto_increment=1 default charset=utf8;

供应商表：supplier(id,名字，地址，联络人，手机号码，需求)
drop table if exists supplier;
create table supplier(
suid int(6) not null auto_increment primary key comment 'Id',
name varchar(20) not null comment '供应商姓名',
address varchar(60) not null comment '地址',
contact varchar(20) not null comment '联络人',
telephone varchar(20) not null comment '电话号码',
needs int(1) not null comment '1送货自提,2...'
)ENGINE=InnoDB auto_increment=1 default charset=utf8;
数据：
insert into supplier values(1,'长沙小食品批发总公司','长沙辣条街1号','张三','132',1);
insert into supplier values(2,'北京特产批发总公司','北京王府井大街4号','李四','135',1);
insert into supplier values(3,'中腾建华楼下小卖店','中腾建华1楼','王五','136',1);


策略模式指：策略模式指将程序中可变部分抽象分离成一系列的算法，并将每一个算法封装起来，而且使它们还可以相互替换。策略模式让算法独立于使用它的客户而独立变化。
策略模式一般由下面三部分组成：