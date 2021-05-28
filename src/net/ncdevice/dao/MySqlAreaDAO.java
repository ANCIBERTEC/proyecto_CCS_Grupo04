package net.ncdevice.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import net.ncdevice.entidad.Area;
import net.ncdevice.interfaces.AreaDAO;
import net.ncdevice.utils.MySqlFactory;

public class MySqlAreaDAO implements AreaDAO {
	private SqlSessionFactory factory;
	public MySqlAreaDAO() {
		factory=MySqlFactory.getSqlSessionFactory();
	}
	
	
	@Override
	public int nuevoArea(Area bean) {
		int estado=-1;
		SqlSession session=factory.openSession();
		try {
			estado=session.insert("SQL_addArea",bean);
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
	public int modificaArea(Area bean) {
		int estado=-1;
		SqlSession session=factory.openSession();
		try {
			estado=session.update("SQL_updateArea",bean);
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
	public int eliminaArea(int codigo) {
		int estado=-1;
		SqlSession session=factory.openSession();
		try {
			estado=session.delete("SQL_deleteArea",codigo);
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
	public List<Area> listaArea() {
		List<Area> lista=new ArrayList<Area>();
		SqlSession session=factory.openSession();
		try {
			lista=session.selectList("SQL_listarArea");
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		}finally {
			session.close();
		}
		return lista;
	}


	@Override
	public Area buscarAreaXName(String nombre) {
		Area bean=new Area();
		SqlSession session=factory.openSession();
		try {
			bean=(Area) session.selectOne("");
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		}finally {
			session.close();
		}
		return bean;
	}

	@Override
	public Area buscarAreaXID(int cod) {
		Area bean=new Area();
		SqlSession session=factory.openSession();
		try {
			bean=(Area) session.selectOne("SQL_buscarAreaXCodigo",cod);
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		}finally {
			session.close();
		}
		return bean;
	}

}
