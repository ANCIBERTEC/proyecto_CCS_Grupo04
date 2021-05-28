package net.ncdevice.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import net.ncdevice.entidad.ActaEntrega;
import net.ncdevice.entidad.Documento;
import net.ncdevice.interfaces.ActaEntregaDAO;
import net.ncdevice.utils.MySqlFactory;

public class MySqlActaEntregaDAO implements ActaEntregaDAO {
	private SqlSessionFactory factory;
	
	public MySqlActaEntregaDAO() {
		factory=MySqlFactory.getSqlSessionFactory();
	}
	@Override
	public int insertActaEntrega(ActaEntrega bean) {
		int estado=-1;
		SqlSession session=factory.openSession();
		try {
			estado=session.insert("SQL_addActaEntrega",bean);
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
	public int updateActaEntrega(ActaEntrega bean) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteActaEntrega(String cod) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public String generaCodigo() {
		Documento bean=new Documento();
		SqlSession session=factory.openSession();
		try {
			bean=(Documento)session.selectOne("SQL_GenerarCodigoActaEntrega");
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return bean.getIddocumento();
	}

	@Override
	public List<ActaEntrega> listaActaEntrega() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ActaEntrega findActaEntrega(String cod) {
		ActaEntrega bean=new ActaEntrega();
		SqlSession session=factory.openSession();
		try {
			bean=(ActaEntrega)session.selectOne("SQL_buscarActaEntregaXCodigo",cod);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return bean;
	}

	@Override
	public int cambiaEstado(ActaEntrega bean) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<ActaEntrega> listaActaEntregaXEstado(String estado) {
		// TODO Auto-generated method stub
		return null;
	}

}
