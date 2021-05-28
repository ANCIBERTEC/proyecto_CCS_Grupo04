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

<div class="ml-5 mr-5">
<div class="text-center p-3"><h2>Registrar Cotizacion</h2></div>	

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

<c:if test="${sessionScope.codigoCotizacion!=null}">
<div class="panel" role="alert" id="">
  	<section class="panel panel-heading panel-primary">
  	</section>
  	<section class="panel panel-body">
  		<button data-toggle="modal" data-target="#verPDF" class="btn btn-danger">VER COTIZACION</button>
  		<a href="reporteCotizacionXCodigo?codigo=${sessionScope.codigoCotizacion}" download="reporteCotizacionXCodigo" class="btn btn-danger">DESCARGAR</a>
  	</section>
</div>
</c:if>

<div class="modal fade bd-example-modal-lg" id="verPDF"  tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-xl modal-dialog-centered" role="document">
    <div class="modal-content">
    <div class="modal-header">
      	 <h5 class="modal-title" id="exampleModalLabel">COTIZACION - ${sessionScope.codigoCotizacion}</h5>
      </div>
      <!-- Modal body -->
        <div class="modal-body">
        	<iframe src="reporteCotizacionXCodigo?codigo=${sessionScope.codigoCotizacion}" height="700px" width="100%"></iframe>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
        </div>
        
    </div>
  </div>
</div>
<c:remove var="codigoCotizacion"/>

<button type="button" id="btnCliente" class="btn btn-info mb-3 mt-3" data-toggle="modal" data-target="#buscaCliente">Buscar Cliente</button><br>

<!-- 
=================================== BUSCAR CLIENTE ==========================================================================================================
					  -->

<div class="modal fade bd-example-modal-lg" id="buscaCliente" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-xl" role="document">
    <div class="modal-content">
    	<div class="modal-header p-3 bg-darkblue">
      	 <h5 class="modal-title" id="exampleModalLabel">Buscar Cliente</h5>
      </div>
      <div class="m-5">
      <form class="form-inline mt-2 mt-md-0">
      	<label class="mr-3">Buscar:</label>
      	<input class="form-control mr-sm-2 col-5" type="search" name="nomCliente" id="nomCliente" placeholder="Ingrese el nombre del Item" aria-label="Search">
      	<button type="button"  class="btn btn-primary" id="btnActivaFcliente" onclick="$('#formCliente').show();" >Añadir Cliente</button>
      </form>
      <div id="idAlertCliente"></div>
      <form class="form-group mt-2 col-lg-12 row" id="formCliente"  data-toggle="validator" role="form">
      	<div class="form-group col-lg-3">
			<label class="" for="exampleInputEmail1">Razon Social:</label>
			<input type="text" class="form-control" id="idRaz"  name="raz" value="" placeholder="Ingrese Razon Social">
		</div>
		<div class="form-group col-lg-3">
			<label class="" for="exampleInputEmail1">Nombre Contacto:</label>
			<input type="text" class="form-control" id="idNomCon"  name="nomcon" value="" placeholder="Ingrese Nombre de Contacto">
		</div>
		<div class="form-group col-lg-2">
			<label class="" for="exampleInputEmail1">Telefono:</label>
			<input type="text" class="form-control" id="idFono"  name="fono" value="" placeholder="Ingrese Telefono">
		</div>
		<div class="form-group col-lg-4">
			<label class="" for="exampleInputEmail1">Correo:</label>
			<input type="text" class="form-control" id="idCorreo"  name="correo" value="" placeholder="Ingrese Correo">
		</div>
      	<button type="button" class="btn btn-primary mt-3 ml-3" id="btnAddCliente">Aceptar</button>
      </form>
      <div class="table-responsive mt-3" style="height:500px;">
      	<table class="table table-hover table-bordered"  id="detallesCliente">
		    <thead>
		        <tr class="bg-info text-white">
		            <th>Código</th>
		            <th>Razon Social</th>
		            <th>Nombre del Contacto</th>
		            <th>Telefono</th>
		            <th>Correo</th>
		        </tr>
		    </thead>
		    <tbody>
		    	
		    </tbody>
		</table>
	</div>
        <button type="button" class="btn btn-danger" data-dismiss="modal">Salir</button>
      </div>
    </div>
  </div>
</div>
<!-- ==========BUSCAR ITEM=================================================================================================================================== -->
					  
<div class="modal fade bd-example-modal-lg" id="buscarItem" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-xl" role="document">
    <div class="modal-content">
      <div class="modal-header p-3 bg-darkblue">
      	 <h5 class="modal-title" id="exampleModalLabel">Buscar Item</h5>
      </div>
      <div class="modal-body">
      	 <p  class="modal-title" >Elija un Item de la lista</p>
      </div>
      <div class="m-5">
      <div id="idAlertItem"></div>
      <form class="form-inline mt-2 mt-md-0">
      	<label class="mr-3">Buscar:</label>
      	<input class="form-control mr-sm-2 col-5" type="search" name="nomItem" id="nomItem" placeholder="Ingrese el nombre del Item" aria-label="Search">
      	<button type="button"  class="btn btn-primary" id="btnActivaFitem">Agregar</button>
      </form>
      <form class="form-inline mt-2 col-lg-12" id="formItem"  data-toggle="validator" role="form">
      	<div class="form-group col-lg-5">
			<label class="">Precio Minimo:</label>
			<input type="text" class="form-control" id="preMin"  name="preMin" value="" placeholder="Ingrese minimo">
		</div>
		<div class="form-group col-lg-5">
			<label class="">Precio Maximo:</label>
			<input type="text" class="form-control" id="preMax"  name="preMax" value="" placeholder="Ingrese maximo">
		</div>
      	<button type="button" class="btn btn-primary mt-3" id="btnFitem">Aceptar</button>
      </form>
      <div class="table-responsive mt-3" style="height:500px;">
      	<table class="table table-hover table-bordered"  id="tbItems">
		  <thead class="btn-dark">
		    <tr>
		      <th>#</th>
		      <th>Descripcion</th>
		      <th>Precio Min. (S/.)</th>
		      <th>Precio Max. (S/.)</th>
		    </tr>
		  </thead><%double pre=15.00; %>
		  <tbody>
		  </tbody>
		</table>
		</div>
		<div class="col-md-12 text-center">
			<ul class="pagination pagination-lg pager" id="developer_page"></ul>
		</div>
        <button type="button" class="btn btn-danger" data-dismiss="modal">Salir</button>
      </div>
    </div>
  </div>
</div>


<!-- ==========FORM8ULARIO=================================================================================================================================== -->
	
<!-- ==========FORM8ULARIO=================================================================================================================================== -->	

	<form method="post" action="registraCotizacion" id="form_registrar" class="mt-3 form-horizontal" data-toggle="validator" role="form">
			 <div class="form-group col-lg-12 row">
			 	<fieldset class="border col-lg-12 form-group">
				 <legend  class="w-auto"><span class="mr-2 ml-2">Datos del Cliente:</span></legend>
				  <div class="col-lg-12 row">
				   <div class="form-group col-lg-12 row">
						 <div class="form-group col-md-6">
						    <label for="exampleInputEmail1" class="">Razón Social:</label>
						     <input type="hidden" class="form-control" id="idCodigoCliente"  name="cotizacion.cliente.idcliente" placeholder="Solicitante">
						    <input type="text" class="form-control" id="idRazonSocial"  readonly="readonly"  name="cotizacion.cliente.razonSocial" placeholder="Solicitante">
						 </div>
						 <div class="form-group col-md-6">
						    <label for="exampleInputEmail1" class="">Nombre Contacto:</label>
						    <input type="text" class="form-control" id="idNombreContacto"  readonly="readonly" name="cotizacion.cliente.nombreContacto" placeholder="Fecha de Registro">
						</div>
						 <div class="form-group col-md-6">
						    <label for="exampleInputEmail1" class="">Telefono:</label>
						    <input type="text" class="form-control" id="idTelefono"  readonly="readonly" name="cotizacion.cliente.telefono" placeholder="Fecha de Registro">
						</div>
						 <div class="form-group col-md-6">
						    <label for="exampleInputEmail1" class="">Correo:</label>
						    <input type="text" class="form-control" id="idEmail"  readonly="readonly" name="cotizacion.cliente.correo" placeholder="Fecha de Registro">
						</div>
					</div> 
				  </div>
				  </fieldset>
				 </div>
				  <label class="mt-3">Seleccione los items pedidos por el cliente: </label>
				<div class="form-group col-lg-12">
				  <label for="exampleInputEmail1" class="col-lg-6">Items:</label>
				  <div class="col-lg-12 row">
				   <div class="form-group col-lg-8 row">
						 <div class="form-group col-lg-12 row ml-1">
						    <label for="exampleInputEmail1" class="col-lg-12">Descripcion:</label>
						    <input type="text" class="form-control col-lg-9" id="codItem" readonly="readonly" hidden="" name="codItem">
						    <input type="text" class="form-control col-lg-9" id="item" readonly="readonly" name="item" placeholder="Descripcion del item">
						    <button type="button" class="btn bg-dark ml-1" data-toggle="modal" data-target="#buscarItem" id="btnBuscarItem">Buscar Item</button>
						 </div>
						 <div class="form-group col-lg-6 ml-1">
						    <label for="exampleInputEmail1" class="">Precio:</label>
						    <input type="text" class="form-control" id="precio"  name="precio" placeholder="Precio unitario">
						 </div>
						 <div class="form-group col-lg-6 ml-1">
						    <label for="exampleInputEmail1" class="">Cantidad:</label>
						    <input type="text" class="form-control" id="cantidad"  name="cantidad" placeholder="Cantidad">
						</div>
					</div> 
					 <div class="col-lg-4 ml-3 position-static">
						<div class="col-lg-12">
						  <button type="button" class="list-group-item  col-lg-12 bg-darkbrown text-light">Precio Minimo</button>
						  <button type="button" class="list-group-item  col-lg-12" disabled id="desPreMin">S/. 00.00</button>
						</div>
						<div class="col-lg-12">
						  <button type="button" class="list-group-item  col-lg-12 bg-darkbrown text-light">Precio Promedio</button>
						  <button type="button" class="list-group-item  col-lg-12" disabled id="desPreProm">S/. 00.00</button>
						</div>
						<div class="col-lg-12">
						  <button type="button" class="list-group-item  col-lg-12 bg-darkbrown text-light">Precio Maximo</button>
						  <button type="button" class="list-group-item  col-lg-12" disabled id="desPreMax">S/. 00.00</button>
						</div>
					</div>
				  </div>
				  <div class="form-group col-lg-12 row ml-1">
					  <button type="button" class="btn btn-primary btnAgregar" id="btnAgregarItem">Agregar</button>	
				  </div>
				  <div class="form-group">
					  <table class="table table-striped mt-3" id="idDetalle">
						  <thead class="bg-dark">
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
						  </tbody>
						</table>
						<div class="row float-right mt-2">
	       					<div class="col-lg-offset-12">
	       						<div class="col-lg-offset-3 row d-flex mb-1">
       								<label class="control-label col-lg-5 mt-1">SubTotal S/.</label>
    								<input class="form-control col-lg-6 text-right" id="idSubTotal" name="cotizacion.detalle.subotal"  readonly/>
    							</div>
    							<div class="col-lg-offset-3 row d-flex mb-1">
       								<label class="control-label col-lg-5 mt-1">IGV S/.</label>
    								<input class="form-control col-lg-6 text-right" id="idIGV" name="cotizacion.detalle.igv"  readonly/>
    							</div>
    							<div class="col-lg-offset-3 row d-flex mb-1">
       								<label class="control-label col-lg-5 mt-1">Descuento S/.</label>
    								<input class="form-control col-lg-6 text-right" id="idDescuento"  name="cotizacion.detalle.descuento" readonly/>
    							</div>
    							<div class="col-lg-offset-3 row d-flex mb-1">
       								<label class="control-label col-lg-5 mt-1">Total S/.</label>
    								<input class="form-control col-lg-6 text-right" id="idTotal" name="cotizacion.detalle.monTotal"  readonly/>
    							</div>
	       					</div>
		            	</div>				
	            	</div>
	            </div>
				<div class="form-group row col-lg-12">
					  <label for="exampleInputEmail1" class="col-md-4 mt-5 ml-2 border bg-darkblue">¿Es necesaria una visita Tecnica?</label>
					   <label for="exampleInputEmail1" class=" mt-5 ml-2 ">
					   	<a href="registraVisita.jsp" target="_blank" id="btnIrVisita" class="btn btn-success">Ir a registrar</a>
					   </label>
				</div>
			
						<div class="form-group col-lg-6">
							<label class="col-lg-12">Enviar a:</label>
							<select id="idReceptor"  class="form-group form-control" name="cotizacion.idReceptor.idusuario">	
								<option value="0">[ Seleccione ]</option>
							</select>
						</div>
					
				

		<button type="submit" class="btn btn-primary m-3" id="btnRegistrar">Registrar</button>
		<a href="cancelarCotizacion" type="button" id="btnCancelar" class="btn btn-danger">Cancelar</a>	
	</form>
</div>




<jsp:include page="footer.jsp"></jsp:include>
</div>
<script>

function cambiar(){
    var pdrs = document.getElementById('file-upload').files[0].name;
    document.getElementById('info').innerHTML = pdrs;
}
/*
$(document).on("click","#elegirItem",(function(){
	var cod,url,pdf;
	cod=$(this).parents("tr").find("td")[0].innerHTML;
	des=$(this).parents("tr").find("td")[1].innerHTML;
	min=parseFloat($(this).parents("tr").find("td")[2].innerHTML);
	max=parseFloat($(this).parents("tr").find("td")[3].innerHTML);
	
	$('#item').val(des);
	$('#desPreMin').text("S/. "+min.toFixed(2));
	$('#desPreMax').text("S/. "+max.toFixed(2));
	var prom=(min+max)/2;
	$('#desPreProm').text("S/. "+prom.toFixed(2));
	$('#precio').val(prom.toFixed(2));
	$('#mostrarPDF').attr("src",url);
	$('#mostrarPDF').css("width","100%");
	$('#mostrarPDF').css("height","600px");
	//$('#idModalBuscarAlumno').modal("hide");
	$('#btnAgregarItem').prop('disabled',false);
}));

*/
$(document).on("click","#btnEditar",(function(){
	var cod,des,min,max,pre;
	cod=$(this).parents("tr").find("td")[0].innerHTML;
	des=$(this).parents("tr").find("td")[1].innerHTML;
	pre=parseFloat($(this).parents("tr").find("td")[2].innerHTML);
	
	$('#codItem').val(cod);
	$('#item').val(des);
	//$('#desPreMin').text("S/. "+min.toFixed(2));
	//$('#desPreMax').text("S/. "+max.toFixed(2));
	//var prom=(min+max)/2;
	//$('#desPreProm').text("S/. "+prom.toFixed(2));
	$('#precio').val(pre.toFixed(2));
	$('#modificarItem').prop('disabled',false);
	
	$('#mostrarPDF').attr("src",url);
	$('#mostrarPDF').css("width","100%");
	$('#mostrarPDF').css("height","600px");
	$('#btnAgregarItem').val("Modificar");
}));
$('#frameVisita').hide();

function listarAllItems(){
	$.getJSON("listaAllItems",{},function(data){
		var i=0;
   		//alert("Hola");
   		$("#tbItems tbody").empty();
   		$.each(data.listaItem,function(index,item){
   			$("#tbItems tbody").append("<tr data-dismiss='modal'><td>"+item.iditem+"</td><td>"+item.nombre+"</td><td>"+item.precioMin+"</td><td>"+item.precioMax+"</td></tr>");	
   			i++;
   		})
   		if(i==0)$('#btnActivaFitem').prop('disabled',false);
   	})
}

function listarAllCliente(){
	$('#btnActivaFcliente').prop('disabled',true);
	$.getJSON("listaClienteJson",{},function(data){
   		$("#detallesCliente tbody").empty();
   		$.each(data.listaCliente,function(index,item){
   			$("#detallesCliente tbody").append("<tr data-dismiss='modal'><td>"+item.idcliente+"</td><td>"+item.razonSocial+"</td><td>"+item.nombreContacto+"</td><td>"+
   					item.telefono+"</td><td>"+item.correo+"</td><</tr>");	
   		
   		})
   	})
   //	$('#detallesCliente').DataTable();
	///(listarAllCliente(), 10000);
}

function desapareceAlert(){
	$(".alert").fadeTo(2000,500).slideUp(500,function(){
		$(".alert").slideUp(500);	
		/*$("#idAlertCliente").append("<c:remove var='MENSAJE'/>");
		$("#idAlertItem").append("<c:remove var='MENSAJE'/>");*/
	   	listarAllCliente();
	   	listarAllItems();
	});
}

function buscarItemXnombre(nom){

	$.getJSON("listaItemsAtName",{nombre:nom},function(data){
		var i=0;
   		//alert("Hola");
   		$("#tbItems tbody").empty();
   		$.each(data.listaItem,function(index,item){
   			$("#tbItems tbody").append("<tr data-dismiss='modal'><td>"+item.iditem+"</td><td>"+item.nombre+"</td><td>"+item.precioMin+"</td><td>"+item.precioMax+"</td></tr>");	
   			i++;
   		})
   		$('#formItem').hide();
   		if(i>0)
   			$('#btnActivaFitem').prop('disabled',true);
   		else 
   			$('#btnActivaFitem').prop('disabled',false);
   	})
}

function buscarClienteXnombre(nom){

		//alert("Hola"+nom);
	$.getJSON("listaClienteAtName",{nombre:nom},function(data){
		var i=0;
		//alert("Hola"+nom);
   		$("#detallesCliente tbody").empty();
   		$.each(data.listaCliente,function(index,item){
   			$("#detallesCliente tbody").append("<tr data-dismiss='modal'><td>"+item.idcliente+"</td><td>"+item.razonSocial+"</td><td>"+item.nombreContacto+"</td><td>"+
   					item.telefono+"</td><td>"+item.correo+"</td><</tr>");	
   			i++;
   		})
   		
   		$('#formCliente').hide();
   		if(i>0)
   			$('#btnActivaFcliente').prop('disabled',true);
   		else 
   			$('#btnActivaFcliente').prop('disabled',false);
   	})
}
$("#detallesCliente").on("click","tbody tr",function(){
	var cod,raz,nom,fono,email;
	cod=$(this).children("td:eq(0)").html();
	raz=$(this).children("td:eq(1)").html();
	nom=$(this).children("td:eq(2)").html();
	fon=$(this).children("td:eq(3)").html();
	email=$(this).children("td:eq(4)").html();

	$("#form_registrar").data("bootstrapValidator").resetForm(true);
	$("#idCodigoCliente").val(cod);
	$("#idRazonSocial").val(raz);
	$("#idNombreContacto").val(nom);
	$("#idTelefono").val(fon);
	$("#idEmail").val(email);
	$("#idReceptor").val("0");
	$("#btnBuscarItem").prop("disabled",false);
	$("#btnCancelar").attr("class","btn btn-danger");
	$("#btnAgregarItem").prop("disabled",false);
})

$("#tbItems").on("click","tbody tr",function(){
	var cod,des,min,max;
	cod=$(this).children("td:eq(0)").html();
	des=$(this).children("td:eq(1)").html();
	min=parseFloat($(this).children("td:eq(2)").html());
	max=parseFloat($(this).children("td:eq(3)").html());

	$('#codItem').val(cod);
	$('#item').val(des);
	$('#desPreMin').text("S/. "+min.toFixed(2));
	$('#desPreMax').text("S/. "+max.toFixed(2));
	var prom=(min+max)/2;
	$('#desPreProm').text("S/. "+prom.toFixed(2));
	$('#precio').val(prom.toFixed(2));
	$("#nomItem").val("");
	$('#mostrarPDF').attr("src",url);
	$('#mostrarPDF').css("width","100%");
	$('#mostrarPDF').css("height","600px");
	//$('#agregarItem').prop('disabled',false);
	//$('#btnAgregarItem').prop('disabled',false);
	$('#buscarItem').modal("hide");
})
$(document).on("click","#btnEliminar",(function(){
		var codigo=$(this).parents("tr").find("td")[0].innerHTML;
		var mon=0;
		//alert(codigo);
		$("#idDetalle tbody").empty();
		$.getJSON("eliminarItemCotizacion",{codItem:codigo},function(data){
			var mon=0,ig=0,sub=0,des=0;
			var editar="<button type='button' class='btn btn-info' id='btnEditar'>Editar</button>";
			var eliminar="<button type='button' class='btn btn-danger' data-toggle='modal' data-target='#myModal' id='btnEliminar'>Eliminar</button>";
			$.each(data.listaDetalle,function(index,item){
				$("#idDetalle").append("<tr><td>"+item.item.iditem+"</td><td>"+item.item.nombre+"</td><td class='text-right'>"+parseFloat(item.precio).toFixed(2)+"</td><td class='text-center'>"+
						item.cantidad+"</td><td class='text-right'>"+parseFloat(item.precioTotal).toFixed(2)+"</td><td>"+editar+"</td><td>"+eliminar+"</td></tr>");
			
				sub+=item.precioTotal;
			})
			igv=sub*0.18;
			des=sub*0.05;
			mon=sub+igv-des;
			$("#idDetalle").DataTable();
			$("#idSubTotal").val(parseFloat(sub).toFixed(2));	
			$("#idIGV").val(parseFloat(igv).toFixed(2));	
			$("#idDescuento").val(parseFloat(des).toFixed(2));	
			$("#idTotal").val(parseFloat(mon).toFixed(2));	
		})	
	}));
</script>

<script type="text/javascript">
$(document).ready(function(){
	$('#detalles').DataTable();
	$('#btnModificarItem').prop('disabled',true);
	$('#btnActivaFitem').prop('disabled',true);
	$('#formItem').hide();
	$('#formCliente').hide();
	listarAllItems();
	desapareceAlert();
	$("#btnAgregarItem").prop("disabled",true);
	$("#btnCancelar").attr("class","btn btn-danger disabled");
	$("#btnIrVisita").attr("class","btn btn-success disabled");
	$("#btnBuscarItem").prop("disabled",true);
	$("#btnRegistrar").prop("disabled",true);
	/*============ AGREGAR CLIENTE ==========*/
	$('input[type=search]').click(function(){
		$('#formCliente').hide();
	});
	listarAllCliente();
	$("#btnAddCliente").click(function(){
	   	var raz,nom,fono,email;
	   	raz=$("#idRaz").val().trim();;
	   	nom=$("#idNomCon").val().trim();;
	   	fono=$("#idFono").val().trim();;
	   	email=$("#idCorreo").val().trim();;
	   	//alert("Hola "+raz);
		if(raz==""){
	   		alert("Ingrese Razon Social o Nombre del Cliente");
	   		return false;
	   	}
	   	else if(nom==""){
	   		alert("Ingrese Nombre de la persona");
	   		return false;
	   	}
	   	else if(fono==""){
	   		alert("Ingrese Telefono del Cliente");
	   		return false;
	   	}
	   		$.getJSON("addClienteJson",{razSocial:raz,nomContacto:nom,telefono:fono,email:email},function(data){
	   			$("#idAlertCliente").append("<div class='alert alert-warning alert-dismissible fade show' role='alert' id='success-alert'><strong>${sessionScope.MENSAJE}"+data.mensaje+"</strong>"+
	  	   	   		  "<button type='button' class='close' data-dismiss='alert'aria-label='Close'><span aria-hidden='true'>&times;</span></button></div>");	
	  	   	   
	   	   	})
	    $("#formCliente").trigger("reset");
	   	$('#formCliente').hide();
	   	desapareceAlert();
	   	//listarAllCliente();
	   	buscarClienteXnombre(nom);
	   	$('#detallesCliente').DataTable();
   	});
	
	//================== AGREGAR NUEVO ITEM======================//
   	$("#btnFitem").click(function(){
	   	var nom,min,max;
	   	nom=$("#nomItem").val().trim();
	   	min=$("#preMin").val();
	   	max=$("#preMax").val();
	   	if(nom==""){
	   		alert("Ingrese nombre del Item");
	   		return false;
	   	}
	   	else if(min<1){
	   		alert("Ingrese el precio minimo del Item");
	   		return false;
	   	}else if(max<1){
	   		alert("Ingrese el precio maximo del Item");
	   		return false;
	   	}else{
	   		$.getJSON("registrarItemJson",{nombre:nom,preMin:min,preMax:max},function(data){
	   			$("#idAlertItem").append("<div class='alert alert-warning alert-dismissible fade show' role='alert' id='success-alert'><strong>"+data.mensaje+"</strong>"+
	  	   	   		  "<button type='button' class='close' data-dismiss='alert'aria-label='Close'><span aria-hidden='true'>&times;</span></button></div>");	
	  	   	   
	   	   	})
		    $("#formItem").trigger("reset");
		   	$('#formItem').hide();
		   	desapareceAlert();
		   //	buscarItemXnombre(nom);
		   	//listarAllItems();
		   	buscarItemXnombre(nom);
	   	}
   	});
   	
   	$.getJSON("listaPersonalAdministrativo",{},function(data){
   			$.each(data.listaUsua,function(index,item){
   				$("#idReceptor").append("<option value='"+item.idusuario+"'>"+item.cargo.descripcion+" : " + item.nombre+" "+ item.apellidos+"</option>");	
   			})
	   	   
	   	})
	
   	$.getJSON("mostrarDetalleCotizacion",function(data){
		var mon=0,ig=0,sub=0,des=0;
		var editar="<button type='button' class='btn btn-info' id='btnEditar'>Editar</button>";
		var eliminar="<button type='button' class='btn btn-danger' data-toggle='modal' data-target='#myModal' id='btnEliminar'>Eliminar</button>";
		$.each(data.listaDetalle,function(index,item){
			$("#idDetalle").append("<tr><td>"+item.item.iditem+"</td><td>"+item.item.nombre+"</td><td class='text-right'>"+parseFloat(item.precio).toFixed(2)+"</td><td class='text-center'>"+
					item.cantidad+"</td><td class='text-right'>"+parseFloat(item.precioTotal).toFixed(2)+"</td><td>"+editar+"</td><td>"+eliminar+"</td></tr>");
		
			sub+=item.precioTotal;
		})
		igv=sub*0.18;
		des=sub*0.05;
		mon=sub+igv-des;
		$("#idDetalle").DataTable();
		$("#idSubTotal").val(parseFloat(sub).toFixed(2));	
		$("#idIGV").val(parseFloat(igv).toFixed(2));	
		$("#idDescuento").val(parseFloat(des).toFixed(2));	
		$("#idTotal").val(parseFloat(mon).toFixed(2));	
	})
	
	$("#btnRegistrar").click(function(){
		var total=$("#idTotal").val();
		if(total<1){
			alert("Elegir al menos un item para procesar la Cotizacion");
			return false;
		}
	});
	
	$('#btnActivaFitem').click(function(){
		$('#formItem').show();
	});

	
	$('input[type=radio][name=visita]').change(function() {
	    if (this.value == 'Si') {
	    	//$('#btnVisita').prop('disabled',false);
	    	$('#btnCliente').prop('disabled',false);
	    	$('#frameVisita').show(500);
	    }
	    else if (this.value == 'No') {
	    	$('#btnCliente').prop('disabled',false);
	    	$('#btnVisita').prop('disabled',true);
	    	$('#frameVisita').hide(500);
	    }
	});
	
	$('#nomItem').keyup(function(){
		var nom=$('#nomItem').val();
		buscarItemXnombre(nom);
	});
	
	$('#nomCliente').keyup(function(){
		var nom=$('#nomCliente').val();
		buscarClienteXnombre(nom);
	});
	
	
	$("#btnAgregarItem").click(function(){
		$('#btnRegistrar').prop('disabled',false);
		var item,des,can,pre,sub=0,igv,des,mon;
		item=$("#codItem").val();
		des=$("#item").val();
		pre=$("#precio").val();
		can=$("#cantidad").val();
		//sub=$("#idSubTotal").val();
		//alert(item+des+pre+can)
		if(des==""){
			alert("Elegir un Item");
			return false;
		}else if(pre<1){
			alert("Ingresar precio mayor a 0");
			return false;
		}
		else if(can<1){
			alert("Ingresar Cantidad mayor a 0");
			return false;
		}
		$("#idDetalle tbody").empty();
		$.getJSON("agregarItemCotizacion",{codItem:item,nombre:des,cantidad:can,precio:pre},function(data){
			//$("#idLaboratorio").empty().append("<option value>[ Todos ]</option>");
			var editar="<button type='button' class='btn btn-info' id='btnEditar'>Editar</button>";
			var eliminar="<button type='button' class='btn btn-danger' data-toggle='modal' data-target='#myModal' id='btnEliminar'>Eliminar</button>";
			$.each(data.listaDetalle,function(index,item){
				imp=item.precio*item.cantidad;
				$("#idDetalle").append("<tr><td>"+item.item.iditem+"</td><td>"+item.item.nombre+"</td><td>"+parseFloat(item.precio).toFixed(2)+"</td><td>"+
						item.cantidad+"</td><td>"+parseFloat(imp).toFixed(2)+"</td><td>"+editar+"</td><td>"+eliminar+"</td></tr>");
				//mon=mon+item.precioTotal;
				sub+=item.precioTotal;
				/*sub=item.subtotal;
				igv=item.igv;
				des=item.descuento;
				mon=item.monTotal;*/
			})
				
				igv=sub*0.18;
				des=sub*0.05;
				mon=sub+igv-des;
			$("#idDetalle").DataTable();
			$("#idSubTotal").val(parseFloat(sub).toFixed(2));	
			$("#idIGV").val(parseFloat(igv).toFixed(2));	
			$("#idDescuento").val(parseFloat(des).toFixed(2));	
			$("#idTotal").val(parseFloat(mon).toFixed(2));	
			
		})		
		$("#codItem").val("");
		$("#item").val("");
		$("#precio").val("");
		$("#cantidad").val("");
		$('#desPreMin').text("S/.00. 00");
		$('#desPreMax').text("S/.00. 00");
		$('#desPreProm').text("S/.00. 00");
		$('#btnAgregarItem').val("Agregar");
		$("#btnRegistrar").prop("disabled",true);
		$("#btnIrVisita").attr("class","btn btn-success");
	})
	/*
	$('#tbItems').pageMe({
		pagerSelector: '#developer_page',
		showPrevNext: true,
		hidePageNumbers: false,
		perPage: 10
	});*/
	
});
</script>

<script type="text/javascript">  
    $(document).ready(function(){    

        $('#form_registrar').bootstrapValidator({      
       	 fields:{
       		 
       		 RazonSocial: {
    	    	selector:'#idRazonSocial',   
                   validators: {    
                       notEmpty: {    
                           message: 'Elija un cliente para la cotizacion'    
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