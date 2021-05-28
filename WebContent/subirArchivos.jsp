
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Subir Archivos</title>
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
<div class="text-center p-3"><h2>Subir Archivos</h2></div>	


					  
<button type="button" id="btnVisita" class="btn btn-info mb-3 mt-3" data-toggle="modal" data-target="#buscaDocumento">Buscar Documento</button>
<div class="modal fade bd-example-modal-lg" id="buscaDocumento" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
				<!-- Modal content-->
				<div class="modal-content">
				<div class="bg-darkblue modal-header p-3" style="padding: 5px 20px">
					Buscar Documento
				</div>
				<div class="modal-body" style="padding: 20px 20px;">
					<div class="form-group col-lg-6">
						<label class="col-lg-12">Elegir:</label>
						<select id="idTipoDoc"  class="form-group form-control">	
							<option value="0">[ Seleccione ]</option>
							<option value="1">VISITA TECNICA</option>
							<option value="CONTRATO">CONTRATO</option>
						</select>
					</div>
					<table id="tbDocumentos" class="table display">
					    <thead>
					        <tr>
					            <th>CÛdigo</th>
					            <th>Cliente</th>
					            <th>Encargado</th>
					            <th>Estado</th>
					            <th>Fecha de Registro</th>
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
  
  <div class="modal fade bd-example-modal-lg" id="verIMAGEN" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
				<!-- Modal content-->
				<div class="modal-content">
				<div class="bg-darkblue modal-header p-3" style="padding: 5px 20px">
					IMAGEN
				</div>
				<div class="modal-body" style="padding: 20px 20px;">
					
					<img alt="" id="imagenFoto" height="600px">	
					<div class="modal-footer">
						<button type="button" class="btn btn-danger" data-dismiss="modal" id="btnCerrarForm">Cerrar</button>
					</div>
				</div>
			</div>
		</div>
  </div>
  
  <div class="modal fade bd-example-modal-lg" id="verPDF" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
				<!-- Modal content-->
				<div class="modal-content">
				<div class="bg-darkblue modal-header p-3" style="padding: 5px 20px">
					PDF
				</div>
				<div class="modal-body" style="padding: 20px 20px;">
					<embed class="col-lg-12" id="pdfFoto" src="" height="600px" type="application/pdf"/>
					<div class="modal-footer">
						<button type="button" class="btn btn-danger" data-dismiss="modal" id="btnCerrarForm">Cerrar</button>
					</div>
				</div>
			</div>
		</div>
  </div>


<form method="post" action="registraDocumento" id="form_registrar" class="form-horizontal" enctype="multipart/form-data" data-toggle="validator" role="form">
		
				<fieldset class="border p-2 m-3 col-md-11 form-group">
				 <legend  class="w-auto"><span class="mr-2 ml-2">Datos del Documento:</span></legend>
				  <div class="col-lg-12 row">
				   <div class="form-group col-lg-12 row">
						 <div class="form-group col-lg-6 row ml-1" hidden="">
						    <label for="exampleInputEmail1" class="col-lg-12">Codigo:</label>
						    <input type="text" class="form-control" id="idCodigo" name="codigo" readonly="readonly" >
						     <input type="text" class="form-control" id="idTipo" name="tipoDoc" readonly="readonly" >
						 </div>
						 <div class="form-group col-lg-6">
						    <label for="exampleInputEmail1" class="">Encargado:</label>
						    <input type="text" class="form-control" id="idEncargado"  readonly="readonly" placeholder="Encargado">
						</div>
						 <div class="form-group col-lg-6">
						    <label for="exampleInputEmail1" class="" id="idLblFecha">Fecha:</label>
						    <input type="text" class="form-control" id="idFecha"  readonly="readonly" placeholder="Fecha">
						</div>
					</div> 
				  </div>
				  </fieldset>
				<fieldset class="border p-2  m-3 col-md-11 form-group">
				 <legend  class="w-auto"><span class="mr-2 ml-2">Datos del Archivo a Subir:</span></legend>
				  <div class="form-group col-lg-6">
				  <label for="exampleInputEmail1" class="">Tipo de Documento:</label>
						<select class="form-control" id="idTipoArchivo" name="documento.tipo">
							<option>[ Seleccione ]</option>
							<option value="PDF">PDF</option>
							<option value="IMAGEN">IMAGEN</option>
						</select>
				  </div>
				  <div class="form-group col-lg-12 row ml-1">
				  	<label>Elegir Archivo: </label>	
						<label for="file-upload" class="subir mr-3 ml-3">
						    <i class="fas fa-cloud-upload-alt"></i> Seleccionar
						</label>
						<input id="file-upload" onchange='cambiar(this)' name="documento.archivo" type="file" style='display: none;'/>
						 <input type="hidden" id="idNombreDocumento" name="documento.nombre" value="">
						<div id="info" class="col-md-5"></div>
						<button type="submit" class="btn btn-primary ml-5" id="agregarArchivo">Agregar</button>
					</div>
				  </fieldset>
	</form>

	<div class="form-group col-lg-12 mb-5" id="frameVisita">
		<table class="table table-striped mt-3" id="detalleDocs">
		  <thead class="btn-dark">
		    <tr>
		      <th scope="col">#</th>
		      <th scope="col">Nombre del archivo</th>
		      <th scope="col">Tipo</th>
		      <th scope="col">Fecha de Registro</th>
		      <th scope="col"></th>
		    </tr>
		  </thead>
		  <tbody>
		  </tbody>
		</table>
	</div>
</div>




<jsp:include page="footer.jsp"></jsp:include>
</div>
<script>
function cambiar(elemento){
    var pdrs = document.getElementById('file-upload').files[0].name;
    document.getElementById('info').innerHTML = pdrs;
    $("#idNombreDocumento").val(pdrs);
}

$("#tbDocumentos").on("click","tbody tr",function(){
	var cod,enc,est,fec,tipo;
	cod=$(this).children("td:eq(0)").html();
	enc=$(this).children("td:eq(1)").html();
	est=$(this).children("td:eq(2)").html();
	fec=$(this).children("td:eq(3)").html();
	$("#form_registrar").data("bootstrapValidator").resetForm(true);
	
	tipo=$("#idTipoDoc").val();
	$("#idCodigo").val(cod);
	$("#idTipo").val(tipo);
	$("#idFecha").val(fec);
	$("#idEncargado").val(enc);
	$.getJSON("listaDocumentoAtDocumento",{codigo:cod,tipo:tipo},function(data){
		//var ver="<button type='button' class='btn btn-primary' id='btnVer' data-toggle='modal'  data-target='#verArchivo'>Ver</button>";
		$("#detalleDocs tbody").empty();
		$.each(data.listaDocumento,function(index,item){
			$("#detalleDocs tbody").append("<tr data-dismiss='modal'><td>"+item.iddocumento+"</td><td>"+item.nombre+"</td><td>"+item.tipo+
					"</td><td>"+item.fechaRegistro+"</td><td><button type='button' class='btn btn-primary' id='btnVer' data-toggle='modal' data-target='#ver"+item.tipo+"'>Ver</button></td></tr>");
		
		})
		$('#detalleDocs').DataTable();
	   	   
	})
})


$(document).on("click","#btnVer",(function(){
	//alert("Hola");
	var cod,tipo;
	cod=$(this).parents("tr").find("td")[0].innerHTML;
	tipo=$(this).parents("tr").find("td")[2].innerHTML;
	$.getJSON("findFotoDocumento",{codigo:cod},function(data){
		if(data.basearchivo!=null){
			if(tipo=="IMAGEN")
				$("#imagenFoto").attr("src","data:image/jpg;base64,"+data.basearchivo);
			else
				$("#pdfFoto").attr("src","data:application/pdf;base64,"+data.basearchivo);
		}
		else
			$("#imagenFoto").attr("src","img/encabezado.png");
	   	   
	})
}));



//$('#frameVisita').hide();
</script>
<script type="text/javascript">
$(document).ready(function(){
	$('#detalles').DataTable();
	//$('#tbDocumentos').DataTable();
	$(".alert").fadeTo(2000,500).slideUp(500,function(){
		$(".alert").slideUp(500);
	});
	$("#agregarArchivo").click(function(){
		var nom=$("#idNombreDocumento").val();
		if(nom==""){
			alert("Elegir un documento");
			return false;
		}
	});
	$( "#idTipoDoc" ).change(function() {
		var tipo=$(this).val();
		 //alert(tipo);
		 $('#tbDocumentos tbody').empty();
		if(tipo==1){
			//LISTA VISITA
			$("#idLblFecha").text("Fecha de la Visita");
				//$('#tbDocumentos').empty();
			$.getJSON("listaVisita",function(data){
				$.each(data.listaVisita,function(index,item){
					$("#tbDocumentos tbody").append("<tr data-dismiss='modal'><td>"+item.idvisita+"</td><td>"+item.cliente.razonSocial+"</td><td>"+item.tecnico.nombre+" "+item.tecnico.apellidos+
							"</td><td>"+item.estado+"</td><td>"+item.fecha+"</td></tr>");
				
				})
				$('#tbDocumentos').DataTable();
			   	   
			})
		}else{
			$("#idLblFecha").text("Fecha de Registro");
			//LISTA DOCUMENTO X TIPO
				//$('#tbDocumentos').empty();
			$.getJSON("listaContrato",function(data){
				$.each(data.listaContrato,function(index,item){
					$("#tbDocumentos tbody").append("<tr data-dismiss='modal'><td>"+item.iddocumento+"</td><td>"+item.cotizacion.cliente.razonSocial+"</td><td>"+item.idEmisor.nombre+" "+item.idEmisor.apellidos+
							"</td><td>"+item.estado+"</td><td>"+item.fechaRegistro+"</td></tr>");
				
				})
				$('#tbDocumentos').DataTable();
			   	   
			})
		}
	});
	
});
</script>
<script type="text/javascript">  
    $(document).ready(function(){    

        $('#form_registrar').bootstrapValidator({      
       	 fields:{
       		Encargado: {
	    		selector:'#idEncargado',   
               validators: {    
                   notEmpty: {    
                       message: 'Seleccionar un Documento'    
                   },      
                   regexp: {    
                       regexp: /^[a-zA-Z·ÈÌÛ˙¡…Õ”⁄\s\w]+$/,    
                       message: 'Seleccionar un Documento'    
                   },    
               }
       		},
               Tipo: {
   	    		selector:'#idTipoArchivo',   
                  validators: {    
                      notEmpty: {    
                          message: 'Seleccionar un Tipo de Archivo'    
                      },    
                  } 
               }           
       	 }
       }); 
    });
 </script>

</body>
</html>