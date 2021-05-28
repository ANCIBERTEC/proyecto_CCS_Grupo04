package net.ncdevice.entidad;

public class Distrito {
	private int iddistrito,idprovincia;
	private String nombre;
	private Provincia provincia;
	
	public int getIdprovincia() {
		return idprovincia;
	}
	public void setIdprovincia(int idprovincia) {
		this.idprovincia = idprovincia;
	}
	public Provincia getProvincia() {
		return provincia;
	}
	public void setProvincia(Provincia provincia) {
		this.provincia = provincia;
	}
	public int getIddistrito() {
		return iddistrito;
	}
	public void setIddistrito(int iddistrito) {
		this.iddistrito = iddistrito;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

}
