package net.ncdevice.interfaces;

import java.util.List;

import net.ncdevice.entidad.Contrato;
import net.ncdevice.entidad.EquipoTrabajo;

public interface ContratoDAO {
	public int insertContrato(Contrato bean,List<EquipoTrabajo> lista);
	public int updateContrato(Contrato bean);
	public int deleteContrato(String cod);
	public int insertEquipoTrabajo(List<EquipoTrabajo> lista);
	public String generaCodigo();
	public List<Contrato> listaContrato();
	public List<Contrato> listaContratoXCodigo(String cod);
	public List<EquipoTrabajo> listaEquipoAtContrato(String codigo);
	public List<EquipoTrabajo> listaTrabajosPendientesxObrero(String codigo);
	public Contrato findContrato(String cod);
	public int cambiaEstado(Contrato bean);
	public List<Contrato> listaXEstado(String estado);
	public List<Contrato> listaContratoXUsuarioYEstados(Contrato bean);
	
}
