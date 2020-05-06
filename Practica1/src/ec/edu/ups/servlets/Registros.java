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
 * Servlet implementation class Registros
 */
@WebServlet(name="Registros", urlPatterns = {"/registrar"})
public class Registros extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Registros() {
        super();
        System.out.println("joalallala");
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
		doGet(request, response);
		String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String cedula = request.getParameter("cedula");
        String mail = request.getParameter("email");
        String pass = request.getParameter("contra");
        
        
        System.out.println(nombre+apellido+cedula+mail+pass);
        
        DaoFactory.getFactory().createTables();
        
        DaoUsuario usuarioDao = DaoFactory.getFactory().getUsuarioDAO();
        Usuario user = new Usuario(cedula, nombre, apellido, mail, pass);
        if (usuarioDao.create(user)) {
        	
            response.sendRedirect("/Practica1/html/Login.html");
            //System.out.println("Usuario Creado");
            //System.out.println("nombre: "+nombre+" apellido: "+apellido+" cedula: "+cedula+" mail: "+mail+" pass: "+pass);
        }else{
            System.out.println("Usuario No Creado");
            response.sendRedirect("registro");
        }
	}

}
