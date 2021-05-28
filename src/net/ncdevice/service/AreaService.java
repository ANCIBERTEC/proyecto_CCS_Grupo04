package net.ncdevice.service;

import java.util.List;

import net.ncdevice.dao.MySqlAreaDAO;
import net.ncdevice.entidad.Area;

public class AreaService {

	private MySqlAreaDAO daoArea;
	
	public AreaService() {
		daoArea=new MySqlAreaDAO();
	}
	
	public int nuevoArea(Area bean) {
		return daoArea.nuevoArea(bean);
	}
	public int modificaArea(Area bean){
		return daoArea.modificaArea(bean);
	}
	public int eliminaArea(int codigo){
		return daoArea.eliminaArea(codigo);
	}
	public List<Area> listaArea(){
		return daoArea.listaArea();
	}
	public Area buscarAreaXID(int cod){
		return daoArea.buscarAreaXID(cod);
	}
	public Area buscarAreaXName(String nombre){
		return daoArea.buscarAreaXName(nombre);
	}
}
