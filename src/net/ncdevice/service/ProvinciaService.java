package net.ncdevice.service;

import java.util.List;

import net.ncdevice.dao.MySqlProvinciaDAO;
import net.ncdevice.entidad.Provincia;

public class ProvinciaService {
	MySqlProvinciaDAO daoProvinciaDAO;
	
	public ProvinciaService() {
		daoProvinciaDAO=new MySqlProvinciaDAO();
	}
	
	public int nuevoProvincia(Provincia bean) {
		return daoProvinciaDAO.nuevoProvincia(bean);
	}
	public int modificaProvincia(Provincia bean){
		return daoProvinciaDAO.modificaProvincia(bean);
	}
	public int eliminaProvincia(int codigo){
		return daoProvinciaDAO.eliminaProvincia(codigo);
	}
	public List<Provincia> listaProvincia(){
		return daoProvinciaDAO.listaProvincia();
	}
	public List<Provincia> listaProvXRegion(int region){
		return daoProvinciaDAO.listaProvXRegion(region);
	}
	public Provincia buscarProvinciaoXID(int cod){
		return daoProvinciaDAO.buscarProvinciaoXID(cod);
	}
}
