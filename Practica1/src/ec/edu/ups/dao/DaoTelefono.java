package ec.edu.ups.dao;

import java.util.List;

import ec.edu.ups.modelo.Telefono;

public interface DaoTelefono extends GenericDao<Telefono, Integer> {
	 public abstract List<Telefono> findByUsuarioId(String cedula);

	
}
