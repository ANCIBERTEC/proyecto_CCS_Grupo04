
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${sessionScope.usuarioLogin.nombre} ${sessionScope.usuarioLogin.apellidos} - Perfil</title>
<link rel="icon" href="../img/logo.ico">
</head>
<body>
<jsp:include page="barraMenu.jsp"></jsp:include>
<div class="container">

<c:if test="${sessionScope.MENSAJE!=null}">
<div class="alert alert-warning alert-dismissible fade show" role="alert" id="alert_message">
  <strong>${sessionScope.MENSAJE}</strong>
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true" id="spanMensaje">&times;</span>
  </button>
</div>
</c:if>
<c:remove var="MENSAJE"/>

<div class="container col-lg-9">
	<button type="submit" class="btn btn-info mt-4" id="btnActivar">Editar Perfil</button>
	<button type="button" class="btn btn-info mt-4" data-toggle="modal" data-target="#editClave">Cambiar Contraseña</button>
	
<!-- CAMBIAR CONTRASEÑA -->
<div class="modal fade bd-example-modal-xl newArea" id="editClave"  tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
    <div class="modal-content">
    <div class="modal-header">
      	 <h5 class="modal-title" id="exampleModalLabel">Cambiar contraseña</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="m-2 ml-5 mb-5">      		
        <form method="post" action="cambiarClave" id="cambiarClave" class="mt-3">
			<label for="exampleInputEmail1"  class="col-lg-12">Ingrese su contraseña</label>
			<div class="form-group col-lg-12 row border">
			<input type="text" class="form-control"  name="usuario.idusuario" value="${sessionScope.usuarioLogin.idusuario}" hidden="">
			<div class="form-group col-lg-6">
				<label for="exampleInputEmail1">Contraseña actual:</label>
				<input type="password" class="form-control" id="antClave"  placeholder="Ingresar contraseña actual">
			</div>
			<div class="form-group col-lg-6">
				<label for="exampleInputEmail1">Nueva contraseña:</label>
				<input type="password" class="form-control"  name="usuario.password" placeholder="Ingresar nueva contraseña">
			</div>
			</div>
			<button type="submit" class="btn btn-primary">Cambiar</button>  		
        	<button type="button" class="btn btn-danger" data-dismiss="modal">Cancelar</button>	
		</form>
 		 
      </div>
    </div>
  </div>
</div>


	<form method="post" action="actualizaPerfil" id="form_registrar" class="mt-3 p-3">
			<label for="exampleInputEmail1"  class="col-lg-12">Datos del Trabajador:</label>
			<div class="form-group col-lg-12 row">
			<input type="hidden" class="form-control"  name="usuario.idcargo"  id="idcargo" value="${sessionScope.usuario.idcargo}">
			<input type="hidden" class="form-control" name="usuario.iddistrito" id="idDistrito" value="${sessionScope.usuario.iddistrito}">
			<input type="hidden" class="form-control"  id="sexo" value="${sessionScope.usuario.sexo}">
			<div class="form-group col-lg-6">
				<label for="exampleInputEmail1">Codigo:</label>
				<input type="text" class="form-control" id="codigo" name="usuario.idusuario" readonly="readonly" value="${sessionScope.usuario.idusuario}">
			</div>
				<div class="form-group col-lg-6">
					<label for="exampleInputEmail1">Nombres:</label>
					<input type="text" class="form-control" id="nombre" name="usuario.nombre" placeholder="Ingresar Nombres" value="${sessionScope.usuario.nombre}" >
				</div>
				 <div class="form-group col-lg-6">
					<label for="exampleInputEmail1">Apellidos:</label>
					<input type="text" class="form-control" id="apellido"  name="usuario.apellidos" value="${sessionScope.usuario.apellidos}" placeholder="Ingresar Apellidos">
				</div>
				<div class="form-group col-lg-6">
					<label for="exampleInputEmail1">DNI:</label>
					<input type="text" class="form-control"  id="dni" name="usuario.dni" value="${sessionScope.usuario.dni}"  placeholder="Ingresar DNI">
				</div>
				<div class="form-group col-lg-6">
					<label for="exampleInputEmail1">RUC:</label>
					<input type="text" class="form-control"  id="ruc" name="usuario.ruc" value="${sessionScope.usuario.ruc}" placeholder="Ingresar RUC">
				</div>
				<div class="form-group col-lg-6">
					<label for="exampleInputEmail1">Telefono:</label>
					<input type="text" class="form-control" id="fono"  name="usuario.telefono" value="${sessionScope.usuario.telefono}" placeholder="Ingresar Telefono">
				</div>
				<div class="form-group col-lg-6">
					<label for="exampleInputEmail1">Correo:</label>
					<input type="text" class="form-control" id="email"  name="usuario.correo" value="${sessionScope.usuario.correo}" placeholder="Ingresar Correo">
				</div>
				<div class="form-group col-lg-6">
					<label for="exampleInputEmail1">Fecha de Contrato:</label>
					<input type="date" class="form-control"  id="fCon" name="usuario.fechaContrato" value="${sessionScope.usuario.fechaContrato}" placeholder="Ingresar Fecha de Contrato">
				</div>
				<div class="form-group col-lg-6">
					<label for="exampleInputEmail1">Sueldo (Pago X dia):</label>
					<input type="text" class="form-control"  id="sueldo" name="usuario.sueldo" readonly="readonly" value="${sessionScope.usuario.sueldo}" placeholder="Ingresar Sueldo">
				</div>
				<div class="form-group col-lg-6">
					<label for="exampleInputEmail1">Banco:</label>
					<input type="text" class="form-control" id="banco"  name="usuario.banco" value="${sessionScope.usuario.banco}" placeholder="Ingresar Banco">
				</div>
				<div class="form-group col-lg-6">
					<label for="exampleInputEmail1">Nro° de Cuenta:</label>
					<input type="text" class="form-control"  id="numCuenta" name="usuario.numeroCuenta" value="${sessionScope.usuario.numeroCuenta}" placeholder="Ingresar Num. Cuenta">
				</div>
				<div class="form-group col-lg-6">
					<label for="exampleInputEmail1">Sexo:</label>
					<select id="cboSexo" class="form-group col-lg-12 form-control" name="usuario.sexo" >
						<option>[ Seleccione ]
						<option value="Masculino">Masculino</option>
						<option value="Femenino">Femenino</option>
					</select>
				</div>
			<div class="form-group col-lg-6">
				<label for="exampleInputEmail1">Tipo de Usuario:</label>
				<input type="hidden" class="form-control" id="idTipo"  name="usuario.tipo"  placeholder="Ingresar Sueldo">
				<input type="text" class="form-control" id="tipouser"  placeholder="" value="${sessionScope.usuario.tipo}"  readonly="readonly">
			</div>
			<div class="form-group col-lg-6">
				<label for="exampleInputEmail1">Cargo:</label>
				<input type="text" class="form-control" id="cargo"placeholder="Ingresar Sueldo" value="${sessionScope.usuario.cargo.descripcion}"  readonly="readonly">
			</div>
			<div class="form-group col-lg-6">
				<label for="exampleInputEmail1">Distrito:</label>
				<input type="text" class="form-control" id="idDistrito"  placeholder="Ingresar Sueldo" value="${sessionScope.usuario.distrito.nombre}"  readonly="readonly">
			</div>
			</div>
			<button type="submit" class="btn btn-primary" id="btnModificar">Guardar</button>
			<button type="button" class="btn btn-danger" id="btnCancelar">Cancelar</button>
		</form>
 		 


</div>



<jsp:include page="footer.jsp"></jsp:include>
</div>
<script>
		//obtener el valor de la caja idSexo
		var dist=$("#idDistrito").val();
		$("#cbodistrito").val(dist);
		var tuser=$("#idTUser").val();
		$("#cbotipouser").val(tuser);
		var cargo=$("#idcargo").val();
		$("#cbocargo").val(cargo);
		var sexo=$("#sexo").val();
		$("#cboSexo").val(sexo);
		
		var tuser=$("#tipouser").val();
		if(tuser=="Administrador")
			$("#idTipo").val(1);
		else if(tuser=="Trabajador")
			$("#idTipo").val(2);
		else if(tuser=="Obrero")
			$("#idTipo").val(3);
		
		$('#form_registrar input').prop('disabled',true);
		$('#form_registrar select').prop('disabled',true);
		$('#btnModificar').prop('disabled',true);
		$('#form_registrar button').prop('disabled',true);
		
		$("#btnActivar").click(function(){
			$('#form_registrar input').prop('disabled',false);
			$('#form_registrar select').prop('disabled',false);
			$('#form_registrar button').prop('disabled',false);
			//$('#btnModificar').prop('disabled',false);
			
		});
		$("#btnCancelar").click(function(){
			$('#form_registrar input').prop('disabled',true);
			$('#form_registrar select').prop('disabled',true);
			$('#btnModificar').prop('disabled',true);
			$('#form_registrar button').prop('disabled',true);
		});
		
$(document).ready(function(){
	
	$('#form_registrar input').prop('disabled',true);
	$('#form_registrar select').prop('disabled',true);
	$('#btnModificar').prop('disabled',true);
	$('#form_registrar button').prop('disabled',true);
	
	$("#btnActivar").click(function(){
		$('#form_registrar input').prop('disabled',false);
		$('#form_registrar select').prop('disabled',false);
		$('#form_registrar button').prop('disabled',false);
		//$('#btnModificar').prop('disabled',false);
		
	});
	$("#btnCancelar").click(function(){
		$('#form_registrar input').prop('disabled',true);
		$('#form_registrar select').prop('disabled',true);
		$('#btnModificar').prop('disabled',true);
		$('#form_registrar button').prop('disabled',true);
	});
	
	  $("#alert_message").fadeTo(2000,500).slideUp(500,function(){
			$("#alert_message").slideUp(500);	
		});
});
		
		
		
		
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
         	}
               
       	 }
       }); 
    });
 </script>
 
</body>
</html>