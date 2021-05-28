<%@page import="java.util.Map"%>
<%@page import="net.ncdevice.service.DocumentoService"%>
<%@page import="net.ncdevice.service.UsuarioService"%>
<%@page import="com.opensymphony.xwork2.ActionContext"%>
<%@page import="org.apache.struts2.dispatcher.SessionMap"%>
<%@page import="net.ncdevice.entidad.Usuario"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<c:if test="${sessionScope.usuarioLogin == null}">
	<c:set var="mensaje" 
		   value="Debe autenticarse para ingresar al sistema" scope="request"/>
	<jsp:forward page="index.jsp" />
</c:if>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<link rel="stylesheet" href="/NCDEVICE/css/sticky-footer-navbar.css">
<link rel="stylesheet" href="/NCDEVICE/css/bootstrap.min.css" >
<link rel="stylesheet" href="/NCDEVICE/css/offcanvas.css">
<link rel="stylesheet" href="/NCDEVICE/css/navbar.css">
<link rel="stylesheet" href="/NCDEVICE/css/translateelement.css">

<link rel="icon" href="/NCDEVICE/img/icono.ico">
<link rel="stylesheet" href="/NCDEVICE/css/bootstrap.css">
<link rel="stylesheet" href="/NCDEVICE/css/jquery.dataTables.min.css">
<link rel="stylesheet" href="/NCDEVICE/css/bootstrapValidator.css">
<link rel="stylesheet" href="/NCDEVICE/css/jquery-ui.css">
<script type="text/javascript" src="/NCDEVICE/js/jquery-3.3.1.slim.min.js.descarga"></script>


<style>
.modal-header, h4, .close {
		background-color: #286090;
		color: white !important;
		text-align: center;
		font-size: 20px;
	}
	.help-block {
	  		color: red;
	}
	
	.form-group.has-error .form-control-label {
	  color: red;
	}
	
	.form-group.has-error .form-control {
	  border: 1px solid red;
	  box-shadow: 0 0 0 0.2rem rgba(250, 16, 0, 0.18);
	}
	.dataTables_length{
	 display: none;
	}
	.dataTables_filter{
		text-align: right;
	}
	.dataTables_info{
	 display: none;
	}
	.dataTables_paginate{
		cursor: pointer;
	}
	
	table.dataTable {
    border-collapse: collapse;
    }
    .table {
    border-collapse: collapse;
    }

.dropdown-item:hover, .dropdown-item:focus {
	background-color: black;color:white;
}
/*
.nav-link:hover, .nav-link:focus{
  background-color: black;color:red;
}*/
 #dropdown10:hover{
 	background-color: white;color:black;
 }
</style>

<style>

ul li{
	margin: auto 10px;
}

.dropdown-item:hover, .dropdown-item:focus {
	background-color:black;color:white;
}

.nav-link:hover, .nav-link:focus {
  background-color: black;
}
 .subir{
    padding: 5px 10px;
    background: black;
    color:#fff;
    border:0px solid #fff;
}
.subir:hover{
    color:#fff;
    background: gray;
}
.container{
	box-shadow: 0px 0px 5px 5px #F6F6F6;
	background-color: white;
}
.btn{
	border-radius: 0px;
}

 .bg-darkblue{
 	background-color: #00139E;
 	color: white;
 	font-weight: bold;padding:5px 10px;text-align: center;
 }
 
 .bg-orange{
 	background-color: #F6A12E;
 	color: white;
 	font-weight: bold;padding:5px 10px;text-align: center;
 }
 
 .bg-brown1{
 	background-color: #C47100;
 	color: white;
 	font-weight: bold;
 }
 
 .bg-darkbrown{
 	background-color: #A46D00;
 	color: white;
 	font-weight: bold;
 }
 .bg-dark{
 	color: white;font-weight: bold;
 }
 
</style>
</head>

<body class="bg-secondary">

        
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
      <a class="navbar-brand col-lg-2" href="/NCDEVICE/menuPrincipal.jsp"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">NC DEVICE  
      	<img alt="#" src="/NCDEVICE/img/icono.ico" width="50" height="40" class="ml-2"></font></font></a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample05" aria-controls="navbarsExample05" aria-expanded="false" aria-label="Navegación de palanca">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse justify-content-md-center col-lg-7 ml-4" id="navbarsExample08">
        <ul class="navbar-nav mr-auto"> 
 		<li class="nav-item active">
            <a class="nav-link disabled" href="/NCDEVICE/menuPrincipal.jsp"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Inicio</font></font></a>
        </li>
          
          
          
        <c:forEach items="${sessionScope.usuarioEnlaces}"  var="item">
        	<c:if test="${item.tipo=='Submenu'}">
        	 <li class="nav-item dropdown">
	            <a class="nav-link dropdown-toggle active" href="#" id="dropdown05" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">${item.descripcion}</a>
	            
	            <div class="dropdown-menu" aria-labelledby="dropdown05">
		            <c:forEach items="${sessionScope.usuarioEnlaces}"  var="subm">
		           		<c:if test="${subm.tipo==item.descripcion}">
			              <a class="dropdown-item" href="/NCDEVICE${subm.url}">${subm.descripcion}</a>
		              	</c:if>
		            </c:forEach>
	            </div>
	          </li>
	       </c:if>
        </c:forEach>
        

        
        
          <li class="nav-item active">
            <a class="nav-link disabled" href="subirArchivos.jsp"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Subir Archivos <img src="img/nube.png"></font></font></a>
          </li>
        </ul>
      </div>
      <% 
      Map<String, Object> session1=ActionContext.getContext().getSession();
      Usuario usu=(Usuario)session1.get("usuarioLogin");
      DocumentoService service=new DocumentoService();
      int can=service.cantidadDocsRecibidosAtUsuario(usu.getIdusuario());//${sessionScope.notify
      %>
        <div class="my-2 my-md-0 nav-item dropdown col-lg-2">
          <a class="nav-link dropdown-toggle text-light" href="#" id="dropdown05" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <span id="canNotify" class="bg-danger p-2"><%=can%></span>
          ${sessionScope.usuarioLogin.nombre} ${sessionScope.usuarioLogin.apellidos} <img src="/NCDEVICE/img/ajustes.png"></a>
            <div class="dropdown-menu" aria-labelledby="dropdown05">
              <a class="dropdown-item" href="editarPerfil"><font style="vertical-align: inherit;">
              	<font style="vertical-align: inherit;">Mi Perfil</font></font>
              </a>
              <a class="dropdown-item" href=""><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Ajustes</font></font></a>
              <a class="dropdown-item" href="logout"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">Cerrar Sesion</font></font></a>
            </div>
        </div>
    </nav>
  


</body>
</html>