<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
	
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<h1>JSTL</h1>

<c:out value="${'Bem vindo ao JSTL' }"/>
<c:set var="data" scope="page" value="${5 + 66 }"/>
<c:out value="${data}"></c:out>
<br/>
<c:out value="${data}"></c:out>
<c:remove var="data"/>
<c:out value="${data}"></c:out>
<br/>
<c:catch var="erro">
	<% int var = 100 / 0; %>
</c:catch>
<br/><br/>
<c:if test="${erro != null }">
	${ erro.message }
</c:if>
<br/><br/>

<c:set var="numero" value="${100 / 3 }" />
<c:forEach var="n" begin="1" end="${numero }">
	Item: ${n}
</c:forEach>
<br/>
<br/>

<c:forTokens items="Nome-segundonome-terceironome" delims="-" var="nome" >
	Nome: <c:out value="${nome }"/>
	<br/>
</c:forTokens>
<br/>

<c:url value="/acessoliberado.jsp" var="acesso">
	<c:param name="para1" value="111" />
	<c:param name="para2" value="222" />
</c:url>
${acesso }
<br/>

<!-- informar outra divisão para cair na condição -->
<c:set var="numero1" value="${100 / 2 }" />
<c:if test="${numero1 > 50 }">
	<c:redirect url="https://www.google.com.br" />
</c:if>

<c:if test="${numero1 < 50 }">
	<c:redirect url="https://www.google.com" />
</c:if>

<br/><br/>
<c:choose>
	
	<c:when test="${numero > 50 }">
		<c:out value="maior que 50"/>
	</c:when>
	
	<c:when test="${numero < 50 }">
		<c:out value="menor que 50"/>
	</c:when>
	
	<c:otherwise>
		<c:out value="Valor correto não foi encontrado!"/>
	</c:otherwise>
	

	
</c:choose>
<br/>



<br/>
<p/>
<p/>
<p/>
<p/>

<br/>
<br/>
<h1>Teste login</h1>

	<form action="LoginServlet" method="post">
		
		Login: 
		<input type="text" id="login" name="login" >
		<br/>
		Senha:
		<input type="text" id="senha" name="senha" >
		<br/>
		<br/>
		<input type="submit" value="Logar">
		
	
	</form>

</body>
</html>