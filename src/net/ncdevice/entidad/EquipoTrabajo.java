package net.ncdevice.entidad;

public class EquipoTrabajo {
	private Contrato contrato;
	private Usuario trabajador;
	private String cargo,idcontrato,idtrabajador;
	
	public Contrato getContrato() {
		return contrato;
	}
	public void setContrato(Contrato contrato) {
		this.contrato = contrato;
	}
	public String getIdcontrato() {
		return idcontrato;
	}
	public void setIdcontrato(String idcontrato) {
		this.idcontrato = idcontrato;
	}
	public String getIdtrabajador() {
		return idtrabajador;
	}
	public void setIdtrabajador(String idtrabajador) {
		this.idtrabajador = idtrabajador;
	}
	public Contrato getProyecto() {
		return contrato;
	}
	public void setProyecto(Contrato proyecto) {
		this.contrato = proyecto;
	}
	public Usuario getTrabajador() {
		return trabajador;
	}
	public void setTrabajador(Usuario trabajador) {
		this.trabajador = trabajador;
	}
	public String getCargo() {
		return cargo;
	}
	public void setCargo(String cargo) {
		this.cargo = cargo;
	}
	
}
