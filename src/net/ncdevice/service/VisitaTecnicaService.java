package net.ncdevice.service;

import java.util.List;

import net.ncdevice.dao.MySqlVisitaTecnicaDAO;
import net.ncdevice.entidad.DetalleVisitDoc;
import net.ncdevice.entidad.VisitaTecnica;

public class VisitaTecnicaService {
	MySqlVisitaTecnicaDAO visitaTecnicaDAO;
	
	public VisitaTecnicaService() {
		visitaTecnicaDAO=new MySqlVisitaTecnicaDAO();
	}
	
	public int insertVisitaTecnica(VisitaTecnica bean) {
		return visitaTecnicaDAO.insertVisitaTecnica(bean);
	}
	public int updateVisitaTecnica(VisitaTecnica bean){
		return visitaTecnicaDAO.updateVisitaTecnica(bean);
	}
	public int deleteVisitaTecnica(String cod){
		return visitaTecnicaDAO.deleteVisitaTecnica(cod);
	}
	public List<VisitaTecnica> listaVisitaTecnica(){
		return visitaTecnicaDAO.listaVisitaTecnica();
	}
	public VisitaTecnica findVisitaTecnica(String cod){
		return visitaTecnicaDAO.findVisitaTecnica(cod);
	}
	public int cambiaEstado(VisitaTecnica bean){
		return visitaTecnicaDAO.cambiaEstado(bean);
	}
	public List<VisitaTecnica> listaVisitaTecnicaXEstado(String estado){
		return visitaTecnicaDAO.listaVisitaTecnicaXEstado(estado);
	}
	public List<VisitaTecnica> listaVisitaTecnicaXUsuario(String idusuario){
		return visitaTecnicaDAO.listaVisitaTecnicaXUsuario(idusuario);
	}
	public List<VisitaTecnica> listaVisitaTecnicaXUsuarioYEstados(String idusuario){
		return visitaTecnicaDAO.listaVisitaTecnicaXUsuarioYEstados(idusuario);
	}
	public List<DetalleVisitDoc> listaDocumentosVisita(String idvisita){
		return visitaTecnicaDAO.listaDocumentosVisita(idvisita);
	}
	public DetalleVisitDoc buscaDocumentosVisita(String idvisita){
		return visitaTecnicaDAO.buscaDocumentosVisita(idvisita);
	}
	public List<VisitaTecnica> listaVisitaPendientesxObrero(String codigo) {
		return visitaTecnicaDAO.listaVisitaPendientesxObrero(codigo);
	}
}
