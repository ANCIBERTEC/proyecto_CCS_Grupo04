package net.ncdevice.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import net.ncdevice.entidad.Distrito;
import net.ncdevice.entidad.Provincia;
import net.ncdevice.entidad.Region;
import net.ncdevice.interfaces.DistritoDAO;
import net.ncdevice.utils.MySqlBDConexion;

public class MySqlDistritoDAO implements DistritoDAO {

	@Override
	public int nuevoDistrito(Distrito bean) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int modificaDistrito(Distrito bean) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int eliminaDistrito(int codigo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Distrito> listaDistrito() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Distrito buscarDistritoXID(int cod) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Distrito> listaDistritoXProvincia(int prov) {
		List<Distrito> lista=new ArrayList<Distrito>();
		Distrito bean=null;
		Provincia pro=null;
		Region reg=null;
		Connection cn=null;
		PreparedStatement pstm=null;
		ResultSet rs=null;
		try {
			cn=MySqlBDConexion.getConexion();
			String sql="select d.*, p.nombre,r.* from distrito d join provincia p on p.idprovincia=d.idprovincia join region r on r.idregion=p.idregion where d.idprovincia=? order by d.nombre asc";
			pstm=cn.prepareStatement(sql);
			pstm.setInt(1, prov);
			rs=pstm.executeQuery();
			while(rs.next()) {
				bean=new Distrito();
				pro=new Provincia();
				reg=new Region();
				bean.setIddistrito(rs.getInt(1));
				bean.setNombre(rs.getString(2));
				pro.setIdprovincia(rs.getInt(3));
				pro.setNombre(rs.getString(4));
				reg.setIdregion(rs.getInt(5));
				reg.setNombre(rs.getString(6));
				pro.setRegion(reg);
				bean.setProvincia(pro);
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

}
