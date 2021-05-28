package net.ncdevice.service;

import java.util.List;

import net.ncdevice.dao.MySqlUsuarioDAO;
import net.ncdevice.entidad.Documento;
import net.ncdevice.entidad.Menu;
import net.ncdevice.entidad.Usuario;

public class UsuarioService {
	MySqlUsuarioDAO usuarioDAO;
	
	public UsuarioService() {
		usuarioDAO=new MySqlUsuarioDAO();
	}
	
	public int nuevoUsuario(Usuario bean) {
		return usuarioDAO.nuevoUsuario(bean);
	}
	public int cambiarClave(Usuario bean) {
		return usuarioDAO.cambiarClave(bean);
	}
	public int modificaUsuario(Usuario bean){
		return usuarioDAO.modificaUsuario(bean);
	}
	public int eliminaUsuario(String codigo){
		return usuarioDAO.eliminaUsuario(codigo);
	}
	public String generaCodigo(int tipo){
		return usuarioDAO.generaCodigo(tipo);
	}
	public List<Usuario> listaUsuario(){
		return usuarioDAO.listaUsuario();
	}
	public List<Usuario> listaComboUsuario() {
		return usuarioDAO.listaComboUsuario();
	}
	public List<Usuario> listaUsuarioXTipo(int i){
		return usuarioDAO.listaUsuarioXTipo(i);
	}
	public List<Usuario> listaTrabajadores(){
		return usuarioDAO.listaTrabajadores();
	}
	public Usuario buscarUsuarioXID(String cod){
		return usuarioDAO.buscarUsuarioXID(cod);
	}
	public Usuario buscarSubgerenteArea(String codA){
		return usuarioDAO.buscarSubgerenteArea(codA);
	}
	public Usuario buscarUsuarioXName(String nombre){
		return usuarioDAO.buscarUsuarioXName(nombre);
	}
	public List<Usuario> listaPersonalAdministrativo(){
		return usuarioDAO.listaPersonalAdministrativo();
	}
	public List<Usuario> listaPersonalObrero() {
		return usuarioDAO.listaPersonalObrero();
	}
	public List<Menu> listarMenuAtTipo(String tipo) {
		return usuarioDAO.listarMenuAtTipo(tipo);
	}
	/*
	public Usuario iniciarSesion(String cod,String clave){
		return usuarioDAO.iniciarSesion(cod, clave);
	}*/
	public List<Usuario> listarTecnicoEspecialista(){
		return usuarioDAO.listarTecnicoEspecialista();
	}
	public List<Documento> listarDocumentoXUsuario(String cod){
		return usuarioDAO.listarDocumentoXUsuario(cod);
	}
	public List<Menu> listarMenuUsuario(String idUser){
		return usuarioDAO.listarMenuUsuario(idUser);
	}
	public List<Menu> listarSubMenuUsuario(String tipo,String idUser){
		return usuarioDAO.listarSubMenuUsuario(tipo, idUser);
	}
	
	public Usuario iniciarSesion(Usuario bean) {
		return usuarioDAO.iniciarSesion(bean);
	}
	public List<Usuario> listaTrabajadoresXCargo(int cargo){
		return usuarioDAO.listaTrabajadoresXCargo(cargo);
	}
}
