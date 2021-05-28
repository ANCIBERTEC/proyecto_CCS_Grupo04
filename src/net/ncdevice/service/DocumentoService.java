package net.ncdevice.service;

import java.util.List;

import net.ncdevice.dao.MySqlDocumentoDAO;
import net.ncdevice.entidad.DetalleContratoDocs;
import net.ncdevice.entidad.DetalleVisitDoc;
import net.ncdevice.entidad.Documento;
import net.ncdevice.entidad.HistorialDocsEstado;

public class DocumentoService {
	
	MySqlDocumentoDAO daoDocumentoDAO;
	
	public DocumentoService() {
		daoDocumentoDAO=new MySqlDocumentoDAO();
	}
	
	public int insertDocumento(Documento bean) {
		return daoDocumentoDAO.insertDocumento(bean);
	}
	public int updateDocumento(Documento bean){
		return daoDocumentoDAO.updateDocumento(bean);
	}
	public int deleteDocumento(String cod){
		return daoDocumentoDAO.deleteDocumento(cod);
	}
	public String generaCodigo(){
		return daoDocumentoDAO.generaCodigo();
	}
	public List<Documento> listaDocumento(){
		return daoDocumentoDAO.listaDocumento();
	}
	public Documento findDocumento(String cod){
		return daoDocumentoDAO.findDocumento(cod);
	}
	public Documento findUltDocumento(){
		return daoDocumentoDAO.findUltDocumento();
	}
	public int cambiaEstado(Documento bean){
		return daoDocumentoDAO.cambiaEstado(bean);
	}

	public int cantidadDocsRecibidosAtUsuario(String codigo) {
		return daoDocumentoDAO.cantidadDocsRecibidosAtUsuario(codigo);
	}
	public List<Documento> listarDocumentoXTipo(String tipo){
		return daoDocumentoDAO.listarDocumentoXTipo(tipo);
	}
	public List<Documento> listarDocumentoXEmisor(String cod){
		return daoDocumentoDAO.listarDocumentoXEmisor(cod);
	}
	public List<Documento> listaHistorialDocs() {
		return daoDocumentoDAO.listaHistorialDocs();
	}
	public List<Documento> listaDocsAtVisita(int codigo){
		return daoDocumentoDAO.listaDocsAtVisita(codigo);
	}
	public List<Documento> listaDocsAtContrato(String codigo){
		return daoDocumentoDAO.listaDocsAtContrato(codigo);
	}
	public List<Documento> listarDocumentoRecibidos(String cod) {
		return daoDocumentoDAO.listarDocumentoRecibidos(cod);
	}
	public List<HistorialDocsEstado> listaHistorialEstado(String documento){
		return daoDocumentoDAO.listaHistorialEstado(documento);
	}
	public HistorialDocsEstado buscaHistorialEstado(String documento){
		return daoDocumentoDAO.buscaHistorialEstado(documento);
	}
	public Documento findFotoDocumento(String codigo) {
		return daoDocumentoDAO.findFotoDocumento(codigo);
	}
	public int insertDocumentoYFoto(Documento bean) {
		return daoDocumentoDAO.insertDocumentoYFoto(bean);
	}
	public int insertDetalleVisitaDoc(Documento bean,DetalleVisitDoc docs) {
		return daoDocumentoDAO.insertDetalleVisitaDoc(bean, docs);
	}
	public int insertDetalleContratoDoc(Documento bean, DetalleContratoDocs doc) {
		return daoDocumentoDAO.insertDetalleContratoDoc(bean, doc);
	}
	
}
