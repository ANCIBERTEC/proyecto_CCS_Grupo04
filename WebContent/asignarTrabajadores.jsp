
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registra Contrato de Proyecto</title>
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
				  
<button type="button" id="btnBuscarCotizacion" class="btn btn-info mb-3 mt-3" data-toggle="modal" data-target="#buscaProyecto">Buscar Proyecto</button>
<div class="modal fade bd-example-modal-lg" id="buscaProyecto" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-xl" role="document">
    <div class="modal-content">
    <div class="modal-header">
      	 <h5 class="modal-title" id="exampleModalLabel">Buscar Cotizacion</h5>
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

<!-- ============================================================================================================================================= -->
						  
<div class="modal fade bd-example-modal-lg" id="buscaTrabajador" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-xl" role="document">
    <div class="modal-content">
    <div class="modal-header bg-darkblue p-3">
      	 <h5 class="modal-title" id="exampleModalLabel">Buscar Trabajador</h5>
      </div>
      <div class="m-5">
      <a href="listaTrabajador.jsp" target="_blank" class="btn btn-success mb-3">Añadir Trabajador</a>
      	<table id="tbTrabajadores" class="display">
		    <thead>
		        <tr>
		            <th>Código</th>
		            <th>Nombres</th>
		            <th>Apellidos</th>
		            <th>Especialidad</th>
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


<!-- ==========FORM8ULARIO=================================================================================================================================== -->
		
	<form method="post" action="registrarEquipoTrabajo" id="form_registrar" class="">
			 <div class="form-group col-lg-12 row">
			 	<div class="form-group col-lg-12">
				  <label for="exampleInputEmail1" class="col-lg-6">Datos del Contrato:</label>
				  <div class="form-group col-lg-12 row border">			 	 
						<div class="form-group col-lg-6">
						    <label for="exampleInputEmail1">Cliente:</label>
						    <input type="text" class="form-control" id="idCodigoContrato"  name="codigo" readonly="readonly" hidden="">
						    <input type="text" class="form-control" id="idCliente"  name="" readonly="readonly" value="" placeholder="Nombre del Cliente">
						</div>
						<div class="form-group col-lg-6">
						    <label for="exampleInputEmail1">Nombre del Proyecto:</label>
						    <input type="text" class="form-control" id="idNomProyecto"  name="" readonly="readonly" value="" placeholder="Nombre del Proyecto">
						</div>
						<div class="form-group col-lg-6">
						    <label for="exampleInputEmail1">Dias:</label>
						    <input type="text" class="form-control" id="idDias"  name="" readonly="readonly" value="" placeholder="Dias">
						</div>
						<div class="form-group col-lg-6">
						    <label for="exampleInputEmail1">Fecha Inicio:</label>
						    <input type="text" class="form-control" id="idFechaInicio"  name="" readonly="readonly" value="" placeholder="Fecha Inicio">
						</div>
						<div class="form-group col-lg-6">
						    <label for="exampleInputEmail1">Fecha Final:</label>
						    <input type="text" class="form-control" id="idFechaFinal"  name="" readonly="readonly" value="" placeholder="Fecha Final">
						</div>
				  </div>
				</div>
				
				<div class="row">
					  <div class="col">
					    <div class="" id="">
						  <div class="form-group col-lg-12 border">
					  <label for="exampleInputEmail1" class="col-lg-6">Equipo de Trabajo:</label>
					  <div class="col-lg-12 row">
							 <div class="form-group col-lg-12 row">
							    <label for="exampleInputEmail1" class="col-lg-12">Trabajador:</label>
							    <input type="hidden" class="form-control" id="idTrabajador">
							    <input type="text" class="form-control col-lg-3" id="idNombreTra" readonly="readonly" placeholder="Nombres">
							    <input type="text" class="form-control col-lg-3 ml-3" id="idApellidoTra"  readonly="readonly" placeholder="Apellidos">
							    <button type="button" id="btnBuscarTrabajador" class="btn bg-dark ml-1" data-toggle="modal" data-target="#buscaTrabajador">Buscar Trabajador</button>
							 </div>
							 <div class="form-group col-lg-6">
							    <label for="exampleInputEmail1" class="">Especialidad:</label>
							    <input type="text" class="form-control" id="idEspecialidad"  readonly="readonly" placeholder="Especialidad">
							</div>					
							 <div class="form-group col-lg-6">
								<label class="col-lg-12">Cargo:</label>
								<select id="idCargo"  class="form-group form-control">	
									<option value="0">[ Seleccione ]</option>
									<option value="Supervisor">Supervisor</option>
									<option value="Trabajador">Trabajador</option>
								</select>
							</div>
						
					  </div>
					  <div class="form-group col-lg-12 row ml-1">
						  <button type="button" class="btn btn-primary" id="btnAgregar">Agregar</button>
					  </div>
					  <table class="table table-striped mt-3" id="tbEquipo">
						  <thead class="btn-dark">
						    <tr>
						      <th>#</th>
						      <th>Nombres</th>
						      <th>Apellidos</th>
						      <th>Especialidad</th>
						      <th>Cargo</th>
						      <th></th>
						      <th></th>
						    </tr>
						  </thead>
						  <tbody>
						  
						  </tbody>
						</table>
						</div>
						</div>
				    </div>
				  </div>
				
				
				
			</div>
			 <button type="submit" class="btn btn-primary">Registrar</button>
			 <button type="button" class="btn btn-danger">Cancelar</button>
	</form>
	
</div>





<jsp:include page="footer.jsp"></jsp:include>
</div>
<script>
function cambiar(){
    var pdrs = document.getElementById('file-upload').files[0].name;
    document.getElementById('info').innerHTML = pdrs;
}

$(document).on("click","#btnElegirCot",(function(){
	var cot,idcli,nomcli;
	cot=$(this).parents("tr").find("td")[0].innerHTML;
	idcli=$(this).parents("tr").find("td")[1].innerHTML;
	nomcli=$(this).parents("tr").find("td")[2].innerHTML;
	
	$('#codCliente').val(idcli);
	$('#nomCliente').val(nomcli);
	$('#cotizacion').val(cot);

	$('#btnElegirCot').prop('disabled',false);
	
	/*
	$('#mostrarPDF').attr("src",url);
	$('#mostrarPDF').css("width","100%");
	$('#mostrarPDF').css("height","600px");
	*/
	//$('#idModalBuscarAlumno').modal("hide");
}));


$("#tableContrato").on("click","tbody tr",function(){
	var cod,cli,nom,ini,fin,dias;
	cod=$(this).children("td:eq(0)").html();
	cli=$(this).children("td:eq(1)").html();
	nom=$(this).children("td:eq(2)").html();
	ini=$(this).children("td:eq(3)").html();
	fin=$(this).children("td:eq(4)").html();
	dias=$(this).children("td:eq(5)").html();
	//$("#form_registrar").data("bootstrapValidator").resetForm(true);
	//$('#codCliente').val(cod);
	$('#idCodigoContrato').val(cod);
	$('#idCliente').val(cli);
	$("#idNomProyecto").val(nom);
	$("#idFechaInicio").val(ini);
	$("#idFechaFinal").val(fin);
	$("#idDias").val(dias);
	$('#btnAgregar').prop('disabled',false);
	$('#btnBuscarTrabajador').prop('disabled',false);
	$("#tbEquipo tbody").empty();
	$.getJSON("listaEquipoAtContrato",{codigo:cod},function(data){
		var editar="<button type='button' class='btn btn-info' id='btnEditar'>Editar</button>";
		var eliminar="<button type='button' class='btn btn-danger' data-toggle='modal' data-target='#myModal' id='btnEliminar'>Eliminar</button>";
		$.each(data.listaEquipo,function(index,item){
			$("#tbEquipo tbody").append("<tr><td>"+item.trabajador.idusuario+"</td><td>"+item.trabajador.nombre+"</td><td>"+item.trabajador.apellidos+"</td><td>"+
					item.trabajador.especialidad+"</td><td>"+item.cargo+"</td><td>"+editar+"</td><td>"+eliminar+"</td></tr>");
		
		})
		$("#tbEquipo").DataTable();	
	})
});

$("#tbTrabajadores").on("click","tbody tr",function(){
	var cod,nom,ape,esp;
	cod=$(this).children("td:eq(0)").html();
	nom=$(this).children("td:eq(1)").html();
	ape=$(this).children("td:eq(2)").html();
	esp=$(this).children("td:eq(3)").html();
	

	//$("#form_registrar").data("bootstrapValidator").resetForm(true);
	//$('#codCliente').val(cod);
	$('#idTrabajador').val(cod);
	$('#idNombreTra').val(nom);
	$("#idApellidoTra").val(ape);
	$("#idEspecialidad").val(esp);
	$('#btnAgregar').prop('disabled',false);
});

$(document).on("click","#btnEditar",(function(){
	var cod,nom,ape,esp,car;
	cod=$(this).parents("tr").find("td")[0].innerHTML;
	nom=$(this).parents("tr").find("td")[1].innerHTML;
	ape=$(this).parents("tr").find("td")[2].innerHTML;
	esp=$(this).parents("tr").find("td")[3].innerHTML;
	car=$(this).parents("tr").find("td")[4].innerHTML;
	$('#idTrabajador').val(cod);
	$('#idNombreTra').val(nom);
	$("#idApellidoTra").val(ape);
	$("#idEspecialidad").val(esp);
	$("#idCargo").val(car);
}));


$(document).on("click","#btnEliminar",(function(){
	var codigo=$(this).parents("tr").find("td")[0].innerHTML;
	var mon=0;
	//alert(codigo);
	$("#tbEquipo tbody").empty();
	$.getJSON("eliminaTrabajadorEquipo",{idtrabajador:codigo},function(data){
		var editar="<button type='button' class='btn btn-info' id='btnEditar'>Editar</button>";
		var eliminar="<button type='button' class='btn btn-danger' data-toggle='modal' data-target='#myModal' id='btnEliminar'>Eliminar</button>";
		$.each(data.listaEquipo,function(index,item){
			$("#tbEquipo tbody").append("<tr><td>"+item.trabajador.idusuario+"</td><td>"+item.trabajador.nombre+"</td><td>"+item.trabajador.apellidos+"</td><td>"+
					item.trabajador.especialidad+"</td><td>"+item.cargo+"</td><td>"+editar+"</td><td>"+eliminar+"</td></tr>");
		
		})
		$("#tbEquipo").DataTable();	
	})	
}));

</script>
<script type="text/javascript">
$(document).ready(function(){
	//$('#detalles').DataTable();
	//$('#detalles2').DataTable();
	$('#btnBuscarTrabajador').prop('disabled',true);
	$('#btnAgregar').prop('disabled',true);
	$('#btnModificar').prop('disabled',true);
	/*
	$('#btnElegirCot').click(function(){
		$('#btnBuscarTrabajador').prop('disabled',false);
	});
	$('#btnElegirTrab').click(function(){
		$('#btnAgregar').prop('disabled',false);
	});
	$('#btnEditar').click(function(){
		$('#btnModificar').prop('disabled',false);
	});
	$('#btnModificar').click(function(){
		$('#btnModificar').prop('disabled',true);
	});
	*/
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
	
	$.getJSON("listaPersonalObrero",{},function(data){
		$.each(data.listaUsua,function(index,item){
			$("#tbTrabajadores tbody").append("<tr data-dismiss='modal'><td>"+item.idusuario+"</td><td>"+item.nombre+"</td><td>"+item.apellidos+"</td><td>"+item.cargo.descripcion+"</td><td>"+
					item.estado+"</td></tr>");	
		})
  	  $("#tbTrabajadores").DataTable();
  	});

   	$.getJSON("mostrarEquipoTrabajo",function(data){
		var editar="<button type='button' class='btn btn-info' id='btnEditar'>Editar</button>";
		var eliminar="<button type='button' class='btn btn-danger' data-toggle='modal' data-target='#myModal' id='btnEliminar'>Eliminar</button>";
		$.each(data.listaEquipo,function(index,item){
			$("#tbEquipo tbody").append("<tr><td>"+item.trabajador.idusuario+"</td><td>"+item.trabajador.nombre+"</td><td>"+item.trabajador.apellidos+"</td><td>"+
					item.trabajador.especialidad+"</td><td>"+item.cargo+"</td><td>"+editar+"</td><td>"+eliminar+"</td></tr>");
		
		})
		$("#tbEquipo").DataTable();	
	})
	
	$("#btnAgregar").click(function(){
	   	var con,cod,nom,ape,esp,cargo;
	   	con=$("#idCodigoContrato").val();
		cod=$("#idTrabajador").val();
	   	nom=$("#idNombreTra").val();
	   	ape=$("#idApellidoTra").val();
		esp=$("#idEspecialidad").val();
	   	cargo=$("#idCargo").val();
		//alert("Hola"+cod);
		$("#tbEquipo tbody").empty();
   		$.getJSON("agregarTrabajador",{codigo:con,idtrabajador:cod,nombre:nom,apellidos:ape,especialidad:esp,cargo:cargo},function(data){
   			//alert("HOLA2");
   			var editar="<button type='button' class='btn btn-info' id='btnEditar'>Editar</button>";
   			var eliminar="<button type='button' class='btn btn-danger' data-toggle='modal' data-target='#myModal' id='btnEliminar'>Eliminar</button>";
   			$.each(data.listaEquipo,function(index,item){
   				$("#tbEquipo tbody").append("<tr><td>"+item.trabajador.idusuario+"</td><td>"+item.trabajador.nombre+"</td><td>"+item.trabajador.apellidos+"</td><td>"+
   						item.trabajador.especialidad+"</td><td>"+item.cargo+"</td><td>"+editar+"</td><td>"+eliminar+"</td></tr>");
   				
   			})
   			$("#tbEquipo").DataTable();	
   	   	})
   	 	$("#idTrabajador").val("");
	   	$("#idNombreTra").val("");
	   	$("#idApellidoTra").val("");
		$("#idEspecialidad").val("");
	   	$("#idCargo").val(0);
   	});

   	$("#success-alert").fadeTo(2000,500).slideUp(500,function(){
		$("#success-alert").slideUp(500);
	});
});
</script>


</body>
</html>