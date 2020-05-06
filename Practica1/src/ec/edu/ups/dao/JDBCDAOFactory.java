package ec.edu.ups.dao;

import ec.edu.ups.mysql.JDBC.JDBCTelefonoDao;
import ec.edu.ups.mysql.JDBC.JDBCUsuarioDao;

public class JDBCDAOFactory extends DaoFactory {

	@Override
	public void createTables() {
		this.getUsuarioDAO().createTable();
		this.getTelefonoDAO().createTable();

	}

	@Override
	public DaoUsuario getUsuarioDAO() {
		return new JDBCUsuarioDao();
	}

	@Override
	public DaoTelefono getTelefonoDAO() {
		// TODO Auto-generated method stub
		return new JDBCTelefonoDao();
	}


	
}
