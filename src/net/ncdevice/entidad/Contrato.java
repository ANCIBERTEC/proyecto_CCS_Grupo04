package net.ncdevice.entidad;

import java.util.List;

public class Contrato extends Documento{
	private Cotizacion cotizacion;
	private String descripcion;
	private String fecInicio;
	private String fechaFinal;
	private int dias;
	private double monto;
	private String estado,idcotizacion;
	private List<EquipoTrabajo> grupoTrabajo;
	private List<DetalleContratoDocs> listaArchivos;
	private DetalleCotizacion detalleCot;
	
	
	public DetalleCotizacion getDetalleCot() {
		return detalleCot;
	}
	public void setDetalleCot(DetalleCotizacion detalleCot) {
		this.detalleCot = detalleCot;
	}
	public double getMonto() {
		return monto;
	}
	public void setMonto(double monto) {
		this.monto = monto;
	}
	public String getFechaFinal() {
		return fechaFinal;
	}
	public void setFechaFinal(String fechaFinal) {
		this.fechaFinal = fechaFinal;
	}
	public String getIdcotizacion() {
		return idcotizacion;
	}
	public void setIdcotizacion(String idcotizacion) {
		this.idcotizacion = idcotizacion;
	}
	public Cotizacion getCotizacion() {
		return cotizacion;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public String getFecInicio() {
		return fecInicio;
	}
	public void setFecInicio(String fecInicio) {
		this.fecInicio = fecInicio;
	}
	public int getDias() {
		return dias;
	}
	public void setDias(int dias) {
		this.dias = dias;
	}
	public String getEstado() {
		return estado;
	}
	public void setEstado(String estado) {
		this.estado = estado;
	}
	public List<EquipoTrabajo> getGrupoTrabajo() {
		return grupoTrabajo;
	}
	public void setGrupoTrabajo(List<EquipoTrabajo> grupoTrabajo) {
		this.grupoTrabajo = grupoTrabajo;
	}
	public List<DetalleContratoDocs> getListaArchivos() {
		return listaArchivos;
	}
	public void setListaArchivos(List<DetalleContratoDocs> listaArchivos) {
		this.listaArchivos = listaArchivos;
	}
	public void setCotizacion(Cotizacion cotizacion) {
		this.cotizacion = cotizacion;
	}
}
