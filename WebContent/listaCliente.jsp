<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<title>Clientes</title>
<link rel="icon" href="/NCDEVICE/img/icono.ico"><!-- 
<link rel="stylesheet" href="../css/css_banner_client.css">

<script src="../js/js_banner_client.js" type="text/javascript"></script> -->

</head>

<link href="http://netdna.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet"/>
<link href="css/starrr.css" rel=stylesheet/>
<script src="js/starrr.js"></script>    

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

<div class="cont_mant ml-1 mr-5">
	<!-- <a href="newArea.jsp?tipo=nuevo" class="btn btn-primary mt-2">Nuevo</a> -->
	<button type="button" class="btn btn-info mt-4" data-toggle="modal" data-target="#nuevo" id="btnNuevo">Nuevo <img src="img/User 7 Add.png"></button>
	<div class="display mt-3">
		<table id="table_id" class="display mt-5">
		    <thead>
		         <tr>
		            <th>ID</th>
		            <th>Razon Social</th>
		            <th>Telefono</th>
		            <th>Distrito</th>
		            <th>Región</th>
		            <th>Calificación</th>
		            <th></th>
		            <th></th>
		            <th></th>
		        </tr>
		    </thead>
		    <tbody>
		    <c:forEach items="${sessionScope.clientes}" var="item">
		    	<tr>
		            <td>${item.idcliente}</td>
		            <td class="col">${item.nombreContacto}</td>
		            <td><a href="tel:+"${item.telefono}>${item.telefono}</a></td>
		            <td>${item.distrito.nombre}</td>
		            <td>${item.distrito.provincia.region.nombre}</td>
		            <td><div class="calificacion"><span hidden="">${item.calificacion} </span></div></td>
		            <td class=""><a href="#" class="btn btn-info" id="btnDetalle" data-toggle="modal" data-target="#nuevo">Detalles</a></td>
		            <td class=""><a href="#" class="btn btn-success verMas btnEditar" id="btnEditar"  data-toggle="modal" data-target="#nuevo">Editar</a></td>
		            <td class=""><a href="#" class="btn btn-danger link-delete" id="btnEliminar"  data-toggle="modal" data-target="#eliminar">Eliminar</a></td>
		        </tr>
		    </c:forEach>
		    </tbody>
		</table>	
	</div>
</div>



<div class="modal fade bd-example-modal-lg" id="eliminar" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
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
        	Seguro de eliminar medicamento? 
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <form action="eliminaCliente" method="post" name="formDelete">	
		  	  <input type="hidden" id="idCodigoEliminar" name="codigo">
	          <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
	          <button type="submit" class="btn btn-primary">Eliminar</button>
            </form>
        </div>
        
    </div>
  </div>
</div>


<!-- REGISTRAR NUEVA AREA -->
<div class="modal fade bd-example-modal-lg" id="nuevo" data-backdrop="static"  role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
    <div class="modal-content">
    <div class="modal-header">
      	 <h5 class="modal-title" id="exampleModalLabel">Registrar Cliente</h5>
      </div>
      <div class="m-2 ml-5 mb-5">      		
        <form method="post" action="mantenerCliente" id="form_registrar" class="mt-3 form-horizontal" data-toggle="validator" role="form">
			<label for="exampleInputEmail1"  class="col-lg-4">Datos del Cliente:</label>
			<div class="form-group col-lg-12 row">
			<div class="form-group col-lg-6">
				<label for="exampleInputEmail1">Razón Social:</label>
				<input type="hidden" class="form-control" id="idCodigo"  name="cliente.idcliente" placeholder="Ingresar Nombres">
				<input type="text" class="form-control" id="razonSocial"  name="cliente.razonSocial" placeholder="Ingresar Nombres">
			</div>
			 <div class="form-group col-lg-6">
				<label for="exampleInputEmail1">Nombre Contacto:</label>
				<input type="text" class="form-control" id="contacto" name="cliente.nombreContacto" placeholder="Ingresar Apellidos">
			</div>
			<div class="form-group col-lg-6">
				<label for="exampleInputEmail1">DNI:</label>
				<input type="text" class="form-control" id="dni"  name="cliente.dni" placeholder="Ingresar DNI">
			</div>
			<div class="form-group col-lg-6">
				<label for="exampleInputEmail1">RUC:</label>
				<input type="text" class="form-control" id="ruc"  name="cliente.ruc" placeholder="Ingresar RUC">
			</div>
			<div class="form-group col-lg-6">
				<label for="exampleInputEmail1">Correo:</label>
				<input type="text" class="form-control" id="email"  name="cliente.correo" placeholder="Ingresar Correo">
			</div>
			<div class="form-group col-lg-6">
				<label for="exampleInputEmail1">Telefono:</label>
				<input type="text" class="form-control"  id="fono" name="cliente.telefono" placeholder="Ingresar Telefono">
			</div>
			<div class="form-group col-lg-6">
				<label for="exampleInputEmail1">Direccion:</label>
				<input type="text" class="form-control" id="direccion"  name="cliente.direccion" placeholder="Ingresar Direccion">
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
				<select id="idDistrito"  class="form-group form-control" name="cliente.iddistrito">	
					<option>[ Seleccione ]</option>
				</select>
			</div>
		
			<div class="form-group col-lg-6">
				<label for="exampleInputEmail1">Tipo:</label>
				<select id="tipo" class="form-group col-lg-12 form-control" name="cliente.tipo">
					<option>[ Seleccione ]
					<option value="Persona">Persona</option>
					<option value="Empresa">Empresa</option>
				</select>
			</div>
			
			
			<div class="form-group col-lg-12">
				<label for="exampleInputEmail1">Calificacion:</label>
				<div class="form-group col-lg-12">
					<div class="form-check form-check-inline btn btn-danger">
					  <input class="form-check-input" type="radio" name="cliente.calificacion" id="inlineRadio1" value="1">
					  <label class="form-check-label" for="inlineRadio1">Mal</label>
					</div>
					<div class="form-check form-check-inline btn btn-warning">
					  <input class="form-check-input" type="radio" name="cliente.calificacion" id="inlineRadio2" value="2">
					  <label class="form-check-label" for="inlineRadio2">Promedio</label>
					</div>
					<div class="form-check form-check-inline btn btn-success">
					  <input class="form-check-input " type="radio" name="cliente.calificacion" id="inlineRadio3" value="3">
					  <label class="form-check-label" for="inlineRadio3">Bueno</label>
					</div>
					<div class="form-check form-check-inline btn btn-primary">
					  <input class="form-check-input" type="radio" name="cliente.calificacion" id="inlineRadio4" value="4">
					  <label class="form-check-label" for="inlineRadio4">Frecuente</label>
					</div>
					<div class="form-check form-check-inline btn btn-info">
					  <input class="form-check-input" type="radio" name="cliente.calificacion" id="inlineRadio5" value="5">
					  <label class="form-check-label" for="inlineRadio5">Muy Potencial</label>
					</div>
				</div>
			</div>
			
			</div>
			<button type="submit" class="btn btn-primary" id="btnRegistrar">Registrar</button>
			<button type="button" class="btn btn-danger"  id="btnCancelar" data-dismiss="modal">Cancelar</button>	
		</form>
 		 
      </div>
    </div>
  </div>
</div>


<jsp:include page="footer.jsp"></jsp:include>
</div>

<script>
/*
function eliminar(iduser){
	alert("Hola"+iduser);
}*/

$(document).on("click","#btnDetalle",(function(){
	//$("#btnEditar").prop("disabled",true);
	//alert("Hola");
	//desbloquear();
	bloquear(true);
	$('#btnRegistrar').prop('disabled',true);
	var codigo;
	codigo=$(this).parents("tr").find("td")[0].innerHTML;
	//alert(codigo);
	$.getJSON("buscaCliente",{codigo:codigo},function(data){
		//alert("Hola"+data.idproveedor);
		var region=data.cliente.distrito.provincia.region.idregion;
		var provincia=data.cliente.distrito.provincia.idprovincia;
		var dist=data.cliente.iddistrito;
		$("#idCodigo").val(codigo);
		$("#razonSocial").val(data.cliente.razonSocial);
		$("#contacto").val(data.cliente.nombreContacto);
		$("#dni").val(data.cliente.dni);
		$("#ruc").val(data.cliente.ruc);
		$("#fono").val(data.cliente.telefono);
		$("#email").val(data.cliente.correo);
		$("#direccion").val(data.cliente.direccion);
		$("#idRegion").val(region);		
		$("#tipo").val(data.cliente.tipo);

		//$("input[name=calificacion]").prop('disabled',false);
		$("#inlineRadio"+data.cliente.calificacion).prop('checked',true);
		$("#inlineRadio"+data.cliente.calificacion).prop('disabled',false);
		
		listaProvincia(region,provincia);		
		
		listaDistrito(provincia,dist);		

		$("#tituloModal").text("Detalles - Cliente");
		
	})
	
}));

$(document).on("click","#btnEditar",(function(){
	bloquear(false);
	//$('#btnCancelar').prop('disabled',false);
	var codigo;
	codigo=$(this).parents("tr").find("td")[0].innerHTML;
	//alert(codigo);
		$("#idCodigo").val(codigo);
	$.getJSON("buscaCliente",{codigo:codigo},function(data){
		//alert("Hola"+data.idproveedor);
		var region=data.cliente.distrito.provincia.region.idregion;
		var provincia=data.cliente.distrito.provincia.idprovincia;
		var dist=data.cliente.iddistrito;
		$("#idCodigo").val(codigo);
		$("#razonSocial").val(data.cliente.razonSocial);
		$("#contacto").val(data.cliente.nombreContacto);
		$("#dni").val(data.cliente.dni);
		$("#ruc").val(data.cliente.ruc);
		$("#fono").val(data.cliente.telefono);
		$("#email").val(data.cliente.correo);
		$("#direccion").val(data.cliente.direccion);
		$("#idRegion").val(region);		
		$("#tipo").val(data.cliente.tipo);

		//$("input[name=calificacion]").prop('disabled',false);
		$("#inlineRadio"+data.cliente.calificacion).prop('checked',true);
		$("#inlineRadio"+data.cliente.calificacion).prop('disabled',false);
		
		listaProvincia(region,provincia);		
		
		listaDistrito(provincia,dist);		

		$("#tituloModal").text("Detalles - Cliente");
		
	})
}));

$(document).on("click","#btnNuevo",(function(){
	
	$("input[name=calificacion]").prop('checked',false);
	for(var i=1;i<6;i++){
		$("input[name=calificacion]").eq(i-1).val(i);
	}
}));


$(document).on("click","#btnEliminar",(function(){
	var codigo=$(this).parents("tr").find("td")[0].innerHTML;
	$("#idCodigoEliminar").val(codigo);
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
	$("#form_registrar input").prop("disabled",b);
	$('#form_registrar select').prop('disabled',b);
}

/*
function desbloquear(){
	$('#btnEditar').prop('disabled',true);
	$('#btnModificar').prop('disabled',true);
	$('#form_registrar input').prop('disabled',false);
	$('#form_registrar select').prop('disabled',false);
}
*/
$(document).ready( function () {
    $('#table_id').DataTable();
    $("#iconos").hide();
    $("#idCodigo").val(0);
    var nFilas = $("#table_id tbody tr").length;
    //alert(nFilas);
    for(var i=0;i<nFilas;i++){
        //$(".calificacion").eq(i).attr('class','btn-success');+
        var cal=$(".calificacion span").eq(i).text();
        //alert(cal);
        if(cal==1)
        $(".calificacion").eq(i).append('<img src="img/starbad.png" width="100%">');
        else if(cal==2)
            $(".calificacion").eq(i).append('<img src="img/starprom.png" width="100%">');
        else if(cal==3)
            $(".calificacion").eq(i).append('<img src="img/stargood.png" width="100%">');
        else if(cal==4)
            $(".calificacion").eq(i).append('<img src="img/starfrec.png" width="100%">');
        else if(cal==5)
            $(".calificacion").eq(i).append('<img src="img/starmax.png" width="100%">');
        	
    }
    
    $("#alert_message").fadeTo(2000,500).slideUp(500,function(){
		$("#alert_message").slideUp(500);	
	});
    
    $('.link-delete').click(function(){
    	var link=$(this).attr('href');
    	$('#btn-eliminar').attr('href',''+link);
    });
    


    $.getJSON("listaAllRegion",{},function(data){
   		//alert("Hola");
   		$.each(data.listaRegion,function(index,item){
   			$("#idRegion").append("<option value='"+item.idregion+"'>"+item.nombre+"</option>");	
   		})
   		
   	})
    
    
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
    
    $("#btnCancelar").click(function(){
    	$("#form_registrar").trigger("reset");
		$("#form_registrar").data("bootstrapValidator").resetForm(true);
		$("#idCodigo").val("0");
		bloquear(false);
    	$('#btnRegistrar').prop('disabled',false);
    	$("#form_registrar select").val("[ Seleccione ]");
    });
    
} );
</script>

<script type="text/javascript">  
    $(document).ready(function(){    

        $('#form_registrar').bootstrapValidator({      
       	 fields:{
       		 RazonSocial: {
	    		selector:'#razonSocial',   
               validators: {    
                   notEmpty: {    
                       message: 'Ingrese Razon Social del cliente'    
                   },      
                   regexp: {    
                       regexp: /^[a-zA-ZáéíóúÁÉÍÓÚ\s_0-9.\w]+$/,    
                       message: 'Letras y números'    
                   },    
               }    
             },
             Contacto: {
 	    		selector:'#contacto',   
                validators: {    
                    notEmpty: {    
                        message: 'Ingrese Nombre del Contacto'    
                    },      
                    regexp: {    
                        regexp: /^[a-zA-ZáéíóúÁÉÍÓÚ\s\w]+$/,    
                        message: 'Solo letras'    
                    },    
                }    
             },
             DNI: {
 	    		selector:'#dni',   
                validators: {    
                    notEmpty: {    
                        message: 'Ingrese DNI de la empresa'    
                    },      
                    regexp: {    
                        regexp: /^[0-9]{8}$/,    
                        message: 'Solo 8 numeros'    
                    },    
                }    
              },
               Correo: {
      	    		selector:'#correo',   
                     validators: {   
                     }    
                   },
               Fono: {
   	    		selector:'#fono',   
                  validators: {    
                      notEmpty: {    
                          message: 'Ingrese Telefono fijo o celular del Contacto o la Empresa'    
                      },      
                      regexp: {    
                          regexp: /^[0-9]{7,11}$/,    
                          message: 'Solo números'    
                      },    
                  }    
                },
       		 Direccion: {
    	    		selector:'#direccion',   
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
                         message: 'Seleccione una Region'    
                     },        
                     regexp: {    
                         regexp: /^[0-9]+$/,    
                         message: 'Seleccione una Region'    
                     },  
                 }    
               },
               Provincia: {
 	    		selector:'#idProvincia',   
               validators: {    
                   notEmpty: {    
                       message: 'Seleccione una Provincia'    
                   },        
                   regexp: {    
                       regexp: /^[0-9]+$/,    
                       message: 'Seleccione una Provincia'    
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
              },
              Tipo: {
  	    		selector:'#tipo',   
                validators: {    
                    notEmpty: {    
                        message: 'Seleccione un Tipo'    
                    },        
                    regexp: {    
                        regexp: /^[a-zA-ZáéíóúÁÉÍÓÚ\s\w]+$/,       
                        message: 'Seleccione un Tipo'    
                    },  
                }    
            }
       	 }
	       }); 
    });
 </script>
</body>
</html>