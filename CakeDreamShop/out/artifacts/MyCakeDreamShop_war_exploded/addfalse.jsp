<%--充值失败页面--%>
<%@ page language="java" import="java.util.*,cake.wx.shopping.vo.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>充值失败！</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">
		function redir(){ 
			window.location.href="addmoney.jsp";
		}
		setTimeout("redir()",3000);
	</script>
  </head>

  <body bgcolor="#fffafa">
  <%
		User user=new User();
		user=(User)request.getSession().getAttribute("loginusername");
		if(user==null){
			response.sendRedirect("index.jsp");
		}
  %>
  <%
  	if("empty".equals(request.getSession().getAttribute("addmoney_situ"))){
  		out.print("<div align='center'>");
		out.print("<font size='2' color='#0000ff'> 充值失败！充值金额为空！三秒后将自动跳转到充值页面<br>");
  	}else if ("unvalidated".equals(request.getSession().getAttribute("addmoney_situ"))){
  		out.print("<div align='center'>");
		out.print("<font size='2' color='#0000ff'> 充值失败！充值金额为非法输入！三秒后将自动跳转到用户充值页面<br>");
  	}
  		out.print("<br> </font><font size='2'><a href='index.jsp'>点击直接跳转到商城首页</a>");
		out.print("<br>");
		out.print("</font>");
		out.print("<br>");
		out.print("</div>");
  %>
	</body>
</html>
