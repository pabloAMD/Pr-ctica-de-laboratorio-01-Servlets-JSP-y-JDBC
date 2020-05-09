package ec.edu.ups.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ec.edu.ups.dao.DaoFactory;
import ec.edu.ups.dao.DaoTelefono;
import ec.edu.ups.modelo.Telefono;
import ec.edu.ups.modelo.Usuario;

/**
 * Servlet implementation class EditarTelefono
 */
@WebServlet("/EditarTelefono")
public class EditarTelefono extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditarTelefono() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String sesion = request.getParameter("eliminar");
        String id = request.getParameter("telefonoCodigo");
        System.out.println(id);
        if (sesion != null && id != null) {
            if (sesion.equals("true")) {  
                DaoTelefono telefonoDao = DaoFactory.getFactory().getTelefonoDAO();
                Telefono phone = telefonoDao.findById(Integer.parseInt(id));
                telefonoDao.delete(phone);
                
                response.sendRedirect("/Practica1/agenda");
            }
        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 String numero = request.getParameter("numero");
	        String tipo = request.getParameter("tipo");
	        String operadora = request.getParameter("operadora");
	        String codigo = request.getParameter("codigo");

	        DaoTelefono telefonoDao = DaoFactory.getFactory().getTelefonoDAO();
	        Telefono telefono = telefonoDao.findById(Integer.parseInt(codigo));
	        Usuario usuario = DaoFactory.getFactory().getUsuarioDAO().findById(String.valueOf(request.getSession().getAttribute("idUsu")));
	        
	        telefono.setUsuario(usuario);
	        telefono.setNumero(numero);
	        telefono.setTipo(tipo);
	        telefono.setOperadora(operadora);
	        telefonoDao.update(telefono);

	        response.sendRedirect("/Practica1/agenda");
	}

}
