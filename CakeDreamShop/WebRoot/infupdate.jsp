<%@ page language="java" import="java.util.*,cake.wx.shopping.vo.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>用户信息修改</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

<style type="text/css">
<!--
.STYLE1 {
	font-size: 12px
}

.STYLE5 {
	font-family: "宋体";
	font-size: 12px;
}

.STYLE8 {
	color: #FF0000
}

.STYLE9 {
	font-size: 16px
}

.STYLE10 {
	font-size: 16px;
	color: #333333;
}

#Layer1 {
	position: absolute;
	left: 305px;
	top: 5px;
	width: 59px;
	height: 39px;
	z-index: 1;
}
-->
</style>

<script language="javascript">
var points = Array("0","0","0","0","0","0" );
//检查所有;
function checkall(){
	var i=0;
	while (i<=5){
	if(points[i]=="0"){
	alert("你的用户信息不正确,请检查!");
	/*alert(points);*/
	i=10;
	return false;
	}
	else{
	i++;
	}
	}
	return true;
}

//检查登入密码;
function checkpassword(){
	var pwd = document.getElementById("mypassword").value;

	if (pwd.length<6||pwd.length>16){
		pwd_info.innerHTML = "<font color=\"red\">密码格式不正确</font>";
		points[0]="0";
		return false;
    }
	else{
	    document.getElementById("pwd_info").innerHTML = "";
		points[0]="1";
		return true;
	}
}

//检查新密码;
function checknewpassword(){
	var pwd = document.getElementById("newpassword").value;

	if (pwd.length<6||pwd.length>16){
		newpwd_info.innerHTML = "<font color=\"red\">密码格式不正确</font>";
		points[1]="0";
		return false;
    }
	else{
	    document.getElementById("newpwd_info").innerHTML = "";
		points[1]="1";
		return true;
	}
}

//检查密码是否一致;
function checkcpassword(){
	var pwd2 = document.getElementById("cqpassword").value;
	if (pwd2===document.getElementById("newpassword").value){
		document.getElementById("pwdrepeat_info").innerHTML = "";
		points[2]="1";
		return true;
	} else{
		document.getElementById("pwdrepeat_info").innerHTML = "<font color=\"red\">两次输入的密码不一致，请检查后重试。</font>";
		points[2]="0";
		return false;
	}
}

function checktelphone() {
	var tel = document.form1.telphone.value;
	var maxLength = 11; // 电话号码的最大长度

	if (tel.length !== maxLength) {
		/*alert("您输入的电话号码有误!!");*/
		document.getElementById("tel_info").innerHTML = "<font color=\"red\">您输入的电话号码有误，请重输</font>";
		points[3] = "0";
		return false;
	} else {
		document.getElementById("tel_info").innerHTML = "";
		points[3] = "1";
		return true;
	}
}

//检查年龄;
function checkyear(){
	var year=/^[0-9]\d*$/;
	var yeara=document.getElementById("year").value;
	if(year.test(yeara)){
		points[4]="1";
		year_info.innerHTML=""
		return true;
	}else{
	year_info.innerHTML="<font color=\"red\">年龄必须为正整数</font>"
	points[4]="0";
	return false;
	}
}



//检查地址;
function checkadd(){
	if(document.form1.address.value==""){
		address_info.innerHTML="<font color=\"red\">地址不能为空,请确认</font>";
		points[5]="0";
		return false;
	}else{
	address_info.innerHTML="";
	points[5]="1";
	return true;
	}
}

</script>

</head>

<body bgcolor="#FF9966" leftmargin="0" topmargin="0" marginwidth="0"
		marginheight="0">
	<%
		User user=new User();
		user=(User)request.getSession().getAttribute("loginusername");
		if(user==null){
			response.sendRedirect("index.jsp");
		}
	%>
<table width="637" height="647" border="0" align="center"
			cellpadding="1" cellspacing="0">
			<tr>
				<td align="center" valign="top">
<table width="634" height="46" border="0" align="center" cellpadding="1">
						<tr>
							<td width="542" class="STYLE5">
								<jsp:include page="ui.html"></jsp:include>
						  </td>
					  </tr>
				  </table>
					<form id="form1" name="form1" method="post" onSubmit="return checkall();"
						action="servlet/ContrlServlet?valuetype=8">
						<table width="95%" height="144" border="1" cellpadding="1"
							cellspacing="0" bordercolor="#CCCCCC">
							<tr>
								<td width="28%" height="27" class="STYLE1">
									<div align="right">
										<span class="STYLE8">*</span>旧密码：									</div>								</td>
								<td width="33%">
									<div align="center">
										<label for="mypassword">
										<input type="password" name="mypassword" id="mypassword"
											onBlur="checkpassword()" />
										<div id="pwd_info"></div>
										</label>
									</div>								</td>
								<td width="39%" bgcolor="#fffafa" class="STYLE1">
									<span class="desc STYLE5"><span class="desc STYLE6">·</span>密码长度6～16位，字母区分大小写</span>								</td>
							</tr>
							<tr>
								<td height="20" class="STYLE1">
									<div align="right">
										<span class="STYLE8">*</span>新密码：									</div>								</td>
								<td>
									<div align="center">
										<label for="newpassword">
										<input type="password" name="newpassword" id="newpassword"
											onBlur="checknewpassword()" />
										<div id="newpwd_info"></div>
										</label>
									</div>								</td>
								<td bgcolor="#fffafa" class="STYLE1">
									<span class="desc STYLE5"><span class="desc STYLE6">·</span>密码长度6～16位，字母区分大小写</span>								</td>
							</tr>
							<tr>
								<td height="35" class="STYLE1">
									<div align="right">
										<span class="STYLE8">*</span>请再次确认新密码：									</div>								</td>
								<td>
									<div align="center">
										<label for="cqpassword">
										<input type="password" name="cqpassword" id="cqpassword"
											onBlur="checkcpassword()" />
										<div id="pwdrepeat_info"></div>
										</label>
									</div>								</td>
								<td bgcolor="#fffafa" class="STYLE1">
									<span class="desc STYLE6 STYLE7"><span
										class="desc STYLE6">·</span>答案长度6～30位，字母区分大小写，一个汉字占两位</span>								</td>
							</tr>
							<tr>
								<td height="20" class="STYLE1">
									<div align="right">
										<span class="STYLE8">*</span>年龄：									</div>								</td>
								<td>
									<div align="center">
										<input type="text" name="year" id="year"
											onBlur="checkyear()"  />
										<div id="year_info"></div>
									</div>								</td>
								<td class="STYLE1">&nbsp;							  </td>
							</tr>
							<tr>
								<td height="20" class="STYLE1">
									<div align="right">
										<span class="STYLE8">*</span>电话：									</div>								</td>
								<td>
									<div align="center">
										<input type="text" name="telphone" id="telphone" onBlur="checktelphone()" />
										<div id="tel_info"></div>
									</div>								</td>
								<td bgcolor="#fffafa" class="STYLE1">
									<span class="desc STYLE6">·</span><span class="STYLE5">联系电话暂无检查（除了长度）</span>								</td>
							</tr>
							<tr>
								<td height="20" class="STYLE1">
									<div align="right">
										<span class="STYLE8">*</span>地址：									</div>								</td>
								<td>
									<div align="center">
										<input type="text" name="address" id="adress" onblur="checkadd()"/>
										<div id="address_info"></div>
									</div>								</td>
								<td bgcolor="#fffafa" class="STYLE1">
									<span class="desc STYLE6">·</span><span class="STYLE5">填写英文地址</span>								</td>
							</tr>
						</table>
						<p>
							<input type="submit" name="Submit" value="修  改">

							<input type="reset" name="Submit2" value="重 置">
						</p>
					</form>
				</td>
			</tr>
</table>
		<!-- End ImageReady Slices -->
</body>
</html>
