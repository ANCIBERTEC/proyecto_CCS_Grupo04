package net.ncdevice.action;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Base64;
import java.util.List;
import java.util.Map;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import net.ncdevice.entidad.DetalleContratoDocs;
import net.ncdevice.entidad.DetalleVisitDoc;
import net.ncdevice.entidad.Documento;
import net.ncdevice.entidad.Usuario;
import net.ncdevice.service.DocumentoService;

@SuppressWarnings("serial")
@ParentPackage("dawi")
public class DocumentoAction extends ActionSupport{
	private List<Documento> listaDocumento;
	private String codigo,tipo,tipoDoc,basearchivo;
	private String baseFoto;
	private Documento documento;
	private Map<String, Object> session=ActionContext.getContext().getSession();
	private int notify;
	private DocumentoService documentoService;
	
	public DocumentoAction() {
		documentoService=new DocumentoService();
	}
	
	
	@Action(value = "/listaDocumento", results = { @Result(name="ok",type = "json")})
	public String listaDocumento() {
		System.out.println("sss");
		listaDocumento=documentoService.listaDocumento();
		session.put("documentos", listaDocumento);
		return "ok";
	}
	
	@Action(value = "/listaHistorialDocs", results = { @Result(name="ok",type = "json")})
	public String listaHistorialDocs() {
		System.out.println("sss");
		listaDocumento=documentoService.listaHistorialDocs();
		session.put("documentos", listaDocumento);
		return "ok";
	}
	
	@Action(value = "/listaDocumentoAtTipo", results = { @Result(name="ok",type = "json")})
	public String listaDocumentoAtTipo() {
		System.out.println("sss");
		listaDocumento=documentoService.listarDocumentoXTipo(tipo);
		session.put("documentos", listaDocumento);
		return "ok";
	}
	@Action(value = "/cantidadDocsRecAtUser", results = { @Result(name="ok",type = "json")})
	public String cantidadDocsRecAtUser() {
		Usuario usu=new Usuario();
		usu=(Usuario)session.get("usuarioLogin");
		notify=documentoService.cantidadDocsRecibidosAtUsuario(usu.getIdusuario());
		session.put("notify", notify);
		return "ok";
	}
	@Action(value = "/findFotoDocumento", results = { @Result(name="ok",type = "json")})
	public String findFotoDocumento() {
		
		Documento bean=documentoService.findFotoDocumento(codigo);
		System.out.println("SI EXISTE LA FOTO");
		/*basearchivo=Base64.getEncoder().encodeToString(bean.getArchivoBytes());
		System.out.println(basearchivo);
		System.out.println(bean.getArchivoBytes());*/
		if(bean==null)System.out.println("BEAN ES NULO, NO EXISTE");
		if(bean!=null)
			basearchivo=Base64.getEncoder().encodeToString(bean.getArchivoBytes());
		else 
			basearchivo=null;
		return "ok";
	}
	@Action(value = "/listaDocumentoAtDocumento", results = { @Result(name="ok",type = "json")})
	public String listaDocumentoAtDocumento() {
		if(tipo.equals("1"))
			listaDocumento=documentoService.listaDocsAtVisita(Integer.parseInt(codigo));
		else 
			listaDocumento=documentoService.listaDocsAtContrato(codigo);
		session.put("documentos", listaDocumento);
		return "ok";
	}
	
	
	/*
	@Action(value = "/reporteDocumentos", results = { @Result(name="ok",type = "jsonjasper")})
	public String reporteDocumentos() {
		
		
		return "ok";
	}
	
	*/
	@SuppressWarnings("resource")
	@Action(value ="/registraDocumento",results = {@Result(location ="/subirArchivos.jsp",name="ok",type = "redirect")})
	public String registraDocumento() throws IOException {
		Usuario usu=new Usuario();
		usu=(Usuario)session.get("usuarioLogin");
		String cod=documentoService.generaCodigo();
		documento.setIddocumento(cod);
		documento.setEstado("REGISTRADO");
		//documento.setTipo("DOCUMENTO");
		documento.setCodEmi(usu.getIdusuario());
		documento.setCodRec(null);
		String nomarc=null;
		nomarc=documento.getArchivo().getName();
		System.out.println(nomarc);
		//documento.setNombre(nomarc);
		InputStream is=new FileInputStream(documento.getArchivo());
		byte[] arreglo=new byte[is.available()];
		is.read(arreglo);
		documento.setArchivoBytes(arreglo);
		
		int i=0;
		if (tipoDoc.equals("1")) {
			DetalleVisitDoc vis=new DetalleVisitDoc();
			vis.setIddocumento(cod);vis.setIdvisita(Integer.parseInt(codigo));
			i=documentoService.insertDetalleVisitaDoc(documento, vis);
		}else {
			DetalleContratoDocs con=new DetalleContratoDocs();
			con.setIddocumento(cod);con.setIdcontrato(codigo);
			i=documentoService.insertDetalleContratoDoc(documento, con);
		}
		if(i!=-1) {
			session.put("CORRECTO", "Se subio correctamente el Documento "+cod);
			System.out.println("Registro Correcto");
		}else {
			session.put("ERROR", "Error al registrar");
		}
		return "ok";
	}
	
	@Action(value = "/eliminaDocumento",results = {@Result(location = "/registraVisita.jsp",name = "ok",type = "redirect")})
	public String eliminaDocumento() {
		int i=documentoService.deleteDocumento(codigo);
		if(i!=-1) {
			session.put("CORRECTO", "Se elimino correctamente el area");
		}else {
			session.put("ERROR", "Error al eliminar. Asegurese que nadie dependa del Area.");
		}
		return "ok";
	}
	
	
	

	public String getArchivo() {
		return basearchivo;
	}


	public void setArchivo(String basearchivo) {
		this.basearchivo = basearchivo;
	}


	public int getNotify() {
		return notify;
	}


	public void setNotify(int notify) {
		this.notify = notify;
	}


	public String getTipoDoc() {
		return tipoDoc;
	}


	public void setTipoDoc(String tipoDoc) {
		this.tipoDoc = tipoDoc;
	}


	public List<Documento> getListaDocumento() {
		return listaDocumento;
	}


	public void setListaDocumento(List<Documento> listaDocumento) {
		this.listaDocumento = listaDocumento;
	}


	public String getCodigo() {
		return codigo;
	}


	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}


	public String getTipo() {
		return tipo;
	}


	public void setTipo(String tipo) {
		this.tipo = tipo;
	}


	public Documento getDocumento() {
		return documento;
	}


	public void setDocumento(Documento documento) {
		this.documento = documento;
	}


	public String getBasearchivo() {
		return basearchivo;
	}


	public void setBasearchivo(String basearchivo) {
		this.basearchivo = basearchivo;
	}


	public String getBaseFoto() {
		return baseFoto;
	}


	public void setBaseFoto(String baseFoto) {
		this.baseFoto = baseFoto;
	}



	
}
