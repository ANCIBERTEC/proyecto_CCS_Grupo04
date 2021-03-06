<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Area</title>
<link rel="icon" href="/NCDEVICE/img/icono.ico">
</head>
<body>
<jsp:include page="barraMenu.jsp"></jsp:include>
<div  class="container">

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

<div class="cont_mant ml-5 mr-5">
	<!-- <a href="newArea.jsp?tipo=nuevo" class="btn btn-primary mt-2">Nuevo</a> -->
	<button type="button" class="btn btn-info mt-4" data-toggle="modal" data-target="#nuevo">Nuevo <img src="img/Symbol Add 2.png"></button>
	

<div id="divEmpleado">
		<table id="id_table" class="display mt-5 table table-striped table-bordered">
		    <thead>
		        <tr>
		            <th>Código</th>
		            <th>Titulo</th>
		            <th></th>
		            <th></th>
		            <th></th>
		        </tr>
		    </thead>
		    <tbody>
		    
		    <c:forEach items="${sessionScope.AREAS}" var="item">
		    	<tr>
		            <td class="">${item.idarea}</td>
		            <td class="col-lg-4">${item.descripcion}</td>
		            <td class=""><a href="#" id="btnDetalles"  class="btn btn-info" data-toggle="modal" data-target="#nuevo">Detalles</a></td>
		            <td class=""><a href="#" id="btnEditar"  class="btn btn-success" data-toggle="modal" data-target="#nuevo">Editar</a></td>
		            <td class=""><a href="#" id="btnEliminar"  class="btn btn-danger" data-toggle="modal" data-target="#eliminar">Eliminar</a></td>
		        </tr>
		    </c:forEach> 
		</table>

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
        	¿Seguro de eliminar el Area? 
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <form action="eliminaArea" method="post" name="formDelete">	
		  	  <input type="hidden" id="idEliminar" name="codigo">
	          <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
	          <button type="submit" class="btn btn-primary">Eliminar</button>
            </form>
        </div>
        
    </div>
  </div>
</div>

<!-- REGISTRAR NUEVA AREA -->
<div class="modal fade bd-example-modal-xl" id="nuevo"  data-backdrop="static" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-xs modal-dialog-centered" role="document">
    <div class="modal-content">
    <div class="modal-header">
      	 <h5 class="modal-title" id="titleModal">Registrar Area</h5>
      </div>
      <div class="m-2 ml-5 mb-5">      		
        <form method="post" action="mantenerArea" id="idRegistrar" class="mt-3 form-horizontal" data-toggle="validator" role="form">
			<label for="exampleInputEmail1"  class="col-lg-12">Datos del Area:</label>
			<div class="form-group col-lg-12 row border">
			<div class="form-group col-lg-12">
				<label for="exampleInputEmail1">Titulo:</label>
				<input type="hidden" class="form-control"  name="area.idarea" id="idCodigo" value="0">
				<input type="text" class="form-control"  name="area.descripcion" id="idArea" placeholder="Ingresar nombre">
			</div>
			</div>
			<button type="submit" class="btn btn-primary">Registrar</button>  		
        	<button type="button" class="btn btn-danger" id="btnCancelar" data-dismiss="modal">Cancelar</button>	
		</form>
 		 
      </div>
    </div>
  </div>
</div>



<jsp:include page="footer.jsp"></jsp:include>
</div>
<script type="text/javascript">
$(document).on("click","#btnDetalles",(function(){
	var cod=$(this).parents('tr').find("td")[0].innerHTML;
	$("#titleModal").text("Detalles del Area");
	$.getJSON("buscaAreaXCodigo",{codigo:cod},function(data){
		$("#idCodigo").val(cod);
		$("#idArea").val(data.area.descripcion);
	})
	bloquear(true);
}));

$(document).on("click","#btnEditar",(function(){
	var cod=$(this).parents('tr').find("td")[0].innerHTML;
	$("#titleModal").text("Editar Area");
	$.getJSON("buscaAreaXCodigo",{codigo:cod},function(data){
		$("#idCodigo").val(cod);
		$("#idArea").val(data.area.descripcion);
	})
	bloquear(false);
}));

$(document).on("click","#btnEliminar",(function(){
	var cod=$(this).parents('tr').find("td")[0].innerHTML;
	$("#idEliminar").val(cod);
}));


function bloquear(b){
	$("#idRegistrar input").prop("disabled",b);
}

$(document).ready( function () {

	$("#success-alert").fadeTo(2000,500).slideUp(500,function(){
		$("#success-alert").slideUp(500);	
	});
	
    /*
	$.getJSON("listaAreaJson",{},function(data){
		//alert("Hola");
		$.each(data.listaArea,function(index,item){
			var detalles="<button type='button' class='btn btn-info' id='btnDetalles' data-toggle='modal'  data-target='#idModalRegistra'>Ver</button>";
			var buscar="<button type='button' class='btn btn-success' id='btnBuscar' data-toggle='modal'  data-target='#idModalRegistra'>Editar</button>";
			var eliminar="<button type='button' class='btn btn-danger' data-toggle='modal' data-target='#myModal' id='btnEliminar'>Eliminar</button>";
			$("#id_table tbody").append("<tr><td>"+item.idarea+"</td><td>"+item.descripcion+"</td><td>"+detalles+"</td><td>"+buscar+"</td><td>"+eliminar+"</td>");
		})
		//$("#idTable").DataTable().draw();
		$("#id_table").DataTable();
	})
    
    */
    
    
    
    $("#btnCancelar").click(function(){
    	$("#idRegistrar").trigger("reset");
		$("#idRegistrar").data("bootstrapValidator").resetForm(true);
		$("#idCodigo").val("0");
    });
    
} );
</script>

<script type="text/javascript">  
    $(document).ready(function(){    

        $('#idRegistrar').bootstrapValidator({      
       	 fields:{
       		 
       		 Area: {
    	    		selector:'#idArea',   
                   validators: {    
                       notEmpty: {    
                           message: 'Ingrese nombre de Area'    
                       },      
                       regexp: {    
                           regexp: /^[a-zA-ZáéíóúÁÉÍÓÚ\s\w]+$/,    
                           message: 'Letras y números'    
                       },    
                   }    
               }
       	 }
       }); 
    });
 </script>
</body>
</html>