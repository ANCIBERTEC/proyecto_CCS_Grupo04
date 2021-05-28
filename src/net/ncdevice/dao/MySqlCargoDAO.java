package net.ncdevice.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import net.ncdevice.entidad.Cargo;
import net.ncdevice.interfaces.CargoDAO;
import net.ncdevice.utils.MySqlFactory;

public class MySqlCargoDAO implements CargoDAO {
	private SqlSessionFactory factory;
	public MySqlCargoDAO() {
		factory=MySqlFactory.getSqlSessionFactory();
	}
	
	
	@Override
	public int nuevoCargo(Cargo bean) {
		return 0;
	}

	@Override
	public int modificaCargo(Cargo bean) {
		
		return 0;
	}

	@Override
	public int eliminaCargo(int codigo) {
		int estado=-1;
		SqlSession session=factory.openSession();
		try {
			estado=session.delete("SQL_deleteCargo",codigo);
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
	public List<Cargo> listaCargo() {
		List<Cargo> lista=new ArrayList<Cargo>();
		SqlSession session=factory.openSession();
		try {
			lista=session.selectList("SQL_listarAllCargo");			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return lista;
	}

	@Override
	public Cargo findCargoXID(int cod) {
		Cargo bean=new Cargo();;
		SqlSession session=factory.openSession();
		try {
			bean=(Cargo)session.selectOne("SQL_buscarCargoXCodigo",cod);			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return bean;
	}

	@Override
	public Cargo findCargoXName(String nombre) {
		// TODO Auto-generated method stub
		return null;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Cargo> findCargoXArea(int area) {
		List<Cargo> lista=new ArrayList<Cargo>();
		SqlSession session=factory.openSession();
		try {
			lista=session.selectList("SQL_listaCargoXArea",area);			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return lista;
	}

	@Override
	public int mantenerCargo(Cargo bean) {
		int estado=-1;
		SqlSession session=factory.openSession();
		try {
			estado=session.delete("SQL_manteCargo",bean);
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
	public List<Cargo> listaEspecialidades() {
		List<Cargo> lista=new ArrayList<Cargo>();
		SqlSession session=factory.openSession();
		try {
			lista=session.selectList("SQL_listarEspecialidades");			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return lista;
	}

}
