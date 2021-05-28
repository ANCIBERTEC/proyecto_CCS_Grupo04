package net.ncdevice.interfaces;

import java.util.List;

import net.ncdevice.entidad.Distrito;
import net.ncdevice.entidad.Provincia;
import net.ncdevice.entidad.Region;

public interface LocalizacionDAO {
	public List<Distrito> listaDistrito();
	public List<Distrito> listaDistritoXProvincia(int prov);
	public List<Provincia> listaProvincia();
	public List<Provincia> listaProvXRegion(int region);
	public List<Region> listaRegion();
}
