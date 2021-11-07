<?xml version="1.0" encoding="ISO-8859-1" ?>
<jsp:root xmlns:jsp="http://java.sun.com/JSP/Page" xmlns:f="http://java.sun.com/jsf/core" xmlns:h="http://java.sun.com/jsf/html" version="2.0">
    <jsp:directive.page language="java"
        contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" />
    <jsp:text>
        <![CDATA[ <?xml version="1.0" encoding="ISO-8859-1" ?> ]]>
    </jsp:text>
    <jsp:text>
        <![CDATA[ <!DOCTYPE html> ]]>
    </jsp:text>
<html xmlns="http://www.w3.org/1999/xhtml"
xmlns:f="http://java.sun.com/jsf/core"
xmlns:h="http://java.sun.com/jsf/html"	>

<head>
    <title>Login</title>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	<![CDATA[
	<link rel="stylesheet" href="css/login.css"/>
	]]>
</head>
<body>
<f:view>
	<div class="login-div flex-column-centered">
	  <div class="login-comps">
	    <h1 class="text-center">Login</h1>
	    <h:form id="loginForm" rendered="true" styleClass="flex-column-centered">
	      <h:inputText id="username" value="#{userBean.username}"  required="true"></h:inputText>
	      <h:inputSecret id="password" value="#{userBean.password}" required="true"></h:inputSecret>
	      <h:commandButton type="submit" value="Login" action="#{userBean.loginUser}" ></h:commandButton>
	    </h:form>
	  </div>
	</div>
</f:view>
</body>
</html>
</jsp:root>