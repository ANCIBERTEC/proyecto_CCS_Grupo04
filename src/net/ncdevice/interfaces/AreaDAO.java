package net.ncdevice.interfaces;

import java.util.List;

import net.ncdevice.entidad.Area;

public interface AreaDAO {
	public int nuevoArea(Area bean);
	public int modificaArea(Area bean);
	public int eliminaArea(int codigo);
	public List<Area> listaArea();
	public Area buscarAreaXID(int cod);
	public Area buscarAreaXName(String nombre);
}
