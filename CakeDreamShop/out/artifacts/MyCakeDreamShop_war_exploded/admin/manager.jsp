<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="cake.wx.shopping.vo.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>商城后台管理</title>


</head>

<body style="text-align: center;">
<jsp:include page="ui.html" />
  <hr/>
  <%
  System.out.print("chooseType:"+request.getSession().getAttribute("chooseType"));
    if(request.getSession().getAttribute("chooseType")==null){}
    else{
    int chooseType=(Integer)request.getSession().getAttribute("chooseType");
    switch(chooseType){
     case 21:
       %>
           <jsp:include page="addadmin.jsp" />
    <% 
     break;
    
    case 22:
       %>
           <jsp:include page="deleteuser.jsp"/>
    <% 
     break;
     
    case 23:
    %>
           <jsp:include page="selectalluser.jsp"/>
    <% 
    break;
    
    case 31:
    %>
           <jsp:include page="addproduct.jsp"/>
    <% 
    break;
    
    case 32:
    %>
           <jsp:include page="deleteproduct.jsp"/>
    <% 
    break;
    
     case 33:
    %>
           <jsp:include page="selectproduct.jsp"/>
    <% 
    break;
    
      case 34:
Admin admin=(Admin)request.getSession().getAttribute("admin");
if(admin==null){
 System.out.print("Empty");
}

    %>
           <jsp:include page="updateproduct.jsp" />
    <% 
    break;
    
     case 341:
    %>
           <jsp:include page="product.jsp"/>
    <% 
    break;
    
      case 41:
    %>
           <jsp:include page="selectallaccout.jsp"/>
    <% 
    break;
    
      case 42:
    %>
           <jsp:include page="selectmoneylog.jsp" />
    <% 
    break;
    
       case 51:
    %>
           <jsp:include page="selectuserform.jsp"/>
    <% 
    break;

       case 52:
    %>
           <jsp:include page="ShippedOrder.jsp"/>
    <%
    break;

        case 53:
    %>
           <jsp:include page="UnshippedOrder.jsp"/>
    <%
    break;

        case 61:
    %>
           <jsp:include page="TotalSalesStatus.jsp"/>
    <%
        break;

        case 62:
    %>
<jsp:include page="CakeSalesStatus.jsp"/>
<%
        break;

    case 63:
%>
<jsp:include page="DrinkSalesStatus.jsp"/>
<%
        break;

        default:
            System.out.println("没有对应的chooseType!");
    %>
           <jsp:include page="bg_design.html"/>

    <%
    break;
    
    }
    
    
    
    
    }
    
    
     %>
     
   
  
  
  

</body>