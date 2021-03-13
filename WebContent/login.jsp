<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/estilo.css">
</head>
<body>


	<div class="login-page">
	
	<center><h3>Projeto didático</h3></center>
	</br>
	<center><h3>JSP + SERVLET + JDBC</h3></center>
	<center><span>Usuário: admin / Senha: admin</span></center>
	
		<div class="form">
			<form action="LoginServlet" method="post" class="login-form">

				Login: <input type="text" id="login" name="login"> <br />
				Senha: <input type="text" id="senha" name="senha"> <br /> <br />
				<button type="submit" value="Logar">Logar</button>
			</form>
		</div>		
		<center><a style="text-decoration: none;" href="https://www.google.com.br/"/> Google - ou um link qualquer, ex: resetar senha  </center>
		</br>
		</br>
		</br>
	</div>
</body>
</html>