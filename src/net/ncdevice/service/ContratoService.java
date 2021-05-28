package net.ncdevice.service;

import java.util.List;

import net.ncdevice.dao.MySqlContratoDAO;
import net.ncdevice.entidad.Contrato;
import net.ncdevice.entidad.EquipoTrabajo;

public class ContratoService {
	
	MySqlContratoDAO daoContrato;
	public ContratoService() {
		daoContrato=new MySqlContratoDAO();
	}
	
	
	public int insertContrato(Contrato bean,List<EquipoTrabajo>lista) {
		return daoContrato.insertContrato(bean,lista);
	}
	public int insertEquipoTrabajo(List<EquipoTrabajo> lista) {
		return daoContrato.insertEquipoTrabajo(lista);
	}
	public int updateContrato(Contrato bean){
		return daoContrato.updateContrato(bean);
	}
	public int deleteContrato(String cod){
		return daoContrato.deleteContrato(cod);
	}
	public String generaCodigo(){
		return daoContrato.generaCodigo();
	}
	public List<Contrato> listaContratoXCodigo(String cod){
		return daoContrato.listaContratoXCodigo(cod);
	}
	public List<Contrato> listaContrato(){
		return daoContrato.listaContrato();
	}
	public List<EquipoTrabajo> listaEquipoAtContrato(String codigo) {
		return daoContrato.listaEquipoAtContrato(codigo);
	}
	public Contrato findContrato(String cod){
		return daoContrato.findContrato(cod);
	}
	public int cambiaEstado(Contrato bean){
		return daoContrato.cambiaEstado(bean);
	}
	public List<Contrato> listaXEstado(String estado){
		return daoContrato.listaXEstado(estado);
	}
	public List<Contrato> listaContratoXUsuarioYEstados(Contrato bean){
		return daoContrato.listaContratoXUsuarioYEstados(bean);
	}
	public List<EquipoTrabajo> listaTrabajosPendientesxObrero(String codigo) {
		return daoContrato.listaTrabajosPendientesxObrero(codigo);
	}
}
