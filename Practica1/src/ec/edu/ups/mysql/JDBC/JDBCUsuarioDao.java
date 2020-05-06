package ec.edu.ups.mysql.JDBC;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import ec.edu.ups.dao.DaoFactory;
import ec.edu.ups.dao.DaoUsuario;
import ec.edu.ups.modelo.Telefono;
import ec.edu.ups.modelo.Usuario;

public class JDBCUsuarioDao extends JDBCGenericDao<Usuario, String> implements DaoUsuario {

	@Override
	public void createTable() {
		// TODO Auto-generated method stub
		conexionUno.update("CREATE TABLE IF NOT EXISTS usuario (" + "	usu_cedula VARCHAR(10) NOT NULL,"
				+ "	usu_nombre VARCHAR(50)," + "	usu_apellido VARCHAR(50)," + "	usu_correo VARCHAR(100),"
				+ "	usu_pass VARCHAR(255)," + "	PRIMARY KEY (usu_cedula)" + ");");
	}

	@Override
	public boolean create(Usuario usuario) {
		// TODO Auto-generated method stub
		return conexionUno.update("INSERT INTO usuario VALUES ('" + usuario.getCedula() + "', '" + usuario.getNombre()
				+ "', '" + usuario.getApellido() + "', '" + usuario.getCorreo() + "', '" + usuario.getContrasenia()
				+ "');");
	}

	@Override
	public Usuario read(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean update(Usuario usuario) {
		// TODO Auto-generated method stub
		return conexionUno.update("UPDATE usuario SET " + "	usu_nombre = '" + usuario.getNombre() + "',"
				+ "	usu_apellido = '" + usuario.getApellido() + "'," + "	usu_pass  = '" + usuario.getContrasenia()
				+ "'" + "	WHERE usu_cedula = '" + usuario.getCedula() + "';");
	}

	@Override
	public boolean delete(Usuario usuario) {
		// TODO Auto-generated method stub
		return conexionUno.update("UPDATE usuario SET " + "	WHERE usu_cedula = '" + usuario.getCedula() + "';");
	}

	@Override
	public List<Usuario> find() {
		// TODO Auto-generated method stub
		List<Usuario> usuario = new ArrayList<>();

		ResultSet rs = conexionUno.query("SELECT * FROM usuario;");
		try {
			while (rs.next()) {
				Usuario usu = new Usuario(rs.getString("usu_cedula"), rs.getString("usu_nombre"),
						rs.getNString("usu_apellido"), rs.getNString("usu_correo"), rs.getNString("usu_pass"));
				List<Telefono> telfono = DaoFactory.getFactory().getTelefonoDAO().findByUsuarioId(usu.getCedula());
				usu.setTelefono(telfono);
				usuario.add(usu);
			}
		} catch (SQLException e) {
			System.out.println(">>>WARNING (JDBCUserDAO:find): " + e.getMessage());
		}
		return usuario;
	}

	@Override
	public Usuario findById(String cedula) {
		// TODO Auto-generated method stub
		Usuario usu = null;
		ResultSet rs = conexionUno.query("SELECT * FROM usuario WHERE usu_cedula = '" + cedula + "';");
		try {
			if (rs != null && rs.next()) {
				usu = new Usuario(rs.getString("usu_cedula"), rs.getString("usu_nombre"), rs.getString("usu_apellido"),
						rs.getNString("usu_correo"), rs.getNString("usu_pass"));
				List<Telefono> telefono = DaoFactory.getFactory().getTelefonoDAO().findByUsuarioId(usu.getCedula());
				usu.setTelefono(telefono);
			}
		} catch (SQLException e) {
			System.out.println(">>>WARNING (JDBCUserDAO:findById): " + e.getMessage());
		}
		return usu;
	}

	@Override
	public Usuario findUsuario(String correo, String contrasenia) {
		Usuario usuario = null;
		ResultSet rs = conexionUno.query(
				"SELECT * FROM usuario WHERE usu_correo = '" + correo + "' AND usu_pass = '" + contrasenia + "';");
		try {
			if (rs != null && rs.next()) {
				usuario = new Usuario(rs.getString("usu_cedula"), rs.getString("usu_nombre"),
						rs.getNString("usu_apellido"), rs.getNString("usu_correo"), rs.getNString("usu_pass"));
				List<Telefono> telefono = DaoFactory.getFactory().getTelefonoDAO().findByUsuarioId(usuario.getCedula());
				usuario.setTelefono(telefono);
			}
		} catch (SQLException e) {
			System.out.println(">>>WARNING (JDBCUserDAO:findUser): " + e.getMessage());
		}
		return usuario;
	}

}