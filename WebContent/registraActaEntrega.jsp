
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registra Acta de Entrega</title>
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


<c:if test="${sessionScope.codigoActa!=null}">
<div class="panel" role="alert" id="">
  	<section class="panel panel-heading panel-primary">
  	</section>
  	<section class="panel panel-body">
  		<button data-toggle="modal" data-target="#verContratoPDF" class="btn btn-danger">VER ACTA DE ENTREGA</button>
  		<a href="reporteActaXCodigo?codigo=${sessionScope.codigoActa}" download="reporteContratoXCodigo" class="btn btn-danger">DESCARGAR</a>
  	</section>
</div>
</c:if>			 
	

<div class="modal fade bd-example-modal-lg" id="verContratoPDF"  tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-xl modal-dialog-centered" role="document">
    <div class="modal-content">
    <div class="modal-header">
      	 <h5 class="modal-title" id="exampleModalLabel">ACTA DE ENTREGA - ${sessionScope.codigoActa}</h5>
      </div>
      <!-- Modal body -->
        <div class="modal-body">
        	<iframe src="reporteActaXCodigo?codigo=${sessionScope.codigoActa}" height="700px" width="100%"></iframe>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
        </div>
        
    </div>
  </div>
</div>
<c:remove var="codigoActa"/>

<div class="ml-5 mr-5">
	
<!-- 
=================================== BUSCAR CLIENTE ==========================================================================================================-->
<div class="text-center p-3"><h2>Registrar Acta de Entrega</h2></div>			  
<button type="button" id="btnCliente" class="btn btn-info mb-3 mt-3" data-toggle="modal" data-target="#buscaContrato">Buscar Contrato de Proyecto</button>
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
		            <th>Telefono</th>
		            <th>Nombre del Proyecto</th>
		            <th>Fecha de Inicio</th>
		            <th>Fecha Final</th>
		            <th>Fecha de Registro</th>
		            <th>Encargado</th>
		            <th>Estado</th>
		            <th hidden=""></th>
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


<!-- ==========BUSCAR ITEM=================================================================================================================================== -->
	<embed class="col-lg-12" id="verPDF" src="" height="0px" type="application/pdf"/>
<!-- ==========FORM8ULARIO=================================================================================================================================== -->
		
	<form method="post" action="registraActaEntrega" id="idFormRegistrar" class="">
			 <div class="form-group row">
				 <fieldset class="border col-lg-10 mr-5 ml-5 form-group d-flex">
					 <legend  class="w-auto"><span class="mr-2 ml-2">Datos del Contrato:</span></legend>
					   <div class="form-group col-lg-12 form-row">
							 <div class="form-group col-md-6">
							    <label for="exampleInputEmail1" class="">Nombre del Proyecto:</label>
							    <input type="hidden" class="form-control" id="idContrato" readonly="readonly" name="acta.idcontrato">
							     <input type="hidden" class="form-control" id="idCotizacion" readonly="readonly" name="acta.contrato.idcotizacion">
							    <input type="text" class="form-control" id="idNombrePro"  readonly="readonly"   placeholder="Nombre de Proyecto">
							 </div>
							 <div class="form-group col-md-6">
							    <label for="exampleInputEmail1" class="">Fecha de Inicio:</label>
							    <input type="text" class="form-control" id="idFechaIni"  readonly="readonly"  placeholder="Fecha de Inicio">
							</div>
							 <div class="form-group col-md-6">
							    <label for="exampleInputEmail1" class="">Fecha de Fin:</label>
							    <input type="date" class="form-control" id="idFechaFin" name="acta.contrato.fechaFinal" placeholder="Fecha de Fin">
							</div>
						</div> 
					</fieldset>
					<fieldset class="border mr-5 ml-5 col-lg-10 form-group">
					 <legend  class="w-auto"><span class="mr-2 ml-2">Datos del Cliente:</span></legend>
					  <div class="col-lg-12 row">
					   <div class="form-group col-lg-12 row">
							 <div class="form-group col-lg-12 ml-1">
							    <label for="exampleInputEmail1" class="">Razón Social:</label>
							    <input type="text" class="form-control" id="idCliente"  readonly="readonly"  placeholder="Solicitante">
							 </div>
							 <div class="form-group col-lg-12 ml-1">
							    <label for="exampleInputEmail1" class="">Telefono:</label>
							    <input type="text" class="form-control" id="idTelefono"  readonly="readonly" placeholder="Fecha de Registro">
							</div>
						</div> 
					  </div>
					  </fieldset>
					  <fieldset class="border mr-5 ml-5 col-lg-10 form-group">
						<legend  class="w-auto"><span class="mr-2 ml-2">Observaciones:</span></legend>
					   	<div class="form-group col-lg-12 row">
							 <div class="form-group col-lg-12 row ml-1">
							    <textarea class="form-control" name="acta.observaciones" id="idObservaciones" rows="5"></textarea>
							 </div>
						</div> 
					  </fieldset>
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


$("#tableContrato").on("click","tbody tr",function(){
	var cod,nom,ini,fin,cli,fono,cot;
	cod=$(this).children("td:eq(0)").html();
	cli=$(this).children("td:eq(1)").html();
	fono=$(this).children("td:eq(2)").html();
	nom=$(this).children("td:eq(3)").html();
	ini=$(this).children("td:eq(4)").html();
	fin=$(this).children("td:eq(5)").html();
	cot=$(this).children("td:eq(9)").html();
	$('#idContrato').val(cod);
	$('#idNombrePro').val(nom);
	$('#idFechaIni').val(ini);
	$('#idFechaFin').val(fin);
	$('#idCliente').val(cli);
	$('#idTelefono').val(fono);
	$("#idCotizacion").val(cot);
	$("#verPDF").attr("src","reporteContratoXCodigo?codigo="+cod);
	$("#verPDF").css("height","600px");
	//$("#idFormRegistrar").data("bootstrapValidator").resetForm(true);
	$("#btnRegistrar").prop("disabled",false);
});

function desapareceAlert(){
	$(".alert").fadeTo(2000,500).slideUp(500,function(){
		$(".alert").slideUp(500);	
	});
}
</script>
<script type="text/javascript">
$(document).ready(function(){
	$("#btnRegistrar").prop("disabled",true);
	desapareceAlert();
	var est='PENDIENTE';
	$.getJSON("listaContratoAtEstado",{estado:est},function(data){
		$.each(data.listaContrato,function(index,item){
			$("#tableContrato tbody").append("<tr data-dismiss='modal'><td>"+item.iddocumento+"</td><td>"+item.cotizacion.cliente.razonSocial+
												"</td><td>"+item.cotizacion.cliente.telefono+"</td><td>"+item.descripcion+"</td><td>"+item.fecInicio+"</td><td>"+item.fechaFinal+
												"</td><td>"+item.fechaRegistro+"</td><td>"+item.idEmisor.nombre+" "+item.idEmisor.apellidos+
												"</td><td>"+item.estado+"</td><td hidden=''>"+item.idcotizacion+"</td></tr>");
		
		})
		$('#tableContrato').DataTable();
	   	   
	})
});
</script>

<script type="text/javascript">  
    $(document).ready(function(){    

        $('#idFormRegistrar').bootstrapValidator({      
       	 fields:{
       		 
               FechaFin: {
     	    		selector:'#idFechaFin',   
                   validators: {    
                       notEmpty: {    
                           message: 'Elija la fecha de término del trabajo o deje si es correcto'    
                       } 
                   }    
               }, 
            Observaciones: {
  	    		selector:'#idObservaciones',   
                validators: {    
                    notEmpty: {    
                        message: 'Elija un Tecnico'    
                    }  
                }    
            }
            
       	 }
       }); 
    });
 </script>


</body>
</html>