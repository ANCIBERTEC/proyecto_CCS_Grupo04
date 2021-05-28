package net.ncdevice.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import net.ncdevice.entidad.Region;
import net.ncdevice.interfaces.RegionDAO;
import net.ncdevice.utils.MySqlBDConexion;

public class MySqlRegionDAO implements RegionDAO {

	@Override
	public int nuevoRegion(Region bean) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int modificaRegion(Region bean) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int eliminaRegion(int codigo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Region> listaRegion() {
		List<Region> lista=new ArrayList<Region>();
		Region bean=null;
		Connection cn=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		try {
			cn=MySqlBDConexion.getConexion();
			String sql="select *from region order by nombre asc";
			pstm=cn.prepareStatement(sql);
			rs=pstm.executeQuery();
			while(rs.next()) {
				bean=new Region();
				bean.setIdregion(rs.getInt(1));
				bean.setNombre(rs.getString(2));
				lista.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				if(rs!=null) rs.close();
				if(pstm!=null) pstm.close();
				if(cn!=null) cn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return lista;
	}

	@Override
	public Region buscarRegionXID(int cod) {
		// TODO Auto-generated method stub
		return null;
	}

}
