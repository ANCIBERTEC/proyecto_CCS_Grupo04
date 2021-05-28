package net.ncdevice.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import net.ncdevice.entidad.Cotizacion;
import net.ncdevice.entidad.DetalleCotizacion;
import net.ncdevice.entidad.Item;
import net.ncdevice.entidad.Usuario;
import net.ncdevice.service.CotizacionService;

@SuppressWarnings("serial")
@ParentPackage("dawi")
public class CotizacionAction extends ActionSupport{
	private List<Cotizacion> listaCotizacion;
	private List<Item> listaItem;
	private List<DetalleCotizacion> listaDetalle;
	private String codigo,nombre,estado;
	private int codItem,cantidad;
	private double precio,preTotal,igv,desc,montoTotal,subtotal;
	private Cotizacion cotizacion;
	
	private Map<String, Object> session=ActionContext.getContext().getSession();
	
	private CotizacionService cotizacionService;
	
	public CotizacionAction() {
		cotizacionService=new CotizacionService();
	}
	
	
	@Action(value = "/listaCotizacion", results = { @Result(type = "json", name="ok")})
	public String listaCotizacion() {
		listaCotizacion=cotizacionService.listaCotizacion();
		session.put("COTIZACION", listaCotizacion);
		return "ok";
	}
	
	@Action(value = "/listaCotizacionAtEstado", results = { @Result(type = "json", name="ok")})
	public String listaCotizacionAtEstado() {
		Usuario usu=new Usuario();
		usu=(Usuario)session.get("usuarioLogin");
		Cotizacion bean=new Cotizacion();
		System.out.println(usu.getIdusuario());
		System.out.println(estado);
		bean.setCodEmi(usu.getIdusuario());
		bean.setEstado(estado.toUpperCase());
		//System.out.println(cotizacion.getEstado()+" : "+cotizacion.getCodEmi());
		listaCotizacion=cotizacionService.listaCotizacionXUsuarioYEstados(bean);
		session.put("cotizaciones", listaCotizacion);
		return "ok";
	}
	
	@Action(value = "/listaCotizacionAtUsuario", results = { @Result(type = "json", name="ok")})
	public String listaCotizacionAtUsuario() {
		Usuario usu=(Usuario)session.get("usuarioLogin");
		cotizacion.setIdEmisor(usu);
		listaCotizacion=cotizacionService.listaCotizacionXUsuario(usu.getIdusuario());
		session.put("cotizaciones", listaCotizacion);
		return "ok";
	}
	
	@Action(value ="/apruebaCotizacion",results = {@Result(name="ok",type = "redirect",location ="/apruebaCotizacion.jsp")})
	public String apruebaCotizacion() {
		Usuario usu=(Usuario)session.get("usuarioLogin");
		cotizacion.setIdEmisor(usu);
		//cotizacion.setEstado("Aprobado");
		cotizacion.setIdvisita(0);
		int i=cotizacionService.updateCotizacion(cotizacion);
		if(i!=-1) {
			session.put("CORRECTO", "Se Aprobó la Cotizacion");
		}else {
			session.put("ERROR", "Error en el procesor");
		}
		return "ok";
	}
	
	@SuppressWarnings("unchecked")
	@Action(value ="/actualizaDetalleCotizacion",results = {@Result(name="ok",type = "redirect",location ="/registraCotizacion.jsp")})
	public String actualizaDetalleCotizacion() {
		//String codCot=cotizacionService.generaCodigo();
		Usuario emisor=(Usuario)session.get("usuarioLogin");
		//System.out.println(codCot+":"+emisor.getIdusuario());
		double sub=0,des=0,igv1=0,mon=0;
		listaDetalle=(List<DetalleCotizacion>) session.get("detalleCotizacion");
		cotizacion.setEstado("PENDIENTE");
		cotizacion.setIdEmisor(emisor);
		System.out.println(cotizacion.getIddocumento()+":"+cotizacion.getIdvisita());
		String cod=cotizacion.getIddocumento();
		int in=0;
		for(DetalleCotizacion det:listaDetalle) {
			sub=sub+det.getPrecioTotal();des=sub*0.05;
			igv1=sub*0.18;mon=sub+igv1-des;
			System.out.println(det.getItem().getIditem());
			det.setSubtotal(sub);det.setDescuento(des);det.setIgv(igv1);det.setMonTotal(mon);
			cotizacion.setDetalleCotizacion(det);
			listaDetalle.set(in, cotizacion.getDetalleCotizacion());
			in++;
		}
		//listaDetalle=cotizacion.getDetalle();
		//cotizacion.setDetalle(listaDetalle);
		
		int i=cotizacionService.actualizaDetalleCotizacion(cotizacion,listaDetalle);
		if(i!=-1) {
			System.out.println("LLEGUE AQUI");
			session.put("CORRECTO", "Se actualizo correctamente la Cotizacion ");
			session.put("detalleCotizacion",null);
			session.put("codigoCotizacion",cod);
		}else {
			session.put("ERROR", "Error en el proceso");
		}
		//session.put("CORRECTO", "Se registro correctamente la Cotizacion "+codCot);
		return "ok";
	}
	
	
	@SuppressWarnings("unchecked")
	@Action(value ="/registraCotizacion",results = {@Result(name="ok",type = "redirect",location ="/registraCotizacion.jsp")})
	public String registraCotizacion() {
		String codCot=cotizacionService.generaCodigo();
		Usuario emisor=(Usuario)session.get("usuarioLogin");
		System.out.println(codCot+":"+emisor.getIdusuario());
		double sub=0,des=0,igv1=0,mon=0;
		listaDetalle=(List<DetalleCotizacion>) session.get("detalleCotizacion");
		cotizacion.setIddocumento(codCot);
		cotizacion.setIdEmisor(emisor);
		int in=0;
		for(DetalleCotizacion det:listaDetalle) {
			sub=sub+det.getPrecioTotal();des=sub*0.05;
			igv1=sub*0.18;mon=sub+igv1-des;
			System.out.println(det.getItem().getIditem());
			det.setSubtotal(sub);det.setDescuento(des);det.setIgv(igv1);det.setMonTotal(mon);
			cotizacion.setDetalleCotizacion(det);
			listaDetalle.set(in, cotizacion.getDetalleCotizacion());
			in++;
		}
		//listaDetalle=cotizacion.getDetalle();
		cotizacion.setDetalle(listaDetalle);
		
		int i=cotizacionService.insertCotizacion(cotizacion);
		if(i!=-1) {
			System.out.println("LLEGUE AQUI");
			session.put("CORRECTO", "Se registro correctamente la Cotizacion "+codCot);
			session.put("detalleCotizacion",null);
			session.put("codigoCotizacion",codCot);
		}else {
			session.put("ERROR", "Error en el proceso");
		}
		//session.put("CORRECTO", "Se registro correctamente la Cotizacion "+codCot);
		return "ok";
	}
	
	@Action(value ="/reporteCotizaciones",results = {@Result(name="ok",type = "jasper",
								params= {"location","/reportes/reporteCotizaciones.jasper","dataSource","listaCotizacion","format","PDF",})})
	public String reporteCotizaciones() {
		
		try {
			listaCotizacion=cotizacionService.listaCotizacion();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "ok";
	}
	
	@Action(value ="/reporteCotizacionXCodigo",results = {@Result(name="ok",type = "jasper",
			params= {"location","/reportes/cotizacion.jasper","dataSource","listaDetalle","format","PDF",})})
	public String reporteCotizacionXCodigo() {
		try {
			listaDetalle=cotizacionService.listaDetalleCotizacion(codigo);
		} catch (Exception e) {
			e.printStackTrace();
		}
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
	@Action(value = "/buscaCotizacionXCodigo",results = {@Result(name="ok",type="json")})
	public String findCotizacionXCodigo() {
		cotizacion=cotizacionService.findCotizacionXCodigo(codigo);
		return "ok";
	}
	@SuppressWarnings("unchecked")
	@Action(value = "/agregarItemCotizacion",results = {@Result(name="ok",type="json")})
	public String agregarMedicamento() {
		//SessionMap sessionActual= (SessionMap)ActionContext.getContext().getSession();
		//validar si exite la clase detalle dentro de una session
		//double sub=0,des=0,igv1=0,mon=0;
		if(session.get("detalleCotizacion")==null) {
			listaDetalle=new ArrayList<DetalleCotizacion>();
		}else
			listaDetalle=(List<DetalleCotizacion>) session.get("detalleCotizacion");
		DetalleCotizacion detalle=new DetalleCotizacion();
		Item objI=new Item();
		objI.setIditem(codItem);
		objI.setNombre(nombre);
		detalle.setItem(objI);
		detalle.setCantidad(cantidad);
		detalle.setPrecio(precio);
		//subtotal+=detalle.getPrecioTotal();
		/*sub+=detalle.getPrecioTotal();
		des=sub*0.05;
		igv1=sub*0.18;
		mon=sub+igv-des;
		detalle.setSubtotal(sub);
		detalle.setDescuento(des);
		detalle.setIgv(igv1);
		detalle.setMonTotal(mon);*/
		//validar si exite codigo
		boolean estado=false;
		int i=0;
		for(DetalleCotizacion det:listaDetalle) {
			i++;
			//subtotal=det.getSubtotal()+detalle.getPrecioTotal();			
			if(det.getItem().getIditem()==codItem) {
				estado=true;
				break;
			}			
		}
		//detalle.setSubtotal(subtotal);
		
		System.out.println("GOOD"+detalle.getItem().getIditem()+detalle.getItem().getNombre()+detalle.getCantidad()+detalle.getPrecio());
		if(estado==false)
			listaDetalle.add(detalle);
		else
			listaDetalle.set((i-1), detalle);
		session.put("detalleCotizacion",listaDetalle);
		
		return "ok";
	}
	
	@SuppressWarnings("unchecked")
	@Action(value = "/eliminarItemCotizacion",results = {@Result(name="ok",type="json")})
	public String eliminarItemCotizacion() {
		listaDetalle=(List<DetalleCotizacion>)session.get("detalleCotizacion");
		for(DetalleCotizacion det:listaDetalle) {
			if(det.getItem().getIditem()==codItem) {
				listaDetalle.remove(det);
				break;
			}
		}
		//actualizar la clave "detalle"
		session.put("detalle", listaDetalle);
		return "ok";
	}

	@Action(value = "/listaDetalleCotizacionAtCodigo",results = {@Result(name="ok",type="json")})
	public String listaDetalleCotizacionAtCodigo() {
		listaDetalle=new ArrayList<DetalleCotizacion>();
		listaDetalle=cotizacionService.listaDetalleCotizacion(codigo);
		session.put("detalleCotizacion", listaDetalle);
		return "ok";
	}
	@Action(value ="/cancelarCotizacion",results = {@Result(name="ok",type = "redirect",location ="/registraCotizacion.jsp")})
	public String cancelarCotizacion() {
		listaDetalle=null;
		session.put("detalleCotizacion", listaDetalle);
		return "ok";
	}
	@Action(value ="/cancelarActualizaCotizacion",results = {@Result(name="ok",type = "redirect",location ="/actualizaCotizacion.jsp")})
	public String cancelarActualizaCotizacion() {
		listaDetalle=null;
		session.put("detalleCotizacion", listaDetalle);
		return "ok";
	}
	@SuppressWarnings("unchecked")
	@Action(value = "/mostrarDetalleCotizacion",results = {@Result(name="ok",type="json")})
	public String mostrarDetalleCotizacion() {
		listaDetalle=(List<DetalleCotizacion>)session.get("detalleCotizacion");
		session.put("detalleCotizacion", listaDetalle);
		return "ok";
	}

	public String getCodigo() {
		return codigo;
	}


	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}


	public List<Item> getListaItem() {
		return listaItem;
	}


	public void setListaItem(List<Item> listaItem) {
		this.listaItem = listaItem;
	}


	public List<DetalleCotizacion> getListaDetalle() {
		return listaDetalle;
	}


	public void setListaDetalle(List<DetalleCotizacion> listaDetalle) {
		this.listaDetalle = listaDetalle;
	}


	public List<Cotizacion> getListaCotizacion() {
		return listaCotizacion;
	}


	public void setListaCotizacion(List<Cotizacion> listaCotizacion) {
		this.listaCotizacion = listaCotizacion;
	}


	public String getNombre() {
		return nombre;
	}


	public void setNombre(String nombre) {
		this.nombre = nombre;
	}


	public String getEstado() {
		return estado;
	}


	public void setEstado(String estado) {
		this.estado = estado;
	}


	public int getCodItem() {
		return codItem;
	}


	public void setCodItem(int codItem) {
		this.codItem = codItem;
	}



	public int getCantidad() {
		return cantidad;
	}


	public void setCantidad(int cantidad) {
		this.cantidad = cantidad;
	}


	public double getPrecio() {
		return precio;
	}


	public void setPrecio(double precio) {
		this.precio = precio;
	}


	public double getPreTotal() {
		return preTotal;
	}


	public void setPreTotal(double preTotal) {
		this.preTotal = preTotal;
	}


	public double getIgv() {
		return igv;
	}


	public void setIgv(double igv) {
		this.igv = igv;
	}


	public double getDesc() {
		return desc;
	}


	public void setDesc(double desc) {
		this.desc = desc;
	}


	public double getMontoTotal() {
		return montoTotal;
	}


	public void setMontoTotal(double montoTotal) {
		this.montoTotal = montoTotal;
	}


	public Cotizacion getCotizacion() {
		return cotizacion;
	}


	public void setCotizacion(Cotizacion cotizacion) {
		this.cotizacion = cotizacion;
	}


	public double getSubtotal() {
		return subtotal;
	}


	public void setSubtotal(double subtotal) {
		this.subtotal = subtotal;
	}



	
	
}
