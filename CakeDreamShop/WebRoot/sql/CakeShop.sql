/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

SET FOREIGN_KEY_CHECKS=0;

DROP DATABASE IF EXISTS `mycakeshop`;

CREATE DATABASE `mycakeshop`
    CHARACTER SET 'utf8'
    COLLATE 'utf8mb3_bin';

USE `mycakeshop`;

#
# Structure for the `admin` table :
#

CREATE TABLE `admin` (
                         `username` varchar(20) NOT NULL,
                         `password` varchar(20) NOT NULL,
                         PRIMARY KEY  (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `bank` (
                        `username` varchar(20) NOT NULL,
                        `cardname` varchar(20) NOT NULL,
                        `password` varchar(20) NOT NULL,
                        `money` double(20,3) default NULL,
                        PRIMARY KEY  (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `moneylog` (
                            `logid` varchar(20) NOT NULL,
                            `username` varchar(20) NOT NULL,
                            `money` double(15,3) default NULL,
                            `time` varchar(30) default NULL,
                            PRIMARY KEY  (`logid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `product` (
                           `pid` varchar(20) NOT NULL,
                           `ptype` int(1) NOT NULL ,
                           `pname` varchar(50) NOT NULL,
                           `price` double(15,3) NOT NULL,
                           `pcount` int(11) default NULL,
                           `imgpath` varchar(80) default NULL,
                           PRIMARY KEY  (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `user` (
                        `username` varchar(20) NOT NULL,
                        `password` varchar(20) NOT NULL,
                        `email` varchar(20) NOT NULL,
                        `tel` varchar(20) default NULL,
                        `address` varchar(20) default NULL,
                        `sex` varchar(20) default NULL,
                        `age` int(11) default NULL,
                        `regtime` varchar(30) default NULL,
                        PRIMARY KEY  (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `useraccount` (
                               `username` varchar(20) NOT NULL,
                               `money` double(15,3) default NULL,
                               PRIMARY KEY  (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `userform` (
                            `id` int(11) NOT NULL auto_increment,
                            `fid` varchar(20) NOT NULL,
                            `username` varchar(20) NOT NULL,
                            `ptype` int(1) NOT NULL,
                            `pname` varchar(50) NOT NULL,
                            `proprice` double(15,3) default NULL,
                            `count` int(11) default NULL,
                            `time` varchar(32) default NULL,
                            `summoney` double(15,3) default NULL,
                            `status` int(1) default 0,
                            PRIMARY KEY  (`id`),
                            UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `ScoreForm`(
                            `username` varchar(20) NOT NULL,
                            `pid` varchar(20) NOT NULL,
                            `StarRate` double(3,2) CHECK ( StarRate>=0 AND StarRate<=5 ),
                            UNIQUE  (`username`,`pid`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO scoreform (`username`, `pid`,`StarRate`) VALUES
('user1','P001',4.5),
('user1','P003',3.2),
('user1','P009',4.6),
('user2','P001',2.5),
('user2','P008',3.9),
('user3','P002',3.5),
('user3','P011',4.8),
('user3','P005',3.5),
('user4','P003',3.7),
('user4','P010',3.4),
('user5','P007',4.3),
('user5','P002',2.1),
('user6','P005',3.7),
('user6','P007',4.0),
('user7','P002',3.7),
('user8','P003',3.9),
('user9','P005',4.2),
('user10','P005',3.9),
('user11','P006',3.5),
('user12','P007',3.6),
('user13','P002',2.7),
('user14','P006',2.8),
('user15','P004',2.3),

('user7','P009',3.5),
('user8','P012',3.5),
('user9','P008',3.5),
('user10','P010',3.5),
('user11','P011',3.5),
('user12','P003',3.5),
('user13','P012',3.5),
('user14','P008',3.5);

#
# Data for the `admin` table  (LIMIT 0,500)
#

INSERT INTO `admin` (`username`, `password`) VALUES
('admin','admin');


COMMIT;

#
# Data for the `bank` table  (LIMIT 0,500)
#

INSERT INTO `bank` (`username`,`cardname`, `password`, `money`) VALUES
('admin','admin','admin',999429999),
('user1','user1_ForTest','123456',0);

COMMIT;

#
# Data for the `moneylog` table  (LIMIT 0,500)
#

/*INSERT INTO `moneylog` (`logid`, `username`, `money`, `time`) VALUES
('L2020429269734','user1',500,'2020年11月27日08时21分09秒 '),
('L2020429270484','user2',500,'2020年01月27日06时21分10秒 ');

COMMIT;*/

#
# Data for the `product` table  (LIMIT 0,500)
#

INSERT INTO `product` (`pid`, `ptype`,`pname`, `price`, `pcount`, `imgpath`) VALUES
('P000',0,'fail_to_rec',0,0,'http://localhost:8080/MyCakeDreamShop_war_exploded/CakeImage/fail_to_rec.png'),
('P001',1,'BlueberryCake',150,100,'http://localhost:8080/MyCakeDreamShop_war_exploded/CakeImage/pic01.jpg'),
('P002',1,'ChickenCheeseCake',150,100,'http://localhost:8080/MyCakeDreamShop_war_exploded/CakeImage/pic02.jpg'),
('P003',1,'BrownieCake',150,50,'http://localhost:8080/MyCakeDreamShop_war_exploded/CakeImage/pic03.jpg'),
('P004',1,'RabbitMatchaCake',150,100,'http://localhost:8080/MyCakeDreamShop_war_exploded/CakeImage/pic04.jpg'),
('P005',1,'CherryCake',150,100,'http://localhost:8080/MyCakeDreamShop_war_exploded/CakeImage/pic05.jpg'),
('P006',1,'BearChocolateCake',150,100,'http://localhost:8080/MyCakeDreamShop_war_exploded/CakeImage/pic06.jpg'),
('P007',2,'Hawaiian_IceCream_Soda',35,50,'http://localhost:8080/MyCakeDreamShop_war_exploded/CakeImage/Drink01.png'),
('P008',2,'Strawberry_Matcha_Coconut',35,50,'http://localhost:8080/MyCakeDreamShop_war_exploded/CakeImage/Drink02.png'),
('P009',2,'Cherry_Oolong_MilkTea',35,50,'http://localhost:8080/MyCakeDreamShop_war_exploded/CakeImage/Drink03.png'),
('P010',2,'Mango_Lemon_Tea',35,50,'http://localhost:8080/MyCakeDreamShop_war_exploded/CakeImage/Drink04.png'),
('P011',2,'GreenGrape_Yogurt',35,50,'http://localhost:8080/MyCakeDreamShop_war_exploded/CakeImage/Drink05.png'),
('P012',2,'Berry_Oolong_Soda',35,50,'http://localhost:8080/MyCakeDreamShop_war_exploded/CakeImage/Drink06.png');

COMMIT;

#
# Data for the `user` table  (LIMIT 0,500)
#

INSERT INTO `user` (`username`, `password`, `email`, `tel`, `address`, `sex`, `age`, `regtime`) VALUES
('user1','123456','cake19@126.com','19951652617','GuangZhou','male',20,'2023年01月27日08时15分57秒'),
('user2','123456','cake20@126.com','19951652610','GuangZhou','female',19,'2023年01月27日09时19分57秒'),
('user3','123456','cake21@126.com','19951652611','GuangZhou','male',19,'2023年01月27日09时20分57秒'),
('user4','123456','cake22@126.com','19951652612','GuangZhou','female',19,'2023年01月27日09时21分57秒'),
('user5','123456','cake23@126.com','19951652613','GuangZhou','male',19,'2023年01月27日09时22分57秒'),
('user6','123456','cake24@126.com','19951652614','GuangZhou','male',19,'2023年01月27日09时23分57秒'),
('user7','123456','cake25@126.com','19951652615','GuangZhou','male',19,'2023年01月27日09时24分57秒'),
('user8','123456','cake26@126.com','19951652616','GuangZhou','male',19,'2023年01月27日09时25分57秒'),
('user9','123456','cake27@126.com','19951652617','GuangZhou','male',19,'2023年01月27日09时26分57秒'),
('user10','123456','cake28@126.com','19951652618','GuangZhou','female',19,'2023年01月27日09时27分57秒'),
('user11','123456','cake29@126.com','19951652620','GuangZhou','male',19,'2023年01月27日09时28分57秒'),
('user12','123456','cake30@126.com','19951652621','GuangZhou','male',19,'2023年01月27日09时29分57秒'),
('user13','123456','cake31@126.com','19951652622','GuangZhou','male',19,'2023年01月27日09时30分57秒'),
('user14','123456','cake32@126.com','19951652623','GuangZhou','male',19,'2023年01月27日09时31分57秒'),
('user15','123456','cake33@126.com','19951652624','GuangZhou','female',19,'2023年01月27日09时32分59秒');

COMMIT;

#
# Data for the `useraccount` table  (LIMIT 0,500)
#

INSERT INTO `useraccount` (`username`, `money`) VALUES
('user1',0),
('user2',0),
('user3',0),
('user4',0),
('user5',0),
('user6',0),
('user7',0),
('user8',0),
('user9',0),
('user10',0),
('user11',0),
('user12',0),
('user13',0),
('user14',0),
('user15',0);

COMMIT;

#
# Data for the `userform` table  (LIMIT 0,500)
#

INSERT INTO `userform` (`id`, `fid`, `username`, `ptype`,`pname`, `proprice`, `count`, `time`, `summoney`,`status`) VALUES
(1,'F20230129085200','user1','1','BlueberryCake',150,1,'2023年01月29日08时52分00秒 ',150, 0),
(2,'F20230129085201','user2','1','BlueberryCake',150,1,'2023年01月29日08时52分01秒 ',150, 1),
(3,'F20230129085202','user3','1','ChickenCheeseCake',150,1,'2023年01月29日08时52分02秒 ',150, 1),
(4,'F20230129085203','user4','1','BrownieCake',150,1,'2023年01月29日08时52分03秒 ',150, 1),
(5,'F20230129085204','user5','2','Hawaiian_IceCream_Soda',35,1,'2023年01月29日08时52分04秒 ',35, 1),
(6,'F20230129085205','user6','1','CherryCake',150,1,'2023年01月29日08时52分05秒 ',150, 1),
(7,'F20230129085206','user7','1','ChickenCheeseCake',150,1,'2023年01月29日08时52分06秒 ',150, 1),
(8,'F20230129085207','user8','1','BrownieCake',150,1,'2023年01月29日08时52分07秒 ',150, 1),
(9,'F20230129085208','user9','1','CherryCake',150,1,'2023年01月29日08时52分08秒 ',150, 1),
(10,'F20230129085209','user10','1','CherryCake',150,1,'2023年01月29日08时52分09秒 ',150, 1),
(11,'F20230129085210','user11','1','BearChocolateCake',150,1,'2023年01月29日08时52分10秒 ',150, 1),
(12,'F20230129085211','user12','2','Hawaiian_IceCream_Soda',35,1,'2023年01月29日08时52分11秒 ',35, 0),
(13,'F20230129085212','user13','1','ChickenCheeseCake',150,1,'2023年01月29日08时52分12秒 ',150, 1),
(14,'F20230129085213','user14','1','BearChocolateCake',150,1,'2023年01月29日08时52分13秒 ',150, 0),
(15,'F20230129085214','user15','1','RabbitMatchaCake',150,1,'2023年01月29日08时52分14秒 ',150, 0),
(16,'F20230129085215','user1','1','BrownieCake',150,1,'2023年01月29日08时52分15秒 ',150, 1),
(17,'F20230129085216','user2','2','Strawberry_Matcha_Coconut',35,1,'2023年01月29日08时52分16秒 ',35, 1),
(18,'F20230129085217','user3','2','GreenGrape_Yogurt',35,1,'2023年01月29日08时52分17秒 ',35, 0),
(19,'F20230129085218','user4','2','Mango_Lemon_Tea',35,1,'2023年01月29日08时52分18秒 ',35, 0),
(20,'F20230129085219','user5','1','ChickenCheeseCake',150,1,'2023年01月29日08时52分19秒 ',150, 1),
(21,'F20230129085220','user6','2','Hawaiian_IceCream_Soda',35,1,'2023年01月29日08时52分20秒 ',35, 0),
(22,'F20230129085221','user7','2','Cherry_Oolong_MilkTea',35,1,'2023年01月29日08时52分21秒 ',35, 1),
(23,'F20230129085222','user8','2','Berry_Oolong_Soda',35,1,'2023年01月29日08时52分22秒 ',35, 0),
(24,'F20230129085223','user9','2','Strawberry_Matcha_Coconut',35,1,'2023年01月29日08时52分23秒 ',35, 1),
(25,'F20230129085224','user10','2','Mango_Lemon_Tea',35,1,'2023年01月29日08时52分24秒 ',35, 0),
(26,'F20230129085225','user11','2','GreenGrape_Yogurt',35,1,'2023年01月29日08时52分25秒 ',35, 1),
(27,'F20230129085226','user12','1','BrownieCake',150,1,'2023年01月29日08时52分26秒 ',150, 0),
(28,'F20230129085227','user13','2','Berry_Oolong_Soda',35,1,'2023年01月29日08时52分27秒 ',35, 1),
(29,'F20230129085228','user14','2','Strawberry_Matcha_Coconut',35,1,'2023年01月29日08时52分28秒 ',35, 0),
(30,'F20230129085229','user1','2','Cherry_Oolong_MilkTea',35,1,'2023年01月29日08时52分29秒 ',35, 1),
(31,'F20230129085230','user2','1','BlueberryCake',150,1,'2023年01月29日10时54分30秒 ',150, 0),
(32,'F20230129085231','user3','1','CherryCake',150,1,'2023年01月29日03时57分31秒 ',150, 0);
COMMIT;



/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;