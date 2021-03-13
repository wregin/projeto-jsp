<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cadastro de produtos</title>
<link rel="stylesheet" href="resources/css/cadastro.css">

<script src="resources/javascript/jquery.min.js" type="text/javascript" ></script>
<script src="resources/javascript/jquery.maskMoney.min.js" type="text/javascript" ></script>
<script src="" ></script>

</head>
<body>
<a href="acessoliberado.jsp">Início</a>
<a href="login.jsp">Sair</a>

	<h1 style="text-align: center">Cadastro de produtos</h1>
	<h3 style="color: red; text-align: center">${msg }</h3>


	<form action="salvarProduto" method="post" id="formUser" onsubmit="return validarCampos() ? true : false;" >
		<ul class="form-style-1">
			<li>
				<table>
					<tr>
						<td>Código:</td>
						<td><input type="text" readonly="readonly" id="id" name="id"
							class="field-long" value="${produto.id }">
					</tr>
					<tr>
						<td>Nome:</td>
						<td><input type="text" id="nome" name="nome" maxlength="16"
							value="${produto.nome }">
					</tr>

					<tr>
						<td>Quantidade:</td>
						<td><input type="text" id="quantidade" name="quantidade" maxlength="3" placeholder="java script só número"
							value="${produto.quantidade }" >
					</tr>

					<tr>
						<td>Valor:</td>
						<td><input type="text" id="valor" name="valor" maxlength="12" data-thousands="." data-decimal="," 
							value="${produto.valorEmTexto }">
					</tr>
					
					<tr>
						<td>Categoria:</td>
						<td>
							<select id="categorias" name="categoria_id">
							<c:forEach items="${categorias }" var="cat" >
								<option value="${cat.id }" id="${cat.id }" 
								
								<c:if test="${cat.id == produto.categoria_id }">
								<c:out value="selected=selected" />
								</c:if>  				>
									${cat.nome }
								</option>
							</c:forEach>
							
							</select>
						</td>
					</tr>


					<tr>
						<td></td>
						<td><input type="submit" value="Salvar"> <input
							type="submit" value="Cancelar" id="Cancelar"
							onclick="document.getElementById('formUser').action = 'salvarProduto?acao=reset'"></td>
					</tr>



				</table> <br />

			</li>
		</ul>
	</form>

	<div class="container">

		<table class="responsive-table">

			<caption>Produtos cadastrados</caption>
			<tr>
				<td><br /></td>
			</tr>
			<tr>
				<th>Id</th>
				<th>Nome</th>
				<th>Quantidade</th>
				<th>Valor</th>

			</tr>
			<c:forEach items="${produtos}" var="produto">
				<tr align="center">
					<td style="width: 50px"><c:out value="${produto.id }"></c:out></td>
					<td style="width: 150px"><c:out value="${produto.nome }"></c:out></td>
					<td><c:out value="${produto.quantidade }"></c:out></td>
					<td><fmt:formatNumber type="number" maxFractionDigits="2" value="${produto.valor} " /> </td>
					<td><a href="salvarProduto?acao=delete&produto=${produto.id }"><img
							src="resources/img/excluir.png" alt="excluir" title="Excluir"
							width="20px" height="20px" /> </a>
					<td><a href="salvarProduto?acao=editar&produto=${produto.id }"><img
							src="resources/img/editar.jpeg" alt="editar" title="Editar"
							width="20px" height="20px" /></a>
				</tr>
			</c:forEach>

		</table>

	</div>
<script type = "text/javascript">
		function validarCampos() {
			
			if (document.getElementById("nome").value == '') {
				alert("Informe o nome!");
				return false;
			}
			
			else if (document.getElementById("quantidade").value == '') {
				alert("Informe a quantidade!");
				return false;
			}
			
			else if (document.getElementById("valor").value == '') {
				alert("Informe o valor!");
				return false;
			} 
			
			return true;
		}
	</script>

</body>

<script type="text/javascript">

$(function() {
	$('#valor').maskMoney();
});

  $(document).ready(function() {
	  $("#quantidade").keyup(function() {
		  $("#quantidade").val(this.value.match(/[0-9]*/));
	  });
  });

</script>

</html>