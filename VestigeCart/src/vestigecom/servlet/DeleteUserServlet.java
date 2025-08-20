package vestigecom.servlet;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import vestigecom.Dao.userDao;
import vestigecom.connection.DBCon;

/**
 * Servlet implementation class DeleteUserServlet
 */
@WebServlet("/delete-user-servlet")
public class DeleteUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  int userId = Integer.parseInt(request.getParameter("userId"));
	        try {
	            userDao dao = new userDao(DBCon.getConnection());
	            dao.deleteUser(userId);
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        response.sendRedirect("view-user-servlet");
	    }
	}


