<%@ page language="java" import="java.util.*,cake.wx.shopping.vo.*" pageEncoding="utf-8"%>
<%@page import="cake.wx.shopping.factory.DAOFactory"%>
<%@page import="cake.wx.shopping.vo.Product"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  
  <style type="text/css">@import "css/default.css";</style>
	
	<script type="text/javascript" src="js/jquery-latest.js"></script>
	<script type="text/javascript" src="js/jquery.tablesorter.js"></script>
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
 

  </head>
  
  <body>
   <%
User user=new User();

user=(User)request.getSession().getAttribute("loginusername");
if(user==null){

	request.getSession().removeAttribute("pList");
	response.sendRedirect("index.jsp");
	return;
}
%>
<center>
    
    <h1><%=user.getUsername() %>的购物车</h1>
    <hr/>
 <form action="servlet/BuyServlet?option=buy" method="post">
			<table id="large" cellspacing="0">

				<thead>
					<tr>
					    <th>
							商品图片
						</th>
						<th>
							商品编号
						</th>
						<th>
							商品名称
						</th>
						<th>
							商品数量
						</th>
						<th>
							商品单价
						</th>
						
					 <th>选中操作</th>
						
					</tr>
				</thead>
				<tfoot>
					<tr>
					    <th>
							商品图片
						</th>
						<th>
							商品编号
						</th>
						<th>
							商品名称
						</th>
						<th>
							商品数量
						</th>
						<th>
							商品单价
						</th>
						
					 <th>选中操作</th>					
					</tr>
				</tfoot>
				<tbody>
			
	<%

	     List pList= null;
	     HttpSession session0 = request.getSession();
	     if(session0!=null){
	     	pList=(ArrayList)request.getSession().getAttribute("pList");
		 }
	     System.out.println("my pList:"+pList);
	     Product product=null;

		if(pList!=null && !pList.isEmpty()){
			for (Object o : pList) {
				if (o instanceof String) {
					String pid = (String) o;
					try {
						product = DAOFactory.getProductDAOInstance().selectById(pid);
						System.out.println(product);
					} catch (Exception e) {
						e.printStackTrace();
					}%>
	<tr>
		<td>
			<img src="<%=product.getImgpath() %>"  width="80" height="80"/>
		</td>
		<td><%=product.getPid()%></td>
		<td><%=product.getPname()%></td>
		<td>1</td>
		<td><%=product.getPrice()%></td>

		<td>

			<input type="checkbox" checked="checked" value=<%= product.getPid()%> name="pids" />

		</td>

	</tr>
	<%
				}
			}
		}
		if(pList==null||pList.isEmpty()){%>
	        <script>
		        alert("购物车为空");
		        history.go(-1); // 返回上一页
	        </script>
        <%}%>



				</tbody>
			</table>
			
			
			<input type="submit" value="购买"/>
			<%request.getSession().setAttribute("pList",pList); %>
			<font size="2"><a href="index.jsp">返回继续购物</a></font>
			
	</form>
	</center>
	</body>
</html>

