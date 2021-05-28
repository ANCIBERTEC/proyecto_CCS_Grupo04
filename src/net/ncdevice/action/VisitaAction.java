package net.ncdevice.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import net.ncdevice.entidad.VisitaTecnica;
import net.ncdevice.service.VisitaTecnicaService;

@SuppressWarnings("serial")
@ParentPackage("dawi")
public class VisitaAction extends ActionSupport{
	private List<VisitaTecnica> listaVisita;
	private int codigo;
	private VisitaTecnica visita;
	private Map<String, Object> session=ActionContext.getContext().getSession();
	
	private VisitaTecnicaService visitaService;
	
	public VisitaAction() {
		visitaService=new VisitaTecnicaService();
	}
	
	
	@Action(value = "/listaVisita", results = { @Result(name="ok",type = "json")})
	public String listaVisita() {
		System.out.println("sss");
		listaVisita=visitaService.listaVisitaTecnica();
		session.put("visita", listaVisita);
		return "ok";
	}
	
	
	
	
	@Action(value ="/registraVisitaTecnica",results = {@Result(location ="/registraVisita.jsp",name="ok",type = "redirect")})
	public String registraVisitaTecnica() {
		int i=visitaService.insertVisitaTecnica(visita);
		if(i!=-1) {
			session.put("CORRECTO", "Se registro correctamente la Visita");
			System.out.println("Registro Correcto");
		}else {
			session.put("ERROR", "Error al registrar");
		}
		return "ok";
	}
	
	@Action(value = "/eliminaVisita",results = {@Result(location = "/registraVisita.jsp",name = "ok",type = "redirect")})
	public String eliminaVisita() {
		int i=visitaService.deleteVisitaTecnica(codigo+"");
		if(i!=-1) {
			session.put("CORRECTO", "Se elimino correctamente el area");
		}else {
			session.put("ERROR", "Error al eliminar. Asegurese que nadie dependa del Area.");
		}
		return "ok";
	}


	public List<VisitaTecnica> getListaVisita() {
		return listaVisita;
	}


	public void setListaVisita(List<VisitaTecnica> listaVisita) {
		this.listaVisita = listaVisita;
	}


	public int getCodigo() {
		return codigo;
	}


	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}


	public VisitaTecnica getVisita() {
		return visita;
	}


	public void setVisita(VisitaTecnica visita) {
		this.visita = visita;
	}
	
	
}
