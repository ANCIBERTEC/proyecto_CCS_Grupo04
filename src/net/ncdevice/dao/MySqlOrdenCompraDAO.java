package net.ncdevice.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import net.ncdevice.entidad.DetalleCompraMateriales;
import net.ncdevice.entidad.Documento;
import net.ncdevice.entidad.OrdenCompra;
import net.ncdevice.interfaces.OrdenCompraDAO;
import net.ncdevice.utils.MySqlFactory;

public class MySqlOrdenCompraDAO implements OrdenCompraDAO {
	private SqlSessionFactory factory;
	
	public MySqlOrdenCompraDAO() {
		factory=MySqlFactory.getSqlSessionFactory();
	}
	@Override
	public int insertOrdenCompra(OrdenCompra bean,List<DetalleCompraMateriales> lista) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateOrdenCompra(OrdenCompra bean) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteOrdenCompra(String cod) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public String generaCodigo() {
		Documento bean=new Documento();
		SqlSession session=factory.openSession();
		try {
			bean=(Documento)session.selectOne("SQL_GenerarCodigoOrdenCompra");
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return bean.getIddocumento();
	}

	@Override
	public List<OrdenCompra> listaOrdenCompra() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public OrdenCompra findOrdenCompra(String cod) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int cambiaEstado(OrdenCompra bean) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<OrdenCompra> listaXEstado(String estado) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<OrdenCompra> listaOrdenXUsuarioYEstados(String idusuario) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<DetalleCompraMateriales> listaMateriales(String idcomrpa) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public DetalleCompraMateriales buscaCompraMateriales(String idcompra) {
		// TODO Auto-generated method stub
		return null;
	}

}
