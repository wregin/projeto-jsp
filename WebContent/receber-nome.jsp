<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	
	String nome = "Nome recebido: " + request.getParameter("nome");
	
		out.print(nome);
	%>
	
	<h1>ou</h1> <br/>
	
	<%= "Nome recebido: " + request.getParameter("nome") %>
	
	<br/><br/>
	<h1>REQUEST</h1>
	
	<br/>
	<%= request.getContextPath() %>
	
	<br/><br/>
	<%= request.getLocalAddr() %>
	
	<br/><br/>
	<%= request.getLocalPort() %>
	
	<br/><br/>
	<%= request.getProtocol() %>
	
	<br/><br/>
	<%= request.getRequestedSessionId() %>
	
	<br/><br/>
	<h1>RESPONSE</h1>
	<br/>
	
	<%= response%>
	
	<br/><br/>
	<% //response.sendRedirect("http://www.google.com.br"); %>
	
	<br/><br/>
	<h1>Sessão</h1>
	<%= session.getAttribute("curso") %>
	
	<br/><br/>
	<%@ page isErrorPage="true" %>
	<h1>Página de erro</h1>
	<%= exception %>
	
	<br/><br/>
	<h1>Rcebendo o forward</h1>
	<%= request.getParameter("paraforward") %>
	
	
</body>
</html>