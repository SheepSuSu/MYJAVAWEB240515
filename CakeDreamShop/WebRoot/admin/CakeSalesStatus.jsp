<%--
  Created by IntelliJ IDEA.
  User: 31246
  Date: 2024/5/8
  Time: 14:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="cake.wx.shopping.vo.*" %>
<%@page import="cake.wx.shopping.factory.DAOFactory"%>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme() + "://"
          + request.getServerName() + ":" + request.getServerPort()
          + path + "/";
  System.out.println("basepath:"+basePath);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>蛋糕销售情况</title>
  <style>
    th{
      min-width: 5em;
    }
    td{
      min-width: 5em;
      text-align: center;
    }
  </style>
</head>
<body>
<div STYLE="background: linear-gradient(to bottom,papayawhip, #d6fff8);">
  <table cellspacing="0" border="1" id="large" align="center">
    <caption style="color: deeppink">蛋糕销售情况</caption>
    <tr>
      <th>商品名</th>
      <th>销量</th>
      <th>总收益</th>
    </tr>
    <%
      List<List<String>> formList=DAOFactory.getProductDAOInstance().showItemSale(1);
      if (formList.size()==0){
        System.out.println("CakeSale.select Wrong!!!");
      }
      System.out.println("This is cake sale situation!");
      for(int i=0;i<formList.size();i++){
        List<String> saleForm=formList.get(i);
        /*System.out.println(saleForm);*/
    %>

    <tr>
      <td><%=saleForm.get(0) %></td>
      <td><%=saleForm.get(1)%></td>
      <td><%=saleForm.get(2)%></td>



    </tr>
    <% }%>
  </table>
</div>
</body>
</html>
