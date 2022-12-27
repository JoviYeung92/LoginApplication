<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Login</title>
</head>

<body>
	<div class="langs">
	<a href="?locale=en_US">English</a>|
	<a href="?locale=zh_CN">中文</a>
	<fmt:setLocale value="${param.locale}"/>
	</div>
	
    <form name="form" action="<%=request.getContextPath()%>/LoginServlet" method="post">

    <table align="center">
    
    <tr>
    <td><fmt:bundle basename="I18N/page">
	<fmt:message key = "loginlabel1.msg"></fmt:message>
	</fmt:bundle></td>
    <td><input type="text" name="username" /></td>
    </tr>
    
    <tr>
    <td><fmt:bundle basename="I18N/page">
	<fmt:message key = "loginlabel2.msg"></fmt:message>
	</fmt:bundle></td>
    <td><input type="text" name="password" /></td>
    <td><span style="color:red"><%=(request.getAttribute("errMessage") == null) ? "" : request.getAttribute("errMessage")%></span></td>
    </tr>
    
    <tr>
    <td><p style="color:black;font-size:11px;font-style:italic;">
    <fmt:bundle basename="I18N/page">
	<fmt:message key = "loginlabel3.msg"></fmt:message>
	</fmt:bundle>
	</p></td>
    </tr>
    
    <tr>
    <td></td>
    <td>
    <input type="submit" value=<fmt:bundle basename="I18N/page">
	<fmt:message key = "loginbutton1.msg"></fmt:message>
	</fmt:bundle>></input>
	
    <input type="reset" value=<fmt:bundle basename="I18N/page">
	<fmt:message key = "loginbutton2.msg"></fmt:message>
	</fmt:bundle>></input>
    </td>
    </tr>
    
    </table>
    </form>
</body>
</html>