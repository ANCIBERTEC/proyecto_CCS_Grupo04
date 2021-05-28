package net.ncdevice.service;

import java.util.List;

import net.ncdevice.dao.MySqlOrdenCompraDAO;
import net.ncdevice.entidad.DetalleCompraMateriales;
import net.ncdevice.entidad.OrdenCompra;

public class OrdenCompraService {
	MySqlOrdenCompraDAO ordenCompraDAO;
	
	public OrdenCompraService() {
		ordenCompraDAO=new MySqlOrdenCompraDAO();
	}

	public int insertOrdenCompra(OrdenCompra bean,List<DetalleCompraMateriales> lista) {
		return ordenCompraDAO.insertOrdenCompra(bean,lista);
	}
	public int updateOrdenCompra(OrdenCompra bean){
		return ordenCompraDAO.updateOrdenCompra(bean);
	}
	public int deleteOrdenCompra(String cod){
		return ordenCompraDAO.deleteOrdenCompra(cod);
	}
	public String generaCodigo(){
		return ordenCompraDAO.generaCodigo();
	}
	public List<OrdenCompra> listaOrdenCompra(){
		return ordenCompraDAO.listaOrdenCompra();
	}
	public OrdenCompra findOrdenCompra(String cod){
		return ordenCompraDAO.findOrdenCompra(cod);
	}
	public int cambiaEstado(OrdenCompra bean){
		return ordenCompraDAO.cambiaEstado(bean);
	}
	public List<OrdenCompra> listaXEstado(String estado){
		return ordenCompraDAO.listaXEstado(estado);
	}
	public List<OrdenCompra> listaOrdenXUsuarioYEstados(String idusuario){
		return ordenCompraDAO.listaOrdenXUsuarioYEstados(idusuario);
	}
	public List<DetalleCompraMateriales> listaMateriales(String idcomrpa){
		return ordenCompraDAO.listaMateriales(idcomrpa);
	}
	public DetalleCompraMateriales buscaCompraMateriales(String idcompra){
		return ordenCompraDAO.buscaCompraMateriales(idcompra);
	}
}
