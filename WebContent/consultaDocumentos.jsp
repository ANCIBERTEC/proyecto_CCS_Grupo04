
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Consulta Documentos</title>
<link rel="icon" href="/NCDEVICE/img/icono.ico">
</head>
<body>
<jsp:include page="barraMenu.jsp"/>
<div class="container">

<div class="ml-5 mr-5">
<div class="text-center p-3"><h2>Consultar Historial de Documentos</h2></div>	




<table class="table table-striped mt-3" id="tableDocs" >
		  <thead class="btn-dark">
		    <tr>
		      <th scope="col">Codigo</th>
		      <th scope="col">Fecha de Registro</th>
		      <th scope="col">Fecha de Modificacion</th>
		      <th scope="col">Estado</th>
		      <th scope="col">Tipo</th>
		      <th scope="col">ID del Autor</th>
		      <th scope="col">Autor</th>
		    </tr>
		  </thead>
		  <tbody>
		  </tbody>
		</table>
</div>





<jsp:include page="footer.jsp"></jsp:include>
</div>
<script>
</script>
<script type="text/javascript">
$(document).ready(function(){
	//$('#tableDocs').DataTable();
	   
	$.getJSON("listaHistorialDocs",function(data){
		$.each(data.listaDocumento,function(index,item){
			$("#tableDocs tbody").append("<tr><td>"+item.iddocumento+"</td><td>"+item.fechaRegistro+"</td><td>"+item.fechaModificacion+"</td><td>"+item.estado+
					"</td><td>"+item.tipo+"</td><td>"+item.idEmisor.idusuario+"</td><td>"+item.idEmisor.nombre+" "+item.idEmisor.apellidos+"</td></tr>");
		
		})
		$('#tableDocs').DataTable();
	   	   
	})
	
});
</script>


</body>
</html>