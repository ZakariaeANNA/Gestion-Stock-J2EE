<?xml version="1.0" encoding="ISO-8859-1" ?>
<jsp:root xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" version="2.0">
    <jsp:directive.page language="java"
        contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" />
    <jsp:text>
        <![CDATA[ <?xml version="1.0" encoding="ISO-8859-1" ?> ]]>
    </jsp:text>
    <jsp:text>
        <![CDATA[ <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> ]]>
    </jsp:text>
<html xmlns="http://www.w3.org/1999/xhtml"
xmlns:f="http://java.sun.com/jsf/core"
xmlns:a="http://xmlns.jcp.org/jsf/passthrough"
xmlns:h="http://java.sun.com/jsf/html">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<meta charset="UTF-8"/>
  	<title>Gestion Stock</title>
	<link rel="stylesheet" href="css/UpdateStyle.css"/>
	<![CDATA[
	<link rel="stylesheet" href="css/indexStyle.css"/>
	<link rel="stylesheet" href="css/UpdateStyle.css"/>
	<link rel="stylesheet" type="text/css" href="css/jquery.dataTables.min.css"/>
	<script src="js/jquery-3.6.0.js"></script>
	<script>
		$(document).ready(function(){
			$("#myModal").hide();
  			$("#myModal1").hide();
  			$("#myModal2").hide();
		});
	</script>
	]]>

</head>
<body>

<f:view>
	<div class="nav-btn">Menu</div>
	<div class="container">
		<div class="sidebar">
			<nav>
				<a href="#">Ray<span>-Ban</span></a>
				<ul>
				<h:form id="stock">
					<li ><h:commandLink action = "index" value = "Tableau de boad"></h:commandLink></li>
						
						   <li><h:commandLink action = "Ajouter" value = "Ajouter un article">
						   </h:commandLink></li>
						   <li class="active"><h:commandLink action = "Modifier" value = "Modifier un article">
						   </h:commandLink></li>
						   <li><h:commandLink action = "Supprimer" value = "Supprimer un article">
						   </h:commandLink></li>
						   <li><h:commandLink action = "Approvisoinement" value = "Approvisoinnement">
						   </h:commandLink></li>
				</h:form>
				<li><h:form>
					<h:commandLink action = "#{logoutbean.logout}" value = "Deconnexion"></h:commandLink>
				</h:form></li>
				</ul>
			</nav>
		</div>

		<div class="main-content">
			<h1>Modifier Article</h1>
		<div class="panel-wrapper">
				<div class="panel-head">
				 Rempli le code d'article pour modifier
				</div>
			<div class="formChercher">
				<h:form id="rechercher" rendered="true">
					<h:outputText  value="Entrer le code d'article a modifier : "></h:outputText>
					<table>
						<tr>
						<td>
							<h:inputText required="true" requiredMessage="code article est obligatoire" maxlength="11" id="ele" value="#{modifierBean.codeArt}" validatorMessage="Le code doit etre un nombre entier">
			                    <f:validateRegex pattern="[0-9]+"/>
			                </h:inputText>
						</td>
						<td>
							<div class="button">
								<h:commandButton type="submit" value="Chercher" action="#{modifierBean.chercherElement}"></h:commandButton><br/><br/>	
							</div>
							
						</td>
						</tr>
					</table>
					<h:message for="ele"></h:message>
				</h:form>
			</div>
		</div>
		<h:panelGroup rendered="#{modifierBean.formulaireModification}">
		<div class="panel-wrapper">	
				<div class="formModifier">
					<h:form id="modifier" rendered="true">
						<h:inputHidden id="code" value="#{modifierBean.codeArt}"></h:inputHidden>
						<table>
							<tr>
							<td>
								<h:outputLabel value="Nom Article" for="name"></h:outputLabel>
							</td>
							<td>
								<h:inputText id="name" maxlength="20" value="#{modifierBean.nomArt}"></h:inputText><br/>
							</td></tr><tr>
							<td>
								<h:outputLabel value="Description" for="desc"></h:outputLabel>
							</td><td>
								<h:inputText id="desc" maxlength="200" value="#{modifierBean.descArt}"></h:inputText><br/>
							</td>
							</tr><tr>
							<td>
								<h:outputLabel value="Quantite Article" for="qnt"></h:outputLabel>
							</td><td>
								<h:inputText id="qnt" maxlength="11" value="#{modifierBean.qntArt}" validatorMessage="Le code doit etre un nombre entier">
									<f:validateRegex pattern="[0-9]+"/>
								</h:inputText>
								<h:message for="qnt"></h:message>
							</td>
							</tr><tr>
							<td>
								<h:outputLabel value="Prix Article" for="prix"></h:outputLabel>
							</td><td>
								<h:inputText id="prix" maxlength="11" value="#{modifierBean.prixArt}" validatorMessage="Le code doit etre un nombre entier">
									<f:validateRegex pattern="[0-9]+"/>
								</h:inputText>
								<h:message for="prix"></h:message>
							</td>
							<tr><td></td><td>
								<h:commandButton id="modifier" type="submit" value="Modifier" action="#{modifierBean.modifierElement}"></h:commandButton>
							</td>
							</tr>
							</tr>
						</table>
					</h:form>
				</div>
			
		</div>
		</h:panelGroup>
		</div>
		
	</div>

		
	<div id="myModal" class="modal">
		<div class="modal-content">
  			<div class="modal-header headerColor">
    			<div class="close">X</div>
    			<h2>Warning</h2>
  			</div>
  			<div class="modal-body">
    			<h:messages id="message"></h:messages>
  			</div>
		</div>
	</div>
</f:view>
  <script>
  $(document).ready(function(){
	  	if($('#message').children().text().length > 0){
	  		$("#myModal").show();
	  	}else{
	  		$("#myModal").hide();
	  	}
	  	$(".close").on('click',function(){
  			$("#myModal").hide();
  		});
  });
  </script>
</body>
</html>
</jsp:root>