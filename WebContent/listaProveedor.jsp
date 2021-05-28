
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<title>Proveedores</title>
<link rel="icon" href="/NCDEVICE/img/icono.ico">
<link rel="stylesheet" href="../css/css_banner_client.css">
<script src="../js/js_banner_client.js" type="text/javascript"></script>
</head>
<body>
<jsp:include page="barraMenu.jsp"></jsp:include>
<div class="container">

<c:if test="${sessionScope.CORRECTO!=null}">
<div class="alert alert-success alert-dismissible fade show" role="alert" id="alert_message">
  <strong></strong> ${sessionScope.CORRECTO}
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
</c:if>
<c:remove var="CORRECTO"/>

<c:if test="${sessionScope.ERROR!=null}">
<div class="alert alert-danger alert-dismissible fade show" role="alert" id="alert_message">
  <strong></strong> ${sessionScope.ERROR}
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
</c:if>
<c:remove var="ERROR"/>

<div class="cont_mant ml-5 mr-5">
	<!-- <a href="newArea.jsp?tipo=nuevo" class="btn btn-primary mt-2">Nuevo</a> -->
	<button type="button" class="btn btn-info mt-4" data-toggle="modal" data-target="#nuevo" id="btnNuevo">Nuevo <img src="img/User 7 Add.png"></button>
	<div class="display mt-3">
		<table id="table_id" class="display mt-5">
		    <thead>
		         <tr>
		            <th>Código</th>
		            <th>Empresa</th>
		            <th>Telefono</th>
		            <th>RUC</th>
		            <th>Distrito</th>
		            <th>Region</th>
		            <th></th>
		            <th></th>
		            <th></th>
		        </tr>
		    </thead>
		    <tbody>
		   		<c:forEach items="${sessionScope.PROVEEDORES}" var="item">
		    	<tr>
		            <td>${item.idproveedor}</td>
		            <td>${item.nombreEmpresa}</td>
		            <td>${item.telefono}</td>
		            <td>${item.ruc}</td>
		            <td>${item.distrito.nombre}</td>
		            <td>${item.distrito.provincia.region.nombre}</td>
		            <td class=""><a href="#" class="btn btn-info" id="btnDetalles" data-toggle="modal" data-target="#nuevo">Detalles</a></td>
		            <td class=""><a href="#" class="btn btn-success" id="btnEditar" data-toggle="modal" data-target="#nuevo">Editar</a></td>
		            <td class=""><a href="#" class="btn btn-danger link-delete" id="btnEliminar" data-toggle="modal" data-target="#eliminar">Eliminar</a></td>
		        </tr>
		    </c:forEach>
		    </tbody>
		</table>	
	</div>
</div>

<div class="modal fade bd-example-modal-lg" id="eliminar"  tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
    <div class="modal-content">
    <div class="modal-header">
      	 <h5 class="modal-title" id="exampleModalLabel">¿Está seguro de eliminar?</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <!-- Modal body -->
        <div class="modal-body">
        	Seguro de eliminar al Proveedor? 
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <form action="eliminaProveedor" method="post" name="formDelete">	
		  	  <input type="hidden" id="idEliminar" name="codigo">
	          <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
	          <button type="submit" class="btn btn-primary">Eliminar</button>
            </form>
        </div>
        
    </div>
  </div>
</div>


<!-- REGISTRAR NUEVA AREA -->
<div class="modal fade bd-example-modal-lg newArea" id="nuevo"  data-backdrop="static" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
    <div class="modal-content">
    <div class="modal-header">
      	 <h5 class="modal-title" id="tituloModal">Registrar Proveedor</h5>
      </div>
      <div class="m-2 ml-5 mb-5">      		
        <form method="post" action="mantenerProveedor" id="formRegistra" class="mt-3 form-horizontal" data-toggle="validator" role="form">
			<label for="exampleInputEmail1"  class="col-lg-4">Datos del Proveedor:</label> 
			<div class="form-group col-lg-12 row">
			<div class="form-group col-lg-6">
				<label for="exampleInputEmail1">Empresa:</label>
				<input type="text" class="form-control" id="idCodigo"  name="proveedor.idproveedor" hidden="" readonly="readonly" value="0">
				<input type="text" class="form-control" id="idEmpresa"  name="proveedor.nombreEmpresa" placeholder="Ingresar Nombre de Empresa">
			</div>
			 <div class="form-group col-lg-6">
				<label for="exampleInputEmail1">Contacto:</label>
				<input type="text" class="form-control"  id="idContacto" name="proveedor.nombreContacto" placeholder="Ingresar Nombres y Apellidos">
			</div>
			<div class="form-group col-lg-6">
				<label for="exampleInputEmail1">RUC:</label>
				<input type="text" class="form-control" id="idRuc"  name="proveedor.ruc" placeholder="Ingresar RUC">
			</div>
			<div class="form-group col-lg-6">
				<label for="exampleInputEmail1">Telefono:</label>
				<input type="text" class="form-control" id="idFono"  name="proveedor.telefono" placeholder="Ingresar Telefono">
			</div>
			<div class="form-group col-lg-6">
				<label for="exampleInputEmail1">Direccion:</label>
				<input type="text" class="form-control" id="idDireccion"  name="proveedor.direccion" placeholder="Ingresar Direccion">
			</div>
			<div class="form-group col-lg-6">
				<label class="col-lg-12">Region:</label>
				<select id="idRegion"  class="form-group form-control" name="region">	
					<option>[ Seleccione ]</option>
				</select>
			</div>
			<div class="form-group col-lg-6">
					<label class="col-lg-12">Provincia:</label>
					<select id="idProvincia"  class="form-group form-control" name="provincia">	
						<option>[ Seleccione ]</option>
					</select>
				</div>
			<div class="form-group col-lg-6">
				<label class="col-lg-12">Distrito:</label>
				<select id="idDistrito"  class="form-group form-control" name="proveedor.iddistrito">	
					<option>[ Seleccione ]</option>
				</select>
			</div>
			</div>
			<br>
			<button type="submit" class="btn btn-primary" id="btnRegistrar">Registrar</button>
			<button type="button" class="btn btn-danger" data-dismiss="modal" id="btnCancelar">Cancelar</button>	
		</form>
 		 
      </div>
    </div>
  </div>
</div>


<jsp:include page="footer.jsp"></jsp:include>
</div>

<script type="text/javascript">

function eliminar(iduser){
	alert("Hola"+iduser);
}

$(document).on("click","#btnDetalles",(function(){
	$("#tituloModal").text("Detalles - Proveedor");
	$('#btnRegistrar').prop('disabled',true);
	var codigo;
	codigo=$(this).parents("tr").find("td")[0].innerHTML;
	//alert(codigo);
	$.getJSON("buscaProveedorXCodigo",{codigo:codigo},function(data){
		//alert("Hola"+data.idproveedor);
		var region=data.proveedor.distrito.provincia.region.idregion;
		var provincia=data.proveedor.distrito.provincia.idprovincia;
		var dist=data.proveedor.iddistrito;
		$("#idCodigo").val(data.proveedor.idproveedor);
		$("#idEmpresa").val(data.proveedor.nombreEmpresa);
		$("#idContacto").val(data.proveedor.nombreContacto);
		$("#idRuc").val(data.proveedor.ruc);
		$("#idFono").val(data.proveedor.telefono);
		$("#idDireccion").val(data.proveedor.direccion);
		$("#idRegion").val(region);	
		listaProvincia(region,provincia);		
		
		listaDistrito(provincia,dist);	
		
	})
	bloquear(true);
	
}));

$(document).on("click","#btnEditar",(function(){

	$("#tituloModal").text("Editar - Proveedor");
	var codigo;
	codigo=$(this).parents("tr").find("td")[0].innerHTML;
	//alert(codigo);
	var region=0,provincia=0,dist=0;
	$.getJSON("buscaProveedorXCodigo",{codigo:codigo},function(data){
		//alert("Hola"+data.idproveedor);
		region=data.proveedor.distrito.provincia.region.idregion;
		provincia=data.proveedor.distrito.provincia.idprovincia;
		dist=data.proveedor.iddistrito;

		
		$("#idCodigo").val(data.proveedor.idproveedor);
		$("#idEmpresa").val(data.proveedor.nombreEmpresa);
		$("#idContacto").val(data.proveedor.nombreContacto);
		$("#idRuc").val(data.proveedor.ruc);
		$("#idFono").val(data.proveedor.telefono);
		$("#idDireccion").val(data.proveedor.direccion);
		$("#idRegion").val(region);	
		
		listaProvincia(region,provincia);		
		
		listaDistrito(provincia,dist);		
		
		//alert("d"+dist);
		
	})
	
}));

$(document).on("click","#btnEliminar",(function(){
	
	var codigo;
	codigo=$(this).parents("tr").find("td")[0].innerHTML;
	$("#idEliminar").val(codigo);
}));


function listaProvincia(cod,pro){
	$("#idProvincia").empty();
	$("#idProvincia").append("<option>[ Seleccione ]</option>");
	$.getJSON("listaProvXRegion",{codigo:cod},function(data){
		//alert("Hola");
		$.each(data.listaProvincia,function(index,item){
			$("#idProvincia").append("<option value='"+item.idprovincia+"'>"+item.nombre+"</option>");	
		})
		//if(pro!=0)
			$("#idProvincia").val(pro);
	})
}

function listaDistrito(cod,dis){
	$("#idDistrito").empty();
	$("#idDistrito").append("<option>[ Seleccione ]</option>");
	$.getJSON("listaDistritoXProv",{codigo:cod},function(data){
		//alert("Hola");
		$.each(data.listaDistrito,function(index,item){
			$("#idDistrito").append("<option value='"+item.iddistrito+"'>"+item.nombre+"</option>");	
		})
		//if(dis!=0)
			$("#idDistrito").val(dis);
	})
}

function bloquear(b){
	$("#formRegistra input").prop("disabled",b);
	$("#formRegistra select").prop("disabled",b);
}


$(document).ready( function () {
    $('#table_id').DataTable();
    //$("#iconos").hide();
   	

    $.getJSON("listaAllRegion",{},function(data){
   		//alert("Hola");
   		$.each(data.listaRegion,function(index,item){
   			$("#idRegion").append("<option value='"+item.idregion+"'>"+item.nombre+"</option>");	
   		})
   		
   	})
       
    $("#alert_message").fadeTo(2000,500).slideUp(500,function(){
		$("#alert_message").slideUp(500);	
	});
    
    $('#idRegion').change(function(){
    	//alert("cambiaste de area");
    	var region=$('#idRegion').val();
    	$("#idProvincia").empty();
    	$("#idProvincia").append("<option>[ Seleccione ]</option>");
    	$.getJSON("listaProvXRegion",{codigo:region},function(data){
    		//alert("Hola");
    		$.each(data.listaProvincia,function(index,item){
    			$("#idProvincia").append("<option value='"+item.idprovincia+"'>"+item.nombre+"</option>");	
    		})
    		
    	})
		      
    });
    
    $('#idProvincia').change(function(){
    	//alert("cambiaste de area");
    	var provincia=$('#idProvincia').val();
    	//alert("Elegiste: "+provincia);
    	$("#idDistrito").empty();
		$("#idDistrito").append("<option>[ Seleccione ]</option>");
		$.getJSON("listaDistritoXProv",{codigo:provincia},function(data){
			//alert("Hola");
			$.each(data.listaDistrito,function(index,item){
				$("#idDistrito").append("<option value='"+item.iddistrito+"'>"+item.nombre+"</option>");	
			})
		
		})
    });
    
    $("#success-alert").fadeTo(2000,500).slideUp(500,function(){
		$("#success-alert").slideUp(500);	
	});
	    
    $("#btnCancelar").click(function(){
    	$("#formRegistra").trigger("reset");
		$("#formRegistra").data("bootstrapValidator").resetForm(true);
		$("#idCodigo").val("0");
		bloquear(false);
    	$('#btnRegistrar').prop('disabled',false);
    	$("#formRegistra select").val("[ Seleccione ]");
    });

   
} );
</script>

<script type="text/javascript">  
    $(document).ready(function(){    

        $('#formRegistra').bootstrapValidator({      
       	 fields:{
       		 Empresa: {
	    		selector:'#idEmpresa',   
               validators: {    
                   notEmpty: {    
                       message: 'Ingrese nombre de la Empresa proveedora'    
                   },      
                   regexp: {    
                       regexp: /^[a-zA-ZáéíóúÁÉÍÓÚ\s_0-9\w]+$/,    
                       message: 'Letras y números'    
                   },    
               }    
             },
             Contacto: {
 	    		selector:'#idContacto',   
                validators: {    
                    notEmpty: {    
                        message: 'Ingrese nombre del Contacto'    
                    },      
                    regexp: {    
                        regexp: /^[a-zA-ZáéíóúÁÉÍÓÚ\s\w]+$/,    
                        message: 'Solo letras'    
                    },    
                }    
              },
              Ruc: {
  	    		selector:'#idRuc',   
                 validators: {    
                     notEmpty: {    
                         message: 'Ingrese RUC de la empresa'    
                     },      
                     regexp: {    
                         regexp: /^[0-9]+$/,    
                         message: 'Solo numeros'    
                     },    
                 }    
               },
               Fono: {
   	    		selector:'#idFono',   
                  validators: {    
                      notEmpty: {    
                          message: 'Ingrese Telefono del Contacto o la Empresa'    
                      },      
                      regexp: {    
                          regexp: /^[0-9]+$/,    
                          message: 'Solo números'    
                      },    
                  }    
                },
       		 Direccion: {
    	    		selector:'#idDireccion',   
                   validators: {    
                       notEmpty: {    
                           message: 'Ingrese direccion de la Empresa'    
                       },    
                   }    
               },
               Region: {
   	    		selector:'#idRegion',   
                 validators: {    
                     notEmpty: {    
                         message: 'Seleccione un Distrito'    
                     },        
                     regexp: {    
                         regexp: /^[0-9]+$/,    
                         message: 'Seleccione un Distrito'    
                     },  
                 }    
               },
               Provincia: {
 	    		selector:'#idProvincia',   
               validators: {    
                   notEmpty: {    
                       message: 'Seleccione un Distrito'    
                   },        
                   regexp: {    
                       regexp: /^[0-9]+$/,    
                       message: 'Seleccione un Distrito'    
                   },  
               }    
           	   },
               Distrito: {
    	    		selector:'#idDistrito',   
                  validators: {    
                      notEmpty: {    
                          message: 'Seleccione un Distrito'    
                      },        
                      regexp: {    
                          regexp: /^[0-9]+$/,    
                          message: 'Seleccione un Distrito'    
                      },  
                  }    
              }
       	 }
       }); 
    });
 </script>

</body>
</html>