package net.ncdevice.interfaces;
import java.util.List;

import net.ncdevice.entidad.Documento;
import net.ncdevice.entidad.Menu;
import net.ncdevice.entidad.Usuario;

public interface UsuarioDAO {
	public int cambiarClave(Usuario bean);
	public int nuevoUsuario(Usuario bean);
	public int modificaUsuario(Usuario bean);
	public int eliminaUsuario(String codigo);
	public String generaCodigo(int tipo);
	public List<Usuario> listaUsuario();
	public List<Usuario> listaComboUsuario();
	public List<Usuario> listaUsuarioXTipo(int i);
	public List<Usuario> listaTrabajadores();
	public Usuario buscarUsuarioXID(String cod);
	public Usuario buscarSubgerenteArea(String codA);
	public Usuario buscarUsuarioXName(String nombre);
	public List<Usuario> listarTecnicoEspecialista();
	public List<Usuario> listaPersonalAdministrativo();
	public List<Usuario> listaPersonalObrero();
	public List<Documento> listarDocumentoXUsuario(String cod);
	public List<Menu> listarMenuUsuario(String idUser);
	public List<Menu> listarSubMenuUsuario(String tipo,String idUser);
	public List<Menu> listarMenuAtTipo(String tipo);
	public List<Usuario> listaUsuarioXCargoYArea(String area,String cargo);
	public List<Usuario> listaTrabajadoresXCargo(int cargo);
	public Usuario iniciarSesion(Usuario bean);
}
