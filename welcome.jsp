<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@page import="registration.UserRegDao"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>Welcome </h1>
	<%
	UserRegDao user=(UserRegDao)session.getAttribute("user");
	
	out.print("Yup:"+user.getEmailId());
	
	%>

</body>
</html>