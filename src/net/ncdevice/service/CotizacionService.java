package net.ncdevice.service;

import java.util.List;

import net.ncdevice.dao.MySqlCotizacionDAO;
import net.ncdevice.entidad.Cotizacion;
import net.ncdevice.entidad.DetalleCotizacion;

public class CotizacionService {
	MySqlCotizacionDAO cotizacionDAO;
	public CotizacionService() {
		cotizacionDAO=new MySqlCotizacionDAO();
	}

	public int insertCotizacion(Cotizacion bean) {
		return cotizacionDAO.insertCotizacion(bean);
	}
	public int updateCotizacion(Cotizacion bean){
		return cotizacionDAO.updateCotizacion(bean);
	}
	public int deleteCotizacion(String cod){
		return cotizacionDAO.deleteCotizacion(cod);
	}
	public String generaCodigo(){
		return cotizacionDAO.generaCodigo();
	}
	public int actualizaDetalleCotizacion(Cotizacion bean,List<DetalleCotizacion> lista) {
		return cotizacionDAO.actualizaDetalleCotizacion(bean, lista);
	}
	public List<Cotizacion> listaCotizacion(){
		return cotizacionDAO.listaCotizacion();
	}
	public Cotizacion findCotizacionXCodigo(String codigo){
		return cotizacionDAO.findCotizacionXCodigo(codigo);
	}
	public int cambiaEstado(Cotizacion bean){
		return cotizacionDAO.cambiaEstado(bean);
	}
	public List<Cotizacion> listaCotizacionXEstado(String estado){
		return cotizacionDAO.listaCotizacionXEstado(estado);
	}
	public List<Cotizacion> listaCotizacionXUsuario(String idusuario){
		return cotizacionDAO.listaCotizacionXUsuario(idusuario);
	}
	public List<Cotizacion> listaCotizacionXUsuarioYEstados(Cotizacion bean){
		return cotizacionDAO.listaCotizacionXUsuarioYEstados(bean);
	}
	public List<DetalleCotizacion> listaDetalleCotizacion(String idcotizacion){
		return cotizacionDAO.listaDetalleCotizacion(idcotizacion);
	}
	public DetalleCotizacion buscaDetalleCotizacion(String idcotizacion){
		return cotizacionDAO.buscaDetalleCotizacion(idcotizacion);
	}
}
