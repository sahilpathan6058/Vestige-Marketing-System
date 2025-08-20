package vestigecom.servlet;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import vestigecom.Dao.userDao;
import vestigecom.connection.DBCon;
import vestigecom.model.user;

/**
 * Servlet implementation class ViewUsersServlet
 */
@WebServlet("/view-user-servlet")
public class ViewUsersServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  try {
	            userDao dao = new userDao(DBCon.getConnection());
	            List<user> userList = dao.getAllUsers();
	            request.setAttribute("userList", userList);
	            request.getRequestDispatcher("viewUsers.jsp").forward(request, response);
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
}
