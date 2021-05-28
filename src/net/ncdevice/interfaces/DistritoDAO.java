package net.ncdevice.interfaces;

import java.util.List;

import net.ncdevice.entidad.Distrito;

public interface DistritoDAO {
	public int nuevoDistrito(Distrito bean);
	public int modificaDistrito(Distrito bean);
	public int eliminaDistrito(int codigo);
	public List<Distrito> listaDistrito();
	public List<Distrito> listaDistritoXProvincia(int prov);
	public Distrito buscarDistritoXID(int cod);
}
