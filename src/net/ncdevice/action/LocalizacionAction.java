package net.ncdevice.action;

import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;

import com.opensymphony.xwork2.ActionSupport;

import net.ncdevice.entidad.Distrito;
import net.ncdevice.entidad.Provincia;
import net.ncdevice.entidad.Region;
import net.ncdevice.service.LocalizacionService;

@SuppressWarnings("serial")
@ParentPackage("dawi")
public class LocalizacionAction extends ActionSupport{
	private List<Region> listaRegion;
	private List<Provincia> listaProvincia;
	private List<Distrito> listaDistrito;
	private int codigo;
	//private Map<String, Object> session=ActionContext.getContext().getSession();
	
	private LocalizacionService localService;
	
	public LocalizacionAction() {
		localService=new LocalizacionService();
	}
	
	
	@Action(value = "/listaAllRegion", results = { @Result(name="ok",type = "json")})
	public String listaAllRegion() {
		listaRegion=localService.listaRegion();
		return "ok";
	}

	@Action(value = "/listaProvXRegion", results = { @Result(name="ok",type = "json")})
	public String listaProvXRegion() {
		listaProvincia=localService.listaProvXRegion(codigo);
		return "ok";
	}

	@Action(value = "/listaDistritoXProv", results = { @Result(name="ok",type = "json")})
	public String listaDistritoXProv() {
		listaDistrito=localService.listaDistritoXProvincia(codigo);
		return "ok";
	}


	public List<Region> getListaRegion() {
		return listaRegion;
	}


	public void setListaRegion(List<Region> listaRegion) {
		this.listaRegion = listaRegion;
	}


	public List<Provincia> getListaProvincia() {
		return listaProvincia;
	}


	public void setListaProvincia(List<Provincia> listaProvincia) {
		this.listaProvincia = listaProvincia;
	}


	public List<Distrito> getListaDistrito() {
		return listaDistrito;
	}


	public void setListaDistrito(List<Distrito> listaDistrito) {
		this.listaDistrito = listaDistrito;
	}


	public int getCodigo() {
		return codigo;
	}


	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}

	
	
	
	
}
