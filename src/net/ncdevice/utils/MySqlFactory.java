package net.ncdevice.utils;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MySqlFactory {
	public static SqlSessionFactory getSqlSessionFactory() {
		SqlSessionFactory factory=null;
		try {
			//leer archivo .xml
			Reader reader=Resources.getResourceAsReader("ConfiguracionIbatis.xml");
			//obtener la conexion
			factory=new SqlSessionFactoryBuilder().build(reader);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return factory;
	}
}
