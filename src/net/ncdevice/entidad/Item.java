package net.ncdevice.entidad;

public class Item {
	private int iditem;
	private String nombre;
	private double precioMin,precioMax;
	public int getIditem() {
		return iditem;
	}
	public void setIditem(int iditem) {
		this.iditem = iditem;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public double getPrecioMin() {
		return precioMin;
	}
	public void setPrecioMin(double precioMin) {
		this.precioMin = precioMin;
	}
	public double getPrecioMax() {
		return precioMax;
	}
	public void setPrecioMax(double precioMax) {
		this.precioMax = precioMax;
	}
}
