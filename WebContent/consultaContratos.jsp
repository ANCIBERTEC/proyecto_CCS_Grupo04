
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Consulta Cotizaciones</title>
<link rel="icon" href="/NCDEVICE/img/icono.ico">
</head>
<body>
<jsp:include page="barraMenu.jsp"/>
<div class="container">
<c:if test="${requestScope.MENSAJE!=null}">
<div class="alert alert-warning alert-dismissible fade show" role="alert">
  <strong>${requestScope.MENSAJE}</strong>
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
</c:if>
<div class="ml-5 mr-5">
<div class="text-center p-3"><h2>Consultar Cotizaciones</h2></div>	

			  
<div class="form-group col-lg-12 mb-5" id="frameVisita">
		<table id="tableContrato" class="display">
		    <thead>
		        <tr>
		            <th>Código</th>
		            <th>Cliente</th>
		            <th>Fecha de Registro</th>
					<th>Cotizacion</th>
		            <th>Encargado</th>
		            <th>Estado</th>
		            <th></th>
		        </tr>
		    </thead>
		    <tbody>
			    
		    </tbody>
		</table>
	</div>
</div>

<div class="modal fade bd-example-modal-lg" id="miPDF" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
				<!-- Modal content-->
				<div class="modal-content">
				<div class="bg-darkblue modal-header p-3" style="padding: 5px 20px">
					Buscar Documento
				</div>
				<div class="modal-body" style="padding: 20px 20px;">
					 <embed src="" id="mostrarPDF" style="height: 600px;" type="application/pdf"  class="mt-2 col-lg-12"/>
					<div class="modal-footer">
						<button type="button" class="btn btn-danger" data-dismiss="modal" id="btnCerrarForm">Cerrar</button>
					</div>
				</div>
			</div>
		</div>
  </div>





<jsp:include page="footer.jsp"></jsp:include>
</div>
<script>

//$('#frameVisita').hide();
</script>
<script type="text/javascript">
$(document).ready(function(){
	
	$("#btnVerPDF").click(function(){
		alert("Hola");
		var ruta=$(this).attr("href");
		alert(ruta);
		$("#mostrarPDF").attr("src",ruta);
	});
	$("#hola").click(function(){
		alert($(this).attr("href"));
	});
	
	$.getJSON("listaContrato",function(data){
		$.each(data.listaContrato,function(index,item){
			$("#tableContrato tbody").append("<tr data-dismiss='modal'><td>"+item.iddocumento+"</td><td>"+item.cotizacion.cliente.razonSocial+"</td><td>"+item.fechaRegistro+"</td><td>"+
			item.idcotizacion+"</td><td>"+item.idEmisor.nombre+" "+item.idEmisor.apellidos+"</td><td>"+item.estado+"</td><td>"+
					"<a href='reporteContratoXCodigo?codigo="+item.iddocumento+"' target='_blank' class='btn btn-danger' id='hola'>Ver</a></td></tr>");
		
		})
		$('#tableContrato').DataTable();
	   	   
	});
	
});
</script>



</body>
</html>