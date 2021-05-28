package net.ncdevice.interfaces;

import java.util.List;

import net.ncdevice.entidad.DetalleContratoDocs;
import net.ncdevice.entidad.DetalleVisitDoc;
import net.ncdevice.entidad.Documento;
import net.ncdevice.entidad.HistorialDocsEstado;

public interface DocumentoDAO {
	public int insertDocumento(Documento bean);
	public int updateDocumento(Documento bean);
	public int deleteDocumento(String cod);
	public String generaCodigo();
	public List<Documento> listaDocumento();
	public Documento findDocumento(String cod);
	public Documento findUltDocumento();
	public int cambiaEstado(Documento bean);
	public int cantidadDocsRecibidosAtUsuario(String codigo);
	public List<Documento> listarDocumentoXEmisor(String cod);
	public List<Documento> listarDocumentoRecibidos(String cod);
	public List<Documento> listarDocumentoXTipo(String tipo);
	public List<Documento> listaDocsAtVisita(int codigo);
	public List<Documento> listaDocsAtContrato(String codigo);
	public List<Documento> listaHistorialDocs();
	public List<HistorialDocsEstado> listaHistorialEstado(String documento);
	public HistorialDocsEstado buscaHistorialEstado(String documento);
	public Documento findFotoDocumento(String codigo);
	public int insertDocumentoYFoto(Documento bean);
	public int insertDetalleVisitaDoc(Documento bean,DetalleVisitDoc docs);
	public int insertDetalleContratoDoc(Documento bean, DetalleContratoDocs doc);
}
