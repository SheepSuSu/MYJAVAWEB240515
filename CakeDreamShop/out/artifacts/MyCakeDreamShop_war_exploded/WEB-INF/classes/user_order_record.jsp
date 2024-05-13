<%@ page language="java" import="java.util.*,cake.wx.shopping.vo.*" pageEncoding="utf-8"%>
<%@page import="cake.wx.shopping.factory.DAOFactory"%>
<%@ page import="java.io.PrintStream" %>
<%@page import="cake.wx.shopping.vo.Product"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<meta charset="UTF-8">
	<title>查看订单</title>
	<style>
		#show_order{
			display: flex;
			flex-direction: column;
		}
		#order_list{
			margin-top: 5px;
			margin-left: 20px;
			height: 500px;
			overflow: scroll;
			display: flex;
			/*border: 3px solid deeppink;*/
		}
		#my_order{
			font-size: 18px;
			text-align: center;
		}
		table {
			align-self: flex-start;
			border-collapse: collapse;
			width: 100%;
		}

		th, td {
			text-align: left;
			padding: 8px;
		}

		tr:nth-child(even){
			background-color: #f2f2f2;
		}

		tr{
			line-height: 1em;
		}

		th {
			background-color: #c2ffef;
			color: black;
		}
		#Scoring_btn{
			width: 5em;
			align-self: center;
			margin-top: 10px;
		}
	</style>
	<script type="text/javascript">
		function checkselectd(){
			var pd=document.getElementsByName("selected_order");
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
<jsp:include page="ui.html"/>
<%--<%
	if(request.getSession().getAttribute("OderType")==null){}
	else{
		int OderType=(Integer)request.getSession().getAttribute("OderType");
		System.out.println("OrderType:"+ OderType);
		if (OderType==0){
            response.sendRedirect(request.getContextPath()+"/userconsle.jsp");
		}
		else {
			System.out.println("Score_user_oder Wrong!!!");
		}
	}
%>--%>
<h1 id="my_order">订单列表</h1>
<form id="show_order" action="${pageContext.request.contextPath}/servlet/ScoreServlet?ScoreType=0" method="post"
	  onsubmit="return checkselectd()">
<div id="order_list">
		<table cellpadding="0" cellspacing="0">
			<tr>
				<th>订单号</th>
				<th>商品名称</th>
				<th>单价</th>
				<th>购买数量</th>
				<th>总价格</th>
				<th>物流状态</th>
				<th>商品评分</th>
			</tr>
			<%
				User user=new User();
				user=(User)request.getSession().getAttribute("loginusername");
				List<UserForm> OrderpList= null;
				try {
					OrderpList = DAOFactory.getUserFormDAOInstance().selectByName(user.getUsername());
				} catch (Exception e) {
					e.printStackTrace();
				}
				System.out.println("This is OderList:"+OrderpList);
				/*List OrderpList1 = (List)request.getSession().getAttribute("OrderpList");*/
				request.getSession().setAttribute("OrderpList",OrderpList);
                int key=0;
			%>
			<% for (UserForm order : OrderpList) { %>
			<tr style="">
				<td><%= order.getFid()%></td>
				<td><%= order.getPname() %></td>
				<td><%= order.getProprice() %></td>
				<td><%= order.getCount() %></td>
				<td><%= order.getSummoney() %></td>
				<td><%= order.ShowStatus() %></td>
				<td>
					<input type="radio" name="selected_order" value="<%=key%>">
				</td>
			</tr>
			<br>
			<% key++;} %>
		</table>
</div>
	<input type="submit" id="Scoring_btn" value="评分"/>
</form>
</body>
</html>
