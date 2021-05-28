package net.ncdevice.service;

import java.util.List;

import net.ncdevice.dao.MySqlRegionDAO;
import net.ncdevice.entidad.Region;

public class RegionService {
	MySqlRegionDAO regionDAO;
	
	public RegionService() {
		regionDAO=new MySqlRegionDAO();
	}

	public int nuevoRegion(Region bean) {
		return regionDAO.nuevoRegion(bean);
	}
	public int modificaRegion(Region bean) {
		return regionDAO.modificaRegion(bean);
	}
	public int eliminaRegion(int codigo) {
		return regionDAO.eliminaRegion(codigo);
	}
	public List<Region> listaRegion() {
		return regionDAO.listaRegion();
	}
	public Region buscarRegionXID(int cod) {
		return regionDAO.buscarRegionXID(cod);
	}
}
