package net.ncdevice.service;

import java.util.List;

import net.ncdevice.dao.MySqlCargoDAO;
import net.ncdevice.entidad.Cargo;

public class CargoService {
	MySqlCargoDAO daoCargo;
	
	public CargoService() {
		daoCargo=new MySqlCargoDAO();
	}
	
	public int nuevoCargo(Cargo bean) {
		return daoCargo.nuevoCargo(bean);
	}
	public int mantenerCargo(Cargo bean) {
		return daoCargo.mantenerCargo(bean);
	}
	
	public int modificaCargo(Cargo bean) {
		return daoCargo.modificaCargo(bean);
	}
	public int eliminaCargo(int codigo) {
		return daoCargo.eliminaCargo(codigo);
	}
	public List<Cargo> listaCargo() {
		return daoCargo.listaCargo();
	}
	public Cargo findCargoXID(int cod) {
		return daoCargo.findCargoXID(cod);
	}
	public Cargo findCargoXName(String nombre) {
		return daoCargo.findCargoXName(nombre);
	}
	public List<Cargo> findCargoXArea(int area) {
		return daoCargo.findCargoXArea(area);
	}

	public List<Cargo> listaEspecialidades(){
		return daoCargo.listaEspecialidades();
	}
}
