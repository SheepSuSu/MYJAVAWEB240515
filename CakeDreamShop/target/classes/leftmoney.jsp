<%@ page language="java" import="cake.wx.shopping.vo.*" pageEncoding="utf-8"%>
<%@page import="cake.wx.shopping.factory.DAOFactory"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>商城帐户剩余金额</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>

  <body bgcolor="#fffafa">
  <div style="display: flex; flex-direction: column; justify-content: center; align-items: center; height: 100vh; text-align: center;">
	  <div style="margin-bottom: 20px;">
		  <%
			  UserAccount useraccount = null;
			  User user = (User)request.getSession().getAttribute("loginusername");
			  if(user!=null){
				  useraccount = DAOFactory.getUserAccountDAOInstance().selectUserAccount(user.getUsername());
				  out.print("<font size='3' color='#000000'>商城帐户剩余金额:</font>"+String.valueOf(useraccount.getMoney()));
			  }else{
				  response.sendRedirect(request.getContextPath()+"/viewmfail.jsp");
			  }
		  %>
	  </div>
	  <div>
		  <font size="3" color="#000000">
			  <a href="index.jsp" style="line-height: 2; font-size: 16px;">返回首页</a>
		  </font>
	  </div>
	  <div>
		  <font size="3" color="#000000">
			  <a href="userconsle.jsp" style="line-height: 2; font-size: 16px;">返回用户控制面板</a>
		  </font>
	  </div>
  </div>
  </body>
</html>
