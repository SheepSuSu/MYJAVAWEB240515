<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="cake.wx.shopping.factory.DAOFactory"%>
<%@page import="cake.wx.shopping.vo.*"%>
<%@ page import="java.io.PrintStream" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
System.out.print("---begin   "+basePath+"   end---");
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
			  var pd=document.getElementById("select_pro");
			  if (pd.checked){//如果有商品的checkbox被勾选，则返回true
				  return true
			  }
			  if (!pd.checked){//若checkbox未被勾选，则返回false
				  alert("商品未勾选！");
				  return false;
			  }
		  }
	  </script>
    

  </head>
  
  <body>

  <form  action="/MyCakeDreamShop_war_exploded/admin/manager.jsp" >
  <div align="center">搜索类型 ：
    <select name="select">
      <option value="pid" name="type" >商品编号</option>
      <option value="pname" name="type" >商品名称</option>
    </select>
    
    搜索条件：<input name="typename" type="text" size="15" />

	  <input type="submit" name="Submit" value="搜索" />
  </div>
  </form>
  <br/>
  <%
    List<Product> pList=new ArrayList<Product>();
    Admin admin=new Admin("admin","admin");
    request.getSession().setAttribute("admin" ,admin);
    request.setCharacterEncoding("utf-8");
    String typename=(String)request.getParameter("typename");
    System.out.println("typename"+typename);
    if(typename==""){ %>
     <center> <h1> 请输入查询内容！</h1></center>
      <%}
    else{
		  String type = (String) request.getParameter("select");
		  System.out.println(type);
		  PrintStream kkk = new PrintStream(System.out, true, "utf-8");
		  kkk.println("typename: " + typename);
    if("pid".equals(type)){
		Product product= null;
		try {
			product = DAOFactory.getProductDAOInstance().selectById(typename);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(product!=null){
          pList.add(product);
          }
        } 
    if("pname".equals(type)){
		try {
			pList= DAOFactory.getProductDAOInstance().selectByName(typename);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
    if(pList.isEmpty()){%>
     <center> <h1>对不起没有找到你想要的商品！请重新搜索！</h1></center>
       <% 
    }else{
    	System.out.println();
       %>
       <form action="${pageContext.request.contextPath}/servlet/AdminServlet?actionType=341" method="post"
			 onsubmit="return checkSelected()">
       <table cellspacing="0" id="large">
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
						<th>选中修改</th>
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
						 <th>选中修改</th>	
					</tr>
				</tfoot>
				<tbody>
			<%
	 for(int i=0;i<pList.size();i++){
	     Product product=pList.get(i);

	 %>				
					
					<tr>
				
				<td>
				
				<img src="<%=product.getImgpath() %>"  width="80" height="80"/>
				
				</td>
				<td><%=product.getPid()%></td>
				<td><%=product.getPname()%></td>
				<td><%=product.getPcount() %></td>
				<td><%=product.getPrice()%></td>
				<td>
					<input type="checkbox" id="select_pro" value=<%= product.getPid()%> name="pid" />
				</td>
		

			</tr>
			<% }%>
			
			</tbody>
			</table>
	<div  class="pager"><input type="submit" value="修改" align="left"/>	</div>
	</form>
<br/>
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
       <% 
       }
    }
   %>
  

   
  </body>
</html>
