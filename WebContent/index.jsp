<jsp:useBean id="calcula" class="beans.BeanCursoJsp" type="beans.BeanCursoJsp" scope="page" />


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
	<%@ taglib prefix="myprefix" uri="/WEB-INF/testetag.tld"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<h1>Bem vindo ao curso JSP</h1>
	<%
		out.print("out na JSP");
	%>
	

	<form action="receber-nome.jsp">
	
		<input type="text" id="nome" name="nome"> 
		<input type="submit" value="Enviar"></input>
		
	</form>
	
		<br/><br/>
	<%! int cont = 2;
	
		public int retorna(int n) {
			return n* 3;
		}
	%>
	
	<%= cont %>
	
	<br/><br/>
	
	<%= retorna(8) %>
	
	<br/><br/>
	
	<%= application.getInitParameter("estado") %>
	
	<% session.setAttribute("curso", "curso jsp"); %>
	
	<br/><br/>
	<h1>Directivas</h1>
	<br/>
	
	<%@ page import="java.util.Date" %>
	<%= "Data de hoje....: " + new Date() %>
	
	<%@ page info="Página do curso jsp" %>
	<!--  getServletInfo() -->
	
	<br/><br/>
	<h1>rodar ação ou chamar página em caso de erro lendo a Exception</h1>
	<%@ page errorPage="receber-nome.jsp" %>
	<%= 100/2 %>
	
	<br/><br/>
	<h1>Include</h1>
	<br/>
	
	<%@ include file="pagina-include.jsp" %>
	
	<br/><br/>
	<h1>Customizando tag</h1>
	<br/>
	<myprefix:minhatag/>
	
	
	<!-- forward redirecionar -->
	<%--  <jsp:forward page="receber-nome.jsp">
	<jsp:param value="curso java jsp" name="paraforward"/>
	</jsp:forward> --%>
	
	<br/><br/>
	<h1>Include jsp</h1>
	
	<jsp:include page="cabecalho.jsp"></jsp:include>
	<h3>dasdadad</h3>
	
	<jsp:include page="rodape.jsp"></jsp:include>
	<h3>dasdadaddddadadad</h3>
	
	<br/><br/>
	<h1>testando Bean, a declaração vai lá em cima</h1>
	
	<%= calcula.calcula(50) %>
	
	<br/>
	
	<jsp:setProperty property="*" name="calcula"/>	
	<br/>
	<form action="cabecalho.jsp" method="post" >
	
		<input type="text" id="nome" name="nome"  />
		<br/>
		<input type="text" id="ano" name="ano"  />
		<br/>
		<input type="text" id="sexo" name="sexo"  />
		<br/>
		
		<input type="submit" value="Testar" />
	
	</form>
	
	<% session.setAttribute("nomeaqui", "javaaaaa"); %>
	<a href="cabecalho.jsp">ver teste</a>
	
</body>
</html>