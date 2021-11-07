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
xmlns:h="http://java.sun.com/jsf/html">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<meta charset="UTF-8"/>
  	<title>Supprimer Article</title>
	<link rel="stylesheet" href="css/indexStyle.css"/>
	<link rel="stylesheet" href="css/FormSupp.css"/>
	<![CDATA[
	<script src="js/jquery-3.6.0.js"></script>
	<script>
		$(document).ready(function(){
			$("#myModal").hide();
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
					<li><h:commandLink action = "index" value = "Tableau de Board"></h:commandLink></li>
				    <li><h:commandLink action = "Ajouter" value = "Ajouter un article">
				    </h:commandLink></li>
				    <li><h:commandLink action = "Modifier" value = "Modifier un article">
				    </h:commandLink></li>
				    <li class="active"><h:commandLink action = "Supprimer" value = "Supprimer un article">
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
				<h1>Supprimer Article</h1>
			<div class="panel-wrapper">
				<div class="panel-head">
					Rempli le code d'article pour supprimer
				</div>
			  	<h:form id="FormSupp" rendered="true" styleClass="flex-column-centered ">
	    			<legend>Fiche Technique:</legend>
	    			<div>
	       	 			<label for="article" class="mid">Code :</label>
	        			<h:inputText id="codearticle" value="#{supprimerBean.codearticle}" required="true"></h:inputText>
	    			</div>
	    			<div>
	        			<h:commandButton type="submit" value="Supprimer" action="#{supprimerBean.suppArticle}" ></h:commandButton>
	    			</div>
				</h:form>
			</div>
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
			$("#myModal1").hide();
		});
  });
  </script>
  
</body>
</html>
</jsp:root>