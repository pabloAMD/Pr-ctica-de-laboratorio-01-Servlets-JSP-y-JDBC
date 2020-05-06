package ec.edu.ups.dao;

public abstract class DaoFactory {
	protected static DaoFactory factory = new JDBCDAOFactory();

	public static DaoFactory getFactory() {
		return factory;
	}

	public abstract void createTables();

	public abstract DaoUsuario getUsuarioDAO();

	public abstract DaoTelefono getTelefonoDAO();

	

}
