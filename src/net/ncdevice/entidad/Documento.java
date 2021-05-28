package net.ncdevice.entidad;

import java.io.File;
import java.util.List;

public class Documento {
	private String iddocumento,estado,fechaRegistro,fechaModificacion,tipo,nombre,ruta,codEmi,codRec;
	private Usuario idEmisor, idReceptor;
	private File archivo;
	private byte[] archivoBytes;
	private List<HistorialDocsEstado> historial;
	private int cantNotificaciones;
	
	
	public int getCantNotificaciones() {
		return cantNotificaciones;
	}
	public void setCantNotificaciones(int cantNotificaciones) {
		this.cantNotificaciones = cantNotificaciones;
	}
	public File getArchivo() {
		return archivo;
	}
	public void setArchivo(File archivo) {
		this.archivo = archivo;
	}
	public byte[] getArchivoBytes() {
		return archivoBytes;
	}
	public void setArchivoBytes(byte[] archivoBytes) {
		this.archivoBytes = archivoBytes;
	}
	public List<HistorialDocsEstado> getHistorial() {
		return historial;
	}
	public void setHistorial(List<HistorialDocsEstado> historial) {
		this.historial = historial;
	}
	public String getIddocumento() {
		return iddocumento;
	}
	public void setIddocumento(String iddocumento) {
		this.iddocumento = iddocumento;
	}
	public String getEstado() {
		return estado;
	}
	public void setEstado(String estado) {
		this.estado = estado;
	}
	public String getFechaRegistro() {
		return fechaRegistro;
	}
	public void setFechaRegistro(String fechaRegistro) {
		this.fechaRegistro = fechaRegistro;
	}
	public String getFechaModificacion() {
		return fechaModificacion;
	}
	public void setFechaModificacion(String fechaModificacion) {
		this.fechaModificacion = fechaModificacion;
	}
	public String getTipo() {
		return tipo;
	}
	
	public String getCodEmi() {
		return codEmi;
	}
	public void setCodEmi(String codEmi) {
		this.codEmi = codEmi;
	}
	public String getCodRec() {
		return codRec;
	}
	public void setCodRec(String codRec) {
		this.codRec = codRec;
	}
	public void setTipo(String tipo) {
		this.tipo = tipo;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getRuta() {
		return ruta;
	}
	public void setRuta(String ruta) {
		this.ruta = ruta;
	}
	public Usuario getIdEmisor() {
		return idEmisor;
	}
	public void setIdEmisor(Usuario idEmisor) {
		this.idEmisor = idEmisor;
	}
	public Usuario getIdReceptor() {
		return idReceptor;
	}
	public void setIdReceptor(Usuario idReceptor) {
		this.idReceptor = idReceptor;
	}
	
}	
