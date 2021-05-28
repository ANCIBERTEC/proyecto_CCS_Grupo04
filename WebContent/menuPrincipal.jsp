<%@page import="net.ncdevice.entidad.EquipoTrabajo"%>
<%@page import="net.ncdevice.entidad.VisitaTecnica"%>
<%@page import="net.ncdevice.service.ContratoService"%>
<%@page import="net.ncdevice.service.VisitaTecnicaService"%>
<%@page import="net.ncdevice.service.DocumentoService"%>
<%@page import="net.ncdevice.entidad.Documento"%>
<%@page import="net.ncdevice.service.UsuarioService"%>
<%@page import="net.ncdevice.entidad.Mensaje"%>
<%@page import="java.util.List"%>
<%@page import="net.ncdevice.service.MensajeService"%>
<%@page import="net.ncdevice.entidad.Usuario"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Inicio</title>
<link rel="icon" href="/NCDEVICE/img/icono.ico">
</head>

<body>
<jsp:include page="barraMenu.jsp"></jsp:include>
<%
	Usuario bean=(Usuario)session.getAttribute("usuarioLogin");
		int con=0;MensajeService mens=new MensajeService();
		List<Mensaje> listMenE=mens.listaMensajeXEmisor(bean.getIdusuario());
		List<Mensaje> listMenR=mens.listaMensajeXReceptor(bean.getIdusuario());
		
%>
<div class="container">
<div class="col-lg-12 col-sm-12 row">
<aside class="col-lg-3 col-sm-5 col-xs-12 mt-3">
<div class="row">
  <div class="col-12">
    <div class="list-group" id="list-tab" role="tablist">
      <h1><a class="list-group-item list-group-item-action text-light bg-info" id="list-home-list" data-toggle="list" href="#list-home" role="tab" aria-controls="home">Mensajes</a></h1>
   	  <a class="list-group-item list-group-item-action" id="mEnviado" data-toggle="list" href="#list-enviados" role="tab" aria-controls="profile">Enviados (<%=listMenE.size() %>)</a>
      <a class="list-group-item list-group-item-action" id="mRecibidos" data-toggle="list" href="#list-profile" role="tab" aria-controls="profile">Recibidos (<%=listMenR.size() %>)</a>
      <a class="list-group-item list-group-item-action" id="list-messages-list" data-toggle="list" href="#list-messages" role="tab" aria-controls="messages">Ocultar</a>
    </div>
  </div>
  <div class="col-12" style="height: 100%;">
    <div class="tab-content" id="nav-tabContent">
      <div class="tab-pane fade" id="list-home" role="tabpanel" aria-labelledby="list-profile-list"></div>
      <div class="tab-pane fade" id="list-enviados" role="tabpanel" aria-labelledby="list-profile-list">
		<div class="list-group">		
		<%
			
		///AdquisicionEquipos/paginas/ServletRequerimiento?accion=VERIFICAR_REQUERIMIENTO&doc=<%=doc.getIddocumento()
		
			for(Mensaje aux:listMenE){
				%>
				
				<div class="list-group-item list-group-item-action">
			    <div class="d-flex w-100 justify-content-between row">
			      <h5 class="mb-1">Para: <%=aux.getIdReceptor().getNombre()%></h5>
			      <h5 class="mb-1">Asunto: <%=aux.getContenido() %></h5>
			      <small><%=aux.getFechaRegistro()%></small>
			    </div>
			    <span class="mb-1"><%=aux.getContenido() %></span>
			  </div>
				
				
			<% con++;}
		%>
		
		</div>
	  </div>
	  
      <div class="tab-pane fade" id="list-profile" role="tabpanel" aria-labelledby="list-profile-list">
	  	<div class="list-group">
		<%
		///AdquisicionEquipos/paginas/ServletRequerimiento?accion=VERIFICAR_REQUERIMIENTO&doc=<%=doc.getIddocumento()
		
			for(Mensaje aux:listMenR){
				%>
				
				<div class="list-group-item list-group-item-action">
			    <div class="d-flex w-100 justify-content-between row">
			      <h5 class="mb-1">De: <%=aux.getIdEmisor().getNombre()%></h5>
			      <h5 class="mb-1">Asunto: <%=aux.getContenido() %></h5>
			      <small><%=aux.getFechaRegistro()%></small>
			    </div>
			    <span class="mb-1"><%=aux.getContenido() %></span>
			  </div>
				
				
			<% con++;}
		%>
		</div>
	  </div>
      <div class="tab-pane fade" id="list-messages" role="tabpanel" aria-labelledby="list-messages-list"></div>
    </div>
  </div>
</div>	
		
		
	
	</aside>
	<section class="col-lg-9 col-sm-8 mt-3 mb-5">
		<h1 class="list-group-item list-group-item-action text-light bg-info align-center" >Avisos pendientes</h1>
		<div class="list-group bg-secondary">		
		<%
		if(bean.getTipo().equals("Obrero")==false){

			DocumentoService docs=new DocumentoService();
		///AdquisicionEquipos/paginas/ServletRequerimiento?accion=VERIFICAR_REQUERIMIENTO&doc=<%=doc.getIddocumento()
			List<Documento> listDoc=docs.listarDocumentoRecibidos(bean.getIdusuario());
			for(Documento doc:listDoc){
				if(doc.getTipo().equals("CONTRATO")){
					%>
					<div class="list-group-item list-group-item-secondary col-lg-12">
					 <table>
				    	<tr>
				    		<th class="col"><h5 class="mb-1">Documento <span class="mb-1"><%=doc.getIddocumento()%></span> - <%=doc.getEstado() %></h5> <th>
				    		<th><a href="<%=doc.getRuta()%>"  class="btn btn-danger ml-5 btnVerPDF" data-target="#miPDF" data-toggle="modal">VER PDF</a></th>
				    	<tr>
				    	<tr>
				    		<td class="col"><small>Fecha: <%=doc.getFechaRegistro() %>  </small></td>
				    		<td></td>
				    	</tr>
				    </table>			  	  
				  </div>
					
			<%
				}else{
					if(bean.getIdusuario().equals(doc.getIdReceptor().getIdusuario())){
					%>
					<div class="list-group-item list-group-item-secondary col-lg-12">
					 <table>
				    	<tr>
				    		<th class="col"><h5 class="mb-1">Documento <span class="mb-1"><%=doc.getIddocumento()%></span> - <%=doc.getEstado() %></h5> <th>
				    		<th><a href="<%=doc.getRuta()%>"  class="btn btn-danger ml-5 btnVerPDF" data-target="#miPDF" data-toggle="modal">VER PDF</a></th>
				    	<tr>
				    	<tr>
				    		<td class="col"><small>Fecha: <%=doc.getFechaRegistro() %> </small></td>
				    		<td></td>
				    	</tr>
				    </table>			  	  
				  </div>
					
			<%
					}
				}
			}
			
		}else{
			VisitaTecnicaService vs=new VisitaTecnicaService();
			ContratoService cs=new ContratoService();
			
			for(VisitaTecnica vis:vs.listaVisitaPendientesxObrero(bean.getIdusuario())){
				%>
				<div class="list-group-item list-group-item-secondary col-lg-12">
				  <h5>Usted ha sido asignado a la siguiente visita: </h5>
			      <h6 class="mb-1">Documento <span class="mb-1">ID Visita: <%=vis.getIdvisita()%></span> - <%=vis.getEstado() %></h6>
			      <p>Fecha: <%=vis.getFecha() %></p>
			      <p>Hora de la Visita: <%= vis.getHora() %></p>
			      <p>Cliente: <%=vis.getCliente().getRazonSocial() %></p>
			  	  <p>Direccion: <%=vis.getCliente().getDireccion() %></p>
			  	  <p>Telefono: <%=vis.getCliente().getTelefono() %></p>
			  	  <p>Correo: <%=vis.getCliente().getCorreo() %></p>
			  </div>
				
		<%
			}
			
			for(EquipoTrabajo eq:cs.listaTrabajosPendientesxObrero(bean.getIdusuario())){
				%>
				<div class="list-group-item list-group-item-secondary col-lg-12">
				 <h5>Usted ha sido asignado al siguiente proyecto: </h5>
			      <h5 class="mb-1">Proyecto <span class="mb-1"><%=eq.getContrato().getDescripcion() %></span> - <%=eq.getContrato().getEstado()  %> </h5>
			      <h6>Contrato: <%=eq.getIdcontrato() %></h6>
			      <p>Cargo: <%=eq.getCargo() %></p>
			      <p>Cliente: <%=eq.getContrato().getCotizacion().getCliente().getRazonSocial() %></p>
			  	  <p>Direccion: <%=eq.getContrato().getCotizacion().getCliente().getDireccion() %></p>
			  	  <p>Telefono: <%=eq.getContrato().getCotizacion().getCliente().getTelefono() %></p>			  	  
			  </div>
				
		<%
			}
		}
		%> 
		</div>
	
	</section>
	


</div>

<div class="modal fade bd-example-modal-lg" id="miPDF" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
				<!-- Modal content-->
				<div class="modal-content">
				<div class="bg-darkblue modal-header p-3" style="padding: 5px 20px">
					Buscar Documento
				</div>
				<div class="modal-body" style="padding: 20px 20px;">
				<iframe src=""  id="mostrarPDF" style="height: 600px;"  class="mt-2 col-lg-12"></iframe>
					<div class="modal-footer">
						<button type="button" class="btn btn-danger" data-dismiss="modal" id="btnCerrarForm">Cerrar</button>
					</div>
				</div>
			</div>
		</div>
  </div>




<jsp:include page="footer.jsp"></jsp:include>
</div>
<script>
	$(document).ready(function(){
		var i=0;
		$("mEnviado").click(function(){
			$("list-enviados").show();
			i++;
			if(i==2){
				alert("Hola");
				i=0;
			}
		});
		$(".btnVerPDF").click(function(){
			var ruta=$(this).attr("href");
			$("#mostrarPDF").attr("src",ruta);
		});
		
	});
</script>

</body>
</html>