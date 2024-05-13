<%@ page language="java" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>登录成功！</title>
    
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
			window.location.href="index.jsp";
		}
		setTimeout("redir()",3000);
	</script>
  </head>

  <style>
	  body {
		  display: flex;
		  justify-content: center;
		  align-items: center;
		  height: 100vh;
		  margin: 0;
		  background-color: #fffafa;
	  }

	  .center-text {
		  text-align: center;
	  }
  </style>

  <body>
  <div class="center-text">
	  <font size="2" color="black">登录成功！三秒后将自动跳转到商城首页</font><br><br>
	  <font size="2"><a href="index.jsp">点击直接跳转到商城首页</a></font><br>
	  <font size="2"><a href="userconsle.jsp">点击直接跳转到用户控制面板</a></font>
  </div>
  </body>
</html>
