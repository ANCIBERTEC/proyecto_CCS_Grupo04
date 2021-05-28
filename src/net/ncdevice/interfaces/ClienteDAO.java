package net.ncdevice.interfaces;

import java.util.List;

import net.ncdevice.entidad.Cliente;

public interface ClienteDAO {
	public int registraCliente(Cliente bean);
	public int modificaCliente(Cliente bean);
	public int eliminaCliente(int codigo);
	public List<Cliente> listaCliente();
	public List<Cliente> listaAllCliente();
	public List<Cliente> listaClienteXCalificacion(int cal);
	public List<Cliente> listaClienteXtipo(String tipo);
	public List<Cliente> listaClienteXName(String nom);
	public Cliente buscarClienteXID(int cod);
	public Cliente buscarClienteXName(String nombre);
	public int registraClienteJSON(Cliente bean);
}
