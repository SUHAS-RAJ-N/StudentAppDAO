<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.Random" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body align="center">
<%@include file="header.jsp" %>
<% Random d=new Random(); %>
<h1><%=d.nextLong() %></h1>
<%@include file="Footer.jsp" %>
</body>
</html>