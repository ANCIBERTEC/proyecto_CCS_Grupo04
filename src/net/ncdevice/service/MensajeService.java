package net.ncdevice.service;

import java.util.List;

import net.ncdevice.dao.MySqlMensajeDAO;
import net.ncdevice.entidad.Mensaje;

public class MensajeService {
	MySqlMensajeDAO daoMensajeDAO;
	
	public MensajeService() {
		daoMensajeDAO=new MySqlMensajeDAO();
	}
	
	public int insertMensaje(Mensaje bean) {
		return daoMensajeDAO.insertMensaje(bean);
	}
	public int updateMensaje(Mensaje bean){
		return daoMensajeDAO.updateMensaje(bean);
	}
	public int deleteMensaje(String cod){
		return daoMensajeDAO.deleteMensaje(cod);
	}
	public List<Mensaje> listaMensaje(){
		return daoMensajeDAO.listaMensaje();
	}
	public Mensaje findMensaje(String cod){
		return daoMensajeDAO.findMensaje(cod);
	}
	public List<Mensaje> listaMensajeXEmisor(String cod){
		return daoMensajeDAO.listaMensajeXEmisor(cod);
	}
	public List<Mensaje> listaMensajeXReceptor(String cod){
		return daoMensajeDAO.listaMensajeXReceptor(cod);
	}
	public int cantidadMensajes(int tipo,String cod){
		return daoMensajeDAO.cantidadMensajes(tipo, cod);
	}
}
