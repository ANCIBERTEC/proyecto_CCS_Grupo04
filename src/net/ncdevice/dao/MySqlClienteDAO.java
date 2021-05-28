package net.ncdevice.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import net.ncdevice.entidad.Cliente;
import net.ncdevice.interfaces.ClienteDAO;
import net.ncdevice.utils.MySqlFactory;

public class MySqlClienteDAO implements ClienteDAO {
	
	SqlSessionFactory factory;
	
	public MySqlClienteDAO() {
		factory=MySqlFactory.getSqlSessionFactory();
	}
	
	@Override
	public int registraCliente(Cliente bean) {
		int estado=-1;
		SqlSession session=factory.openSession();
		try {
			estado=session.delete("SQL_RegistraCliente",bean);
			session.commit();
		} catch (Exception e) {
			estado=-1;
			e.printStackTrace();
			session.rollback();
		}finally {
			session.close();
		}
		return estado;
	}

	@Override
	public int eliminaCliente(int codigo) {
		int estado=-1;
		SqlSession session=factory.openSession();
		try {
			estado=session.delete("SQL_EliminaCliente",codigo);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		}finally {
			session.close();
		}
		return estado;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Cliente> listaCliente() {
		List<Cliente> lista=new ArrayList<Cliente>();
		SqlSession session=factory.openSession();
		try {
			lista=session.selectList("SQL_ListaClientes");
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return lista;
	}

	@Override
	public Cliente buscarClienteXID(int cod) {
		Cliente bean=new Cliente();
		SqlSession session=factory.openSession();
		try {
			bean=(Cliente)session.selectOne("SQL_BuscaClienteXCodigo",cod);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return bean;
	}


	@Override
	public int modificaCliente(Cliente bean) {
		int estado=-1;
		SqlSession session=factory.openSession();
		try {
			estado=session.insert("SQL_ActualizaCliente",bean);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		}finally {
			session.close();
		}
		return estado;
	}

	@Override
	public List<Cliente> listaClienteXCalificacion(int cal) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Cliente> listaClienteXtipo(String tipo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Cliente buscarClienteXName(String nombre) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int registraClienteJSON(Cliente bean) {
		int estado=-1;
		SqlSession session=factory.openSession();
		try {
			estado=session.delete("SQL_RegistraClienteJSON",bean);
			session.commit();
		} catch (Exception e) {
			estado=-1;
			e.printStackTrace();
			session.rollback();
		}finally {
			session.close();
		}
		return estado;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Cliente> listaAllCliente() {
		List<Cliente> lista=new ArrayList<Cliente>();
		SqlSession session=factory.openSession();
		try {
			lista=session.selectList("SQL_ListaAllClientes");
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return lista;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Cliente> listaClienteXName(String nom) {
		List<Cliente> lista=new ArrayList<Cliente>();
		SqlSession session=factory.openSession();
		try {
			lista=session.selectList("SQL_ListaClienteAtName",nom);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return lista;
	}

	

}
