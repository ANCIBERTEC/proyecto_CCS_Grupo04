package net.ncdevice.service;

import java.util.List;

import net.ncdevice.dao.MySqlDistritoDAO;
import net.ncdevice.entidad.Distrito;

public class DistritoService {
	MySqlDistritoDAO daoDistrito;
	
	public DistritoService() {
		daoDistrito=new MySqlDistritoDAO();
	}

	public int nuevoDistrito(Distrito bean) {
		return daoDistrito.nuevoDistrito(bean);
	}
	public int modificaDistrito(Distrito bean){
		return daoDistrito.modificaDistrito(bean);
	}
	public int eliminaDistrito(int codigo){
		return daoDistrito.eliminaDistrito(codigo);
	}
	public List<Distrito> listaDistrito(){
		return daoDistrito.listaDistrito();
	}
	public List<Distrito> listaDistritoXProvincia(int prov){
		return daoDistrito.listaDistritoXProvincia(prov);
	}
	public Distrito buscarDistritoXID(int cod){
		return daoDistrito.buscarDistritoXID(cod);
	}
}
