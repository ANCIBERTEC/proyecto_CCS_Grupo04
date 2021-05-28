package net.ncdevice.service;

import java.util.List;

import net.ncdevice.dao.MySqlActaEntregaDAO;
import net.ncdevice.entidad.ActaEntrega;

public class ActaEntregaService {

	MySqlActaEntregaDAO daoActaEntrega;
	
	public ActaEntregaService() {
		daoActaEntrega=new MySqlActaEntregaDAO();
	}
	
	public int insertActaEntrega(ActaEntrega bean) {
		return daoActaEntrega.insertActaEntrega(bean);
	}
	public int updateActaEntrega(ActaEntrega bean)  {
		return daoActaEntrega.updateActaEntrega(bean);
	}
	public int deleteActaEntrega(String cod) {
		return daoActaEntrega.deleteActaEntrega(cod);
	}
	public String generaCodigo() {
		return daoActaEntrega.generaCodigo();
	}
	public List<ActaEntrega> listaActaEntrega() {
		return daoActaEntrega.listaActaEntrega();
	}
	public ActaEntrega findActaEntrega(String cod) {
		return daoActaEntrega.findActaEntrega(cod);
	}
	public int cambiaEstado(ActaEntrega bean) {
		return daoActaEntrega.cambiaEstado(bean);
	}
	public List<ActaEntrega> listaActaEntregaXEstado(String estado) {
		return daoActaEntrega.listaActaEntregaXEstado(estado);
	}
}
