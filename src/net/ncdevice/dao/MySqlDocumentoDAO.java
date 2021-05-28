package net.ncdevice.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import net.ncdevice.entidad.DetalleContratoDocs;
import net.ncdevice.entidad.DetalleVisitDoc;
import net.ncdevice.entidad.Documento;
import net.ncdevice.entidad.HistorialDocsEstado;
import net.ncdevice.interfaces.DocumentoDAO;
import net.ncdevice.utils.MySqlFactory;

public class MySqlDocumentoDAO implements DocumentoDAO {

	private SqlSessionFactory factory;
	
	public MySqlDocumentoDAO() {
		factory=MySqlFactory.getSqlSessionFactory();
	}
	@Override
	public int insertDocumento(Documento bean) {
		int estado=-1;
		SqlSession session=factory.openSession();
		try {
			estado=session.insert("SQL_addDocumento",bean);
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
	public int updateDocumento(Documento bean) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteDocumento(String cod) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public String generaCodigo() {
		Documento bean=new Documento();
		SqlSession session=factory.openSession();
		try {
			bean=(Documento)session.selectOne("SQL_GenerarCodigoDocumento");
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return bean.getIddocumento();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Documento> listaDocumento() {
		List<Documento> lista=new ArrayList<Documento>();
		SqlSession session=factory.openSession();
		try {
			lista=session.selectList("SQL_listaAllDocumento");
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				session.close();
		}
		return lista;
	}

	@Override
	public Documento findDocumento(String cod) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Documento findUltDocumento() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int cambiaEstado(Documento bean) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Documento> listarDocumentoXEmisor(String cod) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<HistorialDocsEstado> listaHistorialEstado(String documento) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public HistorialDocsEstado buscaHistorialEstado(String documento) {
		// TODO Auto-generated method stub
		return null;
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<Documento> listarDocumentoXTipo(String tipo) {
		List<Documento> lista=new ArrayList<Documento>();
		SqlSession session=factory.openSession();
		try {
			lista=session.selectList("SQL_listaDocumentoAtTipo",tipo);
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				session.close();
		}
		return lista;
	}
	@Override
	public Documento findFotoDocumento(String codigo) {
		Documento bean=new Documento();
		SqlSession session=factory.openSession();
		try {
			bean=(Documento)session.selectOne("SQL_FotoDocumento",codigo);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return bean;
	}
	@Override
	public int insertDocumentoYFoto(Documento bean) {
		int estado=-1;
		SqlSession session=factory.openSession();
		try {
			estado=session.insert("SQL_addDocumentoYFoto",bean);
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
	public int insertDetalleVisitaDoc(Documento bean, DetalleVisitDoc docs) {
		int estado=-1;
		SqlSession session=factory.openSession();
		try {
			estado=session.insert("SQL_addDocumentoYFoto",bean);
			estado=session.insert("SQL_addDetalleVisitaDocs",docs);
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
	public int insertDetalleContratoDoc(Documento bean, DetalleContratoDocs doc) {
		int estado=-1;
		SqlSession session=factory.openSession();
		try {
			estado=session.insert("SQL_addDocumentoYFoto",bean);
			estado=session.insert("SQL_addDetalleContratoDoc",doc);
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
	public int cantidadDocsRecibidosAtUsuario(String codigo) {
		Documento bean=new Documento();
		SqlSession session=factory.openSession();
		try {
			bean=(Documento)session.selectOne("SQL_CantidadDocsRecAtUser",codigo);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		}finally {
			session.close();
		}
		
		return bean.getCantNotificaciones();
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<Documento> listaDocsAtVisita(int codigo) {
		List<Documento> lista=new ArrayList<Documento>();
		SqlSession session=factory.openSession();
		try {
			lista=session.selectList("SQL_listaDocsAtVisita",codigo);
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				session.close();
		}
		return lista;
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<Documento> listaDocsAtContrato(String codigo) {
		List<Documento> lista=new ArrayList<Documento>();
		SqlSession session=factory.openSession();
		try {
			lista=session.selectList("SQL_listaDocsAtContrato",codigo);
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				session.close();
		}
		return lista;
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<Documento> listarDocumentoRecibidos(String cod) {
		List<Documento> lista=new ArrayList<Documento>();
		SqlSession session=factory.openSession();
		try {
			lista=session.selectList("SQL_listaDocumentoPendietes",cod);
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				session.close();
		}
		return lista;
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<Documento> listaHistorialDocs() {
		List<Documento> lista=new ArrayList<Documento>();
		SqlSession session=factory.openSession();
		try {
			lista=session.selectList("SQL_ListaHistorialDocs");
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				session.close();
		}
		return lista;
	}

}
