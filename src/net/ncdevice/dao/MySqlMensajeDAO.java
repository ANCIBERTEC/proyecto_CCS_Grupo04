package net.ncdevice.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import net.ncdevice.entidad.Mensaje;
import net.ncdevice.interfaces.MensajeDAO;
import net.ncdevice.utils.MySqlFactory;

public class MySqlMensajeDAO implements MensajeDAO {
	
private SqlSessionFactory factory;
	
	public MySqlMensajeDAO() {
		factory=MySqlFactory.getSqlSessionFactory();
	}
	@Override
	public int insertMensaje(Mensaje bean) {
		int estado=-1;
		SqlSession session=factory.openSession();
		try {
			estado=session.insert("SQL_registraMensaje",bean);
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
	public int updateMensaje(Mensaje bean) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteMensaje(String cod) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Mensaje> listaMensaje() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Mensaje findMensaje(String cod) {
		// TODO Auto-generated method stub
		return null;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Mensaje> listaMensajeXEmisor(String cod) {
		List<Mensaje> lista=new ArrayList<Mensaje>();
		SqlSession session=factory.openSession();
		try {
			lista=session.selectList("SQL_ListaMensajeEnviados",cod);
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				session.close();
		}
		return lista;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Mensaje> listaMensajeXReceptor(String cod) {
		List<Mensaje> lista=new ArrayList<Mensaje>();
		SqlSession session=factory.openSession();
		try {
			lista=session.selectList("SQL_ListaMensajeRecibidos",cod);
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				session.close();
		}
		return lista;
	}

	@Override
	public int cantidadMensajes(int tipo, String cod) {
		// TODO Auto-generated method stub
		return 0;
	}

}
