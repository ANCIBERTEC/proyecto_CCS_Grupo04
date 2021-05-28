package net.ncdevice.entidad;

public class ActaEntrega extends Documento{
	private Contrato contrato;
	private String idcontrato,observaciones;

	
	public String getObservaciones() {
		return observaciones;
	}

	public void setObservaciones(String observaciones) {
		this.observaciones = observaciones;
	}

	public String getIdcontrato() {
		return idcontrato;
	}

	public void setIdcontrato(String idcontrato) {
		this.idcontrato = idcontrato;
	}

	public Contrato getContrato() {
		return contrato;
	}

	public void setContrato(Contrato contrato) {
		this.contrato = contrato;
	}
	
}
