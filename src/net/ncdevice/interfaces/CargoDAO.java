package net.ncdevice.interfaces;

import java.util.List;

import net.ncdevice.entidad.Cargo;

public interface CargoDAO {
	//sirve para definir m�todos
	public int nuevoCargo(Cargo bean);
	public int modificaCargo(Cargo bean);
	public int eliminaCargo(int codigo);
	public List<Cargo> listaCargo();
	public Cargo findCargoXID(int cod);
	public Cargo findCargoXName(String nombre);
	public List<Cargo> findCargoXArea(int area);
	public int mantenerCargo(Cargo bean);
	public List<Cargo> listaEspecialidades();
}
