<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>User Page</title>
</head>
<% //In case, if User session is not set, redirect to Login page.
if((request.getSession(false).getAttribute("User")== null) )
{
%>
<jsp:forward page="/JSP/Login.jsp"></jsp:forward>
<%} %>

<body>

	<div class="langs">
	<a href="?locale=en_US">English</a> |
	<a href="?locale=zh_CN">中文</a>
	<fmt:setLocale value="${param.locale}"/>
	</div>
	
	<center><h2><fmt:bundle basename="I18N/page">
	<fmt:message key = "userlabel1.msg"></fmt:message>
	</fmt:bundle></h2></center>

    <fmt:bundle basename="I18N/page">
	<fmt:message key = "userlabel2.msg"></fmt:message>
	</fmt:bundle> <%=request.getAttribute("userName") %> </br>
	
 	<fmt:bundle basename="I18N/page">
	<fmt:message key = "managerlabel3.msg"></fmt:message>
	</fmt:bundle> <%=request.getAttribute("fullName") %>
	
    <div style="text-align: right"><a href="<%=request.getContextPath()%>/LogoutServlet">
	<fmt:bundle basename="I18N/page">
	<fmt:message key = "managerlabel5.msg"></fmt:message>
	</fmt:bundle></a>
	</div>
 
</body>
</html>