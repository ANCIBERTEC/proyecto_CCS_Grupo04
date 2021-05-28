package net.ncdevice.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import net.ncdevice.entidad.DetalleVisitDoc;
import net.ncdevice.entidad.VisitaTecnica;
import net.ncdevice.interfaces.VisitaTecnicaDAO;
import net.ncdevice.utils.MySqlFactory;

public class MySqlVisitaTecnicaDAO implements VisitaTecnicaDAO {
	private SqlSessionFactory factory;
	public MySqlVisitaTecnicaDAO() {
		factory=MySqlFactory.getSqlSessionFactory();
	}
	@Override
	public int insertVisitaTecnica(VisitaTecnica bean) {
		int estado=-1;
		SqlSession session=factory.openSession();
		try {
			estado=session.insert("SQL_addVisitaTecnica",bean);
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
	public int updateVisitaTecnica(VisitaTecnica bean) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteVisitaTecnica(String cod) {
		// TODO Auto-generated method stub
		return 0;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<VisitaTecnica> listaVisitaTecnica() {
		List<VisitaTecnica> lista=new ArrayList<VisitaTecnica>();
		SqlSession session=factory.openSession();
		try {
			lista=session.selectList("SQL_listarVisita");
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				session.close();
		}
		return lista;
	}

	@Override
	public VisitaTecnica findVisitaTecnica(String cod) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int cambiaEstado(VisitaTecnica bean) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<VisitaTecnica> listaVisitaTecnicaXEstado(String estado) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<VisitaTecnica> listaVisitaTecnicaXUsuario(String idusuario) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<VisitaTecnica> listaVisitaTecnicaXUsuarioYEstados(String idusuario) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<DetalleVisitDoc> listaDocumentosVisita(String idvisita) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public DetalleVisitDoc buscaDocumentosVisita(String idvisita) {
		// TODO Auto-generated method stub
		return null;
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<VisitaTecnica> listaVisitaPendientesxObrero(String codigo) {
		List<VisitaTecnica> lista=new ArrayList<VisitaTecnica>();
		SqlSession session=factory.openSession();
		try {
			lista=session.selectList("SQL_visitasPendientesXObrero", codigo);
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				session.close();
		}
		return lista;
	}

}
