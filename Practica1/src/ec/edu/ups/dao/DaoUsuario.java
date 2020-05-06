package ec.edu.ups.dao;

import ec.edu.ups.modelo.Usuario;

public interface DaoUsuario extends GenericDao<Usuario, String> {
	public abstract Usuario findUsuario(String correo, String contrasenia);
}
