package net.ncdevice.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import net.ncdevice.entidad.Item;
import net.ncdevice.service.ItemService;

@SuppressWarnings("serial")
@ParentPackage("dawi")
public class ItemAction extends ActionSupport{
	private List<Item> listaItem;
	private int codigo;
	private String nombre,mensaje;
	private double preMin,preMax;
	private Item item;
	private Map<String, Object> session=ActionContext.getContext().getSession();
	
	private ItemService itemService;
	
	public ItemAction() {
		itemService=new ItemService();
	}
	
	
	
	@Action(value = "/listaAllItems", results = { @Result(name="ok",type = "json")})
	public String listaAllItems() {
		System.out.println("sss");
		listaItem=itemService.listaItem();
		//session.put("areas", listaArea);
		return "ok";
	}
	
	@Action(value = "/listaItemsAtName", results = { @Result(name="ok",type = "json")})
	public String listaItemsAtName() {
		listaItem=itemService.listaItemXName(nombre+"%");
		return "ok";
	}
	
	@Action(value = "/buscaItemxCodigo", results = { @Result(name="ok",type = "json")})
	public String buscaItemxCodigo() {
		item=itemService.buscarItemXID(codigo+"");
		return "ok";
	}
	
	@Action(value = "/registrarItemJson", results = { @Result(name="ok",type = "json")})
	public String registrarItemJson() {
		System.out.println(nombre+preMin+preMax);
		mensaje=null;
		Item item1=new Item();
		item1.setNombre(nombre);item1.setPrecioMin(preMin);item1.setPrecioMax(preMax);
		int i=itemService.nuevoItem(item1);
		if(i!=-1) {
			mensaje="Se registro correctamente un Item";
			session.put("MENSAJE", "Se registro correctamente un Item");
			System.out.println("Registro Correcto");
		}else {
			mensaje="Error en el proceso";
			session.put("MENSAJE", "Error al registrar");
		}	
		return "ok";
	}
	
	@Action(value ="/registrarItem",results = {@Result(location ="/listaItem.jsp",name="ok",type = "redirect")})
	public String registrarItem() {
		if(item.getIditem()==0) {
			int i=itemService.nuevoItem(item);
			if(i!=-1) {
				session.put("CORRECTO", "Se registro correctamente un Item");
				System.out.println("Registro Correcto");
			}else {
				session.put("ERROR", "Error al registrar");
			}	
		}else {
			int i=itemService.modificaItem(item);
			if(i!=-1) {
				session.put("CORRECTO", "Se modifico correctamente el Item");
			}else {
				session.put("ERROR", "Error al modificar");
			}	
		}
		return "ok";
	}
	
	@Action(value = "/eliminaItem",results = {@Result(location = "/listaItem.jsp",name = "ok",type = "redirect")})
	public String eliminaItem() {
		int i=itemService.eliminaItem(codigo);
		if(i!=-1) {
			session.put("CORRECTO", "Se elimino correctamente el Item");
		}else {
			session.put("ERROR", "Error al eliminar");
		}
		return "ok";
	}



	public double getPreMin() {
		return preMin;
	}



	public void setPreMin(double preMin) {
		this.preMin = preMin;
	}



	public double getPreMax() {
		return preMax;
	}



	public void setPreMax(double preMax) {
		this.preMax = preMax;
	}



	public List<Item> getListaItem() {
		return listaItem;
	}



	public void setListaItem(List<Item> listaItem) {
		this.listaItem = listaItem;
	}



	public int getCodigo() {
		return codigo;
	}



	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}



	public String getNombre() {
		return nombre;
	}



	public void setNombre(String nombre) {
		this.nombre = nombre;
	}



	public Item getItem() {
		return item;
	}



	public void setItem(Item item) {
		this.item = item;
	}



	public String getMensaje() {
		return mensaje;
	}



	public void setMensaje(String mensaje) {
		this.mensaje = mensaje;
	}
	
	
}
