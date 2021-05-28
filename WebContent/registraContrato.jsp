<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<div class="text-center p-3"><h2>Registrar Contrato de Proyecto</h2></div>	

<c:if test="${sessionScope.codigoContrato!=null}">
<div class="panel" role="alert" id="">
  	<section class="panel panel-heading panel-primary">
  	</section>
  	<section class="panel panel-body">
  		<button data-toggle="modal" data-target="#verContratoPDF" class="btn btn-danger">VER CONTRATO</button>
  		<a href="reporteContratoXCodigo?codigo=${sessionScope.codigoContrato}" download="reporteContratoXCodigo" class="btn btn-danger">DESCARGAR</a>
  	</section>
</div>
</c:if>			  
	

<div class="modal fade bd-example-modal-lg" id="verContratoPDF"  tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-xl modal-dialog-centered" role="document">
    <div class="modal-content">
    <div class="modal-header">
      	 <h5 class="modal-title" id="exampleModalLabel">CONTRATO - ${sessionScope.codigoContrato}</h5>
      </div>
      <!-- Modal body -->
        <div class="modal-body">
        	<iframe src="reporteContratoXCodigo?codigo=${sessionScope.codigoContrato}" height="700px" width="100%"></iframe>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
        </div>
        
    </div>
  </div>
</div>
<c:remove var="codigoContrato"/>	
	
				  
<button type="button" id="btnBuscarCotizacion" class="btn btn-info mb-3 mt-3" data-toggle="modal" data-target="#buscaCliente">Buscar Cotización</button>
<div class="modal fade bd-example-modal-lg" id="buscaCliente" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-xl" role="document">
    <div class="modal-content">
    <div class="modal-header">
      	 <h5 class="modal-title" id="exampleModalLabel">Buscar Cotizacion</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="m-5">
      	<table id="tableCotizacion" class="display">
		    <thead>
		        <tr>
		            <th>Código</th>
		            <th>Cliente</th>
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

<embed class="col-lg-12" src="" height="0px" id="verPDF" type="application/pdf"/>
<!-- ==========FORM8ULARIO=================================================================================================================================== -->
	
	
	<form method="post" action="registraContrato" id="idFormRegistrar" class="">
			 <div class="form-group col-lg-12 row">
			 	<div class="form-group col-lg-12">
				  <label for="exampleInputEmail1" class="col-lg-6">Datos del Contrato:</label>
				  <div class="form-group col-lg-12 row border">			 	 
						<div class="form-group col-lg-6">
						
						    <label for="exampleInputEmail1">Cliente</label>
						    <input type="text" class="form-control" id="codCliente" readonly="readonly" hidden="" value="" placeholder="Codigo del Cliente">
						    <input type="text" class="form-control" id="nomCliente" readonly="readonly" value="" placeholder="Nombre del Cliente">
						</div>
						  <div class="form-group col-lg-6">
						    <label for="exampleInputEmail1">Cotizacion</label>
						    <input type="text" class="form-control" id="cotizacion"  name="contrato.idcotizacion" readonly="readonly" value="" placeholder="Codigo del Cliente">
						</div>
						<div class="form-group col-lg-6">
						    <label for="exampleInputEmail1">Fecha Inicio</label>
						    <input type="date" class="form-control" id="fechaInicio"  name="contrato.fecInicio" value="">
						</div>
						<div class="form-group col-lg-6">
						    <label for="exampleInputEmail1">Fecha Final</label>
						    <input type="date" class="form-control" id="fechaFinal"  name="fechaFinal" value="">
						</div>
						<div class="form-group col-lg-6">
						    <label for="exampleInputEmail1">Nombre del Proyecto:</label>
						    <input type="text" class="form-control" id="nomProyecto"  name="contrato.descripcion" value="">
						</div>
						<div class="form-group col-lg-6">
						    <label for="exampleInputEmail1">Dias:</label>
						    <input type="text" class="form-control" id="dias"  name="contrato.dias" value="">
						</div>
						<div class="form-group col-lg-6">
							<label class="col-lg-12">Enviar a:</label>
							<select id="idReceptor"  class="form-group form-control" name="contrato.codRec">	
								<option value="0">[ Seleccione ]</option>
							</select>
						</div>
				  </div>
				</div>
				<div class="form-group col-lg-12">
			 	<p>
				  <a class="btn btn-secondary" id="flecha" data-toggle="collapse" href="#multiCollapseExample1" role="button" aria-expanded="false" aria-controls="multiCollapseExample1">
				   Añadir Equipo de Trabajo (Opcional) <img src="/NCDEVICE/img/flecha_abajo.png"></a>
				</p>
				<div class="row">
					  <div class="col">
					    <div class="collapse multi-collapse" id="multiCollapseExample1">
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
							    <input type="text" class="form-control" id="idEspecialidad"  readonly="readonly" placeholder="Fecha de Registro">
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
				
				
				
				
			</div>
			 <button type="submit" id="btnRegistrar" class="btn btn-primary">Registrar</button>
			 <a href="cancelarEquipoTrabajo" class="btn btn-danger" id="btnCancelar">Cancelar</a>
	</form>
	
</div>





<jsp:include page="footer.jsp"></jsp:include>
</div>
<script>
function cambiar(){
    var pdrs = document.getElementById('file-upload').files[0].name;
    document.getElementById('info').innerHTML = pdrs;
}


$("#tableCotizacion").on("click","tbody tr",function(){
	var cod,cli,emi,fec;
	cod=$(this).children("td:eq(0)").html();
	cli=$(this).children("td:eq(1)").html();
	emi=$(this).children("td:eq(2)").html();
	fec=$(this).children("td:eq(3)").html();
	

	//$("#form_registrar").data("bootstrapValidator").resetForm(true);
	//$('#codCliente').val(cod);
	$("#verPDF").attr("src","reporteCotizacionXCodigo?codigo="+cod);
	$("#verPDF").css("height","600px");
	$('#nomCliente').val(cli);
	$('#cotizacion').val(cod);
	$("#idReceptor").val(0);
	$('#btnElegirCot').prop('disabled',false);
	$('#btnBuscarTrabajador').prop('disabled',false);
	$('#btnRegistrar').prop('disabled',false);
	$('#btnCancelar').attr('class','btn btn-danger');
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
function listarObrero(){
	$.getJSON("listaPersonalObrero",{},function(data){
		$.each(data.listaUsua,function(index,item){
			$("#tbTrabajadores tbody").append("<tr data-dismiss='modal'><td>"+item.idusuario+"</td><td>"+item.nombre+"</td><td>"+item.apellidos+"</td><td>"+item.cargo.descripcion+"</td><td>"+
					item.estado+"</td></tr>");	
		})
  	  $("#tbTrabajadores").DataTable();
  	});
	
}
</script>
<script type="text/javascript">
$(document).ready(function(){
	
	$('#btnBuscarTrabajador').prop('disabled',true);
	$('#btnAgregar').prop('disabled',true);
	$('#btnModificar').prop('disabled',true);
	
	$('#btnRegistrar').prop('disabled',true);
	$('#btnCancelar').attr('class','btn btn-danger disabled');
	$('#btnEditar').click(function(){
		$('#btnModificar').prop('disabled',false);
	});
	$('#btnModificar').click(function(){
		$('#btnModificar').prop('disabled',true);
	});
	var c=0;
	$("#flecha img").click(function(){
		if(c==0){
			//alert("abajo");
			$("#flecha img").attr("src","/NCDEVICE/img/flecha_arriba.png");
			c++;
		}else{
			//alert("arriba");
			$("#flecha img").attr("src","/NCDEVICE/img/flecha_abajo.png");
			c=0;
		}
	});	
	listarObrero();
	
	var est='APROBADO';
	$.getJSON("listaCotizacionAtEstado",{estado:est},function(data){
		$.each(data.listaCotizacion,function(index,item){
			$("#tableCotizacion tbody").append("<tr data-dismiss='modal'><td>"+item.iddocumento+"</td><td>"+item.cliente.razonSocial+"</td><td>"+item.idEmisor.nombre+" "+item.idEmisor.apellidos+
					"</td><td>"+item.fechaRegistro+"</td><td>"+item.estado+"</td></tr>");
		
		})
		$('#tableCotizacion').DataTable();
	   	   
	})
	$.getJSON("listaPersonalAdministrativo",{},function(data){
		$.each(data.listaUsua,function(index,item){
			$("#idReceptor").append("<option value='"+item.idusuario+"'>"+item.cargo.descripcion+" : " + item.nombre+" "+ item.apellidos+"</option>");	
		})
  	   
   	})
   	
	
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
	   	var cod,nom,ape,esp,cargo;
		cod=$("#idTrabajador").val();
	   	nom=$("#idNombreTra").val();
	   	ape=$("#idApellidoTra").val();
		esp=$("#idEspecialidad").val();
	   	cargo=$("#idCargo").val();
		//alert("Hola"+cod);
		$("#tbEquipo tbody").empty();
   		$.getJSON("agregarTrabajador",{idtrabajador:cod,nombre:nom,apellidos:ape,especialidad:esp,cargo:cargo},function(data){
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

<script type="text/javascript">  
    $(document).ready(function(){    

        $('#idFormRegistrar').bootstrapValidator({      
       	 fields:{
       		 
	            FecInicio: {
		    		selector:'#fechaInicio',   
	               validators: {    
	                   notEmpty: {    
	                       message: 'Elija una Fecha de Inicio'    
	                   },   
	               }    
	         	 },
		          FecFinal: {
			    		selector:'#fechaFinal',   
		             validators: {    
		                 notEmpty: {    
		                     message: 'Elija una Fecha Final'    
		                 },     
		             }    
		        },
		        Proyecto: {
		    		selector:'#nomProyecto',   
		           validators: {    
		               notEmpty: {    
		                   message: 'Ingrese nombre de Proyecto'    
		               },   
		           }    
		      },
              Dias: {
    	    		selector:'#dias',   
                   validators: {    
                       notEmpty: {    
                           message: 'Ingrese la cantidad de dias'    
                       },      
                       regexp: {    
                           regexp: /^[0-9]{1,10}$/,    
                           message: 'La cantidad de dias es minimo 1 dia. (Ingresar solo numeros)'    
                       },    
                   }    
  	            }, 
  	            Receptor: {
  	  	    		selector:'#idReceptor',   
  	                validators: {    
  	                    notEmpty: {    
  	                        message: 'Elija un Receptor'    
  	                    },      
  	                    regexp: {    
  	                        regexp: /^[a-zA-Z0-9\s\w]+$/,    
  	                        message: 'Elija un Tecnico'    
  	                    },   
  	                }    
  	            }
       	 }
       }); 
    });
 </script>


</body>
</html>