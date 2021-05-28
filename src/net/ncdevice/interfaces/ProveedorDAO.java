package net.ncdevice.interfaces;

import java.util.List;

import net.ncdevice.entidad.Proveedor;

public interface ProveedorDAO {
	public int nuevoProveedor(Proveedor bean);
	public int modificaProveedor(Proveedor bean);
	public int manteProveedor(Proveedor bean);
	public int eliminaProveedor(int codigo);
	public List<Proveedor> listaProveedor();
	public Proveedor buscarProveedorXID(int cod);
	public Proveedor buscarProveedorXName(String nombre);
}
