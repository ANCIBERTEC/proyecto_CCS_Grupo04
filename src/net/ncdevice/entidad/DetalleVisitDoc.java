package net.ncdevice.entidad;

public class DetalleVisitDoc {
	private VisitaTecnica visita;
	private Documento documento;	
	private int idvisita;
	private String iddocumento;
	
	public VisitaTecnica getVisita() {
		return visita;
	}
	public void setVisita(VisitaTecnica visita) {
		this.visita = visita;
	}
	public Documento getDocumento() {
		return documento;
	}
	public void setDocumento(Documento documento) {
		this.documento = documento;
	}
	public int getIdvisita() {
		return idvisita;
	}
	public void setIdvisita(int idvisita) {
		this.idvisita = idvisita;
	}
	public String getIddocumento() {
		return iddocumento;
	}
	public void setIddocumento(String iddocumento) {
		this.iddocumento = iddocumento;
	}
	
	
}
