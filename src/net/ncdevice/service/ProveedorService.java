package net.ncdevice.service;

import java.util.List;

import net.ncdevice.dao.MySqlProveedorDAO;
import net.ncdevice.entidad.Proveedor;

public class ProveedorService {
	MySqlProveedorDAO proveedorDAO;
	
	public ProveedorService() {
		proveedorDAO=new MySqlProveedorDAO();
	}
	
	public int nuevoProveedor(Proveedor bean) {
		return proveedorDAO.nuevoProveedor(bean);
	}
	public int modificaProveedor(Proveedor bean){
		return proveedorDAO.modificaProveedor(bean);
	}
	public int eliminaProveedor(int codigo){
		return proveedorDAO.eliminaProveedor(codigo);
	}
	public List<Proveedor> listaProveedor(){
		return proveedorDAO.listaProveedor();
	}
	public Proveedor buscarProveedorXID(int cod){
		return proveedorDAO.buscarProveedorXID(cod);
	}
	public Proveedor buscarProveedorXName(String nombre){
		return proveedorDAO.buscarProveedorXName(nombre);
	}
	public int manteProveedor(Proveedor bean) {
		return proveedorDAO.manteProveedor(bean);
	}
}
