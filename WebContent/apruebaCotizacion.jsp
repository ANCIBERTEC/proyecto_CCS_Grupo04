
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Aprueba Cotizacion</title>
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

<!-- 
=================================== BUSCAR CLIENTE ==========================================================================================================-->
					  
<button type="button" id="btnCliente" class="btn btn-info mb-3 mt-3" data-toggle="modal" data-target="#buscaCliente">Buscar Cotización</button>
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
		            <th>Encargado</th>
		            <th>Fecha de Registro</th>
		            <th>Estado</th>
		            <th></th>
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

<!-- ==========VISTA DEL DOCUMENTO=================================================================================================================================== -->
	<embed class="col-lg-12" src="" height="0px" id="verPDF" type="application/pdf"/>
<!-- ==========FORM8ULARIO=================================================================================================================================== -->
		
	<form method="post" action="apruebaCotizacion" id="form_registrar" class="border" data-toggle="validator">
			 <div class="form-group row">
				<fieldset class="border p-2 m-5 form-group">
				 <legend  class="w-auto"><span class="mr-2 ml-2">Datos de la Cotizacion:</span></legend>
				  <div class="col-lg-12 row">
				   <div class="form-group col-lg-12 row">
						 <div class="form-group col-lg-6">
						    <label for="exampleInputEmail1" class="">Codigo:</label>
						    <input type="text" class="form-control" id="idCodigo" readonly="readonly" name="cotizacion.iddocumento" placeholder="Codigo Cotizacion">
						 </div>
						 <div class="form-group col-lg-6">
						    <label for="exampleInputEmail1" class="">Solicitado Por:</label>
						    <input type="text" class="form-control" id="idCliente"  readonly="readonly"  name="" placeholder="Cliente">
						 </div>
						  <div class="form-group col-lg-6">
						    <label for="exampleInputEmail1" class="">Encargado:</label>
						    <input type="text" class="form-control" id="idEncargado"  readonly="readonly"  name="" placeholder="Encargado">
						 </div>
						 <div class="form-group col-lg-6">
						    <label for="exampleInputEmail1" class="">Fecha de Registro:</label>
						    <input type="text" class="form-control" id="idFechaReg"  readonly="readonly" name="" placeholder="Fecha de Registro">
						</div>
						<div class="form-group col-lg-6">
						    <label for="exampleInputEmail1" class="">Aprobar Cotizacion</label>
					 		<div class="col-md-12 row">
								<div class="custom-control custom-radio custom-control-inline">
								  <input type="radio" id="customRadioInline1" name="cotizacion.estado" value="APROBADO" class="custom-control-input" required>
								  <label class="custom-control-label" for="customRadioInline1">Si</label>
								</div>
								<div class="custom-control custom-radio custom-control-inline">
								  <input type="radio" id="customRadioInline2" name="cotizacion.estado"  value="DESAPROBADO" class="custom-control-input" required>
								  <label class="custom-control-label" for="customRadioInline2">No</label>
								</div>
							</div>
						</div>
						<div class="form-group col-lg-6">
							<label class="col-lg-12">Enviar a:</label>
							<select id="idReceptor"  class="form-group form-control" name="cotizacion.idReceptor.idusuario">	
								<option value="0">[ Seleccione ]</option>
							</select>
						</div>
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
/*
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

*/
$("#tableCotizacion").on("click","tbody tr",function(){
	var cod,cli,emi,fec;
	cod=$(this).children("td:eq(0)").html();
	cli=$(this).children("td:eq(1)").html();
	emi=$(this).children("td:eq(2)").html();
	fec=$(this).children("td:eq(3)").html();
	
	$("#verPDF").attr("src","reporteCotizacionXCodigo?codigo="+cod);
	$("#verPDF").css("height","600px");
	$("#form_registrar").data("bootstrapValidator").resetForm(true);
	$("#idCodigo").val(cod);
	$("#idCliente").val(cli);
	$("#idEncargado").val(emi);
	$("#idFechaReg").val(fec);
	$("#idReceptor").val(0);
});

</script>
<script type="text/javascript">
$(document).ready(function(){
	//$('#detalles').DataTable();
	//$('#detalles2').DataTable();
	
	var est='Pendiente';
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
   	
   	$("#success-alert").fadeTo(2000,500).slideUp(500,function(){
		$("#success-alert").slideUp(500);
	});
	
});
</script>

<script type="text/javascript">  
    $(document).ready(function(){    

        $('#form_registrar').bootstrapValidator({      
       	 fields:{

       		 Cotizacion: {
    	    	selector:'#idCodigo',   
                   validators: {    
                       notEmpty: {    
                           message: 'Elija una Cotizacion'    
                       },      
                       regexp: {    
                           regexp: /^[0-9A-Z]{9}$/,    
                           message: 'Elija una Cotizacion'    
                       },    
                   }    
               },
               Receptor: {
       	    	selector:'#idReceptor',   
                      validators: {    
                          notEmpty: {    
                              message: 'Elija un receptor'    
                          },      
                          regexp: {    
                              regexp: /^[A-Z0-9]{8}$/,    
                              message: 'Elija un receptor'    
                          },    
                      }    
                  }
       	 }
       }); 
    });
 </script>


</body>
</html>