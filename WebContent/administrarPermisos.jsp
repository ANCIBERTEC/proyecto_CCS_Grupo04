
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registra Cotizacion</title>
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

<!-- 
=================================== BUSCAR CLIENTE ==========================================================================================================-->
					  
<button type="button" id="btnCliente" class="btn btn-info mb-3" data-toggle="modal" data-target="#buscaTrabajador">Buscar Trabajador</button>
				  
<div class="modal fade bd-example-modal-lg" id="buscaTrabajador" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-xl" role="document">
    <div class="modal-content">
    <div class="modal-header bg-darkblue p-3">
      	 <h5 class="modal-title" id="exampleModalLabel">Buscar Trabajador</h5>
      </div>
      <div class="m-5">
      <a href="listaTrabajador.jsp" target="_blank" class="btn btn-success mb-3">Añadir Trabajador</a>
      	<table id="detalles" class="display">
		    <thead>
		        <tr>
		            <th>Código</th>
		            <th>Nombres y Apellidos</th>
		            <th>Especialidad</th>
		            <th>Estado</th>
		            <th></th>
		        </tr>
		    </thead>
		    <tbody>
		    	<tr>
		            <td>1</td>
		            <td>Jhonny Guzman</td>
		            <td>Electricista</td>
		            <td>Libre</td>
		            <td><button class="btn btn-secondary" id="btnElegirTrab" data-dismiss="modal">Elegir</button></td>
		        </tr>
		    <c:forEach items="${requestScope.requerimientos}"  var="item">
		    	<tr>
		            <td>${item.iddocumento}</td>
		            <td>${item.tipoProceso.idTipoProceso}</td>
		            <td>${item.idEmisor.idusuario}</td>
		            <td>${item.fechaReg}</td>
		            <td><button class="btn btn-secondary" data-dismiss="modal" id="btnElegirTrab">Elegir</button></td>
		        </tr>
		     </c:forEach>
		    </tbody>
		</table>
		
        <button type="button" class="btn btn-danger" data-dismiss="modal">Salir</button>
      </div>
    </div>
  </div>
</div>


<!-- ==========FORM8ULARIO=================================================================================================================================== -->
		
	<form method="post" action="" id="form_registrar" class="">
			 <div class="form-group">
				<fieldset class="border p-2 m-5 form-group">
				 <legend  class="w-auto"><span class="mr-2 ml-2">Datos del trabajador:</span></legend>
				  <div class="col-lg-12 row">
				   <div class="form-group col-lg-12 row">
						 <div class="form-group col-lg-6">
						    <input  class="form-control col-lg-9" id="idCodigo" type="hidden" readonly="readonly" name="">
						    <label for="exampleInputEmail1" class="">Nombre:</label>
						    <input type="text" class="form-control" id="idNombre"  readonly="readonly"  name="" placeholder="Nombre">
						 </div>
						 <div class="form-group  col-lg-6">
						    <label for="exampleInputEmail1" class="">Cargo:</label>
						    <input type="text" class="form-control" id="idCargo"  readonly="readonly"  name="" placeholder="Cargo">
						 </div>
					</div> 
				  </div>
				  </fieldset>
				  
				<div class="form-group col-lg-6 ml-1">
					<div class="form-group">
					    <label for="exampleFormControlSelect1">Tipo de Menú</label>
					    <select class="form-control" id="exampleFormControlSelect1">
					      <option>Administración</option>
					      <option>Registro</option>
					      <option>Transacciones</option>
					      <option>Consultas</option>
					      <option>Reportes</option>
					    </select>
					  </div>
				    <label for="exampleInputEmail1" class="">Opciones:</label>
			 		<div class="form-check">
					  <input class="form-check-input" type="checkbox" value="" id="defaultCheck1">
					  <label class="form-check-label" for="defaultCheck1">Area</label>
					</div>
					<div class="form-check">
					  <input class="form-check-input" type="checkbox" value="" id="defaultCheck1">
					  <label class="form-check-label" for="defaultCheck1">Cargo</label>
					</div>
					<div class="form-check">
					  <input class="form-check-input" type="checkbox" value="" id="defaultCheck1">
					  <label class="form-check-label" for="defaultCheck1">Trabajador</label>
					</div>
					<div class="form-check">
					  <input class="form-check-input" type="checkbox" value="" id="defaultCheck1">
					  <label class="form-check-label" for="defaultCheck1">Cliente</label>
					</div>
				</div>
				  
			</div>
			 <button type="submit" class="btn btn-primary m-3" id="btnRegistrar">Registrar</button>
	</form>
</div>




<jsp:include page="footer.jsp"></jsp:include>
</div>
<script>
function cambiar(){
    var pdrs = document.getElementById('file-upload').files[0].name;
    document.getElementById('info').innerHTML = pdrs;
}
$(document).on("click","#btnElegir",(function(){
	var cod,sol,pdf;
	cod=$(this).parents("tr").find("td")[0].innerHTML;
	des=$(this).parents("tr").find("td")[1].innerHTML;
	min=parseFloat($(this).parents("tr").find("td")[2].innerHTML);
	max=parseFloat($(this).parents("tr").find("td")[3].innerHTML);
	
	
}));


</script>
<script type="text/javascript">
$(document).ready(function(){
	$('#detalles').DataTable();
});
</script>



</body>
</html>