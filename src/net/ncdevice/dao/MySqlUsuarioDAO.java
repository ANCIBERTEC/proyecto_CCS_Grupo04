package net.ncdevice.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import net.ncdevice.entidad.Documento;
import net.ncdevice.entidad.Menu;
import net.ncdevice.entidad.Usuario;
import net.ncdevice.interfaces.UsuarioDAO;
import net.ncdevice.utils.MySqlFactory;

public class MySqlUsuarioDAO implements UsuarioDAO {

	private SqlSessionFactory factory;
	public MySqlUsuarioDAO(){
		factory=MySqlFactory.getSqlSessionFactory();
	}
	@Override
	public int cambiarClave(Usuario bean) {
		int estado=-1;
		SqlSession session=factory.openSession();
		try {
			estado=session.update("SQL_ActualizarPassword",bean);
			session.commit();
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		}
		finally{
			session.close();
		}
		return estado;
	}

	@Override
	public int nuevoUsuario(Usuario bean) {
		int estado=-1;
		SqlSession session=factory.openSession();
		try {
			estado=session.insert("SQL_registrarUsuario",bean);
			session.commit();
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		}
		finally {
			session.close();
		}
		return estado;
	}
	@Override
	public int modificaUsuario(Usuario bean) {
		int estado=-1;
		SqlSession session=factory.openSession();
		try {
			estado=session.update("SQL_ActualizarUsuario",bean);
			session.commit();
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		}
		finally{
			session.close();
		}
		return estado;
	}

	@Override
	public int eliminaUsuario(String codigo) {
		int estado=-1;
		SqlSession session=factory.openSession();
		try {
			estado=session.delete("SQL_DeleteUsuario",codigo);
			session.commit();
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		}
		finally{
			session.close();
		}
		return estado;
	}

	@Override
	public String generaCodigo(int tipo) {
		String codigo=null;
		SqlSession session=factory.openSession();
		try {
			codigo=(String)session.selectOne("SQl_GeneraCodigoUsuario",tipo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			session.close();
		}
		return codigo;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Usuario> listaUsuario() {
		List<Usuario> lista=new ArrayList<Usuario>();
		SqlSession session=factory.openSession();
		try {
			lista=session.selectList("SQl_ListUsuarios");
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			session.close();
		}
		return lista;
	}

	@Override
	public List<Usuario> listaUsuarioXTipo(int i) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Usuario> listaTrabajadores() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Usuario buscarUsuarioXID(String cod) {
		Usuario bean=null;
		SqlSession session=factory.openSession();
		try {
			bean=(Usuario) session.selectOne("SQL_FindUsuario",cod);
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally{
			session.close();
		}
		return bean;
	}

	@Override
	public Usuario buscarSubgerenteArea(String codA) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Usuario buscarUsuarioXName(String nombre) {
		// TODO Auto-generated method stub
		return null;
	}
/*
	@Override
	public Usuario iniciarSesion(String cod, String clave) {
		// TODO Auto-generated method stub
		return null;
	}*/

	@SuppressWarnings("unchecked")
	@Override
	public List<Usuario> listarTecnicoEspecialista() {
		List<Usuario> lista=new ArrayList<Usuario>();
		SqlSession session=factory.openSession();
		try {
			lista=session.selectList("SQl_ListObreros");
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return lista;
	}

	@Override
	public List<Documento> listarDocumentoXUsuario(String cod) {
		// TODO Auto-generated method stub
		return null;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Menu> listarMenuUsuario(String idUser) {
		List<Menu> lista=new ArrayList<Menu>();
		SqlSession session=factory.openSession();
		try {
			lista=session.selectList("SQL_TraerEnlacesPorUsuario",idUser);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return lista;
	}

	@Override
	public List<Menu> listarSubMenuUsuario(String tipo, String idUser) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Usuario> listaUsuarioXCargoYArea(String area, String cargo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Usuario iniciarSesion(Usuario bean) {
		Usuario obj=null;
		SqlSession session=factory.openSession();
		try {
			obj=(Usuario)session.selectOne("SQL_IniciarSesion",bean);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {	
			session.close();
		}
		return obj;
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<Usuario> listaTrabajadoresXCargo(int cargo) {
		List<Usuario> lista=new ArrayList<Usuario>();
		SqlSession session=factory.openSession();
		try {
			lista=session.selectList("SQl_ListUsuariosXCargo",cargo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			session.close();
		}
		return lista;
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<Usuario> listaPersonalAdministrativo() {
		List<Usuario> lista=new ArrayList<Usuario>();
		SqlSession session=factory.openSession();
		try {
			lista=session.selectList("SQL_listaPersonalAdministrativo");
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			session.close();
		}
		return lista;
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<Usuario> listaPersonalObrero() {
		List<Usuario> lista=new ArrayList<Usuario>();
		SqlSession session=factory.openSession();
		try {
			lista=session.selectList("SQl_ListObreros");
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			session.close();
		}
		return lista;
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<Usuario> listaComboUsuario() {
		List<Usuario> lista=new ArrayList<Usuario>();
		SqlSession session=factory.openSession();
		try {
			lista=session.selectList("SQl_ListCBOUsuarios");
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return lista;
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<Menu> listarMenuAtTipo(String tipo) {
		List<Menu> lista=new ArrayList<Menu>();
		SqlSession session=factory.openSession();
		try {
			lista=session.selectList("SQL_ListaMenuAtTipo",tipo);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return lista;
	}


}
