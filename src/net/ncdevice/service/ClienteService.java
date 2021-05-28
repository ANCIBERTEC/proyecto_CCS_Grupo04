package net.ncdevice.service;

import java.util.List;

import net.ncdevice.dao.MySqlClienteDAO;
import net.ncdevice.dao.MySqlDistritoDAO;
import net.ncdevice.entidad.Cliente;
import net.ncdevice.entidad.Distrito;

public class ClienteService {

	MySqlClienteDAO daoCliente;
	
	MySqlDistritoDAO daoDistrito;
	
	public ClienteService() {
		daoCliente = new MySqlClienteDAO();
		daoDistrito=new MySqlDistritoDAO();
	}
	
	public int registraCliente(Cliente bean) {
		return daoCliente.registraCliente(bean);
	}
	public int modificaCliente(Cliente bean){
		return daoCliente.modificaCliente(bean);
	}
	public int eliminaCliente(int codigo){
		return daoCliente.eliminaCliente(codigo);
	}
	public List<Cliente> listaCliente(){
		return daoCliente.listaCliente();
	}
	
	public List<Distrito> listaDistrito(int iddistrito){
		return daoDistrito.listaDistrito();
	}
	public List<Cliente> listaAllCliente(){
		return daoCliente.listaAllCliente();
	}
	
	public List<Cliente> listaClienteXCalificacion(int cal){
		return daoCliente.listaClienteXCalificacion(cal);
	}
	public List<Cliente> listaClienteXtipo(String tipo){
		return daoCliente.listaClienteXtipo(tipo);
	}
	public List<Cliente> listaClienteXName(String nom){
		return daoCliente.listaClienteXName(nom);
	}

	public Cliente buscarClienteXID(int cod){
		return daoCliente.buscarClienteXID(cod);
	}
	public Cliente buscarClienteXName(String nombre){
		return daoCliente.buscarClienteXName(nombre);
	}
	public int registraClienteJSON(Cliente bean) {
		return daoCliente.registraClienteJSON(bean);
	}
}
