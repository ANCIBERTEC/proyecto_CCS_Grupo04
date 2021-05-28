package net.ncdevice.interfaces;

import java.util.List;

import net.ncdevice.entidad.DetalleCompraMateriales;
import net.ncdevice.entidad.OrdenCompra;

public interface OrdenCompraDAO {
	public int insertOrdenCompra(OrdenCompra bean,List<DetalleCompraMateriales> lista);
	public int updateOrdenCompra(OrdenCompra bean);
	public int deleteOrdenCompra(String cod);
	public String generaCodigo();
	public List<OrdenCompra> listaOrdenCompra();
	public OrdenCompra findOrdenCompra(String cod);
	public int cambiaEstado(OrdenCompra bean);
	public List<OrdenCompra> listaXEstado(String estado);
	public List<OrdenCompra> listaOrdenXUsuarioYEstados(String idusuario);
	public List<DetalleCompraMateriales> listaMateriales(String idcomrpa);
	public DetalleCompraMateriales buscaCompraMateriales(String idcompra);
}
