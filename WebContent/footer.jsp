<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<style>

.fixed-bottom {
  position: fixed;
  bottom: 0;
  right: 0;
  left:85%;
  width: 200px;
  z-index: 5;
  background-color: "";
}

</style>


<button type="button" id="nuevoMensaje" class="btn btn-primary fixed-bottom position-fixed" data-toggle="modal" data-target="#enviarMensaje" data-whatever="@mdo">Nuevo mensaje</button>

<div class="modal fade" id="enviarMensaje" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Nuevo mensaje</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="alert alert-warning alert-dismissible fade show" id="alerta_mensaje" role="alert">
		  <strong></strong>
		  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
		    <span aria-hidden="true">&times;</span>
		  </button>
		</div>
        <form method="post" action="/NCDEVICE/paginas/ServletUsuario?accion=ENVIAR_MENSAJE" id="form_mensaje" class="mt-3">
          <div class="form-group">
          <input type="text" class="form-control" id="emisor" value="${sessionScope.usuarioLogin.idusuario}" name="emisor" hidden="">
            <label for="recipient-name" class="col-form-label">Para:</label>
	        <select id="receptor" name="receptor">
	        <option>[ Seleccione ]</option>
			 
			 </select>
          </div>
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">Asunto</label>
            <input type="text" class="form-control" id="asunto" name="asunto">
          </div>
          <div class="form-group">
            <label for="message-text" class="col-form-label">Mensaje:</label>
            <textarea class="form-control" id="mensaje" rows="5" name="mensaje"></textarea>
          </div> 
          <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
	        <button type="button" id="btnEnviar" class="btn btn-primary">Enviar mensaje</button>
	      </div>
        </form>
      </div>
     
    </div>
  </div>
</div>

<footer class="py-5">
	
	
	
  <div class="row">
    <div class="col-12 col-md">
      <small class="d-block mb-3 text-muted">&copy; 2020-2023</small>
    </div>
    <div class="col-6 col-md">
      <h5>Features</h5>
      <ul class="list-unstyled text-small">
        <li><a class="text-muted" href="#">Cool stuff</a></li>
        <li><a class="text-muted" href="#">Random feature</a></li>
      
      </ul>
    </div>
    <div class="col-6 col-md">
      <h5>Resources</h5>
      <ul class="list-unstyled text-small">
        <li><a class="text-muted" href="#">Resource</a></li>
        <li><a class="text-muted" href="#">Resource name</a></li>
      </ul>
    </div>
    <div class="col-6 col-md">
      <h5>Resources</h5>
      <ul class="list-unstyled text-small">
        <li><a class="text-muted" href="#">Business</a></li>
        <li><a class="text-muted" href="#">Education</a></li>
      </ul>
    </div>
    <div class="col-6 col-md">
      <h5>About</h5>
      <ul class="list-unstyled text-small">
        <li><a class="text-muted" href="#">Team</a></li>
        <li><a class="text-muted" href="#">Locations</a></li>
      </ul>
    </div>
  </div>
</footer>

<script>

$(document).ready(function(){
	$("#alerta_mensaje").hide();
	$.getJSON("listaComboPersonal",function(data){
		$.each(data.listaUsua,function(index,item){
			$("#receptor").append("<option value='"+item.idusuario+"'>"+item.nombre+" "+item.apellidos+"</option>");	
		})
	});
	
	
	$("#btnEnviar").click(function(){
		var emi,rec,asu,men;
		emi=$("#emisor").val();
		rec=$("#receptor").val();
		asu=$("#asunto").val();
		men=$("#mensaje").val();
		$("#alerta_mensaje").show();
		$("#alerta_mensaje strong").empty();
		$.getJSON("registraMensaje",{emisor:emi,receptor:rec,asunto:asu,contenido:men},function(data){
			//bucle
			$("#alerta_mensaje strong").append("Mensaje:"+data.mensaje);
			
		})
		$("#emisor").val("");
		$("#receptor").val("");
		$("#asunto").val("");
		$("#mensaje").val("");
	});
});
function recibirNotify(){
	$.getJSON("listaDocumentoAtTipo",function(data){
		$("#canNotify").val(data.notify);	
		alert(data.notify);
	})
	
}
//alert("Hola");
recibirNotify();
</script>

<script type="text/javascript">
	recibirNotify();
	//alert("Hola");
	$.getJSON("cantidadDocsRecAtUser",function(data){
		$("#canNotify").val(data.notify);	
		alert(data.notify);
	})
</script>
<!--
<script src="/NCDEVICE/js/offcanvas.js"></script>
<script src="/NCDEVICE/js/popper.min.js"></script>
<script src="/NCDEVICE/js/popper.min.js.descarga"></script>
<script src="/NCDEVICE/js/bootstrap.min.js"></script>
<script src="/NCDEVICE/js/bootstrap.min.js.descarga"></script>
<script src="/NCDEVICE/js/offcanvas.js"></script>
<script src="/NCDEVICE/js/bootstrap.bundle.js"></script>
  -->

<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.1/dist/jquery.validate.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.1/dist/jquery.validate.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.1/dist/additional-methods.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.1/dist/additional-methods.min.js"></script>


<script src="/NCDEVICE/js/jquery-3.3.1.slim.min.js.descarga"></script>
<script src="/NCDEVICE/js/jquery-3.3.1.min.js"></script>
<script src="/NCDEVICE/js/popper.min.js"></script>
<script src="/NCDEVICE/js/bootstrap.min.js"></script>
<script src="/NCDEVICE/js/jquery.dataTables.min.js"></script>
<script src="/NCDEVICE/js/bootstrapValidator.js"></script>

<!-- 
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jquery-ui.js"></script> -->




