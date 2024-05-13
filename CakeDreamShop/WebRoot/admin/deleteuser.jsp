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
	
	<script type="text/javascript" src="../js/jquery-latest.js"></script>
	<script type="text/javascript" src="../js/jquery.tablesorter.js"></script>
	<script type="text/javascript">
	
	$(function() {
		
		// add ie checkbox widget
		$.tablesorter.addWidget({
			id: "iecheckboxes",
			format: function(table) {
				if($.browser.msie) {
					if(!this.init) {
						$(":checkbox",table).change(function() { this.checkedState = this.checked});				
						this.init = true;
					}
					$(":checkbox",table).each(function() {
						$(this).attr("checked",this.checkedState);
					});
				}
			}
		});
		
		$("table").tablesorter({widgets: ['iecheckboxes']})
		
		
		
		
		
	});
		
	</script>
		<script type="text/javascript">
			function checkSelected(){
				var pd=document.getElementsByName("username");
				for (var i=0;i<pd.length;i++){
					if (pd[i].checked){
						return true;
					}
				}
				alert("User not checked!")
				return false;
			}
		</script>

		<style type="text/css">
			body {
				background-color: lavenderblush; /* 设置背景颜色 */
				font-family: Arial, sans-serif;
			}

			table {
				width: 100%;
				border-collapse: collapse;
				margin-bottom: 20px;
			}

			th, td {
				padding: 8px;
				border-bottom: 1px solid #ddd;
				text-align: left;
			}

			thead th {
				background-color: #c1e2f2; /* 设置表头背景颜色 */
				color: black;
				font-weight: bold;
			}

			tfoot th {
				background-color: #c1e2f2; /* 设置表尾背景颜色为浅蓝色 */
				color: white;
				font-weight: bold;
			}

			tbody tr{
				background-color: burlywood; /* 设置行的背景颜色为浅灰色 */
			}

			tbody tr:hover {
				background-color: #c1e2f2; /* 设置鼠标悬停时的背景颜色 */
			}

			input[type="submit"] {
				background-color: #c1e2f2; /* 设置提交按钮的背景颜色 */
				color: white;
				padding: 8px 16px;
				border: none;
				cursor: pointer;
			}

			input[type="submit"]:hover {
				background-color: #a4d2e8; /* 设置鼠标悬停时的背景颜色为淡蓝色 */
			}
		</style>
	</head>
  
 <body>
		<form action="${pageContext.request.contextPath}/servlet/AdminServlet?actionType=221" method="post"
			  onsubmit="return checkSelected()">
			<table id="large" cellspacing="0">

				<thead>
					<tr>
						<th>
							用户名
						</th>

						<th>
							Email
						</th>
						<th>
							电话
						</th>
						<th>
							地址
						</th>
						<th>
							性别
						</th>
						<th>
							年龄
						</th>
						<th>
							注册时间
						</th>
										<th>选中删除</th>
						
					</tr>
				</thead>
				<tfoot>
					<tr>
						<th>
							用户名
						</th>

						<th>
							Email
						</th>
						<th>
							电话
						</th>
						<th>
							地址
						</th>
						<th>
							性别
						</th>
						<th>
							年龄
						</th>
						<th>
							注册时间
						</th>
										<th>选中删除</th>
						

					</tr>
				</tfoot>
				<tbody>
			
	<%
	 List<User>userList=DAOFactory.getUserDAOInstance().selectAll();
	 for(int i=0;i<userList.size();i++){
	     User user=userList.get(i);
	 %>				
					
					<tr>
				<td><%=user.getUsername() %></td>
				<td><%=user.getEmail() %></td>
				<td><%=user.getTel() %></td>
				<td><%=user.getAddress() %></td>
				<td><%=user.getSex() %></td>
				<td><%=user.getAge() %></td>
				<td><%=user.getRegtime() %></td>
				<td>
							
								<input type="checkbox" id="selected_user" value=<%= user.getUsername()%>
										name="username" />
							
						</td>

			</tr>
			<% }%>
				
				</tbody>
			</table>
			
			
			<input type="submit" value="删除"/>
			
	</form>
	</body>
</html>
