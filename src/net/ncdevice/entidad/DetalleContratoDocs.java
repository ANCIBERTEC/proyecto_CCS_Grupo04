package net.ncdevice.entidad;

import java.util.List;

public class DetalleContratoDocs {
	private Contrato contrato;
	private Documento documento;
	private List<Documento> listaArchivos;
	private String idcontrato,iddocumento;
	
	
	public String getIdcontrato() {
		return idcontrato;
	}
	public void setIdcontrato(String idcontrato) {
		this.idcontrato = idcontrato;
	}
	public String getIddocumento() {
		return iddocumento;
	}
	public void setIddocumento(String iddocumento) {
		this.iddocumento = iddocumento;
	}
	public List<Documento> getListaArchivos() {
		return listaArchivos;
	}
	public void setListaArchivos(List<Documento> listaArchivos) {
		this.listaArchivos = listaArchivos;
	}
	public Contrato getContrato() {
		return contrato;
	}
	public void setContrato(Contrato contrato) {
		this.contrato = contrato;
	}
	public Documento getDocumento() {
		return documento;
	}
	public void setDocumento(Documento documento) {
		this.documento = documento;
	}
	
}
