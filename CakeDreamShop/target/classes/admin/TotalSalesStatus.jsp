<%--
  Created by IntelliJ IDEA.
  User: 31246
  Date: 2024/5/8
  Time: 2:11
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
    <title>各类商品销售情况</title>
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
        <caption style="color: deeppink">各类型商品销售情况</caption>
        <tr>
            <th>类型</th>
            <th>销量</th>
            <th>总收益</th>
        </tr>
        <%
            List<TotalSale> formList=DAOFactory.getTotalSaleDAOInstance().selectTotalSale();
            if (formList.size()==0){
                System.out.println("TotalSale.select Wrong!!!");
        }
            for(int i=0;i<formList.size();i++){
                TotalSale saleForm=formList.get(i);
        %>

        <tr>
            <td><%=saleForm.showPtype() %></td>
            <td><%=saleForm.getPcount()%></td>
            <td><%=saleForm.getSummoney()%></td>



        </tr>
        <% }%>
    </table>
</div>
</body>
</html>
