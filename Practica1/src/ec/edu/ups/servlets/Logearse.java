package ec.edu.ups.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ec.edu.ups.dao.DaoFactory;
import ec.edu.ups.dao.DaoUsuario;
import ec.edu.ups.modelo.Usuario;

/**
 * Servlet implementation class Logearse
 */
@WebServlet(name="Logearse", urlPatterns = {"/logearse"})
public class Logearse extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Logearse() {
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
		
		System.out.println("holaaaaaaaaaaa");
		String mail = request.getParameter("email");
        String pass = request.getParameter("contra");
        
        DaoUsuario userDao = DaoFactory.getFactory().getUsuarioDAO();
        Usuario user = userDao.findUsuario(mail, pass);
        if (user != null) {
            System.out.println("usuario encontrado");
            HttpSession session = request.getSession(true);
            session.setAttribute("sesionID", String.valueOf(session.getId()));
            session.setAttribute("userID", user.getCedula());
            
            response.sendRedirect("/Practica1/agenda");
            
        }else{
            //response.sendRedirect("login");
        }     
	}

}
