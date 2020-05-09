package ec.edu.ups.modelo;

public class Telefono {
	private int codigo;
	private String numero;
	private String tipo;
	private String operadora;
	private Usuario usuario;
	
	public Telefono() {
		
		// TODO Auto-generated constructor stub
	}
	
	public Telefono(String numero, String tipo, String operadora) {
		super();
		this.numero = numero;
		this.tipo = tipo;
		this.operadora = operadora;

	}

	public int getCodigo() {
		return codigo;
	}
	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}
	public String getNumero() {
		return numero;
	}
	public void setNumero(String numero) {
		this.numero = numero;
	}
	public String getTipo() {
		return tipo;
	}
	public void setTipo(String tipo) {
		this.tipo = tipo;
	}
	public String getOperadora() {
		return operadora;
	}
	public void setOperadora(String operadora) {
		this.operadora = operadora;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	@Override
	public String toString() {
		return "Telefono [codigo=" + codigo + ", numero=" + numero + ", tipo=" + tipo + ", operadora=" + operadora
				+ ", usuario=" + usuario + "]";
	}
	
	
	
}
