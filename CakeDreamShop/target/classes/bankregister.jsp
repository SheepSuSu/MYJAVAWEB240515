<%@ page language="java" import="cake.wx.shopping.vo.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gbk" />
		<title>注册新用户</title>
		<style type="text/css">
<!--
.STYLE2 {
	color: black;
	font-size: 16px;
	font-weight: bold;
}

.STYLE3 {
	font-size: 12px
}

.STYLE8 {
	color: #FF0000
}

.STYLE5 {
	font-family: "宋体";
	font-size: 12px;
}
-->
</style>

		<script src="setday.js"></script>

		<script language="javascript">
var points = Array("0","0","0","0","0");
//检查所有;
function check_all(){
	checkBox();
	if(checkusername()){
		var i=0;
		while (i<=4){
		if(points[i]==="0"){
			alert("你的用户信息不正确,请检查!");
//			alert(points);
			i=10;
			return false;
		}else{i++;}
		};
	}else{
		return false;
	}
	return true;
}
//检查用户名;
function checkusername(){
	var msg=new Array(
	"<font color=\"red\" class=\"STYLE1\" >用户名不能为空</font>",
	"<font color=\"red\" class=\"STYLE1\" >用户名长度不正确</font>",
	"" );
	var username = 	document.getElementById("regbankusername").value;
	if (username === "") {
	    usermessage(0);
		points[0]="0";
		/*usermessage(0);*/
		//18:45修改
		return false;
	}
	if(username.length<4||username.length>18){
		points[0]="0";
		usermessage(1);
	    return false;
	}else{
	usermessage(2);
	points[0]="1";
	return true;
	}
	function usermessage(id){
		check_info.innerHTML = msg[id];	
	}
}
//检查登入密码;
function checkpassword(){
	var pwd = document.getElementById("regbankpassword").value;

	if (pwd.length<6||pwd.length>16){
		pwd_info.innerHTML = "<font color=\"red\">密码格式不正确</font>";
		points[1]="0";
		return false;
    }
	else{
	    document.getElementById("pwd_info").innerHTML = "";
		points[1]="1";
		return true;
	}
}
//检查密码是否一致;
function checkcpassword(){
	var pwd2 = document.getElementById("cpassword").value;
	if (pwd2==document.getElementById("regbankpassword").value){
		document.getElementById("pwdrepeat_info").innerHTML = "";
		points[2]="1";
		return true;
	} else{
		/*document.getElementById("pwdrepeat_info").innerHTML = "<font color=\"red\">两次输入的密码不一致，请检查后重试。</font>";*/
		pwdrepeat_info.innerHTML = "<font color=\"red\">两次输入的密码不一致，请检查后重试。</font>";
		points[2]="0";
		return false;
	}
}

function checkinitMoney(){
	var msg=new Array(
			"<font color=\"red\" class=\"STYLE1\" >初始金额不能为空</font>",
			"<font color=\"red\" class=\"STYLE1\" >初始金额不能为其他非法字符或负数，请重新填写。</font>",
			"" );
	var initMoney=document.getElementById("regeRMB").value;
	var reg=new RegExp("(^[1-9]([0-9]+)?(\\.[0-9]{1,2})?$)|(^(0){1}$)|(^[0-9]\\.[0-9]([0-9])?$)");
		if (initMoney===""){//判断为空
			usermessage(0);
			points[3]="0";
			return false;
		}else {//如果不为空
			if (reg.test(initMoney)){//判断是否为正整数或者正小数（小数位不超过2位）
				var money=parseFloat(initMoney);
				<%--<%System.out.println("money:"+request.getParameter("regeRMB"));%>--%>
				usermessage(2);
				points[3]="1";
				return true;
			} else {
				usermessage(1);
				points[3]="0";
				return false;
			}
		}

	function usermessage(id){
		RMB_info.innerHTML = msg[id];
	}
}
//检查协议;
function checkBox(){
	if (document.getElementById("agree").checked){
		points[4]="1";
		return true;
	}
	else {
		points[4]="0";
		alert("您未同意服务条款！")
		return false;
	}
}

</script>
	</head>

	<body bgcolor=#ffe4e1>
	<%
		User user=new User();
		user=(User)request.getSession().getAttribute("loginusername");
		if(user==null){
			response.sendRedirect("index.jsp");
		}
		/*else {
			request.getSession().setAttribute("loginusername",user.getUsername());
		}*/
  	%>
		<table width="71%" height="295" border="0" align="center"
			cellpadding="1" cellspacing="0">
			<tr>
				<td></td>
			</tr>
			<tr>
				<td align="center" bgcolor=#f0f8ff>
					<div id="content">
						<div id="container">
							<div class="topArc">
								<span class="left"><span class="right"></span>
								</span>
							</div>
							<p class="declare">
								请注意：带有
								<span class="STYLE3"><span class="STYLE8">*</span>
								</span>的项目必须填写。
							</p>
							<form action="servlet/ContrlServlet?valuetype=11" method="post"
								  onSubmit="return check_all(this);" name="form" id="form"
								autocomplete="off">
								<fieldset>
									<div align="left">
										<legend>
											<span class="STYLE2"> 请选择您的用户名:</span>
											<input type="hidden" name="cur_username" value="<%=user.getUsername()%>" />
										</legend>
									</div>
									<table width="663" class="blur">
										<tbody>
											<tr>
												<th width="144" valign="top">
													<label for="username">
														<div align="right" id="username">
															<i><br />
															</i><span class="STYLE3"><span class="STYLE8">*</span>虚拟银行帐户：</span>
														</div>
													</label>
												</th>
												<td width="233" class="input">
													<input class="text" type="text" id="regbankusername"
														name="regbankusername" onblur="checkusername()" />
													<div id="check_info">
													</div>
													<br />
												</td>
												<td width="270" bgcolor=#ffe4e1 class="desc "
													chgmodeblur="chgModeBlur" borderColor="#FFFFFF">
													<font size="2">&middot;由字母a～z(不区分大小写)、数字0～9、点、减号或下划线组成<br />
														&middot;只能以数字或字母开头和结尾<br /> &middot;用户名长度为4～18个字符</font>
												</td>
											</tr>
										</tbody>
									</table>
								</fieldset>
								<fieldset>
									<div align="left"></div>
									<div align="left">
										<legend>
											<span class="STYLE2"> 请填写安全设置</span><span>(&nbsp;以下信息对保护您的帐号安全极为重要，请您慎重填写并牢记&nbsp;)</span>
										</legend>
									</div>
									<table width="666" class="blur">
										<tbody>
											<tr>
												<th width="146" class="STYLE3">
													<label for="password">
														<div align="right" id="password">
															<span class="STYLE8">*</span><span class="STYLE5">
																登录密码：</span>
														</div>
													</label>
												</th>
												<td width="235" class="input">
													<input class="text" type="password" name="regbankpassword"
														   id="regbankpassword"	onblur="checkpassword()" />
													<div id="pwd_info"></div>
													<span></span>
												</td>
												<td width="269" rowspan="2" bgcolor=#ffe4e1 class="desc">
													<font size="2">密码长度6～16位，字母区分大小写</font>
												</td>
											</tr>
											<tr>
												<th class="STYLE3">
													<label for="cpassword">
														<div align="right">
															<span class="STYLE8">*</span>再次确认密码：
														</div>
													</label>
												</th>
												<td class="input">
													<input class="text" id="cpassword" type="password" name="cpassword"
														   id="cpassword" onblur="checkcpassword()"/>
													<div id="pwdrepeat_info"></div>
													<span></span>
												</td>
											</tr>
										</tbody>
									</table>
									
									
									<div class="hr"></div>
									<table width="666" class="blur">
										<tbody>
											<tr>
												<th width="148" valign="top">
													<label for="mail">
														<div align="right" id="mail">
															<span class="STYLE3"><span class="STYLE8">*</span>账户初始金额</span>：
														</div>
													</label>
												</th>
												<td width="238" valign="top" class="input">
													<input class="text" id="regeRMB" name="regeRMB" type="text"
														   onblur="checkinitMoney()"
														 />
													<div id="RMB_info"></div>
													<span></span>
												</td>
												<td width="264" bgcolor=#ffe4e1 class="desc">
													<font size="2">&middot;初始账户余额（单位：RMB）,可以为零、正整数或正小数（保留两位小数）</font>
												</td>
											</tr>
										</tbody>
									</table>
									<div class="hr"></div>
									<table class="blur">
										<tbody>
											<tr>
												<th>
													<label for="usercheckcode"></label>
												</th>
												<td class="input" id="usercheckcode">
													&nbsp;
												</td>
												<td></td>
											</tr>
											<tr>
												<th>
													<span class="STYLE8">*</span>
												</th>
												<td bgcolor=#eee8aa>
													<input id="agree" title="是否同意服务条款" type="checkbox"
														checked="checked" name="agree" />
													我已看过并同意《
													<a href="#">Cake服务条款</a>》
													<br />
													<font size="2"><span></span>
													</font>
												</td>
											</tr>
											<tr></tr>
										</tbody>
									</table>
								</fieldset>
								<div id="btn">
									<div align="center">
										<input name="submit" type="submit" id="confirm"
											 value="注册帐号" />
										<span></span>
									</div>
								</div>
							</form>
							<div class="bottomArc">
								<span class="left"><span class="right"></span>
								</span>
							</div>
						</div>
						<div id="footer">
							<br />
							&nbsp;2023-~&nbsp;Cake开发部
						</div>
					</div>
				</td>
			</tr>
		</table>
	</body>
</html>
