<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	succesfully logged out...
	
	<%
	response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
	session.removeAttribute("email");
	session.invalidate();
	response.sendRedirect("userloginnew.jsp");
	%>
	
</body>
</html>
