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
	<![CDATA[
	<link rel="stylesheet" href="css/indexStyle.css"/>
	<link rel="stylesheet" href="css/addapproviStyle.css"/>	
		<link rel="stylesheet" type="text/css" href="css/jquery.dataTables.min.css"/>
		<script src="js/jquery-3.6.0.js"></script>
		<script src="js/jquery.dataTables.js"></script>
		<script src="js/jquery.dataTables.min.js"></script>
		<script language="javascript" type="text/javascript"> 
			$(document).ready(function() {
				$('#myModal').hide();
				$("#myModal1").hide();
				$('.mytable').DataTable();
			});  
		</script>
	]]>


</head>
<body>

<f:view>
  <header>
		<div class="logo">Xero<span>Source</span></div>
	</header>
	<div class="nav-btn">Menu</div>
	<div class="container">
		<div class="sidebar">
			<nav>
				<a href="#">Ray<span>-Ban</span></a>
				<ul>
				<h:form id="stock">
						   <li ><h:commandLink action = "index" value = "Tableau de board">
						   </h:commandLink></li>
						   <li><h:commandLink action = "Ajouter" value = "Ajouter un article">
						   </h:commandLink></li>
						   <li><h:commandLink action = "Modifier" value = "Modifier un article">
						   </h:commandLink></li>
						   <li><h:commandLink action = "Supprimer" value = "Supprimer un article">
						   </h:commandLink></li>
						   <li class="active"><h:commandLink action = "Approvisoinement" value = "Approvisoinnement">
						   </h:commandLink></li>
				</h:form>
				<li><h:form>
					<h:commandLink action = "#{logoutbean.logout}" value = "Deconnexion"></h:commandLink>
				</h:form></li>
				</ul>
			</nav>
		</div>

		<div class="main-content">
			<h1>Approvisoinnement</h1>
		<div class="panel-wrapper">
				<div class="panel-head">
				Table des approvisoinnements
				</div>
			<div class="panel-body">
			<button class="button">Ajouter Approvisionnement</button>
			<br/>
			<div style="padding-top:50px;">
			<h:dataTable value="#{approvisoinnementBean.approvi}" var="o"
	    				style="width:100%;" styleClass="mytable table"
    				>
						<h:column>
							<f:facet name="header">
								<h:outputText value="Code Article" />
							</f:facet>
							<h:outputText value="#{o.codeArt}"></h:outputText>
						</h:column>
						<h:column>
							<f:facet name="header">
								<h:outputText value="Quantité Commandé" />
							</f:facet>
							<h:outputText value="#{o.qteCommande}"></h:outputText>
						</h:column>
						<h:column>
							<f:facet name="header">
								<h:outputText value="Date Prevue Livrasion" />
							</f:facet>
							<h:outputText value="#{o.datePrevueLivraison}"></h:outputText>
						</h:column>
						<h:column>
							<h:form>
								<h:commandButton action="#{approvisoinnementBean.delete}" value="Supprimer">
								    <f:param name="action" value="#{o.codeArt}" />
								</h:commandButton>	
							</h:form>
						</h:column>
					</h:dataTable>
					</div>
				</div>
		</div>
		</div>
	</div>
	<div id="myModal" class="modal">
		<div class="modal-content">
  			<div class="modal-header headerColor">
    			<div class="close">X</div>
    			<h2>Ajouter</h2>
  			</div>
 
  			<div class="modal-body">
				<h:form id="FormAjoutApprovis" rendered="true" >
					 <div>
				        <label for="articleapprovis" class="mid">Code d'Article:</label>
				        <h:inputText id="codeArt" value="#{approvisoinnementBean.codeArt}" required="true" requiredMessage="ce champ est obligatoire" validatorMessage="codeArt un nombre entie">
				        	<f:validateRegex pattern="[0-9]*" />
				        </h:inputText>
				        <h:message for="codeArt"></h:message>
				    </div>
				    <div>
				        <label for="articleapprovis" class="mid">Quantité Commandé:</label>
				        <h:inputText id="qntcmdarticleapprovis" value="#{approvisoinnementBean.qteCommande}" required="true" requiredMessage="ce champ est obligatoire" validatorMessage="QteComande un nombre entie">
				        	<f:validateRegex pattern="[0-9]*" />
				        </h:inputText>
				        <h:message for="qntcmdarticleapprovis"></h:message>
				    </div>
				    <div>
				         <label for="articleapprovis" class="mid">Date Livraison :</label>
				         <h:inputText id="datemax" value="#{approvisoinnementBean.dateLivraison}" required="true" requiredMessage="ce champ est obligatoire" validatorMessage="la date etre se forme 28/12/1997">
				         	<f:validateRegex pattern="^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\d\d$" />
				         </h:inputText>
				         <h:message for="datemax"></h:message>
				    </div>
				    
				    <div>
				        <h:commandButton type="submit" value="Ajouter" action="#{approvisoinnementBean.AjouterApprovision}"></h:commandButton>
				    </div>
				</h:form>
  			</div>
		</div>
	</div>
	<div id="myModal1" class="modal">
		<div class="modal-content">
  			<div class="modal-header headerColor1">
    			<div class="close">X</div>
    			<h2>Echec</h2>
  			</div>
  			<div class="modal-body">
    			<h:messages id="message"></h:messages>
  			</div>
		</div>
	</div>
</f:view>
<script>
	  $(document).ready(function(){
		  	$('.button').on('click', function(event) {
		  		$("#myModal").show();
		  	});
		  	if($('#message').children().text().length > 0){
		  		$("#myModal1").show();
		  	}else{
		  		$("#myModal1").hide();
		  	}
		  	$(".close").on('click',function(){
	  			$("#myModal1").hide();
	  			$("#myModal").hide();
	  		});
	  });
  </script>
</body>
</html>
</jsp:root>