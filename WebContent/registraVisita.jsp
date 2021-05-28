
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registra Visita Tecnica</title>
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
<button type="button" class="btn btn-info mb-3 mt-3" data-toggle="modal" data-backdrop="static"  data-target="#buscaCliente">Buscar Cliente</button>
<div class="modal fade bd-example-modal-lg" id="buscaCliente" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-xl" role="document">
    <div class="modal-content">
    <div class="modal-header p-2 bg-darkblue">
      	 <h5 class="modal-title" id="exampleModalLabel">Buscar Cliente</h5>
      </div>
      <div class="modal-body">
      	 <p  class="modal-title" >Elija un Cliente. Si no lo encuentra puede registrar un nuevo Cliente, puede pulsar en el botón "Añadir cliente".</p>
      </div>
      <div class="m-5">
      <a href="listaCliente.jsp" class="btn btn-success mb-3">Añadir Cliente</a>
      	<table id="detallesCliente" class="table-hover">
		    <thead class="thead-dark">
		        <tr>
		            <th>Código</th>
		            <th>Razón social</th>
		            <th>Nombre Contacto</th>
		            <th>Telefono</th>
		            <th>Correo</th>
		            <th>Distrito</th>
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

	<form method="post" action="registraVisitaTecnica" id="idFormRegistrar" class="">
			 <div class="form-group col-lg-12 row">
				 <div class="form-group col-lg-6">
				  <label for="exampleInputEmail1" class="col-lg-6">Datos del Cliente:</label>
				  <div class="form-group col-lg-12 row border">			 	 
					  <div class="form-group col-lg-8">
					    <label for="exampleInputEmail1">Razon Social</label>
					    <input type="text" class="form-control" id="codCliente"  name="visita.idcliente" readonly="readonly" hidden="" value="" placeholder="Codigo del Cliente">
					    <input type="text" class="form-control" id="nomCliente"  name="nomCliente" readonly="readonly" value="" placeholder="Nombre del Cliente">
					  </div>
					<div class="form-group col-lg-8">
					    <label for="exampleInputEmail1">Direccion</label>
					    <input type="text" class="form-control" id="direccion"  name="direccion" readonly="readonly" value="" placeholder="Direccion del Cliente">
					</div>
					<div class="form-group col-lg-8">
					    <label for="exampleInputEmail1">Telefono</label>
					    <input type="text" class="form-control" id="telefono"  name="telefono" readonly="readonly" value="" placeholder="Telefono del Cliente">
					</div>
				  </div>
				</div>
				<div class="form-group col-lg-6">
				  <label for="exampleInputEmail1" class="col-lg-6">Datos de la Visita:</label>
				  <div class="form-group col-lg-12 row border">
					<div class="form-group col-lg-12">
						<label class="col-lg-12">Asignar Tecnico:</label>
						<select id="idTecnico"  class="form-group form-control" name="visita.idtecnico">	
							<option>[ Seleccione ]</option>
						</select>
					 </div>
					 <div class="form-group col-lg-12 row ml-1">
					    <label for="exampleInputEmail1" class="col-lg-12">Fecha a visitar:</label>
					    <input type="date" class="form-control col-lg-5" id="fechaVisita"  name="visita.fecha" value="" placeholder="Fecha">
					    <input type="time" class="form-control col-lg-5 ml-2" id="horaVisita"  name="visita.hora" value="" placeholder="Codigo del Cliente">
					 </div>
						
				  </div>
				</div>
			</div>
			 <button type="submit" class="btn btn-primary">Registrar</button>
	</form>
	
</div>





<jsp:include page="footer.jsp"></jsp:include>
</div>
<script>

$("#detallesCliente").on("click","tbody tr",function(){
	var cod,raz,nom,fono,email,dir;
	cod=$(this).children("td:eq(0)").html();
	
	$.getJSON("buscaCliente",{codigo:cod},function(data){
		$("#codCliente").val(cod);
		$("#nomCliente").val(data.cliente.razonSocial);
		$("#direccion").val(data.cliente.direccion);
		$("#telefono").val(data.cliente.telefono);
		//$("#idEmail").val(data.cliente.razonSocial);
	})
	$("#idFormRegistrar").data("bootstrapValidator").resetForm(true);
	
})
</script>
<script type="text/javascript">
$(document).ready(function(){
	$('#detalles').DataTable();
	$('#detalles2').DataTable();
	
	// width="100%" height="600px" 
	
	$.getJSON("listaClienteJson",{},function(data){
   		$("#detallesCliente tbody").empty();
   		$.each(data.listaCliente,function(index,item){
   			$("#detallesCliente tbody").append("<tr data-dismiss='modal'><td>"+item.idcliente+"</td><td>"+item.razonSocial+"</td><td>"+item.nombreContacto+"</td><td>"+
   					item.telefono+"</td><td>"+item.correo+"</td><td>"+item.distrito.nombre+"</td></tr>");	
   		
   		})
   		$("#detallesCliente").DataTable();
   	})
   	
 	$.getJSON("listaPersonalObrero",{},function(data){
		$.each(data.listaUsua,function(index,item){
			$("#idTecnico").append("<option value='"+item.idusuario+"'>"+item.cargo.descripcion+" : " + item.nombre+" "+ item.apellidos+"</option>");	
		})
  	   
  	})
  	
  	$("#success-alert").fadeTo(2000,500).slideUp(500,function(){
		$("#success-alert").slideUp(500);	
	});
});
</script>

<script type="text/javascript">  
    $(document).ready(function(){    

        $('#idFormRegistrar').bootstrapValidator({      
       	 fields:{
       		 
       		 Nombre: {
    	    		selector:'#nomCliente',   
                   validators: {    
                       notEmpty: {    
                           message: 'Elija un Cliente'    
                       },     
                   }    
               },
               Direccion: {
    	    		selector:'#direccion',   
                  validators: {    
                      notEmpty: {    
                          message: 'Elija un Cliente'    
                      },  
                  }    
              },
              Telefono: {
  	    		selector:'#telefono',   
                validators: {    
                    notEmpty: {    
                        message: 'Elija un Cliente'    
                    },  
                }    
            }, 
            Tecnico: {
  	    		selector:'#idTecnico',   
                validators: {    
                    notEmpty: {    
                        message: 'Elija un Tecnico'    
                    },      
                    regexp: {    
                        regexp: /^[a-zA-Z0-9\s\w]+$/,    
                        message: 'Elija un Tecnico'    
                    },   
                }    
            }, 
            Fecha: {
  	    		selector:'#fechaVisita',   
                validators: {    
                    notEmpty: {    
                        message: 'Elija una fecha para la visita'    
                    } 
                }    
            }, 
            Hora: {
  	    		selector:'#horaVisita',   
                validators: {    
                    notEmpty: {    
                        message: 'Elija una hora para la visita'    
                    },      
                    regexp: {    
                        regexp: /^[0-9:]{1,20}$/,    
                        message: 'Elija una hora para la visita'    
                    },   
                }    
            }
            
       	 }
       }); 
    });
 </script>

</body>
</html>