package ec.edu.ups.dao;

import java.util.List;

import ec.edu.ups.modelo.Telefono;

/**
 * Interface GenericDAO.
 * 
 * La interface GenericDAO ha sido creada como interface con los m�todos
 * genericos para realizar la persistencia en la base de datos. Dicha interface
 * ser� imlementada en cada clase espec�fica que controlar� la persistencia a la
 * base de datos un sistema que permite ejemplificar el uso del patr�n de dise�o
 * DAO usando JDBC como coexi�n a la misma.
 
 * @param <T>  la entidad o modelo que ser� persistida en la base de datos
 * @param <ID> el id o llave primaria por la cu�l se identificara al modelo como
 *             valor �nico

 */
public interface GenericDao<T, ID> {

	public void createTable();

	public boolean create(T entity);

	public T read(ID id);

	public boolean update(T entity);

	public boolean delete(T entity);

	public List<T> find();

	public T findById(ID id);

}