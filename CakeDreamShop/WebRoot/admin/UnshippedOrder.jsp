<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="cake.wx.shopping.vo.*" %>
<%@page import="cake.wx.shopping.factory.DAOFactory"%>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <style type="text/css">@import "../css/default.css";</style>
  <style type="text/css">@import "../css/jquery.tablesorter.pager.css";</style>
  <script type="text/javascript" src="../js/jquery-latest.js"></script>


  <script type="text/javascript" src="../js/jquery.tablesorter.js"></script>
  <script type="text/javascript" src="../js/jquery.tablesorter.pager.js"></script>
  <script type="text/javascript">
    $(function() {
      $("table")
              .tablesorter({widthFixed: true})
              .tablesorterPager({container: $("#pager")});
    });
  </script>
  <script type="text/javascript">
    function checkSelected(){
      var pd=document.getElementsByName("fid");
      for (var i=0;i<pd.length;i++){
        if (pd[i].checked){
          return true;
        }
      }
      alert("Order not checked!")
      return false;
    }
  </script>
</head>

<body>
<form action="${pageContext.request.contextPath}/servlet/AdminServlet?actionType=531" method="post" onsubmit="return checkSelected()">
<table cellspacing="0" id="large">
  <thead>
  <tr>
    <th>账单编号</th>
    <th>用户名</th>
    <th>商品名</th>
    <th>单价</th>
    <th>购买数量</th>
    <th>时间</th>
    <th>总价</th>
    <th>选中发货</th>

  </tr>
  </thead>
  <tfoot>
  <tr>
    <th>账单编号</th>
    <th>用户名</th>
    <th>商品名</th>
    <th>单价</th>
    <th>购买数量</th>
    <th>时间</th>
    <th>总价</th>
    <th>选中发货</th>

  </tr>
  </tfoot>
  <tbody>
  <%
    List<UserForm> formList= null;
    try {
      formList = DAOFactory.getUserFormDAOInstance().selectForm(0);
    } catch (Exception e) {
      e.printStackTrace();
    }
    for(int i=0;i<formList.size();i++){
      UserForm userForm=formList.get(i);
  %>

  <tr>
    <td><%=userForm.getFid() %></td>
    <td><%=userForm.getUsername()%></td>
    <td><%=userForm.getPname() %></td>
    <td><%=userForm.getProprice()%></td>
    <td><%=userForm.getCount()%></td>
    <td><%=userForm.getTime() %></td>
    <td><%=userForm.getSummoney()%></td>
    <td>

      <input type="checkbox" value=<%= userForm.getFid()%> name="fid" />

    </td>
  </tr>
  <% }%>

  </tbody>
</table>
<br/>
  <input type="submit" value="发货"/>
</form>
<div id="pager" class="pager">
  <form>
    <img src="../img/first.png" class="first"/>
    <img src="../img/prev.png" class="prev"/>
    <input type="text" class="pagedisplay"/>
    <img src="../img/next.png" class="next"/>
    <img src="../img/last.png" class="last"/>
    <select class="pagesize">
      <option selected="selected"  value="5">5</option>
      <option value="10">10</option>
      <option value="15">15</option>
      <option value="20">20</option>
      <option value="30">30</option>
      <option  value="40">40</option>
    </select>
  </form>
</div>
</body>
</html>
