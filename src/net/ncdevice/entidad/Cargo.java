package net.ncdevice.entidad;

public class Cargo {
	private int idcargo;
	private String descripcion;
	private int idarea;
	private Area area;
	public int getIdarea() {
		return idarea;
	}
	public void setIdarea(int idarea) {
		this.idarea = idarea;
	}
	public int getIdcargo() {
		return idcargo;
	}
	public void setIdcargo(int idcargo) {
		this.idcargo = idcargo;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public Area getArea() {
		return area;
	}
	public void setArea(Area area) {
		this.area = area;
	}
	
}
