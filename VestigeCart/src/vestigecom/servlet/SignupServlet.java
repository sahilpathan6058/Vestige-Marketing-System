package vestigecom.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vestigecom.Dao.userDao;
import vestigecom.connection.DBCon;
import vestigecom.model.*;

/**
 * Servlet implementation class SignupServlet
 */
@WebServlet("/sign-up")
public class SignupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		  try (PrintWriter out = response.getWriter()) {
	            String name = request.getParameter("name");
	            String email = request.getParameter("email");
	            String password = request.getParameter("password");

	            user newUser = new user();
	            newUser.setName(name);
	            newUser.setEmail(email);
	            newUser.setPassword(password);

	            // Save user to database
	            userDao uDao = new userDao(DBCon.getConnection());
	            boolean result = uDao.registerUser(newUser);

	            if (result) {
	                response.sendRedirect("login.jsp");
	            } else {
	                out.println("<h3 style='color:red;'>Signup failed. Try again.</h3>");
	            }
	        } catch (ClassNotFoundException | SQLException e) {
	            e.printStackTrace();
	        }
	    }
}


