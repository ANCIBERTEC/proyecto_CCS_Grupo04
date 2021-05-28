package net.ncdevice.entidad;

public class DetalleCotizacion {
	private Cotizacion cotizacion;
	private Item item;
	private int cantidad;
	private double precio,precioTotal,subtotal,descuento,igv,monTotal;
	public Cotizacion getCotizacion() {
		return cotizacion;
	}
	public void setCotizacion(Cotizacion cotizacion) {
		this.cotizacion = cotizacion;
	}
	public Item getItem() {
		return item;
	}
	public void setItem(Item item) {
		this.item = item;
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
	public double getPrecioTotal() {
		precioTotal=cantidad*precio;
		return precioTotal;
	}
	public void setPrecioTotal(double precioTotal) {
		this.precioTotal = precioTotal;
	}
	public double getSubtotal() {
		//subtotal+=precioTotal;
		return subtotal;
		//return subtotal;
	}
	public void setSubtotal(double subtotal) {
		this.subtotal = subtotal;
	}
	public double getDescuento() {
		//descuento=subtotal*0.05;
		return descuento;
	}
	public void setDescuento(double descuento) {
		this.descuento = descuento;
	}
	public double getIgv() {
		//igv=subtotal*0.18;
		return igv;
	}
	public void setIgv(double igv) {
		this.igv = igv;
	}
	public double getMonTotal() {
		//monTotal=subtotal+igv-descuento;
		return monTotal;
	}
	public void setMonTotal(double monTotal) {
		this.monTotal = monTotal;
	}
	
}
