package net.ncdevice.entidad;

import java.sql.Timestamp;
import java.util.List;

public class Cotizacion extends Documento{
	private Cliente cliente;
	private VisitaTecnica visita;
	private DetalleCotizacion detalleCotizacion;
	private int idcliente,idvisita;
	private Timestamp fechaTime;
	//private String nombre, apellido,telefono;
	private List<DetalleCotizacion> detalle;
	
	
	public Timestamp getFechaTime() {
		return fechaTime;
	}
	public void setFechaTime(Timestamp fechaTime) {
		this.fechaTime = fechaTime;
	}
	public List<DetalleCotizacion> getDetalle() {
		return detalle;
	}
	public void setDetalle(List<DetalleCotizacion> detalle) {
		this.detalle = detalle;
	}
	public Cliente getCliente() {
		return cliente;
	}
	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}
	public VisitaTecnica getVisita() {
		return visita;
	}
	public void setVisita(VisitaTecnica visita) {
		this.visita = visita;
	}
	public DetalleCotizacion getDetalleCotizacion() {
		return detalleCotizacion;
	}
	public void setDetalleCotizacion(DetalleCotizacion detalleCotizacion) {
		this.detalleCotizacion = detalleCotizacion;
	}
	public int getIdcliente() {
		return idcliente;
	}
	public void setIdcliente(int idcliente) {
		this.idcliente = idcliente;
	}
	public int getIdvisita() {
		return idvisita;
	}
	public void setIdvisita(int idvisita) {
		this.idvisita = idvisita;
	}
	
}
