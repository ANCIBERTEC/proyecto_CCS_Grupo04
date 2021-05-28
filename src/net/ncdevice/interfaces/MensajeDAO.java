package net.ncdevice.interfaces;

import java.util.List;

import net.ncdevice.entidad.Mensaje;

public interface MensajeDAO {
	public int insertMensaje(Mensaje bean);
	public int updateMensaje(Mensaje bean);
	public int deleteMensaje(String cod);
	public List<Mensaje> listaMensaje();
	public Mensaje findMensaje(String cod);
	public List<Mensaje> listaMensajeXEmisor(String cod);
	public List<Mensaje> listaMensajeXReceptor(String cod);
	public int cantidadMensajes(int tipo,String cod);
}
