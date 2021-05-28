
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<title>Personal</title>
<link rel="icon" href="/NCDEVICE/img/icono.ico">
<link rel="stylesheet" href="../css/css_banner_client.css">
<script src="../js/js_banner_client.js" type="text/javascript"></script>
</head>
<body class="bg-secondary">
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
	<button type="button" class="btn btn-info mt-4" data-toggle="modal" data-target="#nuevo">Nuevo <img src="img/User 7 Add.png"></button>
	<div class="display mt-3">
		<table id="table_id" class="display mt-5">
		    <thead>
		         <tr>
		            <th>Código</th>
		            <th>Apellidos y Nombres</th>
		            <th>Telefono</th>
		            <th>Distrito</th>
		            <th>Cargo</th>
		            <th></th>
		            <th></th>
		            <th></th>
		        </tr>
		    </thead>
		    <tbody>
		    <c:forEach items="${sessionScope.usuarios}" var="item">
		    	<tr>
		            <td>${item.idusuario}</td>
		            <td>${item.apellidos}, ${item.nombre}</td>
		            <td>${item.telefono}</td>
		            <td>${item.distrito.nombre}</td>
		            <td>${item.cargo.descripcion}</td>
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
        	Seguro de eliminar al trabajador? 
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <form action="deleteUsuario" method="post" name="formDelete">	
		  	  <input type="hidden" id="idEliminar" name="codigo">
	          <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
	          <button type="submit" class="btn btn-primary">Eliminar</button>
            </form>
        </div>
        
    </div>
  </div>
</div>

<!-- REGISTRAR NUEVA TRABAJADOR -->
<div class="modal fade bd-example-modal-lg newArea" id="nuevo" data-backdrop="static" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
    <div class="modal-content">
    <div class="modal-header">
      	 <h5 class="modal-title" id="tituloModal">Registrar Trabajador</h5>
      </div>
      <div class="m-2 ml-5 mb-5">      		
        <form method="post" action="saveUsuarios" id="form_registrar" class="mt-3 form-horizontal" data-toggle="validator" role="form">
			<label for="exampleInputEmail1"  class="col-lg-4">Datos del Trabajador:</label> 
			<div class="form-group col-lg-12 row">
				<div class="form-group col-lg-6">
					<label for="exampleInputEmail1">Nombres:</label>
					<input type="text" class="form-control" id="codigo" value="0" name="usuario.idusuario" hidden="" readonly="readonly">
					<input type="text" class="form-control" id="nombre" name="usuario.nombre" placeholder="Ingresar Nombres">
				</div>
				 <div class="form-group col-lg-6">
					<label for="exampleInputEmail1">Apellidos:</label>
					<input type="text" class="form-control" id="apellido"  name="usuario.apellidos" placeholder="Ingresar Apellidos">
				</div>
				<div class="form-group col-lg-6">
					<label for="exampleInputEmail1">DNI:</label>
					<input type="text" class="form-control"  id="dni" name="usuario.dni" placeholder="Ingresar DNI">
				</div>
				<div class="form-group col-lg-6">
					<label for="exampleInputEmail1">RUC:</label>
					<input type="text" class="form-control"  id="ruc" name="usuario.ruc" placeholder="Ingresar RUC">
				</div>
				<div class="form-group col-lg-6">
					<label for="exampleInputEmail1">Telefono:</label>
					<input type="text" class="form-control" id="fono"  name="usuario.telefono" placeholder="Ingresar Telefono">
				</div>
				<div class="form-group col-lg-6">
					<label for="exampleInputEmail1">Correo:</label>
					<input type="text" class="form-control" id="email"  name="usuario.correo" placeholder="Ingresar Correo">
				</div>
				<div class="form-group col-lg-6">
					<label for="exampleInputEmail1">Fecha de Contrato:</label>
					<input type="date" class="form-control"  id="fCon" name="usuario.fechaContrato" placeholder="Ingresar Fecha de Contrato">
				</div>
				<div class="form-group col-lg-6">
					<label for="exampleInputEmail1">Sueldo (Pago X dia):</label>
					<input type="text" class="form-control"  id="sueldo" name="usuario.sueldo" placeholder="Ingresar Sueldo">
				</div>
				<div class="form-group col-lg-6">
					<label for="exampleInputEmail1">Banco:</label>
					<input type="text" class="form-control" id="banco"  name="usuario.banco" placeholder="Ingresar Banco">
				</div>
				<div class="form-group col-lg-6">
					<label for="exampleInputEmail1">Nro° de Cuenta:</label>
					<input type="text" class="form-control"  id="numCuenta" name="usuario.numeroCuenta" placeholder="Ingresar Num. Cuenta">
				</div>
				<div class="form-group col-lg-6">
					<label for="exampleInputEmail1">Sexo:</label>
					<select id="sexo" class="form-group col-lg-12 form-control" name="usuario.sexo">
						<option>[ Seleccione ]
						<option>Masculino</option>
						<option>Femenino</option>
					</select>
				</div>
				<div class="form-group col-lg-6">
					<label for="exampleInputEmail1">Area:</label>
					<select class="form-group col-lg-12 form-control" id="area" name="area">
						<option>[ Seleccione ]</option>
						<c:forEach items="${requestScope.areas}" var="item">
							<option value="${item.idarea}">${item.descripcion}</option>
						</c:forEach>
					</select>
				</div>
				<div class="form-group col-lg-6">
					<label for="exampleInputEmail1">Cargo:</label>
					<select  class="form-group col-lg-12 form-control" id="cargo" name="usuario.idcargo">
						<option>[ Seleccione ]</option>
					</select>
				</div>
				<div class="form-group col-lg-6">
					<label for="exampleInputEmail1">Tipo Usuario:</label>
					<select id="tipouser" class="form-group col-lg-12 form-control" name="usuario.tipo">
						<option>[ Seleccione ]
						<option value="1">Administrador</option>
						<option value="2">Trabajador</option>
						<option value="3">Obrero</option>
					</select>
				</div>
				<div class="form-group col-lg-6">
				<label class="col-lg-12">Region:</label>
				<select id="region"  class="form-group form-control" name="region">	
					<option>[ Seleccione ]</option>
				</select>
				</div>
				<div class="form-group col-lg-6">
					<label class="col-lg-12">Provincia:</label>
					<select id="provincia"  class="form-group form-control" name="provincia">	
						<option>[ Seleccione ]</option>
					</select>
				</div>
				<div class="form-group col-lg-6">
					<label class="col-lg-12">Distrito:</label>
					<select id="distrito"  class="form-group form-control" name="usuario.iddistrito">	
						<option>[ Seleccione ]</option>
					</select>
				</div>
			</div>
			<button type="submit" class="btn btn-primary" id="btnRegistrar">Registrar</button>
			<button type="button" class="btn btn-danger" id="btnCancelar" data-dismiss="modal">Cancelar</button>	
		</form>
 		 
      </div>
    </div>
  </div>
</div>
<!-- ============================================================================================================== -->


<jsp:include page="footer.jsp"></jsp:include>
</div>

<script type="text/javascript">

$(document).on("click","#btnDetalles",(function(){
	$("#tituloModal").text("Detalles - Trabajador");
	$('#btnRegistrar').prop('disabled',true);
	var codigo;
	codigo=$(this).parents("tr").find("td")[0].innerHTML;
	//alert(codigo);
	var region=0,provincia=0,dist=0,cargo=0,area=0;
	$.getJSON("buscarUsuarioXCodigo",{codigo:codigo},function(data){
		//alert("Hola"+data.idproveedor);
		region=data.usuario.distrito.provincia.region.idregion;
		provincia=data.usuario.distrito.provincia.idprovincia;
		dist=data.usuario.iddistrito;
		cargo=data.usuario.idcargo;
		area=data.usuario.cargo.area.idarea;
		var tuser=data.usuario.tipo;
		
		$("#codigo").val(codigo);
		$("#nombre").val(data.usuario.nombre);
		$("#apellido").val(data.usuario.apellidos);
		$("#dni").val(data.usuario.dni);
		$("#ruc").val(data.usuario.ruc);
		$("#fono").val(data.usuario.telefono);
		$("#email").val(data.usuario.correo);
		$("#fCon").val(data.usuario.fechaContrato);
		$("#sueldo").val((data.usuario.sueldo).toFixed(2));
		$("#banco").val(data.usuario.banco);
		$("#numCuenta").val(data.usuario.numeroCuenta);
		if(tuser=="Administrador")
			$("#tipouser").val(1);
		else if(tuser=="Trabajador")
			$("#tipouser").val(2);
		else if(tuser=="Obrero")
			$("#tipouser").val(3);
		$("#sexo").val(data.usuario.sexo);
		$("#region").val(region);	
		$("#area").val(area);	
		
		listaProvincia(region,provincia);		
		
		listaDistrito(provincia,dist);		
		
		listaCargo(area,cargo);
		//alert("d"+dist);
		
	})
	bloquear(true);
	
}));

$(document).on("click","#btnEditar",(function(){

	$("#tituloModal").text("Editar - Trabajador");
	var codigo;
	codigo=$(this).parents("tr").find("td")[0].innerHTML;
	//alert(codigo);
	var region=0,provincia=0,dist=0,cargo=0,area=0;
	$.getJSON("buscarUsuarioXCodigo",{codigo:codigo},function(data){
		//alert("Hola"+data.idproveedor);
		region=data.usuario.distrito.provincia.region.idregion;
		provincia=data.usuario.distrito.provincia.idprovincia;
		dist=data.usuario.iddistrito;
		cargo=data.usuario.idcargo;
		area=data.usuario.cargo.area.idarea;
		var tuser=data.usuario.tipo;
		
		$("#codigo").val(codigo);
		$("#nombre").val(data.usuario.nombre);
		$("#apellido").val(data.usuario.apellidos);
		$("#dni").val(data.usuario.dni);
		$("#ruc").val(data.usuario.ruc);
		$("#fono").val(data.usuario.telefono);
		$("#email").val(data.usuario.correo);
		$("#fCon").val(data.usuario.fechaContrato);
		$("#sueldo").val((data.usuario.sueldo).toFixed(2));
		$("#banco").val(data.usuario.banco);
		$("#numCuenta").val(data.usuario.numeroCuenta);
		if(tuser=="Administrador")
			$("#tipouser").val(1);
		else if(tuser=="Trabajador")
			$("#tipouser").val(2);
		else if(tuser=="Obrero")
			$("#tipouser").val(3);
		$("#sexo").val(data.usuario.sexo);
		$("#region").val(region);	
		$("#area").val(area);	
		
		listaProvincia(region,provincia);		
		
		listaDistrito(provincia,dist);		
		
		listaCargo(area,cargo);
		//alert("d"+dist);
		
	})
	bloquear(false);
}));

$(document).on("click","#btnEliminar",(function(){
	
	var codigo;
	codigo=$(this).parents("tr").find("td")[0].innerHTML;
	$("#idEliminar").val(codigo);
}));

function listaProvincia(cod,pro){
	$("#provincia").empty();
	$("#provincia").append("<option>[ Seleccione ]</option>");
	$.getJSON("listaProvXRegion",{codigo:cod},function(data){
		//alert("Hola");
		$.each(data.listaProvincia,function(index,item){
			$("#provincia").append("<option value='"+item.idprovincia+"'>"+item.nombre+"</option>");	
		})
		//if(pro!=0)
			$("#provincia").val(pro);
	})
}

function listaDistrito(cod,dis){
	$("#distrito").empty();
	$("#distrito").append("<option>[ Seleccione ]</option>");
	$.getJSON("listaDistritoXProv",{codigo:cod},function(data){
		//alert("Hola");
		$.each(data.listaDistrito,function(index,item){
			$("#distrito").append("<option value='"+item.iddistrito+"'>"+item.nombre+"</option>");	
		})
		//if(dis!=0)
			$("#distrito").val(dis);
	})
}



function listaCargo(are,car){
	$("#cargo").empty();
	$("#cargo").append("<option>[ Seleccione ]</option>");
	$.getJSON("listaCargoXArea",{codigo:are},function(data){
		//alert("Hola");
		$.each(data.listaCargo,function(index,item){
			$("#cargo").append("<option value='"+item.idcargo+"'>"+item.descripcion+"</option>");	
		})
		//if(dis!=0)
			$("#cargo").val(car);
	})
}
function bloquear(b){
	$("#form_registrar input").prop("disabled",b);
	$("#form_registrar select").prop("disabled",b);
}


$(document).ready( function () {
    $('#table_id').DataTable();
    $("#iconos").hide();
    $('#formDetalle input').prop('disabled','true');
    $('#formDetalle select').prop('disabled','true');
    $('.link-delete').click(function(){
    	var link=$(this).attr('href');
    	$('#btn-eliminar').attr('href',''+link);
    });
    
    $("#alert_message").fadeTo(2000,500).slideUp(500,function(){
		$("#alert_message").slideUp(500);	
	});
    
    $.getJSON("listaAllRegion",{},function(data){
   		//alert("Hola");
   		$.each(data.listaRegion,function(index,item){
   			$("#region").append("<option value='"+item.idregion+"'>"+item.nombre+"</option>");	
   		})
   		
   	})
   	
   	 $.getJSON("listaAreaJson",{},function(data){
   		//alert("Hola");
   		$.each(data.listaArea,function(index,item){
   			$("#area").append("<option value='"+item.idarea+"'>"+item.descripcion+"</option>");	
   		})
   		
   	})
    
    
    $('#region').change(function(){
    	//alert("cambiaste de area");
    	var region=$('#region').val();
    	//alert("Elegiste: "+region);
    	$("#provincia").empty();
    	$("#provincia").append("<option>[ Seleccione ]</option>");
		$.getJSON("listaProvXRegion",{codigo:region},function(data){
			//alert("Hola");
			$.each(data.listaProvincia,function(index,item){
				$("#provincia").append("<option value='"+item.idprovincia+"'>"+item.nombre+"</option>");	
			})
			
		})
		      
    });
    
    $('#provincia').change(function(){
    	//alert("cambiaste de area");
    	var provincia=$('#provincia').val();
    	//alert("Elegiste: "+region);
    	$("#distrito").empty();
    	$("#distrito").append("<option>[ Seleccione ]</option>");
		$.getJSON("listaDistritoXProv",{codigo:provincia},function(data){
			//alert("Hola");
			$.each(data.listaDistrito,function(index,item){
				$("#distrito").append("<option value='"+item.iddistrito+"'>"+item.nombre+"</option>");	
			})
			
		})
		      
    });
    
    $('#area').change(function(){
    	//alert("cambiaste de area");
    	var area=$('#area').val();
    	//alert("Elegiste: "+area);
    	$("#cargo").empty();
    	$("#cargo").append("<option>[ Seleccione ]</option>");
		$.getJSON("listaCargoXArea",{codigo:area},function(data){
			//alert(data.idcargo);
			
			$.each(data.listaCargo,function(index,item){
				$("#cargo").append("<option value='"+item.idcargo+"'>"+item.descripcion+"</option>");	
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
3
</script>

<script type="text/javascript">  
    $(document).ready(function(){    

        $('#form_registrar').bootstrapValidator({      
       	 fields:{
       		 
       		 Nombre: {
    	    		selector:'#nombre',   
                   validators: {    
                       notEmpty: {    
                           message: 'Ingrese nombre'    
                       },      
                       regexp: {    
                           regexp: /^[a-zA-ZñÑáéíóúÁÉÍÓÚ\s\w]+$/,    
                           message: 'Solo letras'    
                       },    
                   }    
               },
               Apellido: {
   	    		selector:'#apellido',   
                  validators: {    
                      notEmpty: {    
                          message: 'Ingrese apellidos'    
                      },      
                      regexp: {    
                          regexp: /^[a-zA-ZñÑáéíóúÁÉÍÓÚ\s\w]+$/,    
                          message: 'Solo letras'    
                      },    
                  }    
              },
              DNI: {
     	    		selector:'#dni',   
                    validators: {    
                        notEmpty: {    
                            message: 'Ingrese DNI'    
                        },      
                        regexp: {    
                            regexp: /^[0-9]{8}$/,    
                            message: 'Deben ser 8 números'    
                        },    
                    }    
                },
              Telefono: {
  	    		selector:'#fono',   
                 validators: {    
                     notEmpty: {    
                         message: 'Ingrese Celular o Telefono Fijo'    
                     },      
                     regexp: {    
                         regexp: /^[0-9]{7,9}$/,    
                         message: 'Deben ser entre 7 y 9 números'    
                     },    
                 }    
             },
             FechaContrato: {
   	    		selector:'#fCon',   
                  validators: {    
                      notEmpty: {    
                          message: 'Ingrese Fecha de Contrato'    
                      },   
                  }    
              }
              ,
              Banco: {
  	    		selector:'#banco',   
                 validators: {    
                     notEmpty: {    
                         message: 'Ingrese nombre del banco a despositar'    
                     },    
                 }    
             }
              ,
              Sueldo: {
  	    		selector:'#sueldo',   
                 validators: {    
                     notEmpty: {    
                         message: 'Ingrese sueldo del trabajador'    
                     },      
                     regexp: {    
                         regexp: /^([0-9]+)[.][0-9]{1,2}$/,    
                         message: 'El campo sueldo es de formato ####.##'    
                     },    
                 }    
             },
             Sexo: {
 	    		selector:'#sexo',   
              validators: {    
                  notEmpty: {    
                      message: 'Seleccione un Tipo de Sexo'    
                  },        
                  regexp: {    
                      regexp: /^[a-zA-Z]+$/,    
                      message: 'Seleccione un Tipo de Sexo'    
                  },  
              }    
         	},
             Area: {
 	    		selector:'#area',   
               validators: {    
                   notEmpty: {    
                       message: 'Seleccione un Area'    
                   },        
                   regexp: {    
                       regexp: /^[0-9]+$/,    
                       message: 'Seleccione un Area'    
                   },  
               }    
             },
             Cargo: {
	    		selector:'#cargo',   
             validators: {    
                 notEmpty: {    
                     message: 'Seleccione un Cargo'    
                 },        
                 regexp: {    
                     regexp: /^[0-9]+$/,    
                     message: 'Seleccione un Cargo'    
                 },  
             }    
        	},
             Tipo: {
	    		selector:'#tipouser',   
             validators: {    
                 notEmpty: {    
                     message: 'Seleccione un Tipo de Usuario'    
                 },        
                 regexp: {    
                     regexp: /^[0-9]+$/,    
                     message: 'Seleccione un Tipo de Usuario'    
                 },  
             }    
        	},
             Region: {
    	    		selector:'#region',   
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
  	    		selector:'#provincia',   
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
     	    		selector:'#distrito',   
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