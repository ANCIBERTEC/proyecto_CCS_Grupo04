package net.ncdevice.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import net.ncdevice.entidad.Proveedor;
import net.ncdevice.interfaces.ProveedorDAO;
import net.ncdevice.utils.MySqlFactory;

public class MySqlProveedorDAO implements ProveedorDAO {
	
	SqlSessionFactory factory;
	
	public MySqlProveedorDAO() {
		factory=MySqlFactory.getSqlSessionFactory();
	}
	
	@Override
	public int nuevoProveedor(Proveedor bean) {
		int estado=-1;
		
		return estado;
	}

	@Override
	public int modificaProveedor(Proveedor bean) {
		int estado=-1;
		
		return estado;
	}

	@Override
	public int eliminaProveedor(int codigo) {
		int estado=-1;
		SqlSession session=factory.openSession();
		try {
			estado=session.delete("SQL_deleteProveedor",codigo);
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
	public List<Proveedor> listaProveedor() {
		List<Proveedor> lista=new ArrayList<Proveedor>();
		SqlSession session=factory.openSession();
		try {
			lista=session.selectList("SQL_listarProveedor");
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			session.close();
		}
		return lista;
	}

	@Override
	public Proveedor buscarProveedorXID(int cod) {
		Proveedor bean=new Proveedor();
		SqlSession session=factory.openSession();
		try {
			bean=(Proveedor)session.selectOne("SQL_buscarProveedorXCodigo",cod);
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			session.close();
		}
		return bean;
	}

	@Override
	public Proveedor buscarProveedorXName(String nombre) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int manteProveedor(Proveedor bean) {
		int estado=-1;
		SqlSession session=factory.openSession();
		try {
			estado=session.insert("SQL_manteProveedor",bean);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		}finally {
			session.close();
		}
		return estado;
	}

}
