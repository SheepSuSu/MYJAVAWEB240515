<%--
  Created by IntelliJ IDEA.
  User: 31246
  Date: 2024/5/8
  Time: 18:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java"  pageEncoding="utf-8"%>
<%@page import="cake.wx.shopping.factory.DAOFactory"%>
<%@page import="cake.wx.shopping.vo.Product"%>
<%@page import="cake.wx.shopping.vo.*"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>商品评价页面</title>
    <style type="text/css">
        table {
            font-size: 12px;
            background-color: lavenderblush;

            border: 1px solid #a4d2e8;
        }
    </style>
    <script language="javascript">
        var pd=0;
        function checkALL(){
            if (pd===0){
                alert("填写评分有误！")
                return false;
            }
            if (pd===1){
                return true;
            }
        }
        function checkScore(){
            var msg=new Array(
                "<font color=\"red\" >评分格式不符合要求！</font>",
                "" );
            var score=document.getElementById("satisfaction").value;
            var reg=new RegExp("^(?:[0-4]\\d?(\\.\\d{1,2})?|5(?:\\.0{1,2})?)$");
            if (reg.test(score)){
                usermessage(1);
                pd=1;
                return true;
            }else {
                usermessage(0);
                pd=0;
                return false;
            }

            function usermessage(id){
                score_info.innerHTML = msg[id];
            }
        }

    </script>
</head>

<body>
<%
    String pname=(String)request.getSession().getAttribute("pname");
    System.out.println(pname);
    Product product= new Product();
    /*product = DAOFactory.getProductDAOInstance().selectById("P001");*/
    try {
        product = DAOFactory.getProductDAOInstance().selectItemByName(pname);
    } catch (Exception e) {
        e.printStackTrace();
    }
    String pid=product.getPid();
    System.out.println("pid is:"+pid);
    request.getSession().setAttribute("Pid",pid);
    if(product==null){
        System.out.println("Can't get product!");
    }
%>
<form  action="${pageContext.request.contextPath}/servlet/ScoreServlet?ScoreType=1" method="post"
       onsubmit="return checkALL(this)">
    <table width="469" height="287" border="1" align="center" cellpadding="1" cellspacing="0">
        <tr ><td colspan="2"><center><font color="black" size="4">评价商品</font></center></td></tr>
        <tr>
            <td width="227" height="204"><table width="200" height="200" border="0" cellpadding="1" cellspacing="0">
                <tr>
                    <td><img src="<%=product.getImgpath() %>"></td>
                </tr>
            </table></td>
            <td width="498"><p><font color="black">
                产品名称：</font>
                <p><%=product.getPname() %></p>
            </p>
                <p><font color="black">
                    您对本商品的评分：
                </font><input type="text" id="satisfaction" name="satisfaction" onblur="checkScore()"/>
                </p>
                <p><font color="black">
                    请注意！评分可以为0~5之间的整数或小数，小数位不超过2位。
                </font></p>
            <div id="score_info"></div></td>
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
