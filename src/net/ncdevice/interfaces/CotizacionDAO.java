package net.ncdevice.interfaces;

import java.util.List;

import net.ncdevice.entidad.Cotizacion;
import net.ncdevice.entidad.DetalleCotizacion;

public interface CotizacionDAO {
	public int insertCotizacion(Cotizacion bean);
	public int updateCotizacion(Cotizacion bean);
	public int deleteCotizacion(String cod);
	public String generaCodigo();
	public int actualizaDetalleCotizacion(Cotizacion bean,List<DetalleCotizacion> lista);
	public List<Cotizacion> listaCotizacion();
	public Cotizacion findCotizacionXCodigo(String cod);
	public int cambiaEstado(Cotizacion bean);
	public List<Cotizacion> listaCotizacionXEstado(String estado);
	public List<Cotizacion> listaCotizacionXUsuario(String idusuario);
	public List<Cotizacion> listaCotizacionXUsuarioYEstados(Cotizacion bean);
	public List<DetalleCotizacion> listaDetalleCotizacion(String idcotizacion);
	public DetalleCotizacion buscaDetalleCotizacion(String idcotizacion);
}
