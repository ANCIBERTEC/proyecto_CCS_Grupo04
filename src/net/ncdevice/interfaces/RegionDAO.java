package net.ncdevice.interfaces;

import java.util.List;

import net.ncdevice.entidad.Region;

public interface RegionDAO {
	public int nuevoRegion(Region bean);
	public int modificaRegion(Region bean);
	public int eliminaRegion(int codigo);
	public List<Region> listaRegion();
	public Region buscarRegionXID(int cod);
}
