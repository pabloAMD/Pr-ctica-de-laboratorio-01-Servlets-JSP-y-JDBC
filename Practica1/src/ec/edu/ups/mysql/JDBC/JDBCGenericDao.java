package ec.edu.ups.mysql.JDBC;

import ec.edu.ups.dao.GenericDao;

public abstract class JDBCGenericDao<T, ID> implements GenericDao<T, ID> {
	protected ContextJDBC conexionUno = ContextJDBC.getJDBC1();
	protected ContextJDBC conexionDos = ContextJDBC.getJDBC2();

}
