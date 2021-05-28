package net.ncdevice.service;

import java.util.List;

import net.ncdevice.dao.MySqlLocalizacionDAO;
import net.ncdevice.entidad.Distrito;
import net.ncdevice.entidad.Provincia;
import net.ncdevice.entidad.Region;

public class LocalizacionService {
	private MySqlLocalizacionDAO daoloc;
	
	public LocalizacionService() {
		daoloc=new MySqlLocalizacionDAO();
	}
	public List<Distrito> listaDistrito(){
		return daoloc.listaDistrito();
	}	
	public List<Distrito> listaDistritoXProvincia(int prov){
		return daoloc.listaDistritoXProvincia(prov);
	}	
	public List<Provincia> listaProvincia(){
		return daoloc.listaProvincia();
	}	
	public List<Provincia> listaProvXRegion(int region){
		return daoloc.listaProvXRegion(region);
	}	
	public List<Region> listaRegion(){
		return daoloc.listaRegion();
	}	
	
}
