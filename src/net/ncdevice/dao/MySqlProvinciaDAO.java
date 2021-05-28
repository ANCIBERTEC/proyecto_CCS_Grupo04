package net.ncdevice.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import net.ncdevice.entidad.Provincia;
import net.ncdevice.entidad.Region;
import net.ncdevice.interfaces.ProvinciaDAO;
import net.ncdevice.utils.MySqlBDConexion;

public class MySqlProvinciaDAO implements ProvinciaDAO {

	@Override
	public int nuevoProvincia(Provincia bean) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int modificaProvincia(Provincia bean) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int eliminaProvincia(int codigo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Provincia> listaProvincia() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Provincia> listaProvXRegion(int region) {
		List<Provincia> lista=new ArrayList<Provincia>();
		Provincia bean=null;
		Region reg=null;
		Connection cn=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		try {
			cn=MySqlBDConexion.getConexion();
			String sql="select p.*,r.nombre from provincia p join region r on r.idregion=p.idregion where p.idregion=? order by p.nombre asc";
			pstm=cn.prepareStatement(sql);
			pstm.setInt(1, region);
			rs=pstm.executeQuery();
			while(rs.next()) {
				bean=new Provincia();
				reg=new Region();
				bean.setIdprovincia(rs.getInt(1));
				bean.setNombre(rs.getString(2));
				reg.setIdregion(rs.getInt(3));
				reg.setNombre(rs.getString(4));
				bean.setRegion(reg);
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
	public Provincia buscarProvinciaoXID(int cod) {
		// TODO Auto-generated method stub
		return null;
	}

}
