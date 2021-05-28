package net.ncdevice.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import net.ncdevice.entidad.Contrato;
import net.ncdevice.entidad.EquipoTrabajo;
import net.ncdevice.entidad.Usuario;
import net.ncdevice.service.ContratoService;

@SuppressWarnings("serial")
@ParentPackage("dawi")
public class ContratoAction extends ActionSupport{
	private List<Contrato> listaContrato;
	//private List<Usuario> listaTrabajadores;
	private List<EquipoTrabajo> listaEquipo;
	private String codigo,cargo,fechaFinal;
	//DATOS TRABAJADAOR
	private String idtrabajador,nombre,apellidos,especialidad,estado;
	private Contrato contrato;
	private Map<String, Object> session=ActionContext.getContext().getSession();
	
	private ContratoService contratoService;
	
	public ContratoAction() {
		contratoService=new ContratoService();
	}
	
	
	@Action(value = "/listaContrato", results = { @Result(type = "json", name="ok")})
	public String listaContrato() {
		listaContrato=contratoService.listaContrato();
		session.put("contratos", listaContrato);
		return "ok";
	}
	
	@Action(value = "/listaContratoAtEstado", results = { @Result(type = "json", name="ok")})
	public String listaContratoAtEstado() {
		Usuario usu=new Usuario();
		usu=(Usuario)session.get("usuarioLogin");
		Contrato bean=new Contrato();
		System.out.println(usu.getIdusuario());
		System.out.println(estado);
		bean.setCodEmi(usu.getIdusuario());
		bean.setEstado(estado.toUpperCase());
		//System.out.println(cotizacion.getEstado()+" : "+cotizacion.getCodEmi());
		listaContrato=contratoService.listaContratoXUsuarioYEstados(bean);
		session.put("contratos", listaContrato);
		return "ok";
	}
	
	@Action(value = "/listaContratoAtUsuario", results = { @Result(type = "json", name="ok")})
	public String listaContratoAtUsuario() {
		Usuario usu=(Usuario)session.get("usuarioLogin");
		contrato.setIdEmisor(usu);
		listaContrato=contratoService.listaContrato();
		session.put("contratos", listaContrato);
		return "ok";
	}
	
	@Action(value = "/listaEquipoAtContrato", results = { @Result(type = "json", name="ok")})
	public String listaEquipoAtContrato() {		
		listaEquipo=new ArrayList<EquipoTrabajo>();
		listaEquipo=contratoService.listaEquipoAtContrato(codigo);
		session.put("detalleEquipo", listaEquipo);
		return "ok";
	}
	
	@SuppressWarnings("unchecked")
	@Action(value ="/registrarEquipoTrabajo",results = {@Result(name="ok",type = "redirect",location ="/asignarTrabajadores.jsp")})
	public String registrarEquipoTrabajo() {
		
		listaEquipo=(List<EquipoTrabajo>) session.get("detalleEquipo");		
		int i=contratoService.insertEquipoTrabajo(listaEquipo);
		if(i!=-1) {
			System.out.println("LLEGUE AQUI");
			session.put("CORRECTO", "Se registro correctamente el Contrato ");
			session.put("detalleEquipo",null);
		}else {
			session.put("ERROR", "Error en el proceso");
		}
		
		//session.put("CORRECTO", "Se registro correctamente la Cotizacion "+codCot);
		return "ok";
	}
	
	@SuppressWarnings("unchecked")
	@Action(value ="/registraContrato",results = {@Result(name="ok",type = "redirect",location ="/registraContrato.jsp")})
	public String registraContrato() {
		String codCon=contratoService.generaCodigo();
		Usuario emisor=(Usuario)session.get("usuarioLogin");
		System.out.println(codCon);
		System.out.println("1. ------->"+contrato.getFechaFinal());
		System.out.println("2. ------->"+fechaFinal);
		//System.out.println(codCot+":"+emisor.getIdusuario());
		listaEquipo=(List<EquipoTrabajo>) session.get("detalleEquipo");
		
		contrato.setIddocumento(codCon);
		contrato.setFechaFinal(fechaFinal);
		contrato.setCodEmi(emisor.getIdusuario());
		
		int i=contratoService.insertContrato(contrato,listaEquipo);
		if(i!=-1) {
			System.out.println("LLEGUE AQUI");
			session.put("CORRECTO", "Se registro correctamente el Contrato "+codCon);
			session.put("detalleEquipo",null);
			session.put("codigoContrato",codCon);
		}else {
			session.put("ERROR", "Error en el proceso");
		}
		
		//session.put("CORRECTO", "Se registro correctamente la Cotizacion "+codCot);
		return "ok";
	}
	
	
	/*
	@Action(value ="/modificaCliente",results = {@Result(location ="listaCliente",name="ok",type = "redirect")})
	public String updateCotizacion() {
		int i=cotizacionService.updateCotizacion(cotizacion);
		if(i!=-1) {
			session.put("CORRECTO", "Se modifico correctamente el cliente");
		}else {
			session.put("ERROR", "Error al modificar");
		}
		return "ok";
	}
	*/
	@Action(value = "/buscaContratoXCodigo",results = {@Result(name="ok",type="json")})
	public String buscaContratoXCodigo() {
		contrato=contratoService.findContrato(codigo);
		return "ok";
	}
	
	@Action(value ="/reporteContratoXCodigo",results = {@Result(name="ok",type = "jasper",
			params= {"location","/reportes/contrato.jasper","dataSource","listaContrato","format","PDF",})})
	public String reporteContratoXCodigo() {
		try {
			listaContrato=contratoService.listaContratoXCodigo(codigo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		//return subreporteContratoXCodigo();
		return "ok";
	}
	
	
	@SuppressWarnings("unchecked")
	@Action(value = "/agregarTrabajador",results = {@Result(name="ok",type="json")})
	public String agregarTrabajador() {
		System.out.println("Hola "+idtrabajador);
		Usuario usu=new Usuario();//Cargo car=new Cargo(); 
		if(session.get("detalleEquipo")==null) {
			listaEquipo=new ArrayList<EquipoTrabajo>();
			System.out.println("Es nuevo");
		}else
			listaEquipo=(List<EquipoTrabajo>) session.get("detalleEquipo");
		usu.setIdusuario(idtrabajador);
		usu.setNombre(nombre);
		usu.setApellidos(apellidos);
		usu.setEspecialidad(especialidad);
		EquipoTrabajo detalle=new EquipoTrabajo();
		if(codigo!=null)
		detalle.setIdcontrato(codigo);
		detalle.setTrabajador(usu);
		detalle.setIdtrabajador(idtrabajador);
		detalle.setCargo(cargo);
		boolean state=false;
		int i=0;
		for(EquipoTrabajo det:listaEquipo) {
			i++;		
			if(det.getIdtrabajador().equals(idtrabajador)) {
				state=true;
				break;
			}			
		}
		System.out.println(detalle.getTrabajador().getNombre()+detalle.getCargo()+detalle.getTrabajador().getEspecialidad());
		if(state==false)
			listaEquipo.add(detalle);
		else
			listaEquipo.set((i-1), detalle);
		session.put("detalleEquipo",listaEquipo);
		System.out.println("Salida con exito");
		return "ok";
	}
	
	@SuppressWarnings("unchecked")
	@Action(value = "/eliminaTrabajadorEquipo",results = {@Result(name="ok",type="json")})
	public String eliminaTrabajadorEquipo() {
		listaEquipo=(List<EquipoTrabajo>)session.get("detalleEquipo");
		for(EquipoTrabajo det:listaEquipo) {
			if(det.getIdtrabajador().equals(idtrabajador)) {
				listaEquipo.remove(det);
				break;
			}
		}
		//actualizar la clave "detalle"
		session.put("detalleEquipo", listaEquipo);
		return "ok";
	}
	
	@SuppressWarnings("unchecked")
	@Action(value = "/mostrarEquipoTrabajo",results = {@Result(name="ok",type="json")})
	public String mostrarDetalleCotizacion() {
		listaEquipo=(List<EquipoTrabajo>)session.get("detalleEquipo");
		session.put("detalleEquipo", listaEquipo);
		return "ok";
	}
	@Action(value = "/cancelarEquipoTrabajo",results = {@Result(name="ok",type="redirect",location="/registraContrato.jsp")})
	public String cancelarEquipoTrabajo() {
		listaEquipo=null;
		session.put("detalleEquipo", listaEquipo);
		return "ok";
	}

	public List<Contrato> getListaContrato() {
		return listaContrato;
	}


	public void setListaContrato(List<Contrato> listaContrato) {
		this.listaContrato = listaContrato;
	}


	public List<EquipoTrabajo> getListaEquipo() {
		return listaEquipo;
	}


	public void setListaEquipo(List<EquipoTrabajo> listaEquipo) {
		this.listaEquipo = listaEquipo;
	}


	public String getCodigo() {
		return codigo;
	}


	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}


	public String getIdtrabajador() {
		return idtrabajador;
	}


	public void setIdtrabajador(String idtrabajador) {
		this.idtrabajador = idtrabajador;
	}





	public String getFechaFinal() {
		return fechaFinal;
	}


	public void setFechaFinal(String fechaFinal) {
		this.fechaFinal = fechaFinal;
	}


	public String getNombre() {
		return nombre;
	}


	public void setNombre(String nombre) {
		this.nombre = nombre;
	}


	public String getApellidos() {
		return apellidos;
	}


	public void setApellidos(String apellidos) {
		this.apellidos = apellidos;
	}


	public String getEspecialidad() {
		return especialidad;
	}


	public void setEspecialidad(String especialidad) {
		this.especialidad = especialidad;
	}


	public String getCargo() {
		return cargo;
	}


	public void setCargo(String cargo) {
		this.cargo = cargo;
	}


	public String getEstado() {
		return estado;
	}


	public void setEstado(String estado) {
		this.estado = estado;
	}


	public Contrato getContrato() {
		return contrato;
	}


	public void setContrato(Contrato contrato) {
		this.contrato = contrato;
	}


	
	
}
