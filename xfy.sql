set names utf8;
drop database if exists xfy;
create database xfy charset='utf8';
use xfy;
-- #管理员信息表
create table xfy_admin(
  aid int primary key auto_increment,
  aname varchar(32) unique,
  apwd varchar(64)
);
insert into xfy_admin values(null,'tom','123456');
insert into xfy_admin values(null,'cr7','123456');
-- 项目全局设置
create table xfy_settings(
  sid int,
  addName varchar(32),  #店家名称
  apiUrl varchar(64),   #数据API子系统地址
  adminUrl varchar(64), #管理后台子系统地址
  appUrl  varchar(64),  #顾客App子系统地址
  icp   varchar(64),    #系统备案号
  copyright  varchar(128) #系统版权声明
);
insert into xfy_settings values(1,'小肥羊','127.0.0.1:3000','192.168.0.1','172.166.0.1','dasfsdafsadfdsaf','版权说明');
-- 桌台信息表
create table xfy_table(
  tid int primary key auto_increment, #桌台编号
  tname varchar(64),  #桌台昵称
  type  varchar(16),  #桌台类型
  status int   #1 空闲  2-预定  3-占用  0-其他
);
insert into xfy_table values(null,'荣华富贵','10',1);
insert into xfy_table values(null,'百合厅','12',0);
insert into xfy_table values(null,'合家欢乐','5',1);
insert into xfy_table values(null,'郁金香厅','2',2);
insert into xfy_table values(null,'大榕树','4',3);
insert into xfy_table values(null,'小桥流水','6',1);
insert into xfy_table values(null,'大前门','8',2);

-- 桌台预定信息表
create table xfy_reservation(
  rid int primary key auto_increment,
  contactName varchar(64), #联系人姓名
  phone varchar(11), #联系人电话
  contactTime bigInt,   #联系时间
  dinnerTime bigInt    #预约的用餐时间
);
insert into xfy_reservation values(null,'张三','18231554560',now(),1254648645);
-- 菜品的类别
create table xfy_category(
  cid int primary key auto_increment,
  cname varchar(64)  #类别名称
);

-- 菜品信息表
create table xfy_dish(
  did int primary key auto_increment,
  title varchar(32), #菜品名称/标题
  imgUrl varchar(128), #图片地址
  price decimal(6,2), #菜品价格
  detail varchar(128), #详细信息
  categoryId int,    #所属的类别编号
  foreign key(categoryId) reference xfy_category(cid)
);

--订单表
  create table xfy_order(
    oid int primary auto_increment,
    startTime bigint,
    endTime bigint,
    customerCount int,   #用餐人数
    tableId int,
    foreign key(tableId) reference xfy_table(tid)
  );
-- 订单详情
  create table xfy_order_detail(
    did int primary key auto_increment,
    dishId int,    #点的菜品编号
    dishCount int, #菜品数量
    customerName varchar(64), #点餐用户
    orderId int,  #属于哪个订单的详情
    foreign key(dishId) reference xfy_dish(did),
    foreign key(orederId) reference xfy_order(oid)
  );
 















