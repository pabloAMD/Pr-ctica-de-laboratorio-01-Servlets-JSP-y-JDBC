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
 * Servlet implementation class CrearTelefono
 */
@WebServlet("/CrearTelefono")
public class CrearTelefono extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CrearTelefono() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String numero = request.getParameter("numero");
        String tipo = request.getParameter("tipo");
        String operadora = request.getParameter("operadora");

        DaoTelefono telefonoDao = DaoFactory.getFactory().getTelefonoDAO();
        Telefono telefono = new Telefono(numero, tipo, operadora);
        Usuario user = DaoFactory.getFactory().getUsuarioDAO().findById(String.valueOf(request.getSession().getAttribute("idUsu")));
        telefono.setUsuario(user);
        telefonoDao.create(telefono);
        System.out.println(telefono);
        response.sendRedirect("/Practica1/agenda");
	}

}
