package net.ncdevice.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import net.ncdevice.entidad.Distrito;
import net.ncdevice.entidad.Provincia;
import net.ncdevice.entidad.Region;
import net.ncdevice.interfaces.LocalizacionDAO;
import net.ncdevice.utils.MySqlFactory;

public class MySqlLocalizacionDAO implements LocalizacionDAO{
	SqlSessionFactory factory;
	
	public MySqlLocalizacionDAO() {
		factory=MySqlFactory.getSqlSessionFactory();
	}
		
	@SuppressWarnings("unchecked")
	@Override
	public List<Distrito> listaDistrito() {
		List<Distrito> lista=new ArrayList<Distrito>();
		SqlSession session=factory.openSession();
		try {
			lista=session.selectList("");
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return lista;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Distrito> listaDistritoXProvincia(int prov) {
		List<Distrito> lista=new ArrayList<Distrito>();
		SqlSession session=factory.openSession();
		try {
			lista=session.selectList("SQL_listaDistritoXProvincia",prov);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return lista;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Provincia> listaProvincia() {
		List<Provincia> lista=new ArrayList<Provincia>();
		SqlSession session=factory.openSession();
		try {
			lista=session.selectList("");
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return lista;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Provincia> listaProvXRegion(int region) {
		List<Provincia> lista=new ArrayList<Provincia>();
		SqlSession session=factory.openSession();
		try {
			lista=session.selectList("SQL_listaProvinciaXRegion",region);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return lista;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Region> listaRegion() {
		List<Region> lista=new ArrayList<Region>();
		SqlSession session=factory.openSession();
		try {
			lista=session.selectList("SQL_listaAllRegion");
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return lista;
	}
	
}
