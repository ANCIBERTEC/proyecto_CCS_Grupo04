package net.ncdevice.interfaces;

import java.util.List;

import net.ncdevice.entidad.DetalleVisitDoc;
import net.ncdevice.entidad.VisitaTecnica;

public interface VisitaTecnicaDAO {
	public int insertVisitaTecnica(VisitaTecnica bean);
	public int updateVisitaTecnica(VisitaTecnica bean);
	public int deleteVisitaTecnica(String cod);
	public List<VisitaTecnica> listaVisitaTecnica();
	public VisitaTecnica findVisitaTecnica(String cod);
	public int cambiaEstado(VisitaTecnica bean);
	public List<VisitaTecnica> listaVisitaTecnicaXEstado(String estado);
	public List<VisitaTecnica> listaVisitaTecnicaXUsuario(String idusuario);
	public List<VisitaTecnica> listaVisitaTecnicaXUsuarioYEstados(String idusuario);
	public List<DetalleVisitDoc> listaDocumentosVisita(String idvisita);
	public DetalleVisitDoc buscaDocumentosVisita(String idvisita);
	public List<VisitaTecnica> listaVisitaPendientesxObrero(String idusuario);
}
