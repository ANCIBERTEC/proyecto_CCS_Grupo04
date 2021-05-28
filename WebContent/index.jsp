
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="/NCDEVICE/img/icono.ico">

    <title>Iniciar Sesión</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/4.1/examples/sign-in/">

    <!-- Bootstrap core CSS -->
    <link href="/NCDEVICE/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/NCDEVICE/css/signin.css" rel="stylesheet">
  </head>

   <body class="">
   <div class="text-center container">
   <c:if test="${sessionScope.MENSAJE!=null}">
	<div class="alert alert-warning alert-dismissible fade show col-lg-12" role="alert" id="alert_message">
	  <strong>${sessionScope.MENSAJE}</strong>
	  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
	    <span aria-hidden="true">&times;</span>
	  </button>
	</div>
	</c:if>
	<c:remove var="MENSAJE"/>
    <form class="form-signin col-lg-12" method="post" action="login">
      <img class="mb-4" src="/NCDEVICE/img/logo.webp" alt="" width="250" height="150">
      <h1 class="h3 mb-3 font-weight-normal">Iniciar Sesión</h1>
      <label for="inputEmail" class="sr-only">Usuario</label>
      <input type="text" id="inputEmail" name="codigo" class="form-control" placeholder="Ingrese su ID de usuario" required autofocus>
      <label for="inputPassword" class="sr-only">Clave</label>
      <input type="password" id="inputPassword" name="clave" class="form-control" placeholder="Ingrese su clave" required>
      <div class="checkbox mb-3">
        <label>
          <input type="checkbox" value="remember-me"> Recordar
        </label>
      </div>
      <button class="btn btn-lg btn-primary btn-block" type="submit">Iniciar Sesión</button>
      <p class="mt-5 mb-3 text-muted">&copy; 2020-2023</p>
    </form>
    </div>
    
<script src="/NCDEVICE/js/jquery-3.3.1.slim.min.js.descarga"></script>
<script src="/NCDEVICE/js/popper.min.js.descarga"></script>
<script src="/NCDEVICE/js/bootstrap.min.js"></script>

<script type="text/javascript">
		$("#alert_message").fadeTo(2000,500).slideUp(500,function(){
			$("#alert_message").slideUp(500);	
		});
	</script>
  </body>
</html>
