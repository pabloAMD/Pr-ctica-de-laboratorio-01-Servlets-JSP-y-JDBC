package ec.edu.ups.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ec.edu.ups.dao.DaoFactory;
import ec.edu.ups.dao.DaoUsuario;
import ec.edu.ups.modelo.Usuario;

/**
 * Servlet implementation class Agenda
 */
@WebServlet(name="Agenda", urlPatterns = {"/agenda"})
public class Agenda extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Agenda() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String sesion = request.getParameter("cerrar");
		System.out.println(request.getSession().getAttribute("userID"));
		if (sesion != null) {
			
			request.getSession().invalidate();
			response.sendRedirect("/Practica1/html/index.htm");
		}else {
			System.out.println("holaaa");
			DaoUsuario userDao = DaoFactory.getFactory().getUsuarioDAO();

	        Usuario user = userDao.findById(String.valueOf(request.getSession().getAttribute("userID")));
	        
	        System.out.println("esto manda"+user.getTelefono());
	        
	        request.setAttribute("user", user);

	        getServletContext().getRequestDispatcher("/Jsp/Agenda.jsp").forward(request, response);

	     
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		
		
	}

}
