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
    
    <title>CakeDream_��ҳ</title>
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
						  out.println("<font size='3'>�û���<input  size='20' height='15' type='text' name='loginusername'></font>");
						  out.println("<font size='3'>���룺<input  size='20' height='15' type='password' name='loginpassword'></font>");
						  out.print(" <input type='submit' value='��¼'>");
						  out.print("  <a href='register.jsp'>ע�����û�</a>");
						  Product fail_to_rec= null;
						  try {
							  fail_to_rec = DAOFactory.getProductDAOInstance().selectById("P000");
						  } catch (Exception e) {
							  e.printStackTrace();
						  }
						  Rec_pList.add(fail_to_rec);
					  }else{
						  System.out.println("i am user!!!");
						  out.print("<font size='3'>��ӭ��  :"+user.getUsername()+"</font>");
						  out.println("&nbsp;&nbsp;");
						  out.print("<font size='3'><a href='servlet/ContrlServlet?valuetype=7'>ע��</a></font>");
						  out.println("&nbsp;&nbsp;");
						  try {
						  	System.out.println("Rec test:"+user.getUsername());
							  Rec_pList = UB_CF.recommendByUser(user.getUsername());
						  } catch (Exception e) {
							  e.printStackTrace();
						  }
						  List Rec_pList1 = (List)request.getSession().getAttribute("Rec_pList");
						  request.getSession().setAttribute("Rec_pList",Rec_pList1);
						  out.print("<a href='userconsle.jsp'>���˿������</a>");

					  }
				  %>

			  </form>
		  </div>
	  </div>
  </div>
  <div id="container">
	  <div id="center" class="column">
		  <div id="Author_section"  class="Content_section">
			  <h2>����˵</h2>
			  <div id="Author" class="Pic_Words1"  >
				  <div id="author_pic" class="Pic1" ></div>
				  <p class="p1">
					  ����һ����������ռ����ֵ�insС��.<br>
					  ����~<br>
					  һ��Ҫ���ŵ��ʲô��<br>
					  ����֥ʿ���⣬<br>
					  ǡ�Ʋ�ľ�Թ��������顣<br>
					  Attention!
					  ����ƽʱ��æ�����Ը��º��ϼܵ���or��Ʒor����ʱ�䲻��ʱ��<br>
					  ����֮�����ǻ��᲻��ʱ�Ƴ���ػ���������ע��С���æ�����ں�Ŷ.
					  ��ӭϲ�����⡢��㼰С��ˮ���Ȱ������С������~
				  </p>
			  </div>
		  </div>
		  <div id="Shopping_section">
			  <h2>Ϊ���Ƽ�</h2>
			  <div class="sale_section">
				  <div style="width: 80%; border: 1px solid #ccc; display: flex; flex-wrap: wrap; justify-content: space-between;align-self: center">
					  <% for (Product product : Rec_pList) { %>
					  <div class="product" style="margin-top: 1em;margin-bottom: 1em">
						  <div class="img-name">
							  <img src="<%= product.getImgpath() %>" width="120" height="100">
							  <div class="pname"><%= product.getPname() %></div>
						  </div>
						  </br>
						  <center><%= product.getPrice() %>Ԫ
							  <a href="servlet/BuyServlet?pid=<%= product.getPid() %>"><font color="red" size="2">���빺�ﳵ</font></a>
						  </center>
					  </div>
					  <% } %>
				  </div>
				  <%--</div>--%>
			  </div>
			  <h2>�������۵���</h2>
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
								  <center><%= product.getPrice() %>Ԫ
									  <a href="servlet/BuyServlet?pid=<%= product.getPid() %>"><font color="red" size="2">���빺�ﳵ</font></a>
								  </center>
							  </div>
							  <% } %>
						  </div>
				  <%--</div>--%>
			  </div>
			  <h2>����������Ʒ</h2>
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
						  <center><%= product.getPrice() %>Ԫ
							  <a href="servlet/BuyServlet?pid=<%= product.getPid() %>"><font color="red" size="2">���빺�ﳵ</font></a>
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
				  �����С��ˮ��һ�������״̬��
			  </h3>
			  <ul id="left_navigation">
				  <li>����</li>
				  <li>��Ʒ</li>
			  </ul>
		  </div>
	  </div>
	  <div id="right" class="column">
		  <div class="Navigation">
			  <ul id="right_navigation">
				  <li>�Ҹ��кܶ��֣�������С������һ��~</li>
				  <li>�������ˣ��ȳԸ�С����ɣ�</li>
				  <li>�������ˮ�ף������С��ˮ���԰�����������</li>
			  </ul>
		  </div>
	  </div>
  </div>
  <div id="footer">
	  <p id="ending_words">лл�ݹ�</p>
  </div>
<!-- End ImageReady Slices -->
    </body>
</html>
