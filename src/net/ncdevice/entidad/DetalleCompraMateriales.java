package net.ncdevice.entidad;

public class DetalleCompraMateriales {
	private OrdenCompra compra;
	private int idmaterial;
	private String descripcion;
	private double precio;
	public OrdenCompra getCompra() {
		return compra;
	}
	public void setCompra(OrdenCompra compra) {
		this.compra = compra;
	}
	public int getIdmaterial() {
		return idmaterial;
	}
	public void setIdmaterial(int idmaterial) {
		this.idmaterial = idmaterial;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public double getPrecio() {
		return precio;
	}
	public void setPrecio(double precio) {
		this.precio = precio;
	}
	
}
