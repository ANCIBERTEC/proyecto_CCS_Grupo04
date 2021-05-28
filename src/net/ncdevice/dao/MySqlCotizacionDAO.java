package net.ncdevice.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import net.ncdevice.entidad.Cotizacion;
import net.ncdevice.entidad.DetalleCotizacion;
import net.ncdevice.entidad.Documento;
import net.ncdevice.interfaces.CotizacionDAO;
import net.ncdevice.utils.MySqlFactory;

public class MySqlCotizacionDAO implements CotizacionDAO {
	
	
	private SqlSessionFactory factory;
	
	public MySqlCotizacionDAO() {
		factory=MySqlFactory.getSqlSessionFactory();
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Cotizacion> listaCotizacion() {
		List<Cotizacion> lista=new ArrayList<Cotizacion>();
		SqlSession session=factory.openSession();
		try {
			lista=session.selectList("SQl_ListaAllCotizacion");
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			session.close();
		}
		return lista;
	}

	@Override
	public int insertCotizacion(Cotizacion bean) {
		int estado=-1,estado2=-1;
		SqlSession session=factory.openSession();
		try {
			estado=session.insert("SQL_RegistraCotizacion",bean);
			for(DetalleCotizacion det:bean.getDetalle()) {
				det.setCotizacion(bean);
				estado2=session.insert("SQL_RegistraDetalleCotizacion",det);
			}
			estado=estado2;
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
	public int updateCotizacion(Cotizacion bean) {
			int estado=-1;
			SqlSession session=factory.openSession();
			try {
				estado=session.insert("SQL_ActualizaCotizacion",bean);
				session.commit();
			} catch (Exception e) {
				e.printStackTrace();
				session.rollback();
			}finally {
				session.close();
			}
			return estado;
	}

	public Cotizacion findCotizacionXCodigo(String codigo) {
		Cotizacion bean=new Cotizacion();
		SqlSession session=factory.openSession();
		try {
			bean=(Cotizacion)session.selectOne("SQL_BuscaCotizacionXCodigo",codigo);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return bean;
	}

	@Override
	public int deleteCotizacion(String cod) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public String generaCodigo() {
		Documento bean=new Documento();
		SqlSession session=factory.openSession();
		try {
			bean=(Documento)session.selectOne("SQL_GenerarCodigoCotizacion");
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return bean.getIddocumento();
	}

	@Override
	public int cambiaEstado(Cotizacion bean) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Cotizacion> listaCotizacionXEstado(String estado) {
		// TODO Auto-generated method stub
		return null;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Cotizacion> listaCotizacionXUsuario(String idusuario) {
		List<Cotizacion> lista=new ArrayList<Cotizacion>();
		SqlSession session=factory.openSession();
		try {
			lista=session.selectList("SQl_ListaCotizacionAtUsuario",idusuario);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return lista;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Cotizacion> listaCotizacionXUsuarioYEstados(Cotizacion bean) {
		List<Cotizacion> lista=new ArrayList<Cotizacion>();
		SqlSession session=factory.openSession();
		try {
			lista=session.selectList("SQl_ListaCotizacionAtEstado",bean);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return lista;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<DetalleCotizacion> listaDetalleCotizacion(String idcotizacion) {
		List<DetalleCotizacion> lista=new ArrayList<DetalleCotizacion>();
		SqlSession session=factory.openSession();
		try {
			lista=session.selectList("SQl_ListaDetalleCotizacion",idcotizacion);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return lista;
	}

	@Override
	public DetalleCotizacion buscaDetalleCotizacion(String idcotizacion) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int actualizaDetalleCotizacion(Cotizacion bean, List<DetalleCotizacion> lista) {
		int estado=-1;
		SqlSession session=factory.openSession();
		try {
			estado=session.update("SQL_ActualizaCotizacion",bean);
			for(DetalleCotizacion det:lista) {
				det.setCotizacion(bean);
				estado=session.insert("SQL_RegistraDetalleCotizacion",det);
			}
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
