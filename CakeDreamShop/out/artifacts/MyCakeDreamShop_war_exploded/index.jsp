<%@ page language="java" import="cake.wx.shopping.vo.*,java.util.*,cake.wx.shopping.Recommend.UB_CF,cake.wx.shopping.servlet.*" pageEncoding="gbk"%>

<%@page import="cake.wx.shopping.factory.DAOFactory"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>"/>
    
    <title>CakeDream_首页</title>
	<meta http-equiv="pragma" content="no-cache"/>
	<meta http-equiv="cache-control" content="no-cache"/>
	<meta http-equiv="expires" content="0"/>    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3"/>
	<meta http-equiv="description" content="This is my page"/>
	<link rel="stylesheet" type="text/css" href="css/index_style.css">

  </head>
  <body>

  <div id="header">
	  <div id="header_bg">
		  <h1>CakeDream</h1>
		  <img src="images/header_pic.jpg" alt="Header_display"/>
		  <div align="center">
			  <form action="servlet/ContrlServlet?valuetype=1" method="post">
				  <%
					  List<Product> Rec_pList= new ArrayList<>();
					  User user=new User();
					  user=(User)request.getSession().getAttribute("loginusername");
					  System.out.println("working_______");
					  if(user==null){
						  System.out.println("empty!!!");
						  out.println("<font size='3'>用户：<input  size='20' height='15' type='text' name='loginusername'></font>");
						  out.println("<font size='3'>密码：<input  size='20' height='15' type='password' name='loginpassword'></font>");
						  out.print(" <input type='submit' value='登录'>");
						  out.print("  <a href='register.jsp'>注册新用户</a>");
						  Product fail_to_rec= null;
						  try {
							  fail_to_rec = DAOFactory.getProductDAOInstance().selectById("P000");
						  } catch (Exception e) {
							  e.printStackTrace();
						  }
						  Rec_pList.add(fail_to_rec);
					  }else{
						  System.out.println("i am user!!!");
						  out.print("<font size='3'>欢迎您  :"+user.getUsername()+"</font>");
						  out.println("&nbsp;&nbsp;");
						  out.print("<font size='3'><a href='servlet/ContrlServlet?valuetype=7'>注销</a></font>");
						  out.println("&nbsp;&nbsp;");
						  try {
						  	System.out.println("Rec test:"+user.getUsername());
							  Rec_pList = UB_CF.recommendByUser(user.getUsername());
						  } catch (Exception e) {
							  e.printStackTrace();
						  }
						  List Rec_pList1 = (List)request.getSession().getAttribute("Rec_pList");
						  request.getSession().setAttribute("Rec_pList",Rec_pList1);
						  out.print("<a href='userconsle.jsp'>个人控制面板</a>");

					  }
				  %>

			  </form>
		  </div>
	  </div>
  </div>
  <div id="container">
	  <div id="center" class="column">
		  <div id="Author_section"  class="Content_section">
			  <h2>店主说</h2>
			  <div id="Author" class="Pic_Words1"  >
				  <div id="author_pic" class="Pic1" ></div>
				  <p class="p1">
					  这是一间分享生活收集快乐的ins小店.<br>
					  比如~<br>
					  一定要爱着点儿什么，<br>
					  比如芝士蛋糕，<br>
					  恰似草木对光阴的钟情。<br>
					  Attention!
					  店主平时很忙，所以更新和上架蛋糕or饮品or甜点的时间不定时奥<br>
					  除此之外我们还会不定时推出相关活动，详情请关注“小羊很忙”公众号哦.
					  欢迎喜欢蛋糕、甜点及小甜水和热爱生活的小伙伴光临~
				  </p>
			  </div>
		  </div>
		  <div id="Shopping_section">
			  <h2>为您推荐</h2>
			  <div class="sale_section">
				  <div style="width: 80%; border: 1px solid #ccc; display: flex; flex-wrap: wrap; justify-content: space-between;align-self: center">
					  <% for (Product product : Rec_pList) { %>
					  <div class="product" style="margin-top: 1em;margin-bottom: 1em">
						  <div class="img-name">
							  <img src="<%= product.getImgpath() %>" width="120" height="100">
							  <div class="pname"><%= product.getPname() %></div>
						  </div>
						  </br>
						  <center><%= product.getPrice() %>元
							  <a href="servlet/BuyServlet?pid=<%= product.getPid() %>"><font color="red" size="2">加入购物车</font></a>
						  </center>
					  </div>
					  <% } %>
				  </div>
				  <%--</div>--%>
			  </div>
			  <h2>今日在售蛋糕</h2>
			  <div class="sale_section">
						  <%
							  List<Product> CakepList= null;
							  try {
								  CakepList = DAOFactory.getProductDAOInstance().selectByType(1);
							  } catch (Exception e) {
								  e.printStackTrace();
							  }
							  List CakepList1 = (List)request.getSession().getAttribute("CakepList");
							  request.getSession().setAttribute("CakepList",CakepList1);

						  %>
						  <div style="width: 80%; border: 1px solid #ccc; display: flex; flex-wrap: wrap; justify-content: space-between;align-self: center">
							  <% for (Product product : CakepList) { %>
							  <div class="product" style="margin-top: 1em;margin-bottom: 1em">
								  <div class="img-name">
									  <img src="<%= product.getImgpath() %>" width="120" height="100">
									  <div class="pname"><%= product.getPname() %></div>
								  </div>
								  </br>
								  <center><%= product.getPrice() %>元
									  <a href="servlet/BuyServlet?pid=<%= product.getPid() %>"><font color="red" size="2">加入购物车</font></a>
								  </center>
							  </div>
							  <% } %>
						  </div>
				  <%--</div>--%>
			  </div>
			  <h2>今日在售饮品</h2>
			  <div class="sale_section">
				  <%
					  List<Product> DrinkpList= null;
					  try {
						  DrinkpList = DAOFactory.getProductDAOInstance().selectByType(2);
					  } catch (Exception e) {
						  e.printStackTrace();
					  }
					  List DrinkpList1 = (List)request.getSession().getAttribute("DrinkpList");
					  request.getSession().setAttribute("DrinkpList",DrinkpList1);

				  %>
				  <div style="width: 80%; border: 1px solid #ccc; display: flex; flex-wrap: wrap; justify-content: space-between;align-self: center">
					  <% for (Product product : DrinkpList) { %>
					  <div class="product" style="margin-top: 1em;margin-bottom: 1em">
						  <div class="img-name">
							  <img src="<%= product.getImgpath() %>" width="120" height="100">
							  <div class="pname"><%= product.getPname() %></div>
						  </div>
						  </br>
						  <center><%= product.getPrice() %>元
							  <a href="servlet/BuyServlet?pid=<%= product.getPid() %>"><font color="red" size="2">加入购物车</font></a>
						  </center>
					  </div>
					  <% } %>
				  </div>
				  <%--</div>--%>
			  </div>
		  </div>
	  </div>
	  <div id="left" class="column">
		  <div class="Navigation">
			  <h3>
				  蛋糕和小甜水是一种生活的状态：
			  </h3>
			  <ul id="left_navigation">
				  <li>蛋糕</li>
				  <li>饮品</li>
			  </ul>
		  </div>
	  </div>
	  <div id="right" class="column">
		  <div class="Navigation">
			  <ul id="right_navigation">
				  <li>幸福有很多种，有人买小蛋糕是一种~</li>
				  <li>事已至此，先吃个小蛋糕吧！</li>
				  <li>心情沉入水底，蛋糕和小甜水可以把它打捞起来</li>
			  </ul>
		  </div>
	  </div>
  </div>
  <div id="footer">
	  <p id="ending_words">谢谢惠顾</p>
  </div>
<!-- End ImageReady Slices -->
    </body>
</html>
