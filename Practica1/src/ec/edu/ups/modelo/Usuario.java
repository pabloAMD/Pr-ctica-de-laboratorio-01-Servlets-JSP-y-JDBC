package ec.edu.ups.modelo;

import java.util.List;

public class Usuario {
	private String cedula;
	private String nombre;
	private String apellido;
	private String correo;
	private String contrasenia;
	private List<Telefono> telefono;
	
	public Usuario() {
		super();
	}

	public Usuario(String cedula, String nombre, String apellido, String correo, String contrasenia) {
		super();
		this.cedula = cedula;
		this.nombre = nombre;
		this.apellido = apellido;
		this.correo = correo;
		this.contrasenia = contrasenia;
		
	}

	

	public String getCedula() {
		return cedula;
	}

	public void setCedula(String cedula) {
		this.cedula = cedula;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getApellido() {
		return apellido;
	}

	public void setApellido(String apellido) {
		this.apellido = apellido;
	}

	public String getCorreo() {
		return correo;
	}

	public void setCorreo(String correo) {
		this.correo = correo;
	}

	public String getContrasenia() {
		return contrasenia;
	}

	public void setContrasenia(String contrasenia) {
		this.contrasenia = contrasenia;
	}

	public List<Telefono> getTelefono() {
		return telefono;
	}

	public void setTelefono(List<Telefono> telefono) {
		this.telefono = telefono;
	}

	@Override
	public String toString() {
		return "Usuario [cedula=" + cedula + ", nombre=" + nombre + ", apellido=" + apellido + ", correo=" + correo
				+ ", contrasenia=" + contrasenia + ", telefono=" + telefono + "]";
	}
	
	
	
	
}
