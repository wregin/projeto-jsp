<jsp:useBean id="calcula" class="beans.BeanCursoJsp" type="beans.BeanCursoJsp" scope="page" />

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<jsp:setProperty property="*" name="calcula" />
	<h2>Cabeçalho</h2>
	Nome: <jsp:getProperty property="nome" name="calcula" />
	<br/>
	Ano: <jsp:getProperty property="ano" name="calcula" />
	<br/>
	Sexo: <jsp:getProperty property="sexo" name="calcula" />
	<br/>
	<br/>
	<h1>ou com expressão language jsp</h1>
	<br/>
		Nome: ${param.nome}
		<br/>
		Ano: ${param.ano}
		<br/>
		Sexo: ${param.sexo}	
		<br/><br/>
		${sessionScope.nomeaqui }
		
</body>
</html>