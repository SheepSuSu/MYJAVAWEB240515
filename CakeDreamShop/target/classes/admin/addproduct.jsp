<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
		<style type="text/css">
@import "../css/default1.css";
</style>
<script>
function yulan() {
	var fileext=document.form1.UpFile.value.substring(document.form1.UpFile.value.lastIndexOf("."),
			document.form1.UpFile.value.length)
	fileext=fileext.toLowerCase();
	if ((fileext!='.jpg')&&(fileext!='.gif')&&(fileext!='.jpeg')&&(fileext!='.png')&&(fileext!='.bmp'))
	{
		alert("对不起，系统仅支持标准格式的照片，请您调整格式后重新上传，谢谢 !");
		document.form1.UpFile.focus();
	}
	else
	{
		alert(''+document.form1.UpFile.value)
		// 把这里改成预览图片的语句
		document.getElementById("preview").innerHTML="<img src='"+document.form1.UpFile.value+"' width=120 style='border:6px double #ccc'>"
	}
}
function check_addproduct(){
	<%String addpro_Message=(String)request.getAttribute("addpro_Message");
              if (addpro_Message!=null){
                  %>
	alert('<%=addpro_Message.replace("'","\\'")%>');
	<%
    }
    %>
}

</script>


	</head>

	<body onload="check_addproduct()">
		<form name="form1" action="${pageContext.request.contextPath}/servlet/AdminServlet?actionType=311" method="post">
			<br />
			<br />

			<table width="351" height="190" border="1" align="center"
				cellpadding="1" cellspacing="0">
				<tr>
					<td height="31" colspan="2" background="../img/header-bg1.png">
						<div align="center">
							增加商品
						</div>
					</td>
				</tr>
				<tr>
					<td>
						商品名称：
					</td>
					<td>
						<input type="text" name="pname" />
					</td>
				</tr>
				<tr>
					<td>
						商品类型：
					</td>
					<td>
						<select name="ptype">
							<option value="1">Cake</option>
							<option value="2">Drink</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>
						商品单价：
					</td>
					<td>
						<input type="text" name="price" />
						<p style="color: red">提示：价格只能为正浮点数(保留到小数点后两位)或0、0.0、0.00</p>
					</td>
				</tr>
				<tr>
					<td>
						商品数量：
					</td>
					<td>
						<input type="text" name="pcount" />
						<p style="color: red">提示：数量只能为正整数</p>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<div id="preview" ></div>
					</td>
				</tr>
				<tr>
					<td>
						商品图片：
					</td>
					<td>
						<input type="file" name="UpFile" onchange="yulan()" />
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<center>
							<input type="submit" name="Submit" value="增加" />
							<input type="reset" name="reset" value="重置" />
						</center>

					</td>
				</tr>
			</table>

			<br />
		</form>
	</body>
</html>
