package net.ncdevice.entidad;

public class Provincia {
	private int idprovincia,idregion;
	private String nombre;
	private Region region;
	public int getIdprovincia() {
		return idprovincia;
	}
	public void setIdprovincia(int idprovincia) {
		this.idprovincia = idprovincia;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public Region getRegion() {
		return region;
	}
	public void setRegion(Region region) {
		this.region = region;
	}
	public int getIdregion() {
		return idregion;
	}
	public void setIdregion(int idregion) {
		this.idregion = idregion;
	}
	
}
