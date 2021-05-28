package net.ncdevice.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import net.ncdevice.entidad.Proveedor;
import net.ncdevice.service.ProveedorService;

@SuppressWarnings("serial")
@ParentPackage("dawi")
public class ProveedorAction extends ActionSupport{
	private List<Proveedor> listaProveedor;
	private int codigo;
	private Proveedor proveedor;
	private Map<String, Object> session=ActionContext.getContext().getSession();
	
	private ProveedorService proveedorService;
	
	public ProveedorAction() {
		proveedorService=new ProveedorService();
	}
	
	
	@Action(value = "/listaProveedor", results = { @Result(location = "/listaProveedor.jsp", name="ok")})
	public String listaAllProveedor() {
		System.out.println("sss");
		listaProveedor=proveedorService.listaProveedor();
		session.put("PROVEEDORES",listaProveedor);
		return "ok";
	}
	
	@Action(value = "/listaProveedorJson", results = { @Result(type="json", name="ok")})
	public String listaProveedorJson() {
		System.out.println("sss");
		listaProveedor=proveedorService.listaProveedor();
		session.put("proveedores",listaProveedor);
		return "ok";
	}
	/*
	@Action(value = "/listaAreaJson", results = { @Result(name="ok",type = "json")})
	public String listaAreaJson() {
		System.out.println("sss");
		listaProveedor=proveedorService.listaProveedor();
		//session.put("areas", listaArea);
		return "ok";
	}
	*/
	@Action(value = "/buscaProveedorXCodigo", results = { @Result(name="ok",type = "json")})
	public String buscaProveedorXCodigo() {
		proveedor=proveedorService.buscarProveedorXID(codigo);
		return "ok";
	}
	
	
	@Action(value ="/mantenerProveedor",results = {@Result(location ="listaProveedor",name="ok",type = "redirect")})
	public String mantenerProveedor() {
		System.out.println("HOLA"+proveedor.getNombreContacto());
		int i=proveedorService.manteProveedor(proveedor);
		if(i!=-1) {
			if(proveedor.getIdproveedor()==0) {
				session.put("CORRECTO", "Se registro correctamente un nuevo proveedor");
			}else {
				session.put("CORRECTO", "Se modifico correctamente el proveedor");
			}
		}else {
			session.put("ERROR", "Error en el proceso");
		}
		
		return "ok";
	}
	
	@Action(value = "/eliminaProveedor",results = {@Result(location = "listaProveedor",name = "ok",type = "redirect")})
	public String eliminaProveedor() {
		int i=proveedorService.eliminaProveedor(codigo);
		if(i!=-1) {
			session.put("CORRECTO", "Se elimino correctamente el proveedor");
		}else {
			session.put("ERROR", "Error al modificar");
		}
		return "ok";
	}


	public List<Proveedor> getListaProveedor() {
		return listaProveedor;
	}


	public void setListaProveedor(List<Proveedor> listaProveedor) {
		this.listaProveedor = listaProveedor;
	}


	public int getCodigo() {
		return codigo;
	}


	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}


	public Proveedor getProveedor() {
		return proveedor;
	}


	public void setProveedor(Proveedor proveedor) {
		this.proveedor = proveedor;
	}

	
	
}
