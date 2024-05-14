//项目CakeDreamShop

学号：202130441627

姓名：苏心怡

**提供网址**

1.购物界面：http://121.40.25.109:8080/MyCakeDreamShop_war_exploded/index.jsp

2.后台管理网站：http://121.40.25.109:8080/MyCakeDreamShop_war_exploded/administrator.jsp


**提供测试账号**

1.用户

#注意：一个用户只能注册（绑定）一个银行账户，user1的银行账户已被绑定为user1_ForTest；如果要注册新用户进行购物的测试，需要先注册绑定银行账户，才能进行购买。

·账号：user1

·密码：123456

·银行账户：user1_ForTest

·银行密码：123456


2.管理员

·账号：admin

·密码：admin


**源代码说明**

1.src/cake/wx/shopping包：

-busbean包：存放与用户信息相关的Java Bean类

-dao包:

 --类似xxxxDAO的接口文件；

 --impl包：存放接口文件的具体实现代码文件；

-dbc包：存放数据库连接的Java代码

-factory包：存放一个DAOFactory类,实现dao包中所有类方法的调用和返回的整合

-filter包：存放实现Servlet Filter的类

-Recommend包：存放实现用户个性化推荐的类和文本文件

-servlet包：用于实现管理员操作、用户购物操作、用户评分操作和一些用户其他（如注册登录等）操作控制的servlet。

-test包：用于测试

-util包：存放了用于感知时间以用于生成一些订单或商品编号的类。

-vo包：存放值对象，封装数据用于传递。

2.WebRoot

-存放与购物网站相关的JSP和html文件

-admin文件夹：存放与后台管理相关的JSP和html文件

-CakeImage文件夹：存放商品图片

-css文件夹：存放一些css样式文件

-images文件夹：存放一些界面布置相关的图片资源

-img文件夹：存放一些响应消息的图片资源

-js文件夹：存放一些js文件

-sql文件夹：存放初始sql操作文件



