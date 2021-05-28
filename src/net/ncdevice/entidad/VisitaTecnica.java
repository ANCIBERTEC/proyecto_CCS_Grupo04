package net.ncdevice.entidad;

import java.util.List;

public class VisitaTecnica {
	private int idvisita;
	private Cliente cliente;
	private Usuario tecnico;
	private String fecha,hora,estado;
	private int idcliente;
	private String idtecnico;
	private List<DetalleVisitDoc> detalleDocs;
	
	public String getEstado() {
		return estado;
	}
	public void setEstado(String estado) {
		this.estado = estado;
	}
	public List<DetalleVisitDoc> getDetalleDocs() {
		return detalleDocs;
	}
	public void setDetalleDocs(List<DetalleVisitDoc> detalleDocs) {
		this.detalleDocs = detalleDocs;
	}
	public int getIdvisita() {
		return idvisita;
	}
	public void setIdvisita(int idvisita) {
		this.idvisita = idvisita;
	}
	public String getFecha() {
		return fecha;
	}
	public void setFecha(String fecha) {
		this.fecha = fecha;
	}
	public String getHora() {
		return hora;
	}
	public void setHora(String hora) {
		this.hora = hora;
	}
	public Cliente getCliente() {
		return cliente;
	}
	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}
	public Usuario getTecnico() {
		return tecnico;
	}
	public void setTecnico(Usuario tecnico) {
		this.tecnico = tecnico;
	}
	public int getIdcliente() {
		return idcliente;
	}
	public void setIdcliente(int idcliente) {
		this.idcliente = idcliente;
	}
	public String getIdtecnico() {
		return idtecnico;
	}
	public void setIdtecnico(String idtecnico) {
		this.idtecnico = idtecnico;
	}
	
}
