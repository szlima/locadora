<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="pt-br">
	<head>
		<meta charset="UTF-8"/>
		<title>Locadora Virtual</title>
		<link rel="stylesheet" type="text/css" href="estilo.css"/>
	</head>
	<body>
	
		<header>
			<img width="5%" height="5%" src="icone.png"/>
			<h1>Locadora Virtual</h1>
			<img width="5%" height="5%" src="icone.png"/>		
		</header>
		
		<main>
			
			<jsp:useBean id="locadoraBean" class="locadora.negocio.LocadoraBean" scope="page">
				<jsp:setProperty name="locadoraBean" property="sistema" value="${sistema}"/>
			</jsp:useBean>
			
			<c:if test="${not empty param.Add}">				
				<c:set var="idF" value="${param.Add}"/>
				
				<jsp:setProperty name="locadoraBean" property="idFilme" value="${idF}"/>
				<c:set var="filmeAdicionado" value="${locadoraBean.filme}"/>
				
				<h3>Voc� adicionou o filme "${filmeAdicionado.titulo}" ao seu carrinho.</h3>			
			</c:if>			
			
			<c:choose>
				<c:when test="${sessionScope.carrinho.numeroItens > 0}">
					
					<c:url var="url" value="/mostrarCarrinho">
						<c:param name="limpar" value="0"/>
						<c:param name="remover" value="0"/>
					</c:url>
				
					<p>
						<a href="${url}">Ver carrinho</a>
					
						<c:url var="url" value="/alugar"/>
						<a href="${url}">Finalizar aluguel</a>					
					</p>
				
				</c:when>
				<c:otherwise>
					<p>Seu carrinho est� vazio.</p>
				</c:otherwise>			
			</c:choose>
			
					
			<h3 class="titulo">Filmes do acervo</h3>
			
			<table>
				<c:forEach var="filme" begin="0" items="${locadoraBean.filmes}">
									
					<tr>
						<c:set var="idFilme" value="${filme.idFilme}"/>
							
						<td class="nome-filme destaque-filme">
							<c:url var="url" value="/detalhesFilme">
								<c:param name="idFilme" value="${idFilme}"/>
							</c:url>
							<a href="${url}">${filme.titulo}</a>
						</td>
						
						<td rowspan=2 class="preco-filme destaque-filme">
							<fmt:formatNumber value="${filme.preco}" type="currency"/>						
						</td>
						
						<td rowspan=2 class="alugar-filme destaque-filme">
							<c:url var="url" value="/catalogo">
								<c:param name="Add" value="${idFilme}"/>
							</c:url>
							<a href="${url}">Adicionar ao carrinho</a>
						</td>					
					</tr>
						
					<tr>
						<td>${filme.diretores}</td>
					</tr>
					
				
				</c:forEach>			
			</table>			
			
		</main>
		
		<footer>
			<p>Copyright 2021 - Locadora Virtual.</p>	
			<p>�cones feitos por <a href="https://www.flaticon.com/br/autores/ayub-irawan" title="Ayub Irawan">Ayub Irawan</a> from <a href="https://www.flaticon.com/br/" title="Flaticon">www.flaticon.com</a></p>
		</footer>		
	
	</body>
</html>