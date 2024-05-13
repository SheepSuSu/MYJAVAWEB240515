<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="cake.wx.shopping.factory.DAOFactory" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
      <style type="text/css">
  table {
	font-size: 12px;
	background-color: paleturquoise;
	
	border: 1px solid #000;
}
</style>
      <script type="text/javascript">
          var points = Array("0","0","0");
          //检查所有;
          function check_addadmin(){
              var i=0;
              while (i<=2){
                  if(points[i]==="0"){
                      alert("你的用户信息不正确,请检查!");
                      /*alert(points);*/
                      i=10;
                      return false;
                  }
                  else{
                      i++;
                  }
              }
              return true;
          }
          //检查用户名；
          function checkadminname(){
              var usn=document.getElementById("username").value;
              if (usn===""){
                  usn_info.innerHTML="<font color=\"red\">管理员名不能为空！</font>";
                  points[0]="0";
                  return false;
              }else {
                      usn_info.innerHTML = "";
                      points[0] = "1";
                      return true;
                  }
              }
          //检查登入密码;
          function checkpassword(){
              var pwd = document.getElementById("password").value;
              if (pwd.length<6||pwd.length>16){
                  pwd_info.innerHTML = "<font color=\"red\">密码格式不正确，密码为6-16位</font>";
                  points[1]="0";
                  return false;
              }
              else{
                  document.getElementById("pwd_info").innerHTML = "";
                  points[1]="1";
                  return true;
              }
          }
          //检查密码是否一致;
          function checkrepassword(){
              var pwd2 = document.getElementById("repassword").value;
              if (pwd2===document.getElementById("password").value){
                  document.getElementById("pwdrepeat_info").innerHTML = "";
                  points[2]="1";
                  return true;
              } else{
                  document.getElementById("pwdrepeat_info").innerHTML = "<font color=\"red\">两次输入的密码不一致，请检查后重试。</font>";
                  points[2]="0";
                  return false;
              }
          }
          //检查管理员名是否已经被注册
          function showAlert(){
              <%String alertMessage=(String)request.getAttribute("alertMessage");
              if (alertMessage!=null){
                  %>
              alert('<%=alertMessage.replace("'","\\'")%>');
                  <%
                  }
                  %>
          }
      </script>
  </head>

  <style>
      body {
          background-color: #f2f2f2;
          font-family: Arial, sans-serif;
      }

      form {
          margin: auto;
          width: 300px;
          background-color: #fff;
          padding: 20px;
          border: 1px solid #ccc;
          border-radius: 5px;
      }

      h4 {
          text-align: center;
          color: black;
          background-color: lavenderblush;
          padding: 10px;
          border-radius: 5px;
      }

      table {
          width: 100%;
      }

      th, td {
          padding: 10px;
      }

      th {
          text-align: right;
          color: black;
          background-color: lavenderblush;
      }

      input[type="text"], input[type="password"] {
          width: 100%;
          padding: 5px;
          border: 1px solid #ccc;
          border-radius: 3px;
          background-color: lightyellow;
      }

      input[type="submit"], input[type="reset"] {
          padding: 10px 20px;
          background-color: pink;
          color: black;
          border: none;
          border-radius: 3px;
          cursor: pointer;
      }

      input[type="submit"]:hover, input[type="reset"]:hover {
          background-color: #f7ac9a;
      }

      input[type="submit"]:focus, input[type="reset"]:focus {
          outline: none;
      }

      input[type="reset"] {
          margin-left: 10px;
      }
  </style>

  <body onload="showAlert()">
  <form action="${pageContext.request.contextPath}/servlet/AdminServlet?actionType=211" method="post"
        onsubmit="return check_addadmin()">
      <h4>增加管理员</h4>
      <table>
          <tr>
              <th><label for="username">管理员名：</label></td>
              <td><input type="text" id="username" name="username" onblur="checkadminname()">
              <div id="usn_info"></div></td>
          </tr>
          <tr>
              <th><label for="password">密码：</label></td>
              <td><input type="password" id="password" name="password" onblur="checkpassword()">
              <div id="pwd_info"></div></td>
          </tr>
          <tr>
              <th><label for="repassword">确认密码：</label></td>
              <td><input type="password" id="repassword" name="repassword" onblur="checkrepassword()">
                  <div id="pwdrepeat_info"></div></td>
          </tr>
          <tr>
              <td colspan="2">
                  <div style="text-align: center;">
                      <input type="submit" name="update" value="确定">
                      <input type="reset" name="reset" value="重置">
                  </div>
              </td>
          </tr>
      </table>
  </form>
  </body>
</html>
