<%@ page language="java"  pageEncoding="utf-8"%>
<%@page import="cake.wx.shopping.factory.DAOFactory"%>
<%@page import="cake.wx.shopping.vo.Product"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <style type="text/css">
  table {
	font-size: 12px;
	background-color: lavenderblush;
	
	border: 1px solid #a4d2e8;
}
</style>
  <script type="text/javascript">
      var points = Array("0","0","0");
      function checkUpdate(){
          //产品数量只能为正整数，价格只能为正浮点数（保留两位）,三者都不能为空
          if (document.getElementById("pname").value!=="" && document.getElementById("price").value!=="" &&
              document.getElementById("pcount").value!==""){
              var UpdatePrice=document.getElementById("price").value;
              var UpdatePcount=document.getElementById("pcount").value;
              const priceTest=/(^[1-9]([0-9]+)?(\.[0-9]{1,2})?$)|(^(0){1}$)|(^[0-9]\.[0-9]{1,2}$)/;
              const pcountTest=/^[0-9]*[1-9][0-9]*$/;
              if (pcountTest.test(UpdatePcount)){
                  if (priceTest.test(UpdatePrice)){
                      alert("Succeed to modify!")
                      return true;
                  }else {
                      alert("Product price Wrong!")
                      return false;
                  }
              }else {
                  alert("Product count Wrong!")
                  return false;
              }
          }else {
              if (document.getElementById("pname").value===""){
                  alert("Product name can not be empty!")
              }
              if (document.getElementById("price").value===""){
                  alert("Product price can not be empty!")
              }
              if (document.getElementById("pcount").value===""){
                  alert("Product count can not be empty!")
              }
              return false;
          }
      }
  </script>
  </head>
  
  <body>
  <%
   String pid=(String)request.getSession().getAttribute("pid");
      Product product= new Product();
      try {
          product = DAOFactory.getProductDAOInstance().selectById(pid);
      } catch (Exception e) {
          e.printStackTrace();
      }
  %>
    <form  action="${pageContext.request.contextPath}/servlet/AdminServlet?actionType=3411" method="post"
           onsubmit="return checkUpdate()">
  <table width="469" height="287" border="1" align="center" cellpadding="1" cellspacing="0">
  <tr ><td colspan="2"><center><font color="black" size="4">修改商品信息</font></center></td></tr>
    <tr>
      <td width="227" height="204"><table width="200" height="200" border="0" cellpadding="1" cellspacing="0">
        <tr>
          <td><img src="<%=product.getImgpath() %>"></td>
        </tr>
      </table></td>
      <td width="498"><p><font color="black">
        产品名称：</font>
            <input type="text" id="pname" name="pname"  value="<%=product.getPname() %>" />
      </p>
      <p><font color="black">
        产品数量：</font> 
          <input type="text" id="pcount" name="pcount" value="<%=product.getPcount() %>"/>
</p>
          <p class="tips" style="color: red">商品数量只能为正整数</p>
      <p><font color="black">
        产品价格： 
          </font><input type="text" id="price" name="price" value="<%=product.getPrice() %>"/>
      </p>
          <p class="tips" style="color: red">商品价格可以为正整数或正浮点数(浮点数小数点后小数不超过两位)或0、0.0、0.00</p>
      </td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td colspan="2"><div align="center">
        <input type="submit" name="update" value="修改" />
        　　　　　　　　
        <input type="reset" name="reset" value="重置" />
      </div></td>
    </tr>
    
    <tr>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
  </table>
</form>
  </body>
</html>
