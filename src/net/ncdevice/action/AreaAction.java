package net.ncdevice.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import net.ncdevice.entidad.Area;
import net.ncdevice.service.AreaService;

@SuppressWarnings("serial")
@ParentPackage("dawi")
public class AreaAction extends ActionSupport{
	private List<Area> listaArea;
	private int codigo;
	private Area area;
	private Map<String, Object> session=ActionContext.getContext().getSession();
	
	private AreaService areaService;
	
	public AreaAction() {
		areaService=new AreaService();
	}
	
	
	@Action(value = "/listaArea", results = { @Result(location = "/listaArea.jsp", name="ok")})
	public String listaArea() {
		System.out.println("sss");
		listaArea=areaService.listaArea();
		session.put("AREAS", listaArea);
		return "ok";
	}
	
	@Action(value = "/listaAreaJson", results = { @Result(name="ok",type = "json")})
	public String listaAreaJson() {
		System.out.println("sss");
		listaArea=areaService.listaArea();
		//session.put("areas", listaArea);
		return "ok";
	}
	
	@Action(value = "/buscaAreaXCodigo", results = { @Result(name="ok",type = "json")})
	public String buscaAreaXCodigo() {
		area=areaService.buscarAreaXID(codigo);
		return "ok";
	}
	
	
	
	@Action(value ="/mantenerArea",results = {@Result(location ="listaArea",name="ok",type = "redirect")})
	public String mantenerArea() {
		if(area.getIdarea()==0) {
			int i=areaService.nuevoArea(area);
			if(i!=-1) {
				session.put("CORRECTO", "Se registro correctamente");
				System.out.println("Registro Correcto");
			}else {
				session.put("ERROR", "Error al registrar");
			}	
		}else {
			int i=areaService.modificaArea(area);
			if(i!=-1) {
				session.put("CORRECTO", "Se modifico correctamente el area");
			}else {
				session.put("ERROR", "Error al modificar");
			}	
		}
		return "ok";
	}
	
	@Action(value = "/eliminaArea",results = {@Result(location = "listaArea",name = "ok",type = "redirect")})
	public String eliminaArea() {
		int i=areaService.eliminaArea(codigo);
		if(i!=-1) {
			session.put("CORRECTO", "Se elimino correctamente el area");
		}else {
			session.put("ERROR", "Error al eliminar. Asegurese que nadie dependa del Area.");
		}
		return "ok";
	}
	
	
	public Area getArea() {
		return area;
	}

	public void setArea(Area area) {
		this.area = area;
	}

	public List<Area> getListaArea() {
		return listaArea;
	}
	public void setListaArea(List<Area> listaArea) {
		this.listaArea = listaArea;
	}
	public int getCodigo() {
		return codigo;
	}
	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}
	
}
