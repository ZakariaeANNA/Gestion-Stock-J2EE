<?xml version="1.0" encoding="ISO-8859-1" ?>
<jsp:root xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" version="2.0">
    <jsp:directive.page language="java"
        contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" />
    <jsp:text>
        <![CDATA[ <?xml version="1.0" encoding="ISO-8859-1" ?> ]]>
    </jsp:text>
    <jsp:text>
        <![CDATA[ <!DOCTYPE html > ]]>
    </jsp:text>
<html xmlns:jsf="http://java.sun.com/jsf"  xmlns="http://www.w3.org/1999/xhtml" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
  	<title>Gestion Stock</title>
  	<![CDATA[
	<link rel="stylesheet" href="css/indexStyle.css"/>
	<link rel="stylesheet" href="css/tableStyle.css"/>
	
		<link rel="stylesheet" type="text/css" href="css/jquery.dataTables.min.css"/>
		<script src="js/jquery-3.6.0.js"></script>
		<script src="js/indexStyle.js"></script>
		<script src="js/jquery.dataTables.js"></script>
		<script src="js/jquery.dataTables.min.js"></script>
		<script language="javascript" type="text/javascript"> 
			$(document).ready(function() {
				$('.modal').hide();
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
					<li class="active"><h:commandLink action = "index" value = "Tableau de board"></h:commandLink></li>
						   <li><h:commandLink action = "Ajouter" value = "Ajouter un article">
						   </h:commandLink></li>
						   <li><h:commandLink action = "Modifier" value = "Modifier un article">
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
			<h1>Tableau de board</h1>
			<div class="panel-wrapper">
				<div class="panel-head">
					Liste des articles
				</div>
				<div class="panel-body">
					<h:form>
						<h:commandButton value="Telecharger PDF" action="#{indexBean.PDFGenerate}" style="float: right; border: 2px solid black;color: black;font-family: 'PT Sans Caption', sans-serif;font-size: 1em;font-weight: 400;height: 40px;margin: 0;padding: 0 10px;width: auto;vertical-align: middle;"></h:commandButton>				
					</h:form><br/>
					<div style="padding-top:50px;">
					<h:dataTable value="#{indexBean.article}" var="o"
	    				style="width:100%" styleClass="mytable table"
    				>
						<h:column>
							<f:facet name="header">
								<h:outputText value="Code Article" />
							</f:facet>
							<h:outputText value="#{o.codeArt}"></h:outputText>
						</h:column>
						<h:column>
							<f:facet name="header">
								<h:outputText value="Nom Article" />
							</f:facet>
							<h:outputText value="#{o.nomArt}"></h:outputText>
						</h:column>
						<h:column>
							<f:facet name="header">
								<h:outputText value="Quantité Article" />
							</f:facet>
							<h:outputText value="#{o.qteArt}"></h:outputText>
						</h:column>
						<h:column>
							<span class="desc">
								<button style=" border: 2px solid black;color: black;font-family: 'PT Sans Caption', sans-serif;font-size: 1em;font-weight: 400;height: 40px;margin: 0;padding: 0 10px;width: auto;vertical-align: middle;">Details</button>
								<label id="codeArt" style="display:none;">
									<h:outputText value="#{o.codeArt}"></h:outputText>
								</label>
								<label id="nomArt" style="display:none;">
									<h:outputText value="#{o.nomArt}"></h:outputText>
								</label>
								<label id="descArt" style="display:none;">
									<h:outputText value="#{o.descArt}"></h:outputText>
								</label>
								<label id="prixArt" style="display:none;">
									<h:outputText value="#{o.prixArt}"></h:outputText>
								</label>
								<label id="qteArt" style="display:none;">
									<h:outputText value="#{o.qteArt}"></h:outputText>
								</label>
							</span>	
						</h:column>
					</h:dataTable>
					</div>
				</div>
			</div>
		</div>

  		
	</div>
		<div id="myModal" class="modal">

		  <!-- Modal content -->
		  <div class="modal-content">
		    <div class="modal-header">
		      <span class="close">X</span>
		      <h2>Article details</h2>
		    </div>
		    <div class="modal-body" >
		      <table style="margin-left: auto; margin-right: auto;">
		  			<tr>
		  				<th>Code Article</th>
		  				<td class="codeArt"></td>
		  			</tr>
		  			<tr>
		  				<th>Nom Article</th>
		  				<td class="nomArt"></td>
		  			</tr>
		  			<tr>
		  				<th>Description Article</th>
		  				<td class="descArt"></td>
		  			</tr>
		  			<tr>
		  				<th>Prix Article</th>
		  				<td class="prixArt"></td>
		  			</tr>
		  			<tr>
		  				<th>Quantité Article</th>
		  				<td class="qteArt"></td>
		  			</tr>
		  		</table>
		    </div>
		  </div>
		
		</div>
			
</f:view>
  <script>
	  $(document).ready(function() {
		  	$('.desc').on('click', function(event) {
		  		var codeArt = $(this).find("#codeArt").text();
		  		var nomArt = $(this).find("#nomArt").text();
		  		var prixArt = $(this).find("#prixArt").text();
		  		var qteArt = $(this).find("#qteArt").text();
		  		var descArt = $(this).find("#descArt").text();
		  		$(".codeArt").text(codeArt);
		  		$(".descArt").text(descArt);
		  		$(".nomArt").text(nomArt);
		  		$(".prixArt").text(prixArt);
		  		$(".qteArt").text(qteArt);
		  		$(".modal").show();
		  	});
		  	$('.close').on('click', function(event) {
		  		$(".modal").hide();
		  	});
	  });
  </script>
</body>
</html>
</jsp:root>