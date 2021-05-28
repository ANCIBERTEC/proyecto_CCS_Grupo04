
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registra Orden de Compra</title>
<link rel="icon" href="/NCDEVICE/img/icono.ico">
</head>
<body>
<jsp:include page="barraMenu.jsp"/>
<div class="container">


<c:if test="${sessionScope.CORRECTO!=null}">
<div class="alert alert-success alert-dismissible fade show" role="alert" id="success-alert">
  <strong></strong> ${sessionScope.CORRECTO}
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
</c:if>
<c:remove var="CORRECTO"/>

<c:if test="${sessionScope.ERROR!=null}">
<div class="alert alert-danger alert-dismissible fade show" role="alert" id="success-alert">
  <strong></strong> ${sessionScope.ERROR}
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
</c:if>
<c:remove var="ERROR"/>

<div class="ml-5 mr-5">
		  
<button type="button" id="btnVisita" class="btn btn-info mb-3 mt-3" data-toggle="modal" data-target="#buscaContrato">Buscar Contrato de Proyecto</button>
<button type="button" id="btnVisita" class="btn btn-info mb-3 mt-3" data-toggle="modal" data-target="#buscaProveedor">Buscar Proveedor</button>
<div class="modal fade bd-example-modal-lg" id="buscaContrato" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-xl" role="document">
    <div class="modal-content">
    <div class="bg-darkblue modal-header p-3">
      	 <h5 class="modal-title" id="exampleModalLabel">Buscar Contrato</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="m-5">
      	<table id="tableContrato" class="display">
		    <thead>
		        <tr>
		            <th>Código</th>
		            <th>Cliente</th>
		            <th>Nombre del Proyecto</th>
		            <th>Fecha de Inicio</th>
		            <th>Fecha Final</th>
		            <th>Dias</th>
		            <th>Fecha de Registro</th>
		            <th>Encargado</th>
		            <th>Estado</th>
		        </tr>
		    </thead>
		    <tbody>
			    
		    </tbody>
		</table>
		
        <button type="button" class="btn btn-danger" data-dismiss="modal">Salir</button>
      </div>
    </div>
  </div>
</div>


<div class="modal fade bd-example-modal-lg" id="buscaProveedor" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-xl" role="document">
				<!-- Modal content-->
				<div class="modal-content">
				<div class="bg-darkblue modal-header p-3" style="padding: 5px 20px">
					Buscar Proveedor
				</div>
				<div class="modal-body" style="padding: 20px 20px;">
				<a href="listaProveedor" target="_blank" class="btn btn-success">Añadir Proveedor</a>
					<table id="tableProveedor" class="display">
					    <thead>
					        <tr>
					            <th>Código</th>
					            <th>Empresa</th>
					            <th>Nombre Contacto</th>
					            <th>Direccion</th>
					            <th>RUC</th>
					            <th>Telefono</th>
					            <th>Distrito</th>
					        </tr>
					    </thead>
					    <tbody>
					   	 	
					    </tbody>
					</table>   
					<div class="modal-footer">
						<button type="button" class="btn btn-danger" data-dismiss="modal" id="btnCerrarForm">Cerrar</button>
					</div>
				</div>
			</div>
		</div>
		
  </div>

<!-- ============================================================================================================================================= -->

<!-- ==========FORM8ULARIO=================================================================================================================================== -->
		
	<form method="post" action="" id="form_registrar" class="">
			 <div class="form-group col-lg-12 row">
			 	
			 	<fieldset class="border col-lg-12 form-group d-flex">
					 <legend  class="w-auto"><span class="mr-2 ml-2">Datos del Proveedor:</span></legend>
				  <div class="form-group col-lg-12 row">			 	 
						<div class="form-group col-lg-6">
						    <label for="exampleInputEmail1">Razon Social</label>
						    <input type="hidden" class="form-control" id="idCodigoContrato"   readonly="readonly" value="" placeholder="Razon Social">
						    <input type="text" class="form-control" id="idProveedor"  name="oredenCompra.proveedor.idproveedor" readonly="readonly" hidden="" value="" placeholder="Codigo del Cliente">
						    <input type="text" class="form-control" id="idEmpresaPro"   readonly="readonly" value="" placeholder="Razon Social">
						</div>
						  <div class="form-group col-lg-6">
						    <label for="exampleInputEmail1">Nombre Contacto</label>
						    <input type="text" class="form-control" id="idNombrePro"  readonly="readonly" value="" placeholder="Nombre Contacto">
						</div>
						<div class="form-group col-lg-6">
						    <label for="exampleInputEmail1">Direccion</label>
						    <input type="text" class="form-control" id="idDireccionPro" readonly="readonly" value="" placeholder="Direccion">
						</div>
						<div class="form-group col-lg-3">
						    <label for="exampleInputEmail1">RUC</label>
						    <input type="text" class="form-control" id="idRUCPro" readonly="readonly" value="" placeholder="RUC">
						</div>
						<div class="form-group col-lg-3">
						    <label for="exampleInputEmail1">Telefono</label>
						    <input type="text" class="form-control" id="idTelefonoPro" readonly="readonly" value="" placeholder="Telefono">
						</div>
				  </div>
				</fieldset>
				<div class="form-group col-lg-12 border row">
				<label for="exampleInputEmail1" class="col-lg-6">Materiales:</label>
						 <div class="form-group col-lg-12 ">
						    <label for="exampleInputEmail1" class="">Descripcion:</label>
						    <input type="text" class="form-control" id="item" name="item" placeholder="Descripcion del item">
						 </div>
						 <div class="form-group col-lg-6">
						    <label for="exampleInputEmail1" class="">Marca:</label>
						    <input type="text" class="form-control" id="marca"  name="marca" placeholder="Precio unitario">
						 </div>
						 <div class="form-group col-lg-6">
						    <label for="exampleInputEmail1" class="">Unidad:</label>
						    <input type="text" class="form-control" id="unidad"  name="unidad" placeholder="Precio unitario">
						 </div>
						 <div class="form-group col-lg-6">
						    <label for="exampleInputEmail1" class="">Precio:</label>
						    <input type="text" class="form-control" id="precio"  name="precio" placeholder="Precio unitario">
						 </div>
						 <div class="form-group col-lg-6 ">
						    <label for="exampleInputEmail1" class="">Cantidad:</label>
						    <input type="text" class="form-control" id="cantidad"  name="cantidad" placeholder="Cantidad">
						</div>
				  <div class="form-group col-lg-12 row ">
					  <button type="button" class="btn btn-primary" id="btnAgregar">Agregar</button>
					  <button type="button" class="btn btn-success ml-1" id="btnModificar">Modificar</button>	
				  </div>
				  <table class="table table-striped mt-3">
					  <thead class="btn-dark">
					    <tr>
					      <th scope="col">#</th>
					      <th scope="col">Descripcion</th>
					      <th scope="col">Precio (S/.)</th>
					      <th scope="col">QTY</th>
					      <th scope="col">Total (S/.)</th>
					      <th scope="col"></th>
					      <th scope="col"></th>
					    </tr>
					  </thead>
					  <tbody>
					  <c:forEach var="item" begin="1" end="5">
					    <tr>
					      <td scope="row">${item}</td>
					      <td>Tornillos para drywall</td>
					      <td>15</td>
					      <td>2</td>
					      <td>30</td>
					      <td><button type="button" class="btn btn-info">Editar</button></td>
					      <td><button type="button" class="btn btn-danger">Eliminar</button></td>
					    </tr>
					   </c:forEach>
					  </tbody>
					</table>
				</div>
				
				
				
			</div>
			 <button type="submit" class="btn btn-primary" id="btnRegistrar">Registrar</button>
	</form>
	
</div>





<jsp:include page="footer.jsp"></jsp:include>
</div>
<script>
function cambiar(){
    var pdrs = document.getElementById('file-upload').files[0].name;
    document.getElementById('info').innerHTML = pdrs;
}

$(document).on("click","#btnVerDoc",(function(){
	var cod,url,pdf;
	cod=$(this).parents("tr").find("td")[0].innerHTML;
	url=$(this).parents("tr").find("td")[4].innerHTML;
	pdf=$(this).parents("tr").find("td")[5].innerHTML;
	
	$('#requerimiento').val(cod);
	$('#mostrarPDF').attr("src",url);
	$('#mostrarPDF').css("width","100%");
	$('#mostrarPDF').css("height","600px");
	//$('#idModalBuscarAlumno').modal("hide");
}));

$("#tableContrato").on("click","tbody tr",function(){
	var cod;
	cod=$(this).children("td:eq(0)").html();
	$('#idCodigoContrato').val(cod);
});

$("#tableProveedor").on("click","tbody tr",function(){
	var cod,emp,nom,dir,ruc,fono;
	cod=$(this).children("td:eq(0)").html();
	emp=$(this).children("td:eq(1)").html();
	nom=$(this).children("td:eq(2)").html();
	dir=$(this).children("td:eq(3)").html();
	ruc=$(this).children("td:eq(4)").html();
	fono=$(this).children("td:eq(5)").html();
	//$("#form_registrar").data("bootstrapValidator").resetForm(true);
	//$('#codCliente').val(cod);
	$('#idProveedor').val(cod);
	$('#idEmpresaPro').val(emp);
	$("#idNombrePro").val(nom);
	$("#idDireccionPro").val(dir);
	$("#idRUCPro").val(ruc);
	$("#idTelefonoPro").val(fono);
	$('#btnAgregar').prop('disabled',false);
	$('#btnBuscarTrabajador').prop('disabled',false);
});



</script>
<script type="text/javascript">
$(document).ready(function(){
	$('#detalles').DataTable();
	$('#detalles2').DataTable();
	$('#btnAgregar').prop('disabled',true);
	$('#btnModificar').prop('disabled',true);
	$('#btnRegistrar').prop('disabled',true);
	$('#btnAgregar').click(function(){
		$('#btnRegistrar').prop('disabled',false);
	});
	
	var est='PENDIENTE';
	$.getJSON("listaContratoAtEstado",{estado:est},function(data){
		$.each(data.listaContrato,function(index,item){
			$("#tableContrato tbody").append("<tr data-dismiss='modal'><td>"+item.iddocumento+"</td><td>"+item.cotizacion.cliente.razonSocial+
												"</td><td>"+item.descripcion+"</td><td>"+item.fecInicio+"</td><td>"+item.fechaFinal+"</td><td>"+item.dias+
												"</td><td>"+item.fechaRegistro+"</td><td>"+item.idEmisor.nombre+" "+item.idEmisor.apellidos+
												"</td><td>"+item.estado+"</td></tr>");
		
		})
		$('#tableContrato').DataTable();
	   	   
	})
	
	$.getJSON("listaProveedorJson",{estado:est},function(data){
		$.each(data.listaProveedor,function(index,item){
			$("#tableProveedor tbody").append("<tr data-dismiss='modal'><td>"+item.idproveedor+"</td><td>"+item.nombreEmpresa+
												"</td><td>"+item.nombreContacto+"</td><td>"+item.direccion+"</td><td>"+item.ruc+"</td><td>"+item.telefono+
												"</td><td>"+item.distrito.nombre+"</td></tr>");
		
		})
		$('#tableProveedor').DataTable();
	   	   
	})
});
</script>


</body>
</html>