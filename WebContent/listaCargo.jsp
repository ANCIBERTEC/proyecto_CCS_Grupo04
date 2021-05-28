<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cargo</title>
<link rel="icon" href="/NCDEVICE/img/icono.ico">
</head>
<body>
<jsp:include page="barraMenu.jsp"></jsp:include>
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
	<!-- <a href="newArea.jsp?tipo=nuevo" class="btn btn-primary mt-2">Nuevo</a> -->
	<button type="button" class="btn btn-info mt-4" data-toggle="modal" data-target="#nuevo">Nuevo <img src="img/Symbol Add 2.png"></button>
	<div class="display mt-5">
		<table id="table_id" class="display mt-5 table table-striped table-bordered">
		    <thead>
		        <tr>
		            <th>Código</th>
		            <th>Titulo</th>
		            <th>Area</th>
		            <th></th>
		            <th></th>
		            <th></th>
		        </tr>
		    </thead>
		    <tbody>
		   <c:forEach items="${sessionScope.CARGOS}"  var="item">
		    	<tr>
		            <td class="">${item.idcargo}</td>
		            <td class="col">${item.descripcion}</td>
		            <td class="">${item.area.descripcion}</td>
		            <td class=""><button type="button" class="btn btn-info"   data-toggle="modal" data-target="#nuevo" id="btnDetalles" >Detalles</button></td>
		            <td class=""><button type="button"class="btn btn-success" data-toggle="modal" data-target="#nuevo" id="btnEditar" >Editar</button></td>
		            <td class=""><button type="button" class="btn btn-danger" data-toggle="modal" data-target="#eliminar" id="btnEliminar" >Eliminar</button></td>
		           <!--  <td class=""><button type="button" class="btn btn-warning" data-toggle="modal" data-target="#permisos" id="btnPermisos" >Permisos</button></td> -->
		        </tr>
		    </c:forEach>
		    </tbody>
		</table>
	</div>
</div>

<div class="modal fade bd-example-modal-lg" id="permisos"  tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
    <div class="modal-content">
    <div class="modal-header">
      	 <h5 class="modal-title" id="exampleModalLabel">Administrar Permisos</h5>
      </div>
      <!-- Modal body -->
        <div class="modal-body">
         	
         	<form method="post" action="" id="form_registrar" class="">
			 <div class="form-group">
				 <div class="form-group  col-lg-6">
				    <label for="exampleInputEmail1" class="">Cargo:</label>
				    <input type="hidden" class="form-control" id="idCodCargo"  readonly="readonly"  name="" placeholder="Cargo">
				    <input type="text" class="form-control" id="idNomCargo"  readonly="readonly"  name="" placeholder="Cargo">
				 </div>
				  
				<div class="form-group col-lg-6 ml-1">
					<div class="form-group">
					    <label for="exampleFormControlSelect1">Tipo de Menú</label>
					    <select class="form-control" id="idTipoMenu">
					      <option>[ Seleccione ]</option>
					      <option>Administración</option>
					      <option>Registro</option>
					      <option>Transacciones</option>
					      <option>Consultas</option>
					    </select>
					  </div>
				    <label for="exampleInputEmail1" class="">Opciones:</label>
				    <div id="lmenus">
				 		<div class="form-check">
						  <input class="form-check-input" type="checkbox" value="" id="defaultCheck1">
						  <label class="form-check-label" for="defaultCheck1">Area</label>
						</div>
						<div class="form-check">
						  <input class="form-check-input" type="checkbox" value="" id="defaultCheck1">
						  <label class="form-check-label" for="defaultCheck1">Cargo</label>
						</div>
						<div class="form-check">
						  <input class="form-check-input" type="checkbox" value="" id="defaultCheck1">
						  <label class="form-check-label" for="defaultCheck1">Trabajador</label>
						</div>
						<div class="form-check">
						  <input class="form-check-input" type="checkbox" value="" id="defaultCheck1">
						  <label class="form-check-label" for="defaultCheck1">Cliente</label>
						</div>
				    
				    </div>
				</div>
				  
			</div>
			 <button type="submit" class="btn btn-primary m-3" id="btnRegistrar">Registrar</button>
	</form>
         	
         	
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
	          <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
        </div>
        
    </div>
  </div>
</div>


<div class="modal fade bd-example-modal-lg" id="eliminar"  tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
    <div class="modal-content">
    <div class="modal-header">
      	 <h5 class="modal-title" id="exampleModalLabel">¿Está seguro de eliminar?</h5>
      </div>
      <!-- Modal body -->
        <div class="modal-body">
        	¿Seguro de eliminar el Cargo? 
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <form action="eliminaCargo" method="post" name="formDelete">	
		  	  <input type="hidden" id="idEliminar" name="codigo">
	          <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
	          <button type="submit" class="btn btn-primary">Eliminar</button>
            </form>
        </div>
        
    </div>
  </div>
</div>

<!-- REGISTRAR NUEVA AREA -->
<div class="modal fade bd-example-modal-lg" id="nuevo" data-backdrop="static" role="form" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-xs modal-dialog-centered" role="document">
    <div class="modal-content">
    	<div class="modal-header">
      	 <h5 class="modal-title" id="idTituloModal">Registrar Cargo o Especialidad</h5>
      	</div>
      	<div class="modal-body">
      	 <p>RECUERDA: Si va a añadir una especialidad, debe elegir como área el "Departamento de Obras"</p>
      	</div>
      <div class="m-2 ml-5 mb-5">      		
        <form method="post" action="mantenerCargo" id="formRegistra" class="mt-3 form-horizontal" data-toggle="validator" role="form">
			<label for="exampleInputEmail1"  class="col-lg-12">Datos del Cargo:</label>
			<div class="form-group col-lg-12 row border">
			<div class="form-group col-lg-12">
				<label for="exampleInputEmail1">Titulo:</label>
				<input type="hidden" class="form-control" name="cargo.idcargo" id="idCodigo" value="0">
				<input type="text" class="form-control" name="cargo.descripcion" id="idCargo" placeholder="Ingresar nombre">
			</div>
			<div class="form-group col-lg-12">
				<label class="col-lg-12">Area:</label>
				<select class="form-group form-control" id="idArea" name="cargo.idarea">	
					<option value="0">[ Seleccione ]</option>
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

<jsp:include page="footer.jsp"></jsp:include>
</div>
<script type="text/javascript">
/*
function elegirArea(var area){
	$("#cboarea").val(area);
}
*/
$(document).on("click","#btnPermisos",(function(){
	var cod,nom;
	cod=$(this).parents("tr").find("td")[0].innerHTML;
	nom=$(this).parents("tr").find("td")[1].innerHTML;
	$("#idCodCargo").val(cod);
	$("#idNomCargo").val(nom);
}));

$(document).on("click","#btnDetalles",(function(){
	$("#idTituloModal").text("Detalles del Cargo");
	var cod;
	cod=$(this).parents("tr").find("td")[0].innerHTML;
	$.getJSON("buscaCargoXCodigo",{codigo:cod},function(data){
		$("#idCodigo").val(cod);
		$("#idCargo").val(data.cargo.descripcion);
		$("#idArea").val(data.cargo.idarea);
	})
	bloquear(true);
	$("#btnRegistrar").prop("disabled",true);
}));
$(document).on("click","#btnEditar",(function(){
	var cod;
	$("#idTituloModal").text("Editar Cargo");
	cod=$(this).parents("tr").find("td")[0].innerHTML;
	$.getJSON("buscaCargoXCodigo",{codigo:cod},function(data){
		$("#idCodigo").val(cod);
		$("#idCargo").val(data.cargo.descripcion);
		$("#idArea").val(data.cargo.idarea);
	})
	bloquear(false);
	$("#btnRegistrar").prop("disabled",false);
}));
$(document).on("click","#btnEliminar",(function(){
	var cod;
	$("#idTituloModal").text("Editar Cargo");
	cod=$(this).parents("tr").find("td")[0].innerHTML;
	$("#idEliminar").val(cod);
}));
function bloquear(b){
	$("#formRegistra input").prop("disabled",b);
	$("#formRegistra select").prop("disabled",b);
}

$(document).ready( function () {
	
	$.getJSON("listaAreaJson",{},function(data){
		//alert("Hola");
		$.each(data.listaArea,function(index,item){
				$("#idArea").append("<option value='"+item.idarea+"'>"+item.descripcion+"</option>");
		})
	})

	$("#success-alert").fadeTo(2000,500).slideUp(500,function(){
		$("#success-alert").slideUp(500);	
	});
	    
    $("#btnCancelar").click(function(){
    	$("#formRegistra").trigger("reset");
		$("#formRegistra").data("bootstrapValidator").resetForm(true);
		$("#idCodigo").val("0");
		bloquear(false);
		$("#btnRegistrar").prop("disabled",false);
		$("#idTituloModal").text("Registro de Medicamento");
    	$("#formRegistra select").val(0);
    });
	
    $( "#idTipoMenu" ).change(function() {
    	var tipo=$(this).val();
    	
    	$.getJSON("listaPermisosAtTipo",{tipo:tipo},function(data){
    		//alert("Hola");
    		$("#lmenus").empty();
    		$.each(data.listaMenu,function(index,item){
    				$("#lmenus").append("<div class='form-check'>"+
  						  "<input class='form-check-input' type='checkbox' value="+item.idmenu+" id='ck"+item.idmenu+"'>"+
					 		"<label class='form-check-label' for='defaultCheck1'>"+item.descripcion+"</label></div>");
    				if(item.tipo==1){
    					$("#ck"+item.idmenu).attr("checked",true);
    				}
					  
    					
    		})
    	})
    	
    });
    
} );
</script>

<script type="text/javascript">  
    $(document).ready(function(){    

        $('#formRegistra').bootstrapValidator({      
       	 fields:{
       		 
       		 Cargo: {
    	    		selector:'#idCargo',   
                   validators: {    
                       notEmpty: {    
                           message: 'Ingrese nombre del Cargo o Especialidad'    
                       },      
                       regexp: {    
                           regexp: /^[a-zA-ZáéíóúÁÉÍÓÚ\s\w]+$/,    
                           message: 'Letras y números'    
                       },    
                   }    
               },
               Area: {
    	    		selector:'#idArea',   
                  validators: {    
                      notEmpty: {    
                          message: 'Seleccione un Area'    
                      },        
                      regexp: {    
                          regexp: /^[0-9]+$/,    
                          message: 'Seleccione un Area'    
                      },  
                  }    
              }
       	 }
       }); 
    });
 </script>

</body>
</html>