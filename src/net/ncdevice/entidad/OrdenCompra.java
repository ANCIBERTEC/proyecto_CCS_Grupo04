package net.ncdevice.entidad;

import java.util.List;

public class OrdenCompra extends Documento{
	private Contrato contrato;
	private Proveedor proveedor;
	private List<DetalleCompraMateriales> detalleMateriales;
	
	public List<DetalleCompraMateriales> getDetalleMateriales() {
		return detalleMateriales;
	}
	public void setDetalleMateriales(List<DetalleCompraMateriales> detalleMateriales) {
		this.detalleMateriales = detalleMateriales;
	}
	public Contrato getContrato() {
		return contrato;
	}
	public void setContrato(Contrato contrato) {
		this.contrato = contrato;
	}
	public Proveedor getProveedor() {
		return proveedor;
	}
	public void setProveedor(Proveedor proveedor) {
		this.proveedor = proveedor;
	}
	
}
