package net.ncdevice.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import net.ncdevice.entidad.Contrato;
import net.ncdevice.entidad.Documento;
import net.ncdevice.entidad.EquipoTrabajo;
import net.ncdevice.interfaces.ContratoDAO;
import net.ncdevice.utils.MySqlFactory;

public class MySqlContratoDAO implements ContratoDAO {

	private SqlSessionFactory factory;
	
	public MySqlContratoDAO() {
		factory=MySqlFactory.getSqlSessionFactory();
	}
	
	@Override
	public int insertContrato(Contrato bean,List<EquipoTrabajo> lista) {
		int estado=-1;
		SqlSession session=factory.openSession();
		try {
			estado=session.insert("SQL_RegistraContrato",bean);
			if(lista!=null) {
				for(EquipoTrabajo det:lista) {
					det.setIdcontrato(bean.getIddocumento());
					estado=session.insert("SQL_RegistraEquipoTrabajo",det);
				}
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

	@Override
	public int updateContrato(Contrato bean) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteContrato(String cod) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public String generaCodigo() {
		Documento bean=new Documento();
		SqlSession session=factory.openSession();
		try {
			bean=(Documento)session.selectOne("SQL_GenerarCodigoContrato");
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return bean.getIddocumento();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Contrato> listaContrato() {
		List<Contrato> lista=new ArrayList<Contrato>();
		SqlSession session=factory.openSession();
		try {
			lista=session.selectList("SQL_ListaAllContratos");
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return lista;
	}

	@Override
	public Contrato findContrato(String cod) {
		Contrato bean=new Contrato();
		SqlSession session=factory.openSession();
		try {
			bean=(Contrato)session.selectOne("SQL_BuscaContratoXCodigo",cod);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return bean;
	}

	@Override
	public int cambiaEstado(Contrato bean) {
		// TODO Auto-generated method stub
		return 0;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Contrato> listaContratoXCodigo(String cod) {
		List<Contrato> lista=new ArrayList<Contrato>();
		SqlSession session=factory.openSession();
		try {
			lista=session.selectList("SQL_ListaContratoXCodigo",cod);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return lista;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Contrato> listaContratoXUsuarioYEstados(Contrato bean) {
		List<Contrato> lista=new ArrayList<Contrato>();
		SqlSession session=factory.openSession();
		try {
			lista=session.selectList("SQl_ListaContratonAtEstado",bean);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return lista;
	}

	@Override
	public int insertEquipoTrabajo(List<EquipoTrabajo> lista) {
		int estado=-1;
		SqlSession session=factory.openSession();
		try {
			for(EquipoTrabajo det:lista) {
				estado=session.insert("SQL_RegistraEquipoTrabajo",det);
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

	@SuppressWarnings("unchecked")
	@Override
	public List<EquipoTrabajo> listaEquipoAtContrato(String codigo) {
		List<EquipoTrabajo> lista=new ArrayList<EquipoTrabajo>();
		SqlSession session=factory.openSession();
		try {
			lista=session.selectList("SQl_ListaEquipoAtContrato",codigo);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return lista;
	}

	@Override
	public List<Contrato> listaXEstado(String estado) {
		// TODO Auto-generated method stub
		return null;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<EquipoTrabajo> listaTrabajosPendientesxObrero(String codigo) {
		List<EquipoTrabajo> lista=new ArrayList<EquipoTrabajo>();
		SqlSession session=factory.openSession();
		try {
			lista=session.selectList("SQL_TrabajosPendientesXObrero",codigo);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return lista;
	}

}
