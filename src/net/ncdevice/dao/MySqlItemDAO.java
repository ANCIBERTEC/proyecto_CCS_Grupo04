package net.ncdevice.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import net.ncdevice.entidad.Item;
import net.ncdevice.interfaces.ItemDAO;
import net.ncdevice.utils.MySqlFactory;

public class MySqlItemDAO implements ItemDAO {
	
	private SqlSessionFactory factory;
	public MySqlItemDAO() {
		factory=MySqlFactory.getSqlSessionFactory();
	}
	@Override
	public int nuevoItem(Item bean) {
		int estado=-1;
		SqlSession session=factory.openSession();
		try {
			estado=session.insert("SQL_addItem",bean);
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
	public int modificaItem(Item bean) {
		int estado=-1;
		SqlSession session=factory.openSession();
		try {
			estado=session.update("SQL_updateItem",bean);
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
	public int eliminaItem(int codigo) {
		int estado=-1;
		SqlSession session=factory.openSession();
		try {
			estado=session.delete("SQL_deleteItem",codigo);
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
	public List<Item> listaItem() {
		List<Item> lista=new ArrayList<Item>();
		SqlSession session=factory.openSession();
		try {
			lista=session.selectList("SQL_listarItems");
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return lista;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Item> listaItemXName(String nombre) {
		List<Item> lista=new ArrayList<Item>();
		SqlSession session=factory.openSession();
		try {
			lista=session.selectList("SQL_ListarItemsAtName",nombre);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return lista;
	}

	@Override
	public Item buscarItemXID(String cod) {
		Item bean=new Item();
		SqlSession session=factory.openSession();
		try {
			bean=(Item)session.selectOne("SQL_buscaItemXCodigo",cod);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return bean;
	}

	@Override
	public Item buscarItemXName(String nombre) {
		// TODO Auto-generated method stub
		return null;
	}

}
