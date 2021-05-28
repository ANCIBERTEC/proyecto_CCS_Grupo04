package net.ncdevice.interfaces;

import java.util.List;

import net.ncdevice.entidad.Provincia;

public interface ProvinciaDAO {
	public int nuevoProvincia(Provincia bean);
	public int modificaProvincia(Provincia bean);
	public int eliminaProvincia(int codigo);
	public List<Provincia> listaProvincia();
	public List<Provincia> listaProvXRegion(int region);
	public Provincia buscarProvinciaoXID(int cod);
}
