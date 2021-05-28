package net.ncdevice.interfaces;

import java.util.List;

import net.ncdevice.entidad.ActaEntrega;

public interface ActaEntregaDAO {
	public int insertActaEntrega(ActaEntrega bean);
	public int updateActaEntrega(ActaEntrega bean);
	public int deleteActaEntrega(String cod);
	public String generaCodigo();
	public List<ActaEntrega> listaActaEntrega();
	public ActaEntrega findActaEntrega(String cod);
	public int cambiaEstado(ActaEntrega bean);
	public List<ActaEntrega> listaActaEntregaXEstado(String estado);
}
