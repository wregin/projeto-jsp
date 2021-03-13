<%@page import="beans.BeanCursoJsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cadastro de usuário</title>
<link rel="stylesheet" href="resources/css/cadastro.css">

<!-- Adicionando JQuery -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"
	integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
	crossorigin="anonymous"></script>

</head>
<body>
	<a href="acessoliberado.jsp"><img
			src="resources/img/home.png" alt="Início"
			title="Início" width="40px" height="40px" /></a>
	<a href="login.jsp"><img
			src="resources/img/exit.png" alt="Sair"
			title="Sair" width="40px" height="40px" /></a>

	<h1 style="text-align: center">Cadastro de usuário</h1>
	<h3 style="color: red; text-align: center">${msg }</h3>


	<form enctype="multipart/form-data" action="salvarUsuario"
		method="post" id="formUser"
		onsubmit="return validarCampos() ? true : false;">
		<ul class="form-style-1">
			<li>
				<table>
					<tr>
						<td>Código:</td>
						<td><input type="text" readonly="readonly" id="id" name="id"
							value="${user.id}">
						<td>Cep:</td>
						<td><input type="text" id="cep" name="cep" maxlength="9"
							onblur="consultaCep();" value="${user.cep }">
					</tr>
					<tr>
						<td>Login:</td>
						<td><input type="text" id="login" name="login"
							value="${user.login}">
						<td>Rua:</td>
						<td><input type="text" id="rua" name="rua"
							value="${user.rua }">
					</tr>

					<tr>
						<td>Senha:</td>
						<td><input type="password" id="senha" name="senha"
							value="${user.senha }">
						<td>Bairro:</td>
						<td><input type="text" id="bairro" name="bairro"
							value="${user.bairro }">
					</tr>

					<tr>
						<td>Nome:</td>
						<td><input type="text" id="nome" name="nome" maxlength="15"
							value="${user.nome }" placeholder="placeholder e tamanho máximo">
						<td>Cidade:</td>
						<td><input type="text" id="cidade" name="cidade"
							value="${user.cidade }">
					</tr>

					<tr>
						<td>Fone:</td>
						<td><input type="text" id="fone" name="fone" maxlength="13"
							value="${user.fone }">
						<td>Estado:</td>
						<td><input type="text" id="uf" name="uf"
							value="${user.estado }">
					</tr>

					<tr>
						<td>IBGE:</td>
						<td><input type="text" id="ibge" name="ibge"
							value="${user.ibge }">
						<td>Ativo:</td>
						<td><input type="checkbox" id="ativo" name="ativo" 
						<% if (request.getAttribute("user") != null) {
							BeanCursoJsp user = (BeanCursoJsp) request.getAttribute("user");
							
							if (user.isAtivo()) {
								out.print(" checked=\"checked\"");
								out.print(" ");
							}
							
						} 
						%> > </td>	
							
					</tr>

					<tr>
						<td>Foto:</td>
						<td><input type="file" id="foto" name="foto"> <!--   <input
							type="text" style="display: none;" name="fototemp"
							readonly="readonly" value="${user.fotoBase64}" /> <input
							type="text" style="display: none;" name="contentTypetemp"
							readonly="readonly" value="${user.contentType}" />    -->
							<td>Sexo:</td>
							<td>
							<input type="radio" id="sexo" name="sexo"
							<%
								if (request.getAttribute("user") != null) {
									
								 	BeanCursoJsp user = (BeanCursoJsp) request.getAttribute("user");
									if (user.getSexo().equalsIgnoreCase("masculino")) {
										out.print(" checked=\"checked\"");
										out.print(" ");
									}
									
								}
							%>
							
							 value="masculino">Masculino 
							<input type="radio" id="sexo" name="sexo" 
							<%
								if (request.getAttribute("user") != null) {
									
								 	BeanCursoJsp user = (BeanCursoJsp) request.getAttribute("user");
									if (user.getSexo().equalsIgnoreCase("feminino")) {
										out.print(" checked=\"checked\"");
										out.print(" ");
									}
									
								}
							%>
							value="feminino">Feminino
							</td>
					</tr>

					<tr>
						<td>Currículo:</td>
						<td><input type="file" id="curriculo" name="curriculo"> <!--  
							<input type="text" style="display: none;" name="curriculotemp"
							readonly="readonly" value="${user.curriculoBase64}" /> <input
							type="text" style="display: none;"
							name="contentTypeCurriculotemp" readonly="readonly"
							value="${user.contentTypeCurriculo}" />    -->
						<td>Perfil:</td>
						<td> 
						<select id="perfil" name="perfil" >
						<option value="nao_informado" > [.. SELECIONE .. ] </option>
						<option value="administrador" 
						<%
								if (request.getAttribute("user") != null) {
									
								 	BeanCursoJsp user = (BeanCursoJsp) request.getAttribute("user");
									if (user.getPerfil().equalsIgnoreCase("administrador")) {
										out.print(" selected=\"selected\"");
										out.print(" ");
									}
									
								}
						%>
						>Administrador</option>
						<option value="secretario" 
						<%
								if (request.getAttribute("user") != null) {
									
								 	BeanCursoJsp user = (BeanCursoJsp) request.getAttribute("user");
									if (user.getPerfil().equalsIgnoreCase("secretario")) {
										out.print(" selected=\"selected\"");
										out.print(" ");
									}
									
								}
						%>
						>Secretário</option>
						<option value="gerente" 
						<%
								if (request.getAttribute("user") != null) {
									
								 	BeanCursoJsp user = (BeanCursoJsp) request.getAttribute("user");
									if (user.getPerfil().equalsIgnoreCase("gerente")) {
										out.print(" selected=\"selected\"");
										out.print(" ");
									}
									
								}
						%>
						>Gerente</option>
						<option value="funcionario" 
						<%
								if (request.getAttribute("user") != null) {
									
								 	BeanCursoJsp user = (BeanCursoJsp) request.getAttribute("user");
									if (user.getPerfil().equalsIgnoreCase("funcionario")) {
										out.print(" selected=\"selected\"");
										out.print(" ");
									}
									
								}
						%>
						>Funcionário</option>
						
						</select>
						
						</td>	
							
					</tr>



					<tr>
						<td></td>
						<td><input type="submit" value="Salvar" > <input
							type="submit" value="Cancelar"
							onclick="document.getElementById('formUser').action = 'salvarUsuario?acao=reset'"></td>
					</tr>



				</table> 

			</li>
		</ul>
	</form>
	
	<form method="post" action="servletPesquisa" >
		<ul class="form-style-1" >
			<li>
				<table>
				<tr>
				<td>Descrição:</td>
				<td><input type="text" id="descricaoconsulta" name="descricaoconsulta"></td>
				<td><input type="submit" value="Pesquisar"></td>
				
				</tr>
				</table>
			</li>	
		</ul>	
	</form>

	<div class="container">

		<table class="responsive-table">

			<caption>
				<h2>Usuários cadastrados</h2>
			</caption>
			<tr>
				<td><br /></td>
			</tr>
			<tr>
				<th>Id</th>
				<th>Login</th>
				<th>Foto</th>
				<th>Currículo</th>
				<th>Nome</th>
				<th>Fone</th>
				<th>Cep</th>
				<th>Rua</th>
				<th>Bairro</th>
				<th>Cidade</th>
				<th>Estado</th>
				<th>IBGE</th>
				<th>Deletar</th>
				<th>Editar</th>
				<th>Telefones</th>

			</tr>
			<c:forEach items="${usuarios}" var="user">
				<tr align="center">
					<td style="width: 50px"><c:out value="${user.id }"></c:out></td>
					<td style="width: 150px"><c:out value="${user.login }"></c:out></td>

					<c:if test="${ user.fotoBase64Miniatura.isEmpty() == false}">
						<td><a
							href="salvarUsuario?acao=download&tipo=imagem&user=${user.id }">
								<img src='<c:out value="${user.fotoBase64Miniatura }"/>' alt="imagem"
								title="imagem" width="32px" height="32px" />
						</a></td>
					</c:if>

					<c:if test="${ user.fotoBase64Miniatura.isEmpty() == true }">
						<td><img src="resources/img/userpadrao.jpeg" alt="imagem"
							title="imagem" width="32px" height="32px" onclick="alert('Não tem')" /></td>
					</c:if>

					<td><c:if test="${ user.curriculoBase64.isEmpty() == false }">
							<a
								href="salvarUsuario?acao=download&tipo=curriculo&user=${user.id }">
								
								 <img src="resources/img/pdf.png" alt="imagem" title="imagem"
								width="32px" height="32px" /> 
							</a>
						</c:if> <c:if test="${ user.curriculoBase64.isEmpty() == true }">
						
							     <img src="resources/img/pdf.png" alt="imagem" title="imagem"
								width="32px" height="32px" onclick="alert('Não tem')" />
						</c:if></td>
					<td><c:out value="${user.nome }"></c:out></td>
					<td><c:out value="${user.fone }"></c:out></td>
					<td><c:out value="${user.cep }"></c:out></td>
					<td><c:out value="${user.rua }"></c:out></td>
					<td><c:out value="${user.bairro }"></c:out></td>
					<td><c:out value="${user.cidade }"></c:out></td>
					<td><c:out value="${user.estado }"></c:out></td>
					<td><c:out value="${user.ibge }"></c:out></td>
					<td><a href="salvarUsuario?acao=delete&user=${user.id }" onclick="return confirm('Confirma a exclusão?')" ><img
							src="resources/img/excluir.png" alt="excluir" title="Excluir"
							width="20px" height="20px" /> </a>
					<td><a href="salvarUsuario?acao=editar&user=${user.id }"><img
							src="resources/img/editar.jpeg" alt="editar" title="Editar"
							width="20px" height="20px" /></a>
					<td><a href="salvarTelefones?acao=addFone&user=${user.id }"><img
							src="resources/img/telefone.png" alt="telefones"
							title="telefones" width="20px" height="20px" /></a>
				</tr>
			</c:forEach>

		</table>

	</div>

	<script type="text/javascript">
		function validarCampos() {
			if (document.getElementById("login").value == '') {
				alert("Informe o login!");
				return false;
			}

			else if (document.getElementById("senha").value == '') {
				alert("Informe a senha!");
				return false;
			}

			else if (document.getElementById("nome").value == '') {
				alert("Informe o nome!");
				return false;
			}

			else if (document.getElementById("fone").value == '') {
				alert("Informe o fone!");
				return false;
			}
			return true;
		}

		function consultaCep() {
			var cep = $("#cep").val();

			//Consulta o webservice viacep.com.br/
			$.getJSON("https://viacep.com.br/ws/" + cep + "/json/?callback=?",
					function(dados) {

						if (!("erro" in dados)) {

							$("#rua").val(dados.logradouro);
							$("#bairro").val(dados.bairro);
							$("#cidade").val(dados.localidade);
							$("#uf").val(dados.uf);
							$("#ibge").val(dados.ibge);

						} //end if.
						else {

							$("#rua").val('');
							$("#bairro").val('');
							$("#cidade").val('');
							$("#uf").val('');
							$("#ibge").val('');

							alert("CEP não encontrado.");
						}
					});
		}
	</script>
	</ body>
</html>