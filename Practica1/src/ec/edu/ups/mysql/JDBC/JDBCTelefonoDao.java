package ec.edu.ups.mysql.JDBC;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import ec.edu.ups.dao.DaoFactory;
import ec.edu.ups.dao.DaoTelefono;
import ec.edu.ups.modelo.Telefono;

public class JDBCTelefonoDao extends JDBCGenericDao<Telefono, Integer> implements DaoTelefono {

	@Override
	public void createTable() {
		// TODO Auto-generated method stub
		conexionDos.update("CREATE TABLE IF NOT EXISTS telefono (" + "	tel_id INT NOT NULL AUTO_INCREMENT,"
				+ "	tel_numero VARCHAR(20)," + "	tel_tipo  VARCHAR(50)," + "	tel_operadora VARCHAR(50),"
				+ "	usu_cedula VARCHAR(10) NOT NULL," + "	PRIMARY KEY (tel_id),"
				+ "	FOREIGN KEY (usu_cedula) REFERENCES usuario(usu_cedula)" + ");");
	}

	@Override
	public boolean create(Telefono telefono) {
		// TODO Auto-generated method stub
		return conexionDos.update("INSERT INTO telefono (tel_numero, tel_tipo, tel_operadora, usu_cedula) "
				+ "VALUES ('" + telefono.getNumero() + "', '" + telefono.getTipo() + "', '" + telefono.getOperadora()
				+ "', '" + telefono.getUsuario().getCedula() + "');");
	}

	@Override
	public Telefono read(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean update(Telefono telefono) {
		// TODO Auto-generated method stub
		return conexionDos.update("UPDATE telefono SET " + "	tel_numero = '" + telefono.getNumero() + "',"
				+ "	tel_tipo = '" + telefono.getTipo() + "'," + "	tel_operadora = '" + telefono.getOperadora() + "'"
				+ "WHERE tel_id = '" + telefono.getCodigo() + "' AND usu_cedula = '" + telefono.getUsuario().getCedula()
				+ "';");
	}

	@Override
	public Telefono findById(Integer id) {
		Telefono telefono = null;
		ResultSet rs = conexionUno.query("Select * FROM telefono WHERE tel_id = " + id + ";");
		try {
			if (rs != null && rs.next()) {
				telefono = new Telefono(rs.getString("tel_numero"), rs.getString("tel_tipo"),
						rs.getString("tel_operadora"));
				telefono.setCodigo(rs.getInt("tel_id"));
				telefono.setUsuario(DaoFactory.getFactory().getUsuarioDAO().findById(rs.getString("usu_cedula")));
			}
		} catch (SQLException e) {
			System.out.println(">>>WARNING (JDBCPhoneDAO:read): " + e.getMessage());
		}
		return telefono;
	}

	@Override
	public boolean delete(Telefono telefono) {
		// TODO Auto-generated method stub
		return conexionDos.update("DELETE FROM telefono WHERE tel_id = '" + telefono.getCodigo()
				+ "' AND usu_cedula = '" + telefono.getUsuario().getCedula() + "';");
	}

	@Override
	public List<Telefono> find() {
		// TODO Auto-generated method stubSS
		throw new UnsupportedOperationException("Not supported yet."); // To change body of generated methods, choose
																		// Tools | Templates.
	}

	@Override
	public List<Telefono> findByUsuarioId(String cedula) {
		// TODO Auto-generated method stub
		List<Telefono> telefono = new ArrayList<>();
		ResultSet rs = conexionDos.query("SELECT * FROM telefono WHERE usu_cedula = '" + cedula + "';");
		try {
			while (rs.next()) {
				Telefono phone = new Telefono(rs.getString("tel_numero"), rs.getString("tel_tipo"),
						rs.getString("tel_operadora"));
				// phone.setUsuario(DaoFactory.getFactory().getUsuarioDAO().findById(rs.getString("usu_cedula")));
				phone.setCodigo(rs.getInt("tel_id"));
				telefono.add(phone);
			}
		} catch (SQLException e) {
			System.out.println(">>>WARNING (JDBCPhoneDAO:findByShoppingBasketId): " + e.getMessage());
		}
		return telefono;
	}

}
