package net.ncdevice.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import net.ncdevice.entidad.Cargo;
import net.ncdevice.entidad.Menu;
import net.ncdevice.service.CargoService;
import net.ncdevice.service.UsuarioService;

@SuppressWarnings("serial")
@ParentPackage("dawi")
public class CargoAction extends ActionSupport{
	private List<Cargo> listaCargo;
	private List<Menu> listaMenu;
	private String tipo;
	private int codigo;
	private Cargo cargo;
	private Map<String, Object> session=ActionContext.getContext().getSession();
	
	private CargoService cargoService;
	
	public CargoAction() {
		cargoService=new CargoService();
	}
	
	
	@Action(value = "/listaCargo", results = { @Result(location = "/listaCargo.jsp", name="ok")})
	public String listaCargo() {
		System.out.println("sss");
		listaCargo=cargoService.listaCargo();
		session.put("CARGOS", listaCargo);
		return "ok";
	}
	
	@Action(value = "/listaCargoJson", results = { @Result(name="ok",type = "json")})
	public String listaCargoJson() {
		System.out.println("sss");
		listaCargo=cargoService.listaCargo();
		//session.put("areas", listaArea);
		return "ok";
	}
	
	@SuppressWarnings("unchecked")
	@Action(value = "/listaPermisosAtTipo", results = { @Result(name="ok",type = "json")})
	public String listaPermisosAtTipo() {
		UsuarioService us=new UsuarioService();
		List<Menu> lms=(List<Menu>)session.get("usuarioEnlaces");
		List<Menu> lm= us.listarMenuAtTipo(tipo);
		listaMenu=new ArrayList<Menu>();
		Menu m=null;
		for(Menu ms:lms) {
			if(ms.getTipo().equals(tipo)) {
				for(Menu mp:lm) {
					m=new Menu();
					m.setIdmenu(ms.getIdmenu());m.setDescripcion(ms.getDescripcion());
					if(mp.getIdmenu()==ms.getIdmenu()) {
						m.setTipo(1+"");
						listaMenu.add(m);
					}
				}				
			}
		}
		
		
		session.put("listaMenu", listaMenu);
		return "ok";
	}
	
	@Action(value = "/listaEspecialidades", results = { @Result(name="ok",type = "json")})
	public String listaEspecialidades() {
		//System.out.println("sss");
		listaCargo=cargoService.listaEspecialidades();
		//session.put("areas", listaArea);
		
		return "ok";
	}
	
	@Action(value = "/listaCargoXArea", results = { @Result(name="ok",type = "json")})
	public String listaCargoXArea() {
		System.out.println("sss");
		listaCargo=cargoService.findCargoXArea(codigo);		//session.put("areas", listaArea);
		return "ok";
	}
	
	@Action(value = "/buscaCargoXCodigo", results = { @Result(name="ok",type = "json")})
	public String buscaCargoXCodigo() {
		cargo=cargoService.findCargoXID(codigo);
		return "ok";
	}
	
	
	
	@Action(value ="/mantenerCargo",results = {@Result(location ="listaCargo",name="ok",type = "redirect")})
	public String mantenerCargo() {

		System.out.println("HOLA"+cargo.getDescripcion());
		int i=cargoService.mantenerCargo(cargo);
		if(i!=-1) {
			if(cargo.getIdcargo()==0) {
				session.put("CORRECTO", "Se registro correctamente el cargo");
			}else {
				session.put("CORRECTO", "Se modifico correctamente el cargo");
			}
		}else {
			session.put("ERROR", "Error en el proceso");
		}
		
		return "ok";
	}
	
	@Action(value = "/eliminaCargo",results = {@Result(location = "listaCargo",name = "ok",type = "redirect")})
	public String eliminaCargo() {
		int i=cargoService.eliminaCargo(codigo);
		if(i!=-1) {
			session.put("CORRECTO", "Se elimino correctamente el cargo "+codigo);
		}else {
			session.put("ERROR", "Error al eliminar. Asegurese que ningun trabajador tenga este cargo.");
		}
		return "ok";
	}


	public List<Cargo> getListaCargo() {
		return listaCargo;
	}


	public void setListaCargo(List<Cargo> listaCargo) {
		this.listaCargo = listaCargo;
	}


	public int getCodigo() {
		return codigo;
	}


	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}


	public Cargo getCargo() {
		return cargo;
	}


	public void setCargo(Cargo cargo) {
		this.cargo = cargo;
	}


	public List<Menu> getListaMenu() {
		return listaMenu;
	}


	public void setListaMenu(List<Menu> listaMenu) {
		this.listaMenu = listaMenu;
	}


	public String getTipo() {
		return tipo;
	}


	public void setTipo(String tipo) {
		this.tipo = tipo;
	}
	
	
	
}
