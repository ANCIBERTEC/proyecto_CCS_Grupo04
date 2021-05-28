package net.ncdevice.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import net.ncdevice.entidad.ActaEntrega;
import net.ncdevice.entidad.Usuario;
import net.ncdevice.service.ActaEntregaService;

@SuppressWarnings("serial")
@ParentPackage("dawi")
public class ActaEntregaAction extends ActionSupport{
	private List<ActaEntrega> listaActa;
	private String codigo;
	private ActaEntrega acta;
	private Map<String, Object> session=ActionContext.getContext().getSession();
	
	private ActaEntregaService actaEntregaService;
	
	public ActaEntregaAction() {
		actaEntregaService=new ActaEntregaService();
	}
	
	/*
	
	@Action(value = "/listaCargo", results = { @Result(location = "/listaCargo.jsp", name="ok")})
	public String listaCargo() {
		System.out.println("sss");
		listaActa=actaEntregaService.listaActaEntrega();
		session.put("actas", listaActa);
		return "ok";
	}
	
	@Action(value = "/listaCargoJson", results = { @Result(name="ok",type = "json")})
	public String listaCargoJson() {
		System.out.println("sss");
		listaActa=actaEntregaService.listaActaEntrega();
		//session.put("areas", listaArea);
		return "ok";
	}
	
	@Action(value = "/buscaCargoXCodigo", results = { @Result(name="ok",type = "json")})
	public String buscaCargoXCodigo() {
		acta=actaEntregaService.findActaEntrega(codigo);
		return "ok";
	}
	
	*/
	
	@Action(value ="/reporteActaXCodigo",results = {@Result(name="ok",type = "jasper",
			params= {"location","/reportes/actaEntrega.jasper","dataSource","acta","format","PDF",})})
	public String reporteActaXCodigo() {
		try {
			acta=actaEntregaService.findActaEntrega(codigo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		//return subreporteContratoXCodigo();
		return "ok";
	}
	
	
	@Action(value ="/registraActaEntrega",results = {@Result(location ="registraActaEntrega.jsp",name="ok",type = "redirect")})
	public String registraActaEntrega() {
		String cod=actaEntregaService.generaCodigo();
		Usuario usu=new Usuario();
		usu=(Usuario)session.get("usuarioLogin");
		acta.setIddocumento(cod);
		acta.setCodEmi(usu.getIdusuario());
		int i=actaEntregaService.insertActaEntrega(acta);
		if(i!=-1) {
				session.put("CORRECTO", "Se registro correctamente el Acta de Entrega N°"+cod);
				session.put("codigoActa",cod);
		}else {
			session.put("ERROR", "Error en el proceso");
		}
		
		return "ok";
	}



	public List<ActaEntrega> getListaActa() {
		return listaActa;
	}


	public void setListaActa(List<ActaEntrega> listaActa) {
		this.listaActa = listaActa;
	}


	public String getCodigo() {
		return codigo;
	}


	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}


	public ActaEntrega getActa() {
		return acta;
	}


	public void setActa(ActaEntrega acta) {
		this.acta = acta;
	}


	
}
