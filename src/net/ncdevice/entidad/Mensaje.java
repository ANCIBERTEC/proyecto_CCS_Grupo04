package net.ncdevice.entidad;

public class Mensaje {
	private int idmensaje;
	private String contenido,fechaRegistro,estado,asunto,codEmi,codRec;
	private Usuario idEmisor, idReceptor;
	
	
	
	public int getIdmensaje() {
		return idmensaje;
	}
	public void setIdmensaje(int idmensaje) {
		this.idmensaje = idmensaje;
	}
	public String getCodEmi() {
		return codEmi;
	}
	public void setCodEmi(String codEmi) {
		this.codEmi = codEmi;
	}
	public String getCodRec() {
		return codRec;
	}
	public void setCodRec(String codRec) {
		this.codRec = codRec;
	}
	public String getAsunto() {
		return asunto;
	}
	public void setAsunto(String asunto) {
		this.asunto = asunto;
	}
	
	public String getContenido() {
		return contenido;
	}
	public void setContenido(String contenido) {
		this.contenido = contenido;
	}
	public String getFechaRegistro() {
		return fechaRegistro;
	}
	public void setFechaRegistro(String fechaRegistro) {
		this.fechaRegistro = fechaRegistro;
	}
	public String getEstado() {
		return estado;
	}
	public void setEstado(String estado) {
		this.estado = estado;
	}
	public Usuario getIdEmisor() {
		return idEmisor;
	}
	public void setIdEmisor(Usuario idEmisor) {
		this.idEmisor = idEmisor;
	}
	public Usuario getIdReceptor() {
		return idReceptor;
	}
	public void setIdReceptor(Usuario idReceptor) {
		this.idReceptor = idReceptor;
	}
	
}
