<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cadastro de telefones</title>
<link rel="stylesheet" href="resources/css/cadastro.css">


</head>
<body>
	<a href="acessoliberado.jsp">Início</a>
	<a href="login.jsp">Sair</a>

	<h1 style="text-align: center">Cadastro de telefones</h1>
	<h3 style="color: red; text-align: center">${msg }</h3>


	<form action="salvarTelefones" method="post" id="formUser"
		onsubmit="return validarCampos() ? true : false;">
		<ul class="form-style-1">
			<li>
				<table>
					<tr>
						<td>User:</td>
						<td><input type="text" readonly="readonly" id="id" name="id"
							value="${userEscolhido.id}"></td>
						<td><input type="text" readonly="readonly" id="nome"
							name="nome" value="${userEscolhido.nome}"></td>

					</tr>

					<tr>
						<td>Número:</td>
						<td><input type="text" id="numero" name="numero">
					</tr>

					<tr>
						<td>Tipo:</td>
						<td><select id="tipo" name="tipo">
								<option>Casa</option>
								<option>Celular</option>
								<option>Outros</option>
						</select>
					</tr>


					<tr>
						<td></td>
						<td><input type="submit" value="Salvar"></td>
					</tr>



				</table> <br />

			</li>
		</ul>
	</form>

	<div class="container">

		<table class="responsive-table">

			<caption>Telefones cadastrados</caption>
			<tr>
				<td><br /></td>
			</tr>
			<tr>
				<th>Id</th>
				<th>Número</th>
				<th>Tipo</th>
				<th>Excluir</th>


			</tr>
			<c:forEach items="${telefones}" var="telefone">
				<tr align="center">
					<td><c:out value="${telefone.id }"></c:out></td>
					<td><c:out value="${telefone.numero }"></c:out></td>
					<td><c:out value="${telefone.tipo }"></c:out></td>

					<td><a href="salvarTelefones?acao=deleteFone&telefoneId=${telefone.id }"><img
							src="resources/img/excluir.png" alt="excluir" title="Excluir"
							width="20px" height="20px" /> </a></td>
				</tr>
			</c:forEach>

		</table>

	</div>

	<script type="text/javascript">
		function validarCampos() {
			if (document.getElementById("numero").value == '') {
				alert("Informe o número!");
				return false;
			}

			return true;
		}
	</script>

</body>
</html>